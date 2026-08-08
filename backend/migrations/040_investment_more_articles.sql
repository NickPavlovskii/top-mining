SET client_encoding = 'UTF8';

-- =====================================================================
-- 040_investment_more_articles.sql
-- Инвестиции: выгодный момент покупки ASIC, заработок в РФ, стоит ли ферма.
-- =====================================================================

INSERT INTO media_assets (path, alt, source)
VALUES
    ('/images/articles/buy-asics-now/cover.jpg', 'Самый выгодный момент для покупки асиков', 'article_cover'),
    ('/images/articles/earn-mining-russia/cover.jpg', 'Можно ли зарабатывать на майнинге в России', 'article_cover'),
    ('/images/articles/earn-mining-russia/img-1.jpg', 'Можно ли заработать на майнинге', 'article'),
    ('/images/articles/earn-mining-russia/img-2.jpg', 'Майнинг и законность в России', 'article'),
    ('/images/articles/earn-mining-russia/img-3.jpg', 'Штрафы за майнинг', 'article'),
    ('/images/articles/earn-mining-russia/img-4.jpg', 'Перспективы майнинга в России', 'article'),
    ('/images/articles/buy-farm-worth/cover.jpg', 'Стоит ли покупать ферму и заниматься майнингом', 'article_cover'),
    ('/images/articles/buy-farm-worth/img-1.jpg', 'Оборудование для майнинга', 'article'),
    ('/images/articles/buy-farm-worth/img-2.jpg', 'Электричество и размещение фермы', 'article'),
    ('/images/articles/buy-farm-worth/img-3.jpg', 'Формат инвестирования в майнинг', 'article')
ON CONFLICT (path) DO UPDATE SET alt = EXCLUDED.alt;

-- https://top-mining.ru/investiczii/pochemu-sejchas-samyj-vygodnyj-moment-dlya-pokupki-asikov/

