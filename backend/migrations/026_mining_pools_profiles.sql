SET client_encoding = 'UTF8';

-- Майнинг-пулы с полным профилем (TPool, Trustpool, Antpool, F2Pool).
-- На главной публикуются только эти + ранее заполненные K8X/Neopool/RUPOOL/Luxor.

DELETE FROM catalog_organizations
WHERE slug IN ('masspool-io', 'viabtc', 'poolin')
  AND category_id = (SELECT id FROM catalog_categories WHERE slug = 'mining-pools');

-- TPool (mining-pools)
INSERT INTO catalog_organizations (
    category_id, name, slug, logo_url, detail_logo_url, logo_theme,
    description, tagline, page_title, founded_year, website,
    phone, email, work_hours, office_city, site_city,
    rating, review_count, has_public_rating,
    verified_contracts, verified_legal_entity, verified_data_center, verified_mining_registry,
    show_gallery, show_article_block,
    referral_program_url, referral_promo_text,
    about_html, card_tags, card_features, sort_order, is_published
)
SELECT
    c.id,
    'TPool',
    'tpool',
    '/images/catalog/tpool.png',
    '/images/catalog/tpool-detail.png',
    'dark',
    'Майнинг-пул для крупных майнеров от команды Trustpool: PPS+, комиссия 0.9%, ежедневные выплаты.',
    '',
    'TPOOL (Т пул):',
    2025,
    'https://tpool.io',
    '',
    '',
    '',
    '',
    '',
    0,
    0,
    FALSE,
    TRUE,
    TRUE,
    FALSE,
    FALSE,
    FALSE,
    FALSE,
    'https://tpool.io',
    'Для клиентов ТОП МАЙНИНГ – уникальное предложение с пониженной комиссией',
    $html$
<p>TPool — майнинг-пул для крупных майнеров от команды Trustpool. Его создали на основе шестилетнего опыта разработки майнинг-сервисов и общения с майнерами, поэтому пул значительно усовершенствовался:</p>
<ul>
<li><strong>TPool — теперь №1 по доходности в мире.</strong> В нём обновлённый механизм распределения и низкие комиссии. Можно получить от асиков максимум.</li>
<li><strong>Стабильность усилена.</strong> Инфраструктуру и код пула обновили — теперь он работает быстрее и с меньшими рисками просадок.</li>
<li><strong>Максимальная удобность.</strong> Команда предварительно собирала пожелания клиентов, чтобы разработать максимально удобный интерфейс. Найти нужную опцию можно за пару секунд.</li>
<li><strong>Новые приложения на iOS и Android.</strong> Все инструменты управления размещаются наглядно на одном экране. Дополнительно в пару кликов подключается умный бот для мониторинга внутри Telegram.</li>
</ul>
$html$,
    ARRAY[
        'Комиссия пула: 0.9%',
        'Добываемые монеты: BTC; LTC; BCH; ZEC; KAS; DASH; DOGE; ETC.'
    ],
    ARRAY[
        'Мобильное приложение',
        'PPS+',
        'Реферальная программа'
    ],
    COALESCE((SELECT MAX(o.sort_order) + 1 FROM catalog_organizations o WHERE o.category_id = c.id), 5),
    TRUE
FROM catalog_categories c
WHERE c.slug = 'mining-pools'
  AND NOT EXISTS (
      SELECT 1 FROM catalog_organizations o WHERE o.slug = 'tpool'
  );

UPDATE catalog_organizations
SET
    name = 'TPool',
    slug = 'tpool',
    tagline = '',
    page_title = 'TPOOL (Т пул):',
    logo_url = '/images/catalog/tpool.png',
    detail_logo_url = '/images/catalog/tpool-detail.png',
    logo_theme = 'dark',
    founded_year = 2025,
    website = 'https://tpool.io',
    rating = 0,
    review_count = 0,
    has_public_rating = FALSE,
    verified_contracts = TRUE,
    verified_legal_entity = TRUE,
    verified_data_center = FALSE,
    verified_mining_registry = FALSE,
    show_gallery = FALSE,
    show_article_block = FALSE,
    referral_program_url = 'https://tpool.io',
    referral_promo_text = 'Для клиентов ТОП МАЙНИНГ – уникальное предложение с пониженной комиссией',
    description = 'Майнинг-пул для крупных майнеров от команды Trustpool: PPS+, комиссия 0.9%, ежедневные выплаты.',
    about_html = $html$
