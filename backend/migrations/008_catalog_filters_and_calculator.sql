-- Каталог компаний (фильтры, теги, локации) + майнинг-калькулятор (ASIC/GPU/CPU)
-- Референс UI: top-mining.ru/sale_miners/, /calc/, /cpu/amd/ryzen-9-7950x3d/

SET client_encoding = 'UTF8';

-- ===========================================================================
-- КАТАЛОГ: расширение категорий
-- ===========================================================================

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

-- ===========================================================================
-- КАТАЛОГ: модели ASIC для фильтра «Модель ASIC»
-- ===========================================================================

CREATE TABLE IF NOT EXISTS asic_models (
    id SERIAL PRIMARY KEY,
    manufacturer_slug TEXT NOT NULL,
    name TEXT NOT NULL,
    hashrate_th NUMERIC(10, 2),
    power_watts INT,
    algorithm_slug TEXT NOT NULL DEFAULT 'sha-256',
    sort_order INT NOT NULL DEFAULT 0
);

CREATE UNIQUE INDEX IF NOT EXISTS asic_models_manufacturer_name_idx
    ON asic_models (manufacturer_slug, name);

CREATE TABLE IF NOT EXISTS organization_asic_models (
    organization_id INT NOT NULL REFERENCES catalog_organizations (id) ON DELETE CASCADE,
    asic_model_id INT NOT NULL REFERENCES asic_models (id) ON DELETE CASCADE,
    PRIMARY KEY (organization_id, asic_model_id)
);

ALTER TABLE catalog_organizations
    ADD COLUMN IF NOT EXISTS sells_used_asic BOOLEAN NOT NULL DEFAULT FALSE,
    ADD COLUMN IF NOT EXISTS office_city TEXT NOT NULL DEFAULT '';

-- ===========================================================================
-- КАЛЬКУЛЯТОР: типы железа, производители, алгоритмы, монеты
-- ===========================================================================

CREATE TABLE IF NOT EXISTS calculator_hardware_types (
    id TEXT PRIMARY KEY,
    label TEXT NOT NULL,
    sort_order INT NOT NULL DEFAULT 0
);

CREATE TABLE IF NOT EXISTS calculator_manufacturers (
    id SERIAL PRIMARY KEY,
    slug TEXT NOT NULL UNIQUE,
    name TEXT NOT NULL,
    logo_url TEXT NOT NULL DEFAULT '',
    description_html TEXT NOT NULL DEFAULT '',
    sort_order INT NOT NULL DEFAULT 0
);

CREATE TABLE IF NOT EXISTS calculator_manufacturer_types (
    manufacturer_id INT NOT NULL REFERENCES calculator_manufacturers (id) ON DELETE CASCADE,
    hardware_type_id TEXT NOT NULL REFERENCES calculator_hardware_types (id) ON DELETE CASCADE,
    PRIMARY KEY (manufacturer_id, hardware_type_id)
);

CREATE TABLE IF NOT EXISTS mining_algorithms (
    id TEXT PRIMARY KEY,
    name TEXT NOT NULL,
    sort_order INT NOT NULL DEFAULT 0
);

CREATE TABLE IF NOT EXISTS mining_coins (
    id TEXT PRIMARY KEY,
    name TEXT NOT NULL,
    symbol TEXT NOT NULL,
    icon_url TEXT NOT NULL DEFAULT '',
    algorithm_id TEXT NOT NULL REFERENCES mining_algorithms (id),
    sort_order INT NOT NULL DEFAULT 0
);

CREATE TABLE IF NOT EXISTS calculator_hardware_models (
    id SERIAL PRIMARY KEY,
    hardware_type_id TEXT NOT NULL REFERENCES calculator_hardware_types (id),
    manufacturer_id INT NOT NULL REFERENCES calculator_manufacturers (id) ON DELETE CASCADE,
    slug TEXT NOT NULL UNIQUE,
    name TEXT NOT NULL,
    release_year INT,
    description_html TEXT NOT NULL DEFAULT '',
    default_price_rub NUMERIC(14, 2),
    default_hashrate NUMERIC(16, 4),
    hashrate_unit TEXT NOT NULL DEFAULT 'TH/s',
    default_power_watts INT,
    sort_order INT NOT NULL DEFAULT 0
);

CREATE INDEX IF NOT EXISTS calculator_hardware_models_type_idx
    ON calculator_hardware_models (hardware_type_id, manufacturer_id, sort_order);