INSERT INTO articles (
    slug, title, title_subtitle, excerpt, content, topic_id,
    reading_time_min, reading_minutes, published_at, view_count,
    display_type, sort_order, is_published, uses_blocks,
    image_url, image_alt
) VALUES (
    'pochemu-sejchas-samyj-vygodnyj-moment-dlya-pokupki-asikov',
    'Почему сейчас',
    'самый выгодный момент для покупки асиков?',
    $excerpt$Дешёвый доллар, НДС 20% до конца года и гибкие условия поставщиков: почему конец 2025 — окно для покупки ASIC и как им воспользоваться.$excerpt$,
    $content$Рынок криптовалют в 2025 году показывает нестандартную динамику: при высокой активности майнеров стоимость оборудования временно опустилась. Разбираем, почему сейчас выгодный момент для покупки асиков.$content$,
    'investments',
    8,
    8,
    '2025-12-01',
    275,
    'list',
    38,
    TRUE,
    TRUE,
    '/images/articles/buy-asics-now/cover.jpg',
    'Самый выгодный момент для покупки асиков'
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
WHERE a.slug = 'pochemu-sejchas-samyj-vygodnyj-moment-dlya-pokupki-asikov'
  AND m.path = '/images/articles/buy-asics-now/cover.jpg';

DELETE FROM article_blocks
WHERE article_id = (SELECT id FROM articles WHERE slug = 'pochemu-sejchas-samyj-vygodnyj-moment-dlya-pokupki-asikov');

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 1, 'heading',
       $tmj${"level":2,"text":"Введение"}$tmj$::jsonb,
       'intro'
FROM articles a WHERE a.slug = 'pochemu-sejchas-samyj-vygodnyj-moment-dlya-pokupki-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 2, 'paragraph',
       $tmj${"text":"Рынок криптовалют в 2025 году показывает нестандартную динамику: при высокой активности майнеров стоимость оборудования временно опустилась на минимальные уровни. Причина – сочетание макроэкономических факторов, регулирующих изменений и поведения производителей."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'pochemu-sejchas-samyj-vygodnyj-moment-dlya-pokupki-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 3, 'paragraph',
       $tmj${"text":"Это не просто удобный момент для покупки, а окно возможностей, которое может закрыться уже в начале следующего года."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'pochemu-sejchas-samyj-vygodnyj-moment-dlya-pokupki-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 4, 'paragraph',
       $tmj${"text":"Разбираем детально, почему текущий период является финальным шансом войти в майнинг по минимальной цене и как этим правильно воспользоваться."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'pochemu-sejchas-samyj-vygodnyj-moment-dlya-pokupki-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 5, 'heading',
       $tmj${"level":2,"text":"Историческая просадка доллара"}$tmj$::jsonb,
       'dollar'
FROM articles a WHERE a.slug = 'pochemu-sejchas-samyj-vygodnyj-moment-dlya-pokupki-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 6, 'paragraph',
       $tmj${"text":"Для майнинговой отрасли курс доллара – один из ключевых параметров. Все оборудование закупается по международным ценам, и любая просадка курса сразу отражается в конечной стоимости."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'pochemu-sejchas-samyj-vygodnyj-moment-dlya-pokupki-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 7, 'paragraph',
       $tmj${"text":"Что происходит сейчас:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'pochemu-sejchas-samyj-vygodnyj-moment-dlya-pokupki-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 8, 'list',
       $tmj${"ordered":false,"items":["Доллар находится на пониженных уровнях относительно последних месяцев.","Поставщики фиксируют цену в моменте, чтобы поддержать продажи.","Производители готовы предлагать дополнительные условия, пока рынок находится в фазе коррекции."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'pochemu-sejchas-samyj-vygodnyj-moment-dlya-pokupki-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 9, 'paragraph',
       $tmj${"text":"Что это дает покупателю:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'pochemu-sejchas-samyj-vygodnyj-moment-dlya-pokupki-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 10, 'list',
       $tmj${"ordered":false,"items":["снижение стоимости ASICов без дополнительных акций или скидок;","возможность закупать оборудование по уровню цен, который встречается крайне редко;","более быстрый срок окупаемости благодаря меньшим вложениям на старте."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'pochemu-sejchas-samyj-vygodnyj-moment-dlya-pokupki-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 11, 'paragraph',
       $tmj${"text":"Фактически, при текущем курсе оборудование стоит так же, как во время предыдущих рыночных минимумов – но при этом доходность майнинга сегодня выше."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'pochemu-sejchas-samyj-vygodnyj-moment-dlya-pokupki-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 12, 'heading',
       $tmj${"level":2,"text":"Повышение НДС до 22% с будущего года"}$tmj$::jsonb,
       'nds'
FROM articles a WHERE a.slug = 'pochemu-sejchas-samyj-vygodnyj-moment-dlya-pokupki-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 13, 'paragraph',
       $tmj${"text":"С 1 января ставка НДС увеличивается с 20% до 22%. Это изменение уже прописано, и откатить его назад никто не планирует."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'pochemu-sejchas-samyj-vygodnyj-moment-dlya-pokupki-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 14, 'paragraph',
       $tmj${"text":"Почему это важно:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'pochemu-sejchas-samyj-vygodnyj-moment-dlya-pokupki-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 15, 'list',
       $tmj${"ordered":true,"items":["оборудование автоматически подорожает на 2%;","любая крупная партия асиков станет заметно дороже;","дополнительные расходы придется учитывать всем, кто планирует обновление ферм в 2026 году."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'pochemu-sejchas-samyj-vygodnyj-moment-dlya-pokupki-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 16, 'paragraph',
       $tmj${"text":"Как повышение НДС отразится на цене:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'pochemu-sejchas-samyj-vygodnyj-moment-dlya-pokupki-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 17, 'list',
       $tmj${"ordered":false,"items":["Асик стоимостью 500 000 руб. вырастет минимум на 10 000 руб.;","закупка на 10 устройств увеличит бюджет сразу на 100 000 руб.;","крупные корпоративные закупки будут исчисляться уже миллионами дополнительных расходов."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'pochemu-sejchas-samyj-vygodnyj-moment-dlya-pokupki-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 18, 'paragraph',
       $tmj${"text":"Другими словами, если покупать оборудование после Нового года, вы гарантированно переплатите, даже если курс доллара останется на текущих уровнях."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'pochemu-sejchas-samyj-vygodnyj-moment-dlya-pokupki-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 19, 'heading',
       $tmj${"level":2,"text":"Уникальная ситуация, которая бывает раз в несколько лет"}$tmj$::jsonb,
       'unique'
FROM articles a WHERE a.slug = 'pochemu-sejchas-samyj-vygodnyj-moment-dlya-pokupki-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 20, 'paragraph',
       $tmj${"text":"Если посмотреть на рынок ретроспективно, можно увидеть закономерность: выгодный вход обычно формируется либо из-за падения доллара, либо из-за временной распродажи перед выходом новых моделей. Но сейчас рынок сформировал сразу двойной дисконт:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'pochemu-sejchas-samyj-vygodnyj-moment-dlya-pokupki-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 21, 'paragraph',
       $tmj${"text":"В моменте сочетаются:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'pochemu-sejchas-samyj-vygodnyj-moment-dlya-pokupki-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 22, 'list',
       $tmj${"ordered":false,"items":["просадка доллара,","действующий НДС 20%,","стабильная доходность майнинга,","готовность поставщиков зафиксировать цену."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'pochemu-sejchas-samyj-vygodnyj-moment-dlya-pokupki-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 23, 'paragraph',
       $tmj${"text":"Это редкая комбинация, которая делает стоимость входа минимальной."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'pochemu-sejchas-samyj-vygodnyj-moment-dlya-pokupki-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 24, 'paragraph',
       $tmj${"text":"Если выразить это аналогией – сейчас момент, когда дверь открыта максимально широко. Через несколько месяцев она захлопнется: курс восстановится, ставка НДС поднимется, спрос увеличится."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'pochemu-sejchas-samyj-vygodnyj-moment-dlya-pokupki-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 25, 'heading',
       $tmj${"level":2,"text":"Почему ожидание приведет к переплате?"}$tmj$::jsonb,
       'waiting'
FROM articles a WHERE a.slug = 'pochemu-sejchas-samyj-vygodnyj-moment-dlya-pokupki-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 26, 'paragraph',
       $tmj${"text":"Многие инвесторы придерживаются стратегии «посмотрим, что будет дальше». Эта тактика работает на фондовом рынке, но в майнинге она часто приводит к потерям."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'pochemu-sejchas-samyj-vygodnyj-moment-dlya-pokupki-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 27, 'paragraph',
       $tmj${"text":"Если ждать, произойдет следующее:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'pochemu-sejchas-samyj-vygodnyj-moment-dlya-pokupki-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 28, 'list',
       $tmj${"ordered":true,"items":["Повысится НДС. Цена увеличится автоматически.","Укрепится доллар. Производители пересмотрят прайс на весь модельный ряд.","Вырастет спрос. На рынке возникнет локальный дефицит оборудования.","Сроки поставок увеличатся. Фиксация цены станет сложнее."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'pochemu-sejchas-samyj-vygodnyj-moment-dlya-pokupki-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 29, 'paragraph',
       $tmj${"text":"И самое главное: чем позже вы покупаете, тем дольше идет окупаемость из-за более высокого входного порога."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'pochemu-sejchas-samyj-vygodnyj-moment-dlya-pokupki-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 30, 'heading',
       $tmj${"level":2,"text":"Кто выигрывает от покупки в текущий период?"}$tmj$::jsonb,
       'who-wins'
FROM articles a WHERE a.slug = 'pochemu-sejchas-samyj-vygodnyj-moment-dlya-pokupki-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 31, 'rich_list',
       $tmj${"ordered":true,"items":[{"title":"Новички в майнинге","text":"Самая низкая цена входа за последние периоды, минимальный риск переплат и быстрая окупаемость."},{"title":"Владельцы небольших ферм","text":"Отличный момент, чтобы обновить часть оборудования на более эффективные модели."},{"title":"Крупные инвесторы","text":"Разница в 2% по НДС превращается в экономию миллионами рублей при закупке крупных партий."},{"title":"Майнинг-отели и дата-центры","text":"Снижение стоимости парка асиков прямо влияет на себестоимость услуг и конкурентоспособность."}]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'pochemu-sejchas-samyj-vygodnyj-moment-dlya-pokupki-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 32, 'heading',
       $tmj${"level":2,"text":"Что делать сейчас?"}$tmj$::jsonb,
       'what-to-do'
FROM articles a WHERE a.slug = 'pochemu-sejchas-samyj-vygodnyj-moment-dlya-pokupki-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 33, 'paragraph',
       $tmj${"text":"Ниже – пошаговый план для тех, кто хочет войти выгодно"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'pochemu-sejchas-samyj-vygodnyj-moment-dlya-pokupki-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 34, 'list',
       $tmj${"ordered":true,"items":["Определить бюджет.","Выбрать модели асиков под ваш тариф на электричество.","Зафиксировать стоимость оборудования до повышения НДС.","Зарезервировать поставку и оформить предзаказ.","Получить консультацию по окупаемости под ваш регион и тариф."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'pochemu-sejchas-samyj-vygodnyj-moment-dlya-pokupki-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 35, 'paragraph',
       $tmj${"text":"Мы поможем подобрать оборудование и предложим наиболее выгодные условия при покупке в текущий период, пока окно возможностей остаётся открытым."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'pochemu-sejchas-samyj-vygodnyj-moment-dlya-pokupki-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 36, 'heading',
       $tmj${"level":2,"text":"Выводы"}$tmj$::jsonb,
       'conclusion'
FROM articles a WHERE a.slug = 'pochemu-sejchas-samyj-vygodnyj-moment-dlya-pokupki-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 37, 'paragraph',
       $tmj${"text":"Дешевый доллар + действующий НДС 20% + гибкие условия от поставщиков – это уникальное сочетание факторов, которое делает конец года идеальным моментом для покупки оборудования."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'pochemu-sejchas-samyj-vygodnyj-moment-dlya-pokupki-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 38, 'paragraph',
       $tmj${"text":"Когда курс восстановится и ставка НДС поднимется до 22%, стоимость входа увеличится, а такие условия уже не повторятся."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'pochemu-sejchas-samyj-vygodnyj-moment-dlya-pokupki-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 39, 'paragraph',
       $tmj${"text":"Если вы хотите купить оборудование максимально выгодно – пишите нашим менеджерам. Мы подберем оптимальные модели, зафиксируем цену внизу рынка и обеспечим лучшие условия поставки."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'pochemu-sejchas-samyj-vygodnyj-moment-dlya-pokupki-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 40, 'paragraph',
       $tmj${"text":"Оставьте заявку, чтобы зафиксировать ваши персональные условия покупки асиков до конца года."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'pochemu-sejchas-samyj-vygodnyj-moment-dlya-pokupki-asikov';

-- https://top-mining.ru/investiczii/mozhno-li-zarabatyvat-na-majninge-v-rossii/

INSERT INTO articles (
    slug, title, title_subtitle, excerpt, content, topic_id,
    reading_time_min, reading_minutes, published_at, view_count,
    display_type, sort_order, is_published, uses_blocks,
    image_url, image_alt
) VALUES (
    'mozhno-li-zarabatyvat-na-majninge-v-rossii',
    'Можно ли зарабатывать на майнинге',
    'В России',
    $excerpt$Экономика майнинга в 2024–2025, законность добычи в РФ, налоги, штрафы, электроэнергия и перспективы регулирования.$excerpt$,
    $content$Можно ли зарабатывать на майнинге в России? Разбираем рентабельность, законность, налоги, электроэнергию и перспективы отрасли.$content$,
    'investments',
    12,
    12,
    '2024-04-18',
    375,
    'list',
    39,
    TRUE,
    TRUE,
    '/images/articles/earn-mining-russia/cover.jpg',
    'Можно ли зарабатывать на майнинге в России'
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
WHERE a.slug = 'mozhno-li-zarabatyvat-na-majninge-v-rossii'
  AND m.path = '/images/articles/earn-mining-russia/cover.jpg';

DELETE FROM article_blocks
WHERE article_id = (SELECT id FROM articles WHERE slug = 'mozhno-li-zarabatyvat-na-majninge-v-rossii');

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 1, 'heading',
       $tmj${"level":2,"text":"Введение"}$tmj$::jsonb,
       'intro'
FROM articles a WHERE a.slug = 'mozhno-li-zarabatyvat-na-majninge-v-rossii';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 2, 'paragraph',
       $tmj${"text":"Очень часто потенциальные новички мира цифровых активов задают важный вопрос – можно ли зарабатывать на майнинге в России? Сегодня это полноценный бизнес, который существует далеко не первый год, поэтому такой интерес оправдан. В этой статье мы постараемся дать развернутый ответ, рассмотрев задачу сразу с двух сторон – можно ли зарабатывать на майнинге сегодня или время выгодной добычи уже в прошлом, а также насколько законен данный вид извлечения прибыли в России."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'mozhno-li-zarabatyvat-na-majninge-v-rossii';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 3, 'heading',
       $tmj${"level":2,"text":"Можно ли заработать на майнинге в 2024-2025 году: простой расчет"}$tmj$::jsonb,
       'profit'
FROM articles a WHERE a.slug = 'mozhno-li-zarabatyvat-na-majninge-v-rossii';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 4, 'paragraph',
       $tmj${"text":"Первое, что мы постараемся выяснить – экономическая целесообразность инвестиций в процесс добычи цифровых активов. Ведь без четкого понимания рентабельности бизнеса нет никакого смысла развивать тему дальше, включая анализ законности майнинга."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'mozhno-li-zarabatyvat-na-majninge-v-rossii';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 5, 'paragraph',
       $tmj${"text":"Впрочем, не будем ходить вокруг да около. Ответ на вопрос, можно ли зарабатывать на майнинге сегодня, очевиден: можно."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'mozhno-li-zarabatyvat-na-majninge-v-rossii';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 6, 'paragraph',
       $tmj${"text":"Доказательством является язык цифр: открыв любой калькулятор майнинга и проанализировав актуальные модели оборудования для добычи BTC (а также альтов), вы убедитесь в том, что майнинг выгоден и прибылен. Конечно, существуют устаревшие модели, которые работают на грани рентабельности или вовсе майнят «в минус». Но рассматривать их также нецелесообразно, как оценивать покупку, например, устаревшего мобильного телефона на древней операционной системе Symbian OS или Windows Mobile сегодня. Все это в прошлом и уже не актуально."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'mozhno-li-zarabatyvat-na-majninge-v-rossii';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 7, 'paragraph',
       $tmj${"text":"Сегодня майнеры успешно добывают BTC на актуальных асиках: 19-я серия Antminer, Whatsminer m30s и m50. ТОПовой считается линейка Antminer s21 и Antminer s21 Hyd."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'mozhno-li-zarabatyvat-na-majninge-v-rossii';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 8, 'paragraph',
       $tmj${"text":"Для вычисления алькоинов тоже успешно функционируют разнообразные модели, например, iPollo V1, Jasminer x16 и Antminer E9 Pro. Доходность зависит от стоимости электричества и курса монеты, но одно можно сказать точно – все эти «шахтеры» более чем рентабельны и прибыльны."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'mozhno-li-zarabatyvat-na-majninge-v-rossii';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 9, 'image',
       $tmj${"src":"/images/articles/earn-mining-russia/img-1.jpg","alt":"Можно ли заработать на майнинге"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'mozhno-li-zarabatyvat-na-majninge-v-rossii';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 10, 'heading',
       $tmj${"level":2,"text":"Почему еще выгоден майнинг: косвенные факторы"}$tmj$::jsonb,
       'indirect'
FROM articles a WHERE a.slug = 'mozhno-li-zarabatyvat-na-majninge-v-rossii';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 11, 'paragraph',
       $tmj${"text":"Если же вы не доверяете языку цифр, можно привести ряд косвенных аргументов, почему можно зарабатывать на майнинге в 2024 году:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'mozhno-li-zarabatyvat-na-majninge-v-rossii';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 12, 'list',
       $tmj${"ordered":false,"items":["Растущий хешрейт сети. Сложность добычи увеличивается из-за того, что на рынке появляются новые производственные мощности: частные майнеры и целые корпорации наращивают суммарный хэшрейт за счет покупки новых и современных асиков. Можно ли заработать на майнинге? Если бы ответ был отрицательным, мы бы не наблюдали таких рекордных темпов роста сложности майнинга;","Производители оборудования продолжают технологичную битву: буквально каждые полгода появляются анонсы о выходе новых асиков, мощность которых поражает воображение. Если несколько лет тому назад топовым считался майнер Whatsminer m30s на 112 ТХ в старшей модификации, то сегодня мир равняется на Antminer s21 Hyd, который выдает все 335 ТХ. И это далеко не предел;","Если раньше майнеры добывали криптовалюту в «сером» формате, то сегодня появляются полноценные форматы готового бизнеса. Инвестор может купить не один, не два асика, а целый контейнер с несколькими десятками или даже сотнями устройств. Также существует популярный вариант «под ключ», когда вместе с техникой предоставляется инфраструктура и полное сопровождение деятельности – именно так майнинг обретает промышленные масштабы в России, становясь все более популярным видом деятельности."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'mozhno-li-zarabatyvat-na-majninge-v-rossii';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 13, 'heading',
       $tmj${"level":2,"text":"В итоге: можно ли заработать на майнинге?"}$tmj$::jsonb,
       'profit-result'
FROM articles a WHERE a.slug = 'mozhno-li-zarabatyvat-na-majninge-v-rossii';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 14, 'paragraph',
       $tmj${"text":"Скептики скажут, что порог входа в добычу цифрового золота стал выше, причиной чего является растущая сложность."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'mozhno-li-zarabatyvat-na-majninge-v-rossii';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 15, 'paragraph',
       $tmj${"text":"Но это ложное утверждение, так как стоимость оборудования напрямую зависит от курса BTC, а рынок криптовалют цикличен."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'mozhno-li-zarabatyvat-na-majninge-v-rossii';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 16, 'paragraph',
       $tmj${"text":"Для примера, в 2021 году можно было купить новый асик Avalon 1126 PRO на 68 ТХ за 430 000 рублей с окупаемостью 1 год (при курсе Биткоина в то время). В начале 2024 года примерно за те же 450 000 рублей можно стать обладателем Antminer S21 на 200 ТХ с аналогичным сроком возврата инвестиций – 12 месяцев."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'mozhno-li-zarabatyvat-na-majninge-v-rossii';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 17, 'paragraph',
       $tmj${"text":"Сложность практически не влияет на рентабельность майнинга, так как существует более важный атрибут – срок покупки техники и момент продажи накопленного актива."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'mozhno-li-zarabatyvat-na-majninge-v-rossii';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 18, 'paragraph',
       $tmj${"text":"Грамотно работая с этими временными рамками, вы сможете уверенно зарабатывать с помощью майнинга. И сложность добычи не окажет прямого воздействия."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'mozhno-li-zarabatyvat-na-majninge-v-rossii';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 19, 'heading',
       $tmj${"level":2,"text":"Майнинг и законность: можно ли добывать Биткоин в России?"}$tmj$::jsonb,
       'legal'
FROM articles a WHERE a.slug = 'mozhno-li-zarabatyvat-na-majninge-v-rossii';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 20, 'paragraph',
       $tmj${"text":"Если аргументы, представленные выше, оказались убедительными, можно приступить к анализу второй части статьи – законность добычи цифровых активов в России."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'mozhno-li-zarabatyvat-na-majninge-v-rossii';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 21, 'paragraph',
       $tmj${"text":"И вновь сразу даем прямой ответ на вопрос, можно ли майнить в России. Можно."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'mozhno-li-zarabatyvat-na-majninge-v-rossii';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 22, 'paragraph',
       $tmj${"text":"В законодательстве страны нет запрета на осуществление данного вида деятельности, главное – добывать BTC строго в правовом русле. Для этого важно учитывать следующие моменты:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'mozhno-li-zarabatyvat-na-majninge-v-rossii';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 23, 'list',
       $tmj${"ordered":false,"items":["Майнинг – это процесс, связанный с извлечением прибыли. А данный тип заработка аналогичен предпринимательской деятельности. Следовательно, первое, что необходимо сделать – это юридически оформить свое право на такой бизнес. Вариантов несколько – самозанятость или ИП. Первый статус более удобен, так как он предполагает сниженную налоговую ставку, упрощенную процедуру регистрации и автоматизированный механизм уплаты налога;","Налоги. Да, придется отдавать часть выручки государству, как и в любом другом виде предпринимательской деятельности. Если вы хотите добывать крипту законно, налогового бремени не избежать. Для формата самозанятости это 4-6%. Для статуса ИП – от 6% при упрощенной системе налогообложения;","Лимиты. Не стоит забывать и об ограничениях, например, доходы самозанятого не могут превышать 2 400 000 рублей в год. В противном случае придется открывать ИП, либо привлекать к деятельности еще одного самозанятого."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'mozhno-li-zarabatyvat-na-majninge-v-rossii';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 24, 'paragraph',
       $tmj${"text":"К слову, все больше российских майнеров предпочитают добывать крипту официально, уплачивая налоги в профильном юридическом статусе."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'mozhno-li-zarabatyvat-na-majninge-v-rossii';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 25, 'paragraph',
       $tmj${"text":"Если же речь идет о добыче в промышленных масштабах целыми компаниями, здесь официального формата работы точно не избежать."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'mozhno-li-zarabatyvat-na-majninge-v-rossii';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 26, 'paragraph',
       $tmj${"text":"Такие организации регистрируют профильные ООО, ведут бухгалтерию и платят полный налог. Кстати, еще один аргумент в пользу выгодности майнинга в России: если бы добыча была нерентабельной, таких компаний в нашей стране не существовало."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'mozhno-li-zarabatyvat-na-majninge-v-rossii';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 27, 'image',
       $tmj${"src":"/images/articles/earn-mining-russia/img-2.jpg","alt":"Майнинг и законность в России"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'mozhno-li-zarabatyvat-na-majninge-v-rossii';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 28, 'heading',
       $tmj${"level":2,"text":"Штрафы за майнинг"}$tmj$::jsonb,
       'fines'
FROM articles a WHERE a.slug = 'mozhno-li-zarabatyvat-na-majninge-v-rossii';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 29, 'paragraph',
       $tmj${"text":"Ошибочно считать, что раз нет закона, регулирующего майнинг как отдельный вид деятельности, то и штрафы также отсутствуют. Попасть под ответственность вполне реально:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'mozhno-li-zarabatyvat-na-majninge-v-rossii';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 30, 'list',
       $tmj${"ordered":false,"items":["Незаконное предпринимательство (статья 171 УК РФ). Причина: майнинг без ИП или статуса самозанятого. Наказание: штраф (до 300 000 рублей), обязательные работы (до 480 часов), лишение свободы (до 6 месяцев);","Уклонение от уплаты налогов (статья 198 УК РФ). Причина: майнинг без уплаты налогов. Наказание: штраф (до 100 000 - 300 000 рублей), принудительные работы (до 1 года), лишение свободы (до 1 года);","Непредставление в срок налоговой декларации (статья 119 НК РФ). Наказание: штраф — 5% от суммы (не более 30% от размера налога и не менее 1 000 рублей);","Неуплата или неполная уплата налога (статья 122 НК РФ). Наказание: штраф — 20% от суммы долга;","Пеня (статья 75 НК РФ). Наказание: 1/300 ставки рефинансирования за каждый день просрочки."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'mozhno-li-zarabatyvat-na-majninge-v-rossii';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 31, 'paragraph',
       $tmj${"text":"Наказания вполне реальны и число случаев выявленных правонарушений растет с каждым годом. Безусловно, данный тренд получит развитие, так как власти стремятся прийти к полному регулированию и контролю этой деятельности."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'mozhno-li-zarabatyvat-na-majninge-v-rossii';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 32, 'image',
       $tmj${"src":"/images/articles/earn-mining-russia/img-3.jpg","alt":"Штрафы за майнинг"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'mozhno-li-zarabatyvat-na-majninge-v-rossii';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 33, 'heading',
       $tmj${"level":2,"text":"Майнинг и электроэнергия"}$tmj$::jsonb,
       'electricity'
FROM articles a WHERE a.slug = 'mozhno-li-zarabatyvat-na-majninge-v-rossii';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 34, 'paragraph',
       $tmj${"text":"Еще один камень преткновения в вопросах законного майнинга – это электроэнергетика. Ведь практически все штрафы, облавы на майнеров и громкие конфискации техники в России связанны именно с вопросом ненадлежащего использования энергетических ресурсов."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'mozhno-li-zarabatyvat-na-majninge-v-rossii';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 35, 'paragraph',
       $tmj${"text":"«Серые» фермы нарушают работу энергосистемы целых населенных пунктов, становясь причиной дефицита тока, что особенно актуально для Сибири."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'mozhno-li-zarabatyvat-na-majninge-v-rossii';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 36, 'paragraph',
       $tmj${"text":"Именно поэтому для законной работы придется не только оформлять ИП или самозанятость, уплачивая налоги, но и следовать энергетическому законодательству:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'mozhno-li-zarabatyvat-na-majninge-v-rossii';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 37, 'list',
       $tmj${"ordered":false,"items":["Не превышать объемы, выделенные для объектов определенного типа. Например, для квартир и ИЖС – это 15КВт, а для помещений промышленного назначения – в зависимости от типа здания;","Использовать соответствующий энергетический тариф. Если вы добываете криптовалюту, значит осуществляется предпринимательская деятельность. Следовательно, работа должна вестись по коммерческому тарифу, который значительно выше социального."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'mozhno-li-zarabatyvat-na-majninge-v-rossii';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 38, 'paragraph',
       $tmj${"text":"Также не лишним будет напомнить о необходимости своевременной оплаты счетов за электричество. Это не только позволит работать в правовом поле, но и избавит от повышенного внимания со стороны энергетиков."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'mozhno-li-zarabatyvat-na-majninge-v-rossii';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 39, 'heading',
       $tmj${"level":2,"text":"Известные случаи наказания за незаконный майнинг в России"}$tmj$::jsonb,
       'cases'
FROM articles a WHERE a.slug = 'mozhno-li-zarabatyvat-na-majninge-v-rossii';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 40, 'paragraph',
       $tmj${"text":"Закона о майнинге пока нет, но уже известны случаи наказаний за нелегальную добычу Биткоина. Правда, практически все примеры имеют отношение именно к нецелевому использованию электроэнергии и незаконному подключению к сетям. Вот несколько примеров:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'mozhno-li-zarabatyvat-na-majninge-v-rossii';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 41, 'list',
       $tmj${"ordered":false,"items":["В 2022 году пресечена деятельность более 10 ферм: майнеры были подключены к объектам жилого фонда, а электричество оплачивали по тарифам для населения. Владельцам оборудования пришлось возместить разницу коммерческого и социального тарифа;","В 2023 году в Красноярске, Омске и в Хакасии был выявлен ущерб в размере 60 млн. рублей – именно такой объем электричества украли 17 найденных ферм;","Известен случай частного майнера, ферма которого расходовала 75% от совокупного объема, потребляемого целой деревней на 11 000 домов. Это около 500 000 КВт в месяц."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'mozhno-li-zarabatyvat-na-majninge-v-rossii';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 42, 'paragraph',
       $tmj${"text":"Нарушителя незамедлительно перевели на коммерческий тариф, заставили выплатить разницу и штраф на сумму 29 000 000 рублей."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'mozhno-li-zarabatyvat-na-majninge-v-rossii';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 43, 'paragraph',
       $tmj${"text":"Вычислить нелегальные асики, а тем более полноценные фермы не сложно. Электроэнергетики обладают подробной статистикой потребления и пониманием среднестатистических объемов потребления. Именно поэтому вопрос регуляции сферы и выявления всех незаконных ферм – это лишь вопрос времени."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'mozhno-li-zarabatyvat-na-majninge-v-rossii';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 44, 'heading',
       $tmj${"level":2,"text":"Перспективы майнинга в России"}$tmj$::jsonb,
       'outlook'
FROM articles a WHERE a.slug = 'mozhno-li-zarabatyvat-na-majninge-v-rossii';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 45, 'paragraph',
       $tmj${"text":"Уже не первый год власти страны говорят о желании приступить к регуляции майнинга или вовсе запретить этот вид деятельности, однако, кардинальным образом ситуация не меняется. Существуют следующие варианты развития событий:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'mozhno-li-zarabatyvat-na-majninge-v-rossii';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 46, 'list',
       $tmj${"ordered":false,"items":["Дополнительный налог на майнинг. Помимо налога на осуществление предпринимательской деятельности придется производить специализированные отчисления именно за добычу цифровых активов. Вероятность – высокая;","Специальный тариф за электричество для майнинга. Вероятность – средняя;","Разрешение на майнинг в регионах с избыточным объемом генерируемой электроэнергии. О такой инициативе уже неоднократно заявляли власти, но на практике введение данного закона выглядит затруднительным. Вероятность – средняя;","Полный запрет майнинга в России, о чем также неоднократно заявлялось властями различного уровня. Тем не менее, есть и альтернативное мнение: легальная добыча является возможностью получении дополнительных налогов в бюджет, следовательно, запрет выглядит экономически нецелесообразным. Вероятность – низкая."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'mozhno-li-zarabatyvat-na-majninge-v-rossii';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 47, 'image',
       $tmj${"src":"/images/articles/earn-mining-russia/img-4.jpg","alt":"Перспективы майнинга в России"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'mozhno-li-zarabatyvat-na-majninge-v-rossii';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 48, 'paragraph',
       $tmj${"text":"Таким образом, добывать крипту в России сегодня можно, причем, на легальных и законных основаниях. Главное помнить о законодательстве, не нарушать нормы права и вовремя оплачивать электричество. В этом случае майнинг станет эффективным способом заработка с мощным экономическим обоснованием на долгие годы вперед!"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'mozhno-li-zarabatyvat-na-majninge-v-rossii';

-- https://top-mining.ru/investiczii/stoit-li-pokupat-fermu-i-zanimatsya-majningom/

INSERT INTO articles (
    slug, title, title_subtitle, excerpt, content, topic_id,
    reading_time_min, reading_minutes, published_at, view_count,
    display_type, sort_order, is_published, uses_blocks,
    image_url, image_alt
) VALUES (
    'stoit-li-pokupat-fermu-i-zanimatsya-majningom',
    'Стоит ли покупать ферму',
    'И заниматься майнингом',
    $excerpt$Пять факторов решения: оборудование, электричество, размещение, формат инвестиций и цели — стоит ли покупать ферму и заниматься майнингом.$excerpt$,
    $content$Стоит ли покупать майнинг-оборудование и входить в добычу криптовалюты сегодня? Разбираем пять ключевых факторов рентабельности.$content$,
    'investments',
    7,
    7,
    '2024-04-23',
    364,
    'list',
    40,
    TRUE,
    TRUE,
    '/images/articles/buy-farm-worth/cover.jpg',
    'Стоит ли покупать ферму и заниматься майнингом'
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
WHERE a.slug = 'stoit-li-pokupat-fermu-i-zanimatsya-majningom'
  AND m.path = '/images/articles/buy-farm-worth/cover.jpg';

DELETE FROM article_blocks
WHERE article_id = (SELECT id FROM articles WHERE slug = 'stoit-li-pokupat-fermu-i-zanimatsya-majningom');

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 1, 'heading',
       $tmj${"level":2,"text":"Введение"}$tmj$::jsonb,
       'intro'
FROM articles a WHERE a.slug = 'stoit-li-pokupat-fermu-i-zanimatsya-majningom';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 2, 'paragraph',
       $tmj${"text":"Стоит ли покупать майнинг оборудование? Насколько оправдан вход в рынок добычи криптовалюты сегодня? Выгодно ли инвестировать в майнинг? Несмотря на состояние рынка, бычий или медвежий цикл и стоимость BTC, все эти вопросы остаются актуальными. Важно понимать, что универсального ответа, подходящего всем и каждому, не существует. Наиболее правильный вариант – проанализировать факторы, влияющие на эффективность майнинга, благодаря чему будущий майнер сможет осознать степень их влияния на собственные условия и возможности."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'stoit-li-pokupat-fermu-i-zanimatsya-majningom';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 3, 'heading',
       $tmj${"level":2,"text":"Стоит ли заниматься майнингом: 5 факторов"}$tmj$::jsonb,
       'five-factors'
FROM articles a WHERE a.slug = 'stoit-li-pokupat-fermu-i-zanimatsya-majningom';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 4, 'paragraph',
       $tmj${"text":"Чтобы ответить на вопрос, стоит ли покупать майнинг ферму, важно проанализировать 5 ключевых факторов:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'stoit-li-pokupat-fermu-i-zanimatsya-majningom';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 5, 'list',
       $tmj${"ordered":false,"items":["Оборудование, которое планируется использовать;","Стоимость электричества;","Условия размещения оборудования;","Формат инвестирования;","Цели и задачи."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'stoit-li-pokupat-fermu-i-zanimatsya-majningom';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 6, 'paragraph',
       $tmj${"text":"Зная ответы на эти вопросы, можно определить рентабельность добычи криптовалюты. А чтобы каждый смог сделать это, постараемся максимально подробно изучить данные факторы по отдельности."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'stoit-li-pokupat-fermu-i-zanimatsya-majningom';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 7, 'heading',
       $tmj${"level":2,"text":"Фактор №1: Оборудование"}$tmj$::jsonb,
       'equipment'
FROM articles a WHERE a.slug = 'stoit-li-pokupat-fermu-i-zanimatsya-majningom';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 8, 'paragraph',
       $tmj${"text":"Важно определить формат добычи: видеокарты или асики. После перехода Эфириума на PoS осенью 2022 года сфера добычи крипты на картах все еще находится в продолжительной неопределенности. С одной стороны, существуют десятки других монет, которые можно добывать на GPU. Но с другой – прежнюю доходность и надежность инвестиций, которую обеспечивал ETH, достичь все еще не удалось."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'stoit-li-pokupat-fermu-i-zanimatsya-majningom';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 9, 'paragraph',
       $tmj${"text":"Прощание с добычей Эфира на картах позволило скорректироваться ценам на оборудование, чему больше остальных обрадовались геймеры и дизайнеры."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'stoit-li-pokupat-fermu-i-zanimatsya-majningom';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 10, 'paragraph',
       $tmj${"text":"На видеокартах по-прежнему активно добывают криптовалюты, но появились дополнительные трудности в виде поиска оптимального токена, низкой надежности и ликвидности активов. В свою очередь, ситуация с асиками остается неизменной: лидерами продаж все еще являются майнеры на SHA-256 для добычи Биткоина. Мощность техники растет, что позволяет компенсировать увеличение сложности добычи, а также уменьшить влияние халвинга 2024 года."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'stoit-li-pokupat-fermu-i-zanimatsya-majningom';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 11, 'paragraph',
       $tmj${"text":"Отвечая на вопрос, стоит ли покупать ферму и заниматься майнингом, следует понимать, какое именно оборудование планируется использовать."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'stoit-li-pokupat-fermu-i-zanimatsya-majningom';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 12, 'paragraph',
       $tmj${"text":"Это влияет не только на создание оптимальных условий для добычи, но и понимание монеты, которую планируется «копать». Оцените также возможность продажи техники на вторичном рынке и потерю стоимости техники, бывшей в употреблении."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'stoit-li-pokupat-fermu-i-zanimatsya-majningom';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 13, 'image',
       $tmj${"src":"/images/articles/buy-farm-worth/img-1.jpg","alt":"Оборудование для майнинга"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'stoit-li-pokupat-fermu-i-zanimatsya-majningom';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 14, 'heading',
       $tmj${"level":2,"text":"Фактор №2: Электричество"}$tmj$::jsonb,
       'electricity'
FROM articles a WHERE a.slug = 'stoit-li-pokupat-fermu-i-zanimatsya-majningom';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 15, 'paragraph',
       $tmj${"text":"Второй в списке, но, вероятно, первый по значимости фактор – стоимость электричества. Выгодно ли «копать» BTC, если вы платите 3 рубля за КВт? Ответ будет однозначно утвердительным. Если же в вашем регионе тариф равен 7 рублям за КВт, есть серьезные основания задуматься над рентабельностью майнинга."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'stoit-li-pokupat-fermu-i-zanimatsya-majningom';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 16, 'paragraph',
       $tmj${"text":"Ответить на вопрос поможет современный калькулятор майнинга, который исходя из стоимости киловатта энергии и мощности оборудования позволяет рассчитать доходы."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'stoit-li-pokupat-fermu-i-zanimatsya-majningom';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 17, 'paragraph',
       $tmj${"text":"При дешевом электричестве практически любой асик будет приносить прибыль. Если же на месте добычи нет данного преимущества, следует произвести внимательные расчеты, так как основной статьей ваших расходов станет именно оплата счетов за электроэнергию."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'stoit-li-pokupat-fermu-i-zanimatsya-majningom';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 18, 'paragraph',
       $tmj${"text":"Существует знакомое многим понятие – «нулевая» розетка. То есть, доступ к бесплатным ресурсам."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'stoit-li-pokupat-fermu-i-zanimatsya-majningom';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 19, 'paragraph',
       $tmj${"text":"Но важно понимать, что это условный показатель, так как за коммунальные платежи всегда кто-то платит. Если майнер готов похвастаться бесплатной розеткой, имеют место мошеннические схемы и сомнительные форматы добычи. Стоит ли покупать ферму в данном случае? Однозначно нет, так как это прямое нарушение закона и вероятность уголовной ответственности."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'stoit-li-pokupat-fermu-i-zanimatsya-majningom';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 20, 'image',
       $tmj${"src":"/images/articles/buy-farm-worth/img-2.jpg","alt":"Электричество и размещение фермы"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'stoit-li-pokupat-fermu-i-zanimatsya-majningom';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 21, 'heading',
       $tmj${"level":2,"text":"Фактор №3: Условия расположения фермы"}$tmj$::jsonb,
       'location'
FROM articles a WHERE a.slug = 'stoit-li-pokupat-fermu-i-zanimatsya-majningom';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 22, 'paragraph',
       $tmj${"text":"Можно ли заниматься майнингом, если вы не имеете технической возможности для расположения мощностей? В случае покупки асиков ответ отрицательный, так как высокий уровень шума, выделяемое тепло и серьезное потребление тока сделает удобную работу невозможной. Рекомендуем остановиться на видокартах, которые менее требовательны к условиям эксплуатации."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'stoit-li-pokupat-fermu-i-zanimatsya-majningom';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 23, 'paragraph',
       $tmj${"text":"Отдельно следует отметить возможность майнинга на специализированных площадках – хостингах или отелях."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'stoit-li-pokupat-fermu-i-zanimatsya-majningom';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 24, 'paragraph',
       $tmj${"text":"Подобный формат сопряжен с дополнительными расходами, однако, технические трудности окажутся не актуальными. Это лучший способ, если вы являетесь владельцем крупной фермы, состоящей из нескольких десятков или даже сотен асиков."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'stoit-li-pokupat-fermu-i-zanimatsya-majningom';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 25, 'heading',
       $tmj${"level":2,"text":"Фактор №4: Формат инвестирования"}$tmj$::jsonb,
       'invest-format'
FROM articles a WHERE a.slug = 'stoit-li-pokupat-fermu-i-zanimatsya-majningom';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 26, 'paragraph',
       $tmj${"text":"Майнинг, как и любой формат заработка, всегда сопряжен с рисками, поэтому ответ на вопрос, стоит ли покупать ферму и заниматься майнингом, зависит от способа приобретения техники. Здесь существует несколько вариантов:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'stoit-li-pokupat-fermu-i-zanimatsya-majningom';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 27, 'list',
       $tmj${"ordered":false,"items":["Реинвестирование средств, зарабатываемых с помощью криптовалюты. Например, у вас уже есть несколько асиков и вы планируете расширение (обновление) парка. Это оптимальный формат работы, применяемый многими майнерами;","Покупка аппаратуры на свободные денежные средства. Тоже рабочий формат, позволяющий свести риски к минимуму;","Приобретение майнеров на «последние» деньги или покупка техники в кредит. Метод, который не рекомендован для реализации. Курс добываемой монеты может снизиться, асик сломаться, его могут украсть, не говоря уже об инфраструктурных рисках и сюрпризах законодательства."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'stoit-li-pokupat-fermu-i-zanimatsya-majningom';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 28, 'paragraph',
       $tmj${"text":"Диверсификация рисков – ключевой критерий успешной работы в любом бизнесе, и майнинг криптовалют нельзя считать исключением."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'stoit-li-pokupat-fermu-i-zanimatsya-majningom';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 29, 'image',
       $tmj${"src":"/images/articles/buy-farm-worth/img-3.jpg","alt":"Формат инвестирования в майнинг"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'stoit-li-pokupat-fermu-i-zanimatsya-majningom';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 30, 'heading',
       $tmj${"level":2,"text":"Фактор №5: Цели и задачи"}$tmj$::jsonb,
       'goals'
FROM articles a WHERE a.slug = 'stoit-li-pokupat-fermu-i-zanimatsya-majningom';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 31, 'paragraph',
       $tmj${"text":"Финальный вопрос, который следует задать себе – для чего я планируют добывать криптовалюту? Вариантов ответов может быть несколько, и решение, стоит ли покупать ферму и заниматься майнингом, индивидуально:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'stoit-li-pokupat-fermu-i-zanimatsya-majningom';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 32, 'list',
       $tmj${"ordered":false,"items":["Первое знакомство с майнингом. Практический способ понять, следует ли вообще этим заниматься, и насколько интересна такая деятельность именно для вас. Рабочая методика узнать это;","Дополнительный заработок к уже имеющейся деятельности, приносящей доход. Также эффективный вариант получения дополнительный выгоды при наличии технических условий для майнинга;","Организация пассивного дохода с минимальным участием владельца фермы. Достаточно спорный формат, так как техника для добычи крипты все же требует серьезного внимания: за работой асиков необходимо следить, проводить техническое обслуживание, обновлять парк и своевременно оплачивать электричество. Исключением является формат готового бизнеса, где вы выступаете в роли инвестора и не участвуете в операционной деятельности;","Основной вид заработка. Реалистичный вариант, но при соблюдении некоторых условий – наличие подходящих площадей, внушительный потенциал электросетей, использование мощного оборудования (серьезные первоначальные инвестиции)."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'stoit-li-pokupat-fermu-i-zanimatsya-majningom';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 33, 'heading',
       $tmj${"level":2,"text":"Стоит ли покупать ферму и заниматься майнингом: выводы"}$tmj$::jsonb,
       'conclusion'
FROM articles a WHERE a.slug = 'stoit-li-pokupat-fermu-i-zanimatsya-majningom';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 34, 'paragraph',
       $tmj${"text":"Чтобы принять решение, необходимо ответить на все пять вопросов, рассмотренных нами. Если есть сомнения или спорные факторы, следует заняться решением этих проблем. Если же видимые препятствия отсутствуют и имеются все подходящие условия для выгодного майнинга, добыча криптовалюты станет мощным инструментом заработка, инвестирования и даже увлекательного хобби на несколько циклов BTC вперед."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'stoit-li-pokupat-fermu-i-zanimatsya-majningom';

-- Заглушка из 002 заменена production-статьёй с другим slug
UPDATE articles SET is_published = FALSE WHERE slug = 'best-time-to-buy-asic';
