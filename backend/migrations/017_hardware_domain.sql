SET client_encoding = 'UTF8';

-- =====================================================================
-- 017_hardware_domain.sql
-- Единый домен оборудования для калькулятора, фильтра каталога и карточки.
-- Сиды моделей — сразу сюда
-- =====================================================================


CREATE TABLE IF NOT EXISTS hardware_kinds (
    id          BIGSERIAL PRIMARY KEY,
    slug        TEXT    NOT NULL UNIQUE,
    title       TEXT    NOT NULL,
    picker_hint TEXT    NOT NULL DEFAULT '',
    empty_hint  TEXT    NOT NULL DEFAULT '',
    icon_id     BIGINT  REFERENCES media_assets (id) ON DELETE SET NULL,
    sort_order  INTEGER NOT NULL DEFAULT 100,
    is_active   BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE IF NOT EXISTS hardware_vendors (
    id        BIGSERIAL PRIMARY KEY,
    slug      TEXT    NOT NULL UNIQUE,
    title     TEXT    NOT NULL,
    logo_id   BIGINT  REFERENCES media_assets (id) ON DELETE SET NULL,
    is_active BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE IF NOT EXISTS hardware_kind_vendors (
    kind_id    BIGINT  NOT NULL REFERENCES hardware_kinds (id) ON DELETE CASCADE,
    vendor_id  BIGINT  NOT NULL REFERENCES hardware_vendors (id) ON DELETE CASCADE,
    sort_order INTEGER NOT NULL DEFAULT 100,
    PRIMARY KEY (kind_id, vendor_id)
);

CREATE TABLE IF NOT EXISTS hardware_algorithms (
    id         BIGSERIAL PRIMARY KEY,
    slug       TEXT    NOT NULL UNIQUE,
    title      TEXT    NOT NULL,
    sort_order INTEGER NOT NULL DEFAULT 100,
    is_active  BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE IF NOT EXISTS hardware_coins (
    id           BIGSERIAL PRIMARY KEY,
    algorithm_id BIGINT  NOT NULL REFERENCES hardware_algorithms (id) ON DELETE RESTRICT,
    ticker       TEXT    NOT NULL UNIQUE,
    title        TEXT    NOT NULL,
    coingecko_id TEXT,
    icon_id      BIGINT  REFERENCES media_assets (id) ON DELETE SET NULL,
    sort_order   INTEGER NOT NULL DEFAULT 100,
    is_active    BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE INDEX IF NOT EXISTS idx_hardware_coins_algorithm ON hardware_coins (algorithm_id);

CREATE TABLE IF NOT EXISTS hardware_models (
    id             BIGSERIAL PRIMARY KEY,
    kind_id        BIGINT   NOT NULL REFERENCES hardware_kinds (id) ON DELETE RESTRICT,
    vendor_id      BIGINT   NOT NULL REFERENCES hardware_vendors (id) ON DELETE RESTRICT,
    slug           TEXT     NOT NULL UNIQUE,
    name           TEXT     NOT NULL,
    image_id       BIGINT   REFERENCES media_assets (id) ON DELETE SET NULL,
    price_default  NUMERIC(14, 2),
    price_currency TEXT     NOT NULL DEFAULT 'RUB',
    released_at    DATE,
    specs          JSONB    NOT NULL DEFAULT '{}'::jsonb,
    is_published   BOOLEAN  NOT NULL DEFAULT TRUE,
    sort_order     INTEGER  NOT NULL DEFAULT 100,
    created_at     TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at     TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_hardware_models_picker
    ON hardware_models (kind_id, vendor_id, sort_order) WHERE is_published;

CREATE INDEX IF NOT EXISTS idx_hardware_models_search
    ON hardware_models USING GIN (to_tsvector('simple', name));

CREATE TABLE IF NOT EXISTS hardware_model_algorithms (
    id            BIGSERIAL PRIMARY KEY,
    model_id      BIGINT  NOT NULL REFERENCES hardware_models (id) ON DELETE CASCADE,
    algorithm_id  BIGINT  NOT NULL REFERENCES hardware_algorithms (id) ON DELETE RESTRICT,
    hashrate      NUMERIC(24, 6) NOT NULL,
    hashrate_unit TEXT    NOT NULL,
    power_watts   NUMERIC(10, 2) NOT NULL,
    is_primary    BOOLEAN NOT NULL DEFAULT FALSE,
    UNIQUE (model_id, algorithm_id)
);

CREATE INDEX IF NOT EXISTS idx_hw_model_algorithms_model ON hardware_model_algorithms (model_id);

CREATE TABLE IF NOT EXISTS hardware_spec_definitions (
    id         BIGSERIAL PRIMARY KEY,
    kind_id    BIGINT  NOT NULL REFERENCES hardware_kinds (id) ON DELETE CASCADE,
    key        TEXT    NOT NULL,
    label      TEXT    NOT NULL,
    unit       TEXT    NOT NULL DEFAULT '',
    sort_order INTEGER NOT NULL DEFAULT 100,
    is_visible BOOLEAN NOT NULL DEFAULT TRUE,
    UNIQUE (kind_id, key)
);

CREATE TABLE IF NOT EXISTS organization_hardware_models (
    organization_id INT NOT NULL REFERENCES catalog_organizations (id) ON DELETE CASCADE,
    model_id        BIGINT NOT NULL REFERENCES hardware_models (id) ON DELETE CASCADE,
    price           NUMERIC(14, 2),
    in_stock        BOOLEAN NOT NULL DEFAULT TRUE,
    PRIMARY KEY (organization_id, model_id)
);

CREATE INDEX IF NOT EXISTS idx_org_hw_models_model ON organization_hardware_models (model_id);

CREATE TABLE IF NOT EXISTS market_stats (
    coin_id          BIGINT PRIMARY KEY REFERENCES hardware_coins (id) ON DELETE CASCADE,
    price_usdt       NUMERIC(24, 8),
    difficulty       NUMERIC(40, 4),
    block_reward     NUMERIC(24, 12),
    network_hashrate NUMERIC(40, 4),
    block_time_sec   INTEGER,
    updated_at       TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS fx_rates (
    pair       TEXT PRIMARY KEY,
    rate       NUMERIC(20, 8) NOT NULL,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);


-- ---------------------------------------------------------------------
-- Seed справочников
-- ---------------------------------------------------------------------
INSERT INTO hardware_kinds (slug, title, picker_hint, empty_hint, sort_order) VALUES
    ('asic', 'ASIC', 'Модель ASIC-майнера', 'Выберите модель ASIC, чтобы рассчитать доходность', 10),
    ('gpu',  'GPU',  'Выберите Модель GPU', 'Выберите модель GPU, чтобы рассчитать доходность',  20),
    ('cpu',  'CPU',  'Выберите Модель CPU', 'Выберите модель CPU, чтобы рассчитать доходность',  30)
ON CONFLICT (slug) DO UPDATE
    SET title = EXCLUDED.title,
        picker_hint = EXCLUDED.picker_hint,
        empty_hint = EXCLUDED.empty_hint,
        sort_order = EXCLUDED.sort_order;

INSERT INTO hardware_vendors (slug, title) VALUES
    ('microbt', 'Microbt Whatsminer'), ('bitmain', 'Bitmain Antminer'),
    ('canaan', 'Canaan Avalon'),       ('goldshell', 'Goldshell'),
    ('innosilicon', 'Innosilicon'),    ('ipollo', 'ipollo'),
    ('jasminer', 'Jasminer'),          ('beeminer', 'BeeMiner'),
    ('hummer', 'Hummer'),              ('amd', 'AMD'),
    ('nvidia', 'NVIDIA'),              ('intel', 'INTEL')
ON CONFLICT (slug) DO UPDATE SET title = EXCLUDED.title;

INSERT INTO hardware_kind_vendors (kind_id, vendor_id, sort_order)
SELECT k.id, v.id, x.ord
FROM (VALUES
        ('asic', 'microbt', 10), ('asic', 'bitmain', 20), ('asic', 'canaan', 30),
        ('asic', 'goldshell', 40), ('asic', 'innosilicon', 50), ('asic', 'ipollo', 60),
        ('asic', 'jasminer', 70), ('asic', 'beeminer', 80), ('asic', 'hummer', 90),
        ('gpu', 'amd', 10), ('gpu', 'nvidia', 20), ('gpu', 'intel', 30),
        ('cpu', 'amd', 10), ('cpu', 'intel', 20)
     ) AS x(kind_slug, vendor_slug, ord)
JOIN hardware_kinds k ON k.slug = x.kind_slug
JOIN hardware_vendors v ON v.slug = x.vendor_slug
ON CONFLICT (kind_id, vendor_id) DO UPDATE SET sort_order = EXCLUDED.sort_order;

INSERT INTO hardware_algorithms (slug, title, sort_order) VALUES
    ('sha256', 'SHA-256', 10),
    ('scrypt', 'Scrypt', 20),
    ('kawpow', 'KawPow', 30),
    ('etchash', 'Etchash', 40),
    ('ethash', 'Ethash', 45),
    ('autolykos', 'Autolykos2', 50),
    ('randomx', 'RandomX', 60)
ON CONFLICT (slug) DO UPDATE SET title = EXCLUDED.title;

INSERT INTO hardware_coins (algorithm_id, ticker, title, coingecko_id, sort_order)
SELECT a.id, x.ticker, x.title, x.cg, x.ord
FROM (VALUES
        ('sha256', 'BTC', 'Bitcoin', 'bitcoin', 10),
        ('sha256', 'BCH', 'Bitcoin Cash', 'bitcoin-cash', 20),
        ('scrypt', 'LTC', 'Litecoin', 'litecoin', 30),
        ('kawpow', 'RVN', 'Ravencoin', 'ravencoin', 40),
        ('etchash', 'ETC', 'Ethereum Classic', 'ethereum-classic', 50),
        ('autolykos', 'ERG', 'Ergo', 'ergo', 60),
        ('randomx', 'XMR', 'Monero', 'monero', 70)
     ) AS x(algo_slug, ticker, title, cg, ord)
JOIN hardware_algorithms a ON a.slug = x.algo_slug
ON CONFLICT (ticker) DO UPDATE
    SET title = EXCLUDED.title,
        coingecko_id = EXCLUDED.coingecko_id;

INSERT INTO hardware_spec_definitions (kind_id, key, label, unit, sort_order)
SELECT k.id, x.key, x.label, x.unit, x.ord
FROM (VALUES
        ('asic', 'noise_db', 'Уровень шума', 'dB', 10),
        ('asic', 'weight_kg', 'Вес', 'кг', 20),
        ('asic', 'cooling', 'Охлаждение', '', 30),
        ('gpu', 'vram_gb', 'Видеопамять', 'GB', 10),
        ('gpu', 'memory_type', 'Тип памяти', '', 20),
        ('gpu', 'tdp_watts', 'Паспортный TDP', 'Вт', 30),
        ('cpu', 'cores', 'Ядер', '', 10),
        ('cpu', 'threads', 'Потоков', '', 20),
        ('cpu', 'l3_cache_mb', 'Кэш L3', 'MB', 30)
     ) AS x(kind_slug, key, label, unit, ord)
JOIN hardware_kinds k ON k.slug = x.kind_slug
ON CONFLICT (kind_id, key) DO UPDATE SET label = EXCLUDED.label, unit = EXCLUDED.unit;

INSERT INTO fx_rates (pair, rate) VALUES
    ('USDT-RUB', 76.89),
    ('BTC-USDT', 60366)
ON CONFLICT (pair) DO UPDATE SET rate = EXCLUDED.rate, updated_at = NOW();

INSERT INTO hardware_models (
    kind_id, vendor_id, slug, name, released_at, price_default, is_published, sort_order
)
SELECT k.id, v.id, x.slug, x.name, make_date(x.year, 1, 1), x.price, TRUE, x.ord
FROM (VALUES
    ('asic', 'microbt', 'whatsminer-m70-214t', 'Whatsminer M70 214 TH/s', 2025, 1200000, 1),
    ('asic', 'microbt', 'whatsminer-m60s-186t', 'Whatsminer M60S 186 TH/s', 2024, 980000, 2),
    ('asic', 'bitmain', 'antminer-s21-200t', 'Antminer S21 200 TH/s', 2024, 1150000, 3),
    ('asic', 'bitmain', 'antminer-s19-xp-140t', 'Antminer S19 XP 140 TH/s', 2023, 750000, 4),
    ('asic', 'canaan', 'avalon-a1566-185t', 'Avalon A1566 185 TH/s', 2024, 900000, 5),
    ('cpu', 'amd', 'ryzen-9-7950x3d', 'Ryzen 9 7950X3D', 2023, 120000, 10),
    ('cpu', 'amd', 'ryzen-9-7900x', 'Ryzen 9 7900', 2023, 95000, 11),
    ('cpu', 'amd', 'ryzen-9-5950x', 'Ryzen 9 5950X', 2020, 65000, 12),
    ('cpu', 'amd', 'ryzen-9-5900x', 'Ryzen 9 5900X', 2020, 55000, 13),
    ('gpu', 'nvidia', 'rtx-4090', 'GeForce RTX 4090', 2022, 220000, 20),
    ('gpu', 'nvidia', 'rtx-3080', 'GeForce RTX 3080', 2020, 90000, 21),
    ('gpu', 'amd', 'rx-7900-xtx', 'Radeon RX 7900 XTX', 2022, 110000, 22)
) AS x(kind_slug, vendor_slug, slug, name, year, price, ord)
JOIN hardware_kinds k ON k.slug = x.kind_slug
JOIN hardware_vendors v ON v.slug = x.vendor_slug
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    price_default = EXCLUDED.price_default,
    sort_order = EXCLUDED.sort_order;

INSERT INTO hardware_model_algorithms (model_id, algorithm_id, hashrate, hashrate_unit, power_watts, is_primary)
SELECT hm.id, a.id, x.hashrate, x.unit, x.power, TRUE
FROM (VALUES
    ('whatsminer-m70-214t', 'sha256', 214, 'TH/s', 3103),
    ('whatsminer-m60s-186t', 'sha256', 186, 'TH/s', 3441),
    ('antminer-s21-200t', 'sha256', 200, 'TH/s', 3500),
    ('antminer-s19-xp-140t', 'sha256', 140, 'TH/s', 3010),
    ('avalon-a1566-185t', 'sha256', 185, 'TH/s', 3420),
    ('ryzen-9-7950x3d', 'randomx', 18.5, 'KH/s', 120),
    ('ryzen-9-7900x', 'randomx', 16.2, 'KH/s', 120),
    ('ryzen-9-5950x', 'randomx', 14.8, 'KH/s', 105),
    ('ryzen-9-5900x', 'randomx', 13.5, 'KH/s', 105),
    ('rtx-4090', 'etchash', 128.5, 'MH/s', 450),
    ('rtx-3080', 'etchash', 48.2, 'MH/s', 320),
    ('rx-7900-xtx', 'etchash', 52.1, 'MH/s', 355)
) AS x(model_slug, algo_slug, hashrate, unit, power)
JOIN hardware_models hm ON hm.slug = x.model_slug
JOIN hardware_algorithms a ON a.slug = x.algo_slug
ON CONFLICT (model_id, algorithm_id) DO NOTHING;

INSERT INTO market_stats (coin_id, difficulty, block_reward, updated_at)
SELECT hc.id, 500977796816.0, 0.000000000037, NOW()
FROM hardware_coins hc
WHERE hc.ticker = 'BTC'
ON CONFLICT (coin_id) DO UPDATE
    SET difficulty = EXCLUDED.difficulty,
        block_reward = EXCLUDED.block_reward,
        updated_at = NOW();

INSERT INTO organization_hardware_models (organization_id, model_id, in_stock)
SELECT o.id, hm.id, TRUE
FROM catalog_organizations o
JOIN hardware_models hm ON hm.slug LIKE 'whatsminer-m70%'
WHERE o.slug = 'r7miner'
ON CONFLICT (organization_id, model_id) DO NOTHING;

INSERT INTO entity_links (from_type, from_id, to_type, to_id, relation, sort_order)
SELECT 'organization', ohm.organization_id, 'hardware_model', ohm.model_id, 'sells', 100
FROM organization_hardware_models ohm
ON CONFLICT (from_type, from_id, to_type, to_id, relation) DO NOTHING;
