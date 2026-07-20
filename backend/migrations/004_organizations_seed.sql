SET client_encoding = 'UTF8';

ALTER TABLE catalog_organizations
    ADD COLUMN IF NOT EXISTS card_tags TEXT[] NOT NULL DEFAULT '{}',
    ADD COLUMN IF NOT EXISTS card_features TEXT[] NOT NULL DEFAULT '{}',
    ADD COLUMN IF NOT EXISTS card_promo TEXT NOT NULL DEFAULT '',
    ADD COLUMN IF NOT EXISTS logo_theme TEXT NOT NULL DEFAULT '',
    ADD COLUMN IF NOT EXISTS detail_logo_url TEXT NOT NULL DEFAULT '',
    ADD COLUMN IF NOT EXISTS phone TEXT NOT NULL DEFAULT '',
    ADD COLUMN IF NOT EXISTS show_gallery BOOLEAN NOT NULL DEFAULT TRUE,
    ADD COLUMN IF NOT EXISTS show_article_block BOOLEAN NOT NULL DEFAULT TRUE,
    ADD COLUMN IF NOT EXISTS site_city TEXT NOT NULL DEFAULT '',
    ADD COLUMN IF NOT EXISTS verified_mining_registry BOOLEAN NOT NULL DEFAULT FALSE,
    ADD COLUMN IF NOT EXISTS referral_program_url TEXT NOT NULL DEFAULT '',
    ADD COLUMN IF NOT EXISTS referral_promo_text TEXT NOT NULL DEFAULT '';

SET client_encoding = 'UTF8';

UPDATE catalog_organizations
SET
    description = 'Продажа ASIC-майнеров, майнинг-отель и сервис под ключ.',
    tagline = 'Продажа ASIC, размещение и сервис',
    page_title = 'TTM MINING COMPANY (ТТМ): продажа ASIC-майнеров, майнинг-отель, сервис, доставка, отзывы',
    founded_year = 2024,
    website = 'https://www.avito.ru/brands/65714c2f1e8e18cdd3296d902515deb1',
    email = 'to_the_moon@internet.ru',
    work_hours = 'Пн-Пт с 10 до 19',
    verified_contracts = FALSE,
    verified_legal_entity = FALSE,
    has_public_rating = FALSE,
    rating = 0,
    review_count = 0,
    about_html = $html$
<p>TTM MINING COMPANY – российская компания, работающая в сфере поставок, размещения и сервисного обслуживания ASIC-майнеров. Компания помогает клиентам закрывать задачи майнинга под ключ: от подбора оборудования и организации доставки до размещения устройств в дата-центрах, технического сопровождения и настройки условий под масштаб бизнеса.</p>
<p>TTM MINING COMPANY поставляет ASIC-майнеры по России и за рубеж, работает с популярными моделями Bitmain, Whatsminer, IceRiver, Jasminer и других производителей. Для клиентов, которым важно снизить операционные хлопоты, компания предлагает размещение оборудования на майнинг-площадках с охраной, видеонаблюдением, технической поддержкой и обслуживанием.</p>
<p>Компания ориентируется на персональный подход: условия сотрудничества подбираются под задачи клиента, количество устройств, формат оплаты и требования к размещению. Такой формат подходит как для частных майнеров, так и для компаний, которые развивают промышленный майнинг.</p>
<p><strong>Особенности хостинга TTM MINING COMPANY</strong></p>
<p>TTM MINING COMPANY предоставляет размещение ASIC-майнеров в майнинг-отелях в Москве, Казани и Санкт-Петербурге. Доступно размещение от 5 устройств, тариф за электроэнергию – от 3 до 5,5 руб. за кВт/ч, стоимость размещения – от 4 до 6 руб. Компания работает с воздушным, водяным и иммерсионным охлаждением, а техническое обслуживание включено в тариф.</p>
$html$,
    updated_at = NOW()
WHERE slug = 'ttm-mining';

UPDATE organization_addresses
SET
    city = 'Москва',
    address_line = '109004, город Москва, ул. Александра Солженицына, д. 27, помещ. 1/2'
WHERE organization_id = (SELECT id FROM catalog_organizations WHERE slug = 'ttm-mining');

INSERT INTO organization_equipment_sales (
    organization_id, equipment_type, equipment_condition, sales_volume, availability, extras
)
SELECT o.id,
    'ASIC-майнеры',
    'Новое и БУ',
    'Розница; ОПТ',
    'В наличии и под заказ',
    ARRAY['Доставка по России и миру', 'Подбор ASIC под задачи', 'Гибкие условия сотрудничества']
