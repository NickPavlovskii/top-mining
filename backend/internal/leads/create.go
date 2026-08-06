package leads

import (
	"context"
	"fmt"
	"strings"
	"time"

	"github.com/jackc/pgx/v5/pgxpool"
)

func Create(ctx context.Context, pool *pgxpool.Pool, input CreateInput) (*Lead, error) {
	source := strings.TrimSpace(input.Source)
	contact := strings.TrimSpace(input.Contact)

	if source == "" {
		return nil, fmt.Errorf("source is required")
	}
	if contact == "" {
		return nil, fmt.Errorf("contact is required")
	}

	payload := input.Payload
	if len(payload) == 0 {
		payload = []byte("{}")
	}

	var (
		id        int64
		createdAt time.Time
	)

	err := pool.QueryRow(
		ctx,
		`INSERT INTO leads (source, name, contact, message, payload, page_path)
		 VALUES ($1, $2, $3, $4, $5::jsonb, $6)
		 RETURNING id, created_at`,
		source,
		strings.TrimSpace(input.Name),
		contact,
		strings.TrimSpace(input.Message),
		payload,
		strings.TrimSpace(input.PagePath),
	).Scan(&id, &createdAt)
	if err != nil {
		return nil, fmt.Errorf("insert lead: %w", err)
	}

	return &Lead{
		ID:        id,
		Source:    source,
		Name:      strings.TrimSpace(input.Name),
		Contact:   contact,
		Message:   strings.TrimSpace(input.Message),
		PagePath:  strings.TrimSpace(input.PagePath),
		CreatedAt: createdAt.UTC().Format(time.RFC3339),
	}, nil
}
