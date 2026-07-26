-- Consolidated catalog updates (was 025-034).
-- about fill, indexes, org profiles, remove MBTC, Luxor.
SET client_encoding = 'UTF8';


-- ---------------------------------------------------------------------------
-- from 025_fill_empty_about_html.sql
-- ---------------------------------------------------------------------------
-- Fill empty about_html from catalog description so detail pages are not blank.
UPDATE catalog_organizations
SET
    about_html = '<p>' || replace(replace(description, '&', '&amp;'), '<', '&lt;') || '</p>',
    updated_at = NOW()
WHERE
    btrim(COALESCE(about_html, '')) = ''
    AND btrim(COALESCE(description, '')) <> '';


-- ---------------------------------------------------------------------------
-- from 026_articles_feed_indexes.sql
-- ---------------------------------------------------------------------------

CREATE INDEX IF NOT EXISTS articles_topic_feed_idx
    ON articles (topic_id, sort_order, published_at DESC)
    WHERE is_published;

CREATE INDEX IF NOT EXISTS idx_article_blocks_article_position
    ON article_blocks (article_id, position);

CREATE INDEX IF NOT EXISTS idx_entity_links_from_related
    ON entity_links (from_type, from_id, to_type, relation, sort_order);


-- ---------------------------------------------------------------------------
-- from 027_intelion_import.sql
-- ---------------------------------------------------------------------------
-- Intelion Data Systems (mining-hotels)
UPDATE catalog_organizations
SET
    name = 'Intelion Data Systems',
    slug = 'intelion-data-systems',
    tagline = 'продажа, ремонт, размещение',
    page_title = 'INTELION DATA SYSTEMS (ИНТЕЛИОН): продажа, ремонт, размещение',
    detail_logo_url = '/images/catalog/intelion-detail.png',
    logo_url = '/images/catalog/intelion.png',
    logo_theme = 'light',
    founded_year = 2017,
    website = 'https://intelionmine.ru/',
    phone = '+7 (495) 135-24-54',
    email = 'info@intelionmine.ru',
    work_hours = 'Пн-Пт с 10 до 19',
    office_city = 'Москва',
    site_city = 'Удомля',
    domain_registered_at = '2018-10-04',
    -- Рейтинг только из organization_reviews (см. 014_sync_rating_from_reviews).
    rating = 0,
    review_count = 0,
    has_public_rating = FALSE,
    verified_contracts = FALSE,
    verified_legal_entity = FALSE,
    verified_data_center = FALSE,
    verified_mining_registry = FALSE,
    show_gallery = TRUE,
    show_article_block = FALSE,
    description = 'Один из крупнейших участников майнинговой отрасли России, ориентированный в первую очередь на сотрудничество с юридическими лицами.',
    about_html = $html$
<p>Один из крупнейших участников майнинговой отрасли России, ориентированный в первую очередь на сотрудничество с юридическими лицами.</p>
<p>Intelion Data Systems – один из узнаваемых игроков на рынке продаж майнинговой техники, предлагающий не только оборудование, но и услуги по его размещению. Крупнейший участник рынка майнинга в РФ, оказывающий услуги как физическим, так и юридическим лицам: продажа оборудования, хостинг, ремонт асиков.</p>
<p>Крупным клиентам доступен лизинг и гибкие условия работы: помимо продажи оборудования для добычи цифровых активов, это еще и дата-центры для размещения клиентской техники. Intelion Data Systems сотрудничает с ведущими производителями асиков, что позволяет осуществлять продажу на выгодных условиях, а также производить сертифицированное сервисное обслуживание.</p>
<p>Среди инфраструктурных партнеров – АО «Концерн Росэнергоатом» и ООО УК «Сибирская генерирующая компания».</p>
<p>Как ключевой игрок рынка, Intelion активно участвует в создании нормативной базы для промышленного майнинга в РФ, одновременно развивая инновационные технологии искусственного интеллекта для этого сектора.</p>
<p><strong>Купить асик в магазине Intelion Data Systems</strong></p>
<p>Магазин Intelion Data Systems – официальный партнер ведущих производителей асиков. Компания предлагает купить актуальные модели по выгодным ценам напрямую от завода, без лишних посредников. Каждое устройство проходит проверку перед отправкой, что гарантирует надежную работу с первого дня.</p>
<p>Покупая асики здесь, пользователь получает конкурентную цену, официальную гарантию и доступ к сертифицированному сервису.</p>
<p><strong>Хостинг и майнинг-отель Intelion Data Systems</strong></p>
<p>Майнинг-отель Intelion Data Systems предлагает услуги размещения асиков на двух современных хостинговых площадках: в Тверской области рядом с Калининской АЭС (мощность – 32 МВт) и на территории дата-центра АО «Тулачермет».</p>
<p>Клиентам хостинга Intelion Data Systems доступны надежная система охраны, стабильный up-time до 99,4%, круглосуточная техническая поддержка и возможность страхования оборудования. Перед размещением можно лично осмотреть площадку, записавшись на экскурсию.</p>
<p><strong>Сервисный центр Intelion Data Systems</strong></p>
<p>Intelion Data Systems оказывает услуги быстрого и качественного ремонта асиков с использованием оригинальных запчастей. Сервисный центр обслуживает продукцию брендов Bitmain, Whatsminer, Innosilicon и т.д. Предоставляется гарантия на ремонт асиков, прозрачные сроки и восстановление майнеров до полной работоспособности.</p>
$html$,
    card_tags = ARRAY[
        'Цена за кВт/ч: от 6,2₽ кВт/ч',
        'Мощности площадок: 21.6 МВт'
    ],
    card_features = ARRAY[
        'Площадки: 2',
        'Энергия: ядерная',
        'Uptime до 99,4%'
    ],
    updated_at = NOW()
