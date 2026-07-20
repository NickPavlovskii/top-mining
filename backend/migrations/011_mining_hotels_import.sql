SET client_encoding = 'UTF8';

SET client_encoding = 'UTF8';

UPDATE catalog_organizations
SET
    tagline = '',
    page_title = 'BITBIRD',
    detail_logo_url = '/images/catalog/bitbird-detail.png',
    logo_url = '/images/catalog/bitbird.png',
    founded_year = 2021,
    website = 'https://bitbird.ru/',
    phone = '+7 (910) 245-02-74',
    email = 'pankov@bitbird.ru',
    work_hours = 'Пн-Пт с 9:00 до 18:00',
    office_city = 'г. Липецк',
    site_city = 'г. Липецк',
    rating = 0,
    review_count = 5,
    has_public_rating = TRUE,
    verified_contracts = FALSE,
    verified_legal_entity = FALSE,
    verified_data_center = FALSE,
    verified_mining_registry = FALSE,
    show_gallery = FALSE,
    show_article_block = FALSE,
    about_html = $html$
<p>BitBird — это новая команда из опытных игроков крипторынка, мы соединились, чтобы создать проект совершенного нового уровня!</p>
<p>В данной индустрии большая нехватка качественного сервиса по обслуживанию майнинга, поэтому мы решили запустить новый проект с целью закрыть эту потребность.</p>
<p>На сегодняшний день специализация компании – комплексные решения для майнинга, включая размещение оборудования на хостинге, прямые поставки оборудования, сервис и ремонт, разработка программного обеспечения для майнинга.</p>
$html$,
    card_tags = ARRAY[
        'Цена за кВт/ч: от 5,9₽ кВт/ч',
        'Мощности площадок: 8 МВт'
    ],
    card_features = '{}',
    updated_at = NOW()
WHERE slug = 'bitbird';

INSERT INTO organization_mining_hotels (
    organization_id, price_per_kwh_from, price_per_kwh_label,
    sites_count, total_capacity_mw, site_cities, min_devices_label, energy_type, extras
)
SELECT o.id, 5.9, 'от 5,9₽ кВт/ч', 1, 8, 'г. Липецк', 'от 1 устройства', 'Ядерная', '{}'::TEXT[]
FROM catalog_organizations o
WHERE o.slug = 'bitbird'
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
    'ООО "Айти Технологии"',
    'Деятельность по управлению компьютерным оборудованием (62.03)',
    '1213600001966',
    '3663153430',
    '2021-01-27',
    '394033, Воронежская область, г Воронеж, ул Димитрова, д. 51/3, офис 3',
    '100 000 руб.',
    'Высокая',
    'Нет',
    '14 млн руб. (2023г.)',
    '428 тыс. руб. (2023г.)',
    'Нет',
    'Нет',
    'Нет'
FROM catalog_organizations o
WHERE o.slug = 'bitbird'
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

SET client_encoding = 'UTF8';

ALTER TABLE catalog_organizations
    ADD COLUMN IF NOT EXISTS logo_theme TEXT NOT NULL DEFAULT '';

UPDATE catalog_organizations
SET
    slug = 'datacheap',
    tagline = '',
    page_title = 'DATACHEAP',
    detail_logo_url = '/images/catalog/datacheap-detail.png',
    logo_url = '/images/catalog/datacheap.png',
    logo_theme = 'light',
    founded_year = 2008,
    website = 'https://datacheap.ru/services/otel-dlya-maininga/',
    phone = '8 (800) 333-01-81',
    email = 'info@datacheap.ru',
    work_hours = 'Пн-Пт с 10:00 до 19:00',
    office_city = 'Москва',
    site_city = 'Москва',
    rating = 2.5,
    review_count = 203,
    has_public_rating = TRUE,
    verified_contracts = FALSE,
    verified_legal_entity = FALSE,
    verified_data_center = FALSE,
    verified_mining_registry = FALSE,
    show_gallery = FALSE,
    show_article_block = FALSE,
    about_html = $html$
