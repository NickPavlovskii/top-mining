-- Карточки организаций категории «Майнинг-отели»
SET client_encoding = 'UTF8';

ALTER TABLE catalog_organizations
    ADD COLUMN IF NOT EXISTS site_city TEXT NOT NULL DEFAULT '',
    ADD COLUMN IF NOT EXISTS verified_mining_registry BOOLEAN NOT NULL DEFAULT FALSE;

UPDATE catalog_organizations SET slug = 'majning-otel-gtes-tereshkovo-moskva'
WHERE name = 'Майнинг отель «Терешково»';
UPDATE catalog_organizations SET slug = 'afm-hotel' WHERE name = 'AFM Hotel';
UPDATE catalog_organizations SET slug = 'bitbird' WHERE name = 'BitBird';

-- Майнинг отель «Терешково»
UPDATE catalog_organizations
SET
    founded_year = 2017,
    office_city = 'Москва',
    site_city = 'Москва',
    has_public_rating = FALSE,
    verified_contracts = TRUE,
    verified_legal_entity = TRUE,
    verified_mining_registry = TRUE,
    card_tags = ARRAY[
        'Цена за кВт/ч: 5.3',
        'Мощности площадок: 17 МВт'
    ],
    card_features = ARRAY[
        'Стратегически защищенный объект',
        'Белый хостинг',
        'Полное сопровождение'
    ],
    updated_at = NOW()
WHERE slug = 'majning-otel-gtes-tereshkovo-moskva';

-- AFM Hotel
UPDATE catalog_organizations
SET
    founded_year = 2018,
    site_city = 'Москва',
    has_public_rating = FALSE,
    verified_contracts = TRUE,
    verified_legal_entity = TRUE,
    verified_mining_registry = TRUE,
    card_tags = ARRAY[
        'Цена за кВт/ч от 5,8₽ кВт/ч',
        'Мощности площадок: 3.5 МВт'
    ],
    card_features = '{}',
    updated_at = NOW()
WHERE slug = 'afm-hotel';

-- BitBird
UPDATE catalog_organizations
SET
    founded_year = 2021,
    site_city = 'г. Липецк',
    rating = 0,
    review_count = 5,
    has_public_rating = TRUE,
    verified_contracts = TRUE,
    verified_legal_entity = TRUE,
    verified_mining_registry = TRUE,
    card_tags = ARRAY[
        'Цена за кВт/ч: от 5,9₽ кВт/ч',
        'Мощности площадок: 8 МВт'
    ],
    card_features = '{}',
    updated_at = NOW()
WHERE slug = 'bitbird';

INSERT INTO organization_mining_hotels (
    organization_id, price_per_kwh_from, price_per_kwh_label,
    sites_count, total_capacity_mw, site_cities, min_devices_label, energy_type
)
SELECT o.id, v.price_from, v.price_label, v.sites, v.capacity_mw, v.site_cities, v.min_devices, v.energy
FROM catalog_organizations o
JOIN (
    VALUES
        ('majning-otel-gtes-tereshkovo-moskva', 5.3, '5.3', 1, 17, 'Москва', '1', 'Электросети'),
        ('afm-hotel', 5.8, 'от 5,8₽', 1, 3.5, 'Москва', '1', 'Электросети'),
        ('bitbird', 5.9, 'от 5,9₽', 1, 8, 'г. Липецк', '1', 'Электросети')
) AS v(slug, price_from, price_label, sites, capacity_mw, site_cities, min_devices, energy)
    ON o.slug = v.slug
ON CONFLICT (organization_id) DO UPDATE SET
    price_per_kwh_from = EXCLUDED.price_per_kwh_from,
    price_per_kwh_label = EXCLUDED.price_per_kwh_label,
    sites_count = EXCLUDED.sites_count,
    total_capacity_mw = EXCLUDED.total_capacity_mw,
    site_cities = EXCLUDED.site_cities,
    min_devices_label = EXCLUDED.min_devices_label,
    energy_type = EXCLUDED.energy_type;

INSERT INTO catalog_organizations (
    category_id, name, slug, logo_url, description, rating, review_count, sort_order,
    founded_year, site_city, has_public_rating,
    verified_contracts, verified_legal_entity, verified_mining_registry,
    card_tags, card_features
)
SELECT
    c.id,
    v.name,
    v.slug,
    v.logo_url,
    v.description,
    v.rating,
    v.review_count,
    v.sort_order,
    v.founded_year,
    v.site_city,
    v.has_public_rating,
    v.verified_contracts,
    v.verified_legal_entity,
    v.verified_mining_registry,
    v.card_tags,
    v.card_features
FROM catalog_categories c
JOIN (
    VALUES
        (
            'AFM Hotel',
            'afm-hotel',
            'https://top-mining.ru/wp-content/uploads/2024/09/afm-hotel-1-1.png',
            'Майнинг-отель с размещением ASIC и технической поддержкой.',
            0::NUMERIC,
            0,
            8,
            2018,
            'Москва',
            FALSE,
            TRUE,
            TRUE,
            TRUE,
            ARRAY['Цена за кВт/ч от 5,8₽ кВт/ч', 'Мощности площадок: 3.5 МВт']::TEXT[],
            '{}'::TEXT[]
        ),
        (
            'BitBird',
            'bitbird',
            'https://top-mining.ru/wp-content/uploads/2024/09/bitbird-1-1.png',
            'Майнинг-отель и размещение оборудования.',
            0::NUMERIC,
            5,
            9,
            2021,
            'г. Липецк',
            TRUE,
            TRUE,
            TRUE,
            TRUE,
            ARRAY['Цена за кВт/ч: от 5,9₽ кВт/ч', 'Мощности площадок: 8 МВт']::TEXT[],
            '{}'::TEXT[]
        )
) AS v(
    name, slug, logo_url, description, rating, review_count, sort_order,
    founded_year, site_city, has_public_rating,
    verified_contracts, verified_legal_entity, verified_mining_registry,
    card_tags, card_features
) ON c.slug = 'mining-hotels'
WHERE NOT EXISTS (SELECT 1 FROM catalog_organizations o WHERE o.slug = v.slug);

INSERT INTO organization_mining_hotels (
    organization_id, price_per_kwh_from, price_per_kwh_label,
    sites_count, total_capacity_mw, site_cities, min_devices_label, energy_type
)
SELECT o.id, v.price_from, v.price_label, v.sites, v.capacity_mw, v.site_cities, v.min_devices, v.energy
FROM catalog_organizations o
JOIN (
    VALUES
        ('afm-hotel', 5.8, 'от 5,8₽', 1, 3.5, 'Москва', '1', 'Электросети'),
        ('bitbird', 5.9, 'от 5,9₽', 1, 8, 'г. Липецк', '1', 'Электросети')
) AS v(slug, price_from, price_label, sites, capacity_mw, site_cities, min_devices, energy)
    ON o.slug = v.slug
ON CONFLICT (organization_id) DO UPDATE SET
    price_per_kwh_from = EXCLUDED.price_per_kwh_from,
    price_per_kwh_label = EXCLUDED.price_per_kwh_label,
    sites_count = EXCLUDED.sites_count,
    total_capacity_mw = EXCLUDED.total_capacity_mw,
    site_cities = EXCLUDED.site_cities,
    min_devices_label = EXCLUDED.min_devices_label,
    energy_type = EXCLUDED.energy_type;
