-- Карточки: 1-MINING, Antpool, Canaan + категории криптобиржи и кошельки
SET client_encoding = 'UTF8';

-- 1-MINING (майнинг-отель)
UPDATE catalog_organizations
SET
    slug = '1-mining',
    founded_year = 2019,
    office_city = 'Ленинградская область',
    site_city = 'Ленинградская обл.',
    has_public_rating = FALSE,
    verified_contracts = TRUE,
    verified_legal_entity = TRUE,
    verified_mining_registry = TRUE,
    card_tags = ARRAY[
        'Цена за кВт/ч: от 5 руб с НДС',
        'Мощности площадок: 19 МВт'
    ],
    card_features = ARRAY[
        '20 мин от СПб',
        'Газовая генерация',
        'От 300 кВт'
    ],
    updated_at = NOW()
WHERE name = '1-MINING';

INSERT INTO organization_mining_hotels (
    organization_id, price_per_kwh_from, price_per_kwh_label,
    sites_count, total_capacity_mw, site_cities, min_devices_label, energy_type
)
SELECT o.id, 5, 'от 5 руб с НДС', 1, 19, 'Ленинградская обл.', 'от 300 кВт', 'Газовая генерация'
FROM catalog_organizations o
WHERE o.slug = '1-mining'
ON CONFLICT (organization_id) DO UPDATE SET
    price_per_kwh_from = EXCLUDED.price_per_kwh_from,
    price_per_kwh_label = EXCLUDED.price_per_kwh_label,
    total_capacity_mw = EXCLUDED.total_capacity_mw,
    site_cities = EXCLUDED.site_cities,
    min_devices_label = EXCLUDED.min_devices_label,
    energy_type = EXCLUDED.energy_type;

-- Antpool
UPDATE catalog_organizations
SET
    slug = 'antpool',
    rating = 3.6,
    review_count = 5,
    founded_year = 2015,
    has_public_rating = TRUE,
    card_tags = ARRAY[
        'Комиссия пула: 4%',
        'Добываемые монеты: ETH; LTC; ETHW; BCH; DCRN; DASH; CKB; ETC; ZEC; KDA; HNS; DCR; RVN'
    ],
    card_features = ARRAY['Мобильное приложение'],
    updated_at = NOW()
WHERE name = 'Antpool';

-- Canaan
UPDATE catalog_organizations
SET
    slug = 'canaan',
    founded_year = 2013,
    has_public_rating = FALSE,
    card_tags = ARRAY['Количество моделей: 20+'],
    card_features = '{}',
    updated_at = NOW()
WHERE name = 'Canaan';

-- Криптобиржи
INSERT INTO catalog_organizations (
    category_id, name, slug, logo_url, description, rating, review_count, sort_order,
    founded_year, has_public_rating, card_tags, card_features
)
SELECT
    c.id, v.name, v.slug, v.logo_url, v.description, v.rating, v.review_count, v.sort_order,
    v.founded_year, v.has_public_rating, v.card_tags, v.card_features
FROM catalog_categories c
JOIN (
    VALUES
        ('Binance', 'binance', '/images/catalog/binance.png', 'Крупнейшая криптобиржа.', 4.5, 371, 1, 2016, TRUE,
            ARRAY['Верификация: KYC', 'Коэф. ликвидности: 895']::TEXT[],
            ARRAY['Спот', 'Деривативы', 'Стейкинг', 'P2P', 'Русскоязычная поддержка', 'Поддержка RUB']::TEXT[]),
        ('KuCoin', 'kucoin', '/images/catalog/kucoin.png', 'Криптобиржа с широким выбором монет.', 3.9, 45, 2, 2017, TRUE,
            ARRAY['Коэффициент ликвидности: 610']::TEXT[], '{}'::TEXT[]),
        ('Bybit', 'bybit', '/images/catalog/bybit.png', 'Биржа деривативов и спота.', 4.2, 88, 3, 2018, TRUE,
            ARRAY['Коэффициент ликвидности: 520']::TEXT[], '{}'::TEXT[]),
        ('OKX', 'okx', '/images/catalog/okx.png', 'Глобальная криптобиржа.', 4.0, 62, 4, 2017, TRUE,
            ARRAY['Коэффициент ликвидности: 480']::TEXT[], '{}'::TEXT[]),
        ('HTX', 'htx', '/images/catalog/htx.png', 'Криптобиржа HTX (Huobi).', 3.7, 34, 5, 2013, TRUE,
            ARRAY['Коэффициент ликвидности: 390']::TEXT[], '{}'::TEXT[]),
        ('MEXC', 'mexc', '/images/catalog/mexc.png', 'Биржа с листингом альткоинов.', 3.8, 28, 6, 2018, TRUE,
            ARRAY['Коэффициент ликвидности: 350']::TEXT[], '{}'::TEXT[]),
        ('Gate.io', 'gate-io', '/images/catalog/gate-io.png', 'Мультивалютная биржа.', 3.6, 41, 7, 2013, TRUE,
            ARRAY['Коэффициент ликвидности: 410']::TEXT[], '{}'::TEXT[]),
        ('Bitget', 'bitget', '/images/catalog/bitget.png', 'Биржа копитрейдинга и деривативов.', 4.1, 55, 8, 2018, TRUE,
            ARRAY['Коэффициент ликвидности: 440']::TEXT[], '{}'::TEXT[]),
        ('BingX', 'bingx', '/images/catalog/bingx.png', 'Социальная торговая платформа.', 3.5, 19, 9, 2018, TRUE,
            ARRAY['Коэффициент ликвидности: 280']::TEXT[], '{}'::TEXT[]),
        ('Cryptomus', 'cryptomus', '/images/catalog/cryptomus.png', 'Платёжный шлюз и биржа.', 4.3, 12, 10, 2022, TRUE,
            ARRAY['Коэффициент ликвидности: 210']::TEXT[], '{}'::TEXT[])
) AS v(name, slug, logo_url, description, rating, review_count, sort_order, founded_year, has_public_rating, card_tags, card_features)
    ON c.slug = 'crypto-exchanges'
