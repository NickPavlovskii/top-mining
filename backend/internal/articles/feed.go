package articles

import (
	"context"
	"fmt"
	"strings"
)

// Feed возвращает hero / featured / list для главной.
// Сначала выбирается hero, затем остальные раскладываются по корзинам —
// чтобы fallback-hero не дублировался в Featured/List.
func (r *Repository) Feed(ctx context.Context, topic string) (*Feed, error) {
	topic = strings.TrimSpace(topic)
	if topic == "" {
		topic = "all"
	}

	rows, err := r.db.Query(ctx, `
        SELECT`+previewColumns+`
        FROM articles a
        LEFT JOIN media_assets cover ON cover.id = a.cover_media_id
        WHERE a.is_published = TRUE
          AND ($1 = 'all' OR a.topic_id = $1)
        ORDER BY a.sort_order ASC, a.published_at DESC, a.id ASC
        LIMIT $2
    `, topic, feedQueryLimit)
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
		List:     make([]Preview, 0, maxList),
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
		switch item.DisplayType {
		case "featured":
			if len(feed.Featured) < maxFeatured {
				feed.Featured = append(feed.Featured, item)
			}
		case "hero":
			// Лишние hero уходят в list, чтобы не терять карточку.
			if len(feed.List) < maxList {
				feed.List = append(feed.List, item)
			}
		default:
			if len(feed.List) < maxList {
				feed.List = append(feed.List, item)
			}
		}
	}

	return feed
}
