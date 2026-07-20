SET client_encoding = 'UTF8';

SET client_encoding = 'UTF8';

ALTER TABLE catalog_organizations
    ADD COLUMN IF NOT EXISTS card_promo TEXT NOT NULL DEFAULT '';

ALTER TABLE catalog_organizations
    ADD COLUMN IF NOT EXISTS logo_theme TEXT NOT NULL DEFAULT '';

CREATE TABLE IF NOT EXISTS organization_crypto_wallets (
    organization_id INT PRIMARY KEY REFERENCES catalog_organizations (id) ON DELETE CASCADE,
    supported_coins TEXT NOT NULL DEFAULT '',
    platform TEXT NOT NULL DEFAULT '',
    commission TEXT NOT NULL DEFAULT '',
    commission_calculation TEXT NOT NULL DEFAULT '',
    extras TEXT[] NOT NULL DEFAULT '{}'
);

UPDATE catalog_organizations
SET
    slug = 'metamask',
    tagline = '',
    page_title = 'MetaMask',
    detail_logo_url = '/images/catalog/metamask-detail.png',
    logo_url = '/images/catalog/metamask.png',
    logo_theme = 'light',
    founded_year = 2015,
    website = 'https://metamask.io/',
    phone = '',
    email = '',
    work_hours = '',
    domain_registered_at = '2015-02-07',
    verified_contracts = TRUE,
    verified_legal_entity = TRUE,
    verified_data_center = FALSE,
    verified_mining_registry = FALSE,
    show_gallery = FALSE,
    show_article_block = TRUE,
    referral_program_url = 'https://metamask.io/',
    referral_promo_text = 'Для клиентов ТОП МАЙНИНГ – уникальное предложение с пониженной комиссией',
    about_html = $html$
<p>MetaMask — это один из самых популярных и надёжных криптокошельков, который открывает доступ к экосистеме Ethereum и другим совместимым блокчейн-сетям. Независимо от того, новичок вы в мире криптовалют или опытный пользователь DeFi, NFT и dApps, MetaMask станет вашим удобным и безопасным инструментом для работы с цифровыми активами.</p>
<h3>Что такое MetaMask?</h3>
<p>MetaMask — это браузерное расширение и мобильное приложение, позволяющее безопасно хранить, отправлять и получать криптовалюты, а также взаимодействовать с децентрализованными приложениями (dApps) без посредников. Кошелёк поддерживает токены стандарта ERC-20, ERC-721 (NFT) и работает с десятками EVM-совместимых сетей: Ethereum, Binance Smart Chain, Polygon, Arbitrum, Optimism, Avalanche и другими.</p>
<h3>Ключевые преимущества MetaMask</h3>
<ul>
<li><strong>Полный контроль над средствами</strong> — MetaMask — это non-custodial кошелёк: только вы владеете приватными ключами. Никакие третьи стороны не могут заблокировать или отнять ваши активы.</li>
<li><strong>Удобство и простота</strong> — установите расширение в браузер (Chrome, Firefox, Brave и др.) или скачайте приложение на iOS и Android — и уже через несколько минут вы сможете управлять криптовалютами и подключаться к Web3-сервисам.</li>
<li><strong>Интеграция с dApps</strong> — MetaMask автоматически подключается к тысячам децентрализованных приложений: обмен токенов на Uniswap и SushiSwap, покупка NFT на OpenSea и Blur, стейкинг и пулы ликвидности в Aave, Compound, Yearn.</li>
<li><strong>Поддержка множества сетей</strong> — добавляйте кастомные блокчейны в один клик, переключайтесь между сетями и экономьте на комиссиях, выбирая оптимальную сеть для транзакций.</li>
<li><strong>Безопасность и конфиденциальность</strong> — ваши данные не передаются третьим лицам. Все операции подтверждаются вручную, а сид-фраза остаётся только у вас.</li>
</ul>
<h3>Как начать использовать MetaMask?</h3>
<ol>
<li>Перейдите на официальный сайт metamask.io и скачайте расширение или мобильное приложение.</li>
<li>Создайте новый кошелёк и надёжно запишите 12-словную сид-фразу — это единственный способ восстановить доступ.</li>
<li>Пополните баланс: купите ETH через интегрированные обменники или переведите средства с биржи.</li>
<li>Подключитесь к любимым dApps и начните использовать возможности Web3!</li>
</ol>
<h3>MetaMask для новичков и профессионалов</h3>
<p>Благодаря интуитивному интерфейсу MetaMask идеально подходит для тех, кто только делает первые шаги в криптомире. Продвинутые пользователи оценят гибкие настройки газовых комиссий, поддержку hardware-кошельков (Ledger, Trezor) и работу с тестовыми сетями (Sepolia и др.).</p>
<h3>Безопасность — в ваших руках</h3>
<p>MetaMask не хранит ваши данные и не несёт ответственности за утерянные средства. Важно:</p>
<ul>
<li>Никогда не делитесь своей сид-фразой.</li>
<li>Не вводите ключи на подозрительных сайтах.</li>
<li>Используйте только официальные источники для загрузки.</li>
</ul>
<p>MetaMask — ваш первый шаг в будущее децентрализации. Неважно, интересуетесь ли вы DeFi, хотите купить первое NFT или участвовать в новых блокчейн-проектах — MetaMask открывает двери в мир без границ и посредников.</p>
$html$,
    card_promo = '',
    card_tags = '{}',
    card_features = ARRAY[
        'Мобильное приложение',
        'Поддержка NFT'
    ],
    updated_at = NOW()