<p>TPool — майнинг-пул для крупных майнеров от команды Trustpool. Его создали на основе шестилетнего опыта разработки майнинг-сервисов и общения с майнерами, поэтому пул значительно усовершенствовался:</p>
<ul>
<li><strong>TPool — теперь №1 по доходности в мире.</strong> В нём обновлённый механизм распределения и низкие комиссии. Можно получить от асиков максимум.</li>
<li><strong>Стабильность усилена.</strong> Инфраструктуру и код пула обновили — теперь он работает быстрее и с меньшими рисками просадок.</li>
<li><strong>Максимальная удобность.</strong> Команда предварительно собирала пожелания клиентов, чтобы разработать максимально удобный интерфейс. Найти нужную опцию можно за пару секунд.</li>
<li><strong>Новые приложения на iOS и Android.</strong> Все инструменты управления размещаются наглядно на одном экране. Дополнительно в пару кликов подключается умный бот для мониторинга внутри Telegram.</li>
</ul>
$html$,
    card_tags = ARRAY[
        'Комиссия пула: 0.9%',
        'Добываемые монеты: BTC; LTC; BCH; ZEC; KAS; DASH; DOGE; ETC.'
    ],
    card_features = ARRAY[
        'Мобильное приложение',
        'PPS+',
        'Реферальная программа'
    ],
    is_published = TRUE,
    updated_at = NOW()
WHERE slug = 'tpool';

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
    '4 EH/s',
    'PPS+',
    '0.9%',
    '0.001 BTC',
    'Ежедневно',
    'BTC; LTC; BCH; ZEC; KAS; DASH; DOGE; ETC.'
FROM catalog_organizations o
WHERE o.slug = 'tpool'
ON CONFLICT (organization_id) DO UPDATE SET
    mobile_app = EXCLUDED.mobile_app,
    referral_program = EXCLUDED.referral_program,
    total_hashrate = EXCLUDED.total_hashrate,
    reward_distribution = EXCLUDED.reward_distribution,
    pool_commission = EXCLUDED.pool_commission,
    min_payout = EXCLUDED.min_payout,
    payout_frequency = EXCLUDED.payout_frequency,
    mined_coins = EXCLUDED.mined_coins;


-- Trustpool (mining-pools)
INSERT INTO catalog_organizations (
    category_id, name, slug, logo_url, detail_logo_url, logo_theme,
    description, tagline, page_title, founded_year, website,
    phone, email, work_hours, office_city, site_city,
    rating, review_count, has_public_rating,
    verified_contracts, verified_legal_entity, verified_data_center, verified_mining_registry,
    show_gallery, show_article_block,
    referral_program_url, referral_promo_text,
    about_html, card_tags, card_features, sort_order, is_published
)
SELECT
    c.id,
    'Trustpool',
    'trustpool',
    '/images/catalog/trustpool.png',
    '/images/catalog/trustpool-detail.png',
    'dark',
    'Международный майнинг-пул из топ-10 мира: PPS+, комиссия 1%, ежедневные выплаты.',
    '',
    'TRUSTPOOL (Траст пул):',
    2019,
    'https://trustpool.cc',
    '',
    '',
    '',
    '',
    '',
    0,
    0,
    FALSE,
    TRUE,
    TRUE,
    FALSE,
    FALSE,
    FALSE,
    FALSE,
    'https://trustpool.cc',
    'Для клиентов ТОП МАЙНИНГ – уникальное предложение с пониженной комиссией',
    $html$