WHERE name = 'Intelion Data Systems'
   OR slug = 'intelion-data-systems';

DELETE FROM organization_addresses
WHERE organization_id = (SELECT id FROM catalog_organizations WHERE slug = 'intelion-data-systems');

INSERT INTO organization_addresses (organization_id, city, address_line, sort_order)
SELECT o.id, 'Москва', 'г. Москва, Верхний Михайловский 2-й проезд, дом 9', 0
FROM catalog_organizations o
WHERE o.slug = 'intelion-data-systems';

INSERT INTO organization_mining_hotels (
    organization_id, price_per_kwh_from, price_per_kwh_label,
    sites_count, total_capacity_mw, site_cities, min_devices_label, energy_type, extras
)
SELECT o.id,
    6.2,
    'от 6,2 ₽ кВт/ч',
    2,
    21.6,
    'Удомля',
    'от 5 устройств',
    'Ядерный',
    ARRAY[
        'Охрана площадки',
        'Uptime до 99,4%',
        'Круглосуточная техподдержка',
        'Страхование оборудования',
        'Экскурсия на площадку'
    ]::TEXT[]
FROM catalog_organizations o
WHERE o.slug = 'intelion-data-systems'
ON CONFLICT (organization_id) DO UPDATE SET
    price_per_kwh_from = EXCLUDED.price_per_kwh_from,
    price_per_kwh_label = EXCLUDED.price_per_kwh_label,
    sites_count = EXCLUDED.sites_count,
    total_capacity_mw = EXCLUDED.total_capacity_mw,
    site_cities = EXCLUDED.site_cities,
    min_devices_label = EXCLUDED.min_devices_label,
    energy_type = EXCLUDED.energy_type,
    extras = EXCLUDED.extras;

INSERT INTO organization_legal_profiles (
    organization_id, legal_name, primary_activity, ogrn, inn, registered_at,
    legal_address, authorized_capital, reliability, defendant_cases, revenue,
    profit, tax_debt, in_sanctions_lists, sanctions_restrictions
)
SELECT o.id,
    'ООО "ИНТЕЛИОН МАЙН"',
    'Торговля оптовая компьютерами, периферийными устройствами к компьютерам и программным обеспечением (46.51)',
    '1177746338967',
    '7725365925',
    '2017-04-04',
    '115419, город Москва, 2-Й Верхний Михайловский проезд, д. 9',
    '2 000 000 руб.',
    'Высокая',
    '3 дела на сумму 253 тыс. руб. Не проиграно 1 (34%) Проиграно 1 (33%) Определить не удалось 1 (33%)',
    '1,0 млрд руб. (2022 г.)',
    '15 млн руб. (2022 г.)',
    'Нет',
    'Нет',
    'Вид деятельности под воздействием санкций: 46.51 Торговля оптовая компьютерами, периферийными устройствами к компьютерам и программным обеспечением'
FROM catalog_organizations o
WHERE o.slug = 'intelion-data-systems'
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
WHERE organization_id = (SELECT id FROM catalog_organizations WHERE slug = 'intelion-data-systems');

INSERT INTO organization_gallery_images (organization_id, image_url, image_alt, sort_order)
SELECT o.id, v.image_url, v.image_alt, v.sort_order
FROM catalog_organizations o
JOIN (
    VALUES
        ('/images/catalog/intelion/gallery-01.png', 'Стенд Intelion Data Systems на выставке', 1),
        ('/images/catalog/intelion/gallery-02.png', 'Команда Intelion Data Systems', 2),
        ('/images/catalog/intelion/gallery-03.png', 'Стенд Intelion: лизинг оборудования', 3),
        ('/images/catalog/intelion/gallery-04.png', 'Intelion Data Systems на отраслевом мероприятии', 4)
) AS v(image_url, image_alt, sort_order) ON TRUE
WHERE o.slug = 'intelion-data-systems';