<p><strong>В ДАННЫЙ МОМЕНТ ОБОРУДОВАНИЕ ДЛЯ МАЙНИНГА НЕ ПРИНИМАЕТСЯ К РАЗМЕЩЕНИЮ!</strong> В зависимости от нужд клиентов мы предлагаем различные варианты размещения оборудования в датацентре − от одного юнита в стойке до десятков стоек или шкафов, также есть возможность для размещения АТХ-серверов и другого не стоечного оборудования. Мы готовы в короткие сроки разместить больше количество оборудования с нагрузкой до 14 кВт на стойку. В нашем дата-центре 270 стоек, каждая имеет 47U полезной емкости доступной для клиентов.</p>
$html$,
    card_tags = '{}',
    card_features = '{}',
    updated_at = NOW()
WHERE name = 'DataCheap' OR slug = 'datacheap';

DELETE FROM organization_addresses
WHERE organization_id = (SELECT id FROM catalog_organizations WHERE slug = 'datacheap');

INSERT INTO organization_addresses (organization_id, city, address_line, sort_order)
SELECT o.id, 'Москва', 'г. Москва, ул. Угрешская дом 2 стр. 147', 0
FROM catalog_organizations o
WHERE o.slug = 'datacheap';

INSERT INTO organization_legal_profiles (
    organization_id, legal_name, primary_activity, ogrn, inn, registered_at,
    legal_address, authorized_capital, reliability, defendant_cases, revenue,
    profit, tax_debt, in_sanctions_lists, sanctions_restrictions
)
SELECT o.id,
    'ООО "Дельта"',
    'Деятельность, связанная с использованием вычислительной техники и информационных технологий, прочая (62.09)',
    '5087746538424',
    '7701811828',
    '2008-12-03',
    '115088, город Москва, Угрешская ул, д. 2 стр. 147',
    '10 000 руб.',
    'Высокая',
    'Нет',
    '79 млн руб. (2023г.)',
    '-1,8 млн руб. (2023г.)',
    'Нет',
    'Нет',
    'Нет'
FROM catalog_organizations o
WHERE o.slug = 'datacheap'
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

SET client_encoding = 'UTF8';

ALTER TABLE catalog_organizations
    ADD COLUMN IF NOT EXISTS logo_theme TEXT NOT NULL DEFAULT '';

UPDATE catalog_organizations
SET
    slug = 'rushash',
    tagline = '',
    page_title = 'RUSHASH',
    detail_logo_url = '/images/catalog/rushash-detail.png',
    logo_url = '/images/catalog/rushash.png',
    logo_theme = 'light',
    founded_year = 2021,
    website = 'https://rushash.ru',
    phone = '',
    email = 'info@rushash.com',
    work_hours = 'Пн - Пт, с 10:00 до 19:00',
    office_city = 'Москва',
    site_city = '',
    rating = 0,
    review_count = 0,
    has_public_rating = FALSE,
    verified_contracts = FALSE,
    verified_legal_entity = TRUE,
    verified_data_center = TRUE,
    verified_mining_registry = TRUE,
    show_gallery = TRUE,
    show_article_block = FALSE,
    about_html = $html$
<p>RusHash — компания полного цикла в сфере майнинга криптовалют с экспертизой, подтвержденной годами работы:</p>
<ul>
<li>Крупный импортер и дистрибьютор аппаратов для майнинга, контейнеров, трансформаторов, ГПУ и прочей продукции от производителей из Китая и юго-восточной Азии.</li>
<li>Экосистема сервисов для максимизации прибыли клиентов: стратегические решения, финансовый, юридический, налоговый консалтинг.</li>
<li>Официальный гарантийный сервисный центр MicroBT и Bitdeer, который также осуществляет пост-гарантийный ремонт оборудования всех производителей.</li>
</ul>
$html$,
    card_tags = '{}',
    card_features = '{}',
    updated_at = NOW()
WHERE name = 'RusHash' OR slug = 'rushash';

DELETE FROM organization_addresses
WHERE organization_id = (SELECT id FROM catalog_organizations WHERE slug = 'rushash');

INSERT INTO organization_addresses (organization_id, city, address_line, sort_order)
SELECT o.id, 'Москва', 'Офис г. Москва, ул. Мясницкая, д. 40, стр. 1', 0
FROM catalog_organizations o
WHERE o.slug = 'rushash';

