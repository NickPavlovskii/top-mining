package articles

import (
	"context"

	"github.com/jackc/pgx/v5/pgxpool"
)

// New создаёт репозиторий статей.
func New(db DB) *Repository {
	return &Repository{db: db}
}

// NewFromPool — удобная обёртка над pgxpool.
func NewFromPool(pool *pgxpool.Pool) *Repository {
	return New(pool)
}

// FetchFeed — совместимость со старым API.
func FetchFeed(ctx context.Context, pool *pgxpool.Pool, topic string) (*Feed, error) {
	return New(pool).Feed(ctx, topic)
}

// FetchBySlug — совместимость со старым API.
func FetchBySlug(ctx context.Context, pool *pgxpool.Pool, slug string) (*Article, error) {
	return New(pool).BySlug(ctx, slug)
}