-- ---------------------------------------------------------------------------
-- from 028_mining_center_import.sql
-- ---------------------------------------------------------------------------
-- Mining center (asic-sales)
UPDATE catalog_organizations
SET
    name = 'Mining center',
    slug = 'mining-center',
    tagline = 'Специализированное оборудование для майнинга',
    page_title = 'MINING CENTER: продажа ASIC-майнеров',
    logo_url = '/images/catalog/mining-center.png',
    detail_logo_url = '/images/catalog/mining-center-detail.png',
    logo_theme = 'light',
    founded_year = 2017,
    website = 'https://mining-center.net/',
    description = 'Команда Майнинг центра занимается майнингом, продажей и размещением оборудования на площадях как в Китае, так и в РФ с середины 2017-го года.',
    has_public_rating = FALSE,
    verified_contracts = FALSE,
    verified_legal_entity = FALSE,
    verified_data_center = FALSE,
    verified_mining_registry = FALSE,
    show_gallery = FALSE,
    show_article_block = FALSE,
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
    about_html = $html$
<p>Команда Майнинг центра занимается майнингом, продажей и размещением оборудования на площадях как в Китае, так и в РФ с середины 2017-го года. Мы занимаемся решением таможенных вопросов и споров при транспортировке майнинг-оборудования.</p>
$html$,
    updated_at = NOW()
WHERE slug = 'mining-center'
   OR name = 'Mining center';

INSERT INTO organization_equipment_sales (
    organization_id, equipment_type, equipment_condition, sales_volume, availability, extras
)
SELECT o.id,
    'ASIC',
    'Новое',
    'Розница, Опт',
    'Наличие на складе, Поставка',
    ARRAY[
        'Оплата в USDT',
        'Рассрочка 50%',
        'Прямые поставки с Китая'
    ]::TEXT[]
FROM catalog_organizations o
WHERE o.slug = 'mining-center'
ON CONFLICT (organization_id) DO UPDATE SET
    equipment_type = EXCLUDED.equipment_type,
    equipment_condition = EXCLUDED.equipment_condition,
    sales_volume = EXCLUDED.sales_volume,
    availability = EXCLUDED.availability,
    extras = EXCLUDED.extras;


-- ---------------------------------------------------------------------------
-- from 029_remove_mbtc.sql
-- ---------------------------------------------------------------------------
-- MBTC убран из каталога: организации нет в данных проекта.
DELETE FROM catalog_organizations
WHERE slug = 'mbtc'
   OR name = 'MBTC';


-- ---------------------------------------------------------------------------
-- from 030_ibmm_import.sql
-- ---------------------------------------------------------------------------
-- IBMM (asic-sales + майнинг-отель)
UPDATE catalog_organizations
SET
    name = 'IBMM',
    slug = 'ibmm',
    tagline = 'продажа, размещение, энергорешения',
    page_title = 'IBMM: продажа ASIC, майнинг-отель, дата-центры',
    logo_url = '/images/catalog/ibmm.png',
    detail_logo_url = '/images/catalog/ibmm.png',
    logo_theme = 'dark',
    founded_year = 2017,
    website = 'http://ibmm.ru/',
    phone = '+7 (499) 490-86-20',
    email = 'sales@ibmm.ru',
    work_hours = 'Пн-Пт с 10 до 19',
    office_city = 'Москва',
    site_city = 'Минеральные Воды; Пермь; Пенза; Иркутск; Кострома',
    domain_registered_at = '2017-09-22',
    -- Рейтинг только из organization_reviews
    rating = 0,
    review_count = 0,
    has_public_rating = FALSE,
    verified_contracts = FALSE,
    verified_legal_entity = FALSE,
    verified_data_center = FALSE,
    verified_mining_registry = FALSE,
    show_gallery = TRUE,
    show_article_block = FALSE,
    description = 'Одна из крупнейших компаний в РФ в сфере майнинга криптовалют: продажа асиков, хостинг и энергорешения.',
    about_html = $html$
<p>Одна из крупнейших компаний в РФ, предлагающая свои услуги в сфере майнинга криптовалют. Ключевая особенность IBMM – это максимально гибкий подход к решению задач клиентов: здесь можно купить асики, а также найти множество эффективных форматов для работы в сегменте. Например, разместить оборудование на площадках компании или купить собственную газопоршневую электростанцию. IBMM сотрудничает с ведущими производителями аппаратуры для майнинга, осуществляя оперативную доставку и запуск в собственных дата-центрах. Кроме того, компания предлагает несколько эффективных онлайн-инструментов – это майнинг-калькулятор и конвертор хэшрейта.</p>
$html$,
    card_tags = ARRAY[
        'Цена за кВт/ч: от 6,2₽ кВт/ч',
        'Мощности площадок: 100 МВт'
    ],
    card_features = ARRAY[
        'Площадки: 5',
        'Энергия: газогенерация',
        'Продажа ASIC'
    ],
    updated_at = NOW()
WHERE slug = 'ibmm'
   OR name = 'IBMM';

