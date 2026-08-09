package articles

import (
	"context"

	"github.com/jackc/pgx/v5/pgxpool"
)

// New создаёт репозиторий статей.
func New(db DB) *Repository {
	return &Repository{db: db}
}

func NewFromPool(pool *pgxpool.Pool) *Repository {
	return New(pool)
}

func FetchFeed(ctx context.Context, pool *pgxpool.Pool, topic string) (*Feed, error) {
	return New(pool).Feed(ctx, topic, "ru")
}

func FetchBySlug(ctx context.Context, pool *pgxpool.Pool, slug string) (*Article, error) {
	return New(pool).BySlug(ctx, slug, "ru")
}
