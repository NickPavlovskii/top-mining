package podbor

import (
	"context"
	"fmt"

	"github.com/jackc/pgx/v5/pgxpool"
)

const placementOffersQuery = `
SELECT
    slug,
    title,
    capacity_title,
    price_label,
    price_value,
    location,
    image_url
FROM podbor_placement_offers
WHERE is_published = TRUE
ORDER BY sort_order, id;
`

func FetchPlacementOffers(ctx context.Context, pool *pgxpool.Pool) ([]PlacementOffer, error) {
	rows, err := pool.Query(ctx, placementOffersQuery)
	if err != nil {
		return nil, fmt.Errorf("query podbor placement offers: %w", err)
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
			return nil, fmt.Errorf("scan podbor placement offer: %w", err)
		}
		offers = append(offers, offer)
	}

	if err := rows.Err(); err != nil {
		return nil, fmt.Errorf("iterate podbor placement offers: %w", err)
	}

	return offers, nil
}