INSERT INTO organization_payment_terms (
    organization_id, payment_methods, payment_formats, extra_terms, contract_forms
)
SELECT o.id,
    ARRAY['С НДС']::TEXT[],
    ARRAY[]::TEXT[],
    ARRAY['В рассрочку']::TEXT[],
    ARRAY['Договор с ООО']::TEXT[]
FROM catalog_organizations o
WHERE o.slug = 'rushash'
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
    'ООО "Русхэш"',
    'Деятельность по управлению компьютерным оборудованием',
    '1217700414018',
    '7730267874',
    '2021-09-03',
    '101000, город Москва, Мясницкая ул, д. 40 стр. 1, помещ. 3/1',
    '10 000 руб.',
    'Высокая',
    '1 дело на сумму 1,8 млн руб.',
    '533 млн руб. за 2024 год',
    '29 млн руб. за 2024 год',
    'На сумму 40 тыс. руб. на 10.11.2025',
    '',
    ''
FROM catalog_organizations o
WHERE o.slug = 'rushash'
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
WHERE organization_id = (SELECT id FROM catalog_organizations WHERE slug = 'rushash');

INSERT INTO organization_gallery_images (organization_id, image_url, image_alt, sort_order)
SELECT o.id, v.image_url, v.image_alt, v.sort_order
FROM catalog_organizations o
JOIN (
    VALUES
        ('/images/catalog/rushash/gallery-01.png', 'Майнинг-контейнер RusHash', 1),
        ('/images/catalog/rushash/gallery-02.png', 'Система вентиляции RusHash', 2),
        ('/images/catalog/rushash/gallery-03.png', 'Охлаждение дата-центра RusHash', 3),
        ('/images/catalog/rushash/gallery-04.png', 'Модульные дата-центры RusHash', 4)
) AS v(image_url, image_alt, sort_order) ON TRUE
WHERE o.slug = 'rushash';

SET client_encoding = 'UTF8';

INSERT INTO catalog_organizations (
    category_id, name, slug, logo_url, description, rating, review_count, sort_order,
    page_title, detail_logo_url, founded_year, website, phone, email, work_hours,
    office_city, site_city, has_public_rating,
    verified_contracts, verified_legal_entity, verified_data_center, verified_mining_registry,
    show_gallery, show_article_block, about_html, card_tags, card_features
)
SELECT
    c.id,
    'WATT MANOR',
    'watt-manor',
    '/images/catalog/watt-manor.png',
    'Майнинг-отель с размещением ASIC в Красноярске и Кемерово.',
    0,
    14,
    10,
    'WATT MANOR',
    '/images/catalog/watt-manor-detail.png',
    2022,
    'https://wattmanor.com/',
    '+7 (923) 279-11-34',
    'sale.wattmanor@gmail.com',
    'Пн-Пт с 9:00 до 18:00',
    'Кемерово',
    'Красноярск; Кемерово',
    TRUE,
    FALSE,
    FALSE,
    FALSE,
    FALSE,
    FALSE,
    FALSE,
    '',
    ARRAY['Цена за кВт/ч: 5,9₽ кВт/ч', 'Мощности площадок: 30 МВт']::TEXT[],
    '{}'::TEXT[]
FROM catalog_categories c
WHERE c.slug = 'mining-hotels'
  AND NOT EXISTS (SELECT 1 FROM catalog_organizations o WHERE o.slug = 'watt-manor');

UPDATE catalog_organizations
SET
    slug = 'watt-manor',
    tagline = '',
    page_title = 'WATT MANOR',
    detail_logo_url = '/images/catalog/watt-manor-detail.png',
    logo_url = '/images/catalog/watt-manor.png',
    founded_year = 2022,
    website = 'https://wattmanor.com/',
    phone = '+7 (923) 279-11-34',
    email = 'sale.wattmanor@gmail.com',
    work_hours = 'Пн-Пт с 9:00 до 18:00',
    office_city = 'Кемерово',
    site_city = 'Красноярск; Кемерово',
    rating = 0,
    review_count = 14,
    has_public_rating = TRUE,
    verified_contracts = FALSE,
    verified_legal_entity = FALSE,
    verified_data_center = FALSE,
    verified_mining_registry = FALSE,
    show_gallery = FALSE,
    show_article_block = FALSE,
    about_html = '',
    card_tags = ARRAY[
        'Цена за кВт/ч: 5,9₽ кВт/ч',
        'Мощности площадок: 30 МВт'
    ],
    card_features = '{}',
    updated_at = NOW()
