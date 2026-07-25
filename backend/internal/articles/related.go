package articles

import (
	"context"
	"fmt"
)

// Related возвращает связанные статьи. Пустой слайс без ошибки — связей нет.
func (r *Repository) Related(ctx context.Context, articleID int) ([]Preview, error) {
	rows, err := r.db.Query(ctx, `
		SELECT`+previewColumns+`
		FROM entity_links el
		JOIN articles a ON a.id = el.to_id AND a.is_published = TRUE
		LEFT JOIN media_assets cover ON cover.id = a.cover_media_id
		WHERE el.from_type = 'article'
		  AND el.from_id = $1
		  AND el.to_type = 'article'
		  AND el.relation = 'related'
		ORDER BY el.sort_order, a.id
		LIMIT $2
	`, articleID, maxRelated)
	if err != nil {
		return nil, fmt.Errorf("query related articles: %w", err)
	}
	defer rows.Close()

	items, err := scanPreviews(rows)
	if err != nil {
		return nil, err
	}
	return items, nil
}
