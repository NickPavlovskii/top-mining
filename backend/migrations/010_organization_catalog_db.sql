SET client_encoding = 'UTF8';
ALTER TABLE catalog_organizations
    ADD COLUMN IF NOT EXISTS verified_data_center BOOLEAN NOT NULL DEFAULT FALSE;

ALTER TABLE organization_mining_hotels
    ADD COLUMN IF NOT EXISTS extras TEXT[] NOT NULL DEFAULT '{}';

-- AFM Hotel
UPDATE catalog_organizations
SET
    tagline = '',
    page_title = 'AFM HOTEL',
    detail_logo_url = '/images/catalog/afm-hotel-detail.png',
    logo_url = '/images/catalog/afm-hotel.png',
    founded_year = 2018,
    website = 'https://afmhotel.ru/',
    phone = '+7 (495) 155-24-98',
    email = 'Hello@AFMHotel.ru',
    work_hours = 'Пн-Пт с 10:00 до 18:00',
    office_city = 'Москва',
    site_city = 'Москва',
    has_public_rating = FALSE,
    verified_contracts = FALSE,
    verified_legal_entity = FALSE,
    verified_data_center = FALSE,
    verified_mining_registry = FALSE,
    show_gallery = FALSE,
    show_article_block = FALSE,
    about_html = $html$
<p>Наш майнинг отель — это специально оборудованный дата центр для размещения асиков, GPU ферм. В котором мы осуществляем контроль за техническим состоянием и за бесперебойной работой доверенного Вами нам майнинг оборудования. Мы обязуемся: предоставить Вам круглосуточный доступ к размещенному оборудованию, прогнозировать и уведомлять Вас заранее о возможных неисправностях. Предоставляем выбор динамического или статического ip адреса. Всем нашим клиентам мы предоставляем скидку 10 % на покупку асик майнеров в нашем интернет магазине.</p>
$html$,
    card_tags = ARRAY[
        'Цена за кВт/ч от 5,8₽ кВт/ч',
        'Мощности площадок: 3.5 МВт'
    ],
    card_features = '{}',
    updated_at = NOW()
WHERE slug = 'afm-hotel';

DELETE FROM organization_addresses
WHERE organization_id = (SELECT id FROM catalog_organizations WHERE slug = 'afm-hotel');

INSERT INTO organization_addresses (organization_id, city, address_line, sort_order)
SELECT o.id, 'Москва', 'Москва, Ленинградский пр. 47С2', 0
FROM catalog_organizations o
WHERE o.slug = 'afm-hotel';

INSERT INTO organization_mining_hotels (
    organization_id, price_per_kwh_from, price_per_kwh_label,
    sites_count, total_capacity_mw, site_cities, min_devices_label, energy_type, extras
)
SELECT o.id, 5.8, 'от 5,8₽ кВт/ч', 1, 3.5, 'Москва', 'от 1 устройства', 'Теплоэнергетика', '{}'::TEXT[]
FROM catalog_organizations o
WHERE o.slug = 'afm-hotel'
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
    'ООО "Л-Системс"',
    'Торговля розничная компьютерами, периферийными устройствами к ним и программным обеспечением в специализированных магазинах (47.41)',
    '1147746472170',
    '7715430685',
    '2014-04-28',
    '127287, город Москва, Писцовая ул, д. 16 стр. 5, помещ. 1н/2',
    '20 000 руб.',
    'Высокая',
    '1 дело на сумму 500 руб.',
    '562 млн руб. (2023г.)',
    '525 тыс. руб. (2023г.)',
    'Нет',
    'Нет',
    'Ограничения на экспорт/импорт товаров и технологий оказывают влияние на деятельность всех организаций, ведущих деятельность в затронутых отраслях. 47.41 Торговля розничная компьютерами, периферийными устройствами к ним и программным обеспечением в специализированных магазинах'
FROM catalog_organizations o
WHERE o.slug = 'afm-hotel'
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

