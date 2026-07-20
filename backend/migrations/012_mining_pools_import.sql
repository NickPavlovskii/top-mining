SET client_encoding = 'UTF8';

SET client_encoding = 'UTF8';

CREATE TABLE IF NOT EXISTS organization_mining_pools (
    organization_id INT PRIMARY KEY REFERENCES catalog_organizations (id) ON DELETE CASCADE,
    mobile_app TEXT NOT NULL DEFAULT '',
    referral_program TEXT NOT NULL DEFAULT '',
    total_hashrate TEXT NOT NULL DEFAULT '',
    reward_distribution TEXT NOT NULL DEFAULT '',
    pool_commission TEXT NOT NULL DEFAULT '',
    min_payout TEXT NOT NULL DEFAULT '',
    payout_frequency TEXT NOT NULL DEFAULT '',
    mined_coins TEXT NOT NULL DEFAULT ''
);

ALTER TABLE catalog_organizations
    ADD COLUMN IF NOT EXISTS referral_program_url TEXT NOT NULL DEFAULT '',
    ADD COLUMN IF NOT EXISTS referral_promo_text TEXT NOT NULL DEFAULT '';

UPDATE catalog_organizations
SET
    slug = 'k8x',
    tagline = '',
    page_title = 'K8X (К 8 ИКС):',
    detail_logo_url = '/images/catalog/k8x-detail.png',
    logo_url = '/images/catalog/k8x.png',
    founded_year = 2025,
    website = 'https://k8x.io',
    phone = '',
    email = '',
    work_hours = '',
    domain_registered_at = '2025-01-01',
    rating = 5,
    review_count = 5,
    has_public_rating = TRUE,
    verified_contracts = TRUE,
    verified_legal_entity = TRUE,
    verified_data_center = FALSE,
    verified_mining_registry = FALSE,
    show_gallery = FALSE,
    show_article_block = FALSE,
    referral_program_url = 'https://client.k8x.io/source/top-mining',
    referral_promo_text = 'Для клиентов ТОП МАЙНИНГ – уникальное предложение с пониженной комиссией',
    about_html = $html$
<p>K8X — это новый майнинг–пул, созданный для тех, кто ценит стабильность, высокие выплаты и удобство интерфейса. Пул запущен в 2026 году и учитывает актуальные требования рынка.</p>
<p>Мы разработали современное решение для тех, кто ищет пул для майнинга с надёжной инфраструктурой и стабильным подключением на территории России. Пул отличается доступностью в регионах и устойчивой работой даже при сбоях в сети.</p>
<p>K8X обеспечивает высокий процент принятого hashrate и минимальные потери, что напрямую влияет на ваш итоговый результат.</p>
<p>Пул подходит как для частных пользователей, так и для операторов, хостингов и ЦОД.</p>
<h3>Наша экспертиза</h3>
<p>K8X создан командой профессионалов с опытом в кибербезопасности и глубоким пониманием майнинговой индустрии. Мы знаем ценность каждого террахеша и обеспечиваем работу инфраструктуры 24/7.</p>
<h3>Технологии и алгоритмы</h3>
<ul>
<li>SHA-256 — Bitcoin</li>
<li>Scrypt — Litecoin, Dogecoin</li>
</ul>
<h3>Преимущества</h3>
<ul>
<li>Стабильная работа и отсутствие отвалов</li>
<li>доступность в регионах с ограничениями</li>
</ul>
<h3>Доходность</h3>
<ul>
<li>FPPS</li>
<li>комиссия — 1,5%</li>
</ul>
<h3>Удобство</h3>
<ul>
<li>простой и понятный интерфейс</li>
<li>точный расчёт аптайма</li>
</ul>
<h3>Выплаты</h3>
<ul>
<li>минимальный вывод: 0,0002 BTC</li>
</ul>
<h3>Реферальная программа</h3>
<ul>
<li>20% от комиссии пула с приглашённых пользователей</li>
</ul>
<h3>Оцените K8X в деле</h3>
<p>Подключите оборудование и сравните стабильность, выплаты и фактическую доходность.</p>
$html$,
    card_tags = ARRAY[
        'Комиссия пула: 1.5%',
        'Общий хешрейт: 17+ EH/s'
    ],
    card_features = '{}',
    updated_at = NOW()
