SET client_encoding = 'UTF8';

-- =====================================================================
-- 028_calculator_catalog_seed.sql
-- Полный сид параметров калькулятора (алгоритмы, монеты, модели)
-- из фронтовых модулей calculator-*.ts. Идемпотентно.
-- =====================================================================

ALTER TABLE hardware_coins ADD COLUMN IF NOT EXISTS slug TEXT;
ALTER TABLE hardware_coins ADD COLUMN IF NOT EXISTS dual_coin BOOLEAN NOT NULL DEFAULT FALSE;
ALTER TABLE hardware_coins ADD COLUMN IF NOT EXISTS stepen TEXT NOT NULL DEFAULT '0';
ALTER TABLE hardware_coins ADD COLUMN IF NOT EXISTS icon_url TEXT NOT NULL DEFAULT '';
ALTER TABLE hardware_coins ADD COLUMN IF NOT EXISTS scope TEXT NOT NULL DEFAULT 'shared';
ALTER TABLE hardware_coins ADD COLUMN IF NOT EXISTS net_hash NUMERIC(40, 4);

UPDATE hardware_coins
SET slug = lower(ticker)
WHERE slug IS NULL OR slug = '';

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 FROM pg_constraint WHERE conname = 'hardware_coins_slug_key'
    ) THEN
        ALTER TABLE hardware_coins ADD CONSTRAINT hardware_coins_slug_key UNIQUE (slug);
    END IF;
END $$;

-- ticker больше не глобально уникален (ALPH asic/gpu), уникальность по slug
ALTER TABLE hardware_coins DROP CONSTRAINT IF EXISTS hardware_coins_ticker_key;
CREATE UNIQUE INDEX IF NOT EXISTS idx_hardware_coins_scope_ticker
    ON hardware_coins (scope, ticker);

ALTER TABLE market_stats ALTER COLUMN price_usdt TYPE NUMERIC(40, 20);
ALTER TABLE market_stats ALTER COLUMN difficulty TYPE NUMERIC(50, 12);
ALTER TABLE market_stats ALTER COLUMN block_reward TYPE NUMERIC(40, 20);
ALTER TABLE market_stats ALTER COLUMN network_hashrate TYPE NUMERIC(50, 8);

UPDATE hardware_kinds SET
    empty_hint = CASE slug
        WHEN 'asic' THEN 'Выберите модель ASIC, чтобы рассчитать доходность или введите свои параметры'
        WHEN 'gpu' THEN 'Выберите модель GPU, чтобы рассчитать доходность'
        WHEN 'cpu' THEN 'Выберите модель CPU, чтобы рассчитать доходность'
        ELSE empty_hint
    END,
    picker_hint = CASE slug
        WHEN 'asic' THEN 'Модель ASIC-майнера'
        WHEN 'gpu' THEN 'Выберите Модель GPU'
        WHEN 'cpu' THEN 'Выберите Модель CPU'
        ELSE picker_hint
    END;

INSERT INTO hardware_vendors (slug, title) VALUES
    ('microbt', 'Microbt Whatsminer'),
    ('bitmain', 'Bitmain Antminer'),
    ('canaan', 'Canaan Avalon'),
    ('goldshell', 'Goldshell'),
    ('innosilicon', 'Innosilicon'),
    ('ipollo', 'Ipollo'),
    ('jasminer', 'Jasminer'),
    ('beeminer', 'BeeMiner'),
    ('hummer', 'Hummer'),
    ('elphapex', 'Elphapex'),
    ('amd', 'AMD'),
    ('nvidia', 'NVIDIA'),
    ('intel', 'INTEL')
ON CONFLICT (slug) DO UPDATE SET title = EXCLUDED.title;

INSERT INTO hardware_kind_vendors (kind_id, vendor_id, sort_order)
SELECT k.id, v.id, x.ord
FROM (VALUES
    ('asic', 'microbt', 10),
    ('asic', 'bitmain', 20),
    ('asic', 'canaan', 30),
    ('asic', 'goldshell', 40),
    ('asic', 'innosilicon', 50),
    ('asic', 'ipollo', 60),
    ('asic', 'jasminer', 70),
    ('asic', 'beeminer', 80),
    ('asic', 'hummer', 90),
    ('asic', 'elphapex', 100),
    ('gpu', 'amd', 110),
    ('gpu', 'nvidia', 120),
    ('gpu', 'intel', 130),
    ('cpu', 'amd', 140),
    ('cpu', 'intel', 150)
) AS x(kind_slug, vendor_slug, ord)
JOIN hardware_kinds k ON k.slug = x.kind_slug
JOIN hardware_vendors v ON v.slug = x.vendor_slug
ON CONFLICT (kind_id, vendor_id) DO UPDATE SET sort_order = EXCLUDED.sort_order;

