SET client_encoding = 'UTF8';

-- =====================================================================
-- 037_investment_articles.sql
-- 6 статей раздела «Инвестиции» 1:1 с production.
-- =====================================================================

INSERT INTO media_assets (path, alt, source)
VALUES
    ('/images/articles/btc-after-mining/cover.jpg', 'Что делать с биткоином после майнинга', 'article_cover'),
    ('/images/articles/mining-registry-russia/cover.jpg', 'Реестр майнинга в России', 'article_cover'),
    ('/images/articles/mining-registry-russia/img-1.jpg', 'Вопрос-ответ по реестру майнинга', 'article'),
    ('/images/articles/mining-risks/cover.jpg', 'Риски майнинга', 'article_cover'),
    ('/images/articles/mining-risks/img-1.jpg', 'Какие бывают риски в майнинге', 'article'),
    ('/images/articles/mining-risks/img-2.jpg', 'Финансовый риск майнинга', 'article'),
    ('/images/articles/mining-risks/img-3.jpg', 'Кибербезопасность в майнинге', 'article'),
    ('/images/articles/mining-risks/img-4.jpg', 'Сложность майнинга и халвинг', 'article'),
    ('/images/articles/mine-or-buy/cover.jpg', 'Майнить или покупать криптовалюту', 'article_cover'),
    ('/images/articles/mine-or-buy/img-1.jpg', 'Как получить BTC: два способа', 'article'),
    ('/images/articles/mine-or-buy/img-2.jpg', 'Майнинг криптовалюты: плюсы и минусы', 'article'),
    ('/images/articles/mining-legal-russia/cover.jpg', 'Разрешен ли майнинг в России', 'article_cover'),
    ('/images/articles/mining-legal-russia/img-1.jpg', 'Действующее законодательство о майнинге', 'article'),
    ('/images/articles/mining-legal-russia/img-2.jpg', 'Оплата электричества при майнинге', 'article'),
    ('/images/articles/withdraw-mining-to-card/cover.jpg', 'Вывод денег с майнинг фермы на карту', 'article_cover'),
    ('/images/articles/withdraw-mining-to-card/img-1.jpg', 'Алгоритм вывода денег с майнинга', 'article'),
    ('/images/articles/withdraw-mining-to-card/img-2.jpg', 'Вывод средств с пула', 'article'),
    ('/images/articles/withdraw-mining-to-card/img-3.jpg', 'Вывод через обменники на карту', 'article')
ON CONFLICT (path) DO UPDATE SET alt = EXCLUDED.alt;

-- ---------------------------------------------------------------------
-- https://top-mining.ru/investiczii/chto-delat-s-bitkoinom-posle-majninga-analiz-variantov-i-raschetov/
-- ---------------------------------------------------------------------

