SET client_encoding = 'UTF8';

SET client_encoding = 'UTF8';

ALTER TABLE catalog_organizations
    ADD COLUMN IF NOT EXISTS card_promo TEXT NOT NULL DEFAULT '';

ALTER TABLE catalog_organizations
    ADD COLUMN IF NOT EXISTS logo_theme TEXT NOT NULL DEFAULT '';

CREATE TABLE IF NOT EXISTS organization_crypto_exchanges (
    organization_id INT PRIMARY KEY REFERENCES catalog_organizations (id) ON DELETE CASCADE,
    trading_pairs_label TEXT NOT NULL DEFAULT '',
    coins_count_label TEXT NOT NULL DEFAULT '',
    verification_type TEXT NOT NULL DEFAULT '',
    liquidity_coefficient INT,
    spot_markets INT,
    supported_currencies TEXT NOT NULL DEFAULT '',
    maker_fee TEXT NOT NULL DEFAULT '',
    taker_fee TEXT NOT NULL DEFAULT '',
    derivative_markets INT,
    extras TEXT[] NOT NULL DEFAULT '{}'
);

UPDATE catalog_organizations
SET
    slug = 'binance',
    tagline = '',
    page_title = 'BINANCE',
    detail_logo_url = '/images/catalog/binance-detail.png',
    logo_url = '/images/catalog/binance.png',
    logo_theme = 'light',
    founded_year = 2016,
    website = 'https://www.binance.com/ru/',
    phone = '',
    email = '',
    work_hours = '',
    office_city = 'Гонконг',
    domain_registered_at = '2027-04-01',
    verified_contracts = TRUE,
    verified_legal_entity = TRUE,
    verified_data_center = FALSE,
    verified_mining_registry = FALSE,
    show_gallery = FALSE,
    show_article_block = FALSE,
    about_html = '',
    card_promo = 'Призовой фонд на сумму до 500 000 USDT в форме ваучеров',
    card_tags = ARRAY[
        'Верификация: KYC',
        'Коэф. ликвидности: 895'
    ],
    card_features = ARRAY[
        'Спот',
        'Деривативы',
        'Стейкинг',
        'P2P',
        'Русскоязычная поддержка',
        'Поддержка RUB'
    ],
    updated_at = NOW()
WHERE name = 'Binance' OR slug = 'binance';

DELETE FROM organization_addresses
WHERE organization_id = (SELECT id FROM catalog_organizations WHERE slug = 'binance');

INSERT INTO organization_addresses (organization_id, city, address_line, sort_order)
SELECT o.id, 'Гонконг', 'Гонконг', 0
FROM catalog_organizations o
WHERE o.slug = 'binance';

INSERT INTO organization_crypto_exchanges (
    organization_id,
    trading_pairs_label,
    coins_count_label,
    verification_type,
    liquidity_coefficient,
    spot_markets,
    supported_currencies,
    maker_fee,
    taker_fee,
    derivative_markets,
    extras
)
SELECT o.id,
    '1000+',
    '300+',
    'KYC',
    895,
    1555,
    'EUR, GBP, BRL, AUD, UAH, RUB, TRY, ZAR, PLN, NGN',
    '0,02%',
    '0,04%',
    337,
    ARRAY[
        'Конвертация криптовалют',
        'Маржинальная торговля',
        'Покупка/продажа NFT',
        'Торговля фьючерсами'
    ]::TEXT[]
FROM catalog_organizations o
WHERE o.slug = 'binance'
ON CONFLICT (organization_id) DO UPDATE SET
    trading_pairs_label = EXCLUDED.trading_pairs_label,
    coins_count_label = EXCLUDED.coins_count_label,
    verification_type = EXCLUDED.verification_type,
    liquidity_coefficient = EXCLUDED.liquidity_coefficient,
    spot_markets = EXCLUDED.spot_markets,
    supported_currencies = EXCLUDED.supported_currencies,
    maker_fee = EXCLUDED.maker_fee,
    taker_fee = EXCLUDED.taker_fee,
    derivative_markets = EXCLUDED.derivative_markets,
    extras = EXCLUDED.extras;

SET client_encoding = 'UTF8';

