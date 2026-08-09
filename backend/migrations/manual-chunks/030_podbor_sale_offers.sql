SET client_encoding = 'UTF8';

-- Sale offers for /podbor-majning-otelya/ «Продажа» carousel.
CREATE TABLE IF NOT EXISTS podbor_sale_offers (
    id              BIGSERIAL PRIMARY KEY,
    slug            TEXT NOT NULL UNIQUE,
    title           TEXT NOT NULL,
    capacity_title  TEXT NOT NULL DEFAULT '',
    price_label     TEXT NOT NULL DEFAULT 'Мощность площадки:',
    price_value     TEXT NOT NULL DEFAULT '',
    location        TEXT NOT NULL DEFAULT '',
    image_url       TEXT NOT NULL DEFAULT '',
    sort_order      INTEGER NOT NULL DEFAULT 0,
    is_published    BOOLEAN NOT NULL DEFAULT TRUE,
    created_at      TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at      TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_podbor_sale_offers_published
    ON podbor_sale_offers (is_published, sort_order);

INSERT INTO podbor_sale_offers (
    slug, title, capacity_title, price_label, price_value, location, image_url, sort_order, is_published
) VALUES
    (
        'sale-moscow-50',
        'Продается площадка 50 МВт в Мск области',
        '50 МВт мощности',
        'Мощность площадки:',
        '50 МВт',
        'Московская область',
        '/images/podbor-majning-otelya/sale/moscow.png',
        10,
        TRUE
    ),
    (
        'sale-moscow-15',
        'Продается площадка 15 МВт в Мск области',
        '15 МВт мощности',
        'Мощность площадки:',
        '15 МВт',
        'Московская область',
        '/images/podbor-majning-otelya/sale/moscow.png',
        20,
        TRUE
    ),
    (
        'sale-tula-10',
        'Продается площадка 10 МВт в Туле',
        '10 МВт мощности',
        'Мощность площадки:',
        '10 МВт',
        'Тула',
        '/images/podbor-majning-otelya/sale/tula.png',
        30,
        TRUE
    ),
    (
        'sale-other-regions',
        'Продается площадка 5+ МВт в регионах',
        '5+ МВт мощности',
        'Мощность площадки:',
        '5+ МВт',
        'Другие регионы РФ',
        '/images/podbor-majning-otelya/sale/other-regions.png',
        40,
        TRUE
    )
ON CONFLICT (slug) DO UPDATE SET
    title = EXCLUDED.title,
    capacity_title = EXCLUDED.capacity_title,
    price_label = EXCLUDED.price_label,
    price_value = EXCLUDED.price_value,
    location = EXCLUDED.location,
    image_url = EXCLUDED.image_url,
    sort_order = EXCLUDED.sort_order,
    is_published = EXCLUDED.is_published,
    updated_at = NOW();
