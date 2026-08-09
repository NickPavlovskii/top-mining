package articles

import (
	"context"
	"fmt"
	"strings"
)

func (r *Repository) Catalog(ctx context.Context, topic string) ([]Preview, error) {
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
        ORDER BY a.published_at DESC, a.sort_order ASC, a.id ASC
    `, topic)
	if err != nil {
		return nil, fmt.Errorf("query articles catalog: %w", err)
	}
	defer rows.Close()

	items, err := scanPreviews(rows)
	if err != nil {
		return nil, err
	}

	return items, nil
}
