SET client_encoding = 'UTF8';

CREATE INDEX IF NOT EXISTS catalog_organizations_category_list_idx
    ON catalog_organizations (category_id, sort_order, id)
    WHERE is_published = TRUE;

DROP INDEX IF EXISTS articles_topic_feed_idx;
CREATE INDEX articles_topic_feed_idx
    ON articles (topic_id, sort_order, published_at DESC, id)
    WHERE is_published = TRUE;

DROP INDEX IF EXISTS idx_article_blocks_article;
