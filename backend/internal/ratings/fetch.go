package ratings

import (
	"context"
	"fmt"

	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgxpool"
)

func FetchCards(ctx context.Context, pool *pgxpool.Pool) ([]Card, error) {
	rows, err := pool.Query(ctx, `
		SELECT
			c.slug,
			c.title,
			c.columns,
			i.display_number,
			i.label,
			i.href
		FROM rating_categories c
		JOIN rating_items i ON i.category_id = c.id
		WHERE c.is_published = TRUE
		  AND i.is_published = TRUE
		ORDER BY c.sort_order, c.id, i.sort_order, i.id
	`)
	if err != nil {
		return nil, fmt.Errorf("query rating cards: %w", err)
	}
	defer rows.Close()

	return scanCards(rows)
}

func FetchHomeCards(ctx context.Context, pool *pgxpool.Pool) ([]Card, error) {
	rows, err := pool.Query(ctx, `
		SELECT
			c.slug,
			c.title,
			COALESCE(c.home_columns, c.columns),
			COALESCE(NULLIF(i.home_display_number, ''), i.display_number),
			i.label,
			i.href
		FROM rating_categories c
		JOIN rating_items i ON i.category_id = c.id
		WHERE c.is_published = TRUE
		  AND i.is_published = TRUE
		  AND i.show_on_home = TRUE
		ORDER BY c.sort_order, c.id, i.home_sort_order NULLS LAST, i.id
	`)
	if err != nil {
		return nil, fmt.Errorf("query rating home cards: %w", err)
	}
	defer rows.Close()

	return scanCards(rows)
}

type cardRow struct {
	slug    string
	title   string
	columns int
	number  string
	label   string
	href    string
}

func scanCards(rows pgx.Rows) ([]Card, error) {
	cards := make([]Card, 0, 8)
	indexBySlug := make(map[string]int)

	for rows.Next() {
		var row cardRow
		if err := rows.Scan(
			&row.slug,
			&row.title,
			&row.columns,
			&row.number,
			&row.label,
			&row.href,
		); err != nil {
			return nil, fmt.Errorf("scan rating card row: %w", err)
		}

		cardIndex, exists := indexBySlug[row.slug]
		if !exists {
			cards = append(cards, Card{
				ID:      row.slug,
				Title:   row.title,
				Columns: row.columns,
				Items:   make([]Item, 0, 16),
			})
			cardIndex = len(cards) - 1
			indexBySlug[row.slug] = cardIndex
		}

		cards[cardIndex].Items = append(cards[cardIndex].Items, Item{
			Number: row.number,
			Label:  row.label,
			Href:   row.href,
		})
	}

	if err := rows.Err(); err != nil {
		return nil, fmt.Errorf("iterate rating cards: %w", err)
	}

	return cards, nil
}