WHERE name = 'K8X' OR slug = 'k8x';

INSERT INTO organization_mining_pools (
    organization_id, mobile_app, referral_program, total_hashrate,
    reward_distribution, pool_commission, min_payout, payout_frequency, mined_coins
)
SELECT o.id,
    'Есть',
    'Есть',
    '17+ EH/s',
    'FPPS',
    '1.5%',
    '0.0002 BTC',
    'Ежедневно',
    'BTC; LTC+DOGE'
FROM catalog_organizations o
WHERE o.slug = 'k8x'
ON CONFLICT (organization_id) DO UPDATE SET
    mobile_app = EXCLUDED.mobile_app,
    referral_program = EXCLUDED.referral_program,
    total_hashrate = EXCLUDED.total_hashrate,
    reward_distribution = EXCLUDED.reward_distribution,
    pool_commission = EXCLUDED.pool_commission,
    min_payout = EXCLUDED.min_payout,
    payout_frequency = EXCLUDED.payout_frequency,
    mined_coins = EXCLUDED.mined_coins;

SET client_encoding = 'UTF8';

ALTER TABLE catalog_organizations
    ADD COLUMN IF NOT EXISTS logo_theme TEXT NOT NULL DEFAULT '';

INSERT INTO catalog_organizations (
    category_id, name, slug, logo_url, description, rating, review_count, sort_order,
    page_title, detail_logo_url, founded_year, website, phone, email, work_hours,
    domain_registered_at, has_public_rating,
    verified_contracts, verified_legal_entity, verified_data_center, verified_mining_registry,
    show_gallery, show_article_block, about_html, card_tags, card_features
)
SELECT
    c.id,
    'Poolin',
    'poolin',
    '/images/catalog/poolin.png',
    'Майнинг-пул Poolin с поддержкой множества монет и алгоритмов.',
    3.8,
    4,
    6,
    'POOLIN',
    '/images/catalog/poolin-detail.png',
    2017,
    'https://www.poolin.com',
    '',
    '',
    '',
    '2003-05-23',
    TRUE,
    TRUE,
    TRUE,
    FALSE,
    FALSE,
    FALSE,
    FALSE,
    '',
    ARRAY['Комиссия пула: 2.5%', 'Общий хешрейт: 6.13 Eh/s']::TEXT[],
    '{}'::TEXT[]
FROM catalog_categories c
WHERE c.slug = 'mining-pools'
  AND NOT EXISTS (SELECT 1 FROM catalog_organizations o WHERE o.slug = 'poolin');

UPDATE catalog_organizations
SET
    slug = 'poolin',
    tagline = '',
    page_title = 'POOLIN',
    detail_logo_url = '/images/catalog/poolin-detail.png',
    logo_url = '/images/catalog/poolin.png',
    logo_theme = 'light',
    founded_year = 2017,
    website = 'https://www.poolin.com',
    phone = '',
    email = '',
    work_hours = '',
    domain_registered_at = '2003-05-23',
    rating = 3.8,
    review_count = 4,
    has_public_rating = TRUE,
    verified_contracts = TRUE,
    verified_legal_entity = TRUE,
    verified_data_center = FALSE,
    verified_mining_registry = FALSE,
    show_gallery = FALSE,
    show_article_block = FALSE,
    referral_program_url = '',
    referral_promo_text = '',
    about_html = '',
    card_tags = ARRAY[
        'Комиссия пула: 2.5%',
        'Общий хешрейт: 6.13 Eh/s'
    ],
    card_features = '{}',
    updated_at = NOW()
WHERE name = 'Poolin' OR slug = 'poolin';

