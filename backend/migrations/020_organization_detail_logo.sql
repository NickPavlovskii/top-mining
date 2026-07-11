-- Отдельный логотип для страницы организации (hero), каталожный logo_url не меняем

SET client_encoding = 'UTF8';

ALTER TABLE catalog_organizations
    ADD COLUMN IF NOT EXISTS detail_logo_url TEXT NOT NULL DEFAULT '';

UPDATE catalog_organizations
SET
    logo_url = 'https://top-mining.ru/wp-content/uploads/2026/05/firmennyj-znak-czvetnoj.png',
    detail_logo_url = '/images/catalog/ttm-mining-detail.png',
    updated_at = NOW()
WHERE slug = 'ttm-mining';
