-- Переводим категории статей на 5 вкладок из макета.
UPDATE articles
SET topic_id = 'mining'
WHERE topic_id IN ('news', 'crypto', 'misc');

UPDATE article_topics
SET label = 'Все о майнинге', sort_order = 1
WHERE id = 'mining';

UPDATE article_topics SET sort_order = 2 WHERE id = 'tools';
UPDATE article_topics SET sort_order = 3 WHERE id = 'investments';
UPDATE article_topics SET sort_order = 4 WHERE id = 'beginners';

DELETE FROM article_topics WHERE id IN ('news', 'crypto', 'misc');

-- Hero для вкладки «Все о майнинге»
UPDATE articles
SET display_type = 'hero', sort_order = 1
WHERE slug = 'whatsminer-m70-line-review';

UPDATE articles
SET display_type = 'featured', sort_order = 2
WHERE slug = 'best-asic-miners-2026';

UPDATE articles
SET display_type = 'featured', sort_order = 3
WHERE slug = 'asic-hardware-overview';

UPDATE articles
SET display_type = 'featured', sort_order = 4
WHERE slug = 'blockchain-life-2025-afterparty';

UPDATE articles
SET display_type = 'featured', sort_order = 5
WHERE slug = 'the-trends-conference';
