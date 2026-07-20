SET client_encoding = 'UTF8';

CREATE TABLE IF NOT EXISTS article_block_types (
    slug        TEXT PRIMARY KEY,
    title       TEXT    NOT NULL,
    payload_doc TEXT    NOT NULL DEFAULT '',
    is_active   BOOLEAN NOT NULL DEFAULT TRUE
);

INSERT INTO article_block_types (slug, title, payload_doc) VALUES
    ('html',       'HTML (legacy)',       '{ "html": "..." }'),
    ('paragraph',  'Абзац',               '{ "html": "..." }'),
    ('heading',    'Заголовок',           '{ "level": 2, "text": "..." }'),
    ('image',      'Изображение',         '{ "media_id": 12, "caption": "..." }'),
    ('gallery',    'Галерея',             '{ "media_ids": [1,2,3] }'),
    ('quote',      'Цитата',              '{ "text": "...", "author": "..." }'),
    ('list',       'Список',              '{ "ordered": false, "items": ["..."] }'),
    ('table',      'Таблица',             '{ "head": [...], "rows": [[...]] }'),
    ('embed',      'Видео',               '{ "provider": "youtube", "id": "..." }'),
    ('calculator', 'Виджет калькулятора', '{ "kind": "asic", "model_slug": "..." }'),
    ('org_card',   'Карточка компании',   '{ "organization_slug": "bitget" }'),
    ('cta',        'Призыв к действию',   '{ "text": "...", "href": "..." }')
ON CONFLICT (slug) DO UPDATE
    SET title = EXCLUDED.title,
        payload_doc = EXCLUDED.payload_doc;

CREATE TABLE IF NOT EXISTS article_blocks (
    id         BIGSERIAL PRIMARY KEY,
    article_id INT     NOT NULL REFERENCES articles (id) ON DELETE CASCADE,
    position   INTEGER NOT NULL,
    type       TEXT    NOT NULL REFERENCES article_block_types (slug) ON DELETE RESTRICT,
    payload    JSONB   NOT NULL DEFAULT '{}'::jsonb,
    anchor     TEXT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    UNIQUE (article_id, position)
);

CREATE INDEX IF NOT EXISTS idx_article_blocks_article ON article_blocks (article_id, position);

ALTER TABLE articles
    ADD COLUMN IF NOT EXISTS reading_minutes INTEGER,
    ADD COLUMN IF NOT EXISTS seo_title       TEXT,
    ADD COLUMN IF NOT EXISTS seo_description TEXT,
    ADD COLUMN IF NOT EXISTS uses_blocks     BOOLEAN NOT NULL DEFAULT FALSE;

UPDATE articles
SET reading_minutes = reading_time_min
WHERE reading_minutes IS NULL AND reading_time_min IS NOT NULL;

INSERT INTO article_blocks (article_id, position, type, payload)
SELECT
    a.id,
    1,
    'html',
    jsonb_build_object(
        'html',
        CASE
            WHEN COALESCE(a.content_html, '') <> '' THEN a.content_html
            ELSE a.content
        END
    )
FROM articles a
WHERE (
        COALESCE(a.content, '') <> ''
        OR COALESCE(a.content_html, '') <> ''
    )
  AND NOT EXISTS (
        SELECT 1 FROM article_blocks b WHERE b.article_id = a.id
    )
ON CONFLICT (article_id, position) DO NOTHING;

UPDATE articles a
SET uses_blocks = TRUE
WHERE EXISTS (SELECT 1 FROM article_blocks b WHERE b.article_id = a.id);

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 1000 + v.sort_order, 'heading',
       jsonb_build_object('level', v.level, 'text', v.title), v.anchor
FROM articles a
JOIN (
    VALUES
        ('blockchain-forum-2026-moscow', 'tri-sceny-i-bezprecedentnyj-masshtab', 'Три сцены и беспрецедентный масштаб', 2, 1),
        ('blockchain-forum-2026-moscow', 'ai-tehnologii-i-novye-formaty', 'AI технологии и новые форматы', 2, 2),
        ('blockchain-forum-2026-moscow', 'bilety-i-uchastie', 'Билеты и участие', 2, 3),
        ('whatsminer-m70-line-review', 'intro', 'Введение', 2, 1),
        ('whatsminer-m70-line-review', 'whats-interesting', 'Whatsminer M70: что интересного?', 2, 2),
        ('whatsminer-m70-line-review', 'efficiency-classes', 'Линейка Whatsminer M70: три класса энергоэффективности', 2, 3),
        ('whatsminer-m70-line-review', 'cooling', 'Охлаждение: три формата для разных задач', 2, 4),
        ('whatsminer-m70-line-review', 'tech-features', 'Технологические особенности серии M70', 2, 5),
        ('whatsminer-m70-line-review', 'industry-impact', 'Как обновление M70 повлияет на индустрию?', 2, 6),
        ('whatsminer-m70-line-review', 'conclusion', 'Выводы', 2, 7)
) AS v(slug, anchor, title, level, sort_order) ON a.slug = v.slug
WHERE NOT EXISTS (
    SELECT 1 FROM article_blocks b
    WHERE b.article_id = a.id AND b.type = 'heading'
      AND b.anchor IS NOT DISTINCT FROM v.anchor
)
ON CONFLICT (article_id, position) DO NOTHING;

CREATE TABLE IF NOT EXISTS article_tags (
    id    BIGSERIAL PRIMARY KEY,
    slug  TEXT NOT NULL UNIQUE,
    title TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS article_tag_links (
    article_id INT NOT NULL REFERENCES articles (id) ON DELETE CASCADE,
    tag_id     BIGINT NOT NULL REFERENCES article_tags (id) ON DELETE CASCADE,
    PRIMARY KEY (article_id, tag_id)
);
