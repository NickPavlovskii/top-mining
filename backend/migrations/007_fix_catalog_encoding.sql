SET client_encoding = 'UTF8';

DELETE FROM catalog_organizations WHERE slug = 'bitcluster';

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

UPDATE catalog_organizations
SET
    office_city = 'Москва',
    updated_at = NOW()
WHERE slug = 'dc-mining';
UPDATE catalog_organizations
SET
    logo_url = '/images/catalog/geometria.png',
    detail_logo_url = '/images/catalog/geometria-detail.png',
    description = 'Продажа ASIC, хостинг, сервисный центр и полный цикл майнинг-услуг.',
    tagline = 'Продажа ASIC, хостинг, сервисный центр',
    founded_year = 2024,
    has_public_rating = TRUE,
    verified_contracts = TRUE,
    verified_legal_entity = TRUE,
    card_tags = ARRAY[
        'Счет на оплату: С НДС',
        'Состояние: Новое',
        'Объем продаж: ОПТ; Розница от 5 шт.',
        'Наличие: В наличии и под заказ'
    ],
    card_features = ARRAY[
        'Напрямую от производителей',
        'Официальный импорт с НДС',
        'При покупке у нас — 0 ₽ за размещение'
    ],
    about_html = $html$
<p>Компания Geometria – технологическая компания белого майнинга в РФ, а также ведущий эксперт в области промышленного майнинга криптовалют с фокусом на аналитику, точные данные и глубокое понимание рынка.</p>
<p>Geometria предоставляет полный цикл майнинг-услуг: оборудование, финансовые модели, строительство дата-центров, доставка, консультации по налогам и юридическим вопросам.</p>
<p><strong>Особенности хостинга Geometria</strong></p>
<p>Аккредитованный дата-центр, мониторинг оборудования 24/7, срок реагирования 15 мин, усиленная охрана Росгвардии.</p>
$html$,
    updated_at = NOW()
WHERE slug = 'geometria';

UPDATE catalog_organizations
SET
    work_hours = 'пн-вс с 9:00 до 20:00 по Мск',
    updated_at = NOW()
WHERE slug = 'geometria';

DELETE FROM organization_addresses
WHERE organization_id = (SELECT id FROM catalog_organizations WHERE slug = 'geometria');

INSERT INTO organization_addresses (organization_id, city, address_line, sort_order)
SELECT
    o.id,
    'Москва',
    'г. Москва, вн. тер. г. муниципальный округ Пресненский, Пресненская набережная, д. 12, этаж 64, пом/офис 204/1',
    1
FROM catalog_organizations o
WHERE o.slug = 'geometria';

INSERT INTO organization_equipment_sales (
    organization_id, equipment_type, equipment_condition, sales_volume, availability, extras
)
SELECT
    o.id,
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
    ]::TEXT[]
FROM catalog_organizations o
WHERE o.slug = 'geometria'
ON CONFLICT (organization_id) DO UPDATE SET
    equipment_type = EXCLUDED.equipment_type,
    equipment_condition = EXCLUDED.equipment_condition,
    sales_volume = EXCLUDED.sales_volume,
    availability = EXCLUDED.availability,
    extras = EXCLUDED.extras;
UPDATE catalog_organizations
SET slug = 'majning-otel-gtes-tereshkovo-moskva'
WHERE name = 'Майнинг отель «Терешково»';

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
    has_public_rating = FALSE,
    verified_contracts = TRUE,
    verified_legal_entity = TRUE,
    verified_mining_registry = TRUE,
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

UPDATE catalog_organizations
SET
    founded_year = 2018,
    site_city = 'Москва',
    has_public_rating = FALSE,
    card_tags = ARRAY[
        'Цена за кВт/ч от 5,8₽ кВт/ч',
        'Мощности площадок: 3.5 МВт'
    ],
    card_features = '{}',
    updated_at = NOW()
WHERE slug = 'afm-hotel';

