package articles

import (
	"context"

	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgxpool"
)

// Лимиты раскладки ленты на главной.
const (
	maxFeatured    = 4
	maxList        = 8
	feedSlotCount  = 1 + maxFeatured + maxList // hero + featured + list
	feedQueryLimit = 30                        // запас на перекос display_type
	maxRelated     = 8
)

// DB — минимум методов PostgreSQL, нужных репозиторию (удобно подменять в тестах).
type DB interface {
	Query(ctx context.Context, sql string, args ...any) (pgx.Rows, error)
	QueryRow(ctx context.Context, sql string, args ...any) pgx.Row
	SendBatch(ctx context.Context, b *pgx.Batch) pgx.BatchResults
}

// Repository — доступ к статьям.
type Repository struct {
	db DB
}

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
