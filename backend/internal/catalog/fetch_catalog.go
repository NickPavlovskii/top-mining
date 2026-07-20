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
    c.profile_block,
    COALESCE(
        json_agg(
            json_build_object(
                'id', o.id,
                'name', o.name,
                'slug', o.slug,
                'logoUrl', COALESCE(logo_m.path, NULLIF(o.logo_url, ''), ''),
                'logoTheme', NULLIF(o.logo_theme, ''),
                'description', o.description,
                'rating', o.rating,
                'reviewCount', o.review_count,
                'href', CASE
                    WHEN o.slug <> '' THEN '/sale_asic/' || o.slug || '/'
                    ELSE NULL
                END,
                'foundedYear', o.founded_year,
                'hasPublicRating', o.has_public_rating,
                'verification', json_build_object(
                    'contracts', o.verified_contracts,
                    'legalEntity', o.verified_legal_entity,
                    'dataCenter', o.verified_data_center,
                    'miningRegistry', o.verified_mining_registry
                ),
                'cardTags', COALESCE(
                    NULLIF(o.card_tags, '{}'),
                    CASE
                        WHEN es.organization_id IS NOT NULL THEN ARRAY[
                            'Счет на оплату: С НДС',
                            'Состояние: ' || es.equipment_condition,
                            'Объем продаж: ' || es.sales_volume,
                            'Наличие: ' || es.availability
                        ]
                        ELSE '{}'::TEXT[]
                    END
                ),
                'cardFeatures', COALESCE(
                    NULLIF(o.card_features, '{}'),
                    COALESCE(es.extras, '{}'::TEXT[])
                ),
                'cardPromo', NULLIF(o.card_promo, ''),
                'officeCity', NULLIF(o.office_city, ''),
                'siteCity', NULLIF(o.site_city, '')
            )
            ORDER BY o.sort_order, o.id
        ) FILTER (WHERE o.id IS NOT NULL),
        '[]'
    ) AS organizations
FROM catalog_categories c
LEFT JOIN catalog_organizations o ON o.category_id = c.id
LEFT JOIN media_assets logo_m ON logo_m.id = o.logo_media_id
LEFT JOIN organization_equipment_sales es ON es.organization_id = o.id
GROUP BY c.id, c.name, c.slug, c.profile_block, c.sort_order
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
		var profileBlock *string

		if err := rows.Scan(
			&category.ID,
			&category.Name,
			&category.Slug,
			&profileBlock,
			&orgsJSON,
		); err != nil {
			return nil, fmt.Errorf("scan category: %w", err)
		}

		if profileBlock != nil {
			category.ProfileBlock = *profileBlock
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
			Subtitle: "Помогаем найти подходящую вам компанию и проанализировать конкурентов",
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
