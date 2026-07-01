-- Импорт данных с https://top-mining.ru/sale_asic/ttm-mining/
-- Источник: HTML страницы (postid-16440), 2026-06-24

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
    'Нет данных',
    'нет данных',
    'нет данных',
    'нет данных',
    'нет данных',
    'нет данных'
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