-- BingX
UPDATE catalog_organizations
SET
    slug = 'bingx',
    tagline = '',
    page_title = 'BINGX',
    detail_logo_url = '/images/catalog/bingx-detail.png',
    logo_url = '/images/catalog/bingx.png',
    logo_theme = 'light',
    founded_year = 2018,
    website = 'https://bingx.com/ru-ru/',
    phone = '',
    email = '',
    work_hours = '',
    office_city = 'Сингапур',
    domain_registered_at = '2015-04-29',
    verified_contracts = TRUE,
    verified_legal_entity = TRUE,
    verified_data_center = FALSE,
    verified_mining_registry = FALSE,
    show_gallery = FALSE,
    show_article_block = FALSE,
    about_html = '',
    card_promo = '',
    card_tags = ARRAY[
        'Коэф. ликвидности: 629'
    ],
    card_features = ARRAY[
        'Спот',
        'Деривативы',
        'NFT',
        'Фьючерсы'
    ],
    updated_at = NOW()
WHERE name = 'BingX' OR slug = 'bingx';

DELETE FROM organization_addresses
WHERE organization_id = (SELECT id FROM catalog_organizations WHERE slug = 'bingx');

INSERT INTO organization_addresses (organization_id, city, address_line, sort_order)
SELECT o.id, 'Сингапур', 'Сингапур', 0
FROM catalog_organizations o
WHERE o.slug = 'bingx';

INSERT INTO organization_crypto_exchanges (
    organization_id,
    trading_pairs_label,
    coins_count_label,
    verification_type,
    liquidity_coefficient,
    spot_markets,
    supported_currencies,
    maker_fee,
    taker_fee,
    derivative_markets,
    extras
)
SELECT o.id,
    '500+',
    '600+',
    '',
    629,
    880,
    'USD; THB; MYR; PHP; IDR; INR; VIB',
    '0,02%',
    '0,04%',
    217,
    ARRAY[
        'Конвертация криптовалют',
        'Покупка/продажа NFT',
        'Торговля фьючерсами'
    ]::TEXT[]
FROM catalog_organizations o
WHERE o.slug = 'bingx'
ON CONFLICT (organization_id) DO UPDATE SET
    trading_pairs_label = EXCLUDED.trading_pairs_label,
    coins_count_label = EXCLUDED.coins_count_label,
    verification_type = EXCLUDED.verification_type,
    liquidity_coefficient = EXCLUDED.liquidity_coefficient,
    spot_markets = EXCLUDED.spot_markets,
    supported_currencies = EXCLUDED.supported_currencies,
    maker_fee = EXCLUDED.maker_fee,
    taker_fee = EXCLUDED.taker_fee,
    derivative_markets = EXCLUDED.derivative_markets,
    extras = EXCLUDED.extras;

-- Bybit
UPDATE catalog_organizations
SET
    slug = 'bybit',
    tagline = '',
    page_title = 'BYBIT',
    detail_logo_url = '/images/catalog/bybit-detail.png',
    logo_url = '/images/catalog/bybit.png',
    logo_theme = 'light',
    founded_year = 2018,
    website = 'https://www.bybit.com/ru-RU/',
    phone = '',
    email = '',
    work_hours = '',
    office_city = 'Виргинские острова',
    domain_registered_at = '1999-08-04',
    verified_contracts = TRUE,
    verified_legal_entity = TRUE,
    verified_data_center = FALSE,
    verified_mining_registry = FALSE,
    show_gallery = FALSE,
    show_article_block = FALSE,
    about_html = '',
    card_promo = '',
    card_tags = ARRAY[
        'Коэф. ликвидности: 621'
    ],
    card_features = ARRAY[
        'Спот',
        'Деривативы',
        'OTC',
        'Стейкинг ETH',
        'NFT',
        'Фьючерсы'
    ],
    updated_at = NOW()
WHERE name = 'Bybit' OR slug = 'bybit';

DELETE FROM organization_addresses
WHERE organization_id = (SELECT id FROM catalog_organizations WHERE slug = 'bybit');

INSERT INTO organization_addresses (organization_id, city, address_line, sort_order)
SELECT o.id, 'Виргинские острова', 'Виргинские острова', 0
FROM catalog_organizations o
WHERE o.slug = 'bybit';