CREATE TABLE IF NOT EXISTS calculator_model_algorithms (
    model_id INT NOT NULL REFERENCES calculator_hardware_models (id) ON DELETE CASCADE,
    algorithm_id TEXT NOT NULL REFERENCES mining_algorithms (id) ON DELETE CASCADE,
    coin_id TEXT REFERENCES mining_coins (id) ON DELETE SET NULL,
    hashrate NUMERIC(16, 4) NOT NULL,
    hashrate_unit TEXT NOT NULL,
    is_default BOOLEAN NOT NULL DEFAULT FALSE,
    PRIMARY KEY (model_id, algorithm_id)
);

CREATE TABLE IF NOT EXISTS calculator_model_specs (
    id SERIAL PRIMARY KEY,
    model_id INT NOT NULL REFERENCES calculator_hardware_models (id) ON DELETE CASCADE,
    spec_key TEXT NOT NULL,
    spec_value TEXT NOT NULL,
    sort_order INT NOT NULL DEFAULT 0,
    UNIQUE (model_id, spec_key)
);

CREATE INDEX IF NOT EXISTS calculator_model_specs_model_idx
    ON calculator_model_specs (model_id, sort_order);

-- ===========================================================================
-- КАЛЬКУЛЯТОР: курсы и параметры сети
-- ===========================================================================