INSERT INTO hardware_algorithms (slug, title, sort_order) VALUES
    ('autolykos', 'Autolykos', 10),
    ('blake2s', 'Blake2S', 20),
    ('blake3', 'Blake3', 30),
    ('blake3-ironfish', 'blake3Ironfish', 40),
    ('cuckatoo32', 'Cuckatoo32', 50),
    ('dynexsolve', 'DynexSolve', 60),
    ('eaglesong', 'Eaglesong', 70),
    ('equihash', 'Equihash', 80),
    ('etchash', 'Etchash', 90),
    ('ethash', 'Ethash', 100),
    ('ethash4g', 'Ethash4G', 110),
    ('fishhash', 'FishHash', 120),
    ('ghostrider', 'GhostRider', 130),
    ('groestl', 'Groestl', 140),
    ('handshake', 'Handshake', 150),
    ('ironfish', 'IronFish', 160),
    ('karlsenhash', 'Karlsenhash', 170),
    ('kawpow', 'KawPow', 180),
    ('kheavyhash', 'kHeavyHash', 190),
    ('lyra2rev2', 'Lyra2REv2', 200),
    ('nexapow', 'NexaPow', 210),
    ('pouw', 'PoUW', 220),
    ('pyrinhash', 'PyrinHash', 230),
    ('randomx', 'RandomX', 240),
    ('scrypt', 'Scrypt', 250),
    ('sha256', 'SHA-256', 260),
    ('sha512256d', 'SHA512256d', 270),
    ('skydoge', 'Skydoge', 280),
    ('x11', 'x11', 290),
    ('zhash', 'Zhash', 300),
    ('zksnark', 'zkSNARK', 310)
ON CONFLICT (slug) DO UPDATE SET title = EXCLUDED.title, sort_order = EXCLUDED.sort_order;

INSERT INTO hardware_coins (
    algorithm_id, ticker, title, slug, dual_coin, stepen, icon_url, scope, net_hash, sort_order, is_active
)
SELECT a.id, x.ticker, x.title, x.slug, x.dual_coin::boolean, x.stepen, x.icon_url, x.scope, x.net_hash::numeric, x.ord, TRUE
FROM (VALUES
    ('zksnark', 'ALEO', 'Aleo', 'aleo', false, '0', 'https://images-production.whattomine.com/r31menin7v1kiw3rgtko958m1rb9', 'asic', 258742390456, 10),
    ('blake3', 'ALPH', 'Alephium', 'alph', false, '0', 'https://top-mining.ru/wp-content/api/coin/aleo.svg', 'asic', 4813855571808531, 20),
    ('sha256', 'BCH', 'BitcoinCash', 'bch', false, '2v32', 'https://images-production.whattomine.com/rk8fx8bo7fyo77vlgwp5wdrebpj3', 'asic', 3068714292056135399, 30),
    ('sha256', 'BTC', 'Bitcoin', 'btc', false, '2v32', 'https://top-mining.ru/wp-content/api/coin/Bitcoin(BTC).png', 'asic', 1.0152812636952e21, 40),
    ('eaglesong', 'CKB', 'Nervos', 'ckb', false, '0', 'https://top-mining.ru/wp-content/api/coin/Nervos(CKB).png', 'asic', 64406732763528918, 50),
    ('x11', 'DASH', 'Dash', 'dash', false, '2v32', 'https://top-mining.ru/wp-content/api/coin/Dash(DASH).png', 'asic', 3616151875246601, 60),
    ('scrypt', 'DOGE', 'DogeCoin', 'doge', false, '2v32', 'https://top-mining.ru/wp-content/api/coin/Dogecoin(DOGE).png', 'asic', 3325867668080319, 70),
    ('etchash', 'ETC', 'Ethereum Classic', 'etc', false, '0', 'https://top-mining.ru/wp-content/api/coin/ETC.png', 'asic', 161343569513473, 80),
    ('groestl', 'GRS', 'GroestlCoin', 'grs', false, '2v32', 'https://top-mining.ru/wp-content/api/coin/GroestlCoin(GRS).png', 'asic', 4071649746854, 90),
    ('handshake', 'HNS', 'Handshake', 'hns', false, '2v32', 'https://top-mining.ru/wp-content/api/coin/Handshake(HNS).png', 'asic', 715004815040444, 100),
    ('kheavyhash', 'KAS', 'Kaspa', 'kas', false, '2v32', 'https://top-mining.ru/wp-content/api/coin/Kaspa(KAS).png', 'asic', 342317281824745345, 110),
    ('blake2s', 'KDA', 'Kadena', 'kda', false, '0', 'https://top-mining.ru/wp-content/api/coin/Kadena(KDA).png', 'asic', 13977536855422530, 120),
    ('scrypt', 'LTC', 'LiteCoin', 'ltc', false, '2v32', 'https://top-mining.ru/wp-content/api/coin/Litecoin(LTC).png', 'asic', 2329944882020890, 130),
    ('scrypt', 'LTC+DOG', 'LTC + DOGE', 'ltc-plus-dog', true, '2v32', 'https://top-mining.ru/wp-content/api/coin/ltc_doge.png', 'asic', 0, 140),
    ('lyra2rev2', 'MONA', 'Monacoin', 'mona', false, '2v32', 'https://top-mining.ru/wp-content/api/coin/mona.png', 'asic', 9901838316784, 150),
    ('equihash', 'ZEC', 'Zcash', 'zec', false, '2v13', 'https://top-mining.ru/wp-content/api/coin/Zcash(ZEC).png', 'asic', 23881238049, 160),
    ('ethash', 'ETHW', 'EthereumPoW', 'ethw', false, '0', 'https://images.hashrate.no/bd437e654dece32c3f46ce947e51032f.png', 'gpu', 1634023885602, 10),
    ('zhash', 'BTG', 'Bitcoin GOLD', 'btg', false, '2v13', 'https://images.hashrate.no/970e82821bf661ab55418f98b4f90e45.png', 'gpu', 82780, 20),
    ('zhash', 'BTCZ', 'BitcoinZ', 'btcz', false, '2v13', 'https://images-production.whattomine.com/h3vmafnfvas3cse5qjpq0x0tel3n', 'gpu', 12123, 30),
    ('dynexsolve', 'DNX', 'Dynex', 'dnx', false, '0', 'https://images.hashrate.no/b9e17f458614ad0054aa325dd6ca3c21.png', 'gpu', 2345446, 40),
    ('blake3', 'ALPH', 'Alephium', 'alph-gpu', false, '0', 'https://images.hashrate.no/39dbc7fc965544f827acd358c8f682f6.png', 'gpu', 4235843964875106, 50),
    ('autolykos', 'ERG', 'Ergo', 'erg', false, '0', 'https://images.hashrate.no/8e8384376f97e7bbc868b1a017c4ecd2.png', 'gpu', 476913779620, 60)
) AS x(algo_slug, ticker, title, slug, dual_coin, stepen, icon_url, scope, net_hash, ord)
JOIN hardware_algorithms a ON a.slug = x.algo_slug
ON CONFLICT (slug) DO UPDATE SET
    algorithm_id = EXCLUDED.algorithm_id,
    ticker = EXCLUDED.ticker,
    title = EXCLUDED.title,
    dual_coin = EXCLUDED.dual_coin,
    stepen = EXCLUDED.stepen,
    icon_url = EXCLUDED.icon_url,
    scope = EXCLUDED.scope,
    net_hash = EXCLUDED.net_hash,
    sort_order = EXCLUDED.sort_order,
    is_active = TRUE;

