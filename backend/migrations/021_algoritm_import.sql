-- Импорт страницы Algoritm: https://top-mining.ru/sale_asic/algoritm/

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
    'Нет данных',
    'за 2024 2,2 млрд руб.',
    'за 2024 22 млн руб.',
    'Нет данных',
    'Нет данных',
    'Нет данных'
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
