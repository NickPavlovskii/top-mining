SET client_encoding = 'UTF8';

-- =====================================================================
-- 033_blockchain_forum_2026_article.sql
-- Обновляет/создаёт статью Blockchain Forum 2026 с полным текстом и блоками.
-- =====================================================================

INSERT INTO articles (
    slug, title, title_subtitle, excerpt, content, topic_id,
    reading_time_min, reading_minutes, published_at, view_count,
    display_type, sort_order, is_published, uses_blocks,
    image_url, image_alt
) VALUES (
    'blockchain-forum-2026-moscow',
    'Blockchain Forum 2026: Мировая Крипто Индустрия Возвращается в Москву 14-15 Апреля.',
    'Blockchain Forum 2026 April',
    $excerpt$14–15 апреля 2026 в Москве пройдёт Blockchain Forum 2026 — крупнейшее событие, объединяющее СНГ и мировой крипторынок. Промокод TOPMINING — скидка 10%.$excerpt$,
    $content$14–15 апреля 2026 года состоится Blockchain Forum 2026 — крупнейшее событие, которое вновь объединит СНГ и мировой крипторынки. Это единственное мероприятие, которое соберёт в Москве ведущие международные компании индустрии, спикеров и инвесторов.

За организацией события стоит команда, подарившая индустрии форум Blockchain Life – легендарное мероприятие собирающее десятки тысяч человек в мировых крипто столицах с 2017 года.

В международном форуме традиционно участвуют основатели, топ-менеджеры и визионеры из Tether, Binance, Tron, Ripple, Bybit, Bitget, Promminer, A7A5, Animoca Brands, Circle, OKX, HTX, Kucoin, Telegram, Mastercard, ICP, Trust Wallet, Sandbox, Near, Litecoin, Bitmain, Marathon, Canaan, WhatsMiner, Bitfury, Consensys, Linea, DWF Labs, Wintermute, BNB chain и многие другие.

Для русскоязычного рынка это редкая возможность услышать мировых лидеров лично и наладить контакты без посредников.

Три сцены и беспрецедентный масштаб

16-й Blockchain Forum займёт отдельный павильон Крокус Экспо, предлагая 20,000 участников три полноценных сцены с параллельными потоками выступлений, панельных сессий и воркшопов.

Кроме того, все выступления зарубежных спикеров будут сопровождаться синхронным переводом на русский язык.

На территории форума будет работать масштабная выставочная зона, где более 250 компаний представят свои продукты, сервисы и технологические решения.

Посетители смогут не только познакомиться с уже известными брендами, но и стать первыми, кто увидит премьеры новых платформ, продуктов, токенов и инструментов, до их попадания в мейнстрим.

AI технологии и новые форматы

Впервые в рамках Blockchain Forum состоится AI Future — “форум внутри форума”, посвящённый пересечению искусственного интеллекта, блокчейна и цифровой экономики. Здесь встретятся представители индустрии, разработчики, исследователи и инвесторы, чтобы обсудить, как формируется синергия AI и блокчейн технологий.

Участников также ждут интерактивные зоны, хакатоны, конкурс стартапов, NFT-инсталляции, трейдинговый турнир и другие иммерсивные тематические активности для погружения в самые актуальные тренды рынка.

Билеты и участие

Спонсорские пакеты доступны по ранним ценам, а также билеты со скидкой 10% по промокоду TOPMINING:

👉 https://blockchain.forum/ — принять участие в Blockchain Forum
👉 https://ai-future.com/ — принять участие в AI Future Forum
$content$,
    'mining',
    10,
    10,
    '2026-01-22',
    178,
    'hero',
    1,
    TRUE,
    TRUE,
    '/images/articles/hero-blockchain-forum.jpg',
    'Blockchain Forum 2026 April'
)
ON CONFLICT (slug) DO UPDATE SET
    title = EXCLUDED.title,
    title_subtitle = EXCLUDED.title_subtitle,
    excerpt = EXCLUDED.excerpt,
    content = EXCLUDED.content,
    topic_id = EXCLUDED.topic_id,
    reading_time_min = EXCLUDED.reading_time_min,
    reading_minutes = EXCLUDED.reading_minutes,
    published_at = EXCLUDED.published_at,
    display_type = EXCLUDED.display_type,
    sort_order = EXCLUDED.sort_order,
    uses_blocks = TRUE,
    image_url = EXCLUDED.image_url,
    image_alt = EXCLUDED.image_alt,
    is_published = TRUE;

INSERT INTO media_assets (path, alt, source)
VALUES (
    '/images/articles/hero-blockchain-forum.jpg',
    'Blockchain Forum 2026 April',
    'article_cover'
)
ON CONFLICT (path) DO UPDATE SET
    alt = EXCLUDED.alt;

UPDATE articles a
SET cover_media_id = m.id
FROM media_assets m
WHERE a.slug = 'blockchain-forum-2026-moscow'
  AND m.path = a.image_url;

