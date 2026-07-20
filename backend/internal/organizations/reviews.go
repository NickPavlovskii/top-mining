package organizations

import (
	"context"
	"fmt"
	"strings"

	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/pgxpool"
)

func FetchReviews(
	ctx context.Context,
	pool *pgxpool.Pool,
	organizationSlug string,
	sort string,
) ([]Review, ReviewStats, error) {
	organizationSlug = strings.TrimSpace(organizationSlug)
	if organizationSlug == "" {
		return nil, ReviewStats{}, pgx.ErrNoRows
	}

	var orgID int
	err := pool.QueryRow(ctx, `
		SELECT id
		FROM catalog_organizations
		WHERE slug = $1 AND is_published = TRUE
	`, organizationSlug).Scan(&orgID)
	if err != nil {
		return nil, ReviewStats{}, err
	}

	stats, err := fetchReviewStats(ctx, pool, orgID)
	if err != nil {
		return nil, ReviewStats{}, err
	}

	orderBy := reviewSortOrder(sort)
	rows, err := pool.Query(ctx, fmt.Sprintf(`
		SELECT id, author_name, rating, content, source,
		       likes_count, dislikes_count, published_at
		FROM organization_reviews
		WHERE organization_id = $1 AND status = 'approved'
		ORDER BY %s
	`, orderBy), orgID)
	if err != nil {
		return nil, ReviewStats{}, err
	}
	defer rows.Close()

	items := make([]Review, 0, 16)
	for rows.Next() {
		var item Review
		if err := rows.Scan(
			&item.ID,
			&item.AuthorName,
			&item.Rating,
			&item.Content,
			&item.Source,
			&item.LikesCount,
			&item.DislikesCount,
			&item.PublishedAt,
		); err != nil {
			return items, stats, err
		}
		items = append(items, item)
	}

	return items, stats, rows.Err()
}

func CreateReview(
	ctx context.Context,
	pool *pgxpool.Pool,
	input CreateReviewInput,
) (*CreateReviewResult, error) {
	input.OrganizationSlug = strings.TrimSpace(input.OrganizationSlug)
	input.AuthorName = strings.TrimSpace(input.AuthorName)
	input.AuthorEmail = strings.TrimSpace(input.AuthorEmail)
	input.AuthorPhone = strings.TrimSpace(input.AuthorPhone)
	input.Content = strings.TrimSpace(input.Content)

	if input.OrganizationSlug == "" || input.AuthorName == "" || input.Content == "" {
		return nil, fmt.Errorf("organizationSlug, authorName and content are required")
	}
	if input.Rating < 1 || input.Rating > 5 {
		return nil, fmt.Errorf("rating must be between 1 and 5")
	}

	tx, err := pool.Begin(ctx)
	if err != nil {
		return nil, err
	}
	defer tx.Rollback(ctx)

	var orgID int
	err = tx.QueryRow(ctx, `
		SELECT id
		FROM catalog_organizations
		WHERE slug = $1 AND is_published = TRUE
	`, input.OrganizationSlug).Scan(&orgID)
	if err != nil {
		return nil, err
	}

	var review Review
	err = tx.QueryRow(ctx, `
		INSERT INTO organization_reviews (
			organization_id,
			author_name,
			author_email,
			author_phone,
			rating,
			content,
			source,
			status,
			published_at
		)
		VALUES ($1, $2, $3, $4, $5, $6, 'top-mining.ru', 'approved', NOW())
		RETURNING id, author_name, rating, content, source,
		          likes_count, dislikes_count, published_at
	`,
		orgID,
		input.AuthorName,
		input.AuthorEmail,
		input.AuthorPhone,
		input.Rating,
		input.Content,
	).Scan(
		&review.ID,
		&review.AuthorName,
		&review.Rating,
		&review.Content,
		&review.Source,
		&review.LikesCount,
		&review.DislikesCount,
		&review.PublishedAt,
	)
	if err != nil {
		return nil, err
	}

	stats, err := recalculateReviewStats(ctx, tx, orgID)
	if err != nil {
		// Триггер 019 уже мог обновить org — читаем агрегаты из отзывов.
		stats, err = fetchReviewStatsTx(ctx, tx, orgID)
		if err != nil {
			return nil, err
		}
	}

	if err := tx.Commit(ctx); err != nil {
		return nil, err
	}

	return &CreateReviewResult{
		Review: review,
		Stats:  stats,
	}, nil
}

func fetchReviewStats(ctx context.Context, pool *pgxpool.Pool, orgID int) (ReviewStats, error) {
	var stats ReviewStats
	err := pool.QueryRow(ctx, `
		SELECT
			COALESCE(ROUND(AVG(r.rating)::numeric, 1), 0)::float8,
			COUNT(r.id)::int
		FROM organization_reviews r
		WHERE r.organization_id = $1 AND r.status = 'approved'
	`, orgID).Scan(&stats.Rating, &stats.ReviewCount)
	if err != nil {
		return ReviewStats{}, err
	}

	stats.HasPublicRating = stats.ReviewCount > 0
	return stats, nil
}

func fetchReviewStatsTx(ctx context.Context, tx pgx.Tx, orgID int) (ReviewStats, error) {
	var stats ReviewStats
	err := tx.QueryRow(ctx, `
		SELECT
			COALESCE(ROUND(AVG(r.rating)::numeric, 1), 0)::float8,
			COUNT(r.id)::int
		FROM organization_reviews r
		WHERE r.organization_id = $1 AND r.status = 'approved'
	`, orgID).Scan(&stats.Rating, &stats.ReviewCount)
	if err != nil {
		return ReviewStats{}, err
	}

	stats.HasPublicRating = stats.ReviewCount > 0
	return stats, nil
}

func recalculateReviewStats(
	ctx context.Context,
	tx pgx.Tx,
	orgID int,
) (ReviewStats, error) {
	var stats ReviewStats
	err := tx.QueryRow(ctx, `
		WITH agg AS (
			SELECT
				COALESCE(ROUND(AVG(rating)::numeric, 1), 0)::float8 AS rating,
				COUNT(*)::int AS review_count
			FROM organization_reviews
			WHERE organization_id = $1 AND status = 'approved'
		)
		UPDATE catalog_organizations o
		SET
			rating = agg.rating,
			review_count = agg.review_count,
			has_public_rating = agg.review_count > 0,
			updated_at = NOW()
		FROM agg
		WHERE o.id = $1
		RETURNING o.rating, o.review_count, o.has_public_rating
	`, orgID).Scan(&stats.Rating, &stats.ReviewCount, &stats.HasPublicRating)
	if err != nil {
		return ReviewStats{}, err
	}

	return stats, nil
}

func reviewSortOrder(sort string) string {
	switch strings.TrimSpace(sort) {
	case "oldest":
		return "published_at ASC, id ASC"
	case "rating-desc":
		return "rating DESC, published_at DESC, id DESC"
	case "rating-asc":
		return "rating ASC, published_at DESC, id DESC"
	default:
		return "published_at DESC, id DESC"
	}
}
