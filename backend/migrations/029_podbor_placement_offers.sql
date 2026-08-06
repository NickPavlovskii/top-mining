-- Placement offers for /podbor-majning-otelya/ «Размещение» carousel.
CREATE TABLE IF NOT EXISTS podbor_placement_offers (
    id              BIGSERIAL PRIMARY KEY,
    slug            TEXT NOT NULL UNIQUE,
    title           TEXT NOT NULL,
    capacity_title  TEXT NOT NULL DEFAULT '',
    price_label     TEXT NOT NULL DEFAULT 'Цена за кВт/ч:',
    price_value     TEXT NOT NULL DEFAULT '',
    location        TEXT NOT NULL DEFAULT '',
    image_url       TEXT NOT NULL DEFAULT '',
    sort_order      INTEGER NOT NULL DEFAULT 0,
    is_published    BOOLEAN NOT NULL DEFAULT TRUE,
    created_at      TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at      TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_podbor_placement_offers_published
    ON podbor_placement_offers (is_published, sort_order);

INSERT INTO podbor_placement_offers (
    slug, title, capacity_title, price_label, price_value, location, image_url, sort_order, is_published
) VALUES
    (
        'moscow-region',
        'Свободно 40 МВт в Московской области',
        '40 МВт мощности',
        'Цена за кВт/ч:',
        'опт от 4,7₽',
        'Московская область',
        '/images/podbor-majning-otelya/placement/moscow-region.png',
        10,
        TRUE
    ),
    (
        'stupino',
        'Свободно 10 МВт в Ступино',
        '10 МВт мощности',
        'Цена за кВт/ч:',
        'от 5,2₽',
        'Ступино',
        '/images/podbor-majning-otelya/placement/stupino.png',
        20,
        TRUE
    ),
    (
        'domodedovo',
        'Свободно 8 МВт в Домодедово',
        '8 МВт мощности',
        'Цена за кВт/ч:',
        'опт от 5,0₽',
        'Москва',
        '/images/podbor-majning-otelya/placement/domodedovo.png',
        30,
        TRUE
    ),
    (
        'udomlya',
        'Свободно 4 МВт в Удомле',
        '4 МВт мощности',
        'Цена за кВт/ч:',
        'от 5,5₽',
        'Удомля',
        '/images/podbor-majning-otelya/placement/udomlya.png',
        40,
        TRUE
    ),
    (
        'irkutsk',
        'Свободно 10 МВт в Иркутске',
        '10 МВт мощности',
        'Цена за кВт/ч:',
        'от 5,0₽',
        'Иркутск',
        '/images/podbor-majning-otelya/placement/irkutsk.png',
        50,
        TRUE
    ),
    (
        'nizhny',
        'Свободно 20 МВт в Нижегородской области',
        '20 МВт мощности',
        'Цена за кВт/ч:',
        'от 5,3₽',
        'Нижегородская область',
        '/images/podbor-majning-otelya/placement/nizhny.png',
        60,
        TRUE
    ),
    (
        'krasnoyarsk',
        'Свободно 7 МВт в Красноярске',
        '7 МВт мощности',
        'Цена за кВт/ч:',
        'от 5,0₽',
        'Красноярск',
        '/images/podbor-majning-otelya/placement/krasnoyarsk.png',
        70,
        TRUE
    ),
    (
        'other-regions',
        'Другие регионы РФ',
        'Другие регионы РФ',
        'Цена за кВт/ч:',
        'от 4,6₽',
        'Другие регионы РФ',
        '/images/podbor-majning-otelya/placement/other-regions.png',
        80,
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
