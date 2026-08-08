SET client_encoding = 'UTF8';

-- =====================================================================
-- 037_blockchain_life_2025_dubai_article.sql
-- Форум Blockchain Life 2025 в Дубае (Akon AfterParty) — 1:1 с production.
-- Источник:
-- https://top-mining.ru/mining/forum-blockchain-life-2025-v-dubae-s-eksklyuzivnym-setom-na-oficzialnoj-afterparty-vystupit-legendarnyj-akon/
-- =====================================================================

INSERT INTO media_assets (path, alt, source)
VALUES
    (
        '/images/articles/blockchain-life-2025-dubai/banner.jpg',
        'Blockchain Life 2025 Dubai',
        'article_cover'
    ),
    (
        '/images/articles/blockchain-life-2025.jpg',
        'Blockchain Life 2025 Dubai',
        'article_cover'
    )
ON CONFLICT (path) DO UPDATE SET alt = EXCLUDED.alt;

INSERT INTO articles (
    slug, title, title_subtitle, excerpt, content, topic_id,
    reading_time_min, reading_minutes, published_at, view_count,
    display_type, sort_order, is_published, uses_blocks,
    image_url, image_alt
) VALUES (
    'forum-blockchain-life-2025-v-dubae-s-eksklyuzivnym-setom-na-oficzialnoj-afterparty-vystupit-legendarnyj-akon',
    'Форум Blockchain Life 2025 в Дубае',
    'С эксклюзивным сетом на официальной AfterParty выступит легендарный Akon',
    $excerpt$28–29 октября в Дубае состоится Blockchain Life 2025. На официальной AfterParty в Soho Garden DXB выступит Akon. Билеты со скидкой 10% по промокоду TOPMINING.$excerpt$,
    $content$28–29 октября в Дубае состоится долгожданное мировое криптособытие — Blockchain Life 2025. Прямо накануне буллрана, Форум объединит более 15 000 участников из 130+ стран, включая лидеров рынка, топ-менеджеров крупнейших компаний и главных медийных лиц индустрии.

Кульминацией события станет легендарная Afterparty, которая состоится в одном из лучших клубов мира - Soho Garden DXB. Гостей вечера ждёт премиальный нетворкинг с более чем 1300 VIP-участниками, включая спикеров форума, а также угощения, шоу-программа и бар — всё включено.

Главным событием вечера станет эксклюзивный сет мировой суперзвезды Akon, чьё выступление сделает юбилейный 15-й Blockchain Life по-настоящему незабываемым.

Напомним, что в числе подтвержденных участников форума уже заявлены: OKX, Bybit, KuCoin, HTX, Bitget, BingX, Ledger, Tron, Trust Wallet, MEXC,Bitmain, Canaan, A7A5, Uminers и многие другие.

Узнайте больше и покупайте билеты с 10% скидкой по промокоду TOPMINING.
$content$,
    'mining',
    2,
    2,
    '2025-09-30',
    179,
    'featured',
    5,
    TRUE,
    TRUE,
    '/images/articles/blockchain-life-2025-dubai/banner.jpg',
    'Blockchain Life 2025 Dubai'
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
    view_count = EXCLUDED.view_count,
    display_type = EXCLUDED.display_type,
    sort_order = EXCLUDED.sort_order,
    uses_blocks = TRUE,
    image_url = EXCLUDED.image_url,
    image_alt = EXCLUDED.image_alt,
    is_published = TRUE;

UPDATE articles a
SET cover_media_id = m.id
FROM media_assets m
WHERE a.slug = 'forum-blockchain-life-2025-v-dubae-s-eksklyuzivnym-setom-na-oficzialnoj-afterparty-vystupit-legendarnyj-akon'
  AND m.path = '/images/articles/blockchain-life-2025-dubai/banner.jpg';

-- Старый stub из 002 — скрываем, чтобы не дублировать карточку.
UPDATE articles
SET is_published = FALSE
WHERE slug = 'blockchain-life-2025-afterparty';

DELETE FROM article_blocks
WHERE article_id = (
    SELECT id FROM articles
    WHERE slug = 'forum-blockchain-life-2025-v-dubae-s-eksklyuzivnym-setom-na-oficzialnoj-afterparty-vystupit-legendarnyj-akon'
);

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 1, 'paragraph',
       $tmj${"text":"28–29 октября в Дубае состоится долгожданное мировое криптособытие — Blockchain Life 2025. Прямо накануне буллрана, Форум объединит более 15 000 участников из 130+ стран, включая лидеров рынка, топ-менеджеров крупнейших компаний и главных медийных лиц индустрии.","html":"28–29 октября в Дубае состоится долгожданное мировое криптособытие — <a href=\"https://blockchain-life.com/?utm_medium=referral&amp;utm_source=top-mining.ru&amp;utm_campaign=topmining#tickets-row\"><strong>Blockchain Life 2025</strong></a>. Прямо накануне буллрана, Форум объединит более 15 000 участников из 130+ стран, включая лидеров рынка, топ-менеджеров крупнейших компаний и главных медийных лиц индустрии."}$tmj$::jsonb,
       NULL
FROM articles a
WHERE a.slug = 'forum-blockchain-life-2025-v-dubae-s-eksklyuzivnym-setom-na-oficzialnoj-afterparty-vystupit-legendarnyj-akon';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 2, 'paragraph',
       $tmj${"text":"Кульминацией события станет легендарная Afterparty, которая состоится в одном из лучших клубов мира - Soho Garden DXB. Гостей вечера ждёт премиальный нетворкинг с более чем 1300 VIP-участниками, включая спикеров форума, а также угощения, шоу-программа и бар — всё включено.","html":"Кульминацией события станет <strong>легендарная Afterparty</strong>, которая состоится в одном из лучших клубов мира - <strong>Soho Garden DXB.</strong> Гостей вечера ждёт премиальный нетворкинг с более чем 1300 VIP-участниками, включая спикеров форума, а также угощения, шоу-программа и бар — всё включено."}$tmj$::jsonb,
       NULL
FROM articles a
WHERE a.slug = 'forum-blockchain-life-2025-v-dubae-s-eksklyuzivnym-setom-na-oficzialnoj-afterparty-vystupit-legendarnyj-akon';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 3, 'paragraph',
       $tmj${"text":"Главным событием вечера станет эксклюзивный сет мировой суперзвезды Akon, чьё выступление сделает юбилейный 15-й Blockchain Life по-настоящему незабываемым.","html":"Главным событием вечера станет <strong>эксклюзивный сет мировой суперзвезды Akon</strong>, чьё выступление сделает юбилейный 15-й Blockchain Life по-настоящему незабываемым."}$tmj$::jsonb,
       NULL
FROM articles a
WHERE a.slug = 'forum-blockchain-life-2025-v-dubae-s-eksklyuzivnym-setom-na-oficzialnoj-afterparty-vystupit-legendarnyj-akon';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 4, 'paragraph',
       $tmj${"text":"Напомним, что в числе подтвержденных участников форума уже заявлены: OKX, Bybit, KuCoin, HTX, Bitget, BingX, Ledger, Tron, Trust Wallet, MEXC,Bitmain, Canaan, A7A5, Uminers и многие другие.","html":"Напомним, что в числе подтвержденных участников форума уже заявлены: <strong>OKX, Bybit, KuCoin, HTX, Bitget, BingX, Ledger, Tron, Trust Wallet, MEXC,Bitmain, Canaan, A7A5, Uminers и многие другие</strong>."}$tmj$::jsonb,
       NULL
FROM articles a
WHERE a.slug = 'forum-blockchain-life-2025-v-dubae-s-eksklyuzivnym-setom-na-oficzialnoj-afterparty-vystupit-legendarnyj-akon';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 5, 'paragraph',
       $tmj${"text":"Узнайте больше и покупайте билеты с 10% скидкой по промокоду TOPMINING.","html":"Узнайте больше и <a href=\"https://blockchain-life.com/?utm_medium=referral&amp;utm_source=top-mining.ru&amp;utm_campaign=topmining#tickets-row\">покупайте билеты с 10% скидкой</a> по промокоду TOPMINING."}$tmj$::jsonb,
       NULL
FROM articles a
WHERE a.slug = 'forum-blockchain-life-2025-v-dubae-s-eksklyuzivnym-setom-na-oficzialnoj-afterparty-vystupit-legendarnyj-akon';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 6, 'image',
       $tmj${"src":"/images/articles/blockchain-life-2025-dubai/banner.jpg","alt":"Blockchain Life 2025 Dubai — баннер форума"}$tmj$::jsonb,
       NULL
FROM articles a
WHERE a.slug = 'forum-blockchain-life-2025-v-dubae-s-eksklyuzivnym-setom-na-oficzialnoj-afterparty-vystupit-legendarnyj-akon';
