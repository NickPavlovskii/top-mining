package catalog

import (
	"context"
	"fmt"

	"github.com/jackc/pgx/v5/pgxpool"
)

const catalogQuery = `
SELECT
    c.id,
    c.name,
    c.slug,
    COALESCE(
        json_agg(
            json_build_object(
                'id', o.id,
                'name', o.name,
                'logoUrl', o.logo_url,
                'description', o.description,
                'rating', o.rating,
                'reviewCount', o.review_count
            )
            ORDER BY o.sort_order, o.id
        ) FILTER (WHERE o.id IS NOT NULL),
        '[]'
    ) AS organizations
FROM catalog_categories c
LEFT JOIN catalog_organizations o ON o.category_id = c.id
GROUP BY c.id, c.name, c.slug, c.sort_order
ORDER BY c.sort_order, c.id;
`

func FetchCatalog(ctx context.Context, pool *pgxpool.Pool) (*Data, error) {
	rows, err := pool.Query(ctx, catalogQuery)
	if err != nil {
		return nil, fmt.Errorf("query catalog: %w", err)
	}
	defer rows.Close()

	categories := make([]Category, 0, 4)

	for rows.Next() {
		var category Category
		var orgsJSON []byte

		if err := rows.Scan(&category.ID, &category.Name, &category.Slug, &orgsJSON); err != nil {
			return nil, fmt.Errorf("scan category: %w", err)
		}

		if err := parseOrganizationsJSON(orgsJSON, &category.Organizations); err != nil {
			return nil, err
		}

		categories = append(categories, category)
	}

	if err := rows.Err(); err != nil {
		return nil, fmt.Errorf("iterate categories: %w", err)
	}

	totalReviews := 0
	for _, category := range categories {
		for _, org := range category.Organizations {
			totalReviews += org.ReviewCount
		}
	}

	return &Data{
		Meta: Meta{
			TotalReviews: totalReviews,
			Subtitle:     "Помогаем найти подходящую вам компанию и проанализировать конкурентов",
		},
		Categories: categories,
	}, nil
}

func parseOrganizationsJSON(raw []byte, organizations *[]Organization) error {
	if len(raw) == 0 || string(raw) == "null" {
		*organizations = []Organization{}
		return nil
	}

	parsed, err := unmarshalOrganizations(raw)
	if err != nil {
		return fmt.Errorf("parse organizations json: %w", err)
	}

	*organizations = parsed
	return nil
}