FROM catalog_organizations o
WHERE o.slug = 'ttm-mining'
ON CONFLICT (organization_id) DO UPDATE SET
    equipment_type = EXCLUDED.equipment_type,
    equipment_condition = EXCLUDED.equipment_condition,
    sales_volume = EXCLUDED.sales_volume,
    availability = EXCLUDED.availability,
    extras = EXCLUDED.extras;

INSERT INTO organization_mining_hotels (
    organization_id, price_per_kwh_from, price_per_kwh_label,
    sites_count, total_capacity_mw, site_cities, min_devices_label, energy_type
)
SELECT o.id, 6.2, 'от 6,2 ₽', 3, 60, 'Москва; Казань; Санкт-Петербург', 'от 5 устройств', 'Электросети'
FROM catalog_organizations o
WHERE o.slug = 'ttm-mining'
ON CONFLICT (organization_id) DO UPDATE SET
    price_per_kwh_from = EXCLUDED.price_per_kwh_from,
    price_per_kwh_label = EXCLUDED.price_per_kwh_label,
    sites_count = EXCLUDED.sites_count,
    total_capacity_mw = EXCLUDED.total_capacity_mw,
    site_cities = EXCLUDED.site_cities,
    min_devices_label = EXCLUDED.min_devices_label,
    energy_type = EXCLUDED.energy_type;

INSERT INTO organization_payment_terms (
    organization_id, payment_methods, payment_formats, extra_terms, contract_forms
)
SELECT o.id,
    ARRAY['Без НДС', 'С НДС'],
    ARRAY['Оплата криптовалютой', 'Наличными', 'Безналичная'],
    ARRAY['Постоплата', 'Частичная предоплата', 'Предоплата', 'Лизинг'],
    ARRAY['Договор с ИП', 'Договор с ООО']
FROM catalog_organizations o
WHERE o.slug = 'ttm-mining'
ON CONFLICT (organization_id) DO UPDATE SET
    payment_methods = EXCLUDED.payment_methods,
    payment_formats = EXCLUDED.payment_formats,
    extra_terms = EXCLUDED.extra_terms,
    contract_forms = EXCLUDED.contract_forms;

INSERT INTO organization_legal_profiles (
    organization_id, legal_name, primary_activity, ogrn, inn, registered_at,
    legal_address, authorized_capital, reliability,
    defendant_cases, revenue, profit, tax_debt, in_sanctions_lists, sanctions_restrictions
)
SELECT o.id,
    'Общество с ограниченной ответственностью "ТТМ" (ООО "ТТМ")',
    'Торговля оптовая компьютерами, периферийными устройствами к компьютерам и программным обеспечением (46.51)',
    '1247700565530',
    '9709114854',
    '2024-08-21',
    '109004, город Москва, ул. Александра Солженицына, д. 27, помещ. 1/2',
    '10000',
    'НИЗКАЯ',
    '',
    '',
    '',
    '',
    '',
    ''
FROM catalog_organizations o
WHERE o.slug = 'ttm-mining'
ON CONFLICT (organization_id) DO UPDATE SET
    legal_name = EXCLUDED.legal_name,
    primary_activity = EXCLUDED.primary_activity,
    ogrn = EXCLUDED.ogrn,
    inn = EXCLUDED.inn,
    registered_at = EXCLUDED.registered_at,
    legal_address = EXCLUDED.legal_address,
    authorized_capital = EXCLUDED.authorized_capital,
    reliability = EXCLUDED.reliability,
    defendant_cases = EXCLUDED.defendant_cases,
    revenue = EXCLUDED.revenue,
    profit = EXCLUDED.profit,
    tax_debt = EXCLUDED.tax_debt,
    in_sanctions_lists = EXCLUDED.in_sanctions_lists,
    sanctions_restrictions = EXCLUDED.sanctions_restrictions;

INSERT INTO organization_gallery_images (organization_id, image_url, image_alt, sort_order)
SELECT o.id,
    '/images/catalog/ttm-mining-hero.png',
    'TTM MINING COMPANY — брендовый блок',
    1
FROM catalog_organizations o
WHERE o.slug = 'ttm-mining'
  AND NOT EXISTS (
      SELECT 1 FROM organization_gallery_images g
      WHERE g.organization_id = o.id AND g.image_url = '/images/catalog/ttm-mining-hero.png'
  );

SET client_encoding = 'UTF8';

UPDATE catalog_organizations SET slug = 'algoritm' WHERE name = 'Algoritm';
UPDATE catalog_organizations SET slug = 'mining-center' WHERE name = 'Mining center';
UPDATE catalog_organizations SET slug = 'gis-mining' WHERE name = 'GIS Mining';
UPDATE catalog_organizations SET slug = 'ibmm' WHERE name = 'IBMM';

