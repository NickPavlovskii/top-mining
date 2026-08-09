SET client_encoding = 'UTF8';

-- EN (и другие локали) для метаданных статьи. RU остаётся в articles.*.
CREATE TABLE IF NOT EXISTS article_translations (
    article_id INT NOT NULL REFERENCES articles (id) ON DELETE CASCADE,
    locale TEXT NOT NULL CHECK (locale ~ '^[a-z]{2}$'),
    title TEXT NOT NULL,
    excerpt TEXT NOT NULL DEFAULT '',
    image_alt TEXT NOT NULL DEFAULT '',
    content TEXT NOT NULL DEFAULT '',
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    PRIMARY KEY (article_id, locale)
);

CREATE INDEX IF NOT EXISTS article_translations_locale_idx
    ON article_translations (locale);

-- EN payload блоков; RU — в article_blocks.payload.
CREATE TABLE IF NOT EXISTS article_block_translations (
    block_id BIGINT NOT NULL REFERENCES article_blocks (id) ON DELETE CASCADE,
    locale TEXT NOT NULL CHECK (locale ~ '^[a-z]{2}$'),
    payload JSONB NOT NULL,
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    PRIMARY KEY (block_id, locale)
);

CREATE INDEX IF NOT EXISTS article_block_translations_locale_idx
    ON article_block_translations (locale);
