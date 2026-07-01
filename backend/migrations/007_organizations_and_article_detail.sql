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
    ADD COLUMN IF NOT EXISTS has_public_rating BOOLEAN NOT NULL DEFAULT TRUE,
    ADD COLUMN IF NOT EXISTS is_published BOOLEAN NOT NULL DEFAULT TRUE,
    ADD COLUMN IF NOT EXISTS updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW();

UPDATE catalog_organizations
SET slug = lower(regexp_replace(regexp_replace(name, '[^a-zA-Z0-9а-яА-Я]+', '-', 'g'), '(^-|-$)', '', 'g'))
WHERE slug IS NULL;

UPDATE catalog_organizations SET slug = 'r7miner' WHERE name = 'r7miner';
UPDATE catalog_organizations SET slug = 'bitcluster' WHERE name = 'BitCluster';

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
    energy_type TEXT NOT NULL DEFAULT ''
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

CREATE TABLE IF NOT EXISTS article_sections (
    id SERIAL PRIMARY KEY,
    article_id INT NOT NULL REFERENCES articles (id) ON DELETE CASCADE,
    anchor TEXT NOT NULL,
    title TEXT NOT NULL,
    level SMALLINT NOT NULL DEFAULT 2 CHECK (level BETWEEN 2 AND 4),
    sort_order INT NOT NULL DEFAULT 0,
    UNIQUE (article_id, anchor)
);

CREATE INDEX IF NOT EXISTS article_sections_article_idx
    ON article_sections (article_id, sort_order);

CREATE TABLE IF NOT EXISTS article_related (
    article_id INT NOT NULL REFERENCES articles (id) ON DELETE CASCADE,
    related_article_id INT NOT NULL REFERENCES articles (id) ON DELETE CASCADE,
    sort_order INT NOT NULL DEFAULT 0,
    PRIMARY KEY (article_id, related_article_id),
    CHECK (article_id <> related_article_id)
);

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

DELETE FROM article_sections
WHERE article_id = (SELECT id FROM articles WHERE slug = 'whatsminer-m70-line-review');

INSERT INTO article_sections (article_id, anchor, title, level, sort_order)
SELECT a.id, v.anchor, v.title, v.level, v.sort_order
FROM articles a
JOIN (
    VALUES
        ('intro', 'Введение', 2, 1),
        ('whats-interesting', 'Whatsminer M70: что интересного?', 2, 2),
        ('efficiency-classes', 'Линейка Whatsminer M70: три класса энергоэффективности', 2, 3),
        ('cooling', 'Охлаждение: три формата для разных задач', 2, 4),
        ('tech-features', 'Технологические особенности серии M70', 2, 5),
        ('industry-impact', 'Как обновление M70 повлияет на индустрию?', 2, 6),
        ('conclusion', 'Выводы', 2, 7)
) AS v(anchor, title, level, sort_order) ON a.slug = 'whatsminer-m70-line-review';

INSERT INTO article_related (article_id, related_article_id, sort_order)
SELECT a.id, r.id, v.sort_order
FROM articles a
JOIN (
    VALUES
        ('best-asic-miners-2026', 1),
        ('asic-hardware-overview', 2),
        ('mining-datacenter-guide', 3)
) AS v(related_slug, sort_order) ON TRUE
JOIN articles r ON r.slug = v.related_slug
WHERE a.slug = 'whatsminer-m70-line-review'
ON CONFLICT DO NOTHING;