DELETE FROM organization_addresses
WHERE organization_id = (SELECT id FROM catalog_organizations WHERE slug = 'ibmm');

INSERT INTO organization_addresses (organization_id, city, address_line, sort_order)
SELECT o.id, 'Москва', '127204, Москва МКАД 44 км, 1', 0
FROM catalog_organizations o
WHERE o.slug = 'ibmm';

INSERT INTO organization_mining_hotels (
    organization_id, price_per_kwh_from, price_per_kwh_label,
    sites_count, total_capacity_mw, site_cities, min_devices_label, energy_type, extras
)
SELECT o.id,
    6.2,
    'от 6,2 ₽ кВт/ч',
    5,
    100,
    'Минеральные Воды; Пермь; Пенза; Иркутск; Кострома',
    'от 5 устройств',
    'Газогенерация',
    '{}'::TEXT[]
FROM catalog_organizations o
WHERE o.slug = 'ibmm'
ON CONFLICT (organization_id) DO UPDATE SET
    price_per_kwh_from = EXCLUDED.price_per_kwh_from,
    price_per_kwh_label = EXCLUDED.price_per_kwh_label,
    sites_count = EXCLUDED.sites_count,
    total_capacity_mw = EXCLUDED.total_capacity_mw,
    site_cities = EXCLUDED.site_cities,
    min_devices_label = EXCLUDED.min_devices_label,
    energy_type = EXCLUDED.energy_type,
    extras = EXCLUDED.extras;

INSERT INTO organization_legal_profiles (
    organization_id, legal_name, primary_activity, ogrn, inn, registered_at,
    legal_address, authorized_capital, reliability, defendant_cases, revenue,
    profit, tax_debt, in_sanctions_lists, sanctions_restrictions
)
SELECT o.id,
    'ООО "ИБММ ТЕХНОЛОГИИ"',
    'Торговля оптовая компьютерами, периферийными устройствами к компьютерам и программным обеспечением (46.51)',
    '1215000115230',
    '5032334982',
    '2021-11-15',
    '143009, Московская область, г Одинцово, Северная ул, д. 5 к. 3, кв. 353 ком. 1',
    '50 000 руб.',
    'Средняя',
    'Нет судебных дел',
    '32 млн руб. (2023 г.)',
    '1,1 млн руб. (2023 г.)',
    'Нет',
    'Нет',
    'Вид деятельности под воздействием санкций: 46.51 Торговля оптовая компьютерами, периферийными устройствами к компьютерам и программным обеспечением'
FROM catalog_organizations o
WHERE o.slug = 'ibmm'
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
WHERE organization_id = (SELECT id FROM catalog_organizations WHERE slug = 'ibmm');

INSERT INTO organization_gallery_images (organization_id, image_url, image_alt, sort_order)
SELECT o.id, v.image_url, v.image_alt, v.sort_order
FROM catalog_organizations o
JOIN (
    VALUES
        ('/images/catalog/ibmm/gallery-01.png', 'Стенд IBMM на выставке', 1),
        ('/images/catalog/ibmm/gallery-02.png', 'IBMM: консультация на стенде', 2),
        ('/images/catalog/ibmm/gallery-03.png', 'Команда IBMM на мероприятии', 3),
        ('/images/catalog/ibmm/gallery-04.png', 'IBMM: интервью и оборудование', 4),
        ('/images/catalog/ibmm/gallery-05.png', 'IBMM: работа с клиентами', 5)
) AS v(image_url, image_alt, sort_order) ON TRUE
WHERE o.slug = 'ibmm';


-- ---------------------------------------------------------------------------
-- from 031_pushminer_import.sql
-- ---------------------------------------------------------------------------
-- Pushminer (asic-sales + майнинг-отель)
UPDATE catalog_organizations
SET
    name = 'Pushminer',
    slug = 'pushminer',
    tagline = 'магазин асиков, лизинг, ремонт, сервисный центр, майнинг-отель',
    page_title = 'PUSHMINER (ПУШМАЙНЕР): магазин асиков, лизинг, ремонт, сервисный центр, майнинг-отель',
    logo_url = '/images/catalog/pushminer.png',
    detail_logo_url = '/images/catalog/pushminer-detail.png',
    logo_theme = 'light',
    founded_year = 2017,
    website = 'https://pushminer.ru/',
    phone = '+7 (499) 490-62-77',
    email = 'zakaz@pushminer.ru',
    work_hours = 'Пн-Пт с 10:00 до 19:00',
    office_city = 'Москва',
    site_city = 'Московская область, Нижегородская область, Саратовская область',
    rating = 0,
    review_count = 0,
    has_public_rating = FALSE,
    verified_contracts = TRUE,
    verified_legal_entity = TRUE,
    verified_data_center = FALSE,
    verified_mining_registry = FALSE,
    show_gallery = FALSE,
    show_article_block = FALSE,
    description = 'Интернет-магазин оборудования для майнинга: продажа асиков, лизинг, ремонт, сервис и хостинг.',
    about_html = $html$