UPDATE catalog_organizations
SET
    founded_year = 2021,
    site_city = 'г. Липецк',
    has_public_rating = TRUE,
    verified_contracts = TRUE,
    verified_legal_entity = TRUE,
    verified_mining_registry = TRUE,
    card_tags = ARRAY[
        'Цена за кВт/ч: от 5,9₽ кВт/ч',
        'Мощности площадок: 8 МВт'
    ],
    card_features = '{}',
    updated_at = NOW()
WHERE slug = 'bitbird';

UPDATE catalog_organizations
SET
    tagline = 'Производитель контейнеров для майнинга и майнинг-отель',
    page_title = '1-MINING',
    description = 'Производитель контейнеров для майнинга и майнинг-отель в Ленинградской области.',
    logo_url = '/images/catalog/1-mining.png',
    detail_logo_url = '/images/catalog/1-mining-detail.png',
    founded_year = 2019,
    website = 'https://1-mining.ru/',
    phone = '+7 981-287-82-65',
    email = '1-mining@inbox.ru',
    work_hours = '09:00 - 19:00',
    domain_registered_at = '2023-09-07',
    has_public_rating = FALSE,
    verified_contracts = FALSE,
    verified_legal_entity = TRUE,
    verified_mining_registry = FALSE,
    show_gallery = FALSE,
    show_article_block = FALSE,
    office_city = 'Ленинградская область',
    site_city = 'Ленинградская обл.',
    card_tags = ARRAY[
        'Цена за кВт/ч: от 5 руб с НДС',
        'Мощности площадок: 19 МВт'
    ],
    card_features = ARRAY[
        '20 мин от СПб',
        'Газовая генерация',
        'От 300 кВт'
    ],
    about_html = $html$
<p>1-MINING — крупнейший производитель контейнеров для майнинга в Северо-Западном регионе России с офисом и собственным производством в Санкт-Петербурге. Мы проектируем, изготавливаем и адаптируем контейнеры под конкретные задачи и условия эксплуатации клиентов, включая промышленное размещение, выездные фермы и нестандартные проекты. В ассортименте — модели на 10, 20 и 40 футов с продуманной системой вентиляции, энергообеспечения и безопасности.</p>
<p>Наша команда предлагает гибкие решения: подключение к своим мощностям, лизинг, консультации по запуску и обслуживанию — на всем сроке эксплуатации. 1-MINING — это не просто производство, а инженерный подход с фокусом на реальный опыт и практическую надёжность. Контейнеры компании уже доказали эффективность на разных площадках — от заводов с избытком электроэнергии до удалённых территорий.</p>
<p>С нами работают хостинги, промышленные майнеры и инвесторы, которые ценят качество, стабильность и быструю обратную связь. Мы знаем рынок изнутри и говорим с клиентом на одном языке.</p>
$html$,
    updated_at = NOW()
WHERE slug = '1-mining';

INSERT INTO organization_mining_hotels (
    organization_id, price_per_kwh_from, price_per_kwh_label,
    sites_count, total_capacity_mw, site_cities, min_devices_label, energy_type
)
SELECT o.id, 5, 'от 5 руб с НДС', 1, 19, 'Ленинградская обл.', 'от 300 кВт', 'Своя генерация на ГПУ на магистрального газа'
FROM catalog_organizations o
WHERE o.slug = '1-mining'
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
    ARRAY['Наличными', 'Безналичная']::TEXT[],
    ARRAY[]::TEXT[],
    ARRAY['Частичная предоплата']::TEXT[],
    ARRAY['Договор с ООО']::TEXT[]
FROM catalog_organizations o
WHERE o.slug = '1-mining'
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
    'ООО "Профстандарт"',
    'Производство строительных металлических конструкций, изделий и их частей (25.11)',
    '1089847327250',
    '7804397790',
    '2008-08-19',
    '191036, город Санкт-Петербург, 3-Я Советская ул, д. 32 литера А, помещ. 2н другое каб. 1',
    '20 000 руб.',
    'ВЫСОКАЯ',
    '',
    '47 млн руб. за 2024 год',
    '2,3 млн руб. за 2024 год',
    '',
    '',
    ''