WHERE name = 'MetaMask' OR slug = 'metamask';

INSERT INTO organization_crypto_wallets (
    organization_id,
    supported_coins,
    platform,
    commission,
    commission_calculation,
    extras
)
SELECT o.id,
    'Ethereum; Polygon; Fantom; Avalanche; Optimistic Ethereum; Arbitrum One; Aurora Network; Cronos; Harmony; Celo; EOS',
    'ПК; Мобильное приложение',
    'Есть',
    'От криптовалюты',
    ARRAY['Поддержка NFT']
FROM catalog_organizations o
WHERE o.slug = 'metamask'
ON CONFLICT (organization_id) DO UPDATE SET
    supported_coins = EXCLUDED.supported_coins,
    platform = EXCLUDED.platform,
    commission = EXCLUDED.commission,
    commission_calculation = EXCLUDED.commission_calculation,
    extras = EXCLUDED.extras;

SET client_encoding = 'UTF8';

UPDATE catalog_organizations
SET
    card_tags = ARRAY[
        'Поддержка монет: BTC; ETH; SOL; ADA; DOT; XRP; LTC; BCH; DOGE; TRX; AVAX; MATIC; ATOM; XLM; ALGO; FIL; EOS; XTZ; DASH; ZEC; DCR; RVN; CKB; KDA; HNS; ETC; NEAR; APT; SUI; TON'
    ],
    updated_at = NOW()
WHERE slug = 'exodus';

UPDATE catalog_organizations
SET
    card_tags = ARRAY[
        'Поддержка монет: BTC; BCH'
    ],
    updated_at = NOW()
WHERE slug = 'blockchain-wallet';

UPDATE catalog_organizations
SET
    card_tags = ARRAY[
        'Поддержка монет: SOL; ETH; BTC; MATIC; SUI; APT; AVAX; BNB; OP; ARB; BASE'
    ],
    updated_at = NOW()
WHERE slug = 'phantom';

SET client_encoding = 'UTF8';

CREATE TABLE IF NOT EXISTS organization_crypto_wallets (
    organization_id INT PRIMARY KEY REFERENCES catalog_organizations (id) ON DELETE CASCADE,
    supported_coins TEXT NOT NULL DEFAULT '',
    platform TEXT NOT NULL DEFAULT '',
    commission TEXT NOT NULL DEFAULT '',
    commission_calculation TEXT NOT NULL DEFAULT '',
    extras TEXT[] NOT NULL DEFAULT '{}'
);

UPDATE catalog_organizations
SET
    slug = 'blockchain-wallet',
    tagline = '',
    page_title = 'Blockchain Wallet',
    detail_logo_url = '/images/catalog/blockchain-wallet-detail.png',
    logo_url = '/images/catalog/blockchain-wallet.png',
    logo_theme = 'light',
    founded_year = 2011,
    website = 'https://www.blockchain.com/ru/wallet',
    phone = '',
    email = '',
    work_hours = '',
    domain_registered_at = '2011-03-08',
    verified_contracts = TRUE,
    verified_legal_entity = TRUE,
    verified_data_center = FALSE,
    verified_mining_registry = FALSE,
    show_gallery = FALSE,
    show_article_block = FALSE,
    referral_program_url = '',
    referral_promo_text = '',
    about_html = '',
    card_promo = '',
    card_tags = ARRAY[
        'Поддержка монет: Bitcoin; Bitcoin Cash; Ethereum; Stellar; USD Digital; Tether'
    ],
    card_features = ARRAY[
        'Мобильное приложение',
        'Браузер ПК'
    ],
    updated_at = NOW()