<p>Компания Pushminer гарантирует высокое качество сервиса и поддержку на всех этапах взаимодействия: от подбора оборудования до его доставки и настройки. Приобретая устройства в компании, клиенты получают послепродажное сопровождение и гарантийное обслуживание, что делает покупку максимально надежной и выгодной.</p>
<p>Для удобства предусмотрены разные способы оплаты, включая банковский перевод, безналичный расчет, лизинг и кредит. Доставка оборудования осуществляется по Москве и регионам России через проверенные транспортные компании. Pushminer разделяет веру в перспективы криптовалют и стремится сделать инвестиции в майнинг доступными и выгодными для каждого клиента. Есть хостинг для размещения асиков в Московской области.</p>
<p><strong>Купить асик в магазине Pushminer</strong></p>
<p>Pushminer – это интернет-магазин оборудования для майнинга в Москве, работающий в сфере с 2017 года. Компания предлагает купить асик от ведущих производителей, обеспечивая клиентов надежной техникой для добычи криптовалют. В магазине Pushminer можно приобрести как оборудование для небольшой фермы, так и решения для промышленных масштабов, при этом доступна доставка по всей России.</p>
<p>Клиентам предоставляется профессиональная консультация, помощь в подборе техники, гарантийное и послепродажное обслуживание. Благодаря опыту и репутации надежного поставщика Pushminer стал партнером как частных майнеров, так и крупных инвесторов в криптовалютную индустрию. Возможно приобретение на лизинговых условиях.</p>
<p><strong>Ремонт асиков в Pushminer</strong></p>
<p>Pushminer предоставляет услуги профессионального ремонта асиков для клиентов по всей России. Более 1000 пользователей уже доверили компании свое оборудование, а опытные специалисты с практикой работы более 3 лет выполняют диагностику и восстановление техники любой сложности. Каждое устройство проходит бесплатную диагностику, после чего с клиентом согласовываются стоимость и сроки ремонта.</p>
<p>В среднем восстановление занимает 2–3 рабочих дня, а на все выполненные работы предоставляется гарантия 30 дней. Для удобства клиентов предусмотрена возможность доставки оборудования лично или через транспортные компании, а также действует система скидок для оптовых заказов.</p>
$html$,
    card_tags = ARRAY[
        'Цена за кВт/ч: от 5,8₽ кВт/ч',
        'Мощности площадок: 60 МВт'
    ],
    card_features = ARRAY[
        'Площадки: 3',
        'Лизинг и кредит',
        'Ремонт асиков'
    ],
    updated_at = NOW()
WHERE slug = 'pushminer'
   OR name ILIKE 'pushminer%';

DELETE FROM organization_addresses
WHERE organization_id = (SELECT id FROM catalog_organizations WHERE slug = 'pushminer');

INSERT INTO organization_addresses (organization_id, city, address_line, sort_order)
SELECT o.id, 'Москва', 'Москва, Ракетный бульвар 16', 0
FROM catalog_organizations o
WHERE o.slug = 'pushminer';

INSERT INTO organization_equipment_sales (
    organization_id, equipment_type, equipment_condition, sales_volume, availability, extras
)
SELECT o.id,
    'ASIC',
    'Новое',
    'Розница, Опт',
    'Наличие, Поставка',
    ARRAY[
        'Лизинг и кредит',
        'Доставка по России',
        'Гарантийное обслуживание'
    ]::TEXT[]
FROM catalog_organizations o
WHERE o.slug = 'pushminer'
ON CONFLICT (organization_id) DO UPDATE SET
    equipment_type = EXCLUDED.equipment_type,
    equipment_condition = EXCLUDED.equipment_condition,
    sales_volume = EXCLUDED.sales_volume,
    availability = EXCLUDED.availability,
    extras = EXCLUDED.extras;

INSERT INTO organization_mining_hotels (
    organization_id, price_per_kwh_from, price_per_kwh_label,
    sites_count, total_capacity_mw, site_cities, min_devices_label, energy_type, extras
)
SELECT o.id,
    5.8,
    'От 5,8₽',
    3,
    60,
    'Московская область, Нижегородская область, Саратовская область',
    'от 10 устройств',
    'Сетевое и ГПУ',
    '{}'::TEXT[]
FROM catalog_organizations o
WHERE o.slug = 'pushminer'
ON CONFLICT (organization_id) DO UPDATE SET
    price_per_kwh_from = EXCLUDED.price_per_kwh_from,
    price_per_kwh_label = EXCLUDED.price_per_kwh_label,
    sites_count = EXCLUDED.sites_count,
    total_capacity_mw = EXCLUDED.total_capacity_mw,
    site_cities = EXCLUDED.site_cities,
    min_devices_label = EXCLUDED.min_devices_label,
    energy_type = EXCLUDED.energy_type,
    extras = EXCLUDED.extras;