<p>Trustpool — международный майнинг-пул, который входит в топ-10 пулов мира по совокупному хешрейту монет. На пуле можно добывать шесть основных криптовалют: Bitcoin, Bitcoin Cash, Litecoin, DASH, Kaspa и Zcash — а также merged-монеты, которые добавляются к ним. Проект существует с 2019 года, и за это время зарекомендовал себя на рынке:</p>
<ul>
<li><strong>Низкая комиссия на майнинг — 1%</strong>, выплаты поступают ежедневно с 5:00 до 13:00 МСК.</li>
<li><strong>Круглосуточная мультиязычная техподдержка</strong>, которая целиком состоит из опытных майнеров. В любое время суток можно получить квалифицированную помощь в течение пары минут.</li>
<li><strong>Удобное приложение для мониторинга и телеграм-бот</strong>, который следит за хешрейтом.</li>
</ul>
$html$,
    ARRAY[
        'Комиссия пула: 1%',
        'Добываемые монеты: BTC; LTC; BCH; ZEC; KAS; DASH; DOGE; BEL; FB; PEP; DINGO'
    ],
    ARRAY[
        'Мобильное приложение',
        'PPS+',
        'Реферальная программа'
    ],
    COALESCE((SELECT MAX(o.sort_order) + 1 FROM catalog_organizations o WHERE o.category_id = c.id), 6),
    TRUE
FROM catalog_categories c
WHERE c.slug = 'mining-pools'
  AND NOT EXISTS (
      SELECT 1 FROM catalog_organizations o WHERE o.slug = 'trustpool'
  );

UPDATE catalog_organizations
SET
    name = 'Trustpool',
    slug = 'trustpool',
    tagline = '',
    page_title = 'TRUSTPOOL (Траст пул):',
    logo_url = '/images/catalog/trustpool.png',
    detail_logo_url = '/images/catalog/trustpool-detail.png',
    logo_theme = 'dark',
    founded_year = 2019,
    website = 'https://trustpool.cc',
    rating = 0,
    review_count = 0,
    has_public_rating = FALSE,
    verified_contracts = TRUE,
    verified_legal_entity = TRUE,
    verified_data_center = FALSE,
    verified_mining_registry = FALSE,
    show_gallery = FALSE,
    show_article_block = FALSE,
    referral_program_url = 'https://trustpool.cc',
    referral_promo_text = 'Для клиентов ТОП МАЙНИНГ – уникальное предложение с пониженной комиссией',
    description = 'Международный майнинг-пул из топ-10 мира: PPS+, комиссия 1%, ежедневные выплаты.',
    about_html = $html$
<p>Trustpool — международный майнинг-пул, который входит в топ-10 пулов мира по совокупному хешрейту монет. На пуле можно добывать шесть основных криптовалют: Bitcoin, Bitcoin Cash, Litecoin, DASH, Kaspa и Zcash — а также merged-монеты, которые добавляются к ним. Проект существует с 2019 года, и за это время зарекомендовал себя на рынке:</p>
<ul>
<li><strong>Низкая комиссия на майнинг — 1%</strong>, выплаты поступают ежедневно с 5:00 до 13:00 МСК.</li>
<li><strong>Круглосуточная мультиязычная техподдержка</strong>, которая целиком состоит из опытных майнеров. В любое время суток можно получить квалифицированную помощь в течение пары минут.</li>
<li><strong>Удобное приложение для мониторинга и телеграм-бот</strong>, который следит за хешрейтом.</li>
</ul>
$html$,
    card_tags = ARRAY[
        'Комиссия пула: 1%',
        'Добываемые монеты: BTC; LTC; BCH; ZEC; KAS; DASH; DOGE; BEL; FB; PEP; DINGO'
    ],
    card_features = ARRAY[
        'Мобильное приложение',
        'PPS+',
        'Реферальная программа'
    ],
    is_published = TRUE,
    updated_at = NOW()
WHERE slug = 'trustpool';

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
    '10 EH/s',
    'PPS+',
    '1%',
    '0.001 BTC',
    'Ежедневно',
    'BTC; LTC; BCH; ZEC; KAS; DASH; DOGE; BEL; FB; PEP; DINGO'
FROM catalog_organizations o
WHERE o.slug = 'trustpool'
ON CONFLICT (organization_id) DO UPDATE SET
    mobile_app = EXCLUDED.mobile_app,
    referral_program = EXCLUDED.referral_program,
    total_hashrate = EXCLUDED.total_hashrate,
    reward_distribution = EXCLUDED.reward_distribution,
    pool_commission = EXCLUDED.pool_commission,
    min_payout = EXCLUDED.min_payout,
    payout_frequency = EXCLUDED.payout_frequency,
    mined_coins = EXCLUDED.mined_coins;