-- ALGORITM
UPDATE catalog_organizations
SET
    founded_year = 2007,
    office_city = 'Москва',
    has_public_rating = FALSE,
    verified_contracts = TRUE,
    verified_legal_entity = TRUE,
    card_tags = ARRAY[
        'Счет на оплату: С НДС',
        'Состояние: Новые',
        'Объем продаж: Оптом',
        'Наличие: Под заказ'
    ],
    card_features = ARRAY[
        'Доступна поставка без аванса',
        'Рассрочка под залог BTC'
    ],
    updated_at = NOW()
WHERE slug = 'algoritm';

-- MINING CENTER
UPDATE catalog_organizations
SET
    founded_year = 2017,
    has_public_rating = FALSE,
    verified_contracts = FALSE,
    verified_legal_entity = FALSE,
    card_tags = ARRAY[
        'Счет на оплату: Без НДС',
        'Состояние: Новое',
        'Объем продаж: Розница, Опт',
        'Наличие: Наличие на складе, Поставка'
    ],
    card_features = ARRAY[
        'Оплата в USDT',
        'Рассрочка 50%',
        'Прямые поставки с Китая'
    ],
    updated_at = NOW()
WHERE slug = 'mining-center';

-- R7MINER
UPDATE catalog_organizations
SET
    office_city = 'Москва',
    card_tags = ARRAY[
        'Счет на оплату: С НДС',
        'Состояние: Новое',
        'Объем продаж: Розница, Опт',
        'Наличие: Под заказ'
    ],
    card_features = ARRAY[
        'Прямые поставки',
        'Гарантия по договору',
        'Белый ввоз'
    ],
    updated_at = NOW()
WHERE slug = 'r7miner';

-- TTM MINING
UPDATE catalog_organizations
SET
    founded_year = 2024,
    office_city = 'Москва',
    has_public_rating = FALSE,
    verified_contracts = TRUE,
    verified_legal_entity = FALSE,
    card_tags = ARRAY[
        'Состояние: Новое и БУ',
        'Объем продаж: Розница; ОПТ',
        'Наличие: В наличии и под заказ'
    ],
    card_features = ARRAY[
        'Доставка по России и миру',
        'Bitmain, Whatsminer, IceRiver, Jasminer',
        'ASIC-майнеры в наличии',
        'Гибкие условия оплаты'
    ],
    updated_at = NOW()
WHERE slug = 'ttm-mining';

-- GIS MINING
UPDATE catalog_organizations
SET
    founded_year = 2019,
    rating = 4.8,
    review_count = 146,
    has_public_rating = TRUE,
    verified_contracts = TRUE,
    verified_legal_entity = TRUE,
    card_tags = '{}',
    card_features = '{}',
    updated_at = NOW()
WHERE slug = 'gis-mining';

-- IBMM
UPDATE catalog_organizations
SET
    founded_year = 2017,
    rating = 4.8,
    review_count = 486,
    has_public_rating = TRUE,
    verified_contracts = TRUE,
    verified_legal_entity = TRUE,
    card_tags = '{}',
    card_features = '{}',
    updated_at = NOW()
WHERE slug = 'ibmm';

INSERT INTO organization_equipment_sales (
    organization_id, equipment_type, equipment_condition, sales_volume, availability, extras
)
SELECT o.id, v.equipment_type, v.equipment_condition, v.sales_volume, v.availability, v.extras
FROM catalog_organizations o
JOIN (
    VALUES
        ('algoritm', 'ASIC', 'Новые', 'Оптом', 'Под заказ', ARRAY['Доступна поставка без аванса', 'Рассрочка под залог BTC']::TEXT[]),
        ('mining-center', 'ASIC', 'Новое', 'Розница, Опт', 'Наличие на складе, Поставка', ARRAY['Оплата в USDT', 'Рассрочка 50%', 'Прямые поставки с Китая']::TEXT[]),
        ('r7miner', 'ASIC', 'Новое', 'Розница, Опт', 'Под заказ', ARRAY['Прямые поставки', 'Гарантия по договору', 'Белый ввоз']::TEXT[])
) AS v(slug, equipment_type, equipment_condition, sales_volume, availability, extras)
    ON o.slug = v.slug
ON CONFLICT (organization_id) DO UPDATE SET
    equipment_type = EXCLUDED.equipment_type,
    equipment_condition = EXCLUDED.equipment_condition,
    sales_volume = EXCLUDED.sales_volume,
    availability = EXCLUDED.availability,
    extras = EXCLUDED.extras;