INSERT INTO organization_crypto_exchanges (
    organization_id,
    trading_pairs_label,
    coins_count_label,
    verification_type,
    liquidity_coefficient,
    spot_markets,
    supported_currencies,
    maker_fee,
    taker_fee,
    derivative_markets,
    extras
)
SELECT o.id,
    '200+',
    '200+',
    '',
    621,
    837,
    'USD, EUR, GBP, AUD, CAD, AED',
    '0,02%',
    '0,055%',
    337,
    ARRAY[
        'Внебиржевой трейдинг',
        'Криптозаймы',
        'Конвертация криптовалют',
        'Покупка/продажа NFT',
        'Стейкинг ETH',
        'Торговля фьючерсами'
    ]::TEXT[]
FROM catalog_organizations o
WHERE o.slug = 'bybit'
ON CONFLICT (organization_id) DO UPDATE SET
    trading_pairs_label = EXCLUDED.trading_pairs_label,
    coins_count_label = EXCLUDED.coins_count_label,
    verification_type = EXCLUDED.verification_type,
    liquidity_coefficient = EXCLUDED.liquidity_coefficient,
    spot_markets = EXCLUDED.spot_markets,
    supported_currencies = EXCLUDED.supported_currencies,
    maker_fee = EXCLUDED.maker_fee,
    taker_fee = EXCLUDED.taker_fee,
    derivative_markets = EXCLUDED.derivative_markets,
    extras = EXCLUDED.extras;

SET client_encoding = 'UTF8';

ALTER TABLE catalog_organizations
    ADD COLUMN IF NOT EXISTS card_promo TEXT NOT NULL DEFAULT '';

ALTER TABLE catalog_organizations
    ADD COLUMN IF NOT EXISTS logo_theme TEXT NOT NULL DEFAULT '';

CREATE TABLE IF NOT EXISTS organization_crypto_exchanges (
    organization_id INT PRIMARY KEY REFERENCES catalog_organizations (id) ON DELETE CASCADE,
    trading_pairs_label TEXT NOT NULL DEFAULT '',
    coins_count_label TEXT NOT NULL DEFAULT '',
    verification_type TEXT NOT NULL DEFAULT '',
    liquidity_coefficient INT,
    spot_markets INT,
    supported_currencies TEXT NOT NULL DEFAULT '',
    maker_fee TEXT NOT NULL DEFAULT '',
    taker_fee TEXT NOT NULL DEFAULT '',
    derivative_markets INT,
    extras TEXT[] NOT NULL DEFAULT '{}'
);

UPDATE catalog_organizations
SET
    slug = 'bitget',
    tagline = '',
    page_title = 'BITGET',
    detail_logo_url = '/images/catalog/bitget-detail.png',
    logo_url = '/images/catalog/bitget.png',
    logo_theme = 'light',
    founded_year = 2018,
    website = 'https://www.bitget.com/ru/',
    phone = '',
    email = '',
    work_hours = '',
    office_city = 'Сингапур',
    domain_registered_at = '2003-02-03',
    verified_contracts = TRUE,
    verified_legal_entity = TRUE,
    verified_data_center = FALSE,
    verified_mining_registry = FALSE,
    show_gallery = FALSE,
    show_article_block = FALSE,
    about_html = '',
    card_promo = '',
    card_tags = ARRAY[
        'Коэф. ликвидности: 596'
    ],
    card_features = ARRAY[
        'Спот',
        'Деривативы',
        'Маржа',
        'NFT',
        'Фьючерсы'
    ],
    updated_at = NOW()
WHERE name = 'Bitget' OR slug = 'bitget';

DELETE FROM organization_addresses
WHERE organization_id = (SELECT id FROM catalog_organizations WHERE slug = 'bitget');

INSERT INTO organization_addresses (organization_id, city, address_line, sort_order)
SELECT o.id, 'Сингапур', 'Сингапур', 0
FROM catalog_organizations o
WHERE o.slug = 'bitget';

INSERT INTO organization_crypto_exchanges (
    organization_id,
    trading_pairs_label,
    coins_count_label,
    verification_type,
    liquidity_coefficient,
    spot_markets,
    supported_currencies,
    maker_fee,
    taker_fee,
    derivative_markets,
    extras
)
SELECT o.id,
    '500+',
    '400+',
    '',
    596,
    1026,
    'USD; EUR; GBP; RUB; JPY; UAH; TRY; HKD; THB; VND; IDR; MYR; SGD; PHP; INR',
    '0,02%',
    '0,06%',
    210,
    ARRAY[
        'Конвертация криптовалют',
        'Маржинальная торговля',
        'Покупка/продажа NFT',
        'Торговля фьючерсами'
    ]::TEXT[]