INSERT INTO organization_legal_profiles (
    organization_id, legal_name, primary_activity, ogrn, inn, registered_at,
    legal_address, authorized_capital, reliability, defendant_cases, revenue,
    profit, tax_debt, in_sanctions_lists, sanctions_restrictions
)
SELECT o.id,
    'ООО Новая Линия',
    'Ремонт компьютеров и периферийного компьютерного оборудования',
    '1227700003728',
    '7734449755',
    '2022-01-11',
    '123098, город Москва, ул Гамалеи, д. 19 к. 2, этаж 1, помещ. V комн. 5, оф. 77-6',
    '7 000 000 руб.',
    'Высокая',
    'Нет данных',
    'Нет данных',
    'Нет данных',
    'Нет данных',
    'Нет данных',
    'Нет данных'
FROM catalog_organizations o
WHERE o.slug = 'pushminer'
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


-- ---------------------------------------------------------------------------
-- from 032_tcs_mining_import.sql
-- ---------------------------------------------------------------------------
-- TCS mining (asic-sales + майнинг-отель)
UPDATE catalog_organizations
SET
    name = 'TCS mining',
    slug = 'tcs-mining',
    tagline = 'поставка, майнинг-отель, ремонт, мониторинг',
    page_title = 'TCS mining: поставка ASIC, майнинг-отель, сервис',
    logo_url = '/images/catalog/tcs-mining.png',
    detail_logo_url = '/images/catalog/tcs-mining-detail.png',
    logo_theme = 'light',
    founded_year = 2014,
    website = 'https://tcs-mining.ru/',
    phone = '+7 (495) 748-87-63',
    email = 'asic@telecomstartup.ru',
    work_hours = 'Пн-Пт с 9:00 до 18:00',
    office_city = 'Москва',
    site_city = 'Москва; Владимировская область',
    rating = 0,
    review_count = 0,
    has_public_rating = FALSE,
    verified_contracts = FALSE,
    verified_legal_entity = FALSE,
    verified_data_center = FALSE,
    verified_mining_registry = FALSE,
    show_gallery = FALSE,
    show_article_block = FALSE,
    description = 'Поставка майнинг-оборудования, размещение в собственном майнинг-отеле, ремонт асиков и ПО для мониторинга.',
    about_html = $html$
<p>TCS Mining - компания, которая занимается поставкой майнинг-оборудования, размещением оборудования в собственном майнинг-отеле, предоставлением услуг по ремонту и обслуживанию асиков, а также разработкой собственного ПО для мониторинга. Мы находимся на рынке с 2014 года и имеем обширный опыт работы с майнерами всех уровней - от частных до крупных промышленных. Наша цель - предоставить нашим клиентам наилучший опыт в мире майнинга, поэтому мы постоянно стремимся улучшить наши услуги и расширить нашу продуктовую линейку.</p>
$html$,
    card_tags = ARRAY[
        'Цена за кВт/ч: от 6,4₽ кВт/ч',
        'Мощности площадок: 15 МВт'
    ],
    card_features = ARRAY[
        'Площадки: 2',
        'Энергия: теплоэнергетика',
        'ПО для мониторинга'
    ],
    updated_at = NOW()
WHERE slug = 'tcs-mining'
   OR name ILIKE 'tcs mining%';

DELETE FROM organization_addresses
WHERE organization_id = (SELECT id FROM catalog_organizations WHERE slug = 'tcs-mining');

INSERT INTO organization_addresses (organization_id, city, address_line, sort_order)
SELECT o.id, 'Москва', 'г. Москва, Боровая ул, дом 7, строение 4, этаж 1, помещение 5(1)', 0
FROM catalog_organizations o
WHERE o.slug = 'tcs-mining';

INSERT INTO organization_equipment_sales (
    organization_id, equipment_type, equipment_condition, sales_volume, availability, extras
)
SELECT o.id,
    'ASIC',
    'Новое',
    'Розница, Опт',
    'Поставка',
    ARRAY[
        'Ремонт и обслуживание',
        'ПО для мониторинга'
    ]::TEXT[]
FROM catalog_organizations o
WHERE o.slug = 'tcs-mining'
ON CONFLICT (organization_id) DO UPDATE SET
    equipment_type = EXCLUDED.equipment_type,
    equipment_condition = EXCLUDED.equipment_condition,
    sales_volume = EXCLUDED.sales_volume,
    availability = EXCLUDED.availability,
    extras = EXCLUDED.extras;

INSERT INTO organization_mining_hotels (
    organization_id, price_per_kwh_from, price_per_kwh_label,
    sites_count, total_capacity_mw, site_cities, min_devices_label, energy_type, extras
)
SELECT o.id,
    6.4,
    'от 6.4 ₽ кВт/ч',
    2,
    15,
    'Москва; Владимировская область',
    'от 5 устройств',
    'Теплоэнергетика',
    '{}'::TEXT[]