WHERE name = 'Blockchain Wallet' OR slug = 'blockchain-wallet';

INSERT INTO organization_crypto_wallets (
    organization_id,
    supported_coins,
    platform,
    commission,
    commission_calculation,
    extras
)
SELECT o.id,
    'Bitcoin; Bitcoin Cash; Ethereum; Stellar; USD Digital; Tether',
    'Мобильное приложение; Браузер ПК',
    'Есть',
    'От размера транзакции',
    '{}'::TEXT[]
FROM catalog_organizations o
WHERE o.slug = 'blockchain-wallet'
ON CONFLICT (organization_id) DO UPDATE SET
    supported_coins = EXCLUDED.supported_coins,
    platform = EXCLUDED.platform,
    commission = EXCLUDED.commission,
    commission_calculation = EXCLUDED.commission_calculation,
    extras = EXCLUDED.extras;

SET client_encoding = 'UTF8';

CREATE TABLE IF NOT EXISTS organization_crypto_wallets (
    organization_id INT PRIMARY KEY REFERENCES catalog_organizations (id) ON DELETE CASCADE,
    supported_coins TEXT NOT NULL DEFAULT '',
    platform TEXT NOT NULL DEFAULT '',
    commission TEXT NOT NULL DEFAULT '',
    commission_calculation TEXT NOT NULL DEFAULT '',
    extras TEXT[] NOT NULL DEFAULT '{}'
);

UPDATE catalog_organizations
SET
    slug = 'trust-wallet',
    tagline = '',
    page_title = 'Trust Wallet',
    detail_logo_url = '/images/catalog/trust-wallet-detail.png',
    logo_url = '/images/catalog/trust-wallet.png',
    logo_theme = 'light',
    founded_year = 2017,
    website = 'https://trustwallet.com/ru/',
    phone = '',
    email = '',
    work_hours = '',
    domain_registered_at = '2005-10-14',
    verified_contracts = TRUE,
    verified_legal_entity = TRUE,
    verified_data_center = FALSE,
    verified_mining_registry = FALSE,
    show_gallery = FALSE,
    show_article_block = FALSE,
    referral_program_url = '',
    referral_promo_text = '',
    about_html = '',
    card_promo = '',
    card_tags = ARRAY[
        'Поддержка монет: Ethereum; Bitcoin; Bitcoin Cash; Litecoin; Ripple; Ethereum Classic; Tron; Dogecoin; Cosmos; Binance Coin; BEP-20'
    ],
    card_features = ARRAY[
        'Мобильное приложение'
    ],
    updated_at = NOW()
WHERE name = 'Trust Wallet' OR slug = 'trust-wallet';

INSERT INTO organization_crypto_wallets (
    organization_id,
    supported_coins,
    platform,
    commission,
    commission_calculation,
    extras
)
SELECT o.id,
    'Ethereum; Bitcoin; Bitcoin Cash; Litecoin; Ripple; Ethereum Classic; Tron; Dogecoin; Cosmos; Binance Coin; BEP-20',
    'Мобильное приложение',
    'Есть',
    'От криптовалюты',
    '{}'::TEXT[]
FROM catalog_organizations o
WHERE o.slug = 'trust-wallet'
ON CONFLICT (organization_id) DO UPDATE SET
    supported_coins = EXCLUDED.supported_coins,
    platform = EXCLUDED.platform,
    commission = EXCLUDED.commission,
    commission_calculation = EXCLUDED.commission_calculation,
    extras = EXCLUDED.extras;

SET client_encoding = 'UTF8';

CREATE TABLE IF NOT EXISTS organization_crypto_wallets (
    organization_id INT PRIMARY KEY REFERENCES catalog_organizations (id) ON DELETE CASCADE,
    supported_coins TEXT NOT NULL DEFAULT '',
    platform TEXT NOT NULL DEFAULT '',
    commission TEXT NOT NULL DEFAULT '',
    commission_calculation TEXT NOT NULL DEFAULT '',
    extras TEXT[] NOT NULL DEFAULT '{}'
);

