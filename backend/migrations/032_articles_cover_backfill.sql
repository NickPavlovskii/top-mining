SET client_encoding = 'UTF8';

-- =====================================================================
-- 032_articles_cover_backfill.sql
-- У статей из рейтингов (024) часто пустой image_url — карточки без обложки.
-- Берём первую картинку из article_blocks и синхронизируем cover_media_id.
-- =====================================================================

UPDATE articles a
SET
    image_url = sub.src,
    image_alt = COALESCE(NULLIF(a.image_alt, ''), NULLIF(sub.alt, ''), a.title)
FROM (
    SELECT DISTINCT ON (ab.article_id)
        ab.article_id,
        ab.payload->>'src' AS src,
        COALESCE(ab.payload->>'alt', '') AS alt
    FROM article_blocks ab
    WHERE ab.type = 'image'
      AND COALESCE(ab.payload->>'src', '') <> ''
    ORDER BY ab.article_id, ab.position, ab.id
) sub
WHERE a.id = sub.article_id
  AND (a.image_url IS NULL OR a.image_url = '');

INSERT INTO media_assets (path, alt, source)
SELECT DISTINCT
    a.image_url,
    COALESCE(NULLIF(a.image_alt, ''), a.title, ''),
    'article_cover_backfill'
FROM articles a
WHERE a.image_url IS NOT NULL
  AND a.image_url <> ''
ON CONFLICT (path) DO NOTHING;

UPDATE articles a
SET cover_media_id = m.id
FROM media_assets m
WHERE m.path = a.image_url
  AND a.cover_media_id IS NULL
  AND a.image_url <> '';