INSERT INTO market_stats (coin_id, price_usdt, difficulty, block_reward, network_hashrate, updated_at)
SELECT hc.id, x.price::numeric, x.diff::numeric, x.reward::numeric, x.nethash::numeric, NOW()
FROM (VALUES
    ('aleo', 2.6697951677342e-7, 25630703827877, 28.115906225, 258742390456),
    ('alph', 5.7422791553047e-7, 2.5622667417872e15, 0.14331780723755, 4813855571808531),
    ('bch', 0.0033007800114148, 442096961003.08, 3.125, 3068714292056135399),
    ('btc', 63076, 1.2623150712187e14, 3.1421529371429, 1.0152812636952e21),
    ('ckb', 1.2951043185998e-8, 6.7195019787871e17, 559.97516482276, 64406732763528918),
    ('dash', 0.00049575115733401, 98206158.278425, 0.44255625454861, 3616151875246601),
    ('doge', 1.107597184349e-6, 37871611.312445, 10000, 3325867668080319),
    ('etc', 0.00010504787874945, 2.3140224238096e15, 1.589248, 161343569513473),
    ('grs', 0, 67895.990930448, 5, 4071649746854),
    ('hns', 2.6895e-8, 102546975.62992, 500, 715004815040444),
    ('kas', 4.2913310926501e-7, 7778404.9250726, 2.4125906864, 342317281824745345),
    ('kda', 6.6253408586467e-8, 2.0994723206662e16, 0.9119135, 13977536855422530),
    ('ltc', 0.00070264442894286, 86797210.649434, 6.25, 2329944882020890),
    ('ltc-plus-dog', 0, 0, 0, 0),
    ('mona', 0, 281028.72278596, 6.25, 9901838316784),
    ('zec', 0.0073733274145475, 208551075.536, 1.25, 23881238049),
    ('ethw', 3.7898752245477e-6, 21208649620792, 2.0014685815562, 1634023885602),
    ('btg', 0, 5992.28711575, 3.125, 82780),
    ('btcz', 3.3169343464425e-10, 224.94535813108, 3125, 12123),
    ('dnx', 6.4116817031712e-8, 281453536, 8.599820622, 2345446),
    ('alph-gpu', 5.8133638808703e-7, 2.271259533966e15, 0.14331780723755, 4235843964875106),
    ('erg', 3.3089990968099e-6, 58660394893312, 3, 476913779620)
) AS x(slug, price, diff, reward, nethash)
JOIN hardware_coins hc ON hc.slug = x.slug
ON CONFLICT (coin_id) DO UPDATE SET
    price_usdt = EXCLUDED.price_usdt,
    difficulty = EXCLUDED.difficulty,
    block_reward = EXCLUDED.block_reward,
    network_hashrate = EXCLUDED.network_hashrate,
    updated_at = NOW();

INSERT INTO fx_rates (pair, rate) VALUES
    ('USDT-RUB', 79.2),
    ('BTC-USDT', 63076)
ON CONFLICT (pair) DO UPDATE SET rate = EXCLUDED.rate, updated_at = NOW();

