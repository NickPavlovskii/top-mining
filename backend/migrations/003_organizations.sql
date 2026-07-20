-- Organizations schema, catalog filters, calculator: 007 + 008
SET client_encoding = 'UTF8';

-- >>> 007_organizations_and_article_detail.sql
-- Расширение схемы под карточки организаций (sale_asic/*) и детальные статьи (mining/*)
-- Референсы: https://top-mining.ru/sale_asic/ttm-mining/
--             https://top-mining.ru/mining/novoe-pokolenie-whatsminer-m70-polnyj-obzor-linejki/

SET client_encoding = 'UTF8';

-- ---------------------------------------------------------------------------
-- Организации каталога: поля профиля
-- ---------------------------------------------------------------------------

ALTER TABLE catalog_organizations
    ADD COLUMN IF NOT EXISTS slug TEXT,
    ADD COLUMN IF NOT EXISTS tagline TEXT NOT NULL DEFAULT '',
    ADD COLUMN IF NOT EXISTS page_title TEXT NOT NULL DEFAULT '',
    ADD COLUMN IF NOT EXISTS founded_year INT,
    ADD COLUMN IF NOT EXISTS website TEXT NOT NULL DEFAULT '',
    ADD COLUMN IF NOT EXISTS email TEXT NOT NULL DEFAULT '',
    ADD COLUMN IF NOT EXISTS work_hours TEXT NOT NULL DEFAULT '',
    ADD COLUMN IF NOT EXISTS domain_registered_at DATE,
    ADD COLUMN IF NOT EXISTS about_html TEXT NOT NULL DEFAULT '',
    ADD COLUMN IF NOT EXISTS map_lat NUMERIC(10, 7),
    ADD COLUMN IF NOT EXISTS map_lng NUMERIC(10, 7),
    ADD COLUMN IF NOT EXISTS verified_contracts BOOLEAN NOT NULL DEFAULT FALSE,
    ADD COLUMN IF NOT EXISTS verified_legal_entity BOOLEAN NOT NULL DEFAULT FALSE,
    ADD COLUMN IF NOT EXISTS verified_data_center BOOLEAN NOT NULL DEFAULT FALSE,
    ADD COLUMN IF NOT EXISTS has_public_rating BOOLEAN NOT NULL DEFAULT TRUE,
    ADD COLUMN IF NOT EXISTS is_published BOOLEAN NOT NULL DEFAULT TRUE,
    ADD COLUMN IF NOT EXISTS updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW();

UPDATE catalog_organizations
SET slug = lower(regexp_replace(regexp_replace(name, '[^a-zA-Z0-9а-яА-Я]+', '-', 'g'), '(^-|-$)', '', 'g'))
WHERE slug IS NULL;

UPDATE catalog_organizations SET slug = 'r7miner' WHERE name = 'r7miner';

CREATE UNIQUE INDEX IF NOT EXISTS catalog_organizations_slug_idx
    ON catalog_organizations (slug);

ALTER TABLE catalog_organizations
    ALTER COLUMN slug SET NOT NULL;

-- ---------------------------------------------------------------------------
-- Адреса офисов
-- ---------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS organization_addresses (
    id SERIAL PRIMARY KEY,
    organization_id INT NOT NULL REFERENCES catalog_organizations (id) ON DELETE CASCADE,
    city TEXT NOT NULL DEFAULT '',
    address_line TEXT NOT NULL,
    sort_order INT NOT NULL DEFAULT 0
);

CREATE INDEX IF NOT EXISTS organization_addresses_org_idx
    ON organization_addresses (organization_id, sort_order);

-- ---------------------------------------------------------------------------
-- Галерея
-- ---------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS organization_gallery_images (
    id SERIAL PRIMARY KEY,
    organization_id INT NOT NULL REFERENCES catalog_organizations (id) ON DELETE CASCADE,
    image_url TEXT NOT NULL,
    image_alt TEXT NOT NULL DEFAULT '',
    sort_order INT NOT NULL DEFAULT 0
);

CREATE INDEX IF NOT EXISTS organization_gallery_org_idx
    ON organization_gallery_images (organization_id, sort_order);

-- ---------------------------------------------------------------------------
-- Продажа оборудования (блок «Продажа оборудования»)
-- ---------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS organization_equipment_sales (
    organization_id INT PRIMARY KEY REFERENCES catalog_organizations (id) ON DELETE CASCADE,
    equipment_type TEXT NOT NULL DEFAULT '',
    equipment_condition TEXT NOT NULL DEFAULT '',
    sales_volume TEXT NOT NULL DEFAULT '',
    availability TEXT NOT NULL DEFAULT '',
    extras TEXT[] NOT NULL DEFAULT '{}'
);

-- ---------------------------------------------------------------------------
-- Майнинг-отель (блок «Майнинг-отель»)
-- ---------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS organization_mining_hotels (
    organization_id INT PRIMARY KEY REFERENCES catalog_organizations (id) ON DELETE CASCADE,
    price_per_kwh_from NUMERIC(6, 2),
    price_per_kwh_label TEXT NOT NULL DEFAULT '',
    sites_count INT,
    total_capacity_mw NUMERIC(8, 2),
    site_cities TEXT NOT NULL DEFAULT '',
    min_devices_label TEXT NOT NULL DEFAULT '',
    energy_type TEXT NOT NULL DEFAULT '',
    extras TEXT[] NOT NULL DEFAULT '{}'
);

-- ---------------------------------------------------------------------------
-- Оплата услуг
-- ---------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS organization_payment_terms (
    organization_id INT PRIMARY KEY REFERENCES catalog_organizations (id) ON DELETE CASCADE,
    payment_methods TEXT[] NOT NULL DEFAULT '{}',
    payment_formats TEXT[] NOT NULL DEFAULT '{}',
    extra_terms TEXT[] NOT NULL DEFAULT '{}',
    contract_forms TEXT[] NOT NULL DEFAULT '{}'
);

-- ---------------------------------------------------------------------------
-- Rusprofile / юридический профиль
-- ---------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS organization_legal_profiles (
    organization_id INT PRIMARY KEY REFERENCES catalog_organizations (id) ON DELETE CASCADE,
    legal_name TEXT NOT NULL,
    primary_activity TEXT NOT NULL DEFAULT '',
    ogrn TEXT NOT NULL DEFAULT '',
    inn TEXT NOT NULL DEFAULT '',
    registered_at DATE,
    legal_address TEXT NOT NULL DEFAULT '',
    authorized_capital TEXT NOT NULL DEFAULT '',
    reliability TEXT NOT NULL DEFAULT '',
    defendant_cases TEXT NOT NULL DEFAULT '',
    revenue TEXT NOT NULL DEFAULT '',
    profit TEXT NOT NULL DEFAULT '',
    tax_debt TEXT NOT NULL DEFAULT '',
    in_sanctions_lists TEXT NOT NULL DEFAULT '',
    sanctions_restrictions TEXT NOT NULL DEFAULT '',
    source TEXT NOT NULL DEFAULT 'rusprofile'
);

-- ---------------------------------------------------------------------------
-- Отзывы
-- ---------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS organization_reviews (
    id SERIAL PRIMARY KEY,
    organization_id INT NOT NULL REFERENCES catalog_organizations (id) ON DELETE CASCADE,
    author_name TEXT NOT NULL,
    author_email TEXT NOT NULL DEFAULT '',
    author_phone TEXT NOT NULL DEFAULT '',
    rating SMALLINT NOT NULL CHECK (rating BETWEEN 1 AND 5),
    content TEXT NOT NULL,
    source TEXT NOT NULL DEFAULT 'top-mining.ru',
    likes_count INT NOT NULL DEFAULT 0,
    dislikes_count INT NOT NULL DEFAULT 0,
    status TEXT NOT NULL DEFAULT 'pending'
        CHECK (status IN ('pending', 'approved', 'rejected')),
    published_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS organization_reviews_org_status_idx
    ON organization_reviews (organization_id, status, published_at DESC);

CREATE TABLE IF NOT EXISTS organization_review_replies (
    id SERIAL PRIMARY KEY,
    review_id INT NOT NULL REFERENCES organization_reviews (id) ON DELETE CASCADE,
    author_name TEXT NOT NULL DEFAULT 'TOP MINING',
    content TEXT NOT NULL,
    published_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- ---------------------------------------------------------------------------
-- Статьи: детальная страница
-- ---------------------------------------------------------------------------

ALTER TABLE articles
    ADD COLUMN IF NOT EXISTS title_subtitle TEXT NOT NULL DEFAULT '',
    ADD COLUMN IF NOT EXISTS view_count INT NOT NULL DEFAULT 0,
    ADD COLUMN IF NOT EXISTS content_html TEXT NOT NULL DEFAULT '';

UPDATE articles
SET content_html = content
WHERE content_html = '' AND content <> '';

-- article_sections / article_related: removed (use article_blocks + entity_links)
-- ---------------------------------------------------------------------------
-- Seed: r7miner
-- ---------------------------------------------------------------------------

UPDATE catalog_organizations o
SET
    slug = 'r7miner',
    tagline = 'Продажа, доставка асиков и размещение',
    page_title = 'R7MINER (ЭР СЭВЕН МАЙНЕР): продажа ASIC-майнеров, майнинг-отель, сервис, доставка, отзывы',
    founded_year = 2017,
    website = 'https://r7miner.com/',
    email = 'info@r7miner.ru',
    work_hours = 'Пн-Пт с 10 до 19',
    domain_registered_at = '2022-09-01',
    verified_contracts = TRUE,
    verified_legal_entity = TRUE,
    has_public_rating = TRUE,
    rating = 4.9,
    review_count = 113,
    about_html = '<p>Компания R7MINER работает с 2017 года и является официальным партнёром MICROBT и BITMAIN. Поставляет Whatsminer, Antminer и другое оборудование, организует доставку и размещение в дата-центрах.</p>'
WHERE o.name = 'r7miner';

INSERT INTO organization_addresses (organization_id, city, address_line, sort_order)
SELECT o.id, v.city, v.address_line, v.sort_order
FROM catalog_organizations o
JOIN (
    VALUES
        ('Москва', 'ул. Минская 2Ж офис 204', 1),
        ('Санкт-Петербург', 'Выборгская наб. 61, БЦ Акватория, офис 204', 2)
) AS v(city, address_line, sort_order) ON TRUE
WHERE o.slug = 'r7miner'
  AND NOT EXISTS (SELECT 1 FROM organization_addresses a WHERE a.organization_id = o.id);

INSERT INTO organization_equipment_sales (
    organization_id, equipment_type, equipment_condition, sales_volume, availability, extras
)
SELECT o.id, 'ASIC', 'Новое', 'Розница, Опт', 'Под заказ', ARRAY[]::TEXT[]
FROM catalog_organizations o
WHERE o.slug = 'r7miner'
ON CONFLICT (organization_id) DO UPDATE SET
    equipment_type = EXCLUDED.equipment_type,
    equipment_condition = EXCLUDED.equipment_condition,
    sales_volume = EXCLUDED.sales_volume,
    availability = EXCLUDED.availability;

INSERT INTO organization_mining_hotels (
    organization_id, price_per_kwh_from, price_per_kwh_label,
    sites_count, total_capacity_mw, site_cities, min_devices_label, energy_type
)
SELECT o.id, 6.2, 'от 6,2 ₽ кВт/ч', 3, 33, 'Челябинская обл., Владимирская обл.', '5', 'Электрический'
FROM catalog_organizations o
WHERE o.slug = 'r7miner'
ON CONFLICT (organization_id) DO UPDATE SET
    price_per_kwh_from = EXCLUDED.price_per_kwh_from,
    sites_count = EXCLUDED.sites_count,
    total_capacity_mw = EXCLUDED.total_capacity_mw;

INSERT INTO organization_payment_terms (
    organization_id, payment_methods, payment_formats, extra_terms, contract_forms
)
SELECT o.id,
    ARRAY['Наличными', 'Безналичная'],
    ARRAY['Частичная предоплата', 'Предоплата'],
    ARRAY['В кредит', 'В рассрочку'],
    ARRAY['Договор с ООО']
FROM catalog_organizations o
WHERE o.slug = 'r7miner'
ON CONFLICT (organization_id) DO NOTHING;

INSERT INTO organization_legal_profiles (
    organization_id, legal_name, primary_activity, ogrn, inn, registered_at,
    legal_address, authorized_capital, reliability, defendant_cases,
    revenue, profit, tax_debt, in_sanctions_lists, sanctions_restrictions
)
SELECT o.id,
    'ООО "РАЙТ ГРУПП"',
    'Торговля оптовая неспециализированная (46.90)',
    '1217800082972',
    '7813653834',
    '2021-05-26',
    '199178, Санкт-Петербург, 10-я линия В.О., 15 лит. А, помещ. 1н',
    '10 000 ₽',
    'Средняя',
    'Нет судебных дел',
    '429 млн ₽ (2023)',
    '-21 млн ₽ (2023)',
    'Нет',
    'Нет',
    'Нет'
FROM catalog_organizations o
WHERE o.slug = 'r7miner'
ON CONFLICT (organization_id) DO NOTHING;

-- ---------------------------------------------------------------------------
-- Seed: TTM Mining
-- ---------------------------------------------------------------------------

INSERT INTO catalog_organizations (
    category_id, name, slug, logo_url, description, rating, review_count, sort_order,
    tagline, page_title, founded_year, website, email, work_hours,
    verified_contracts, verified_legal_entity, has_public_rating, about_html
)
SELECT c.id,
    'TTM Mining',
    'ttm-mining',
    '/images/catalog/ttm-mining.png',
    'Продажа ASIC-майнеров, майнинг-отель и сервис под ключ.',
    0, 0, 11,
    'Продажа ASIC, размещение и сервис',
    'TTM MINING COMPANY (ТТМ): продажа ASIC-майнеров, майнинг-отель, сервис, доставка, отзывы',
    2024,
    'https://www.avito.ru/brands/65714c2f1e8e18cdd3296d902515deb1',
    'to_the_moon@internet.ru',
    'Пн-Пт с 10 до 19',
    FALSE, FALSE, FALSE,
    '<p>TTM MINING COMPANY — российская компания в сфере поставок, размещения и сервисного обслуживания ASIC-майнеров.</p>'
FROM catalog_categories c
WHERE c.slug = 'asic-sales'
  AND NOT EXISTS (SELECT 1 FROM catalog_organizations o WHERE o.slug = 'ttm-mining');

INSERT INTO organization_addresses (organization_id, city, address_line, sort_order)
SELECT o.id, 'Москва', '109004, ул. Александра Солженицына, д. 27, помещ. 1/2', 1
FROM catalog_organizations o
WHERE o.slug = 'ttm-mining'
  AND NOT EXISTS (SELECT 1 FROM organization_addresses a WHERE a.organization_id = o.id);

INSERT INTO organization_equipment_sales (
    organization_id, equipment_type, equipment_condition, sales_volume, availability, extras
)
SELECT o.id, 'ASIC-майнеры', 'Новое и БУ', 'Розница; ОПТ', 'В наличии и под заказ',
    ARRAY['Доставка по России и миру', 'Подбор ASIC под задачи', 'Гибкие условия сотрудничества']
FROM catalog_organizations o WHERE o.slug = 'ttm-mining'
ON CONFLICT (organization_id) DO NOTHING;

INSERT INTO organization_mining_hotels (
    organization_id, price_per_kwh_from, price_per_kwh_label,
    sites_count, total_capacity_mw, site_cities, min_devices_label, energy_type
)
SELECT o.id, 6.2, 'от 6,2 ₽', 3, 60, 'Москва; Казань; Санкт-Петербург', 'от 5 устройств', 'Электросети'
FROM catalog_organizations o WHERE o.slug = 'ttm-mining'
ON CONFLICT (organization_id) DO NOTHING;

INSERT INTO organization_payment_terms (
    organization_id, payment_methods, payment_formats, extra_terms, contract_forms
)
SELECT o.id,
    ARRAY['Без НДС', 'С НДС'],
    ARRAY['Оплата криптовалютой', 'Наличными', 'Безналичная'],
    ARRAY['Постоплата', 'Частичная предоплата', 'Предоплата', 'Лизинг'],
    ARRAY['Договор с ИП', 'Договор с ООО']
FROM catalog_organizations o WHERE o.slug = 'ttm-mining'
ON CONFLICT (organization_id) DO NOTHING;

INSERT INTO organization_legal_profiles (
    organization_id, legal_name, primary_activity, ogrn, inn, registered_at,
    legal_address, authorized_capital, reliability
)
SELECT o.id,
    'ООО "ТТМ"',
    'Торговля оптовая компьютерами, периферийными устройствами к компьютерам и программным обеспечением (46.51)',
    '1247700565530', '9709114854', '2024-08-21',
    '109004, Москва, ул. Александра Солженицына, д. 27, помещ. 1/2',
    '10000', 'НИЗКАЯ'
FROM catalog_organizations o WHERE o.slug = 'ttm-mining'
ON CONFLICT (organization_id) DO NOTHING;

-- ---------------------------------------------------------------------------
-- Seed: статья Whatsminer M70
-- ---------------------------------------------------------------------------

UPDATE articles
SET
    title = 'Новое поколение Whatsminer M70',
    title_subtitle = 'Полный обзор линейки',
    view_count = 324,
    reading_time_min = 10,
    published_at = '2025-12-12'
WHERE slug = 'whatsminer-m70-line-review';

SET client_encoding = 'UTF8';

INSERT INTO catalog_categories (name, slug, sort_order) VALUES
    ('Ремонт ASIC', 'asic-repair', 5),
    ('Криптобиржи', 'crypto-exchanges', 6),
    ('Криптокошельки', 'crypto-wallets', 7),
    ('Прошивки для асиков', 'asic-firmware', 8),
    ('Мероприятия', 'events', 9)
ON CONFLICT (slug) DO NOTHING;

-- ===========================================================================
-- КАТАЛОГ: услуги для фильтра (M:N с организациями)
-- ===========================================================================

CREATE TABLE IF NOT EXISTS catalog_services (
    id SERIAL PRIMARY KEY,
    slug TEXT NOT NULL UNIQUE,
    label TEXT NOT NULL,
    sort_order INT NOT NULL DEFAULT 0
);

CREATE TABLE IF NOT EXISTS organization_services (
    organization_id INT NOT NULL REFERENCES catalog_organizations (id) ON DELETE CASCADE,
    service_id INT NOT NULL REFERENCES catalog_services (id) ON DELETE CASCADE,
    PRIMARY KEY (organization_id, service_id)
);

INSERT INTO catalog_services (slug, label, sort_order) VALUES
    ('mining-hotels', 'Майнинг-отели', 1),
    ('events', 'Мероприятия', 2),
    ('asic-sales', 'Продажа ASIC', 3),
    ('asic-repair', 'Ремонт ASIC', 4)
ON CONFLICT (slug) DO NOTHING;

-- ===========================================================================
-- КАТАЛОГ: локации (офисы, доставка)
-- ===========================================================================

CREATE TABLE IF NOT EXISTS catalog_locations (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    region TEXT NOT NULL DEFAULT '',
    sort_order INT NOT NULL DEFAULT 0
);

CREATE UNIQUE INDEX IF NOT EXISTS catalog_locations_name_region_idx
    ON catalog_locations (name, region);

CREATE TABLE IF NOT EXISTS organization_delivery_areas (
    organization_id INT NOT NULL REFERENCES catalog_organizations (id) ON DELETE CASCADE,
    location_id INT NOT NULL REFERENCES catalog_locations (id) ON DELETE CASCADE,
    PRIMARY KEY (organization_id, location_id)
);

CREATE INDEX IF NOT EXISTS organization_delivery_areas_loc_idx
    ON organization_delivery_areas (location_id);

-- ===========================================================================
-- КАТАЛОГ: теги/бейджи на карточках
-- ===========================================================================

CREATE TABLE IF NOT EXISTS catalog_tags (
    id SERIAL PRIMARY KEY,
    slug TEXT NOT NULL UNIQUE,
    label TEXT NOT NULL,
    tag_group TEXT NOT NULL DEFAULT 'general',
    sort_order INT NOT NULL DEFAULT 0
);

CREATE TABLE IF NOT EXISTS organization_tags (
    organization_id INT NOT NULL REFERENCES catalog_organizations (id) ON DELETE CASCADE,
    tag_id INT NOT NULL REFERENCES catalog_tags (id) ON DELETE CASCADE,
    PRIMARY KEY (organization_id, tag_id)
);

INSERT INTO catalog_tags (slug, label, tag_group, sort_order) VALUES
    ('with-vat', 'С НДС', 'payment', 1),
    ('without-vat', 'Без НДС', 'payment', 2),
    ('new-equipment', 'Новое', 'condition', 3),
    ('used-equipment', 'Б/У', 'condition', 4),
    ('wholesale', 'Опт', 'volume', 5),
    ('retail', 'Розница', 'volume', 6),
    ('in-stock', 'В наличии', 'availability', 7),
    ('on-order', 'Под заказ', 'availability', 8),
    ('direct-from-manufacturer', 'Напрямую от производителей', 'highlight', 9),
    ('warranty-by-contract', 'Гарантия по договору', 'highlight', 10),
    ('official-import', 'Официальный импорт', 'highlight', 11)
ON CONFLICT (slug) DO NOTHING;


-- asic_models / calculator_*: removed; hardware_* seeded in 017
ALTER TABLE catalog_organizations
    ADD COLUMN IF NOT EXISTS sells_used_asic BOOLEAN NOT NULL DEFAULT FALSE,
    ADD COLUMN IF NOT EXISTS office_city TEXT NOT NULL DEFAULT '';

-- SEED: локации и привязки к r7miner / DC mining
-- ===========================================================================

INSERT INTO catalog_locations (name, region, sort_order) VALUES
    ('Москва', '', 1),
    ('Санкт-Петербург', '', 2),
    ('Казань', 'Татарстан', 3),
    ('Абакан', 'Хакасия', 4),
    ('Братск', 'Иркутская обл.', 5),
    ('Челябинск', 'Челябинская обл.', 6),
    ('Владимир', 'Владимирская обл.', 7)
ON CONFLICT (name, region) DO NOTHING;

UPDATE catalog_organizations SET slug = 'dc-mining' WHERE name = 'DC mining';

UPDATE catalog_organizations SET office_city = 'Москва' WHERE slug IN ('r7miner', 'ttm-mining', 'dc-mining');
UPDATE catalog_organizations SET sells_used_asic = TRUE WHERE slug = 'ttm-mining';

INSERT INTO organization_services (organization_id, service_id)
SELECT o.id, s.id
FROM (
    VALUES
        ('r7miner', 'asic-sales'),
        ('r7miner', 'mining-hotels'),
        ('ttm-mining', 'asic-sales'),
        ('ttm-mining', 'mining-hotels'),
        ('dc-mining', 'asic-sales')
) AS v(org_slug, service_slug)
JOIN catalog_organizations o ON o.slug = v.org_slug
JOIN catalog_services s ON s.slug = v.service_slug
ON CONFLICT DO NOTHING;

INSERT INTO organization_tags (organization_id, tag_id)
SELECT o.id, t.id
FROM (
    VALUES
        ('r7miner', 'with-vat'),
        ('r7miner', 'new-equipment'),
        ('r7miner', 'wholesale'),
        ('r7miner', 'retail'),
        ('r7miner', 'on-order'),
        ('r7miner', 'direct-from-manufacturer'),
        ('dc-mining', 'in-stock'),
        ('dc-mining', 'new-equipment'),
        ('dc-mining', 'retail'),
        ('ttm-mining', 'used-equipment'),
        ('ttm-mining', 'in-stock'),
        ('ttm-mining', 'on-order')
) AS v(org_slug, tag_slug)
JOIN catalog_organizations o ON o.slug = v.org_slug
JOIN catalog_tags t ON t.slug = v.tag_slug
ON CONFLICT DO NOTHING;

INSERT INTO organization_delivery_areas (organization_id, location_id)
SELECT o.id, l.id
FROM catalog_organizations o
JOIN catalog_locations l ON l.name IN ('Москва', 'Санкт-Петербург', 'Казань')
WHERE o.slug = 'ttm-mining'
ON CONFLICT DO NOTHING;