-- Antpool (mining-pools)
INSERT INTO catalog_organizations (
    category_id, name, slug, logo_url, detail_logo_url, logo_theme,
    description, tagline, page_title, founded_year, website,
    phone, email, work_hours, office_city, site_city,
    domain_registered_at,
    rating, review_count, has_public_rating,
    verified_contracts, verified_legal_entity, verified_data_center, verified_mining_registry,
    show_gallery, show_article_block,
    referral_program_url, referral_promo_text,
    about_html, card_tags, card_features, sort_order, is_published
)
SELECT
    c.id,
    'Antpool',
    'antpool',
    '/images/catalog/antpool.png',
    '/images/catalog/antpool-detail.png',
    'light',
    'Майнинг-пул Antpool — один из крупнейших пулов для добычи криптовалют.',
    '',
    'ANTPOOL',
    2015,
    'https://v3.antpool.com/home',
    '',
    '',
    '',
    '',
    '',
    '2011-07-04',
    3.6,
    5,
    TRUE,
    TRUE,
    TRUE,
    FALSE,
    FALSE,
    FALSE,
    FALSE,
    '',
    '',
    '',
    ARRAY[
        'Комиссия пула: 4%',
        'Добываемые монеты: ETH; LTC; ETHW; BCH; DCRN; DASH; CKB; ETC; ZEC; KDA; HNS; DCR; RVN'
    ],
    ARRAY[
        'Мобильное приложение',
        'FPPS',
        'Реферальная программа'
    ],
    COALESCE((SELECT MAX(o.sort_order) + 1 FROM catalog_organizations o WHERE o.category_id = c.id), 7),
    TRUE
FROM catalog_categories c
WHERE c.slug = 'mining-pools'
  AND NOT EXISTS (
      SELECT 1 FROM catalog_organizations o WHERE o.slug = 'antpool'
  );

UPDATE catalog_organizations
SET
    name = 'Antpool',
    slug = 'antpool',
    tagline = '',
    page_title = 'ANTPOOL',
    logo_url = '/images/catalog/antpool.png',
    detail_logo_url = '/images/catalog/antpool-detail.png',
    logo_theme = 'light',
    founded_year = 2015,
    website = 'https://v3.antpool.com/home',
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
    description = 'Майнинг-пул Antpool — один из крупнейших пулов для добычи криптовалют.',
    about_html = '',
    card_tags = ARRAY[
        'Комиссия пула: 4%',
        'Добываемые монеты: ETH; LTC; ETHW; BCH; DCRN; DASH; CKB; ETC; ZEC; KDA; HNS; DCR; RVN'
    ],
    card_features = ARRAY[
        'Мобильное приложение',
        'FPPS',
        'Реферальная программа'
    ],
    is_published = TRUE,
    updated_at = NOW()
WHERE slug = 'antpool';

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


-- F2Pool (mining-pools)
INSERT INTO catalog_organizations (
    category_id, name, slug, logo_url, detail_logo_url, logo_theme,
    description, tagline, page_title, founded_year, website,
    phone, email, work_hours, office_city, site_city,
    domain_registered_at,
    rating, review_count, has_public_rating,
    verified_contracts, verified_legal_entity, verified_data_center, verified_mining_registry,
    show_gallery, show_article_block,
    referral_program_url, referral_promo_text,
    about_html, card_tags, card_features, sort_order, is_published
)
SELECT
    c.id,
    'F2Pool',
    'f2pool',
    '/images/catalog/f2pool.png',
    '/images/catalog/f2pool-detail.png',
    'light',
    'Майнинг-пул F2Pool с поддержкой множества монет и алгоритмов.',
    '',
    'F2POOL',
    2013,
    'https://www.f2pool.com/',
    '',
    '',
    '',
    '',
    '',
    '2013-04-23',
    4.5,
    4,
    TRUE,
    TRUE,
    TRUE,
    FALSE,
    FALSE,
    FALSE,
    FALSE,
    '',
    '',
    '',
    ARRAY[
        'Комиссия пула: 2.5%',
        'Добываемые монеты: ZEPH; SPACE; BTC; LTC+DOGE; KAS; ETC; ETC+ZIL; ETHW; BCH; CKB; BEL; RVN; DNX; IRON; ZEC; ZEN; KDA; HNS; DASH; SC; CFX; ALEO'
    ],
    ARRAY[
        'Мобильное приложение',
        'PPLNS; FPPS; PPS+',
        'Реферальная программа'
    ],
    COALESCE((SELECT MAX(o.sort_order) + 1 FROM catalog_organizations o WHERE o.category_id = c.id), 8),
    TRUE