FROM catalog_organizations o
WHERE o.slug = 'tcs-mining'
ON CONFLICT (organization_id) DO UPDATE SET
    price_per_kwh_from = EXCLUDED.price_per_kwh_from,
    price_per_kwh_label = EXCLUDED.price_per_kwh_label,
    sites_count = EXCLUDED.sites_count,
    total_capacity_mw = EXCLUDED.total_capacity_mw,
    site_cities = EXCLUDED.site_cities,
    min_devices_label = EXCLUDED.min_devices_label,
    energy_type = EXCLUDED.energy_type,
    extras = EXCLUDED.extras;

INSERT INTO organization_legal_profiles (
    organization_id, legal_name, primary_activity, ogrn, inn, registered_at,
    legal_address, authorized_capital, reliability, defendant_cases, revenue,
    profit, tax_debt, in_sanctions_lists, sanctions_restrictions
)
SELECT o.id,
    'ООО "ТКС"',
    'Торговля оптовая компьютерами, периферийными устройствами к компьютерам и программным обеспечением (46.51)',
    '1143327004270',
    '3309004768',
    '2014-08-12',
    '111020, город Москва, Боровая ул., д. 7 стр. 4, этаж 1 помещение 5(1)',
    '10 000 руб.',
    'Высокая',
    '2 дела на сумму 0 руб.',
    '251 млн руб. (2023г.)',
    '551 тыс. руб. (2023г.)',
    'Нет',
    'Нет',
    'Ограничения на экспорт/импорт товаров и технологий оказывают влияние на деятельность всех организаций, ведущих деятельность в затронутых отраслях. 46.51 Торговля оптовая компьютерами, периферийными устройствами к компьютерам и программным обеспечением'
FROM catalog_organizations o
WHERE o.slug = 'tcs-mining'
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


-- ---------------------------------------------------------------------------
-- from 033_rupool_import.sql
-- ---------------------------------------------------------------------------
-- RUPOOL.PRO (mining-pools)
UPDATE catalog_organizations
SET
    name = 'RUPOOL.PRO',
    slug = 'rupool-pro',
    tagline = 'мультипул с ежедневными выплатами в BTC',
    page_title = 'RUPOOL.PRO: майнинг-пул',
    logo_url = '/images/catalog/rupool.png',
    detail_logo_url = '/images/catalog/rupool-detail.png',
    logo_theme = 'dark',
    founded_year = 2019,
    website = 'https://rupool.pro/',
    phone = '',
    email = '',
    work_hours = '',
    office_city = '',
    site_city = '',
    rating = 0,
    review_count = 0,
    has_public_rating = FALSE,
    verified_contracts = TRUE,
    verified_legal_entity = TRUE,
    verified_data_center = FALSE,
    verified_mining_registry = FALSE,
    show_gallery = FALSE,
    show_article_block = FALSE,
    description = 'Мультипул с автопереключением на самые доходные монеты и ежедневными выплатами в BTC.',
    about_html = $html$
<p>RUPOOL.PRO — мультипул с автопереключением на самые доходные монеты и ежедневными выплатами в BTC. Гарантируем доходность не ниже уровня PPS по биткоину (за вычетом комиссии); комиссии сети при выплатах оплачивает пул. Работает более 6 лет, выплачено свыше 466 BTC, больше 8 000 субаккаунтов. Аптайм инфраструктуры — 99,95%. Поддержка — в Telegram и Discord, отвечает 24/7.</p>
<p>Дополнительно: внутри пула действует фирменная бонус-монета COIN — начисляется за майнинг, конвертируется в BTC и выводится на ваш адрес.</p>
$html$,
    card_tags = ARRAY[
        'Комиссия пула: 1%',
        'Выплаты: ежедневно'
    ],
    card_features = ARRAY[
        'Мультипул',
        'Гарантия PPS BTC',
        'Бонус-монета COIN'
    ],
    updated_at = NOW()
WHERE slug = 'rupool-pro'
   OR name ILIKE 'RUPOOL%';

INSERT INTO organization_mining_pools (
    organization_id,
    mobile_app,
    referral_program,
    total_hashrate,
    reward_distribution,
    pool_commission,
    min_payout,
    payout_frequency,
    mined_coins
)
SELECT o.id,
    'Есть',
    'Есть',
    'Не раскрывается публично',
    'Гарантия доходности не ниже PPS BTC',
    '1%',
    '0.001 BTC',
    'ежедневно',
    'BTC; LTC+DOGE'
FROM catalog_organizations o
WHERE o.slug = 'rupool-pro'
ON CONFLICT (organization_id) DO UPDATE SET
    mobile_app = EXCLUDED.mobile_app,
    referral_program = EXCLUDED.referral_program,
    total_hashrate = EXCLUDED.total_hashrate,
    reward_distribution = EXCLUDED.reward_distribution,
    pool_commission = EXCLUDED.pool_commission,
    min_payout = EXCLUDED.min_payout,
    payout_frequency = EXCLUDED.payout_frequency,
    mined_coins = EXCLUDED.mined_coins;