WHERE NOT EXISTS (SELECT 1 FROM catalog_organizations o WHERE o.slug = v.slug);

-- Криптокошельки
INSERT INTO catalog_organizations (
    category_id, name, slug, logo_url, description, rating, review_count, sort_order,
    founded_year, has_public_rating, card_tags, card_features
)
SELECT
    c.id, v.name, v.slug, v.logo_url, v.description, v.rating, v.review_count, v.sort_order,
    v.founded_year, v.has_public_rating, v.card_tags, v.card_features
FROM catalog_categories c
JOIN (
    VALUES
        ('Coinbase Wallet', 'coinbase-wallet', '/images/catalog/coinbase-wallet.png', 'Некастодиальный кошелёк Coinbase.', 2.5, 2, 1, 2012, TRUE, '{}'::TEXT[], '{}'::TEXT[]),
        ('Trust Wallet', 'trust-wallet', '/images/catalog/trust-wallet.png', 'Мультивалютный мобильный кошелёк.', 2.0, 23, 2, 2017, TRUE, '{}'::TEXT[], '{}'::TEXT[]),
        ('Exodus', 'exodus', '/images/catalog/exodus.png', 'Desktop и mobile кошелёк.', 1.8, 19, 3, 2015, TRUE,
            ARRAY['Добываемые монеты: BTC; ETH; SOL; ADA; DOT; XRP; LTC; BCH; DOGE; TRX; AVAX; MATIC; ATOM; XLM; ALGO; FIL; EOS; XTZ; DASH; ZEC; DCR; RVN; CKB; KDA; HNS; ETC; NEAR; APT; SUI; TON; INJ; SEI; TIA; ORDI; STX; RUNE; OSMO; KAVA; ROSE; ONE; HBAR; ICP; FLOW; MINA; EGLD; KSM; WAVES']::TEXT[], '{}'::TEXT[]),
        ('Blockchain Wallet', 'blockchain-wallet', '/images/catalog/blockchain-wallet.png', 'Кошелёк Blockchain.com.', 4.1, 25, 4, 2011, TRUE,
            ARRAY['Добываемые монеты: BTC; BCH']::TEXT[], '{}'::TEXT[]),
        ('MyEtherWallet', 'myetherwallet', '/images/catalog/myetherwallet.png', 'Кошелёк для Ethereum и EVM-сетей.', 3.0, 1, 5, 2019, TRUE, '{}'::TEXT[], '{}'::TEXT[]),
        ('MetaMask', 'metamask', '/images/catalog/metamask.svg', 'Браузерный кошелёк для Web3.', 2.5, 42, 6, 2015, TRUE, '{}'::TEXT[],
            ARRAY['Мобильное приложение', 'Поддержка NFT']::TEXT[]),
        ('Enjin Wallet', 'enjin-wallet', '/images/catalog/enjin-wallet.png', 'Кошелёк для NFT и игровых активов.', 1.9, 19, 7, 2009, TRUE, '{}'::TEXT[], '{}'::TEXT[]),
        ('Phantom', 'phantom', '/images/catalog/phantom.png', 'Кошелёк для Solana и мультичейн.', 0, 0, 8, 2020, FALSE,
            ARRAY['Добываемые монеты: SOL; ETH; BTC; MATIC; SUI; APT; AVAX; BNB; OP; ARB; BASE; POLYGON; ZKSYNC; STARKNET; LINEA; SCROLL; BLAST; MODE; MANTLE; METIS; BOBA; GNOSIS; CELO; FANTOM; HARMONY; MOONBEAM; MOONRIVER; AURORA; CRONOS; KAVA; EVMOS; CANTO; KLAYTN; OASYS; SHIMMER; IOTA; SEI; INJ; TIA; DYM; STRD; JUNO; OSMO; KUJI; AXL; SAGA; NTRN; TON; NEAR; ALGO; XLM; XRP; ADA; DOT; ATOM; LTC; BCH; DOGE; TRX; FIL; EOS; XTZ; DASH; ZEC; DCR; RVN; CKB; KDA; HNS; ETC; ZEN; AR; ORDI; STX; RUNE; ROSE; ONE; HBAR; ICP; FLOW; MINA; EGLD; KSM; WAVES']::TEXT[], '{}'::TEXT[])
) AS v(name, slug, logo_url, description, rating, review_count, sort_order, founded_year, has_public_rating, card_tags, card_features)
    ON c.slug = 'crypto-wallets'
WHERE NOT EXISTS (SELECT 1 FROM catalog_organizations o WHERE o.slug = v.slug);