UPDATE catalog_organizations
SET slug = 'majning-otel-gtes-tereshkovo-moskva'
WHERE name = 'Майнинг отель «Терешково»'
   OR slug = 'майнинг-отель-терешково';

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
    office_city = 'Москва',
    site_city = 'Москва',
    verified_contracts = TRUE,
    verified_legal_entity = TRUE,
    verified_data_center = TRUE,
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

INSERT INTO organization_mining_hotels (
    organization_id, price_per_kwh_from, price_per_kwh_label,
    sites_count, total_capacity_mw, site_cities, min_devices_label, energy_type, extras
)
SELECT o.id, 5.3, '5.3', 1, 17, 'Москва', '10', 'Сети', ARRAY[
    '5',
    '4 с НДС',
    'Состоит в реестре',
    'Режимный объект',
    'Хостинг в Москве'
]
FROM catalog_organizations o
WHERE o.slug = 'majning-otel-gtes-tereshkovo-moskva'
ON CONFLICT (organization_id) DO UPDATE SET
    price_per_kwh_from = EXCLUDED.price_per_kwh_from,
    price_per_kwh_label = EXCLUDED.price_per_kwh_label,
    sites_count = EXCLUDED.sites_count,
    total_capacity_mw = EXCLUDED.total_capacity_mw,
    site_cities = EXCLUDED.site_cities,
    min_devices_label = EXCLUDED.min_devices_label,
    energy_type = EXCLUDED.energy_type,
    extras = EXCLUDED.extras;

INSERT INTO organization_payment_terms (
    organization_id, payment_methods, payment_formats, extra_terms, contract_forms
)
SELECT o.id,
    ARRAY['Безналичная']::TEXT[],
    ARRAY[]::TEXT[],
    ARRAY['В рассрочку', 'Лизинг']::TEXT[],
    ARRAY['Договор с ООО']::TEXT[]
FROM catalog_organizations o
WHERE o.slug = 'majning-otel-gtes-tereshkovo-moskva'
ON CONFLICT (organization_id) DO UPDATE SET
    payment_methods = EXCLUDED.payment_methods,
    payment_formats = EXCLUDED.payment_formats,
    extra_terms = EXCLUDED.extra_terms,
    contract_forms = EXCLUDED.contract_forms;

INSERT INTO organization_legal_profiles (
    organization_id, legal_name, primary_activity, ogrn, inn, registered_at,
    legal_address, authorized_capital, reliability, defendant_cases, revenue,
    profit, tax_debt, in_sanctions_lists, sanctions_restrictions
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

UPDATE organization_legal_profiles
SET defendant_cases = ''
WHERE defendant_cases IN ('НЕТ ДАННЫХ', 'Нет данных', 'нет данных')
   OR defendant_cases LIKE 'Информация отсутствует%';

UPDATE organization_legal_profiles
SET revenue = ''
WHERE revenue IN ('НЕТ ДАННЫХ', 'Нет данных', 'нет данных')
   OR revenue LIKE 'Информация отсутствует%';

UPDATE organization_legal_profiles
SET profit = ''
WHERE profit IN ('НЕТ ДАННЫХ', 'Нет данных', 'нет данных')
   OR profit LIKE 'Информация отсутствует%';

UPDATE organization_legal_profiles
SET tax_debt = ''
WHERE tax_debt IN ('НЕТ ДАННЫХ', 'Нет данных', 'нет данных')
   OR tax_debt LIKE 'Информация отсутствует%';

UPDATE organization_legal_profiles
SET in_sanctions_lists = ''
WHERE in_sanctions_lists IN ('НЕТ ДАННЫХ', 'Нет данных', 'нет данных')
   OR in_sanctions_lists LIKE 'Информация отсутствует%';

UPDATE organization_legal_profiles
SET sanctions_restrictions = ''
WHERE sanctions_restrictions IN ('НЕТ ДАННЫХ', 'Нет данных', 'нет данных')
   OR sanctions_restrictions LIKE 'Информация отсутствует%';
