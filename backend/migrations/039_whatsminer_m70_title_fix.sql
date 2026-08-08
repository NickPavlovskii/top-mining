SET client_encoding = 'UTF8';

-- =====================================================================
-- 039_whatsminer_m70_title_fix.sql
-- Заголовок как на карточке/production:
-- «Новое поколение Whatsminer M70: полный обзор линейки»
-- =====================================================================

UPDATE articles
SET
    title = 'Новое поколение Whatsminer M70: полный обзор линейки',
    title_subtitle = ''
WHERE slug = 'whatsminer-m70-line-review';