INSERT INTO organization_mining_pools (
    organization_id, mobile_app, referral_program, total_hashrate,
    reward_distribution, pool_commission, min_payout, payout_frequency, mined_coins
)
SELECT o.id,
    'Есть',
    'Есть',
    '6.13 Eh/s',
    'FPPS',
    '2.5%',
    '0.005 BTC',
    'Ежедневно',
    'DCR, BTC, ZEN, ETH, HNS, ETC, CKB, ZEC, BCH, LTC, STC, DASH'
FROM catalog_organizations o
WHERE o.slug = 'poolin'
ON CONFLICT (organization_id) DO UPDATE SET
    mobile_app = EXCLUDED.mobile_app,
    referral_program = EXCLUDED.referral_program,
    total_hashrate = EXCLUDED.total_hashrate,
    reward_distribution = EXCLUDED.reward_distribution,
    pool_commission = EXCLUDED.pool_commission,
    min_payout = EXCLUDED.min_payout,
    payout_frequency = EXCLUDED.payout_frequency,
    mined_coins = EXCLUDED.mined_coins;

SET client_encoding = 'UTF8';

INSERT INTO catalog_organizations (
    category_id, name, slug, logo_url, description, rating, review_count, sort_order,
    page_title, detail_logo_url, founded_year, website, phone, email, work_hours,
    domain_registered_at, has_public_rating,
    verified_contracts, verified_legal_entity, verified_data_center, verified_mining_registry,
    show_gallery, show_article_block, about_html, card_tags, card_features
)
SELECT
    c.id,
    'Antpool',
    'antpool',
    '/images/catalog/antpool.png',
    'Майнинг-пул Antpool — один из крупнейших пулов для добычи криптовалют.',
    3.6,
    5,
    7,
    'ANTPOOL',
    '/images/catalog/antpool-detail.png',
    2015,
    'https://v3.antpool.com/home',
    '',
    '',
    '',
    '2011-07-04',
    TRUE,
    TRUE,
    TRUE,
    FALSE,
    FALSE,
    FALSE,
    FALSE,
    '',
    ARRAY[
        'Комиссия пула: 4%',
        'Общий хешрейт: 136.00 Eh/s'
    ]::TEXT[],
    ARRAY['Мобильное приложение']::TEXT[]
FROM catalog_categories c
WHERE c.slug = 'mining-pools'
  AND NOT EXISTS (SELECT 1 FROM catalog_organizations o WHERE o.slug = 'antpool');

UPDATE catalog_organizations
SET
    slug = 'antpool',
    tagline = '',
    page_title = 'ANTPOOL',
    detail_logo_url = '/images/catalog/antpool-detail.png',
    logo_url = '/images/catalog/antpool.png',
    founded_year = 2015,
    website = 'https://v3.antpool.com/home',
    phone = '',
    email = '',
    work_hours = '',
    domain_registered_at = '2011-07-04',
    rating = 3.6,
    review_count = 5,
    has_public_rating = TRUE,
    verified_contracts = TRUE,
    verified_legal_entity = TRUE,
    verified_data_center = FALSE,
    verified_mining_registry = FALSE,
    show_gallery = FALSE,
    show_article_block = FALSE,
    referral_program_url = '',
    referral_promo_text = '',
    about_html = '',
    card_tags = ARRAY[
        'Комиссия пула: 4%',
        'Общий хешрейт: 136.00 Eh/s'
    ],
    card_features = ARRAY['Мобильное приложение'],
    updated_at = NOW()
WHERE name = 'Antpool' OR slug = 'antpool';

INSERT INTO organization_mining_pools (
    organization_id, mobile_app, referral_program, total_hashrate,
    reward_distribution, pool_commission, min_payout, payout_frequency, mined_coins
)
SELECT o.id,
    'Есть',
    'Есть',
    '136.00 Eh/s',
    'FPPS',
    '4%',
    '0.005 BTC',
    'Ежедневно',
    'ETH; LTC; ETHW; BCH; DCRN; DASH; CKB; ETC; ZEC; KDA; HNS; DCR; RVN'
