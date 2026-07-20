SET client_encoding = 'UTF8';

ALTER TABLE catalog_organizations
    ADD COLUMN IF NOT EXISTS detail_logo_url TEXT NOT NULL DEFAULT '',
    ADD COLUMN IF NOT EXISTS phone TEXT NOT NULL DEFAULT '',
    ADD COLUMN IF NOT EXISTS show_gallery BOOLEAN NOT NULL DEFAULT TRUE,
    ADD COLUMN IF NOT EXISTS show_article_block BOOLEAN NOT NULL DEFAULT TRUE;

UPDATE catalog_organizations
SET
    tagline = 'Продажа и размещение майнинг-оборудования',
    page_title = 'DC MINING: продажа ASIC-майнеров, майнинг-отель, сервис',
    logo_url = '/images/catalog/dc-mining.png',
    detail_logo_url = '/images/catalog/dc-mining-detail.png',
    description = 'Продажа и размещение майнинг-оборудования.',
    founded_year = 2023,
    office_city = 'Москва',
    website = 'https://dc-mining.ru/',
    phone = '+7 (495) 513-12-11',
    email = 'info@dc-mining.ru',
    work_hours = '',
    verified_contracts = TRUE,
    verified_legal_entity = TRUE,
    verified_mining_registry = TRUE,
    has_public_rating = TRUE,
    rating = 5,
    review_count = 8,
    show_gallery = TRUE,
    show_article_block = FALSE,
    card_tags = ARRAY[
        'Счет на оплату: С НДС',
        'Состояние: Новое',
        'Объем продаж: Опт, Розница',
        'Наличие: Наличие, под заказ'
    ],
    card_features = ARRAY[
        'Прямые поставки',
        'ГТД РФ',
        'НДС'
    ],
    about_html = $html$
<p>DC-Mining предлагает юридическим лицам размещение майнингового оборудования в собственных дата-центрах на газовых месторождениях с выгодными тарифами на электроэнергию. Мы обеспечиваем полный цикл услуг: от официального ввоза оборудования с ГТД до обслуживания в собственном сертифицированном сервисном центре. Компания включена в реестр операторов майнинговой инфраструктуры РФ и гарантирует безопасное размещение с круглосуточным мониторингом. Готовы предложить индивидуальные условия для вашего бизнеса.</p>
$html$,
    updated_at = NOW()
WHERE slug = 'dc-mining';

DELETE FROM organization_addresses
WHERE organization_id = (SELECT id FROM catalog_organizations WHERE slug = 'dc-mining');

INSERT INTO organization_addresses (organization_id, city, address_line, sort_order)
SELECT o.id, 'Москва', 'г. Москва, ул. Скаковая, д. 17, стр. 2', 1
FROM catalog_organizations o
WHERE o.slug = 'dc-mining';

INSERT INTO organization_equipment_sales (
    organization_id, equipment_type, equipment_condition, sales_volume, availability, extras
)
SELECT o.id, 'ASIC', 'Новое', 'Опт, Розница', 'Наличие, под заказ', ARRAY['Прямые поставки', 'ГТД РФ']::TEXT[]
FROM catalog_organizations o
WHERE o.slug = 'dc-mining'
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
SELECT o.id, 5, 'от 5 ₽ кВт/ч', 3, 40,
    'Саратов, Челябинск, Волгоград', 'от 1 устройства', 'Собственная генерация, газ'
FROM catalog_organizations o
WHERE o.slug = 'dc-mining'
ON CONFLICT (organization_id) DO UPDATE SET
    price_per_kwh_from = EXCLUDED.price_per_kwh_from,
    price_per_kwh_label = EXCLUDED.price_per_kwh_label,
    sites_count = EXCLUDED.sites_count,
    total_capacity_mw = EXCLUDED.total_capacity_mw,
    site_cities = EXCLUDED.site_cities,
    min_devices_label = EXCLUDED.min_devices_label,
    energy_type = EXCLUDED.energy_type;

INSERT INTO organization_legal_profiles (
    organization_id, legal_name, primary_activity, ogrn, inn, registered_at,
    legal_address, authorized_capital, reliability,
    defendant_cases, revenue, profit, tax_debt, in_sanctions_lists, sanctions_restrictions
)
SELECT o.id,
    'ООО "Диси Телеком"',
    'Деятельность по обработке данных, предоставление услуг по размещению информации и связанная с этим деятельность (63.11)',
    '1237700542750',
    '9705205476',
    '2023-08-15',
    '109004, город Москва, ул. Николоямская, д. 40/22, стр. 4',
    '10 000 руб.',
    'Средняя',
    'Нет',
    '-',
    '-',
    'Нет',
    'Нет',
    'Нет'
FROM catalog_organizations o
WHERE o.slug = 'dc-mining'
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
WHERE organization_id = (SELECT id FROM catalog_organizations WHERE slug = 'dc-mining');

INSERT INTO organization_gallery_images (organization_id, image_url, image_alt, sort_order)
SELECT o.id, v.image_url, v.image_alt, v.sort_order
FROM catalog_organizations o
JOIN (
    VALUES
        ('/images/catalog/dc-mining/gallery-01.png', 'Офис DC Mining', 1),
        ('/images/catalog/dc-mining/gallery-02.png', 'Модульный дата-центр DC Mining', 2),
        ('/images/catalog/dc-mining/gallery-03.png', 'Размещение ASIC-майнеров DC Mining', 3),
        ('/images/catalog/dc-mining/gallery-04.png', 'Площадка DC Mining с генерацией', 4),
        ('/images/catalog/dc-mining/gallery-06.png', 'Модульные дата-центры DC Mining', 5),
        ('/images/catalog/dc-mining/gallery-07.png', 'Газовое месторождение DC Mining', 6)
) AS v(image_url, image_alt, sort_order) ON TRUE
WHERE o.slug = 'dc-mining';
