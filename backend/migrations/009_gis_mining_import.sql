SET client_encoding = 'UTF8';

ALTER TABLE catalog_organizations
    ADD COLUMN IF NOT EXISTS detail_logo_url TEXT NOT NULL DEFAULT '',
    ADD COLUMN IF NOT EXISTS phone TEXT NOT NULL DEFAULT '',
    ADD COLUMN IF NOT EXISTS show_gallery BOOLEAN NOT NULL DEFAULT TRUE,
    ADD COLUMN IF NOT EXISTS show_article_block BOOLEAN NOT NULL DEFAULT TRUE;

UPDATE catalog_organizations
SET
    tagline = 'магазин асиков, инвестиции, майнинг-отель и размещение майнеров',
    page_title = 'GIS MINING (ГИС МАЙНИНГ): магазин асиков, инвестиции, майнинг-отель и размещение майнеров',
    logo_url = '/images/catalog/gis-mining.png',
    detail_logo_url = '/images/catalog/gis-mining-detail.png',
    description = 'Поставка и обслуживание майнинг-оборудования.',
    founded_year = 2019,
    office_city = 'Москва',
    website = 'https://gis-mining.ru/',
    phone = '+7 (495) 664-67-25',
    email = 'info@gis-corp.ru',
    work_hours = 'Пн-Пт с 10 до 19',
    domain_registered_at = '2021-04-14',
    verified_contracts = FALSE,
    verified_legal_entity = FALSE,
    has_public_rating = TRUE,
    rating = 4.8,
    review_count = 146,
    show_gallery = TRUE,
    show_article_block = FALSE,
    card_tags = '{}',
    card_features = '{}',
    about_html = $html$
<p>Инновационная российская компания из сегмента майнинга криптовалют: максимально широкий перечень доступных услуг для клиентов из России и других стран мира. В магазине GIS Mining можно купить технику от ведущих производителей, воспользоваться сервисным центром, разместить свое оборудование в дата-центрах, а также выбрать формат инвестирования «под ключ». Компания предлагает принцип как розничного, так и оптового сотрудничества: клиентам доступны форматы лизинга и рассрочки, все услуги оказываются официально, что подтверждается наличием необходимых документов.</p>
$html$,
    updated_at = NOW()
WHERE slug = 'gis-mining';

DELETE FROM organization_addresses
WHERE organization_id = (SELECT id FROM catalog_organizations WHERE slug = 'gis-mining');

INSERT INTO organization_addresses (organization_id, city, address_line, sort_order)
SELECT o.id, 'Москва', 'Россия, Москва, Варшавское шоссе, 1 стр. 1-2 W-Plaza', 1
FROM catalog_organizations o
WHERE o.slug = 'gis-mining';

DELETE FROM organization_equipment_sales
WHERE organization_id = (SELECT id FROM catalog_organizations WHERE slug = 'gis-mining');

INSERT INTO organization_mining_hotels (
    organization_id, price_per_kwh_from, price_per_kwh_label,
    sites_count, total_capacity_mw, site_cities, min_devices_label, energy_type
)
SELECT o.id, 6.2, 'от 6,2 ₽ кВт/ч', 2, 30,
    'Электросталь; Удомля;', 'от 5', 'Ядерный; Теплоэнергетика'
FROM catalog_organizations o
WHERE o.slug = 'gis-mining'
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
    'ООО "ГЛОБАЛЬНЫЕ ИНФОРМАЦИОННЫЕ СИСТЕМЫ"',
    'Деятельность по обработке данных, предоставление услуг по размещению информации и связанная с этим деятельность (63.11)',
    '1207700422104',
    '7733361459',
    '2020-11-10',
    '117105, город Москва, Варшавское ш, д. 1а, ком. 39',
    '1 888 588 руб.',
    'Высокая',
    '1 дело на сумму 6,4 тыс. руб. Не проиграно 1 (100%)',
    '513 млн руб. (2023 г.)',
    '3,7 млн руб. (2023 г.)',
    'Нет',
    'Нет',
    'Нет'
FROM catalog_organizations o
WHERE o.slug = 'gis-mining'
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
WHERE organization_id = (SELECT id FROM catalog_organizations WHERE slug = 'gis-mining');

INSERT INTO organization_gallery_images (organization_id, image_url, image_alt, sort_order)
SELECT o.id, v.image_url, v.image_alt, v.sort_order
FROM catalog_organizations o
JOIN (
    VALUES
        ('/images/catalog/gis-mining/gallery-01.png', 'Стенд GIS Mining на выставке', 1),
        ('/images/catalog/gis-mining/gallery-02.png', 'Команда GIS Mining', 2),
        ('/images/catalog/gis-mining/gallery-03.png', 'Офис GIS Mining', 3),
        ('/images/catalog/gis-mining/gallery-04.png', 'Переговоры в GIS Mining', 4),
        ('/images/catalog/gis-mining/gallery-05.png', 'Размещение ASIC-майнеров GIS Mining', 5)
) AS v(image_url, image_alt, sort_order) ON TRUE
WHERE o.slug = 'gis-mining';
