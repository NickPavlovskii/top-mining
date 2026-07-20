SET client_encoding = 'UTF8';

SET client_encoding = 'UTF8';

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
SELECT
    o.id,
    v.author_name,
    '',
    '',
    v.rating,
    v.content,
    v.source,
    'approved',
    v.published_at::timestamptz
FROM catalog_organizations o
JOIN (
    VALUES
        (
            'r7miner',
            'Иван',
            5,
            'Профессиональный подход! Помогли подобрать оборудование и разместить на площадке без лишних вопросов.',
            'top-mining.ru',
            '2025-09-26 16:32:00+03'
        ),
        (
            'r7miner',
            'Роман Глухов',
            5,
            'Отличная коммуникация и прозрачные условия. Рекомендую как надёжного партнёра в майнинге.',
            'Yandex.Карты',
            '2025-09-20 11:10:00+03'
        )
) AS v(slug, author_name, rating, content, source, published_at)
    ON o.slug = v.slug
WHERE NOT EXISTS (
    SELECT 1
    FROM organization_reviews r
    WHERE r.organization_id = o.id
      AND r.author_name = v.author_name
      AND r.content = v.content
);

UPDATE catalog_organizations o
SET
    review_count = stats.review_count,
    rating = stats.rating,
    has_public_rating = stats.review_count > 0,
    updated_at = NOW()
FROM (
    SELECT
        organization_id,
        COUNT(*)::int AS review_count,
        COALESCE(ROUND(AVG(rating)::numeric, 1), 0)::float8 AS rating
    FROM organization_reviews
    WHERE status = 'approved'
    GROUP BY organization_id
) AS stats
WHERE o.id = stats.organization_id;

SET client_encoding = 'UTF8';

WITH stats AS (
    SELECT
        organization_id,
        COUNT(*)::int AS review_count,
        COALESCE(ROUND(AVG(rating)::numeric, 1), 0)::float8 AS rating
    FROM organization_reviews
    WHERE status = 'approved'
    GROUP BY organization_id
)
UPDATE catalog_organizations o
SET
    review_count = s.review_count,
    rating = s.rating,
    has_public_rating = s.review_count > 0,
    updated_at = NOW()
FROM stats s
WHERE o.id = s.organization_id;

UPDATE catalog_organizations o
SET
    review_count = 0,
    rating = 0,
    has_public_rating = FALSE,
    updated_at = NOW()
WHERE NOT EXISTS (
    SELECT 1
    FROM organization_reviews r
    WHERE r.organization_id = o.id
      AND r.status = 'approved'
);


