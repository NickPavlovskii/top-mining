package articles

import (
	"context"
	"encoding/json"
	"fmt"
	"strings"

	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgxpool"
)

const previewColumns = `
    a.id, a.slug, a.title, a.excerpt,
    COALESCE(cover.path, NULLIF(a.image_url, ''), ''),
    COALESCE(NULLIF(cover.alt, ''), NULLIF(a.image_alt, ''), ''),
    a.topic_id,
    COALESCE(a.reading_minutes, a.reading_time_min),
    a.published_at::text, a.display_type
`

func FetchFeed(ctx context.Context, pool *pgxpool.Pool, topic string) (*Feed, error) {
	topic = strings.TrimSpace(topic)
	if topic == "" {
		topic = "all"
	}

	rows, err := pool.Query(ctx, `
        SELECT`+previewColumns+`
        FROM articles a
        LEFT JOIN media_assets cover ON cover.id = a.cover_media_id
        WHERE a.is_published = TRUE
          AND ($1 = 'all' OR a.topic_id = $1)
        ORDER BY a.sort_order ASC, a.published_at DESC, a.id ASC
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
        SELECT`+previewColumns+`,
               a.content,
               COALESCE(a.content_html, ''),
               COALESCE(a.uses_blocks, FALSE)
        FROM articles a
        LEFT JOIN media_assets cover ON cover.id = a.cover_media_id
        WHERE a.slug = $1 AND a.is_published = TRUE
    `, slug)

	var article Article
	var readingTimeMin *int
	var contentHTML string

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
		&contentHTML,
		&article.UsesBlocks,
	)
	if err != nil {
		return nil, err
	}

	article.ReadingTimeMin = readingTimeMin
	if contentHTML != "" && article.Content == "" {
		article.Content = contentHTML
	}

	if article.UsesBlocks {
		blocks, err := fetchBlocks(ctx, pool, article.ID)
		if err != nil {
			return nil, err
		}
		article.Blocks = blocks
		if assembled := assembleContentFromBlocks(blocks); assembled != "" {
			article.Content = assembled
		}
	}

	article.Related = fetchRelated(ctx, pool, article.ID)

	return &article, nil
}

func fetchBlocks(ctx context.Context, pool *pgxpool.Pool, articleID int) ([]Block, error) {
	rows, err := pool.Query(ctx, `
		SELECT id, position, type, payload, COALESCE(anchor, '')
		FROM article_blocks
		WHERE article_id = $1
		ORDER BY position, id
	`, articleID)
	if err != nil {
		return nil, fmt.Errorf("query article blocks: %w", err)
	}
	defer rows.Close()

	items := make([]Block, 0, 8)
	for rows.Next() {
		var item Block
		var payload []byte
		if err := rows.Scan(&item.ID, &item.Position, &item.Type, &payload, &item.Anchor); err != nil {
			return nil, fmt.Errorf("scan article block: %w", err)
		}
		item.Payload = json.RawMessage(payload)
		items = append(items, item)
	}

	return items, rows.Err()
}

func assembleContentFromBlocks(blocks []Block) string {
	var b strings.Builder
	for _, block := range blocks {
		switch block.Type {
		case "html", "paragraph":
			var payload struct {
				HTML string `json:"html"`
			}
			if err := json.Unmarshal(block.Payload, &payload); err == nil && payload.HTML != "" {
				b.WriteString(payload.HTML)
				b.WriteByte('\n')
			}
		case "heading":
			var payload struct {
				Level int    `json:"level"`
				Text  string `json:"text"`
			}
			if err := json.Unmarshal(block.Payload, &payload); err == nil && payload.Text != "" {
				level := payload.Level
				if level < 2 {
					level = 2
				}
				if level > 4 {
					level = 4
				}
				fmt.Fprintf(&b, "<h%d>%s</h%d>\n", level, payload.Text, level)
			}
		}
	}
	return strings.TrimSpace(b.String())
}

func fetchRelated(ctx context.Context, pool *pgxpool.Pool, articleID int) []Preview {
	rows, err := pool.Query(ctx, `
		SELECT`+previewColumns+`
		FROM entity_links el
		JOIN articles a ON a.id = el.to_id AND a.is_published = TRUE
		LEFT JOIN media_assets cover ON cover.id = a.cover_media_id
		WHERE el.from_type = 'article'
		  AND el.from_id = $1
		  AND el.to_type = 'article'
		  AND el.relation = 'related'
		ORDER BY el.sort_order, a.id
		LIMIT 8
	`, articleID)
	if err != nil {
		return nil
	}
	defer rows.Close()

	items, err := scanPreviews(rows)
	if err != nil {
		return nil
	}
	return items
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