UPDATE organization_equipment_sales es
SET extras = ARRAY[
    'Доставка по России и миру',
    'Bitmain, Whatsminer, IceRiver, Jasminer',
    'ASIC-майнеры в наличии',
    'Гибкие условия оплаты'
]
FROM catalog_organizations o
WHERE es.organization_id = o.id AND o.slug = 'ttm-mining';

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
    verified_contracts = FALSE,
    verified_legal_entity = FALSE,
    verified_mining_registry = FALSE,
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
    verified_contracts = FALSE,
    verified_legal_entity = FALSE,
    verified_mining_registry = FALSE,
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
        ('majning-otel-gtes-tereshkovo-moskva', 5.3, '5.3', 1, 17, 'Москва', '10', 'Сети'),
        ('afm-hotel', 5.8, 'от 5,8₽ кВт/ч', 1, 3.5, 'Москва', 'от 1 устройства', 'Теплоэнергетика'),
        ('bitbird', 5.9, 'от 5,9₽ кВт/ч', 1, 8, 'г. Липецк', 'от 1 устройства', 'Ядерная')
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
            '/images/catalog/afm-hotel.png',
            'Майнинг-отель с размещением ASIC и технической поддержкой.',
            0::NUMERIC,
            0,
            8,
            2018,
            'Москва',
            FALSE,
            FALSE,
            FALSE,
            FALSE,
            ARRAY['Цена за кВт/ч от 5,8₽ кВт/ч', 'Мощности площадок: 3.5 МВт']::TEXT[],
            '{}'::TEXT[]
        ),
        (
            'BitBird',
            'bitbird',
            '/images/catalog/bitbird.png',
            'Майнинг-отель и комплексные решения для майнинга.',
            0::NUMERIC,
            5,
            9,
            2021,
            'г. Липецк',
            TRUE,
            FALSE,
            FALSE,
            FALSE,
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
        ('afm-hotel', 5.8, 'от 5,8₽ кВт/ч', 1, 3.5, 'Москва', 'от 1 устройства', 'Теплоэнергетика'),
        ('bitbird', 5.9, 'от 5,9₽ кВт/ч', 1, 8, 'г. Липецк', 'от 1 устройства', 'Ядерная')
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

SET client_encoding = 'UTF8';

-- 1-MINING (майнинг-отель)
UPDATE catalog_organizations
SET
    slug = '1-mining',
    founded_year = 2019,
    office_city = 'Ленинградская область',
    site_city = 'Ленинградская обл.',
    has_public_rating = FALSE,
    verified_contracts = TRUE,
    verified_legal_entity = TRUE,
    verified_mining_registry = TRUE,
    card_tags = ARRAY[
        'Цена за кВт/ч: от 5 руб с НДС',
        'Мощности площадок: 19 МВт'
    ],
    card_features = ARRAY[
        '20 мин от СПб',
        'Газовая генерация',
        'От 300 кВт'
    ],
    updated_at = NOW()
WHERE name = '1-MINING';

INSERT INTO organization_mining_hotels (
    organization_id, price_per_kwh_from, price_per_kwh_label,
    sites_count, total_capacity_mw, site_cities, min_devices_label, energy_type
)
SELECT o.id, 5, 'от 5 руб с НДС', 1, 19, 'Ленинградская обл.', 'от 300 кВт', 'Газовая генерация'
FROM catalog_organizations o
WHERE o.slug = '1-mining'
ON CONFLICT (organization_id) DO UPDATE SET
    price_per_kwh_from = EXCLUDED.price_per_kwh_from,
    price_per_kwh_label = EXCLUDED.price_per_kwh_label,
    total_capacity_mw = EXCLUDED.total_capacity_mw,
    site_cities = EXCLUDED.site_cities,
    min_devices_label = EXCLUDED.min_devices_label,
    energy_type = EXCLUDED.energy_type;

-- Antpool
UPDATE catalog_organizations
SET
    slug = 'antpool',
    rating = 3.6,
    review_count = 5,
    founded_year = 2015,
    has_public_rating = TRUE,
    card_tags = ARRAY[
        'Комиссия пула: 4%',
        'Добываемые монеты: ETH; LTC; ETHW; BCH; DCRN; DASH; CKB; ETC; ZEC; KDA; HNS; DCR; RVN'
    ],
    card_features = ARRAY['Мобильное приложение'],
    updated_at = NOW()
WHERE name = 'Antpool';

-- Canaan
UPDATE catalog_organizations
SET
    slug = 'canaan',
    founded_year = 2013,
    has_public_rating = FALSE,
    card_tags = ARRAY['Количество моделей: 20+'],
    card_features = '{}',
    updated_at = NOW()
WHERE name = 'Canaan';

-- Криптобиржи
INSERT INTO catalog_organizations (
    category_id, name, slug, logo_url, description, rating, review_count, sort_order,
    founded_year, has_public_rating, card_tags, card_features
)
SELECT
    c.id, v.name, v.slug, v.logo_url, v.description, v.rating, v.review_count, v.sort_order,
    v.founded_year, v.has_public_rating, v.card_tags, v.card_features
FROM catalog_categories c
JOIN (
    VALUES
        ('Binance', 'binance', '/images/catalog/binance.png', 'Крупнейшая криптобиржа.', 4.5, 371, 1, 2016, TRUE,
            ARRAY['Верификация: KYC', 'Коэф. ликвидности: 895']::TEXT[],
            ARRAY['Спот', 'Деривативы', 'Стейкинг', 'P2P', 'Русскоязычная поддержка', 'Поддержка RUB']::TEXT[]),
        ('KuCoin', 'kucoin', '/images/catalog/kucoin.png', 'Криптобиржа с широким выбором монет.', 3.9, 45, 2, 2017, TRUE,
            ARRAY['Коэффициент ликвидности: 610']::TEXT[], '{}'::TEXT[]),
        ('Bybit', 'bybit', '/images/catalog/bybit.png', 'Биржа деривативов и спота.', 4.2, 88, 3, 2018, TRUE,
            ARRAY['Коэффициент ликвидности: 520']::TEXT[], '{}'::TEXT[]),
        ('OKX', 'okx', '/images/catalog/okx.png', 'Глобальная криптобиржа.', 4.0, 62, 4, 2017, TRUE,
            ARRAY['Коэффициент ликвидности: 480']::TEXT[], '{}'::TEXT[]),
        ('HTX', 'htx', '/images/catalog/htx.png', 'Криптобиржа HTX (Huobi).', 3.7, 34, 5, 2013, TRUE,
            ARRAY['Коэффициент ликвидности: 390']::TEXT[], '{}'::TEXT[]),
        ('MEXC', 'mexc', '/images/catalog/mexc.png', 'Биржа с листингом альткоинов.', 3.8, 28, 6, 2018, TRUE,
            ARRAY['Коэффициент ликвидности: 350']::TEXT[], '{}'::TEXT[]),
        ('Gate.io', 'gate-io', '/images/catalog/gate-io.png', 'Мультивалютная биржа.', 3.6, 41, 7, 2013, TRUE,
            ARRAY['Коэффициент ликвидности: 410']::TEXT[], '{}'::TEXT[]),
        ('Bitget', 'bitget', '/images/catalog/bitget.png', 'Биржа копитрейдинга и деривативов.', 4.1, 55, 8, 2018, TRUE,
            ARRAY['Коэффициент ликвидности: 440']::TEXT[], '{}'::TEXT[]),
        ('BingX', 'bingx', '/images/catalog/bingx.png', 'Социальная торговая платформа.', 3.5, 19, 9, 2018, TRUE,
            ARRAY['Коэффициент ликвидности: 280']::TEXT[], '{}'::TEXT[]),
        ('Cryptomus', 'cryptomus', '/images/catalog/cryptomus.png', 'Платёжный шлюз и биржа.', 4.3, 12, 10, 2022, TRUE,
            ARRAY['Коэффициент ликвидности: 210']::TEXT[], '{}'::TEXT[])
) AS v(name, slug, logo_url, description, rating, review_count, sort_order, founded_year, has_public_rating, card_tags, card_features)
    ON c.slug = 'crypto-exchanges'
WHERE NOT EXISTS (SELECT 1 FROM catalog_organizations o WHERE o.slug = v.slug);

-- Криптокошельки
INSERT INTO catalog_organizations (
    category_id, name, slug, logo_url, description, rating, review_count, sort_order,
    founded_year, has_public_rating, card_tags, card_features
)
SELECT
    c.id, v.name, v.slug, v.logo_url, v.description, v.rating, v.review_count, v.sort_order,
    v.founded_year, v.has_public_rating, v.card_tags, v.card_features
FROM catalog_categories c
JOIN (
    VALUES
        ('Coinbase Wallet', 'coinbase-wallet', '/images/catalog/coinbase-wallet.png', 'Некастодиальный кошелёк Coinbase.', 2.5, 2, 1, 2012, TRUE, '{}'::TEXT[], '{}'::TEXT[]),
        ('Trust Wallet', 'trust-wallet', '/images/catalog/trust-wallet.png', 'Мультивалютный мобильный кошелёк.', 2.0, 23, 2, 2017, TRUE, '{}'::TEXT[], '{}'::TEXT[]),
        ('Exodus', 'exodus', '/images/catalog/exodus.png', 'Desktop и mobile кошелёк.', 1.8, 19, 3, 2015, TRUE,
            ARRAY['Поддержка монет: BTC; ETH; SOL; ADA; DOT; XRP; LTC; BCH; DOGE; TRX; AVAX; MATIC; ATOM; XLM; ALGO; FIL; EOS; XTZ; DASH; ZEC; DCR; RVN; CKB; KDA; HNS; ETC; NEAR; APT; SUI; TON']::TEXT[], '{}'::TEXT[]),
        ('Blockchain Wallet', 'blockchain-wallet', '/images/catalog/blockchain-wallet.png', 'Кошелёк Blockchain.com.', 4.1, 25, 4, 2011, TRUE,
            ARRAY['Поддержка монет: BTC; BCH']::TEXT[], '{}'::TEXT[]),
        ('MyEtherWallet', 'myetherwallet', '/images/catalog/myetherwallet.png', 'Кошелёк для Ethereum и EVM-сетей.', 3.0, 1, 5, 2019, TRUE, '{}'::TEXT[], '{}'::TEXT[]),
        ('MetaMask', 'metamask', '/images/catalog/metamask.svg', 'Браузерный кошелёк для Web3.', 2.5, 42, 6, 2015, TRUE, '{}'::TEXT[],
            ARRAY['Мобильное приложение', 'Поддержка NFT']::TEXT[]),
        ('Enjin Wallet', 'enjin-wallet', '/images/catalog/enjin-wallet.png', 'Кошелёк для NFT и игровых активов.', 1.9, 19, 7, 2009, TRUE, '{}'::TEXT[], '{}'::TEXT[]),
        ('Phantom', 'phantom', '/images/catalog/phantom.png', 'Кошелёк для Solana и мультичейн.', 0, 0, 8, 2020, FALSE,
            ARRAY['Поддержка монет: SOL; ETH; BTC; MATIC; SUI; APT; AVAX; BNB; OP; ARB; BASE']::TEXT[], '{}'::TEXT[])
) AS v(name, slug, logo_url, description, rating, review_count, sort_order, founded_year, has_public_rating, card_tags, card_features)
    ON c.slug = 'crypto-wallets'
WHERE NOT EXISTS (SELECT 1 FROM catalog_organizations o WHERE o.slug = v.slug);

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

SET client_encoding = 'UTF8';

ALTER TABLE catalog_organizations
    ADD COLUMN IF NOT EXISTS detail_logo_url TEXT NOT NULL DEFAULT '';

UPDATE catalog_organizations
SET
    logo_url = 'https://top-mining.ru/wp-content/uploads/2026/05/firmennyj-znak-czvetnoj.png',
    detail_logo_url = '/images/catalog/ttm-mining-detail.png',
    updated_at = NOW()
WHERE slug = 'ttm-mining';

SET client_encoding = 'UTF8';

ALTER TABLE catalog_organizations
    ADD COLUMN IF NOT EXISTS phone TEXT NOT NULL DEFAULT '';

UPDATE catalog_organizations
SET
    tagline = 'продажа асик-майнеров',
    page_title = 'ALGORITM (АЛГОРИТМ): продажа асик-майнеров',
    logo_url = 'https://top-mining.ru/wp-content/uploads/2025/07/algoritm-1.png',
    detail_logo_url = '/images/catalog/algoritm-detail.png',
    founded_year = 2007,
    website = 'https://algoritm.mn/',
    phone = '+7 (966) 999-31-82',
    email = 'ceo@algoritm.mn',
    work_hours = '',
    verified_contracts = FALSE,
    verified_legal_entity = TRUE,
    has_public_rating = FALSE,
    rating = 0,
    review_count = 0,
    show_gallery = FALSE,
    show_article_block = FALSE,
    about_html = $html$
<p>Лучшая майнинговая компания 2024 года по версии Crypto Awards. Компания обладает практическим опытом в освоении ПНГ и оптимизации сетевых тарифов. Кроме того, Algoritm обеспечивает самые короткие сроки поставки оборудования — всего 6 рабочих дней.</p>
$html$,
    updated_at = NOW()
WHERE slug = 'algoritm';

DELETE FROM organization_addresses
WHERE organization_id = (SELECT id FROM catalog_organizations WHERE slug = 'algoritm');

INSERT INTO organization_addresses (organization_id, city, address_line, sort_order)
SELECT o.id, 'Москва', 'Москва, Каширское ш, д. 3 к. 2 стр. 12', 1
FROM catalog_organizations o
WHERE o.slug = 'algoritm';

INSERT INTO organization_equipment_sales (
    organization_id, equipment_type, equipment_condition, sales_volume, availability, extras
)
SELECT o.id, 'Любое', 'Новые', 'Оптом', 'Под заказ', ARRAY[]::TEXT[]
FROM catalog_organizations o
WHERE o.slug = 'algoritm'
ON CONFLICT (organization_id) DO UPDATE SET
    equipment_type = EXCLUDED.equipment_type,
    equipment_condition = EXCLUDED.equipment_condition,
    sales_volume = EXCLUDED.sales_volume,
    availability = EXCLUDED.availability,
    extras = EXCLUDED.extras;

INSERT INTO organization_mining_hotels (
    organization_id, price_per_kwh_from, price_per_kwh_label,
    sites_count, total_capacity_mw, site_cities, min_devices_label, energy_type
)
SELECT o.id, 6.1, 'от 6.1 руб', 4, 55,
    'Москва, Абакан, Кемерово, Саратов', '20',
    'сетевая энергетика, собственная генерация'
FROM catalog_organizations o
WHERE o.slug = 'algoritm'
ON CONFLICT (organization_id) DO UPDATE SET
    price_per_kwh_from = EXCLUDED.price_per_kwh_from,
    price_per_kwh_label = EXCLUDED.price_per_kwh_label,
    sites_count = EXCLUDED.sites_count,
    total_capacity_mw = EXCLUDED.total_capacity_mw,
    site_cities = EXCLUDED.site_cities,
    min_devices_label = EXCLUDED.min_devices_label,
    energy_type = EXCLUDED.energy_type;

DELETE FROM organization_payment_terms
WHERE organization_id = (SELECT id FROM catalog_organizations WHERE slug = 'algoritm');

INSERT INTO organization_legal_profiles (
    organization_id, legal_name, primary_activity, ogrn, inn, registered_at,
    legal_address, authorized_capital, reliability,
    defendant_cases, revenue, profit, tax_debt, in_sanctions_lists, sanctions_restrictions
)
SELECT o.id,
    'ОБЩЕСТВО С ОГРАНИЧЕННОЙ ОТВЕТСТВЕННОСТЬЮ "АЛГОРИТМ"',
    'Деятельность по обработке данных, предоставление услуг по размещению информации и связанная с этим деятельность (63.11)',
    '1227700052557',
    '9724070369',
    '2022-02-07',
    '115230, город Москва, Каширское ш, д. 3 к. 2 стр. 12',
    '500 000 руб.',
    'ВЫСОКАЯ',
    '',
    'за 2024 2,2 млрд руб.',
    'за 2024 22 млн руб.',
    '',
    '',
    ''
FROM catalog_organizations o
WHERE o.slug = 'algoritm'
ON CONFLICT (organization_id) DO UPDATE SET
    legal_name = EXCLUDED.legal_name,
    primary_activity = EXCLUDED.primary_activity,
    ogrn = EXCLUDED.ogrn,
    inn = EXCLUDED.inn,
    registered_at = EXCLUDED.registered_at,
    legal_address = EXCLUDED.legal_address,
    authorized_capital = EXCLUDED.authorized_capital,
    reliability = EXCLUDED.reliability,
    defendant_cases = EXCLUDED.defendant_cases,
    revenue = EXCLUDED.revenue,
    profit = EXCLUDED.profit,
    tax_debt = EXCLUDED.tax_debt,
    in_sanctions_lists = EXCLUDED.in_sanctions_lists,
    sanctions_restrictions = EXCLUDED.sanctions_restrictions;

DELETE FROM organization_gallery_images
WHERE organization_id = (SELECT id FROM catalog_organizations WHERE slug = 'algoritm');

SET client_encoding = 'UTF8';

UPDATE catalog_organizations
SET
    tagline = '',
    page_title = 'МАЙНИНГ ОТЕЛЬ «ТЕРЕШКОВО»',
    detail_logo_url = '/images/catalog/tereshkovo-detail.png',
    founded_year = 2017,
    website = '',
    phone = '',
    email = '',
    work_hours = '24/7',
    verified_contracts = TRUE,
    verified_legal_entity = TRUE,
    verified_mining_registry = TRUE,
    has_public_rating = FALSE,
    rating = 0,
    review_count = 0,
    show_gallery = FALSE,
    show_article_block = FALSE,
    about_html = $html$
<p>ГТЭС «Терешково» — это режимный объект газотурбинной электростанции в Москве (центральный регион России), идеально подходящий для промышленного майнинга криптовалют с мощностью 17 МВт и тарифом размещения от 5,4 руб./кВт·ч с НДС. УТП: 100% аптайм (отключения только на плановое обслуживание оборудования) и круглосуточный удаленный мониторинг ферм для максимальной доходности.</p>
<p>Мы являемся оператором майнинговой инфраструктуры, внесенным в официальный реестр майнеров России, что обеспечивает полную юридическую и физическую безопасность вашего оборудования. Все операции ведутся «в белую» — с прозрачными договорами, соблюдением налогового и регуляторного законодательства РФ, без рисков блокировок, штрафов или проверок. Физическая защита на уровне режимного объекта: круглосуточная охрана, видеонаблюдение и контролируемый доступ, исключающие несанкционированный доступ.</p>
<p>Хостинг работает стабильно с 2017 года, подтверждая надежность инфраструктуры для тысяч ASIC-майнеров — выбирайте проверенного партнера для масштабирования ферм без простоев.</p>
$html$,
    updated_at = NOW()
WHERE slug = 'majning-otel-gtes-tereshkovo-moskva';

INSERT INTO organization_mining_hotels (
    organization_id, price_per_kwh_from, price_per_kwh_label,
    sites_count, total_capacity_mw, site_cities, min_devices_label, energy_type
)
SELECT o.id, 5.3, '5.3', 1, 17, 'Москва', '10', 'Сети'
FROM catalog_organizations o
WHERE o.slug = 'majning-otel-gtes-tereshkovo-moskva'
ON CONFLICT (organization_id) DO UPDATE SET
    price_per_kwh_from = EXCLUDED.price_per_kwh_from,
    price_per_kwh_label = EXCLUDED.price_per_kwh_label,
    sites_count = EXCLUDED.sites_count,
    total_capacity_mw = EXCLUDED.total_capacity_mw,
    site_cities = EXCLUDED.site_cities,
    min_devices_label = EXCLUDED.min_devices_label,
    energy_type = EXCLUDED.energy_type;

DELETE FROM organization_payment_terms
WHERE organization_id = (
    SELECT id FROM catalog_organizations WHERE slug = 'majning-otel-gtes-tereshkovo-moskva'
);

INSERT INTO organization_payment_terms (
    organization_id, payment_methods, payment_formats, extra_terms, contract_forms
)
SELECT o.id,
    ARRAY['Безналичная']::TEXT[],
    ARRAY[]::TEXT[],
    ARRAY['В рассрочку', 'Лизинг']::TEXT[],
    ARRAY['Договор с ООО']::TEXT[]
FROM catalog_organizations o
WHERE o.slug = 'majning-otel-gtes-tereshkovo-moskva';

INSERT INTO organization_legal_profiles (
    organization_id, legal_name, primary_activity, ogrn, inn, registered_at,
    legal_address, authorized_capital, reliability,
    defendant_cases, revenue, profit, tax_debt, in_sanctions_lists, sanctions_restrictions
)
SELECT o.id,
    'ОБЩЕСТВО С ОГРАНИЧЕННОЙ ОТВЕТСТВЕННОСТЬЮ "ТОП ТЕХ СЕРВИС"',
    'Деятельность по обработке данных, предоставление услуг по размещению информации и связанная с этим деятельность (63.11)',
    '1257700183520',
    '9715509515',
    '2025-04-17',
    '127106, город Москва, Гостиничная ул, д. 10 к. 5, помещ. 1/1п',
    '10000',
    'НИЗКАЯ',
    '',
    '',
    '',
    '',
    '',
    ''
FROM catalog_organizations o
WHERE o.slug = 'majning-otel-gtes-tereshkovo-moskva'
ON CONFLICT (organization_id) DO UPDATE SET
    legal_name = EXCLUDED.legal_name,
    primary_activity = EXCLUDED.primary_activity,
    ogrn = EXCLUDED.ogrn,
    inn = EXCLUDED.inn,
    registered_at = EXCLUDED.registered_at,
    legal_address = EXCLUDED.legal_address,
    authorized_capital = EXCLUDED.authorized_capital,
    reliability = EXCLUDED.reliability,
    defendant_cases = EXCLUDED.defendant_cases,
    revenue = EXCLUDED.revenue,
    profit = EXCLUDED.profit,
    tax_debt = EXCLUDED.tax_debt,
    in_sanctions_lists = EXCLUDED.in_sanctions_lists,
    sanctions_restrictions = EXCLUDED.sanctions_restrictions;