FROM catalog_organizations o
WHERE o.slug = '1-mining'
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

UPDATE catalog_organizations SET description = 'Крупнейшая криптобиржа.', card_tags = ARRAY['Верификация: KYC', 'Коэф. ликвидности: 895'], card_features = ARRAY['Спот', 'Деривативы', 'Стейкинг', 'P2P', 'Русскоязычная поддержка', 'Поддержка RUB'] WHERE slug = 'binance';
UPDATE catalog_organizations SET description = 'Криптобиржа с широким выбором монет.', card_tags = ARRAY['Коэффициент ликвидности: 610'] WHERE slug = 'kucoin';
UPDATE catalog_organizations SET description = 'Биржа деривативов и спота.', card_tags = ARRAY['Коэффициент ликвидности: 520'] WHERE slug = 'bybit';
UPDATE catalog_organizations SET description = 'Глобальная криптобиржа.', card_tags = ARRAY['Коэффициент ликвидности: 480'] WHERE slug = 'okx';
UPDATE catalog_organizations SET description = 'Криптобиржа HTX (Huobi).', card_tags = ARRAY['Коэффициент ликвидности: 390'] WHERE slug = 'htx';
UPDATE catalog_organizations SET description = 'Биржа с листингом альткоинов.', card_tags = ARRAY['Коэффициент ликвидности: 350'] WHERE slug = 'mexc';
UPDATE catalog_organizations SET description = 'Мультивалютная биржа.', card_tags = ARRAY['Коэффициент ликвидности: 410'] WHERE slug = 'gate-io';
UPDATE catalog_organizations SET description = 'Биржа копитрейдинга и деривативов.', card_tags = ARRAY['Коэффициент ликвидности: 440'] WHERE slug = 'bitget';
UPDATE catalog_organizations SET description = 'Социальная торговая платформа.', card_tags = ARRAY['Коэффициент ликвидности: 280'] WHERE slug = 'bingx';
UPDATE catalog_organizations SET description = 'Платёжный шлюз и биржа.', card_tags = ARRAY['Коэффициент ликвидности: 210'] WHERE slug = 'cryptomus';
UPDATE catalog_organizations SET description = 'Некастодиальный кошелёк Coinbase.' WHERE slug = 'coinbase-wallet';
UPDATE catalog_organizations SET description = 'Мультивалютный мобильный кошелёк.' WHERE slug = 'trust-wallet';
UPDATE catalog_organizations SET description = 'Desktop и mobile кошелёк.' WHERE slug = 'exodus';
UPDATE catalog_organizations SET description = 'Кошелёк Blockchain.com.' WHERE slug = 'blockchain-wallet';
UPDATE catalog_organizations SET description = 'Кошелёк для Ethereum и EVM-сетей.' WHERE slug = 'myetherwallet';
UPDATE catalog_organizations SET description = 'Браузерный кошелёк для Web3.', card_features = ARRAY['Мобильное приложение', 'Поддержка NFT'] WHERE slug = 'metamask';
UPDATE catalog_organizations SET description = 'Кошелёк для NFT и игровых активов.' WHERE slug = 'enjin-wallet';
UPDATE catalog_organizations SET description = 'Кошелёк для Solana и мультичейн.' WHERE slug = 'phantom';

UPDATE catalog_organizations
SET
    tagline = 'продажа асик-майнеров',
    page_title = 'ALGORITM (АЛГОРИТМ): продажа асик-майнеров',
    about_html = $html$
<p>Лучшая майнинговая компания 2024 года по версии Crypto Awards. Компания обладает практическим опытом в освоении ПНГ и оптимизации сетевых тарифов. Кроме того, Algoritm обеспечивает самые короткие сроки поставки оборудования — всего 6 рабочих дней.</p>
$html$,
    updated_at = NOW()
WHERE slug = 'algoritm';
