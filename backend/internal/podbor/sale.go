package podbor

import (
	"context"
	"fmt"

	"github.com/jackc/pgx/v5/pgxpool"
)

const saleOffersQuery = `
SELECT
    slug,
    title,
    capacity_title,
    price_label,
    price_value,
    location,
    image_url
FROM podbor_sale_offers
WHERE is_published = TRUE
ORDER BY sort_order, id;
`

func FetchSaleOffers(ctx context.Context, pool *pgxpool.Pool) ([]PlacementOffer, error) {
	rows, err := pool.Query(ctx, saleOffersQuery)
	if err != nil {
		return nil, fmt.Errorf("query podbor sale offers: %w", err)
	}
	defer rows.Close()

	offers := make([]PlacementOffer, 0)

	for rows.Next() {
		var offer PlacementOffer
		if err := rows.Scan(
			&offer.ID,
			&offer.Title,
			&offer.CapacityTitle,
			&offer.PriceLabel,
			&offer.PriceValue,
			&offer.Location,
			&offer.Image,
		); err != nil {
			return nil, fmt.Errorf("scan podbor sale offer: %w", err)
		}
		offers = append(offers, offer)
	}

	if err := rows.Err(); err != nil {
		return nil, fmt.Errorf("iterate podbor sale offers: %w", err)
	}

	return offers, nil
}