FROM catalog_organizations o
WHERE o.slug = 'bitget'
ON CONFLICT (organization_id) DO UPDATE SET
    trading_pairs_label = EXCLUDED.trading_pairs_label,
    coins_count_label = EXCLUDED.coins_count_label,
    verification_type = EXCLUDED.verification_type,
    liquidity_coefficient = EXCLUDED.liquidity_coefficient,
    spot_markets = EXCLUDED.spot_markets,
    supported_currencies = EXCLUDED.supported_currencies,
    maker_fee = EXCLUDED.maker_fee,
    taker_fee = EXCLUDED.taker_fee,
    derivative_markets = EXCLUDED.derivative_markets,
    extras = EXCLUDED.extras;

SET client_encoding = 'UTF8';

ALTER TABLE catalog_organizations
    ADD COLUMN IF NOT EXISTS card_promo TEXT NOT NULL DEFAULT '';

ALTER TABLE catalog_organizations
    ADD COLUMN IF NOT EXISTS logo_theme TEXT NOT NULL DEFAULT '';

CREATE TABLE IF NOT EXISTS organization_crypto_exchanges (
    organization_id INT PRIMARY KEY REFERENCES catalog_organizations (id) ON DELETE CASCADE,
    trading_pairs_label TEXT NOT NULL DEFAULT '',
    coins_count_label TEXT NOT NULL DEFAULT '',
    verification_type TEXT NOT NULL DEFAULT '',
    liquidity_coefficient INT,
    spot_markets INT,
    supported_currencies TEXT NOT NULL DEFAULT '',
    maker_fee TEXT NOT NULL DEFAULT '',
    taker_fee TEXT NOT NULL DEFAULT '',
    derivative_markets INT,
    extras TEXT[] NOT NULL DEFAULT '{}'
);

UPDATE catalog_organizations
SET
    slug = 'okx',
    tagline = '',
    page_title = 'OKX',
    detail_logo_url = '/images/catalog/okx-detail.png',
    logo_url = '/images/catalog/okx.png',
    logo_theme = 'light',
    founded_year = 2014,
    website = 'https://www.okx.com/ru',
    phone = '',
    email = '',
    work_hours = '',
    office_city = 'Сейшельские острова',
    domain_registered_at = '2001-07-03',
    verified_contracts = TRUE,
    verified_legal_entity = TRUE,
    verified_data_center = FALSE,
    verified_mining_registry = FALSE,
    show_gallery = FALSE,
    show_article_block = FALSE,
    about_html = '',
    card_promo = '',
    card_tags = ARRAY[
        'Коэф. ликвидности: 631'
    ],
    card_features = ARRAY[
        'Спот',
        'Деривативы',
        'OTC',
        'Криптозаймы',
        'Фьючерсы'
    ],
    updated_at = NOW()
WHERE name = 'OKX' OR slug = 'okx';

DELETE FROM organization_addresses
WHERE organization_id = (SELECT id FROM catalog_organizations WHERE slug = 'okx');

INSERT INTO organization_addresses (organization_id, city, address_line, sort_order)
SELECT o.id, 'Сейшельские острова', 'Сейшельские острова', 0
FROM catalog_organizations o
WHERE o.slug = 'okx';

INSERT INTO organization_crypto_exchanges (
    organization_id,
    trading_pairs_label,
    coins_count_label,
    verification_type,
    liquidity_coefficient,
    spot_markets,
    supported_currencies,
    maker_fee,
    taker_fee,
    derivative_markets,
    extras
)
SELECT o.id,
    '600+',
    '300+',
    '',
    631,
    673,
    'AED; ARS; AUD; AZN; BRL; CAD; CHF; CLP; COP; CZK; EGP; EUR; GBP; GHS; HKD; HRK; HUF; IDR; ILS; INR; ISK; JPY; KES; KRW; KZT; MXN; NGN; NOK; NZD; PEN; PHP; PLN; RON; RUB; SAR; SEK; SGD; THB; TRY; TWD; UAH; UGX; USD; UYU; VND; ZAR',
    '0,02%',
    '0,05%',
    224,
    ARRAY[
        'Внебиржевой трейдинг',
        'Криптозаймы',
        'Конвертация криптовалют',
        'Торговля фьючерсами'
    ]::TEXT[]
