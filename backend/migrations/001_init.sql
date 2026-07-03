-- Инициализация каталога (схема + данные)
-- При первом запуске docker compose подхватывается автоматически.
-- Пересоздать БД: docker compose down -v && docker compose up -d

SET client_encoding = 'UTF8';

CREATE TABLE IF NOT EXISTS catalog_categories (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    slug TEXT NOT NULL UNIQUE,
    sort_order INT NOT NULL DEFAULT 0
);

CREATE TABLE IF NOT EXISTS catalog_organizations (
    id SERIAL PRIMARY KEY,
    category_id INT NOT NULL REFERENCES catalog_categories (id) ON DELETE CASCADE,
    name TEXT NOT NULL,
    logo_url TEXT NOT NULL DEFAULT '',
    description TEXT NOT NULL DEFAULT '',
    rating NUMERIC(2, 1) NOT NULL DEFAULT 0,
    review_count INT NOT NULL DEFAULT 0,
    sort_order INT NOT NULL DEFAULT 0
);

INSERT INTO catalog_categories (name, slug, sort_order) VALUES
    ('Продажа ASIC', 'asic-sales', 1),
    ('Майнинг-отели', 'mining-hotels', 2),
    ('Производители оборудования', 'equipment-manufacturers', 3),
    ('Майнинг-пулы', 'mining-pools', 4)
ON CONFLICT (slug) DO NOTHING;

