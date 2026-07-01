package articles

import (
	"context"
	"fmt"
	"strings"

	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgxpool"
)

const previewColumns = `
    id, slug, title, excerpt, image_url, image_alt,
    topic_id, reading_time_min, published_at::text, display_type
`

func FetchFeed(ctx context.Context, pool *pgxpool.Pool, topic string) (*Feed, error) {
	topic = strings.TrimSpace(topic)
	if topic == "" {
		topic = "all"
	}

	rows, err := pool.Query(ctx, `
        SELECT`+previewColumns+`
        FROM articles
        WHERE is_published = TRUE
          AND ($1 = 'all' OR topic_id = $1)
        ORDER BY sort_order ASC, published_at DESC, id ASC
    `, topic)
	if err != nil {
		return nil, fmt.Errorf("query articles feed: %w", err)
	}
	defer rows.Close()

	items, err := scanPreviews(rows)
	if err != nil {
		return nil, err
	}

	feed := &Feed{
		Featured: make([]Preview, 0, 4),
		List:     make([]Preview, 0, 8),
		HasMore:  len(items) > 9,
	}

	for _, item := range items {
		switch item.DisplayType {
		case "hero":
			if feed.Hero == nil {
				copyItem := item
				feed.Hero = &copyItem
			}
		case "featured":
			if len(feed.Featured) < 4 {
				feed.Featured = append(feed.Featured, item)
			}
		default:
			if len(feed.List) < 8 {
				feed.List = append(feed.List, item)
			}
		}
	}

	if feed.Hero == nil && len(items) > 0 {
		copyItem := items[0]
		feed.Hero = &copyItem
	}

	return feed, nil
}

func FetchBySlug(ctx context.Context, pool *pgxpool.Pool, slug string) (*Article, error) {
	slug = strings.TrimSpace(slug)
	if slug == "" {
		return nil, pgx.ErrNoRows
	}

	row := pool.QueryRow(ctx, `
        SELECT`+previewColumns+`, content
        FROM articles
        WHERE slug = $1 AND is_published = TRUE
    `, slug)

	var article Article
	var readingTimeMin *int

	err := row.Scan(
		&article.ID,
		&article.Slug,
		&article.Title,
		&article.Excerpt,
		&article.ImageURL,
		&article.ImageAlt,
		&article.TopicID,
		&readingTimeMin,
		&article.PublishedAt,
		&article.DisplayType,
		&article.Content,
	)
	if err != nil {
		return nil, err
	}

	article.ReadingTimeMin = readingTimeMin
	return &article, nil
}

func scanPreviews(rows pgx.Rows) ([]Preview, error) {
	items := make([]Preview, 0, 16)

	for rows.Next() {
		var item Preview
		var readingTimeMin *int

		if err := rows.Scan(
			&item.ID,
			&item.Slug,
			&item.Title,
			&item.Excerpt,
			&item.ImageURL,
			&item.ImageAlt,
			&item.TopicID,
			&readingTimeMin,
			&item.PublishedAt,
			&item.DisplayType,
		); err != nil {
			return nil, fmt.Errorf("scan article preview: %w", err)
		}

		item.ReadingTimeMin = readingTimeMin
		items = append(items, item)
	}

	if err := rows.Err(); err != nil {
		return nil, fmt.Errorf("iterate articles: %w", err)
	}

	return items, nil
}
