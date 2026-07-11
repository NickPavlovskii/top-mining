-- Флаги отображения блоков страницы организации + актуализация TTM Mining

SET client_encoding = 'UTF8';

ALTER TABLE catalog_organizations
    ADD COLUMN IF NOT EXISTS show_gallery BOOLEAN NOT NULL DEFAULT TRUE,
    ADD COLUMN IF NOT EXISTS show_article_block BOOLEAN NOT NULL DEFAULT TRUE;

UPDATE catalog_organizations
SET
    page_title = 'TTM MINING COMPANY (TTM): продажа ASIC-майнеров, майнинг-отель, сервис, доставка, отзывы',
    logo_url = 'https://top-mining.ru/wp-content/uploads/2026/05/firmennyj-znak-czvetnoj.png',
    show_gallery = FALSE,
    show_article_block = FALSE,
    updated_at = NOW()
WHERE slug = 'ttm-mining';

UPDATE organization_mining_hotels mh
SET
    price_per_kwh_label = 'от 6,2 ₽',
    sites_count = 3,
    total_capacity_mw = NULL,
    site_cities = '',
    min_devices_label = '',
    energy_type = ''
FROM catalog_organizations o
WHERE mh.organization_id = o.id
  AND o.slug = 'ttm-mining';
