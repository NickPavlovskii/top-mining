SET client_encoding = 'UTF8';

-- ---------------------------------------------------------------------
-- 1. Единое хранилище изображений
-- ---------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS media_assets (
    id         BIGSERIAL PRIMARY KEY,
    path       TEXT        NOT NULL UNIQUE,
    alt        TEXT        NOT NULL DEFAULT '',
    title      TEXT,
    mime       TEXT        NOT NULL DEFAULT 'image/webp',
    width      INTEGER,
    height     INTEGER,
    blurhash   TEXT,
    source     TEXT        NOT NULL DEFAULT 'legacy',
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);


-- ---------------------------------------------------------------------
-- 2. Универсальные связи между сущностями
-- ---------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS entity_links (
    id          BIGSERIAL PRIMARY KEY,
    from_type   TEXT    NOT NULL,
    from_id     BIGINT  NOT NULL,
    to_type     TEXT    NOT NULL,
    to_id       BIGINT  NOT NULL,
    relation    TEXT    NOT NULL DEFAULT 'related',
    sort_order  INTEGER NOT NULL DEFAULT 100,
    UNIQUE (from_type, from_id, to_type, to_id, relation)
);

CREATE INDEX IF NOT EXISTS idx_entity_links_from ON entity_links (from_type, from_id, relation);
CREATE INDEX IF NOT EXISTS idx_entity_links_to   ON entity_links (to_type, to_id, relation);


-- ---------------------------------------------------------------------
-- 3. Ссылки на media_assets в существующих таблицах
-- ---------------------------------------------------------------------
ALTER TABLE catalog_organizations
    ADD COLUMN IF NOT EXISTS logo_media_id        BIGINT REFERENCES media_assets (id) ON DELETE SET NULL,
    ADD COLUMN IF NOT EXISTS detail_logo_media_id BIGINT REFERENCES media_assets (id) ON DELETE SET NULL;

ALTER TABLE articles
    ADD COLUMN IF NOT EXISTS cover_media_id BIGINT REFERENCES media_assets (id) ON DELETE SET NULL;

ALTER TABLE organization_gallery_images
    ADD COLUMN IF NOT EXISTS media_id BIGINT REFERENCES media_assets (id) ON DELETE SET NULL;


-- ---------------------------------------------------------------------
-- 4. Перенос путей в media_assets
-- ---------------------------------------------------------------------
INSERT INTO media_assets (path, alt, source)
SELECT DISTINCT o.logo_url, o.name, 'organization_logo'
FROM catalog_organizations o
WHERE o.logo_url IS NOT NULL AND o.logo_url <> ''
ON CONFLICT (path) DO NOTHING;

INSERT INTO media_assets (path, alt, source)
SELECT DISTINCT o.detail_logo_url, o.name, 'organization_logo_detail'
FROM catalog_organizations o
WHERE o.detail_logo_url IS NOT NULL AND o.detail_logo_url <> ''
ON CONFLICT (path) DO NOTHING;

INSERT INTO media_assets (path, alt, source)
SELECT DISTINCT a.image_url, COALESCE(NULLIF(a.image_alt, ''), a.title), 'article_cover'
FROM articles a
WHERE a.image_url IS NOT NULL AND a.image_url <> ''
ON CONFLICT (path) DO NOTHING;

INSERT INTO media_assets (path, alt, source)
SELECT DISTINCT g.image_url, COALESCE(NULLIF(g.image_alt, ''), ''), 'organization_gallery'
FROM organization_gallery_images g
WHERE g.image_url IS NOT NULL AND g.image_url <> ''
ON CONFLICT (path) DO NOTHING;

UPDATE catalog_organizations o
SET logo_media_id = m.id
FROM media_assets m
WHERE m.path = o.logo_url AND o.logo_media_id IS NULL;

UPDATE catalog_organizations o
SET detail_logo_media_id = m.id
FROM media_assets m
WHERE m.path = o.detail_logo_url AND o.detail_logo_media_id IS NULL;

UPDATE articles a
SET cover_media_id = m.id
FROM media_assets m
WHERE m.path = a.image_url AND a.cover_media_id IS NULL;

UPDATE organization_gallery_images g
SET media_id = m.id
FROM media_assets m
WHERE m.path = g.image_url AND g.media_id IS NULL;


-- ---------------------------------------------------------------------
-- 5. Связанные статьи → entity_links (раньше article_related)
-- ---------------------------------------------------------------------
INSERT INTO entity_links (from_type, from_id, to_type, to_id, relation, sort_order)
SELECT 'article', a.id, 'article', r.id, 'related', v.sort_order
FROM (
    VALUES
        ('blockchain-forum-2026-moscow', 'whatsminer-m70-line-review', 1),
        ('blockchain-forum-2026-moscow', 'best-asic-miners-2026', 2),
        ('blockchain-forum-2026-moscow', 'the-trends-conference', 3),
        ('blockchain-forum-2026-moscow', 'best-time-to-buy-asic', 4),
        ('blockchain-forum-2026-moscow', 'mining-on-gas-russia', 5),
        ('blockchain-forum-2026-moscow', 'bitcoin-as-investment-asset', 6),
        ('whatsminer-m70-line-review', 'best-asic-miners-2026', 1),
        ('whatsminer-m70-line-review', 'asic-hardware-overview', 2),
        ('whatsminer-m70-line-review', 'mining-datacenter-guide', 3)
) AS v(from_slug, to_slug, sort_order)
JOIN articles a ON a.slug = v.from_slug
JOIN articles r ON r.slug = v.to_slug
ON CONFLICT (from_type, from_id, to_type, to_id, relation) DO NOTHING;


-- ---------------------------------------------------------------------
-- 6. Категория знает дочерний блок профиля (убирает хардкод в Go)
-- ---------------------------------------------------------------------
ALTER TABLE catalog_categories ADD COLUMN IF NOT EXISTS profile_block TEXT;

UPDATE catalog_categories SET profile_block = 'equipment_sales' WHERE slug = 'asic-sales';
UPDATE catalog_categories SET profile_block = 'mining_hotel' WHERE slug = 'mining-hotels';
UPDATE catalog_categories SET profile_block = NULL WHERE slug = 'equipment-manufacturers';
UPDATE catalog_categories SET profile_block = 'mining_pool' WHERE slug = 'mining-pools';
UPDATE catalog_categories SET profile_block = NULL WHERE slug = 'asic-repair';
UPDATE catalog_categories SET profile_block = 'crypto_exchange' WHERE slug = 'crypto-exchanges';
UPDATE catalog_categories SET profile_block = 'crypto_wallet' WHERE slug = 'crypto-wallets';
UPDATE catalog_categories SET profile_block = NULL WHERE slug IN ('asic-firmware', 'events');