WHERE name = 'WATT MANOR' OR slug = 'watt-manor';

DELETE FROM organization_addresses
WHERE organization_id = (SELECT id FROM catalog_organizations WHERE slug = 'watt-manor');

INSERT INTO organization_addresses (organization_id, city, address_line, sort_order)
SELECT o.id, 'Кемерово', 'Кемерово, Октябрьский проспект, 2Б', 0
FROM catalog_organizations o
WHERE o.slug = 'watt-manor';

INSERT INTO organization_mining_hotels (
    organization_id, price_per_kwh_from, price_per_kwh_label,
    sites_count, total_capacity_mw, site_cities, min_devices_label, energy_type, extras
)
SELECT o.id, 5.9, '5,9₽ кВт/ч', 2, 30, 'Красноярск; Кемерово', '5', '', '{}'::TEXT[]
FROM catalog_organizations o
WHERE o.slug = 'watt-manor'
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
    'ООО "Сибирский Бит"',
    'Деятельность по обработке данных, предоставление услуг по размещению информации и связанная с этим деятельность (63.11)',
    '1224200001585',
    '4205403103',
    '2022-02-08',
    '650000, Кемеровская область, г Кемерово, Кузнецкий пр-кт, д. 28, офис 354',
    '10 000 руб.',
    'Низкая',
    '2 дела на сумму 267 млн руб.',
    '544 млн руб. (2023 г.)',
    '-107 млн руб. (2023 г.)',
    'Нет',
    'Нет',
    'Нет'
FROM catalog_organizations o
WHERE o.slug = 'watt-manor'
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

SET client_encoding = 'UTF8';

ALTER TABLE catalog_organizations
    ADD COLUMN IF NOT EXISTS logo_theme TEXT NOT NULL DEFAULT '';

UPDATE catalog_organizations
SET
    slug = 'weltall-energy',
    tagline = 'продажа и ремонт асиков, хостинг, размещение',
    page_title = 'WELTALL ENERGY (ВЕЛЬТАЛЬ-ЭНЕРДЖИ):',
    detail_logo_url = '/images/catalog/weltall-energy-detail.png',
    logo_url = '/images/catalog/weltall-energy.png',
    logo_theme = 'dark',
    founded_year = 2021,
    website = 'https://weltall.energy/ru/',
    phone = '+7 495 858-30-33',
    email = 'sales@weltall.energy',
    work_hours = 'Пн-Пт с 10 до 19',
    office_city = 'Москва',
    site_city = 'Москва',
    domain_registered_at = '2024-11-26',
    rating = 5,
    review_count = 5,
    has_public_rating = TRUE,
    verified_contracts = TRUE,
    verified_legal_entity = TRUE,
    verified_data_center = TRUE,
    verified_mining_registry = TRUE,
    show_gallery = TRUE,
    show_article_block = FALSE,
    about_html = $html$