FROM catalog_organizations o
WHERE o.slug = 'antpool'
ON CONFLICT (organization_id) DO UPDATE SET
    mobile_app = EXCLUDED.mobile_app,
    referral_program = EXCLUDED.referral_program,
    total_hashrate = EXCLUDED.total_hashrate,
    reward_distribution = EXCLUDED.reward_distribution,
    pool_commission = EXCLUDED.pool_commission,
    min_payout = EXCLUDED.min_payout,
    payout_frequency = EXCLUDED.payout_frequency,
    mined_coins = EXCLUDED.mined_coins;

SET client_encoding = 'UTF8';

UPDATE catalog_organizations
SET
    slug = 'neopool',
    tagline = '',
    page_title = 'NEOPOOL',
    detail_logo_url = '/images/catalog/neopool-detail.png',
    logo_url = '/images/catalog/neopool.png',
    founded_year = 2021,
    website = 'https://neopool.ru',
    phone = '',
    email = '',
    work_hours = '',
    domain_registered_at = NULL,
    rating = 5,
    review_count = 1,
    has_public_rating = TRUE,
    verified_contracts = TRUE,
    verified_legal_entity = TRUE,
    verified_data_center = FALSE,
    verified_mining_registry = FALSE,
    show_gallery = FALSE,
    show_article_block = FALSE,
    referral_program_url = 'https://neopool.com/signUp?token=74182f5aeefc53038cd75a998064a1b3',
    referral_promo_text = 'Для клиентов ТОП МАЙНИНГ – уникальное предложение с пониженной комиссией',
    about_html = $html$
<p>Neopool — майнинг-пул биткоина нового поколения, который за первые месяцы работы показал впечатляющие результаты, войдя в топ мировых пулов.</p>
<p>Разработка проекта началась в 2021 году, тестирование и первые клиенты — 2024 год, полноценный запуск майнинг-пула — 2025 год.</p>
<ul>
<li>Собственные алгоритмы оптимизации — технологические решения на основе экспертизы команды</li>
<li>Сверхбыстрая инфраструктура маршрутизации — глобальная серверная сеть с мониторингом 24/7</li>
<li>Полностью прозрачная модель выплат FPPS — расчеты доходности без скрытых комиссий</li>
<li>Низкий порог выплат — минимум 0.001 BTC с автоматическими ежедневными выплатами</li>
<li>Индивидуальный подход — возможность согласовать специальные тарифы под любые масштабы</li>
<li>Безопасность — два уровня проверки безопасности</li>
<li>Международная поддержка — профессиональный сервис на английском и русском языке</li>
</ul>
$html$,
    card_tags = ARRAY[
        'Общий хешрейт: 12+ EH/s'
    ],
    card_features = ARRAY['Мобильное приложение'],
    updated_at = NOW()
WHERE name = 'Neopool' OR slug = 'neopool';

INSERT INTO organization_mining_pools (
    organization_id, mobile_app, referral_program, total_hashrate,
    reward_distribution, pool_commission, min_payout, payout_frequency, mined_coins
)
SELECT o.id,
    'Есть',
    'Есть',
    '12+ EH/s',
    'FPPS',
    '',
    '0.001 BTC',
    'Ежедневно',
    'BTC'
FROM catalog_organizations o
WHERE o.slug = 'neopool'
ON CONFLICT (organization_id) DO UPDATE SET
    mobile_app = EXCLUDED.mobile_app,
    referral_program = EXCLUDED.referral_program,
    total_hashrate = EXCLUDED.total_hashrate,
    reward_distribution = EXCLUDED.reward_distribution,
    pool_commission = EXCLUDED.pool_commission,
    min_payout = EXCLUDED.min_payout,
    payout_frequency = EXCLUDED.payout_frequency,
    mined_coins = EXCLUDED.mined_coins;
