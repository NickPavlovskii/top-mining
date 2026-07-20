SET client_encoding = 'UTF8';

SET client_encoding = 'UTF8';

UPDATE catalog_organizations o
SET
    rating = 0,
    review_count = 0,
    has_public_rating = FALSE,
    updated_at = NOW()
WHERE NOT EXISTS (
    SELECT 1
    FROM organization_reviews r
    WHERE r.organization_id = o.id
      AND r.status = 'approved'
);

UPDATE catalog_organizations o
SET
    rating = agg.rating,
    review_count = agg.review_count,
    has_public_rating = TRUE,
    updated_at = NOW()
FROM (
    SELECT
        organization_id,
        ROUND(AVG(rating)::numeric, 1)::float8 AS rating,
        COUNT(*)::int AS review_count
    FROM organization_reviews
    WHERE status = 'approved'
    GROUP BY organization_id
) agg
WHERE o.id = agg.organization_id;
