package articles

import (
	"fmt"

	"github.com/jackc/pgx/v5"
)

// Колонки превью: COALESCE закрывает переход на media_assets (миграция 016)
// и старые reading_time_min / reading_minutes.
const previewColumns = `
    a.id, a.slug, a.title, a.excerpt,
    COALESCE(cover.path, NULLIF(a.image_url, ''), ''),
    COALESCE(NULLIF(cover.alt, ''), NULLIF(a.image_alt, ''), ''),
    a.topic_id,
    COALESCE(a.reading_minutes, a.reading_time_min),
    a.published_at::text, a.display_type
`

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