<p>Компания Weltall Mining — надежный оператор майнинг-инфраструктуры, предлагающий полный комплекс услуг: продажу асиков напрямую от производителей, их хостинг и размещение в собственном дата-центре с низкими тарифами на электроэнергию, а также сервисное обслуживание и ремонт оборудования. Компания обеспечивает легальную работу, круглосуточную поддержку и прозрачные условия сотрудничества, помогая клиентам получать стабильный доход от майнинга.</p>
<h3>Купить асик в Weltall Energy</h3>
<p>Компания Weltall Mining занимается прямой продажей асиков от ведущих производителей — Bitmain, Whatsminer, Innosilicon и других. Благодаря прямым контрактам и собственной логистике оборудование поставляется без посредников, с гарантией качества и официальной документацией. Клиентам доступен как заказ из Китая, так и покупка устройств в наличии, что позволяет максимально сократить сроки запуска.</p>
<p>Главное преимущество Weltall Mining — комплексный подход: специалисты подбирают майнеры под бюджет клиента, настраивают их для максимальной эффективности и при необходимости сразу размещают в дата-центре компании мощностью 5 МВт внутри МКАД. Здесь оборудование работает в условиях надежной инфраструктуры — автономное энергоснабжение, система охлаждения, круглосуточный мониторинг и многоуровневая защита обеспечивают стабильный аптайм на уровне 98%.</p>
<p>С 2021 года Weltall Mining является официальным оператором майнинговой инфраструктуры, что подтверждает прозрачность сделок и законность работы. Компания предоставляет бизнес под ключ: от покупки асиков и их настройки до хостинга и обслуживания. Такой подход позволяет клиентам сосредоточиться на доходности майнинга, доверив технические и организационные задачи профессионалам.</p>
<h3>Майнинг отель и хостинг Weltall Energy</h3>
<p>Компания Weltall Energy предлагает услугу надежного хостинга и размещения ASIC-оборудования в собственном дата-центре мощностью 5 МВт, расположенном в пределах МКАД. Клиентам доступны выгодные тарифы от 5,65 руб/кВт·ч, индивидуальный учет потребления, круглосуточная поддержка и техническое обслуживание «под ключ».</p>
<p>Современная инфраструктура с автономным энергоснабжением, системой охлаждения и трехуровневой защитой (охрана, сигнализация, видеонаблюдение) обеспечивает стабильный аптайм на уровне 98% и безопасность оборудования. Все услуги предоставляются официально по договору, что гарантирует прозрачность и юридическую надежность сотрудничества.</p>
$html$,
    card_tags = ARRAY[
        'Цена за кВт/ч: от 5,8₽ кВт/ч',
        'Мощности площадок: 5 МВт'
    ],
    card_features = '{}',
    updated_at = NOW()
WHERE name = 'Weltall Energy' OR slug = 'weltall-energy';

DELETE FROM organization_addresses
WHERE organization_id = (SELECT id FROM catalog_organizations WHERE slug = 'weltall-energy');

INSERT INTO organization_addresses (organization_id, city, address_line, sort_order)
SELECT o.id, 'Москва', 'Москва, п. Внуково, ул. Центральная 8Б, БЦ «ЛА-5», 119027', 0
FROM catalog_organizations o
WHERE o.slug = 'weltall-energy';

INSERT INTO organization_mining_hotels (
    organization_id, price_per_kwh_from, price_per_kwh_label,
    sites_count, total_capacity_mw, site_cities, min_devices_label, energy_type, extras
)
SELECT o.id, 5.8, 'от 5,8 руб. (с НДС)', 1, 5, 'Москва', 'от 5 устройств', 'Газопоршневая установка', '{}'::TEXT[]
FROM catalog_organizations o
WHERE o.slug = 'weltall-energy'
ON CONFLICT (organization_id) DO UPDATE SET
    price_per_kwh_from = EXCLUDED.price_per_kwh_from,
    price_per_kwh_label = EXCLUDED.price_per_kwh_label,
    sites_count = EXCLUDED.sites_count,
    total_capacity_mw = EXCLUDED.total_capacity_mw,
    site_cities = EXCLUDED.site_cities,
    min_devices_label = EXCLUDED.min_devices_label,
    energy_type = EXCLUDED.energy_type,
    extras = EXCLUDED.extras;

DELETE FROM organization_gallery_images
WHERE organization_id = (SELECT id FROM catalog_organizations WHERE slug = 'weltall-energy');

INSERT INTO organization_gallery_images (organization_id, image_url, image_alt, sort_order)
SELECT o.id, v.image_url, v.image_alt, v.sort_order
FROM catalog_organizations o
JOIN (
    VALUES
        ('/images/catalog/weltall-energy/gallery-01.png', 'Модульный дата-центр Weltall Energy', 1),
        ('/images/catalog/weltall-energy/gallery-02.png', 'Газопоршневая установка Weltall Energy', 2),
        ('/images/catalog/weltall-energy/gallery-03.png', 'Инфраструктура Weltall Energy', 3),
        ('/images/catalog/weltall-energy/gallery-04.png', 'Размещение ASIC-майнеров Weltall Energy', 4),
        ('/images/catalog/weltall-energy/gallery-05.png', 'Майнинг-контейнеры Weltall Energy', 5)
) AS v(image_url, image_alt, sort_order) ON TRUE
WHERE o.slug = 'weltall-energy';
