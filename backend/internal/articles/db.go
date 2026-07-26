package articles

import (
	"context"

	"github.com/jackc/pgx/v5"
)

const (
	maxFeatured    = 4
	maxList        = 8
	feedSlotCount  = 1 + maxFeatured + maxList
	feedQueryLimit = 30
	maxRelated     = 8
)

// DB — минимальный контракт БД для репозитория статей.
type DB interface {
	Query(ctx context.Context, sql string, args ...any) (pgx.Rows, error)
	QueryRow(ctx context.Context, sql string, args ...any) pgx.Row
	SendBatch(ctx context.Context, b *pgx.Batch) pgx.BatchResults
}

// Repository — доступ к статьям.
type Repository struct {
	db DB
}