FROM catalog_organizations o
WHERE o.slug = 'okx'
ON CONFLICT (organization_id) DO UPDATE SET
    trading_pairs_label = EXCLUDED.trading_pairs_label,
    coins_count_label = EXCLUDED.coins_count_label,
    verification_type = EXCLUDED.verification_type,
    liquidity_coefficient = EXCLUDED.liquidity_coefficient,
    spot_markets = EXCLUDED.spot_markets,
    supported_currencies = EXCLUDED.supported_currencies,
    maker_fee = EXCLUDED.maker_fee,
    taker_fee = EXCLUDED.taker_fee,
    derivative_markets = EXCLUDED.derivative_markets,
    extras = EXCLUDED.extras;

SET client_encoding = 'UTF8';

ALTER TABLE catalog_organizations
    ADD COLUMN IF NOT EXISTS card_promo TEXT NOT NULL DEFAULT '';

ALTER TABLE catalog_organizations
    ADD COLUMN IF NOT EXISTS logo_theme TEXT NOT NULL DEFAULT '';

CREATE TABLE IF NOT EXISTS organization_crypto_exchanges (
    organization_id INT PRIMARY KEY REFERENCES catalog_organizations (id) ON DELETE CASCADE,
    trading_pairs_label TEXT NOT NULL DEFAULT '',
    coins_count_label TEXT NOT NULL DEFAULT '',
    verification_type TEXT NOT NULL DEFAULT '',
    liquidity_coefficient INT,
    spot_markets INT,
    supported_currencies TEXT NOT NULL DEFAULT '',
    maker_fee TEXT NOT NULL DEFAULT '',
    taker_fee TEXT NOT NULL DEFAULT '',
    derivative_markets INT,
    extras TEXT[] NOT NULL DEFAULT '{}'
);

UPDATE catalog_organizations
SET
    slug = 'mexc',
    tagline = '',
    page_title = 'MEXC',
    detail_logo_url = '/images/catalog/mexc-detail.png',
    logo_url = '/images/catalog/mexc.png',
    logo_theme = 'light',
    founded_year = 2018,
    website = 'https://www.mexc.com/ru-RU/',
    phone = '',
    email = '',
    work_hours = '',
    office_city = 'Сингапур',
    domain_registered_at = '2000-02-27',
    verified_contracts = TRUE,
    verified_legal_entity = TRUE,
    verified_data_center = FALSE,
    verified_mining_registry = FALSE,
    show_gallery = FALSE,
    show_article_block = FALSE,
    about_html = '',
    card_promo = '',
    card_tags = ARRAY[
        'Коэф. ликвидности: 531'
    ],
    card_features = ARRAY[
        'Спот',
        'Деривативы',
        'Конвертация',
        'Фьючерсы'
    ],
    updated_at = NOW()
WHERE name = 'MEXC' OR slug = 'mexc';

DELETE FROM organization_addresses
WHERE organization_id = (SELECT id FROM catalog_organizations WHERE slug = 'mexc');

INSERT INTO organization_addresses (organization_id, city, address_line, sort_order)
SELECT o.id, 'Сингапур', 'Сингапур', 0
FROM catalog_organizations o
WHERE o.slug = 'mexc';

INSERT INTO organization_crypto_exchanges (
    organization_id,
    trading_pairs_label,
    coins_count_label,
    verification_type,
    liquidity_coefficient,
    spot_markets,
    supported_currencies,
    maker_fee,
    taker_fee,
    derivative_markets,
    extras
)
SELECT o.id,
    '500+',
    '400+',
    '',
    531,
    2437,
    'EUR; USD; GBP; VND; RUB; KRW; JPY; BRL; TRY; HKD; AUD; CHF; CAD; THB; PHP',
    '0%',
    '0,01%',
    344,
    ARRAY[
        'Конвертация криптовалют',
        'Торговля фьючерсами'
    ]::TEXT[]
FROM catalog_organizations o
WHERE o.slug = 'mexc'
ON CONFLICT (organization_id) DO UPDATE SET
    trading_pairs_label = EXCLUDED.trading_pairs_label,
    coins_count_label = EXCLUDED.coins_count_label,
    verification_type = EXCLUDED.verification_type,
    liquidity_coefficient = EXCLUDED.liquidity_coefficient,
    spot_markets = EXCLUDED.spot_markets,
    supported_currencies = EXCLUDED.supported_currencies,
    maker_fee = EXCLUDED.maker_fee,
    taker_fee = EXCLUDED.taker_fee,
    derivative_markets = EXCLUDED.derivative_markets,
    extras = EXCLUDED.extras;