INSERT INTO catalog_organizations (category_id, name, logo_url, description, rating, review_count, sort_order)
SELECT c.id, v.name, v.logo_url, v.description, v.rating, v.review_count, v.sort_order
FROM catalog_categories c
JOIN (
    VALUES
        -- Продажа ASIC
        ('asic-sales', 'BitCluster', '/images/catalog/bitcluster.png', 'Продажа ASIC-майнеров и майнинг-инфраструктуры.', 0, 0, 1),
        ('asic-sales', 'Algoritm', 'https://top-mining.ru/wp-content/uploads/2025/07/algoritm-1.png', 'Поставщик майнинг-оборудования и комплексных решений для дата-центров.', 0, 0, 2),
        ('asic-sales', 'MBTC', '/images/catalog/r7miner.png', 'Продажа ASIC-майнеров и сопутствующего оборудования.', 4.9, 113, 3),
        ('asic-sales', 'Mining center', '/images/catalog/mining-center.png', 'Продажа ASIC-майнеров, подбор оборудования и сервисное обслуживание.', 0, 0, 4),
        ('asic-sales', 'r7miner', '/images/catalog/r7miner.png', 'Продажа ASIC-майнеров с высоким рейтингом и большим числом отзывов.', 4.9, 113, 5),
        ('asic-sales', 'IBMM', 'https://top-mining.ru/wp-content/uploads/2024/08/ibmm-90x90-1.png', 'Продажа ASIC-майнеров, консультации и техническая поддержка.', 4.8, 485, 6),
        ('asic-sales', 'GIS Mining', 'https://top-mining.ru/wp-content/uploads/2024/07/gis-mining-90x90-1.png', 'Поставка и обслуживание майнинг-оборудования.', 4.8, 145, 7),
        ('asic-sales', 'Pushminer', 'https://top-mining.ru/wp-content/uploads/2024/09/pushminer-2.png', 'Продажа ASIC-майнеров и комплектующих.', 4.5, 265, 8),
        ('asic-sales', 'DC mining', '/images/catalog/dc-mining.png', 'Продажа и размещение майнинг-оборудования.', 5, 8, 9),
        ('asic-sales', 'TCS mining', '/images/catalog/tcs-mining.png', 'Поставка ASIC-майнеров и комплектующих.', 5, 1, 10),
        -- Майнинг-отели
        ('mining-hotels', 'Intelion Data Systems', '/images/catalog/intelion.png', 'Майнинг-отель с размещением и обслуживанием оборудования.', 0, 0, 1),
        ('mining-hotels', 'Майнинг отель «Терешково»', 'https://top-mining.ru/wp-content/uploads/2025/12/generated-image-5-1.jpg', 'Промышленный майнинг-отель в Москве с круглосуточным мониторингом.', 0, 0, 2),
        ('mining-hotels', '1-MINING', 'https://top-mining.ru/wp-content/uploads/2025/07/1-mining-1.png', 'Хостинг майнинг-оборудования с технической поддержкой и мониторингом.', 0, 0, 3),
        ('mining-hotels', 'Weltall Energy', 'https://top-mining.ru/wp-content/uploads/2025/05/weltall-energy.png', 'Энергоэффективный майнинг-отель с размещением и обслуживанием ASIC.', 5, 4, 4),
        ('mining-hotels', 'DataCheap', 'https://top-mining.ru/wp-content/uploads/2024/09/datacheap-1.png', 'Размещение майнинг-оборудования с мониторингом и техподдержкой.', 2.5, 203, 5),
        ('mining-hotels', 'RusHash', '/images/catalog/rushash.png', 'Майнинг-отель: размещение и обслуживание ASIC.', 0, 0, 6),
        ('mining-hotels', 'aversmining.pro', '/images/catalog/elphapex.png', 'Майнинг-отель: размещение и мониторинг оборудования.', 0, 0, 7),
        -- Производители оборудования
        ('equipment-manufacturers', 'SealMiner', '/images/catalog/sealminer.png', 'Производитель ASIC-майнеров SealMiner.', 0, 0, 1),
        ('equipment-manufacturers', 'BITMAIN', 'https://top-mining.ru/wp-content/uploads/2024/08/bitmain-1.png', 'Крупнейший производитель ASIC-майнеров Bitmain.', 4.9, 567, 2),
        ('equipment-manufacturers', 'MicroBT', 'https://top-mining.ru/wp-content/uploads/2024/08/microbt-1.png', 'Производитель майнинг-оборудования MicroBT.', 4.8, 312, 3),
        ('equipment-manufacturers', 'Canaan', 'https://top-mining.ru/wp-content/uploads/2024/08/canaan-1.png', 'Производитель ASIC-майнеров Canaan.', 4.7, 198, 4),
        ('equipment-manufacturers', 'IceRiver', 'https://top-mining.ru/wp-content/uploads/2024/08/iceriver-1-1.png', 'Производитель майнинг-оборудования IceRiver.', 0, 0, 5),
        ('equipment-manufacturers', 'Fluminer', '/images/catalog/fluminer.png', 'Производитель майнинг-оборудования Fluminer.', 0, 0, 6),
        ('equipment-manufacturers', 'Bombax', '/images/catalog/volcminer.png', 'Производитель ASIC-майнеров Bombax.', 0, 0, 7),
        ('equipment-manufacturers', 'VolcMiner', '/images/catalog/volcminer.png', 'Производитель майнинг-оборудования VolcMiner.', 0, 0, 8),
        ('equipment-manufacturers', 'ElphaPex', '/images/catalog/elphapex.png', 'Производитель ASIC-майнеров ElphaPex.', 0, 0, 9),
        -- Майнинг-пулы
        ('mining-pools', 'K8X', 'https://top-mining.ru/wp-content/uploads/2026/03/avatar.jpg', 'Майнинг-пул K8X для добычи криптовалют.', 5, 5, 1),
        ('mining-pools', 'Masspool.io', '/images/catalog/masspool.png', 'Майнинг-пул Masspool.io с прозрачной статистикой и выплатами.', 5, 7, 2),
        ('mining-pools', 'Neopool', 'https://top-mining.ru/wp-content/uploads/2025/12/logo-neopul.png', 'Майнинг-пул Neopool для майнеров.', 5, 1, 3),
        ('mining-pools', 'RUPOOL.PRO', '/images/catalog/rupool.png', 'Российский майнинг-пул RUPOOL.PRO.', 5, 1, 4),
        ('mining-pools', 'ViaBTC', '/images/catalog/viabtc.png', 'Крупный международный майнинг-пул ViaBTC.', 3.3, 18, 5)
) AS v(slug, name, logo_url, description, rating, review_count, sort_order)
    ON c.slug = v.slug
WHERE NOT EXISTS (
    SELECT 1 FROM catalog_organizations o WHERE o.category_id = c.id
);
