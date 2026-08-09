package articles

import (
	"context"
	"fmt"
	"strings"
)

func (r *Repository) Feed(ctx context.Context, topic string, locale string) (*Feed, error) {
	topic = strings.TrimSpace(topic)
	if topic == "" {
		topic = "all"
	}
	locale = NormalizeLocale(locale)

	query := `
        SELECT` + previewColumns + `
        FROM articles a
        LEFT JOIN media_assets cover ON cover.id = a.cover_media_id
        WHERE a.is_published = TRUE
          AND ($1 = 'all' OR a.topic_id = $1)
        ORDER BY a.sort_order ASC, a.published_at DESC, a.id ASC
        LIMIT $2
    `
	args := []any{topic, feedQueryLimit}

	if useTranslations(locale) {
		query = `
        SELECT` + previewColumnsLocalized + `
        FROM articles a
        LEFT JOIN media_assets cover ON cover.id = a.cover_media_id
        LEFT JOIN article_translations t
          ON t.article_id = a.id AND t.locale = $3
        WHERE a.is_published = TRUE
          AND ($1 = 'all' OR a.topic_id = $1)
        ORDER BY a.sort_order ASC, a.published_at DESC, a.id ASC
        LIMIT $2
    `
		args = []any{topic, feedQueryLimit, locale}
	}

	rows, err := r.db.Query(ctx, query, args...)
	if err != nil {
		return nil, fmt.Errorf("query articles feed: %w", err)
	}
	defer rows.Close()

	items, err := scanPreviews(rows)
	if err != nil {
		return nil, err
	}

	return buildFeed(items), nil
}

func buildFeed(items []Preview) *Feed {
	feed := &Feed{
		Featured: make([]Preview, 0, maxFeatured),
		List:     make([]Preview, 0, len(items)),
		HasMore:  len(items) > feedSlotCount,
	}

	heroIdx := -1
	for i := range items {
		if items[i].DisplayType == "hero" {
			heroIdx = i
			break
		}
	}
	if heroIdx < 0 && len(items) > 0 {
		heroIdx = 0
	}
	if heroIdx >= 0 {
		feed.Hero = &items[heroIdx]
	}

	for i := range items {
		if i == heroIdx {
			continue
		}

		item := items[i]
		if item.DisplayType == "featured" && len(feed.Featured) < maxFeatured {
			feed.Featured = append(feed.Featured, item)
			continue
		}

		feed.List = append(feed.List, item)
	}

	for len(feed.Featured) < maxFeatured && len(feed.List) > 0 {
		feed.Featured = append(feed.Featured, feed.List[0])
		feed.List = feed.List[1:]
	}

	if len(feed.List) > maxList {
		feed.List = feed.List[:maxList]
	}

	return feed
}
