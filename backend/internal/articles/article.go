package articles

import (
	"context"
	"log"
	"strings"

	"github.com/jackc/pgx/v5"
)

const articleBySlugSQL = `
        SELECT` + previewColumns + `,
               a.content,
               COALESCE(a.content_html, ''),
               COALESCE(a.uses_blocks, FALSE),
               COALESCE(a.view_count, 0)
        FROM articles a
        LEFT JOIN media_assets cover ON cover.id = a.cover_media_id
        WHERE a.slug = $1 AND a.is_published = TRUE
`

const articleBySlugLocalizedSQL = `
        SELECT` + previewColumnsLocalized + `,
               CASE
                 WHEN t.article_id IS NOT NULL THEN COALESCE(t.content, '')
                 ELSE a.content
               END,
               COALESCE(a.content_html, ''),
               COALESCE(a.uses_blocks, FALSE),
               COALESCE(a.view_count, 0)
        FROM articles a
        LEFT JOIN media_assets cover ON cover.id = a.cover_media_id
        LEFT JOIN article_translations t
          ON t.article_id = a.id AND t.locale = $2
        WHERE a.slug = $1 AND a.is_published = TRUE
`

const blocksBySlugSQL = `
		SELECT id, position, type, payload, COALESCE(anchor, '')
		FROM article_blocks
		WHERE article_id = (
			SELECT id FROM articles WHERE slug = $1 AND is_published = TRUE
		)
		ORDER BY position, id
`

const blocksBySlugLocalizedSQL = `
		SELECT b.id, b.position, b.type,
		       COALESCE(bt.payload, b.payload),
		       COALESCE(b.anchor, '')
		FROM article_blocks b
		LEFT JOIN article_block_translations bt
		  ON bt.block_id = b.id AND bt.locale = $2
		WHERE b.article_id = (
			SELECT id FROM articles WHERE slug = $1 AND is_published = TRUE
		)
		ORDER BY b.position, b.id
`

const relatedBySlugSQL = `
		SELECT` + previewColumns + `
		FROM entity_links el
		JOIN articles a ON a.id = el.to_id AND a.is_published = TRUE
		LEFT JOIN media_assets cover ON cover.id = a.cover_media_id
		WHERE el.from_type = 'article'
		  AND el.from_id = (SELECT id FROM articles WHERE slug = $1 AND is_published = TRUE)
		  AND el.to_type = 'article'
		  AND el.relation = 'related'
		ORDER BY el.sort_order, a.id
		LIMIT $2
`

const relatedBySlugLocalizedSQL = `
		SELECT` + previewColumnsLocalized + `
		FROM entity_links el
		JOIN articles a ON a.id = el.to_id AND a.is_published = TRUE
		LEFT JOIN media_assets cover ON cover.id = a.cover_media_id
		LEFT JOIN article_translations t
		  ON t.article_id = a.id AND t.locale = $3
		WHERE el.from_type = 'article'
		  AND el.from_id = (SELECT id FROM articles WHERE slug = $1 AND is_published = TRUE)
		  AND el.to_type = 'article'
		  AND el.relation = 'related'
		ORDER BY el.sort_order, a.id
		LIMIT $2
`

// BySlug загружает статью, блоки и related одним round-trip (pgx.Batch).
func (r *Repository) BySlug(ctx context.Context, slug string, locale string) (*Article, error) {
	slug = strings.TrimSpace(slug)
	if slug == "" {
		return nil, pgx.ErrNoRows
	}
	locale = NormalizeLocale(locale)
	localized := useTranslations(locale)

	batch := &pgx.Batch{}
	if localized {
		batch.Queue(articleBySlugLocalizedSQL, slug, locale)
		batch.Queue(blocksBySlugLocalizedSQL, slug, locale)
		batch.Queue(relatedBySlugLocalizedSQL, slug, maxRelated, locale)
	} else {
		batch.Queue(articleBySlugSQL, slug)
		batch.Queue(blocksBySlugSQL, slug)
		batch.Queue(relatedBySlugSQL, slug, maxRelated)
	}

	br := r.db.SendBatch(ctx, batch)
	defer br.Close()

	article, err := scanArticleRow(br.QueryRow())
	if err != nil {
		return nil, err
	}

	blocks, err := scanBlocksRows(br)
	if err != nil {
		return nil, err
	}
	if article.UsesBlocks {
		article.Blocks = blocks
		if BlocksHaveBody(blocks) {
			if assembled := AssembleContentFromBlocks(blocks); assembled != "" {
				article.Content = assembled
			}
		}
	}

	related, err := scanRelatedRows(br)
	if err != nil {
		log.Printf("articles: related for %q: %v", slug, err)
		article.Related = nil
	} else {
		article.Related = related
	}

	return article, nil
}

const incrementViewBySlugSQL = `
UPDATE articles
SET view_count = COALESCE(view_count, 0) + 1
WHERE slug = $1 AND is_published = TRUE
RETURNING COALESCE(view_count, 0)
`

// IncrementViewBySlug увеличивает счётчик просмотров и возвращает новое значение.
func (r *Repository) IncrementViewBySlug(ctx context.Context, slug string) (int, error) {
	slug = strings.TrimSpace(slug)
	if slug == "" {
		return 0, pgx.ErrNoRows
	}

	var viewCount int
	err := r.db.QueryRow(ctx, incrementViewBySlugSQL, slug).Scan(&viewCount)
	if err != nil {
		return 0, err
	}
	return viewCount, nil
}

func scanArticleRow(row pgx.Row) (*Article, error) {
	var article Article
	var readingTimeMin *int
	var contentHTML string

	err := row.Scan(
		&article.ID,
		&article.Slug,
		&article.Title,
		&article.Excerpt,
		&article.ImageURL,
		&article.ImageAlt,
		&article.TopicID,
		&readingTimeMin,
		&article.PublishedAt,
		&article.DisplayType,
		&article.Content,
		&contentHTML,
		&article.UsesBlocks,
		&article.ViewCount,
	)
	if err != nil {
		return nil, err
	}

	article.ReadingTimeMin = readingTimeMin
	if contentHTML != "" && article.Content == "" {
		article.Content = contentHTML
	}

	return &article, nil
}

func scanBlocksRows(br pgx.BatchResults) ([]Block, error) {
	rows, err := br.Query()
	if err != nil {
		return nil, err
	}
	defer rows.Close()
	return scanBlocks(rows)
}

func scanRelatedRows(br pgx.BatchResults) ([]Preview, error) {
	rows, err := br.Query()
	if err != nil {
		return nil, err
	}
	defer rows.Close()
	return scanPreviews(rows)
}