FROM catalog_categories c
WHERE c.slug = 'mining-pools'
  AND NOT EXISTS (
      SELECT 1 FROM catalog_organizations o WHERE o.slug = 'f2pool'
  );

UPDATE catalog_organizations
SET
    name = 'F2Pool',
    slug = 'f2pool',
    tagline = '',
    page_title = 'F2POOL',
    logo_url = '/images/catalog/f2pool.png',
    detail_logo_url = '/images/catalog/f2pool-detail.png',
    logo_theme = 'light',
    founded_year = 2013,
    website = 'https://www.f2pool.com/',
    domain_registered_at = '2013-04-23',
    rating = 4.5,
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
    description = 'Майнинг-пул F2Pool с поддержкой множества монет и алгоритмов.',
    about_html = '',
    card_tags = ARRAY[
        'Комиссия пула: 2.5%',
        'Добываемые монеты: ZEPH; SPACE; BTC; LTC+DOGE; KAS; ETC; ETC+ZIL; ETHW; BCH; CKB; BEL; RVN; DNX; IRON; ZEC; ZEN; KDA; HNS; DASH; SC; CFX; ALEO'
    ],
    card_features = ARRAY[
        'Мобильное приложение',
        'PPLNS; FPPS; PPS+',
        'Реферальная программа'
    ],
    is_published = TRUE,
    updated_at = NOW()
WHERE slug = 'f2pool';

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
    '71.22 Eh/s',
    'PPLNS; FPPS; PPS+',
    '2.5%',
    '0.005 BTC',
    'Ежедневно',
    'ZEPH; SPACE; BTC; LTC+DOGE; KAS; ETC; ETC+ZIL; ETHW; BCH; CKB; BEL; RVN; DNX; IRON; ZEC; ZEN; KDA; HNS; DASH; SC; CFX; ALEO'
FROM catalog_organizations o
WHERE o.slug = 'f2pool'
ON CONFLICT (organization_id) DO UPDATE SET
    mobile_app = EXCLUDED.mobile_app,
    referral_program = EXCLUDED.referral_program,
    total_hashrate = EXCLUDED.total_hashrate,
    reward_distribution = EXCLUDED.reward_distribution,
    pool_commission = EXCLUDED.pool_commission,
    min_payout = EXCLUDED.min_payout,
    payout_frequency = EXCLUDED.payout_frequency,
    mined_coins = EXCLUDED.mined_coins;

-- Порядок на главной
UPDATE catalog_organizations SET sort_order = 1, is_published = TRUE WHERE slug = 'k8x';
UPDATE catalog_organizations SET sort_order = 2, is_published = TRUE WHERE slug = 'neopool';
UPDATE catalog_organizations SET sort_order = 3, is_published = TRUE WHERE slug = 'rupool-pro';
UPDATE catalog_organizations SET sort_order = 4, is_published = TRUE WHERE slug = 'luxor-mining-pool';
UPDATE catalog_organizations SET sort_order = 5, is_published = TRUE WHERE slug = 'tpool';
UPDATE catalog_organizations SET sort_order = 6, is_published = TRUE WHERE slug = 'trustpool';
UPDATE catalog_organizations SET sort_order = 7, is_published = TRUE WHERE slug = 'antpool';
UPDATE catalog_organizations SET sort_order = 8, is_published = TRUE WHERE slug = 'f2pool';