DELETE FROM article_blocks
WHERE article_id = (SELECT id FROM articles WHERE slug = 'blockchain-forum-2026-moscow');

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 1, 'heading',
       '{"level":2,"text":"Введение"}'::jsonb,
       'vvedenie'
FROM articles a WHERE a.slug = 'blockchain-forum-2026-moscow';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 2, 'image',
       '{"src":"/images/articles/hero-blockchain-forum.jpg","alt":"Blockchain Forum 2026 April"}'::jsonb,
       NULL
FROM articles a WHERE a.slug = 'blockchain-forum-2026-moscow';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 3, 'paragraph',
       $p${"text":"14–15 апреля 2026 года состоится Blockchain Forum 2026 — крупнейшее событие, которое вновь объединит СНГ и мировой крипторынки. Это единственное мероприятие, которое соберёт в Москве ведущие международные компании индустрии, спикеров и инвесторов."}$p$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'blockchain-forum-2026-moscow';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 4, 'paragraph',
       $p${"text":"За организацией события стоит команда, подарившая индустрии форум Blockchain Life – легендарное мероприятие собирающее десятки тысяч человек в мировых крипто столицах с 2017 года."}$p$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'blockchain-forum-2026-moscow';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 5, 'paragraph',
       $p${"text":"В международном форуме традиционно участвуют основатели, топ-менеджеры и визионеры из Tether, Binance, Tron, Ripple, Bybit, Bitget, Promminer, A7A5, Animoca Brands, Circle, OKX, HTX, Kucoin, Telegram, Mastercard, ICP, Trust Wallet, Sandbox, Near, Litecoin, Bitmain, Marathon, Canaan, WhatsMiner, Bitfury, Consensys, Linea, DWF Labs, Wintermute, BNB chain и многие другие."}$p$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'blockchain-forum-2026-moscow';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 6, 'paragraph',
       $p${"text":"Для русскоязычного рынка это редкая возможность услышать мировых лидеров лично и наладить контакты без посредников."}$p$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'blockchain-forum-2026-moscow';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 7, 'heading',
       '{"level":2,"text":"Три сцены и беспрецедентный масштаб"}'::jsonb,
       'tri-sceny-i-bezprecedentnyj-masshtab'
FROM articles a WHERE a.slug = 'blockchain-forum-2026-moscow';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 8, 'paragraph',
       $p${"text":"16-й Blockchain Forum займёт отдельный павильон Крокус Экспо, предлагая 20,000 участников три полноценных сцены с параллельными потоками выступлений, панельных сессий и воркшопов."}$p$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'blockchain-forum-2026-moscow';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 9, 'paragraph',
       $p${"text":"Кроме того, все выступления зарубежных спикеров будут сопровождаться синхронным переводом на русский язык."}$p$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'blockchain-forum-2026-moscow';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 10, 'paragraph',
       $p${"text":"На территории форума будет работать масштабная выставочная зона, где более 250 компаний представят свои продукты, сервисы и технологические решения."}$p$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'blockchain-forum-2026-moscow';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 11, 'paragraph',
       $p${"text":"Посетители смогут не только познакомиться с уже известными брендами, но и стать первыми, кто увидит премьеры новых платформ, продуктов, токенов и инструментов, до их попадания в мейнстрим."}$p$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'blockchain-forum-2026-moscow';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 12, 'heading',
       '{"level":2,"text":"AI технологии и новые форматы"}'::jsonb,
       'ai-tehnologii-i-novye-formaty'
FROM articles a WHERE a.slug = 'blockchain-forum-2026-moscow';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 13, 'paragraph',
       $p${"text":"Впервые в рамках Blockchain Forum состоится AI Future (https://ai-future.com/ru/) — “форум внутри форума”, посвящённый пересечению искусственного интеллекта, блокчейна и цифровой экономики. Здесь встретятся представители индустрии, разработчики, исследователи и инвесторы, чтобы обсудить, как формируется синергия AI и блокчейн технологий."}$p$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'blockchain-forum-2026-moscow';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 14, 'paragraph',
       $p${"text":"Участников также ждут интерактивные зоны, хакатоны, конкурс стартапов, NFT-инсталляции, трейдинговый турнир и другие иммерсивные тематические активности для погружения в самые актуальные тренды рынка."}$p$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'blockchain-forum-2026-moscow';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 15, 'heading',
       '{"level":2,"text":"Билеты и участие"}'::jsonb,
       'bilety-i-uchastie'
FROM articles a WHERE a.slug = 'blockchain-forum-2026-moscow';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 16, 'paragraph',
       $p${"text":"Спонсорские пакеты доступны по ранним ценам, а также билеты со скидкой 10% по промокоду TOPMINING:"}$p$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'blockchain-forum-2026-moscow';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 17, 'paragraph',
       $p${"text":"👉 https://blockchain.forum/ — принять участие в Blockchain Forum"}$p$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'blockchain-forum-2026-moscow';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 18, 'paragraph',
       $p${"text":"👉 https://ai-future.com/ — принять участие в AI Future Forum"}$p$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'blockchain-forum-2026-moscow';