SET client_encoding = 'UTF8';

ALTER TABLE catalog_organizations
    ADD COLUMN IF NOT EXISTS card_promo TEXT NOT NULL DEFAULT '';

ALTER TABLE catalog_organizations
    ADD COLUMN IF NOT EXISTS logo_theme TEXT NOT NULL DEFAULT '';

CREATE TABLE IF NOT EXISTS organization_crypto_exchanges (
    organization_id INT PRIMARY KEY REFERENCES catalog_organizations (id) ON DELETE CASCADE,
    trading_pairs_label TEXT NOT NULL DEFAULT '',
    coins_count_label TEXT NOT NULL DEFAULT '',
    verification_type TEXT NOT NULL DEFAULT '',
    liquidity_coefficient INT,
    spot_markets INT,
    supported_currencies TEXT NOT NULL DEFAULT '',
    maker_fee TEXT NOT NULL DEFAULT '',
    taker_fee TEXT NOT NULL DEFAULT '',
    derivative_markets INT,
    extras TEXT[] NOT NULL DEFAULT '{}'
);

UPDATE catalog_organizations
SET
    slug = 'kucoin',
    tagline = '',
    page_title = 'KUCOIN',
    detail_logo_url = '/images/catalog/kucoin-detail.png',
    logo_url = '/images/catalog/kucoin.png',
    logo_theme = 'light',
    founded_year = 2017,
    website = 'https://www.kucoin.com/ru',
    phone = '',
    email = '',
    work_hours = '',
    office_city = 'Сейшельские острова',
    domain_registered_at = '2013-11-13',
    verified_contracts = TRUE,
    verified_legal_entity = TRUE,
    verified_data_center = FALSE,
    verified_mining_registry = FALSE,
    show_gallery = FALSE,
    show_article_block = FALSE,
    about_html = '',
    card_promo = '',
    card_tags = ARRAY[
        'Коэф. ликвидности: 610'
    ],
    card_features = ARRAY[
        'Спот',
        'Деривативы',
        'Маржа',
        'NFT',
        'Фьючерсы'
    ],
    updated_at = NOW()
WHERE name = 'KuCoin' OR slug = 'kucoin';

DELETE FROM organization_addresses
WHERE organization_id = (SELECT id FROM catalog_organizations WHERE slug = 'kucoin');

INSERT INTO organization_addresses (organization_id, city, address_line, sort_order)
SELECT o.id, 'Сейшельские острова', 'Сейшельские острова', 0
FROM catalog_organizations o
WHERE o.slug = 'kucoin';

INSERT INTO organization_crypto_exchanges (
    organization_id,
    trading_pairs_label,
    coins_count_label,
    verification_type,
    liquidity_coefficient,
    spot_markets,
    supported_currencies,
    maker_fee,
    taker_fee,
    derivative_markets,
    extras
)
SELECT o.id,
    '1000+',
    '600+',
    '',
    610,
    1342,
    'USD; AED; ARS; AUD; AGN; BGN; BRL; CAD; CHF; CLP; COP; CRC; CZK; DKK; DOP; EUR; GBP; GEL; HKD; HUF; ILS; INR; JPY; KRW; KZT; MAD; MDL; MXN; MYR; NAD; NGN; NOK; NZD; PEN; PHP; PLN; QAR; RON; RUB; SEK; SGD; TRY; TWD; UAH; USD; UYU; UZS; ZAR',
    '0,02%',
    '0,06%',
    187,
    ARRAY[
        'Конвертация криптовалют',
        'Маржинальная торговля',
        'Покупка/продажа NFT',
        'Торговля фьючерсами'
    ]::TEXT[]
FROM catalog_organizations o
WHERE o.slug = 'kucoin'
ON CONFLICT (organization_id) DO UPDATE SET
    trading_pairs_label = EXCLUDED.trading_pairs_label,
    coins_count_label = EXCLUDED.coins_count_label,
    verification_type = EXCLUDED.verification_type,
    liquidity_coefficient = EXCLUDED.liquidity_coefficient,
    spot_markets = EXCLUDED.spot_markets,
    supported_currencies = EXCLUDED.supported_currencies,
    maker_fee = EXCLUDED.maker_fee,
    taker_fee = EXCLUDED.taker_fee,
    derivative_markets = EXCLUDED.derivative_markets,
    extras = EXCLUDED.extras;