UPDATE catalog_organizations
SET
    slug = 'exodus',
    tagline = '',
    page_title = 'Exodus',
    detail_logo_url = '/images/catalog/exodus-detail.png',
    logo_url = '/images/catalog/exodus.png',
    logo_theme = 'light',
    founded_year = 2015,
    website = 'https://www.exodus.com/',
    phone = '',
    email = '',
    work_hours = '',
    domain_registered_at = '1994-12-15',
    verified_contracts = TRUE,
    verified_legal_entity = TRUE,
    verified_data_center = FALSE,
    verified_mining_registry = FALSE,
    show_gallery = FALSE,
    show_article_block = FALSE,
    referral_program_url = '',
    referral_promo_text = '',
    about_html = '',
    card_promo = '',
    card_tags = ARRAY[
        'Поддержка монет: Bitcoin; Ethereum; Bitcoin Cash; Litecoin; TRON; Dash; Binance Coin; Ethereum Classic; EOS; Zcash'
    ],
    card_features = ARRAY[
        'Браузер ПК',
        'Мобильное приложение'
    ],
    updated_at = NOW()
WHERE name = 'Exodus' OR slug = 'exodus';

INSERT INTO organization_crypto_wallets (
    organization_id,
    supported_coins,
    platform,
    commission,
    commission_calculation,
    extras
)
SELECT o.id,
    'Bitcoin; Ethereum; Bitcoin Cash; Litecoin; TRON; Dash; Binance Coin; Ethereum Classic; EOS; Zcash',
    'Браузер ПК; Мобильное приложение',
    'Есть',
    'От криптовалюты',
    '{}'::TEXT[]
FROM catalog_organizations o
WHERE o.slug = 'exodus'
ON CONFLICT (organization_id) DO UPDATE SET
    supported_coins = EXCLUDED.supported_coins,
    platform = EXCLUDED.platform,
    commission = EXCLUDED.commission,
    commission_calculation = EXCLUDED.commission_calculation,
    extras = EXCLUDED.extras;

SET client_encoding = 'UTF8';

CREATE TABLE IF NOT EXISTS organization_crypto_wallets (
    organization_id INT PRIMARY KEY REFERENCES catalog_organizations (id) ON DELETE CASCADE,
    supported_coins TEXT NOT NULL DEFAULT '',
    platform TEXT NOT NULL DEFAULT '',
    commission TEXT NOT NULL DEFAULT '',
    commission_calculation TEXT NOT NULL DEFAULT '',
    extras TEXT[] NOT NULL DEFAULT '{}'
);

UPDATE catalog_organizations
SET
    slug = 'phantom',
    tagline = '',
    page_title = 'Phantom',
    detail_logo_url = '/images/catalog/phantom-detail.png',
    logo_url = '/images/catalog/phantom.png',
    logo_theme = 'light',
    founded_year = 2020,
    website = 'https://phantom.app/',
    phone = '',
    email = '',
    work_hours = '',
    domain_registered_at = '2020-11-21',
    verified_contracts = TRUE,
    verified_legal_entity = TRUE,
    verified_data_center = FALSE,
    verified_mining_registry = FALSE,
    show_gallery = FALSE,
    show_article_block = FALSE,
    referral_program_url = '',
    referral_promo_text = '',
    about_html = '',
    card_promo = '',
    card_tags = ARRAY[
        'Поддержка монет: SOL; Raydium; Serum; USDT; USDC'
    ],
    card_features = ARRAY[
        'Мобильное приложение',
        'Браузер ПК'
    ],
    updated_at = NOW()
WHERE name = 'Phantom' OR slug = 'phantom';

INSERT INTO organization_crypto_wallets (
    organization_id,
    supported_coins,
    platform,
    commission,
    commission_calculation,
    extras
)
SELECT o.id,
    'SOL; Raydium; Serum; USDT; USDC',
    'Мобильное приложение; Браузер ПК',
    'Есть',
    'От криптовалюты',
    '{}'::TEXT[]
FROM catalog_organizations o
WHERE o.slug = 'phantom'
ON CONFLICT (organization_id) DO UPDATE SET
    supported_coins = EXCLUDED.supported_coins,
    platform = EXCLUDED.platform,
    commission = EXCLUDED.commission,
    commission_calculation = EXCLUDED.commission_calculation,
    extras = EXCLUDED.extras;