INSERT INTO articles (
    slug, title, title_subtitle, excerpt, content, topic_id,
    reading_time_min, reading_minutes, published_at, view_count,
    display_type, sort_order, is_published, uses_blocks,
    image_url, image_alt
) VALUES (
    'chto-delat-s-bitkoinom-posle-majninga-analiz-variantov-i-raschetov',
    'Что делать с биткоином после майнинга?',
    'Анализ вариантов и расчетов',
    $excerpt$Стратегии для майнеров: HODL, частичная продажа, стейкинг, трейдинг и реинвест в оборудование — плюсы, минусы и расчеты.$excerpt$,
    $content$Что делать с биткоином в России — вопрос каждого майнера. Разбираем стратегии: хранение, продажа, стейкинг, трейдинг и реинвест в оборудование.$content$,
    'investments',
    7,
    7,
    '2025-07-10',
    419,
    'list',
    30,
    TRUE,
    TRUE,
    '/images/articles/btc-after-mining/cover.jpg',
    'Что делать с биткоином после майнинга'
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
WHERE a.slug = 'chto-delat-s-bitkoinom-posle-majninga-analiz-variantov-i-raschetov'
  AND m.path = '/images/articles/btc-after-mining/cover.jpg';

DELETE FROM article_blocks
WHERE article_id = (SELECT id FROM articles WHERE slug = 'chto-delat-s-bitkoinom-posle-majninga-analiz-variantov-i-raschetov');

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 1, 'heading',
       $tmj${"level":2,"text":"Введение"}$tmj$::jsonb,
       'intro'
FROM articles a WHERE a.slug = 'chto-delat-s-bitkoinom-posle-majninga-analiz-variantov-i-raschetov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 2, 'paragraph',
       $tmj${"text":"Что делать с биткоином в России – вопрос, который задает себе каждый майнер, особенно после халвинга и роста конкуренции. Даже при стабильной работе Antminer T21 на 190 TH/s (чистая прибыль около 12 431,87 ₽ в месяц при цене розетки 4,7 ₽/кВт) стоит заранее продумать стратегию: как распорядиться добытой криптовалютой, чтобы сохранить доходность и снизить риски."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'chto-delat-s-bitkoinom-posle-majninga-analiz-variantov-i-raschetov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 3, 'paragraph',
       $tmj${"text":"В этой статье мы разберем основные варианты: от долгосрочного хранения до трейдинга и стейкинга, сравним их плюсы и минусы и поможем понять, что делать с биткоином сейчас, чтобы не просто майнить, но и зарабатывать стабильно."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'chto-delat-s-bitkoinom-posle-majninga-analiz-variantov-i-raschetov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 4, 'heading',
       $tmj${"level":2,"text":"Что делать с Биткоином сейчас: варианты"}$tmj$::jsonb,
       'options'
FROM articles a WHERE a.slug = 'chto-delat-s-bitkoinom-posle-majninga-analiz-variantov-i-raschetov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 5, 'paragraph',
       $tmj${"text":"После майнинга перед владельцем асика встает ключевой вопрос: продать биткоины сразу или держать в надежде на рост?"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'chto-delat-s-bitkoinom-posle-majninga-analiz-variantov-i-raschetov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 6, 'paragraph',
       $tmj${"text":"Рассмотрим популярные стратегии:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'chto-delat-s-bitkoinom-posle-majninga-analiz-variantov-i-raschetov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 7, 'rich_list',
       $tmj${"ordered":true,"items":[{"title":"Долгосрок (HODL)","text":"накопление BTC и ожидание роста курса;"},{"title":"Частичная продажа","text":"для покрытия расходов;"},{"title":"Участие в стейкинге и DeFi","text":""},{"title":"Трейдинг","text":"для получения дохода на колебаниях курса;"},{"title":"Реинвестирование в новое оборудование","text":""}]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'chto-delat-s-bitkoinom-posle-majninga-analiz-variantov-i-raschetov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 8, 'paragraph',
       $tmj${"text":"Каждый из этих способов, как показывает практика, подходит для разной стратегии и степени готовности к риску. Рассмотрим форматы по отдельности."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'chto-delat-s-bitkoinom-posle-majninga-analiz-variantov-i-raschetov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 9, 'heading',
       $tmj${"level":2,"text":"Хранение в долгосрок"}$tmj$::jsonb,
       'hodl'
FROM articles a WHERE a.slug = 'chto-delat-s-bitkoinom-posle-majninga-analiz-variantov-i-raschetov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 10, 'paragraph',
       $tmj${"text":"Самая простая и понятная стратегия – держать BTC и ждать роста. Если посмотреть на динамику курса за последние 5–7 лет, биткоин в России и в мире в среднем показывал рост даже после падений. Например, откладывая 50% чистой прибыли (около 6 200 ₽/мес.) с одного Antminer T21, за год можно накопить биткоинов примерно на 74 000 ₽."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'chto-delat-s-bitkoinom-posle-majninga-analiz-variantov-i-raschetov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 11, 'paragraph',
       $tmj${"text":"Если курс вырастет на 30–40%, прибыль от этих накоплений будет существенной."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'chto-delat-s-bitkoinom-posle-majninga-analiz-variantov-i-raschetov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 12, 'paragraph',
       $tmj${"text":"Плюс долгосрочного хранения – защита капитала от инфляции рубля, минус – низкая ликвидность и риски временных просадок курса."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'chto-delat-s-bitkoinom-posle-majninga-analiz-variantov-i-raschetov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 13, 'heading',
       $tmj${"level":2,"text":"Продажа"}$tmj$::jsonb,
       'sell'
FROM articles a WHERE a.slug = 'chto-delat-s-bitkoinom-posle-majninga-analiz-variantov-i-raschetov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 14, 'paragraph',
       $tmj${"text":"Что делать с биткоинами в России, если нужны деньги на текущие расходы? Самый прямой вариант – продавать часть добытых монет. Например, при цене розетки 4,7 ₽ и выручке 24 727,52 ₽/мес. Antminer T21 дает около 12 431,87 ₽ чистой прибыли в месяц."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'chto-delat-s-bitkoinom-posle-majninga-analiz-variantov-i-raschetov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 15, 'paragraph',
       $tmj${"text":"Если сразу продавать 50% добытых монет, вы получите около 12 363 ₽ в рублях ежемесячно."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'chto-delat-s-bitkoinom-posle-majninga-analiz-variantov-i-raschetov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 16, 'image',
       $tmj${"src":"/images/articles/btc-after-mining/cover.jpg","alt":"Продажа части добытых биткоинов"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'chto-delat-s-bitkoinom-posle-majninga-analiz-variantov-i-raschetov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 17, 'paragraph',
       $tmj${"text":"Это удобно для оплаты аренды помещения, закупки расходников и электроэнергии. Но при росте курса BTC возможна упущенная выгода."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'chto-delat-s-bitkoinom-posle-majninga-analiz-variantov-i-raschetov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 18, 'heading',
       $tmj${"level":2,"text":"Стейкинг и DeFi"}$tmj$::jsonb,
       'staking'
FROM articles a WHERE a.slug = 'chto-delat-s-bitkoinom-posle-majninga-analiz-variantov-i-raschetov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 19, 'paragraph',
       $tmj${"text":"Стейкинг позволяет получать дополнительный доход в 3–6% годовых, блокируя монеты на смарт-контракте. Например, разместив накопленные биткоины или USDT на сумму 100 000 ₽ под 5%, можно заработать около 5 000 ₽ в год."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'chto-delat-s-bitkoinom-posle-majninga-analiz-variantov-i-raschetov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 20, 'paragraph',
       $tmj${"text":"Это не огромный доход, но он пассивный. Риск здесь – в надежности платформы и возможных просадках курса токена."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'chto-delat-s-bitkoinom-posle-majninga-analiz-variantov-i-raschetov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 21, 'heading',
       $tmj${"level":2,"text":"Трейдинг"}$tmj$::jsonb,
       'trading'
FROM articles a WHERE a.slug = 'chto-delat-s-bitkoinom-posle-majninga-analiz-variantov-i-raschetov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 22, 'paragraph',
       $tmj${"text":"Для тех, кто готов рисковать и следить за рынком, трейдинг – способ заработать на колебаниях курса. Обычно рекомендуют выделять на активную торговлю не больше 10–15% портфеля. Например, с Antminer T21 можно ежемесячно отправлять на трейдинг 1 200–1 800 ₽. Потенциально это может увеличить общую доходность, но при недостатке опыта есть риск потерять вложенное."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'chto-delat-s-bitkoinom-posle-majninga-analiz-variantov-i-raschetov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 23, 'heading',
       $tmj${"level":2,"text":"Реинвест в оборудование"}$tmj$::jsonb,
       'reinvest'
FROM articles a WHERE a.slug = 'chto-delat-s-bitkoinom-posle-majninga-analiz-variantov-i-raschetov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 24, 'paragraph',
       $tmj${"text":"Если говорить о росте бизнеса, то реинвест в новые асики остается одним из самых эффективных путей. Второй Antminer T21 при такой же стоимости 200 000 ₽ увеличит выручку до ~49 455 ₽/мес., а чистую прибыль – до ~24 800 ₽/мес. Но нужно учитывать рост сложности сети и возможные колебания курса BTC."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'chto-delat-s-bitkoinom-posle-majninga-analiz-variantov-i-raschetov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 25, 'heading',
       $tmj${"level":2,"text":"Какую часть держать, а какую выводить?"}$tmj$::jsonb,
       'allocation'
FROM articles a WHERE a.slug = 'chto-delat-s-bitkoinom-posle-majninga-analiz-variantov-i-raschetov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 26, 'paragraph',
       $tmj${"text":"Оптимальная модель – комбинировать подходы:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'chto-delat-s-bitkoinom-posle-majninga-analiz-variantov-i-raschetov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 27, 'list',
       $tmj${"ordered":false,"items":["50% добытых монет можно продавать сразу для покрытия расходов;","30% – хранить в долгосрок;","10–15% – направлять в стейкинг или DeFi;","10–15% – использовать для трейдинга или подушки ликвидности."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'chto-delat-s-bitkoinom-posle-majninga-analiz-variantov-i-raschetov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 28, 'paragraph',
       $tmj${"text":"Так вы минимизируете риски и используете возможности роста."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'chto-delat-s-bitkoinom-posle-majninga-analiz-variantov-i-raschetov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 29, 'heading',
       $tmj${"level":2,"text":"Сравнение стратегий"}$tmj$::jsonb,
       'comparison'
FROM articles a WHERE a.slug = 'chto-delat-s-bitkoinom-posle-majninga-analiz-variantov-i-raschetov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 30, 'paragraph',
       $tmj${"text":"Сравнение стратегий по доходности, рискам и ликвидности.","html":"<table><thead><tr><th>Вариант</th><th>Доходность</th><th>Риски</th><th>Ликвидность</th></tr></thead><tbody><tr><td>Хранение (HODL)</td><td>Средняя–высокая</td><td>Волатильность курса</td><td>Средняя</td></tr><tr><td>Частичная продажа</td><td>Средняя</td><td>Потеря дохода при росте</td><td>Высокая</td></tr><tr><td>Стейкинг и DeFi</td><td>Низкая–средняя</td><td>Киберриски</td><td>Средняя</td></tr><tr><td>Реинвест в оборудование</td><td>Средняя–высокая</td><td>Курс, сложность сети</td><td>Низкая</td></tr></tbody></table>"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'chto-delat-s-bitkoinom-posle-majninga-analiz-variantov-i-raschetov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 31, 'heading',
       $tmj${"level":2,"text":"Выводы"}$tmj$::jsonb,
       'conclusion'
FROM articles a WHERE a.slug = 'chto-delat-s-bitkoinom-posle-majninga-analiz-variantov-i-raschetov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 32, 'paragraph',
       $tmj${"text":"Что делать с биткоином сейчас – зависит от ваших целей, отношения к рискам и объема капитала. Самый стабильный вариант для начинающих – сочетать классический майнинг с Antminer T21, продажей части монет и хранением BTC в долгосрок."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'chto-delat-s-bitkoinom-posle-majninga-analiz-variantov-i-raschetov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 33, 'paragraph',
       $tmj${"text":"Для тех, кто готов идти дальше – добавить стейкинг, трейдинг и реинвест в оборудование."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'chto-delat-s-bitkoinom-posle-majninga-analiz-variantov-i-raschetov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 34, 'paragraph',
       $tmj${"text":"Так вы сможете сохранить баланс между доходностью, ликвидностью и рисками, а биткоин в России останется для вас не только способом накопить, но и заработать."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'chto-delat-s-bitkoinom-posle-majninga-analiz-variantov-i-raschetov';

-- ---------------------------------------------------------------------
-- https://top-mining.ru/investiczii/reestr-majninga-v-rossii-chto-eto-takoe-dlya-kogo-prednaznachen-i-kak-vstupit/
-- ---------------------------------------------------------------------

INSERT INTO articles (
    slug, title, title_subtitle, excerpt, content, topic_id,
    reading_time_min, reading_minutes, published_at, view_count,
    display_type, sort_order, is_published, uses_blocks,
    image_url, image_alt
) VALUES (
    'reestr-majninga-v-rossii-chto-eto-takoe-dlya-kogo-prednaznachen-i-kak-vstupit',
    'Реестр майнинга в России',
    'Что это такое, для кого предназначен и как вступить',
    $excerpt$Разбор закона о реестре майнеров: кто обязан вступить, какие требования, роль Минкомсвязи и Роскомнадзора, FAQ.$excerpt$,
    $content$В августе 2024 года подписан закон о регуляции майнинга. Майнеры обязаны попасть в специализированный реестр. Разбираем, что это такое и кому нужно вступать.$content$,
    'investments',
    6,
    6,
    '2024-08-23',
    588,
    'list',
    31,
    TRUE,
    TRUE,
    '/images/articles/mining-registry-russia/cover.jpg',
    'Реестр майнинга в России'
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
WHERE a.slug = 'reestr-majninga-v-rossii-chto-eto-takoe-dlya-kogo-prednaznachen-i-kak-vstupit'
  AND m.path = '/images/articles/mining-registry-russia/cover.jpg';

DELETE FROM article_blocks
WHERE article_id = (SELECT id FROM articles WHERE slug = 'reestr-majninga-v-rossii-chto-eto-takoe-dlya-kogo-prednaznachen-i-kak-vstupit');

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 1, 'heading',
       $tmj${"level":2,"text":"Введение"}$tmj$::jsonb,
       'intro'
FROM articles a WHERE a.slug = 'reestr-majninga-v-rossii-chto-eto-takoe-dlya-kogo-prednaznachen-i-kak-vstupit';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 2, 'paragraph',
       $tmj${"text":"В августе 2024 года был подписан закон, определяющий порядок регуляции майнинговой деятельности в России: дата вступления в силу – 1 ноября 2024. Речь идет о легализации добычи цифровой валюты в РФ, что является отправной точкой систематизации данного вида деятельности. Согласно положению закона, майнеры обязаны попасть в специализированный реестр, иначе их деятельность окажется незаконной. Узнаем, что это такое, как попасть в списки, кто занимается контролем и кому необходимо передавать свои данные в реестр."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'reestr-majninga-v-rossii-chto-eto-takoe-dlya-kogo-prednaznachen-i-kak-vstupit';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 3, 'heading',
       $tmj${"level":2,"text":"Что такое реестр майнинга в России?"}$tmj$::jsonb,
       'what-is'
FROM articles a WHERE a.slug = 'reestr-majninga-v-rossii-chto-eto-takoe-dlya-kogo-prednaznachen-i-kak-vstupit';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 4, 'paragraph',
       $tmj${"text":"Контрольным ведомством, призванным систематизировать сферу добычи криптовалют в РФ, оказалось Министерство связи и массовых коммуникаций Российской Федерации (сокращенно – Минкомсвязь). Именно реестр Минкомсвязи является тем самым списком, в котором должен оказаться каждый майнер страны, осуществляющий деятельность в статусе индивидуального предпринимателя или юридического лица."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'reestr-majninga-v-rossii-chto-eto-takoe-dlya-kogo-prednaznachen-i-kak-vstupit';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 5, 'paragraph',
       $tmj${"text":"Помимо владельцев ферм пополнить списки реестра обязаны и майнинг-пулы и создатели хостингов: данное условие также является обязательным для осуществления легальной деятельности."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'reestr-majninga-v-rossii-chto-eto-takoe-dlya-kogo-prednaznachen-i-kak-vstupit';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 6, 'image',
       $tmj${"src":"/images/articles/mining-registry-russia/cover.jpg","alt":"Что такое реестр майнинга в России"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'reestr-majninga-v-rossii-chto-eto-takoe-dlya-kogo-prednaznachen-i-kak-vstupit';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 7, 'paragraph',
       $tmj${"text":"Какие еще требования к процедуре добычи криптовалюты, помимо внесения в реестр, существуют в новом законе:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'reestr-majninga-v-rossii-chto-eto-takoe-dlya-kogo-prednaznachen-i-kak-vstupit';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 8, 'list',
       $tmj${"ordered":false,"items":["Необходимость отчетности. Власти должны получать информацию о кошельках майнера и объемах добытой криптовалюты;","Соблюдение предельных метрик электроэнергии, определенных региональными властями;","Запрет рекламы криптовалют, а также использование цифровых активов в качестве средств оплаты за приобретение товаров или услуг."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'reestr-majninga-v-rossii-chto-eto-takoe-dlya-kogo-prednaznachen-i-kak-vstupit';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 9, 'paragraph',
       $tmj${"text":"Еще один участник процесса – Российская федеральная служба по надзору в сфере связи, информационных технологий и массовых коммуникаций (Роскомнадзор)."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'reestr-majninga-v-rossii-chto-eto-takoe-dlya-kogo-prednaznachen-i-kak-vstupit';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 10, 'paragraph',
       $tmj${"text":"Задача данного ведомства – контроль правильности ведения реестра, а также включения и исключения из списков его участников."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'reestr-majninga-v-rossii-chto-eto-takoe-dlya-kogo-prednaznachen-i-kak-vstupit';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 11, 'heading',
       $tmj${"level":2,"text":"Кто должен попасть в реестр?"}$tmj$::jsonb,
       'who'
FROM articles a WHERE a.slug = 'reestr-majninga-v-rossii-chto-eto-takoe-dlya-kogo-prednaznachen-i-kak-vstupit';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 12, 'paragraph',
       $tmj${"text":"Подать заявку в Минкомсвязь на вступление в реестр майнинга обязаны следующие участники рынка:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'reestr-majninga-v-rossii-chto-eto-takoe-dlya-kogo-prednaznachen-i-kak-vstupit';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 13, 'list',
       $tmj${"ordered":false,"items":["Владельцы асиков и ферм в статусе индивидуального предпринимателя или юридического лица;","Майнинговые отели и хостинги, размещающие оборудование своих клиентов;","Пулы, зарегистрированные в РФ;"]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'reestr-majninga-v-rossii-chto-eto-takoe-dlya-kogo-prednaznachen-i-kak-vstupit';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 14, 'paragraph',
       $tmj${"text":"Физические лица освобождены от необходимости подачи заявления на внесение в реестр: для частных майнеров ограничений значительно меньше – соблюдение лимитов потребления электроэнергии, запрет на рекламу и использование криптовалют в качестве платежного средства."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'reestr-majninga-v-rossii-chto-eto-takoe-dlya-kogo-prednaznachen-i-kak-vstupit';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 15, 'paragraph',
       $tmj${"text":"Также существует ряд ограничений для тех, кто не имеет юридического права заниматься добычей цифровых активов в России. Это следующие категории:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'reestr-majninga-v-rossii-chto-eto-takoe-dlya-kogo-prednaznachen-i-kak-vstupit';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 16, 'list',
       $tmj${"ordered":false,"items":["Граждане с неснятой судимостью в сфере экономики (например, отмывание денежных средств);","Лица, причастные к террористическим или экстремистским организациям;","Компании, имеющие отношение к производству, передаче и покупке электроэнергии."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'reestr-majninga-v-rossii-chto-eto-takoe-dlya-kogo-prednaznachen-i-kak-vstupit';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 17, 'paragraph',
       $tmj${"text":"Также запрет на осуществление майнинговой деятельности может вводиться в отдельных регионах страны."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'reestr-majninga-v-rossii-chto-eto-takoe-dlya-kogo-prednaznachen-i-kak-vstupit';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 18, 'paragraph',
       $tmj${"text":"Как правило, это субъекты с дефицитом электротехнических мощностей: фермы способны негативным образом влиять на и без того непростую ситуацию в энергетике."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'reestr-majninga-v-rossii-chto-eto-takoe-dlya-kogo-prednaznachen-i-kak-vstupit';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 19, 'heading',
       $tmj${"level":2,"text":"Как вступить в реестр майнинга в России?"}$tmj$::jsonb,
       'how'
FROM articles a WHERE a.slug = 'reestr-majninga-v-rossii-chto-eto-takoe-dlya-kogo-prednaznachen-i-kak-vstupit';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 20, 'paragraph',
       $tmj${"text":"Порядок попадания в реестр на конец лета 2024 года не определен: процедура будет регулироваться дополнительными законодательными актами, как и многие другие уточнения нового закона о майнинге."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'reestr-majninga-v-rossii-chto-eto-takoe-dlya-kogo-prednaznachen-i-kak-vstupit';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 21, 'heading',
       $tmj${"level":2,"text":"Вопрос-ответ"}$tmj$::jsonb,
       'faq'
FROM articles a WHERE a.slug = 'reestr-majninga-v-rossii-chto-eto-takoe-dlya-kogo-prednaznachen-i-kak-vstupit';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 22, 'image',
       $tmj${"src":"/images/articles/mining-registry-russia/img-1.jpg","alt":"Вопрос-ответ по реестру майнинга"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'reestr-majninga-v-rossii-chto-eto-takoe-dlya-kogo-prednaznachen-i-kak-vstupit';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 23, 'rich_list',
       $tmj${"ordered":false,"items":[{"title":"О каких лимитах на электроэнергию идет речь?","text":"Пока законодательных актов по указанному направлению нет – они появятся в ближайшее время. Вероятно, власти отдельных регионов смогут устанавливать пределы потребления индивидуально."},{"title":"Можно сказать, что майнинг в России стал самостоятельным видом предпринимательской деятельности?","text":"Пока говорить об этом преждевременно, так как отсутствуют отдельные коды ОКВЭД и специализированные налоговые положения для майнеров."},{"title":"Как будут выявлять факт превышения лимитов?","text":"Вероятно, для этих целей станут использовать средние показатели потребления. Контролем потребления займутся специалисты энергосбытовых компаний в рамках норм, принятых в будущем."},{"title":"Что делать, если майнер «уперся» в установленные лимиты?","text":"Вариантов несколько. Во-первых, можно оформить ИП или юридическое лицо, чтобы получить возможность добычи в рамках реестра. Во-вторых, распределить оборудование по локациям в разных регионах."},{"title":"Если майнингом теперь можно заниматься официально, существуют какие-либо субсидии или меры поддержки от государства?","text":"На текущем этапе таких форматов не существует из-за отсутствия ряда нормативных актов, регулирующих деятельность (ОКВЭД, налоговая база и т.д.). Не исключено, что со временем по мере развития сегмента подобные субсидии могут появиться."}]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'reestr-majninga-v-rossii-chto-eto-takoe-dlya-kogo-prednaznachen-i-kak-vstupit';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 24, 'heading',
       $tmj${"level":2,"text":"Выводы"}$tmj$::jsonb,
       'conclusion'
FROM articles a WHERE a.slug = 'reestr-majninga-v-rossii-chto-eto-takoe-dlya-kogo-prednaznachen-i-kak-vstupit';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 25, 'paragraph',
       $tmj${"text":"Летний закон 2024 года о легализации майнинга в России – это первый шаг к регуляции сферы. Несмотря на то, что многие моменты не учтены и отсутствуют важные законодательные уточнения и положения, в ближайшие годы данная сфера подвергнется тщательному контролю и регуляции со стороны властей РФ. Появление реестра лиц, осуществляющих майнинг цифровой валюты – начальный этап новой тенденции."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'reestr-majninga-v-rossii-chto-eto-takoe-dlya-kogo-prednaznachen-i-kak-vstupit';

-- ---------------------------------------------------------------------
-- https://top-mining.ru/investiczii/riski-majninga-razbor-opasnostej-i-ugroz/
-- ---------------------------------------------------------------------

INSERT INTO articles (
    slug, title, title_subtitle, excerpt, content, topic_id,
    reading_time_min, reading_minutes, published_at, view_count,
    display_type, sort_order, is_published, uses_blocks,
    image_url, image_alt
) VALUES (
    'riski-majninga-razbor-opasnostej-i-ugroz',
    'Риски майнинга',
    'Разбор опасностей и угроз',
    $excerpt$Технические, финансовые, энергетические, юридические и инфраструктурные риски майнинга — что учитывать инвестору.$excerpt$,
    $content$Любой бизнес сопряжен с рисками. В майнинге есть технические, финансовые, энергетические, юридические и инфраструктурные угрозы. Разбираем каждый тип отдельно.$content$,
    'investments',
    10,
    10,
    '2024-07-24',
    522,
    'list',
    32,
    TRUE,
    TRUE,
    '/images/articles/mining-risks/cover.jpg',
    'Риски майнинга'
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
WHERE a.slug = 'riski-majninga-razbor-opasnostej-i-ugroz'
  AND m.path = '/images/articles/mining-risks/cover.jpg';

DELETE FROM article_blocks
WHERE article_id = (SELECT id FROM articles WHERE slug = 'riski-majninga-razbor-opasnostej-i-ugroz');

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 1, 'heading',
       $tmj${"level":2,"text":"Введение"}$tmj$::jsonb,
       'intro'
FROM articles a WHERE a.slug = 'riski-majninga-razbor-opasnostej-i-ugroz';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 2, 'paragraph',
       $tmj${"text":"Любой вид бизнеса, будь это работа по франшизе или формат самостоятельного ведения дел, сопряжен с потенциальными рисками. Даже самый обыкновенный вклад в банке ввиду ряда юридических тонкостей законодательства не является на 100% надежным видом заработка. Биткоин, блокчейн, инвестиции в майнинг и криптовалютные форматы являются еще одним подтверждением этого факта. Здесь также есть свои финансовые нюансы и риски, с которыми сталкиваются опытные инвесторы. Задача каждого майнера вне зависимости от его опыта и типа оборудования – знать все технические, юридические и инфраструктурные риски. И данная статья подготовлена для решения именно этой проблемы."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'riski-majninga-razbor-opasnostej-i-ugroz';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 3, 'heading',
       $tmj${"level":2,"text":"Какие бывают риски в майнинге?"}$tmj$::jsonb,
       'types'
FROM articles a WHERE a.slug = 'riski-majninga-razbor-opasnostej-i-ugroz';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 4, 'paragraph',
       $tmj${"text":"Многие далекие от рынка цифровых активов считают, что заработать в крипто сфере на блокчейне достаточно просто: купил asic, собрал ферму, запустил процесс и просто получаешь прибыль с этого инструмента. На практике все значительно сложнее, чем может показаться на первый взгляд."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'riski-majninga-razbor-opasnostej-i-ugroz';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 5, 'paragraph',
       $tmj${"text":"Технические, финансовые, энергетические, юридические и инфраструктурные – все это актуальные сложности, с которыми сталкивается абсолютно каждый майнер, выбрав крипто бизнес."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'riski-majninga-razbor-opasnostej-i-ugroz';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 6, 'image',
       $tmj${"src":"/images/articles/mining-risks/img-1.jpg","alt":"Какие бывают риски в майнинге"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'riski-majninga-razbor-opasnostej-i-ugroz';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 7, 'paragraph',
       $tmj${"text":"И чем детальнее вы будете знать тонкости каждого нюанса из списка, тем проще будет заниматься развитием фермы и получением доходов от рынка крипты. Именно по этой причине каждый тип риска мы рассмотрим в отдельности, детально проанализировав цифровые особенности."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'riski-majninga-razbor-opasnostej-i-ugroz';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 8, 'heading',
       $tmj${"level":2,"text":"Оборудование майнеров: технические детали"}$tmj$::jsonb,
       'hardware'
FROM articles a WHERE a.slug = 'riski-majninga-razbor-opasnostej-i-ugroz';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 9, 'paragraph',
       $tmj${"text":"Первый вопрос, на который отвечают майнеры при решении заняться добычей биткоина – какому именно оборудованию отдать свой голос – асикам или видеокартам. Каждый тип устройства производят десятки компаний с различной репутацией. Технический вопрос выбора – важный момент, на котором следует сконцентрировать особое внимание."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'riski-majninga-razbor-opasnostej-i-ugroz';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 10, 'paragraph',
       $tmj${"text":"Всегда есть риск столкнуться с поломкой техники. Гарантия на аппаратуру, сложность ремонта, стоимость обслуживания, расходы на восстановление – всем этим рано или поздно придется заниматься."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'riski-majninga-razbor-opasnostej-i-ugroz';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 11, 'paragraph',
       $tmj${"text":"Вот почему следует майнить на проверенном оборудовании (желательно новом, а не б/у) от известного производителя. Так вы проще найдете сервисы: ситуация с починкой не окажется серьезной головной болью. Да и сложность восстановления известной многим мастерам техники значительно меньше."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'riski-majninga-razbor-opasnostej-i-ugroz';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 12, 'paragraph',
       $tmj${"text":"Существуют и другие риски, которые мешают зарабатывать майнерам – это технические особенности отдельных устройств, а также их размещение и продажа на вторичном рынке."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'riski-majninga-razbor-opasnostej-i-ugroz';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 13, 'paragraph',
       $tmj${"text":"Например, чипы 17-ой серии Antminer отваливаются от платы прямо во время транспортировки, а некоторые модели Whatsminer значительно нагреваются во время работы. Все эти нюансы могут негативным образом сказаться на инвестициях, влияя на прибыли. Поэтому знать о таких важных деталях следует еще до покупки инвесторами того или иного асика."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'riski-majninga-razbor-opasnostej-i-ugroz';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 14, 'heading',
       $tmj${"level":2,"text":"Финансовый риск майнинга"}$tmj$::jsonb,
       'financial'
FROM articles a WHERE a.slug = 'riski-majninga-razbor-opasnostej-i-ugroz';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 15, 'paragraph',
       $tmj${"text":"А теперь несколько слов о совершенно другом типе криптовалютного риска – все, что касается финансовой сложности. И здесь ключевых вопросов несколько:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'riski-majninga-razbor-opasnostej-i-ugroz';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 16, 'list',
       $tmj${"ordered":false,"items":["Биткоины – это цифровые активы. Многие считают крипту большим мыльным пузырем, который рано или поздно лопнет. Стремительное развитие рынка виртуальных монет очевидно, но даже банковская система может рухнуть, следовательно, цифровые валюты также не обладают абсолютной жизнеспособностью;","Если майнерами добывается основная валюта – биткоин, риски минимальны. Если же выбор инвестора пал на альтернативные и малоизвестные монеты, большая вероятность столкнуться с мошенническими действиями и потерять финансы;","Риск покупки оборудования для майнинга, которое потеряет актуальность. И речь даже не про инвестиции в сомнительные форматы и специфическую технику. Все поняли осень 2022 года, когда Эфир отправился на PoS: многих ферм коснулась незавидная судьба, однако еще совсем недавно рынок щедро вознаграждал финансами инвесторов на GPU;","Любой цифровой актив обладает повышенной волатильностью – это значит, что на цену тех или иных валют могут влиять спекулянты. Степень влияния таких лиц, например, в фондовом рынке значительно меньше, поэтому волатильность криптовалютной отрасли – реальный риск и угроза. Заработок на биткоине ощутимее, но и потенциальные потери тоже;"]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'riski-majninga-razbor-opasnostej-i-ugroz';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 17, 'image',
       $tmj${"src":"/images/articles/mining-risks/img-2.jpg","alt":"Финансовый риск майнинга"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'riski-majninga-razbor-opasnostej-i-ugroz';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 18, 'paragraph',
       $tmj${"text":"Количество финансовых факторов, о которых должен знать инвестор, велико. Избежать ошибки помогут знания и опыт, а также развитие личной грамотности в области финансов."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'riski-majninga-razbor-opasnostej-i-ugroz';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 19, 'heading',
       $tmj${"level":2,"text":"Риски в области электроэнергии"}$tmj$::jsonb,
       'energy'
FROM articles a WHERE a.slug = 'riski-majninga-razbor-opasnostej-i-ugroz';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 20, 'paragraph',
       $tmj${"text":"Цифровая выручка связана еще и с таким важным фактором, как электроэнергия – оборудованием потребляется достаточно ощутимый объем электричества, что также важно учитывать в успешном бизнесе."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'riski-majninga-razbor-opasnostej-i-ugroz';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 21, 'paragraph',
       $tmj${"text":"Ферма на асиках требует большого объема мощности сети – стоимость обслуживания коммунальных платежей вполне может исчисляться десятками тысяч рублей."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'riski-majninga-razbor-opasnostej-i-ugroz';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 22, 'paragraph',
       $tmj${"text":"Если эти затраты не учесть на начальном этапе, прибыльность майнинга преподнесет неприятный сюрприз. Поэтому не забывайте про электроэнергию, планируя прибыль:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'riski-majninga-razbor-opasnostej-i-ugroz';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 23, 'list',
       $tmj${"ordered":false,"items":["Оплату за электричество придется вносить регулярно, не накапливая долг;","Будьте готовы к росту тарифов, что приведет к неизбежному увеличению расходов;","Важная роль отведена такому фактору, как цена киловатта: в некоторых регионах значение менее 1 рубля, а в ряде субъектов – более 7 рублей. Доходы будут напрямую зависеть от приведенного показателя;","Некоторые инструменты майнинга настолько «прожорливы» с точки зрения энергопотребления, что потенциала «розетки» в помещении может быть недостаточно – потребуется получение дополнительных объемов при условии наличия технической возможности;","Добывая цифровую валюту, высока вероятность столкнуться с ситуацией: майнинг может быть расценен государством как извлечение прибылей через коммерческую деятельность. Оплаты штрафов и перевода фермы на специальный энерго-тариф не избежать. Довольно ощутимое падение прибыли в этом случае будет неизбежно;"]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'riski-majninga-razbor-opasnostej-i-ugroz';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 24, 'paragraph',
       $tmj${"text":"Вот почему к оплате электричества на рынке майнинга необходимо отнестись с повышенным вниманием. Для получения стабильного дохода и развития бизнеса необходимо помнить о рисках, связанных с электроэнергетикой."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'riski-majninga-razbor-opasnostej-i-ugroz';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 25, 'heading',
       $tmj${"level":2,"text":"Кибербезопасность на рынках"}$tmj$::jsonb,
       'cyber'
FROM articles a WHERE a.slug = 'riski-majninga-razbor-opasnostej-i-ugroz';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 26, 'paragraph',
       $tmj${"text":"Еще более важным вопросом является защита пользователя от угроз сферы кибербезопасности. Мир блокчейна – это место, где нашли применение своим талантам сотни мошенников, желающих украсть ваши деньги. Успешное управление бизнесом в области цифровых сервисов – это знание всех источников кибер-угроз. Рассмотрим этот вопрос, начиная с первых шагов:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'riski-majninga-razbor-opasnostej-i-ugroz';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 27, 'list',
       $tmj${"ordered":false,"items":["Покупка оборудования. Пользователь может столкнуться с тем, что асик майнит крипту на чужой кошелек. Причиной являются мошенники-продавцы, которые перепрошивают аппаратуру с целью заработка легких денег;","Обслуживание асиков и обновление прошивок уже во время работы – еще один способ столкнуться с мошенничеством по уже названной выше причине;","Пул для работы техники. Использование сомнительных пулов – всегда повышенный риск для начинающих майнеров оказаться жертвой мошеннических схем. Выбирайте надежного пул-партнера, который знаком опытным пользователям и обладает серьезной репутацией;","Хранение средств после вывода финансовых мощностей с пула. Выбирать следует проверенные средства, например, холодные кошельки от компании, чье имя известно рынку;","Хранение средств на бирже. Такие сайты не обеспечивают абсолютную сохранность средств, так как облачные форматы биржи имеют частных владельцев;","Наличие вирусов как на асиках, так и на компьютере (ноутбуке), с которого производится управление. Мошенничество в области создания вредоносного программного обеспечения в сфере управления блокчейном – распространенное явление, следовательно, инвесторам необходимо всегда быть начеку;","Проведение сомнительных переводов и других операций. В данном случае можно с легкостью стать жертвой мошеннической схемы. Следует проверять каждую цифру кошелька на каждом сайте, чувствуя потенциальные угрозы;"]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'riski-majninga-razbor-opasnostej-i-ugroz';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 28, 'image',
       $tmj${"src":"/images/articles/mining-risks/img-3.jpg","alt":"Кибербезопасность в майнинге"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'riski-majninga-razbor-opasnostej-i-ugroz';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 29, 'paragraph',
       $tmj${"text":"В крипто сетях не проходит ни дня, когда не обрушится какой-нибудь сайт или перестанет существовать сервис вместе с активами пользователей."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'riski-majninga-razbor-opasnostej-i-ugroz';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 30, 'paragraph',
       $tmj${"text":"Это действительно большая финансовая проблема мошенничества, которая в текущих реалиях не имеет абсолютного решения. Для того чтобы вы не столкнулись с подобной ситуацией, всегда придерживайтесь базовых правил крипто безопасности."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'riski-majninga-razbor-opasnostej-i-ugroz';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 31, 'heading',
       $tmj${"level":2,"text":"Налогообложение и пробелы в законодательстве"}$tmj$::jsonb,
       'legal'
FROM articles a WHERE a.slug = 'riski-majninga-razbor-opasnostej-i-ugroz';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 32, 'paragraph',
       $tmj${"text":"Говорить о том, что органы власти запрещают добывать цифровое золото и заниматься рынком крипты, нельзя. Причина заключается в том, что в настоящих условиях во многих странах не сформирована ни юридическая основа, ни база налогов, ни положения по регулированию сферы, ни политика конфиденциальности, ни законность, ни ставка – любые документы отсутствуют. Для многих государств крипта – словно темный лес, хотя, некоторые страны уже активно задумываются над юридической составляющей, а где-то майнинг и вовсе под строгим запретом."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'riski-majninga-razbor-opasnostej-i-ugroz';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 33, 'paragraph',
       $tmj${"text":"До тех пор пока органами государства не будет дано четкое положение по налогообложению и регулированию рынка, количество желающих добывать BTC меньше не станет."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'riski-majninga-razbor-opasnostej-i-ugroz';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 34, 'paragraph',
       $tmj${"text":"Однако уже сейчас с определенной степенью уверенности можно говорить о том, что именно рано или поздно заинтересует органов власти. Во-первых, налогообложение доходов, получаемых от торговли на бирже. Во-вторых, увеличение стоимости электричества для майнеров. В-третьих, регистрация устройств для добычи криптовалют в специализированных реестрах."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'riski-majninga-razbor-opasnostej-i-ugroz';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 35, 'heading',
       $tmj${"level":2,"text":"Сложность майнинга и халвинг"}$tmj$::jsonb,
       'halving'
FROM articles a WHERE a.slug = 'riski-majninga-razbor-opasnostej-i-ugroz';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 36, 'paragraph',
       $tmj${"text":"Еще одна категория рисков в мире работы с цифровыми деньгами – это снижающийся доход майнеров из-за двух явлений, с которыми сталкивается каждый:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'riski-majninga-razbor-opasnostej-i-ugroz';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 37, 'rich_list',
       $tmj${"ordered":true,"items":[{"title":"Рост хешрейта сети","text":"Цифровая сеть BTC обладает таким основополагающим параметром, как хэшрейт. И это значение постоянно увеличивается, так как сложность добычи Биткоина растет. Сохраняя прежний оборот, майнеры выходят на меньшие объемы заработка, не говоря уже о росте затрат при сокращении прибыльности вашей установки. Исправить ситуацию способен курс цифровых активов – как правило, динамика роста исторически компенсирует все риски криптоэнтузиастов;"},{"title":"Халвинг","text":"Согласно технологии блокчейна BTC, каждые 4 года объем наград майнеров сокращается ровно в 2 раза: именно такую финансовую модель заложил в маркетинг создатель Биткоина при своей первой записи. Правда, после халвинга курсы ключевых криптоактивов начинают расти, что также компенсирует риски, комиссии и оптимизирует условия работы систем добычи."}]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'riski-majninga-razbor-opasnostej-i-ugroz';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 38, 'image',
       $tmj${"src":"/images/articles/mining-risks/img-4.jpg","alt":"Сложность майнинга и халвинг"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'riski-majninga-razbor-opasnostej-i-ugroz';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 39, 'paragraph',
       $tmj${"text":"Технология работы с BTC основана на цикличности. И оба понятия, которые мы рассмотрели выше, также подчиняются этому же фактору, позволяя с большей прогнозируемостью управлять доходами."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'riski-majninga-razbor-opasnostej-i-ugroz';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 40, 'heading',
       $tmj${"level":2,"text":"Перспективы и будущее майнинга"}$tmj$::jsonb,
       'outlook'
FROM articles a WHERE a.slug = 'riski-majninga-razbor-opasnostej-i-ugroz';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 41, 'paragraph',
       $tmj${"text":"Как начать извлекать выгоду из крипто-системы и как зарабатывают опытные участники рынка? Четкое планирование, грамотный расчет и понимание, каким сложностям суждено встретиться на пути – вот ключ к успеху."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'riski-majninga-razbor-opasnostej-i-ugroz';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 42, 'paragraph',
       $tmj${"text":"Что же можно сказать о перспективах криптовалют и майнинга, в частности? Прежде всего то, что рынки находятся лишь в самом начале пути своего становления и развития."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'riski-majninga-razbor-opasnostej-i-ugroz';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 43, 'paragraph',
       $tmj${"text":"И чем раньше вы познакомитесь с этим сегментом, тем быстрее найдете свое место в крипто индустрии. Начинать следует с простого, постепенно осваивая все новые направления на пути к большим деньгам!"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'riski-majninga-razbor-opasnostej-i-ugroz';

-- ---------------------------------------------------------------------
-- https://top-mining.ru/investiczii/chto-vygodnee-majnit-ili-pokupat-kriptovalyutu/
-- ---------------------------------------------------------------------

INSERT INTO articles (
    slug, title, title_subtitle, excerpt, content, topic_id,
    reading_time_min, reading_minutes, published_at, view_count,
    display_type, sort_order, is_published, uses_blocks,
    image_url, image_alt
) VALUES (
    'chto-vygodnee-majnit-ili-pokupat-kriptovalyutu',
    'Что выгоднее',
    'Майнить или покупать криптовалюту?',
    $excerpt$Сравнение майнинга и покупки BTC: плюсы и минусы каждого подхода, роль времени входа и калькулятора майнинга.$excerpt$,
    $content$Майнить биткоин или просто покупать его? Сравниваем два способа получить BTC: запуск оборудования и покупка на бирже.$content$,
    'investments',
    5,
    5,
    '2024-06-16',
    403,
    'list',
    33,
    TRUE,
    TRUE,
    '/images/articles/mine-or-buy/cover.jpg',
    'Майнить или покупать криптовалюту'
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
WHERE a.slug = 'chto-vygodnee-majnit-ili-pokupat-kriptovalyutu'
  AND m.path = '/images/articles/mine-or-buy/cover.jpg';

DELETE FROM article_blocks
WHERE article_id = (SELECT id FROM articles WHERE slug = 'chto-vygodnee-majnit-ili-pokupat-kriptovalyutu');

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 1, 'heading',
       $tmj${"level":2,"text":"Введение"}$tmj$::jsonb,
       'intro'
FROM articles a WHERE a.slug = 'chto-vygodnee-majnit-ili-pokupat-kriptovalyutu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 2, 'paragraph',
       $tmj${"text":"Кофе с молоком или без? Японские или немецкие автомобили? Майнить биткоин или просто покупать его? Три наиболее актуальных вопроса человечества, дать ответ на которые непросто. А поскольку вы находитесь на страницах портала, посвященного цифровым активам, мы все же постараемся ответить на загадку, связанную с технологией блокчейна. А про напитки и машины пусть спорят в другом месте!"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'chto-vygodnee-majnit-ili-pokupat-kriptovalyutu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 3, 'heading',
       $tmj${"level":2,"text":"Как получить BTC: два способа"}$tmj$::jsonb,
       'two-ways'
FROM articles a WHERE a.slug = 'chto-vygodnee-majnit-ili-pokupat-kriptovalyutu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 4, 'paragraph',
       $tmj${"text":"Начать следует с понимания, какими законными способами можно стать владельцем цифрового золота? Известны два метода:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'chto-vygodnee-majnit-ili-pokupat-kriptovalyutu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 5, 'list',
       $tmj${"ordered":false,"items":["Запуск майнингового процесса. Для этого нам понадобится специализированное устройство, которое называется майнер (видеокарта или асик). Вы самостоятельно занимаетесь добычей, осваивая это направление, оплачиваете электроэнергию и производите обслуживание техники. Ваша награда – это объем получаемого крипто актива;","Покупка криптовалюты на бирже. Вы просто приобретаете активы, не занимаясь техническим вопросом их получения."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'chto-vygodnee-majnit-ili-pokupat-kriptovalyutu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 6, 'paragraph',
       $tmj${"text":"В чем разница между этими двумя способами? Прежде всего, в наличии технического оснащения или целой фермы."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'chto-vygodnee-majnit-ili-pokupat-kriptovalyutu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 7, 'image',
       $tmj${"src":"/images/articles/mine-or-buy/img-1.jpg","alt":"Как получить BTC: два способа"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'chto-vygodnee-majnit-ili-pokupat-kriptovalyutu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 8, 'paragraph',
       $tmj${"text":"Аппаратуру необходимо приобрести, обслуживать и следить за ее работой – это дополнительное вложение. Но с другой стороны, технику можно продавать – еще одна возможность зарабатывать на крипте, если устройство уже окупилось. Об этом мы расскажем далее."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'chto-vygodnee-majnit-ili-pokupat-kriptovalyutu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 9, 'heading',
       $tmj${"level":2,"text":"Покупка крипты: преимущества и недостатки"}$tmj$::jsonb,
       'buy'
FROM articles a WHERE a.slug = 'chto-vygodnee-majnit-ili-pokupat-kriptovalyutu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 10, 'paragraph',
       $tmj${"text":"Детальное изучение процесса начнем с наиболее простого варианта – покупка криптовалюты. Сегодня можно быстро зарегистрироваться на бирже и начать получать доход на росте курса монеты. Такая инвестиция обладает следующими преимуществами:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'chto-vygodnee-majnit-ili-pokupat-kriptovalyutu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 11, 'list',
       $tmj${"ordered":false,"items":["Разобраться в механизме работы с биржей реально любому новичку – для этого потребуется не более получаса. А в дальнейшем дополнительная валюта может быть куплена всего за пару минут;","Простой и предельно понятный способ вложения: если курс растет, вы зарабатываете по принципу «купил BTC дешевле, продал дороже»;","Возможность заниматься трейдингом, как на фондовой бирже. Только прибыль в случае с BTC может быть выше, так как цифровые активы отличаются повышенной волатильностью;"]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'chto-vygodnee-majnit-ili-pokupat-kriptovalyutu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 12, 'paragraph',
       $tmj${"text":"Впрочем, есть и недостаток, влияющий на ваш заработок: прибыль зависит только от курса крипты, в то время как майнинг предполагает изменения стоимости техники – возможность заработать больше."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'chto-vygodnee-majnit-ili-pokupat-kriptovalyutu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 13, 'heading',
       $tmj${"level":2,"text":"Майнинг криптовалюты: плюсы и минусы"}$tmj$::jsonb,
       'mine'
FROM articles a WHERE a.slug = 'chto-vygodnee-majnit-ili-pokupat-kriptovalyutu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 14, 'paragraph',
       $tmj${"text":"Альтернативный способ получать криптовалюту – взять асик (Antminer или Whatsminer) и становиться настоящим майнером. Какими преимуществами отличается этот метод:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'chto-vygodnee-majnit-ili-pokupat-kriptovalyutu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 15, 'list',
       $tmj${"ordered":false,"items":["Инвестор получает способ преумножать капитал не только на колебаниях курса крипты, но и благодаря вторичной стоимости асика. Если оборудование окупилось (вернулись вложенные в него средства), остаточная цена аппаратуры превращается в возможность дополнительного заработка;","Имеется перспектива разгона асика, чтобы добывать больше – недостатка информации о способах модификации сегодня нет, что поможет сделать ваш бизнес еще более прибыльным;","Преимущество извлечения дополнительной выгоды. Например, теплом от асика можно отапливать жилье, снижая стоимость коммунальных платежей – такая практика активно применяется в регионах с прохладным климатом."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'chto-vygodnee-majnit-ili-pokupat-kriptovalyutu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 16, 'image',
       $tmj${"src":"/images/articles/mine-or-buy/img-2.jpg","alt":"Майнинг криптовалюты: плюсы и минусы"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'chto-vygodnee-majnit-ili-pokupat-kriptovalyutu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 17, 'paragraph',
       $tmj${"text":"Риск столкнуться с недостатками также имеется:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'chto-vygodnee-majnit-ili-pokupat-kriptovalyutu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 18, 'list',
       $tmj${"ordered":false,"items":["Растущая сложность добычи BTC сокращает прибыль;","Продажа асика на вторичном рынке – это непростой и продолжительный процесс;","Утрата актуальности техники из-за изменения алгоритмов добычи цифровых активов. Мы помним о скандальном переходе ETH на PoS-систему. После этого доходность GPU серьезно сократилась."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'chto-vygodnee-majnit-ili-pokupat-kriptovalyutu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 19, 'paragraph',
       $tmj${"text":"Это все, что необходимо учитывать перед принятием решения – купить майнер или видеокарту для добычи цифрового золота."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'chto-vygodnee-majnit-ili-pokupat-kriptovalyutu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 20, 'heading',
       $tmj${"level":2,"text":"Добывать или покупать?"}$tmj$::jsonb,
       'verdict'
FROM articles a WHERE a.slug = 'chto-vygodnee-majnit-ili-pokupat-kriptovalyutu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 21, 'paragraph',
       $tmj${"text":"Какой вывод следует сделать, отвечая на данный вопрос? Первый и ключевой фактор, влияющий на выбор – это время. И здесь можно назвать два хронометрических ориентира:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'chto-vygodnee-majnit-ili-pokupat-kriptovalyutu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 22, 'list',
       $tmj${"ordered":false,"items":["Время покупки актива (BTC или оборудования). Стоимость техники напрямую зависит от курса крипты, следовательно, оптимальное время для приобретения – медвежий рынок, когда цены минимальны;","Время продажи актива (как криптовалюты, так и техники). Выгодный период – растущий цикл, бычий ажиотаж и эйфория на рынке. Именно в это время вы можете выручить максимальную сумму от продажи."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'chto-vygodnee-majnit-ili-pokupat-kriptovalyutu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 23, 'paragraph',
       $tmj${"text":"Существует лишь один инструмент расчета выгоды от работы с криптоактивами – это калькулятор майнинга. Данный сервис поможет произвести грамотный расчет, опираясь на ключевые параметры: производитель техники, курс валюты, сложность майнинга, стоимость электроэнергии и т.д."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'chto-vygodnee-majnit-ili-pokupat-kriptovalyutu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 24, 'paragraph',
       $tmj${"text":"К слову, универсального ответа на вопрос, что выгоднее, майнинг или покупка крипты, не существует."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'chto-vygodnee-majnit-ili-pokupat-kriptovalyutu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 25, 'paragraph',
       $tmj${"text":"Ведь все зависит от индивидуальных условий, например, модели применяемого асика или даже стоимости электроэнергии в регионе добычи. Вооружитесь современным калькулятором, и вы сможете выбрать подходящий вариант заработка на рынке цифрового золота исключительно в вашем случае."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'chto-vygodnee-majnit-ili-pokupat-kriptovalyutu';

-- ---------------------------------------------------------------------
-- https://top-mining.ru/investiczii/razreshen-li-majning-v-rossii/
-- ---------------------------------------------------------------------

INSERT INTO articles (
    slug, title, title_subtitle, excerpt, content, topic_id,
    reading_time_min, reading_minutes, published_at, view_count,
    display_type, sort_order, is_published, uses_blocks,
    image_url, image_alt
) VALUES (
    'razreshen-li-majning-v-rossii',
    'Разрешен ли майнинг',
    'В России',
    $excerpt$Разрешен ли майнинг в России в 2024 году: правовой статус, налоги и коммерческий тариф на электричество.$excerpt$,
    $content$Как обстоят дела с легальностью майнинга в России? Ответ: разрешен при соблюдении статуса предпринимателя, уплаты налогов и коммерческого тарифа на электричество.$content$,
    'investments',
    5,
    5,
    '2024-05-27',
    363,
    'list',
    34,
    TRUE,
    TRUE,
    '/images/articles/mining-legal-russia/cover.jpg',
    'Разрешен ли майнинг в России'
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
WHERE a.slug = 'razreshen-li-majning-v-rossii'
  AND m.path = '/images/articles/mining-legal-russia/cover.jpg';

DELETE FROM article_blocks
WHERE article_id = (SELECT id FROM articles WHERE slug = 'razreshen-li-majning-v-rossii');

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 1, 'heading',
       $tmj${"level":2,"text":"Введение"}$tmj$::jsonb,
       'intro'
FROM articles a WHERE a.slug = 'razreshen-li-majning-v-rossii';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 2, 'paragraph',
       $tmj${"text":"Российские власти неустанно угрожают запретить криптовалюты, ограничить майнинг и ввести тотальный контроль за теми, кто пытается работать с цифровыми активами. Как обстоят дела сегодня? Постараемся ответить на вопрос, разрешен ли майнинг в России в 2024 году, и какие перспективы ждет данный вид деятельности в будущем."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'razreshen-li-majning-v-rossii';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 3, 'heading',
       $tmj${"level":2,"text":"Разрешен ли майнинг: действующее законодательство"}$tmj$::jsonb,
       'law'
FROM articles a WHERE a.slug = 'razreshen-li-majning-v-rossii';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 4, 'paragraph',
       $tmj${"text":"В настоящее время нормативно-правовые акты и положения, дающие понятие майнинговой деятельности и, соответственно, регулирующие данный процесс, отсутствуют. Ни в одном законе Российской Федерации не описано такое понятие, как «майнинг», поэтому процесс добычи с точки зрения законодательства вызывает споры у многих."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'razreshen-li-majning-v-rossii';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 5, 'paragraph',
       $tmj${"text":"Разрешен ли майнинг в России в 2024 году. На сегодняшний день ответ безальтернативный: разрешен. В первую очередь ввиду отсутствия запрета на законодательном уровне."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'razreshen-li-majning-v-rossii';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 6, 'image',
       $tmj${"src":"/images/articles/mining-legal-russia/img-1.jpg","alt":"Действующее законодательство о майнинге"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'razreshen-li-majning-v-rossii';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 7, 'paragraph',
       $tmj${"text":"При этом важно помнить три ключевых момента, которые позволяют добывать цифровое золото на основании законов России:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'razreshen-li-majning-v-rossii';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 8, 'list',
       $tmj${"ordered":false,"items":["Для занятия майнингом требуется наличие правового статуса, как и при осуществлении любой другой предпринимательской деятельности;","Доход, получаемый от добычи, облагается налогом;","Поскольку майнинг – это вид предпринимательства, оплачивать электричество придется по коммерческому тарифу."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'razreshen-li-majning-v-rossii';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 9, 'paragraph',
       $tmj${"text":"Рассмотрим каждый этот аспект в отдельности, чтобы максимально подробно ответить на вопрос, разрешен ли майнинг в России."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'razreshen-li-majning-v-rossii';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 10, 'heading',
       $tmj${"level":2,"text":"Правовой статус"}$tmj$::jsonb,
       'status'
FROM articles a WHERE a.slug = 'razreshen-li-majning-v-rossii';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 11, 'paragraph',
       $tmj${"text":"Чтобы заниматься майнингом законно и не беспокоиться о возможных санкциях со стороны властей, первым делом придется оформить статус индивидуального предпринимателя или самозанятого. Второй вариант является предпочтительным по трем причинам:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'razreshen-li-majning-v-rossii';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 12, 'list',
       $tmj${"ordered":false,"items":["Более низкий налог;","Отсутствие дополнительных социальных платежей;","Простая система регистрации, сопровождения бизнеса и уплаты налогов."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'razreshen-li-majning-v-rossii';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 13, 'paragraph',
       $tmj${"text":"Статус самозанятого оформляется в приложении «Мой налог», на Госуслугах или аккредитованном банке. Налоговые отчисления производятся автоматически путем удержания 4-6% от суммы поступлений на счет. Платежи в пенсионный фонд и страховые компании отсутствуют. В свою очередь, оформление статуса ИП потребует ведения бухгалтерской отчетности, уплаты налогов по ставке от 6% и дополнительных платежей в государственные органы (страхование и будущая пенсия)."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'razreshen-li-majning-v-rossii';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 14, 'heading',
       $tmj${"level":2,"text":"Уплата налогов"}$tmj$::jsonb,
       'taxes'
FROM articles a WHERE a.slug = 'razreshen-li-majning-v-rossii';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 15, 'paragraph',
       $tmj${"text":"Какой бы вариант ведения бизнеса не выбрал майнер (ИП или самозанятость), придется платить налоги. За отказ от выполнения таких платежей, неполные выплаты или просрочки предусмотрена уголовная ответственность, начиная от штрафов и заканчивая лишением свободы."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'razreshen-li-majning-v-rossii';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 16, 'paragraph',
       $tmj${"text":"Преимущество на стороне самозанятости, так как сумма налога автоматически удерживается со счета майнера."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'razreshen-li-majning-v-rossii';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 17, 'paragraph',
       $tmj${"text":"Правда, существует важное ограничение: если годовые доходы самозанятого превышают 2 400 000 рублей, придется оформлять ИП или разделять поступления от добычи между разными лицами. Это единственное ограничение, которое может ограничить использование формата самозанятости для официальной майнинговой деятельности."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'razreshen-li-majning-v-rossii';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 18, 'heading',
       $tmj${"level":2,"text":"Оплата электричества"}$tmj$::jsonb,
       'electricity'
FROM articles a WHERE a.slug = 'razreshen-li-majning-v-rossii';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 19, 'paragraph',
       $tmj${"text":"Подавляющее большинство частных майнеров используют общедоступные электрические сети и оплачивают счета по социальному тарифу. Это также не совсем корректно с точки зрения законодательства, так как для формата предпринимательской деятельности существуют свои условия – это, так называемый, коммерческий тариф."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'razreshen-li-majning-v-rossii';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 20, 'paragraph',
       $tmj${"text":"Примеры наказаний за использование тарифов для населения при майнинге реально существуют. Пока их количество исчисляется лишь десятками в год, но число фиксаций подобных правонарушений устойчиво растет."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'razreshen-li-majning-v-rossii';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 21, 'image',
       $tmj${"src":"/images/articles/mining-legal-russia/img-2.jpg","alt":"Оплата электричества при майнинге"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'razreshen-li-majning-v-rossii';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 22, 'paragraph',
       $tmj${"text":"Тарифы для бизнеса далеко не такие привлекательные, как в случае с «домашним» использованием или добычей криптовалют в гараже. Но с точки зрения полного следования действующему законодательству корректен именно коммерческий формат. Злоупотребления оперативно фиксируются энергетиками, так как любая ферма на асиках потребляет внушительный объем тока."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'razreshen-li-majning-v-rossii';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 23, 'heading',
       $tmj${"level":2,"text":"Разрешен ли майнинг в России: выводы"}$tmj$::jsonb,
       'conclusion'
FROM articles a WHERE a.slug = 'razreshen-li-majning-v-rossii';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 24, 'paragraph',
       $tmj${"text":"Отвечая на вопрос, разрешен ли майнинг в России, можно дать уверенный утвердительный ответ, но соблюдение закона возможно только в трех случаях."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'razreshen-li-majning-v-rossii';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 25, 'paragraph',
       $tmj${"text":"Вы добываете криптовалюту в формате предпринимательской деятельности (статус ИП или самозанятого), вовремя и в полном объеме платите налоги, а также задействуете для добычи коммерческий тариф на электричество."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'razreshen-li-majning-v-rossii';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 26, 'paragraph',
       $tmj${"text":"Только так майнинг абсолютно законен: можно чувствовать себя в полной правовой безопасности без каких-либо юридических тонкостей и возможной ответственности за незаконное ведение бизнеса в России."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'razreshen-li-majning-v-rossii';

-- ---------------------------------------------------------------------
-- https://top-mining.ru/investiczii/vyvod-deneg-s-majning-fermy-na-kartu/
-- ---------------------------------------------------------------------

INSERT INTO articles (
    slug, title, title_subtitle, excerpt, content, topic_id,
    reading_time_min, reading_minutes, published_at, view_count,
    display_type, sort_order, is_published, uses_blocks,
    image_url, image_alt
) VALUES (
    'vyvod-deneg-s-majning-fermy-na-kartu',
    'Вывод денег с майнинг фермы',
    'на карту',
    $excerpt$Как вывести деньги с майнинг-фермы на карту: пул → кошелек/биржа → обменник или P2P, плюсы и риски наличного вывода.$excerpt$,
    $content$Как осуществляется вывод денег с майнинг фермы: механизмы, тонкости и алгоритмы — от пула до карты или наличных.$content$,
    'investments',
    8,
    8,
    '2023-09-30',
    784,
    'list',
    35,
    TRUE,
    TRUE,
    '/images/articles/withdraw-mining-to-card/cover.jpg',
    'Вывод денег с майнинг фермы на карту'
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
WHERE a.slug = 'vyvod-deneg-s-majning-fermy-na-kartu'
  AND m.path = '/images/articles/withdraw-mining-to-card/cover.jpg';

DELETE FROM article_blocks
WHERE article_id = (SELECT id FROM articles WHERE slug = 'vyvod-deneg-s-majning-fermy-na-kartu');

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 1, 'heading',
       $tmj${"level":2,"text":"Введение"}$tmj$::jsonb,
       'intro'
FROM articles a WHERE a.slug = 'vyvod-deneg-s-majning-fermy-na-kartu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 2, 'paragraph',
       $tmj${"text":"Добыча цифровых активов – показательный пример современного бизнеса. В конечном итоге задача каждого инвестора – извлечение финансовой выгоды, поэтому вопрос вывода заработка в фиатную валюту очень важен. Важно помнить, что Биткоин и альткоины – это лишь виртуальный актив, который на финальной стадии процесса может конвертироваться в реальные денежные знаки. Узнаем, как осуществляется вывод денег с майнинг фермы: рассмотрим механизмы, выявим тонкости и проанализируем отдельные алгоритмы."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'vyvod-deneg-s-majning-fermy-na-kartu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 3, 'heading',
       $tmj${"level":2,"text":"Вывод денег с майнинга: алгоритм"}$tmj$::jsonb,
       'algorithm'
FROM articles a WHERE a.slug = 'vyvod-deneg-s-majning-fermy-na-kartu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 4, 'paragraph',
       $tmj${"text":"Большинство майнеров обладают совокупностью определенных материально технических средств, необходимых для работы. Это сама ферма, учетная запись в пуле, холодный или горячий кошелек, а также профиль на криптобирже. Без наличия хотя бы одного звена работа с цифровыми активами будет затруднительна. Все указанные средства задействованы в классическом алгоритме вывода:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'vyvod-deneg-s-majning-fermy-na-kartu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 5, 'list',
       $tmj${"ordered":false,"items":["Накопление средств на пуле;","Вывод актива с пула на биржу (или кошелек);","P2P-обмен на карту или прямой вывод наличных."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'vyvod-deneg-s-majning-fermy-na-kartu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 6, 'paragraph',
       $tmj${"text":"Как правило, этих трех шагов достаточно для проведения успешной операции по выводу полученных средств."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'vyvod-deneg-s-majning-fermy-na-kartu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 7, 'image',
       $tmj${"src":"/images/articles/withdraw-mining-to-card/img-1.jpg","alt":"Алгоритм вывода денег с майнинга"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'vyvod-deneg-s-majning-fermy-na-kartu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 8, 'paragraph',
       $tmj${"text":"Каждый этап следует рассмотреть в отдельности, чтобы произвести более глубокий анализ."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'vyvod-deneg-s-majning-fermy-na-kartu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 9, 'heading',
       $tmj${"level":2,"text":"Шаг 1: Аккумуляция криптовалюты в пуле"}$tmj$::jsonb,
       'step1'
FROM articles a WHERE a.slug = 'vyvod-deneg-s-majning-fermy-na-kartu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 10, 'paragraph',
       $tmj${"text":"Майнинг в одиночку – это, скорее, исключение из правил, поэтому многие участники отрасли используют сервисы совместной добычи. Так называемые пулы позволяют оперативно подключиться к процессу и получать свою долю, пропорциональную предоставленным мощностям."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'vyvod-deneg-s-majning-fermy-na-kartu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 11, 'paragraph',
       $tmj${"text":"Несмотря на схожий функционал, пулы отличаются друг от друга – каждый инструмент обладает своими особенностями и индивидуальными комиссиями."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'vyvod-deneg-s-majning-fermy-na-kartu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 12, 'paragraph',
       $tmj${"text":"Хранить заработанные средства можно и в учетной записи пула, однако аккумулировать большие объемы средств здесь не рекомендуется. Дело в том, что далеко не все площадки обладают должным уровнем защиты, не говоря уже о вероятности сворачивания проекта. Такие случаи встречаются на практике, когда майнер выбирает ненадежный пул и сталкивается с риском потерять свои средства."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'vyvod-deneg-s-majning-fermy-na-kartu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 13, 'paragraph',
       $tmj${"text":"Полному обзору популярных пулов мы посвятили отдельную статью."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'vyvod-deneg-s-majning-fermy-na-kartu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 14, 'heading',
       $tmj${"level":2,"text":"Шаг 2: Вывод средств с пула"}$tmj$::jsonb,
       'step2'
FROM articles a WHERE a.slug = 'vyvod-deneg-s-majning-fermy-na-kartu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 15, 'paragraph',
       $tmj${"text":"Рекомендуется периодически выводить средства с пула, либо настроить систему автоматического экспорта капитала – такую функцию предлагают многие инструменты."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'vyvod-deneg-s-majning-fermy-na-kartu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 16, 'paragraph',
       $tmj${"text":"Во время вывода пользователь может столкнуться с комиссиями. Например, у популярного сервиса ViaBTC сборы составляют 0.000248 BTC, что является достаточно существенным значением."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'vyvod-deneg-s-majning-fermy-na-kartu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 17, 'image',
       $tmj${"src":"/images/articles/withdraw-mining-to-card/img-2.jpg","alt":"Вывод средств с пула"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'vyvod-deneg-s-majning-fermy-na-kartu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 18, 'paragraph',
       $tmj${"text":"Существует лайфхак: средства предварительно выводятся на партнерскую биржу CoinEx (без комиссии), а уже затем с биржи на желаемый адрес. Вариантов вывода с пула несколько:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'vyvod-deneg-s-majning-fermy-na-kartu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 19, 'list',
       $tmj${"ordered":false,"items":["Холодный (физический) кошелек;","Горячий (программный) кошелек;","Биржа."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'vyvod-deneg-s-majning-fermy-na-kartu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 20, 'paragraph',
       $tmj${"text":"Выбор зависит от тактики работы криптоинвестора, а также желаемых целей. Механизм экспорта прост: следует указать адрес получателя и совершить транзакцию. Через некоторое время средства поступят на счет (кошелька или биржи). Для дополнительной защиты следует использовать все доступные механизмы – пароли, двухфакторная аутентификация, подтверждение транзакций и т.д."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'vyvod-deneg-s-majning-fermy-na-kartu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 21, 'heading',
       $tmj${"level":2,"text":"Шаг 3: Вывод денег с майнинг фермы на карту через обменники"}$tmj$::jsonb,
       'step3'
FROM articles a WHERE a.slug = 'vyvod-deneg-s-majning-fermy-na-kartu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 22, 'paragraph',
       $tmj${"text":"Получение средств на банковскую карту возможно при участии специализированных сервисов – обменников. Речь идет о профильных сайтах, предлагающих услуги вывода с удержанием комиссии. Порядок работы с такими инструментами следующий:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'vyvod-deneg-s-majning-fermy-na-kartu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 23, 'list',
       $tmj${"ordered":false,"items":["Выбор криптовалюты для вывода;","Выбор валюты и банковской карты для получения средств;","Перевод актива на счет обменника;","Получение средств на пластиковую карту."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'vyvod-deneg-s-majning-fermy-na-kartu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 24, 'paragraph',
       $tmj${"text":"Работа с такими проектами – всегда риск, так как обменник может прекратить свое существование в любой момент."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'vyvod-deneg-s-majning-fermy-na-kartu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 25, 'image',
       $tmj${"src":"/images/articles/withdraw-mining-to-card/img-3.jpg","alt":"Вывод через обменники на карту"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'vyvod-deneg-s-majning-fermy-na-kartu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 26, 'paragraph',
       $tmj${"text":"Именно поэтому следует взаимодействовать только с проверенными инструментами: наиболее популярные сервисы мы рассмотрели в профильном материале."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'vyvod-deneg-s-majning-fermy-na-kartu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 27, 'paragraph',
       $tmj${"text":"Существует и альтернативный формат обменных сервисов, когда сайт не обладает собственной ликвидностью, а выступает в роли посредника между участниками обмена."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'vyvod-deneg-s-majning-fermy-na-kartu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 28, 'paragraph',
       $tmj${"text":"Например, майнер хочет продать свои BTC и получить рубли на карту банка, а инвестор желает купить Биткоин, оплатив приобретение «пластиком». Процесс организуется на просторах обменного сервиса, где ресурс выполняет функции гаранта и регулятора. Здесь также существуют риски, так как помимо посредника (обменника) появляется еще и контрагент, о надежности и происхождении которого известно немногое."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'vyvod-deneg-s-majning-fermy-na-kartu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 29, 'paragraph',
       $tmj${"text":"Что еще следует помнить при работе с обменными сервисами:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'vyvod-deneg-s-majning-fermy-na-kartu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 30, 'list',
       $tmj${"ordered":false,"items":["Любые входящие транзакции на вашу карту – это риски. Прежде всего, вы получаете активы от незнакомых лиц, которые могут быть мошенниками и находиться в черных списках у банков;","Под прицелом финансовых регуляторов находятся комментарии платежа. Если там фигурируют упоминания криптовалюты, карту могут заблокировать;","В-третьих, необходимо соблюдать лимиты, иначе возникает высокая вероятность блокировки счета с необходимостью подтверждения законности получения средств. Сделать это в среде цифровых активов удается далеко не всегда;"]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'vyvod-deneg-s-majning-fermy-na-kartu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 31, 'paragraph',
       $tmj${"text":"Работа даже с самыми известными и проверенными обменными сервисами всегда сопряжена с рисками."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'vyvod-deneg-s-majning-fermy-na-kartu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 32, 'paragraph',
       $tmj${"text":"В мире криптовалют известны случаи обмана даже в исполнении крупнейших участников того или иного сектора. Именно поэтому следует знать еще об одном формате – это система P2P от крупных бирж. Здесь в роли гаранта и посредника выступает не локальный инструмент, а полноценный сервис, который может быть хорошо знаком не только майнерам, но и другим участникам криптовалютной индустрии."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'vyvod-deneg-s-majning-fermy-na-kartu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 33, 'heading',
       $tmj${"level":2,"text":"Альтернатива: наличный вывод денег с майнинга"}$tmj$::jsonb,
       'cash'
FROM articles a WHERE a.slug = 'vyvod-deneg-s-majning-fermy-na-kartu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 34, 'paragraph',
       $tmj${"text":"Помимо переводов на карту существует еще один способ вывода криптовалют – обмен на наличные. С одной стороны, данный формат лишен ряда недостатков использования пластиковой карты (транзакции производятся вне банковского сектора), но появляются другие риски. Например, необходимость личного посещения пункта обмена, получение и транспортировка внушительного объема наличности."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'vyvod-deneg-s-majning-fermy-na-kartu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 35, 'paragraph',
       $tmj${"text":"Ситуация напоминает историю с валютными обменами в 90-ых годах прошлого века, когда большое распространение получили «серые» обменники и частные спекулянты."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'vyvod-deneg-s-majning-fermy-na-kartu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 36, 'paragraph',
       $tmj${"text":"Компании с хорошей репутацией знают о существовании подобного недостатка в восприятии со стороны рынка. Поэтому успешные организации стремятся различными способами снизить объем негатива:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'vyvod-deneg-s-majning-fermy-na-kartu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 37, 'list',
       $tmj${"ordered":false,"items":["Предоставление возможности вывода денег с майнинг фермы без посещения офиса – курьер самостоятельно приедет к вам;","Аренда бронированного автомобиля для крупных клиентов;","Расположение в безопасных и проверенных местах. Например, в столичном регионе – это комплекс «Москва Сити»."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'vyvod-deneg-s-majning-fermy-na-kartu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 38, 'paragraph',
       $tmj${"text":"Работая с наличностью, необходимо оценивать все возможные риски и учитывать тонкости безопасного обращения цифровых и классических активов."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'vyvod-deneg-s-majning-fermy-na-kartu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 39, 'heading',
       $tmj${"level":2,"text":"Выводы"}$tmj$::jsonb,
       'conclusion'
FROM articles a WHERE a.slug = 'vyvod-deneg-s-majning-fermy-na-kartu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 40, 'paragraph',
       $tmj${"text":"Рано или поздно каждый инвестор сталкивается с задачей вывода денег с майнинга на карту. Это необходимо для фиксации прибыли, покупки нового оборудования или совершения любых других приобретений. Осуществить экспорт средств достаточно просто: сначала цифровые активы выводятся с пула на кошелек или биржу, а уже затем отправляются на карту пользователя через обменные сервисы или систему P2P. Также можно воспользоваться обменом на традиционные денежные знаки – для этих целей выбирайте проверенные сервисы с хорошей репутацией."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'vyvod-deneg-s-majning-fermy-na-kartu';