SET client_encoding = 'UTF8';

ALTER TABLE catalog_organizations
    ADD COLUMN IF NOT EXISTS card_promo TEXT NOT NULL DEFAULT '';

ALTER TABLE catalog_organizations
    ADD COLUMN IF NOT EXISTS logo_theme TEXT NOT NULL DEFAULT '';

CREATE TABLE IF NOT EXISTS organization_crypto_exchanges (
    organization_id INT PRIMARY KEY REFERENCES catalog_organizations (id) ON DELETE CASCADE,
    trading_pairs_label TEXT NOT NULL DEFAULT '',
    coins_count_label TEXT NOT NULL DEFAULT '',
    verification_type TEXT NOT NULL DEFAULT '',
    liquidity_coefficient INT,
    spot_markets INT,
    supported_currencies TEXT NOT NULL DEFAULT '',
    maker_fee TEXT NOT NULL DEFAULT '',
    taker_fee TEXT NOT NULL DEFAULT '',
    derivative_markets INT,
    extras TEXT[] NOT NULL DEFAULT '{}'
);

UPDATE catalog_organizations
SET
    slug = 'gate-io',
    tagline = '',
    page_title = 'GATE.IO',
    detail_logo_url = '/images/catalog/gate-io-detail.png',
    logo_url = '/images/catalog/gate-io.png',
    logo_theme = 'light',
    founded_year = 2013,
    website = 'https://www.gate.io/ru',
    phone = '',
    email = '',
    work_hours = '',
    office_city = 'Каймановы острова',
    domain_registered_at = '2017-07-21',
    verified_contracts = TRUE,
    verified_legal_entity = TRUE,
    verified_data_center = FALSE,
    verified_mining_registry = FALSE,
    show_gallery = FALSE,
    show_article_block = FALSE,
    about_html = '',
    card_promo = '',
    card_tags = ARRAY[
        'Коэф. ликвидности: 528'
    ],
    card_features = ARRAY[
        'Спот',
        'Деривативы',
        'Маржа',
        'NFT',
        'Фьючерсы'
    ],
    updated_at = NOW()
WHERE name = 'Gate.io' OR slug = 'gate-io';

DELETE FROM organization_addresses
WHERE organization_id = (SELECT id FROM catalog_organizations WHERE slug = 'gate-io');

INSERT INTO organization_addresses (organization_id, city, address_line, sort_order)
SELECT o.id, 'Каймановы острова', 'Каймановы острова', 0
FROM catalog_organizations o
WHERE o.slug = 'gate-io';

INSERT INTO organization_crypto_exchanges (
    organization_id,
    trading_pairs_label,
    coins_count_label,
    verification_type,
    liquidity_coefficient,
    spot_markets,
    supported_currencies,
    maker_fee,
    taker_fee,
    derivative_markets,
    extras
)
SELECT o.id,
    '2300+',
    '1400+',
    '',
    528,
    3470,
    'EUR; USD; GBP; TRY; AUD; BRL; CHF; HKD; AED; PLN; VND; SEK; NZD; TWD; UAH; RON; INR; DKK; MYR; NOK; CZK; ILS',
    '0,015%',
    '0,05%',
    381,
    ARRAY[
        'Конвертация криптовалют',
        'Маржинальная торговля',
        'Покупка/продажа NFT',
        'Торговля фьючерсами'
    ]::TEXT[]
FROM catalog_organizations o
WHERE o.slug = 'gate-io'
ON CONFLICT (organization_id) DO UPDATE SET
    trading_pairs_label = EXCLUDED.trading_pairs_label,
    coins_count_label = EXCLUDED.coins_count_label,
    verification_type = EXCLUDED.verification_type,
    liquidity_coefficient = EXCLUDED.liquidity_coefficient,
    spot_markets = EXCLUDED.spot_markets,
    supported_currencies = EXCLUDED.supported_currencies,
    maker_fee = EXCLUDED.maker_fee,
    taker_fee = EXCLUDED.taker_fee,
    derivative_markets = EXCLUDED.derivative_markets,
    extras = EXCLUDED.extras;