CREATE TABLE IF NOT EXISTS exchange_rates (
    id SERIAL PRIMARY KEY,
    pair TEXT NOT NULL UNIQUE,
    base_currency TEXT NOT NULL,
    quote_currency TEXT NOT NULL,
    rate NUMERIC(20, 8) NOT NULL,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS network_coin_stats (
    coin_id TEXT PRIMARY KEY REFERENCES mining_coins (id) ON DELETE CASCADE,
    block_reward_btc NUMERIC(20, 12) NOT NULL,
    network_difficulty NUMERIC(30, 6) NOT NULL,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS calculator_defaults (
    id TEXT PRIMARY KEY,
    value NUMERIC(20, 8) NOT NULL,
    unit TEXT NOT NULL DEFAULT '',
    label TEXT NOT NULL DEFAULT '',
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- ===========================================================================
-- SEED: типы железа
-- ===========================================================================

INSERT INTO calculator_hardware_types (id, label, sort_order) VALUES
    ('asic', 'ASIC', 1),
    ('gpu', 'GPU', 2),
    ('cpu', 'CPU', 3)
ON CONFLICT (id) DO NOTHING;

-- ===========================================================================
-- SEED: производители калькулятора
-- ===========================================================================

INSERT INTO calculator_manufacturers (slug, name, logo_url, sort_order) VALUES
    ('microbt', 'MicroBT Whatsminer', '/images/calculator/brands/whatsminer.png', 1),
    ('bitmain', 'Bitmain Antminer', '/images/calculator/brands/antminer.png', 2),
    ('jasminer', 'Jasminer', '/images/calculator/brands/jasminer.png', 3),
    ('canaan', 'Canaan Avalon', '/images/calculator/brands/canaan.png', 4),
    ('innosilicon', 'Innosilicon', '/images/calculator/brands/innosilicon.png', 5),
    ('goldshell', 'Goldshell', '/images/calculator/brands/goldshell.png', 6),
    ('ipollo', 'iPollo', '/images/calculator/brands/ipollo.png', 7),
    ('amd', 'AMD', '/images/calculator/brands/amd.png', 10),
    ('nvidia', 'NVIDIA', '/images/calculator/brands/nvidia.png', 11),
    ('intel', 'Intel', '/images/calculator/brands/intel.png', 12)
ON CONFLICT (slug) DO NOTHING;

INSERT INTO calculator_manufacturer_types (manufacturer_id, hardware_type_id)
SELECT m.id, v.type_id
FROM calculator_manufacturers m
JOIN (
    VALUES
        ('microbt', 'asic'),
        ('bitmain', 'asic'),
        ('jasminer', 'asic'),
        ('canaan', 'asic'),
        ('innosilicon', 'asic'),
        ('goldshell', 'asic'),
        ('ipollo', 'asic'),
        ('amd', 'cpu'),
        ('amd', 'gpu'),
        ('nvidia', 'gpu'),
        ('intel', 'cpu')
) AS v(mfr_slug, type_id) ON m.slug = v.mfr_slug
ON CONFLICT DO NOTHING;

-- ===========================================================================
-- SEED: алгоритмы и монеты
-- ===========================================================================

INSERT INTO mining_algorithms (id, name, sort_order) VALUES
    ('sha-256', 'SHA-256', 1),
    ('scrypt', 'Scrypt', 2),
    ('ethash', 'Ethash', 3),
    ('kawpow', 'KawPow', 4),
    ('randomx', 'RandomX', 5)
ON CONFLICT (id) DO NOTHING;

INSERT INTO mining_coins (id, name, symbol, icon_url, algorithm_id, sort_order) VALUES
    ('bitcoin', 'Bitcoin', 'BTC', '/images/coins/btc.png', 'sha-256', 1),
    ('litecoin', 'Litecoin', 'LTC', '/images/coins/ltc.png', 'scrypt', 2),
    ('ethereum-classic', 'Ethereum Classic', 'ETC', '/images/coins/etc.png', 'ethash', 3),
    ('ravencoin', 'Ravencoin', 'RVN', '/images/coins/rvn.png', 'kawpow', 4),
    ('monero', 'Monero', 'XMR', '/images/coins/xmr.png', 'randomx', 5)
ON CONFLICT (id) DO NOTHING;

-- ===========================================================================
-- SEED: модели ASIC
-- ===========================================================================

INSERT INTO calculator_hardware_models (
    hardware_type_id, manufacturer_id, slug, name, release_year,
    default_price_rub, default_hashrate, hashrate_unit, default_power_watts, sort_order
)
SELECT 'asic', m.id, v.slug, v.name, v.year, v.price, v.hashrate, 'TH/s', v.power, v.ord
FROM calculator_manufacturers m
JOIN (
    VALUES
        ('microbt', 'whatsminer-m70-214t', 'Whatsminer M70 214 TH/s', 2025, 1200000, 214, 3103, 1),
        ('microbt', 'whatsminer-m60s-186t', 'Whatsminer M60S 186 TH/s', 2024, 980000, 186, 3441, 2),
        ('bitmain', 'antminer-s21-200t', 'Antminer S21 200 TH/s', 2024, 1150000, 200, 3500, 3),
        ('bitmain', 'antminer-s19-xp-140t', 'Antminer S19 XP 140 TH/s', 2023, 750000, 140, 3010, 4),
        ('canaan', 'avalon-a1566-185t', 'Avalon A1566 185 TH/s', 2024, 900000, 185, 3420, 5)
) AS v(mfr, slug, name, year, price, hashrate, power, ord) ON m.slug = v.mfr
ON CONFLICT (slug) DO NOTHING;

INSERT INTO calculator_model_algorithms (model_id, algorithm_id, coin_id, hashrate, hashrate_unit, is_default)
SELECT hm.id, 'sha-256', 'bitcoin', hm.default_hashrate, hm.hashrate_unit, TRUE
FROM calculator_hardware_models hm
WHERE hm.hardware_type_id = 'asic'
ON CONFLICT DO NOTHING;

INSERT INTO asic_models (manufacturer_slug, name, hashrate_th, power_watts, algorithm_slug, sort_order)
SELECT
    m.slug,
    hm.name,
    hm.default_hashrate,
    hm.default_power_watts,
    'sha-256',
    hm.sort_order
FROM calculator_hardware_models hm
JOIN calculator_manufacturers m ON m.id = hm.manufacturer_id
WHERE hm.hardware_type_id = 'asic'
ON CONFLICT (manufacturer_slug, name) DO NOTHING;

-- ===========================================================================
-- SEED: модели CPU (Ryzen 9 7950X3D)
-- ===========================================================================

INSERT INTO calculator_hardware_models (
    hardware_type_id, manufacturer_id, slug, name, release_year,
    description_html, default_price_rub, default_hashrate, hashrate_unit, default_power_watts, sort_order
)
SELECT 'cpu', m.id,
    'ryzen-9-7950x3d',
    'Ryzen 9 7950X3D',
    2023,
    '<p>Мощный десктопный процессор на архитектуре Raphael: 16 ядер, 32 потока, частоты 4200–5700 МГц, TDP 120 Вт.</p>',
    120000, 18.5, 'KH/s', 120, 1
FROM calculator_manufacturers m WHERE m.slug = 'amd'
ON CONFLICT (slug) DO NOTHING;

INSERT INTO calculator_model_specs (model_id, spec_key, spec_value, sort_order)
SELECT hm.id, v.key, v.val, v.ord
FROM calculator_hardware_models hm
JOIN (
    VALUES
        ('Производитель', 'AMD', 1),
        ('Модель', 'Ryzen 9 7950X3D', 2),
        ('Год выпуска', '2023', 3),
        ('Сокет', 'Socket AM5', 4),
        ('Количество ядер', '16', 5),
        ('Количество потоков', '32', 6),
        ('Базовая частота', '4200 МГц', 7),
        ('Макс. частота', '5700 МГц', 8),
        ('TDP', '120 Вт', 9),
        ('Архитектура', 'Raphael', 10),
        ('Память', 'DDR5-5200, ECC', 11)
) AS v(key, val, ord) ON hm.slug = 'ryzen-9-7950x3d'
ON CONFLICT (model_id, spec_key) DO NOTHING;

INSERT INTO calculator_model_algorithms (model_id, algorithm_id, coin_id, hashrate, hashrate_unit, is_default)
SELECT hm.id, 'randomx', 'monero', 18.5, 'KH/s', TRUE
FROM calculator_hardware_models hm WHERE hm.slug = 'ryzen-9-7950x3d'
ON CONFLICT DO NOTHING;

INSERT INTO calculator_hardware_models (
    hardware_type_id, manufacturer_id, slug, name, release_year,
    default_price_rub, default_hashrate, hashrate_unit, default_power_watts, sort_order
)
SELECT 'cpu', m.id, v.slug, v.name, v.year, v.price, v.hashrate, 'KH/s', v.power, v.ord
FROM calculator_manufacturers m
JOIN (
    VALUES
        ('amd', 'ryzen-9-7900x', 'Ryzen 9 7900', 2023, 95000, 16.2, 120, 2),
        ('amd', 'ryzen-9-5950x', 'Ryzen 9 5950X', 2020, 65000, 14.8, 105, 3),
        ('amd', 'ryzen-9-5900x', 'Ryzen 9 5900X', 2020, 55000, 13.5, 105, 4)
) AS v(mfr, slug, name, year, price, hashrate, power, ord) ON m.slug = v.mfr
ON CONFLICT (slug) DO NOTHING;

-- ===========================================================================
-- SEED: модели GPU
-- ===========================================================================

INSERT INTO calculator_hardware_models (
    hardware_type_id, manufacturer_id, slug, name, release_year,
    default_price_rub, default_hashrate, hashrate_unit, default_power_watts, sort_order
)
SELECT 'gpu', m.id, v.slug, v.name, v.year, v.price, v.hashrate, v.unit, v.power, v.ord
FROM calculator_manufacturers m
JOIN (
    VALUES
        ('nvidia', 'rtx-4090', 'GeForce RTX 4090', 2022, 220000, 128.5, 'MH/s', 450, 1),
        ('nvidia', 'rtx-3080', 'GeForce RTX 3080', 2020, 90000, 48.2, 'MH/s', 320, 2),
        ('amd', 'rx-7900-xtx', 'Radeon RX 7900 XTX', 2022, 110000, 52.1, 'MH/s', 355, 3)
) AS v(mfr, slug, name, year, price, hashrate, unit, power, ord) ON m.slug = v.mfr
ON CONFLICT (slug) DO NOTHING;

INSERT INTO calculator_model_algorithms (model_id, algorithm_id, coin_id, hashrate, hashrate_unit, is_default)
SELECT hm.id, 'ethash', 'ethereum-classic', hm.default_hashrate, hm.hashrate_unit, TRUE
FROM calculator_hardware_models hm
WHERE hm.hardware_type_id = 'gpu'
ON CONFLICT DO NOTHING;

-- ===========================================================================
-- SEED: курсы, сеть, дефолты калькулятора
-- ===========================================================================

INSERT INTO exchange_rates (pair, base_currency, quote_currency, rate) VALUES
    ('BTC-USDT', 'BTC', 'USDT', 60366),
    ('USDT-RUB', 'USDT', 'RUB', 76.89)
ON CONFLICT (pair) DO UPDATE SET rate = EXCLUDED.rate, updated_at = NOW();

INSERT INTO network_coin_stats (coin_id, block_reward_btc, network_difficulty) VALUES
    ('bitcoin', 0.000000000037, 500977796816.000000)
ON CONFLICT (coin_id) DO UPDATE SET
    block_reward_btc = EXCLUDED.block_reward_btc,
    network_difficulty = EXCLUDED.network_difficulty,
    updated_at = NOW();

INSERT INTO calculator_defaults (id, value, unit, label) VALUES
    ('uptime_pct', 99, '%', 'UP-TIME'),
    ('pool_fee_pct', 4, '%', 'Плата за пул'),
    ('electricity_rub_per_kwh', 5.5, '₽/кВт·ч', 'Цена электроэнергии'),
    ('asic_quantity', 1, 'ед.', 'Кол-во асиков'),
    ('difficulty_adjust_pct', 0, '%', 'Сложность сети')
ON CONFLICT (id) DO UPDATE SET value = EXCLUDED.value, updated_at = NOW();

-- ===========================================================================
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

INSERT INTO organization_asic_models (organization_id, asic_model_id)
SELECT o.id, am.id
FROM catalog_organizations o
JOIN asic_models am ON am.name LIKE 'Whatsminer M70%'
WHERE o.slug = 'r7miner'
ON CONFLICT DO NOTHING;

INSERT INTO organization_delivery_areas (organization_id, location_id)
SELECT o.id, l.id
FROM catalog_organizations o
JOIN catalog_locations l ON l.name IN ('Москва', 'Санкт-Петербург', 'Казань')
WHERE o.slug = 'ttm-mining'
ON CONFLICT DO NOTHING;