INSERT INTO hardware_models (
    kind_id, vendor_id, slug, name, price_default, price_currency, is_published, sort_order
)
SELECT k.id, v.id, x.slug, x.name, 120000, 'RUB', TRUE, x.ord
FROM (VALUES
    ('asic', 'microbt', 'microbt-whatsminer-m70-214-th-s', 'Microbt Whatsminer M70 214 TH/s', 10),
    ('asic', 'microbt', 'microbt-whatsminer-m70-236-th-s', 'Microbt Whatsminer M70 236 TH/s', 20),
    ('asic', 'microbt', 'microbt-whatsminer-m72-246-th-s', 'Microbt Whatsminer M72 246 TH/s', 30),
    ('asic', 'microbt', 'microbt-whatsminer-m60s-186-th-s', 'MicroBT Whatsminer M60S 186 Th/s', 40),
    ('asic', 'microbt', 'microbt-whatsminer-m50s-122-th-s', 'Microbt Whatsminer M50S 122 Th/s', 50),
    ('asic', 'bitmain', 'bitmain-antminer-s21-200-th-s', 'Bitmain Antminer S21 200 Th/s', 60),
    ('asic', 'bitmain', 'bitmain-antminer-s21-pro-245-th-s', 'Bitmain Antminer S21 Pro 245 Th/s', 70),
    ('asic', 'bitmain', 'bitmain-antminer-t21-190-th-s', 'Bitmain Antminer T21 190 Th/s', 80),
    ('asic', 'bitmain', 'bitmain-antminer-s19j-pro-104-th-s', 'Bitmain Antminer S19j Pro 104 Th/s', 90),
    ('asic', 'bitmain', 'bitmain-antminer-l9-16000-mh-s', 'Bitmain Antminer L9 16000 Mh/s', 100),
    ('asic', 'canaan', 'canaan-avalon-a16xp-300-th-s', 'Canaan Avalon A16XP 300 Th/s', 110),
    ('asic', 'canaan', 'canaan-avalon-a15-pro-218t-218-th-s', 'Canaan Avalon A15 Pro 218T 218 Th/s', 120),
    ('asic', 'canaan', 'canaan-avalon-a1366-130-th-s', 'Canaan Avalon A1366 130 Th/s', 130),
    ('asic', 'goldshell', 'goldshell-lt6-3350-mh-s', 'Goldshell LT6 3350 Mh/s', 140),
    ('asic', 'goldshell', 'goldshell-mini-doge-185-mh-s', 'Goldshell Mini Doge 185 Mh/s', 150),
    ('asic', 'innosilicon', 'innosilicon-t4plus-175-th-s', 'Innosilicon T4+ 175 Th/s', 160),
    ('asic', 'innosilicon', 'innosilicon-a11-pro-8gb-2000-mh-s', 'Innosilicon A11 Pro 8GB 2000 Mh/s', 170),
    ('asic', 'ipollo', 'ipollo-b2-110-th-s', 'Ipollo B2 110 Th/s', 180),
    ('asic', 'ipollo', 'ipollo-v1-mini-300-mh-s', 'Ipollo V1 Mini 300 Mh/s', 190),
    ('asic', 'jasminer', 'jasminer-x16-p-5800-mh-s', 'Jasminer X16-P 5800 MH/s', 200),
    ('asic', 'jasminer', 'jasminer-x4-2500-mh-s', 'Jasminer X4 2500 Mh/s', 210),
    ('asic', 'beeminer', 'beeminer-ld4-5-gh-s', 'BeeMiner LD4 5 Gh/s', 220),
    ('asic', 'hummer', 'hummer-h9-pro-80-th-s', 'Hummer H9 Pro 80 Th/s', 230),
    ('asic', 'elphapex', 'elphapex-dg1plus-13000-mh-s', 'ElphaPex DG1+ 13000 Mh/s', 240),
    ('asic', 'elphapex', 'elphapex-dg2-20000-mh-s', 'ElphaPex DG2 20000 Mh/s', 250),
    ('gpu', 'amd', 'radeon-rx-7900-xtx', 'Radeon RX 7900 XTX', 260),
    ('gpu', 'amd', 'radeon-rx-7900-xt', 'Radeon RX 7900 XT', 270),
    ('gpu', 'amd', 'radeon-rx-7800-xt', 'Radeon RX 7800 XT', 280),
    ('gpu', 'amd', 'radeon-rx-7700-xt', 'Radeon RX 7700 XT', 290),
    ('gpu', 'amd', 'radeon-rx-7600', 'Radeon RX 7600', 300),
    ('gpu', 'amd', 'radeon-rx-6950-xt', 'Radeon RX 6950 XT', 310),
    ('gpu', 'amd', 'radeon-rx-6900-xt', 'Radeon RX 6900 XT', 320),
    ('gpu', 'amd', 'radeon-rx-6800-xt', 'Radeon RX 6800 XT', 330),
    ('gpu', 'amd', 'radeon-rx-6800', 'Radeon RX 6800', 340),
    ('gpu', 'amd', 'radeon-rx-6750-xt', 'Radeon RX 6750 XT', 350),
    ('gpu', 'amd', 'radeon-rx-6700-xt', 'Radeon RX 6700 XT', 360),
    ('gpu', 'amd', 'radeon-rx-6650-xt', 'Radeon RX 6650 XT', 370),
    ('gpu', 'amd', 'radeon-rx-6600-xt', 'Radeon RX 6600 XT', 380),
    ('gpu', 'amd', 'radeon-rx-6600', 'Radeon RX 6600', 390),
    ('gpu', 'amd', 'radeon-vii', 'Radeon VII', 400),
    ('gpu', 'amd', 'radeon-rx-6500-xt', 'Radeon RX 6500 XT', 410),
    ('gpu', 'amd', 'radeon-rx-6400', 'Radeon RX 6400', 420),
    ('gpu', 'amd', 'radeon-rx-5700-xt', 'Radeon RX 5700 XT', 430),
    ('gpu', 'amd', 'radeon-rx-5700', 'Radeon RX 5700', 440),
    ('gpu', 'amd', 'radeon-rx-5600-xt', 'Radeon RX 5600 XT', 450),
    ('gpu', 'amd', 'radeon-rx-5500-xt-8gb', 'Radeon RX 5500 XT 8GB', 460),
    ('gpu', 'amd', 'radeon-rx-vega-64', 'Radeon RX Vega 64', 470),
    ('gpu', 'amd', 'radeon-rx-vega-56', 'Radeon RX Vega 56', 480),
    ('gpu', 'amd', 'radeon-rx-590', 'Radeon RX 590', 490),
    ('gpu', 'amd', 'radeon-rx-580-8gb', 'Radeon RX 580 8GB', 500),
    ('gpu', 'amd', 'radeon-rx-570-8gb', 'Radeon RX 570 8GB', 510),
    ('gpu', 'amd', 'radeon-rx-570-4gb', 'Radeon RX 570 4GB', 520),
    ('gpu', 'amd', 'radeon-rx-480-8gb', 'Radeon RX 480 8GB', 530),
    ('gpu', 'amd', 'radeon-rx-470-4gb', 'Radeon RX 470 4GB', 540),
    ('gpu', 'amd', 'radeon-r9-fury', 'Radeon R9 Fury', 550),
    ('gpu', 'amd', 'radeon-r9-380-4gb', 'Radeon R9 380 4GB', 560),
    ('gpu', 'nvidia', 'geforce-rtx-4090', 'GeForce RTX 4090', 570),
    ('gpu', 'nvidia', 'geforce-rtx-4080', 'GeForce RTX 4080', 580),
    ('gpu', 'nvidia', 'geforce-rtx-4070-ti-super', 'GeForce RTX 4070 Ti Super', 590),
    ('gpu', 'nvidia', 'geforce-rtx-4070-ti', 'GeForce RTX 4070 Ti', 600),
    ('gpu', 'nvidia', 'geforce-rtx-4070-super', 'GeForce RTX 4070 Super', 610),
    ('gpu', 'nvidia', 'geforce-rtx-4070', 'GeForce RTX 4070', 620),
    ('gpu', 'nvidia', 'geforce-rtx-4060-ti', 'GeForce RTX 4060 Ti', 630),
    ('gpu', 'nvidia', 'geforce-rtx-4060', 'GeForce RTX 4060', 640),
    ('gpu', 'nvidia', 'geforce-rtx-3090-ti', 'GeForce RTX 3090 Ti', 650),
    ('gpu', 'nvidia', 'geforce-rtx-3090', 'GeForce RTX 3090', 660),
    ('gpu', 'nvidia', 'geforce-rtx-3080-ti', 'GeForce RTX 3080 Ti', 670),
    ('gpu', 'nvidia', 'geforce-rtx-3080', 'GeForce RTX 3080', 680),
    ('gpu', 'nvidia', 'geforce-rtx-3070-ti', 'GeForce RTX 3070 Ti', 690),
    ('gpu', 'nvidia', 'geforce-rtx-3070', 'GeForce RTX 3070', 700),
    ('gpu', 'nvidia', 'geforce-rtx-3070-ti-laptop', 'GeForce RTX 3070 Ti Laptop', 710),
    ('gpu', 'nvidia', 'geforce-rtx-3070-laptop', 'GeForce RTX 3070 Laptop', 720),
    ('gpu', 'nvidia', 'geforce-rtx-3060-ti-gddr6x', 'GeForce RTX 3060 Ti GDDR6X', 730),
    ('gpu', 'nvidia', 'geforce-rtx-3060-ti', 'GeForce RTX 3060 Ti', 740),
    ('gpu', 'nvidia', 'geforce-rtx-3060', 'GeForce RTX 3060', 750),
    ('gpu', 'nvidia', 'geforce-rtx-3050', 'GeForce RTX 3050', 760),
    ('gpu', 'nvidia', 'geforce-rtx-2080-ti', 'GeForce RTX 2080 Ti', 770),
    ('gpu', 'nvidia', 'geforce-rtx-2080-super', 'GeForce RTX 2080 Super', 780),
    ('gpu', 'nvidia', 'geforce-rtx-2080', 'GeForce RTX 2080', 790),
    ('gpu', 'nvidia', 'geforce-rtx-2070-super', 'GeForce RTX 2070 Super', 800),
    ('gpu', 'nvidia', 'geforce-rtx-2070', 'GeForce RTX 2070', 810),
    ('gpu', 'nvidia', 'geforce-rtx-2060-super', 'GeForce RTX 2060 Super', 820),
    ('gpu', 'nvidia', 'geforce-rtx-2060', 'GeForce RTX 2060', 830),
    ('gpu', 'nvidia', 'geforce-gtx-1660-super', 'GeForce GTX 1660 Super', 840),
    ('gpu', 'nvidia', 'geforce-gtx-1660-ti', 'GeForce GTX 1660 Ti', 850),
    ('gpu', 'nvidia', 'geforce-gtx-1660', 'GeForce GTX 1660', 860),
    ('gpu', 'nvidia', 'geforce-gtx-1080-ti', 'GeForce GTX 1080 Ti', 870),
    ('gpu', 'nvidia', 'geforce-gtx-1080', 'GeForce GTX 1080', 880),
    ('gpu', 'nvidia', 'geforce-gtx-1070-ti', 'GeForce GTX 1070 Ti', 890),
    ('gpu', 'nvidia', 'geforce-gtx-1070', 'GeForce GTX 1070', 900),
    ('gpu', 'nvidia', 'geforce-gtx-1060-6gb', 'GeForce GTX 1060 6GB', 910),
    ('gpu', 'nvidia', 'geforce-gtx-1050-ti', 'GeForce GTX 1050 Ti', 920),
    ('gpu', 'nvidia', 'rtx-a2000-6gb', 'RTX A2000 6GB', 930),
    ('gpu', 'nvidia', 'rtx-a4000', 'RTX A4000', 940),
    ('gpu', 'nvidia', 'rtx-a4500', 'RTX A4500', 950),
    ('gpu', 'nvidia', 'rtx-a5000', 'RTX A5000', 960),
    ('gpu', 'nvidia', 'cmp-170hx', 'CMP 170HX', 970),
    ('gpu', 'nvidia', 'cmp-30hx', 'CMP 30HX', 980),
    ('gpu', 'nvidia', 'cmp-40hx', 'CMP 40HX', 990),
    ('gpu', 'nvidia', 'cmp-50hx', 'CMP 50HX', 1000),
    ('gpu', 'nvidia', 'cmp-70hx', 'CMP 70HX', 1010),
    ('gpu', 'nvidia', 'cmp-90hx', 'CMP 90HX', 1020),
    ('gpu', 'nvidia', 'p102-100', 'P102-100', 1030),
    ('gpu', 'nvidia', 'p104-100', 'P104-100', 1040),
    ('gpu', 'nvidia', 'p106-100', 'P106-100', 1050),
    ('gpu', 'intel', 'arc-a750', 'Arc A750', 1060),
    ('gpu', 'intel', 'arc-a380', 'Arc A380', 1070),
    ('cpu', 'amd', 'ryzen-9-7950x3d', 'Ryzen 9 7950X3D', 1080),
    ('cpu', 'amd', 'ryzen-9-5950x', 'Ryzen 9 5950X', 1090),
    ('cpu', 'amd', 'ryzen-7-5800x', 'Ryzen 7 5800X', 1100),
    ('cpu', 'amd', 'ryzen-5-5600x', 'Ryzen 5 5600X', 1110),
    ('cpu', 'amd', 'epyc-7763', 'EPYC 7763', 1120),
    ('cpu', 'intel', 'i9-13900k', 'i9-13900K', 1130),
    ('cpu', 'intel', 'i9-12900k', 'i9-12900K', 1140),
    ('cpu', 'intel', 'i7-10700k', 'i7-10700K', 1150),
    ('cpu', 'intel', 'i5-10600k', 'i5-10600K', 1160)
) AS x(kind_slug, vendor_slug, slug, name, ord)
JOIN hardware_kinds k ON k.slug = x.kind_slug
JOIN hardware_vendors v ON v.slug = x.vendor_slug
ON CONFLICT (slug) DO UPDATE SET
    kind_id = EXCLUDED.kind_id,
    vendor_id = EXCLUDED.vendor_id,
    name = EXCLUDED.name,
    sort_order = EXCLUDED.sort_order,
    is_published = TRUE,
    updated_at = NOW();

