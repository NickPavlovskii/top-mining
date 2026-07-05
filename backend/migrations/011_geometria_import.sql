
SET client_encoding = 'UTF8';

INSERT INTO catalog_organizations (
    category_id,
    name,
    slug,
    logo_url,
    description,
    rating,
    review_count,
    sort_order,
    tagline,
    page_title,
    founded_year,
    website,
    email,
    work_hours,
    verified_contracts,
    verified_legal_entity,
    has_public_rating,
    about_html
)
SELECT
    c.id,
    'Geometria',
    'geometria',
    '/images/catalog/geometria.png',
    'Продажа ASIC, хостинг, сервисный центр и полный цикл майнинг-услуг.',
    0,
    0,
    2,
    'Продажа ASIC, хостинг, сервисный центр',
    'GEOMETRIA (ГЕОМЕТРИЯ): продажа асиков, хостинг, сервисный центр, услуги, отзывы',
    2024,
    'https://geometria.io/',
    'info@geometria.io',
    'пн-вс с 9:00 до 20:00 по Мск',
    TRUE,
    TRUE,
    FALSE,
    $html$
<p>Компания Geometria – технологическая компания белого майнинга в РФ, а также ведущий эксперт в области промышленного майнинга криптовалют с фокусом на аналитику, точные данные и глубокое понимание рынка.</p>
<p>Geometria предоставляет полный цикл майнинг-услуг: оборудование, финансовые модели, строительство дата-центров, доставка, консультации по налогам и юридическим вопросам. Мы знаем, какие изменения ждут майнинговую отрасль, и подстраиваем майнинг-бизнес клиентов до их официальных изменений.</p>
<p>Оборудование только с НДС, площадки и контейнеры на балансе компании, продажа криптовалюты по безналу, приведение клиентского бизнеса в соответствие с законами РФ.</p>
<p><strong>Особенности хостинга Geometria</strong></p>
<p>Аккредитованный дата-центр, мониторинг оборудования 24/7, срок реагирования 15 мин, усиленная охрана Росгвардии, возможность работать на полном аптайме и с управлением спроса, полностью легальная площадка с прозрачным оформлением не только для клиентов, но и для проверяющих органов.</p>
$html$
FROM catalog_categories c
WHERE c.slug = 'asic-sales'
ON CONFLICT (slug) DO UPDATE SET
    name = EXCLUDED.name,
    logo_url = EXCLUDED.logo_url,
    description = EXCLUDED.description,
    tagline = EXCLUDED.tagline,
    page_title = EXCLUDED.page_title,
    founded_year = EXCLUDED.founded_year,
    website = EXCLUDED.website,
    email = EXCLUDED.email,
    work_hours = EXCLUDED.work_hours,
    verified_contracts = EXCLUDED.verified_contracts,
    verified_legal_entity = EXCLUDED.verified_legal_entity,
    has_public_rating = EXCLUDED.has_public_rating,
    about_html = EXCLUDED.about_html,
    updated_at = NOW();

DELETE FROM organization_addresses
WHERE organization_id = (SELECT id FROM catalog_organizations WHERE slug = 'geometria');

INSERT INTO organization_addresses (organization_id, city, address_line, sort_order)
SELECT o.id, 'Москва', 'г. Москва, вн. тер. г. муниципальный округ Пресненский, Пресненская набережная, д. 12, этаж 64, пом/офис 204/1', 1
FROM catalog_organizations o
WHERE o.slug = 'geometria';

INSERT INTO organization_equipment_sales (
    organization_id, equipment_type, equipment_condition, sales_volume, availability, extras
)
SELECT o.id,
    'ASIC-майнеры',
    'Новое',
    'ОПТ; Розница от 5 шт.',
    'В наличии и под заказ',
    ARRAY[
        'Напрямую от производителей',
        'Официальный импорт с НДС',
        'При покупке у нас — 0 ₽ за размещение',
        'с НДС и ГТД',
        'Бесплатная установка'
    ]
FROM catalog_organizations o
WHERE o.slug = 'geometria'
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
SELECT o.id, 6.2, 'от 6.2р', 1, 10,
    'Нижегородская область, г. Дзержинск, 20 км от аэропорта Нижнего Новгорода',
    '5', 'Электросети'
FROM catalog_organizations o
WHERE o.slug = 'geometria'
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
    ARRAY['Безналичная'],
    ARRAY['В кредит'],
    ARRAY['В кредит'],
    ARRAY['Безналичная']
FROM catalog_organizations o
WHERE o.slug = 'geometria'
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
    'Общество с ограниченной ответственностью "ВЭБ3.0" (ООО "ВЭБ3.0")',
    'Разработка компьютерного программного обеспечения (62.01)',
    '1227700376760',
    '9703094672',
    '2022-06-28',
    '123112, город Москва, Пресненская наб, д. 12, этаж 64 пом/офис 204/1',
    '10000',
    'ВЫСОКАЯ',
    'Нет данных',
    'За 2024 год: 76 млн руб.',
    'За 2024 год: 45 тыс. руб.',
    'Нет данных',
    'Нет данных',
    'Нет данных'
FROM catalog_organizations o
WHERE o.slug = 'geometria'
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