-- ---------------------------------------------------------------------------
-- from 034_luxor_import.sql
-- ---------------------------------------------------------------------------
-- Luxor Mining Pool (mining-pools) — новая организация
INSERT INTO catalog_organizations (
    category_id, name, slug, logo_url, detail_logo_url, logo_theme,
    description, tagline, page_title, founded_year, website,
    phone, email, work_hours, office_city, site_city,
    domain_registered_at, rating, review_count, has_public_rating,
    verified_contracts, verified_legal_entity, verified_data_center, verified_mining_registry,
    show_gallery, show_article_block, about_html, card_tags, card_features, sort_order
)
SELECT
    c.id,
    'Luxor Mining Pool',
    'luxor-mining-pool',
    '/images/catalog/luxor.png',
    '/images/catalog/luxor-detail.png',
    'light',
    'Международный майнинг-пул Luxor: FPPS, ежедневные выплаты, широкий список монет.',
    '',
    'Luxor Mining Pool',
    NULL,
    'https://luxor.tech/',
    '',
    '',
    '',
    '',
    '',
    '2017-07-04',
    0,
    0,
    FALSE,
    TRUE,
    TRUE,
    FALSE,
    FALSE,
    FALSE,
    FALSE,
    $html$
<p>Luxor Mining Pool — международный майнинг-пул с моделью FPPS, ежедневными выплатами и поддержкой широкого набора монет.</p>
$html$,
    ARRAY[
        'Комиссия пула: 0%-3%',
        'Хешрейт: 21.09 Eh/s'
    ],
    ARRAY[
        'FPPS',
        'Ежедневные выплаты',
        'Реферальная программа'
    ],
    COALESCE((SELECT MAX(sort_order) + 1 FROM catalog_organizations WHERE category_id = c.id), 1)
FROM catalog_categories c
WHERE c.slug = 'mining-pools'
  AND NOT EXISTS (
      SELECT 1 FROM catalog_organizations o WHERE o.slug = 'luxor-mining-pool'
  );

UPDATE catalog_organizations
SET
    name = 'Luxor Mining Pool',
    slug = 'luxor-mining-pool',
    tagline = '',
    page_title = 'Luxor Mining Pool',
    logo_url = '/images/catalog/luxor.png',
    detail_logo_url = '/images/catalog/luxor-detail.png',
    logo_theme = 'light',
    founded_year = NULL,
    website = 'https://luxor.tech/',
    phone = '',
    email = '',
    work_hours = '',
    domain_registered_at = '2017-07-04',
    rating = 0,
    review_count = 0,
    has_public_rating = FALSE,
    verified_contracts = TRUE,
    verified_legal_entity = TRUE,
    verified_data_center = FALSE,
    verified_mining_registry = FALSE,
    show_gallery = FALSE,
    show_article_block = FALSE,
    description = 'Международный майнинг-пул Luxor: FPPS, ежедневные выплаты, широкий список монет.',
    about_html = $html$
<p>Luxor Mining Pool — международный майнинг-пул с моделью FPPS, ежедневными выплатами и поддержкой широкого набора монет.</p>
$html$,
    card_tags = ARRAY[
        'Комиссия пула: 0%-3%',
        'Хешрейт: 21.09 Eh/s'
    ],
    card_features = ARRAY[
        'FPPS',
        'Ежедневные выплаты',
        'Реферальная программа'
    ],
    updated_at = NOW()
WHERE slug = 'luxor-mining-pool';

INSERT INTO organization_mining_pools (
    organization_id,
    mobile_app,
    referral_program,
    total_hashrate,
    reward_distribution,
    pool_commission,
    min_payout,
    payout_frequency,
    mined_coins
)
SELECT o.id,
    'Нет',
    'Есть',
    '21.09 Eh/s',
    'FPPS',
    '0%-3%',
    '0.001 BTC',
    'Ежедневно',
    'ETH; BTC; Zcash; Dash; LBRY; ScPrime; Pirate; Komodo; Horizen; Decred; Siacoin'
FROM catalog_organizations o
WHERE o.slug = 'luxor-mining-pool'
ON CONFLICT (organization_id) DO UPDATE SET
    mobile_app = EXCLUDED.mobile_app,
    referral_program = EXCLUDED.referral_program,
    total_hashrate = EXCLUDED.total_hashrate,
    reward_distribution = EXCLUDED.reward_distribution,
    pool_commission = EXCLUDED.pool_commission,
    min_payout = EXCLUDED.min_payout,
    payout_frequency = EXCLUDED.payout_frequency,
    mined_coins = EXCLUDED.mined_coins;