INSERT INTO hardware_model_algorithms (model_id, algorithm_id, hashrate, hashrate_unit, power_watts, is_primary)
SELECT hm.id, a.id, x.hashrate, x.unit, x.power, TRUE
FROM (VALUES
    ('microbt-whatsminer-m70-214-th-s', 'sha256', 214, 'TH/s', 3103),
    ('microbt-whatsminer-m70-236-th-s', 'sha256', 236, 'TH/s', 3422),
    ('microbt-whatsminer-m72-246-th-s', 'sha256', 246, 'TH/s', 3567),
    ('microbt-whatsminer-m60s-186-th-s', 'sha256', 186, 'Th/s', 3145),
    ('microbt-whatsminer-m50s-122-th-s', 'sha256', 122, 'Th/s', 3180),
    ('bitmain-antminer-s21-200-th-s', 'sha256', 200, 'Th/s', 3500),
    ('bitmain-antminer-s21-pro-245-th-s', 'sha256', 245, 'Th/s', 3675),
    ('bitmain-antminer-t21-190-th-s', 'sha256', 190, 'Th/s', 3610),
    ('bitmain-antminer-s19j-pro-104-th-s', 'sha256', 104, 'Th/s', 3050),
    ('bitmain-antminer-l9-16000-mh-s', 'scrypt', 16000, 'Mh/s', 3360),
    ('canaan-avalon-a16xp-300-th-s', 'sha256', 300, 'Th/s', 3850),
    ('canaan-avalon-a15-pro-218t-218-th-s', 'sha256', 218, 'Th/s', 3662),
    ('canaan-avalon-a1366-130-th-s', 'sha256', 130, 'Th/s', 3250),
    ('goldshell-lt6-3350-mh-s', 'scrypt', 3350, 'Mh/s', 3200),
    ('goldshell-mini-doge-185-mh-s', 'scrypt', 185, 'Mh/s', 235),
    ('innosilicon-t4plus-175-th-s', 'sha256', 175, 'Th/s', 3120),
    ('innosilicon-a11-pro-8gb-2000-mh-s', 'etchash', 2000, 'Mh/s', 2500),
    ('ipollo-b2-110-th-s', 'sha256', 110, 'Th/s', 3250),
    ('ipollo-v1-mini-300-mh-s', 'etchash', 300, 'Mh/s', 240),
    ('jasminer-x16-p-5800-mh-s', 'etchash', 5800, 'MH/s', 1900),
    ('jasminer-x4-2500-mh-s', 'etchash', 2500, 'Mh/s', 1200),
    ('beeminer-ld4-5-gh-s', 'scrypt', 5, 'Gh/s', 3550),
    ('hummer-h9-pro-80-th-s', 'sha256', 80, 'Th/s', 3360),
    ('elphapex-dg1plus-13000-mh-s', 'scrypt', 13000, 'Mh/s', 3510),
    ('elphapex-dg2-20000-mh-s', 'scrypt', 20000, 'Mh/s', 3800),
    ('radeon-rx-7900-xtx', 'ethash', 105, 'Mh/s', 320),
    ('radeon-rx-7900-xt', 'ethash', 83, 'Mh/s', 300),
    ('radeon-rx-7800-xt', 'dynexsolve', 1.55, 'Mh/s', 160),
    ('radeon-rx-7700-xt', 'autolykos', 91.58, 'Mh/s', 121),
    ('radeon-rx-7600', 'etchash', 322, 'Mh/s', 81),
    ('radeon-rx-6950-xt', 'ethash', 53.86, 'Mh/s', 136),
    ('radeon-rx-6900-xt', 'ethash', 62, 'Mh/s', 150),
    ('radeon-rx-6800-xt', 'ethash', 62, 'Mh/s', 110),
    ('radeon-rx-6800', 'ethash', 61, 'Mh/s', 110),
    ('radeon-rx-6750-xt', 'ethash', 40.11, 'Mh/s', 73),
    ('radeon-rx-6700-xt', 'ethash', 46, 'Mh/s', 100),
    ('radeon-rx-6650-xt', 'ethash', 27.37, 'Mh/s', 46),
    ('radeon-rx-6600-xt', 'ethash', 32, 'Mh/s', 70),
    ('radeon-rx-6600', 'ethash', 28.5, 'Mh/s', 60),
    ('radeon-vii', 'ethash', 94, 'Mh/s', 180),
    ('radeon-rx-6500-xt', 'etchash', 13.32, 'Mh/s', 26),
    ('radeon-rx-6400', 'blake3', 0.26, 'Mh/s', 13),
    ('radeon-rx-5700-xt', 'ethash', 55, 'Mh/s', 130),
    ('radeon-rx-5700', 'ethash', 55, 'Mh/s', 130),
    ('radeon-rx-5600-xt', 'ethash', 40.5, 'Mh/s', 110),
    ('radeon-rx-5500-xt-8gb', 'ethash', 26, 'Mh/s', 90),
    ('radeon-rx-vega-64', 'ethash', 50, 'Mh/s', 180),
    ('radeon-rx-vega-56', 'ethash', 49, 'Mh/s', 170),
    ('radeon-rx-590', 'kawpow', 10.94, 'Mh/s', 104),
    ('radeon-rx-580-8gb', 'ethash', 30.5, 'Mh/s', 130),
    ('radeon-rx-570-8gb', 'ethash4g', 27.9, 'Mh/s', 120),
    ('radeon-rx-570-4gb', 'zhash', 19, 'Mh/s', 100),
    ('radeon-rx-480-8gb', 'ethash', 30, 'Mh/s', 140),
    ('radeon-rx-470-4gb', 'ethash4g', 26, 'Mh/s', 120),
    ('radeon-r9-fury', 'ethash4g', 29, 'Mh/s', 220),
    ('radeon-r9-380-4gb', 'ethash4g', 19, 'Mh/s', 150),
    ('geforce-rtx-4090', 'ethash', 127, 'Mh/s', 260),
    ('geforce-rtx-4080', 'ethash', 87, 'Mh/s', 200),
    ('geforce-rtx-4070-ti-super', 'ethash', 83, 'Mh/s', 190),
    ('geforce-rtx-4070-ti', 'ethash', 65, 'Mh/s', 120),
    ('geforce-rtx-4070-super', 'ethash', 63, 'Mh/s', 150),
    ('geforce-rtx-4070', 'ethash', 62, 'Mh/s', 140),
    ('geforce-rtx-4060-ti', 'ethash', 39, 'Mh/s', 80),
    ('geforce-rtx-4060', 'blake3', 1.18, 'Mh/s', 90),
    ('geforce-rtx-3090-ti', 'ethash', 128, 'Mh/s', 350),
    ('geforce-rtx-3090', 'ethash', 119, 'Mh/s', 320),
    ('geforce-rtx-3080-ti', 'ethash', 117, 'Mh/s', 330),
    ('geforce-rtx-3080', 'ethash', 98, 'Mh/s', 240),
    ('geforce-rtx-3070-ti', 'ethash', 80, 'Mh/s', 200),
    ('geforce-rtx-3070', 'kawpow', 30.59, 'Mh/s', 150),
    ('geforce-rtx-3070-ti-laptop', 'nexapow', 77.14, 'Mh/s', 123),
    ('geforce-rtx-3070-laptop', 'nexapow', 67.11, 'Mh/s', 110),
    ('geforce-rtx-3060-ti-gddr6x', 'blake3-ironfish', 97700, 'Mh/s', 68),
    ('geforce-rtx-3060-ti', 'ethash', 60, 'Mh/s', 140),
    ('geforce-rtx-3060', 'ethash', 41, 'Mh/s', 110),
    ('geforce-rtx-3050', 'ethash', 29.69, 'Mh/s', 85),
    ('geforce-rtx-2080-ti', 'ethash', 55.2, 'Mh/s', 180),
    ('geforce-rtx-2080-super', 'ethash', 460, 'Mh/s', 160),
    ('geforce-rtx-2080', 'ethash', 41, 'Mh/s', 160),
    ('geforce-rtx-2070-super', 'ethash', 44.1, 'Mh/s', 109),
    ('geforce-rtx-2070', 'ethash', 41, 'Mh/s', 140),
    ('geforce-rtx-2060-super', 'ethash', 43.43, 'Mh/s', 105),
    ('geforce-rtx-2060', 'ethash', 31, 'Mh/s', 120),
    ('geforce-gtx-1660-super', 'ethash', 29, 'Mh/s', 90),
    ('geforce-gtx-1660-ti', 'ethash', 28, 'Mh/s', 80),
    ('geforce-gtx-1660', 'ethash', 24, 'Mh/s', 80),
    ('geforce-gtx-1080-ti', 'ethash', 37.5, 'Mh/s', 180),
    ('geforce-gtx-1080', 'ethash', 33.5, 'Mh/s', 170),
    ('geforce-gtx-1070-ti', 'ethash', 28, 'Mh/s', 140),
    ('geforce-gtx-1070', 'ethash', 30, 'Mh/s', 130),
    ('geforce-gtx-1060-6gb', 'ethash', 20.5, 'Mh/s', 90),
    ('geforce-gtx-1050-ti', 'ethash4g', 13, 'Mh/s', 80),
    ('rtx-a2000-6gb', 'ethash', 39, 'Mh/s', 80),
    ('rtx-a4000', 'ethash', 59, 'Mh/s', 140),
    ('rtx-a4500', 'ethash', 87, 'Mh/s', 190),
    ('rtx-a5000', 'ethash', 99, 'Mh/s', 230),
    ('cmp-170hx', 'blake3', 1.53, 'Mh/s', 104),
    ('cmp-30hx', 'nexapow', 32.26, 'Mh/s', 75),
    ('cmp-40hx', 'nexapow', 47.96, 'Mh/s', 123),
    ('cmp-50hx', 'nexapow', 67.69, 'Mh/s', 137),
    ('cmp-70hx', 'ethash', 80.76, 'Mh/s', 199),
    ('cmp-90hx', 'ethash', 100.16, 'Mh/s', 249),
    ('p102-100', 'ethash', 450, 'Mh/s', 190),
    ('p104-100', 'ethash', 36.27, 'Mh/s', 135),
    ('p106-100', 'ethash', 23.36, 'Mh/s', 86),
    ('arc-a750', 'etchash', 50.88, 'Mh/s', 165),
    ('arc-a380', 'zhash', 20.2, 'Mh/s', 75),
    ('ryzen-9-7950x3d', 'randomx', 22500, 'H/s', 120),
    ('ryzen-9-5950x', 'randomx', 20000, 'H/s', 105),
    ('ryzen-7-5800x', 'randomx', 11100, 'H/s', 105),
    ('ryzen-5-5600x', 'ghostrider', 2100, 'H/s', 65),
    ('epyc-7763', 'randomx', 47000, 'H/s', 310),
    ('i9-13900k', 'randomx', 13480, 'H/s', 125),
    ('i9-12900k', 'randomx', 11600, 'H/s', 125),
    ('i7-10700k', 'randomx', 5600, 'H/s', 125),
    ('i5-10600k', 'randomx', 5640, 'H/s', 125)
) AS x(model_slug, algo_slug, hashrate, unit, power)
JOIN hardware_models hm ON hm.slug = x.model_slug
JOIN hardware_algorithms a ON a.slug = x.algo_slug
ON CONFLICT (model_id, algorithm_id) DO UPDATE SET
    hashrate = EXCLUDED.hashrate,
    hashrate_unit = EXCLUDED.hashrate_unit,
    power_watts = EXCLUDED.power_watts,
    is_primary = TRUE;

CREATE TABLE IF NOT EXISTS calculator_settings (
    key        TEXT PRIMARY KEY,
    value_json JSONB NOT NULL DEFAULT '{}'::jsonb,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

INSERT INTO calculator_settings (key, value_json) VALUES
    ('hashrate_units', '["Th/s","Gh/s","Mh/s","Kh/s","H/s"]'::jsonb),
    ('fiat_options', '["₽","$"]'::jsonb),
    ('defaults', '{"price":120000,"quantity":1,"uptime":99,"pool_fee":4,"usdt_rub":79.2,"electricity_price":5.5}'::jsonb),
    ('gpu_algorithms', '["Ethash","Ethash4G","Etchash","Zhash","SHA512256d","DynexSolve","PyrinHash","Skydoge","Cuckatoo32","Blake3","blake3Ironfish","Karlsenhash","Autolykos","IronFish","FishHash","PoUW","KawPow","NexaPow"]'::jsonb)
ON CONFLICT (key) DO UPDATE SET value_json = EXCLUDED.value_json, updated_at = NOW();

