SET client_encoding = 'UTF8';

-- =====================================================================
-- 041_tools_articles.sql
-- Инструменты и сервисы: 8 статей с production.
-- =====================================================================

INSERT INTO media_assets (path, alt, source)
VALUES
    ('/images/articles/articles-topmining/cover.jpg', 'Статьи о майнинге от TOP MINING', 'article_cover'),
    ('/images/articles/articles-topmining/img-1.jpg', 'Зачем нужен раздел статьи о майнинге', 'article'),
    ('/images/articles/articles-topmining/img-2.jpg', 'Структура раздела статьи', 'article'),
    ('/images/articles/articles-topmining/img-3.jpg', 'Почему статьи TOP MINING уникальны', 'article'),
    ('/images/articles/catalog-companies/cover.jpg', 'Каталог майнинг-компаний', 'article_cover'),
    ('/images/articles/catalog-companies/img-1.jpg', 'Продажа асиков в каталоге', 'article'),
    ('/images/articles/catalog-companies/img-2.jpg', 'Майнинг-отели в каталоге', 'article'),
    ('/images/articles/catalog-companies/img-3.jpg', 'Криптобиржи и кошельки', 'article'),
    ('/images/articles/catalog-companies/img-4.jpg', 'Мероприятия и экосистема каталога', 'article'),
    ('/images/articles/firmware-mining/cover.jpg', 'Прошивки для майнинга', 'article_cover'),
    ('/images/articles/firmware-mining/img-1.jpg', 'Как прошивки влияют на доходность', 'article'),
    ('/images/articles/firmware-mining/img-2.jpg', 'Риски кастомных прошивок', 'article'),
    ('/images/articles/emcd-pool/cover.jpg', 'Пул для майнинга Биткоина EMCD', 'article_cover'),
    ('/images/articles/emcd-pool/img-1.jpg', 'Обзор пула EMCD', 'article'),
    ('/images/articles/emcd-pool/img-2.jpg', 'Как настроить пул EMCD', 'article'),
    ('/images/articles/browser-mining/cover.jpg', 'Майнинг через сайт и браузеры', 'article_cover'),
    ('/images/articles/browser-mining/img-1.jpg', 'Что такое майнинг через браузеры', 'article'),
    ('/images/articles/browser-mining/img-2.jpg', 'Недостатки и масштабирование', 'article'),
    ('/images/articles/crypto-games/cover.jpg', 'Майнинг крипты: игры и программы', 'article_cover'),
    ('/images/articles/crypto-games/img-1.jpg', 'Программы-кликеры', 'article'),
    ('/images/articles/crypto-games/img-2.jpg', 'Физический майнинг на смартфоне', 'article'),
    ('/images/articles/crypto-games/img-3.jpg', 'GameFi и геймификация', 'article'),
    ('/images/articles/crypto-games/img-4.jpg', 'Награды за достижения', 'article'),
    ('/images/articles/crypto-games/img-5.jpg', 'Стейкинг и пирамиды', 'article'),
    ('/images/articles/mining-news-sources/cover.jpg', 'Где искать свежие новости про майнинг', 'article_cover'),
    ('/images/articles/mining-news-sources/img-1.jpg', 'Производители и дистрибьюторы', 'article'),
    ('/images/articles/mining-news-sources/img-2.jpg', 'Порталы и СМИ о майнинге', 'article'),
    ('/images/articles/calc-guide/cover.jpg', 'Инструкция по использованию онлайн-калькулятора', 'article_cover'),
    ('/images/articles/calc-guide/img-1.jpg', 'Пошаговая инструкция калькулятора', 'article'),
    ('/images/articles/calc-guide/img-2.jpg', 'Результат расчетов и выгода', 'article')
ON CONFLICT (path) DO UPDATE SET alt = EXCLUDED.alt;

-- https://top-mining.ru/instrumenty-i-servisy/stati-o-majninge-ot-top-mining-znanie-kak-instrument-pribyli/

INSERT INTO articles (
    slug, title, title_subtitle, excerpt, content, topic_id,
    reading_time_min, reading_minutes, published_at, view_count,
    display_type, sort_order, is_published, uses_blocks,
    image_url, image_alt
) VALUES (
    'stati-o-majninge-ot-top-mining-znanie-kak-instrument-pribyli',
    'Статьи о майнинге от TOP MINING',
    'Знание как инструмент прибыли',
    $excerpt$Раздел «Статьи о майнинге» на TOP MINING: как создаются материалы, шесть рубрик и как использовать знания на практике.$excerpt$,
    $content$Современный майнинг — отрасль на стыке энергетики, IT и финансов. Раздел «Статьи о майнинге» TOP MINING — база из 300+ материалов для решений в бизнесе и инфраструктуре.$content$,
    'tools',
    8,
    8,
    '2025-10-24',
    164,
    'list',
    41,
    TRUE,
    TRUE,
    '/images/articles/articles-topmining/cover.jpg',
    'Статьи о майнинге от TOP MINING'
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
WHERE a.slug = 'stati-o-majninge-ot-top-mining-znanie-kak-instrument-pribyli'
  AND m.path = '/images/articles/articles-topmining/cover.jpg';

DELETE FROM article_blocks
WHERE article_id = (SELECT id FROM articles WHERE slug = 'stati-o-majninge-ot-top-mining-znanie-kak-instrument-pribyli');

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 1, 'heading',
       $tmj${"level":2,"text":"Введение"}$tmj$::jsonb,
       'intro'
FROM articles a WHERE a.slug = 'stati-o-majninge-ot-top-mining-znanie-kak-instrument-pribyli';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 2, 'paragraph',
       $tmj${"text":"Современный майнинг – это больше, чем просто добыча криптовалют. Это отрасль, где пересекаются энергетика, IT, финансы, инженерия и юриспруденция. Чтобы не потеряться в этом потоке технологий, оборудования и новостей, важно иметь источник достоверной, глубокой и систематизированной информации."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'stati-o-majninge-ot-top-mining-znanie-kak-instrument-pribyli';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 3, 'paragraph',
       $tmj${"text":"Таким источником стал раздел «Статьи о майнинге» на платформе TOP MINING — крупнейший в России и СНГ медиа- и аналитический сервис, объединяющий знания и опыт участников криптоиндустрии."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'stati-o-majninge-ot-top-mining-znanie-kak-instrument-pribyli';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 4, 'paragraph',
       $tmj${"text":"Это не просто публикации — это информационная база, где собраны более 300 оригинальных статей, основанных на аналитике, тестах оборудования, интервью и практических кейсах из реальных дата-центров. Каждая статья здесь — не обзор ради кликов, а практическое руководство. Это знания, которые помогают принимать решения, строить бизнес и развивать инфраструктуру майнинга."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'stati-o-majninge-ot-top-mining-znanie-kak-instrument-pribyli';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 5, 'heading',
       $tmj${"level":2,"text":"Зачем нужен раздел «Статьи о майнинге»"}$tmj$::jsonb,
       'why'
FROM articles a WHERE a.slug = 'stati-o-majninge-ot-top-mining-znanie-kak-instrument-pribyli';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 6, 'paragraph',
       $tmj${"text":"Рынок цифровой добычи меняется ежемесячно: появляются новые модели асиков, обновляются алгоритмы, меняются тарифы на электричество и правила регулирования. В таких условиях без системного подхода невозможно ориентироваться в потоке информации."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'stati-o-majninge-ot-top-mining-znanie-kak-instrument-pribyli';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 7, 'paragraph',
       $tmj${"text":"Цель раздела — дать полную картину рынка, охватить его с технической, экономической и правовой сторон."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'stati-o-majninge-ot-top-mining-znanie-kak-instrument-pribyli';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 8, 'paragraph',
       $tmj${"text":"Редакция TOP MINING ставит перед собой задачу: перевести сложные вещи на понятный язык."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'stati-o-majninge-ot-top-mining-znanie-kak-instrument-pribyli';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 9, 'paragraph',
       $tmj${"text":"Здесь публикуются материалы:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'stati-o-majninge-ot-top-mining-znanie-kak-instrument-pribyli';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 10, 'list',
       $tmj${"ordered":false,"items":["о технологиях и новинках;","об опыте майнеров и компаний;","о способах повышения эффективности;","о легальном и безопасном майнинге;","о стратегиях инвестирования и оптимизации бизнеса."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'stati-o-majninge-ot-top-mining-znanie-kak-instrument-pribyli';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 11, 'paragraph',
       $tmj${"text":"Таким образом, «Статьи о майнинге» — это информационная платформа, объединяющая образование, аналитику и практику."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'stati-o-majninge-ot-top-mining-znanie-kak-instrument-pribyli';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 12, 'image',
       $tmj${"src":"/images/articles/articles-topmining/img-1.jpg","alt":"Зачем нужен раздел статьи о майнинге"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'stati-o-majninge-ot-top-mining-znanie-kak-instrument-pribyli';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 13, 'heading',
       $tmj${"level":2,"text":"Как создаются статьи TOP MINING"}$tmj$::jsonb,
       'how'
FROM articles a WHERE a.slug = 'stati-o-majninge-ot-top-mining-znanie-kak-instrument-pribyli';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 14, 'paragraph',
       $tmj${"text":"Редакция работает по принципу «от практики к аналитике». Каждая публикация начинается не с теории, а с наблюдения или реального запроса сообщества. Журналисты и аналитики собирают данные, проводят тесты оборудования, общаются с производителями, консультантами и владельцами ферм."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'stati-o-majninge-ot-top-mining-znanie-kak-instrument-pribyli';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 15, 'paragraph',
       $tmj${"text":"Процесс создания статьи включает:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'stati-o-majninge-ot-top-mining-znanie-kak-instrument-pribyli';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 16, 'rich_list',
       $tmj${"ordered":true,"items":[{"title":"Исследование","text":"сбор данных из официальных источников, форумов и опросов майнеров."},{"title":"Проверку информации","text":"сравнение характеристик оборудования и реальных показателей работы."},{"title":"Практическое тестирование","text":"использование устройств и сервисов в реальных условиях."},{"title":"Редакционную обработку","text":"адаптацию материала для разных уровней аудитории: от новичков до экспертов."},{"title":"Визуализацию и примеры","text":"добавление графиков, таблиц, калькуляторов и инфографики."}]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'stati-o-majninge-ot-top-mining-znanie-kak-instrument-pribyli';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 17, 'paragraph',
       $tmj${"text":"Многие публикации готовятся совместно с партнерами и экспертами отрасли, а часть статей базируется на данных из внутренней аналитической системы TOP MINING — рейтингах, каталогах и калькуляторах."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'stati-o-majninge-ot-top-mining-znanie-kak-instrument-pribyli';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 18, 'heading',
       $tmj${"level":2,"text":"Структура раздела: шесть тематических направлений"}$tmj$::jsonb,
       'structure'
FROM articles a WHERE a.slug = 'stati-o-majninge-ot-top-mining-znanie-kak-instrument-pribyli';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 19, 'paragraph',
       $tmj${"text":"Чтобы упростить навигацию, статьи разделены на шесть тематических рубрик, каждая из которых отвечает за свой аспект индустрии."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'stati-o-majninge-ot-top-mining-znanie-kak-instrument-pribyli';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 20, 'rich_list',
       $tmj${"ordered":true,"items":[{"title":"Все о майнинге","text":"Фундаментальный раздел: алгоритмы, блоки, хешрейт, типы оборудования. Примеры: «Что такое сложность майнинга Биткоина»; «Майнинговая ферма – что это?»."},{"title":"Инструменты и сервисы","text":"Обзоры прошивок, пулов, калькуляторов и кошельков. Ключевые статьи: калькулятор нового поколения, прошивки для майнинга."},{"title":"Инвестиции","text":"Рентабельность, налоги, окупаемость, кейсы масштабирования: налоги в России, аренда мощности, стоимость электричества, майнинг на газу."},{"title":"Новичкам","text":"Как начать майнить: выбор асика, расчёт прибыли, подключение к пулу, что делать с криптовалютой после добычи."},{"title":"Новости","text":"Законы, анонсы оборудования, конференции и тренды — от Blockchain Life в Дубае до The Trends в Москве."},{"title":"Пресс-релизы","text":"Официальные публикации компаний, производителей и проектов из первых рук."}]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'stati-o-majninge-ot-top-mining-znanie-kak-instrument-pribyli';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 21, 'image',
       $tmj${"src":"/images/articles/articles-topmining/img-2.jpg","alt":"Структура раздела статьи"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'stati-o-majninge-ot-top-mining-znanie-kak-instrument-pribyli';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 22, 'heading',
       $tmj${"level":2,"text":"Как использовать раздел на практике"}$tmj$::jsonb,
       'howto'
FROM articles a WHERE a.slug = 'stati-o-majninge-ot-top-mining-znanie-kak-instrument-pribyli';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 23, 'paragraph',
       $tmj${"text":"Раздел «Статьи о майнинге» — не просто библиотека, а навигатор по рынку:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'stati-o-majninge-ot-top-mining-znanie-kak-instrument-pribyli';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 24, 'list',
       $tmj${"ordered":false,"items":["Если вы выбираете оборудование — переходите к статьям об асиках, видеокартах и прошивках.","Если планируете запуск фермы — читайте публикации о вентиляции, охлаждении и энергоснабжении. Если хотите снизить риски — изучите материалы по налогам и легализации майнинга.","Если анализируете рынок — используйте аналитические обзоры и рейтинги, связанные со статьями.","Каждый текст связан с другими сервисами TOP MINING: каталогом компаний, рейтингами, калькулятором и агрегатором майнинг-отелей."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'stati-o-majninge-ot-top-mining-znanie-kak-instrument-pribyli';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 25, 'paragraph',
       $tmj${"text":"Это делает платформу единым экосервисом для майнера."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'stati-o-majninge-ot-top-mining-znanie-kak-instrument-pribyli';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 26, 'heading',
       $tmj${"level":2,"text":"Кому полезен этот раздел"}$tmj$::jsonb,
       'audience'
FROM articles a WHERE a.slug = 'stati-o-majninge-ot-top-mining-znanie-kak-instrument-pribyli';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 27, 'rich_list',
       $tmj${"ordered":true,"items":[{"title":"Майнерам","text":"для выбора оборудования, пулов и площадок."},{"title":"Инвесторам","text":"для анализа прибыльности и оценки трендов."},{"title":"Компаниям и интеграторам","text":"для сравнения решений и поиска партнеров."},{"title":"Новичкам","text":"для безопасного старта в криптодобыче."},{"title":"Медиа и аналитикам","text":"как источник достоверных данных и экспертизы."}]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'stati-o-majninge-ot-top-mining-znanie-kak-instrument-pribyli';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 28, 'heading',
       $tmj${"level":2,"text":"Почему статьи TOP MINING уникальны?"}$tmj$::jsonb,
       'unique'
FROM articles a WHERE a.slug = 'stati-o-majninge-ot-top-mining-znanie-kak-instrument-pribyli';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 29, 'rich_list',
       $tmj${"ordered":false,"items":[{"title":"Проверенные факты","text":"Все данные проходят двойную проверку редакцией и экспертами."},{"title":"Опыт из реальной практики","text":"Публикации основаны на работе действующих майнинговых компаний."},{"title":"Глубина анализа","text":"Каждая статья — это не пересказ новостей, а исследование с выводами."},{"title":"Связь с сервисами","text":"Материалы дополняют рейтинги, каталоги, пресс-релизы и калькуляторы."},{"title":"Постоянное обновление","text":"Новые статьи публикуются еженедельно, а старые — пересматриваются с учетом текущих реалий."}]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'stati-o-majninge-ot-top-mining-znanie-kak-instrument-pribyli';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 30, 'image',
       $tmj${"src":"/images/articles/articles-topmining/img-3.jpg","alt":"Почему статьи TOP MINING уникальны"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'stati-o-majninge-ot-top-mining-znanie-kak-instrument-pribyli';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 31, 'heading',
       $tmj${"level":2,"text":"Выводы"}$tmj$::jsonb,
       'conclusion'
FROM articles a WHERE a.slug = 'stati-o-majninge-ot-top-mining-znanie-kak-instrument-pribyli';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 32, 'paragraph',
       $tmj${"text":"Раздел «Статьи о майнинге» — это живая энциклопедия индустрии. Здесь можно найти все: от выбора оборудования и анализа электричества до кейсов по запуску ферм и прогнозов развития крипторынка."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'stati-o-majninge-ot-top-mining-znanie-kak-instrument-pribyli';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 33, 'paragraph',
       $tmj${"text":"TOP MINING делает знания понятными, актуальными и прикладными. Это место, где информация превращается в инструмент прибыли и роста."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'stati-o-majninge-ot-top-mining-znanie-kak-instrument-pribyli';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 34, 'paragraph',
       $tmj${"text":"Читая статьи TOP MINING, вы не просто узнаете новости — вы учитесь управлять своим майнингом как бизнесом."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'stati-o-majninge-ot-top-mining-znanie-kak-instrument-pribyli';

-- https://top-mining.ru/instrumenty-i-servisy/katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya/

INSERT INTO articles (
    slug, title, title_subtitle, excerpt, content, topic_id,
    reading_time_min, reading_minutes, published_at, view_count,
    display_type, sort_order, is_published, uses_blocks,
    image_url, image_alt
) VALUES (
    'katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya',
    'Каталог майнинг-компаний',
    'Как найти надежного партнера, оценить рынок и сэкономить время',
    $excerpt$Каталог TOP MINING: как выбрать поставщика ASIC, майнинг-отель, пул, биржу и сервис ремонта — фильтры, отзывы и проверка компаний.$excerpt$,
    $content$Майнинг — экосистема поставщиков, отелей, пулов и бирж. Каталог TOP MINING помогает найти проверенных партнёров и анализировать рынок.$content$,
    'tools',
    9,
    9,
    '2025-10-16',
    277,
    'list',
    42,
    TRUE,
    TRUE,
    '/images/articles/catalog-companies/cover.jpg',
    'Каталог майнинг-компаний'
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
WHERE a.slug = 'katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya'
  AND m.path = '/images/articles/catalog-companies/cover.jpg';

DELETE FROM article_blocks
WHERE article_id = (SELECT id FROM articles WHERE slug = 'katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya');

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 1, 'heading',
       $tmj${"level":2,"text":"Введение"}$tmj$::jsonb,
       'intro'
FROM articles a WHERE a.slug = 'katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 2, 'paragraph',
       $tmj${"text":"Майнинг – это не только оборудование и электричество. За каждым успешным проектом стоит целая экосистема: поставщики асиков, майнинг-отели, сервисы ремонта, пулы, биржи и десятки других игроков. Чтобы собрать все эти звенья в одну понятную систему, создан каталог компаний TOP MINING – крупнейшая в России база организаций, связанных с майнингом и криптовалютами."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 3, 'paragraph',
       $tmj${"text":"Каталог объединяет все направления индустрии, помогает быстро находить проверенных партнеров и анализировать рынок без потери времени. Это не просто список контактов – это инструмент для работы, где каждая компания прошла проверку и имеет подробную карточку с отзывами, характеристиками и фильтрами поиска."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 4, 'heading',
       $tmj${"level":2,"text":"Что такое каталог компаний TOP MINING"}$tmj$::jsonb,
       'what'
FROM articles a WHERE a.slug = 'katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 5, 'paragraph',
       $tmj${"text":"Каталог TOP MINING – это структурированная платформа, где собраны организации, предоставляющие товары и услуги для майнинга."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 6, 'paragraph',
       $tmj${"text":"Здесь можно:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 7, 'list',
       $tmj${"ordered":false,"items":["найти поставщика ASIC-оборудования с нужной моделью и условиями оплаты;","выбрать майнинг-отель под размещение ферм с учетом тарифа, мощности и региона;","подобрать компанию для ремонта асика;","изучить пулы, биржи, кошельки и прошивки;","следить за ключевыми событиями отрасли."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 8, 'paragraph',
       $tmj${"text":"В каталоге представлено более ста карточек компаний и 4500+ реальных отзывов клиентов, прошедших модерацию. Многие компании проходят верификацию через rusprofile и собственную проверку TOP MINING, что гарантирует достоверность данных."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 9, 'heading',
       $tmj${"level":2,"text":"1. Продажа асиков: где покупать оборудование без риска"}$tmj$::jsonb,
       'asic-sales'
FROM articles a WHERE a.slug = 'katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 10, 'paragraph',
       $tmj${"text":"Раздел «Продажа ASIC» – это база поставщиков оборудования для добычи криптовалют."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 11, 'paragraph',
       $tmj${"text":"В фильтрах можно задать:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 12, 'list',
       $tmj${"ordered":false,"items":["Список предоставляемых услуг (продажа, ремонт, отель);","Количество лет на рынке – чтобы отсеять непроверенные компании;","Локацию офиса и города доставки;","дополнительные условия оплаты и форму договора;","Модели асиков – для точного подбора оборудования."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 13, 'paragraph',
       $tmj${"text":"Каждая карточка содержит подробное описание, цены, фото, отзывы клиентов и отметку о проверке компанией TOP MINING. Это помогает избежать покупки у сомнительных продавцов и сразу оценить репутацию."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 14, 'image',
       $tmj${"src":"/images/articles/catalog-companies/img-1.jpg","alt":"Продажа асиков в каталоге"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 15, 'heading',
       $tmj${"level":2,"text":"2. Майнинг-отели: где выгоднее разместить оборудование"}$tmj$::jsonb,
       'hotels'
FROM articles a WHERE a.slug = 'katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 16, 'paragraph',
       $tmj${"text":"В разделе «Майнинг-отели» собраны компании, предлагающие хостинг ASIC-ферм."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 17, 'paragraph',
       $tmj${"text":"Фильтры включают:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 18, 'list',
       $tmj${"ordered":false,"items":["Локацию отеля,","Цену за установку одного ASIC,","Мощность площадки,","Тип электроэнергии (ветрогенератор, газогенерация, гидроэнергетика, теплоэнергетика или ядерная станция),","Минимальное количество ASIC для размещения,","Условия оплаты и форму договора."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 19, 'paragraph',
       $tmj${"text":"Карточки отелей содержат фото площадок, реальные отзывы, геометку на карте и отметку о проверке. Это особенно важно при выборе отеля на расстоянии: можно сразу понять, кому доверить оборудование."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 20, 'image',
       $tmj${"src":"/images/articles/catalog-companies/img-2.jpg","alt":"Майнинг-отели в каталоге"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 21, 'heading',
       $tmj${"level":2,"text":"3. Ремонт асиков: проверенные сервисы"}$tmj$::jsonb,
       'repair'
FROM articles a WHERE a.slug = 'katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 22, 'paragraph',
       $tmj${"text":"Раздел «Ремонт ASIC» включает сервисные центры и частные мастерские."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 23, 'paragraph',
       $tmj${"text":"Фильтры позволяют выбрать компанию по:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 24, 'list',
       $tmj${"ordered":false,"items":["Опыту работы,","Наличию дополнительных услуг (обслуживание майнинг-отелей, прошивка устройств),","Локации,","Условиям оплаты и договора."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 25, 'paragraph',
       $tmj${"text":"Пользователи могут сравнить цены, сроки и рейтинг компаний. А отзывы клиентов помогают понять, кто действительно решает проблемы, а кто только обещает."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 26, 'heading',
       $tmj${"level":2,"text":"4. Майнинг-пулы: где запустить стабильную добычу"}$tmj$::jsonb,
       'pools'
FROM articles a WHERE a.slug = 'katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 27, 'paragraph',
       $tmj${"text":"Раздел «Майнинг-пулы» – это инструмент для анализа площадок коллективного майнинга."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 28, 'paragraph',
       $tmj${"text":"Фильтры позволяют отобрать пулы по:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 29, 'list',
       $tmj${"ordered":false,"items":["Добываемым монетам,","Комиссии,","Общему хешрейту,","Минимальному лимиту выплат,","Периодичности начисления награды,","Способу распределения прибыли."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 30, 'paragraph',
       $tmj${"text":"Эти данные помогают выбрать пул с оптимальной доходностью и стабильными выплатами. Также указано, сколько лет компания работает на рынке, что помогает оценить её надежность."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 31, 'heading',
       $tmj${"level":2,"text":"5. Криптобиржи: где безопасно торговать"}$tmj$::jsonb,
       'exchanges'
FROM articles a WHERE a.slug = 'katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 32, 'paragraph',
       $tmj${"text":"Раздел «Криптобиржи» объединяет доступные пользователям площадки."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 33, 'paragraph',
       $tmj${"text":"Для выбора доступны фильтры:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 34, 'list',
       $tmj${"ordered":false,"items":["Юрисдикция,","Количество торговых пар и монет,","Наличие дополнительных функций,","Лет на рынке."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 35, 'paragraph',
       $tmj${"text":"Карточки бирж содержат описание, рейтинг, комиссию, скриншоты интерфейсов и отзывы пользователей – полезный инструмент для тех, кто ищет площадку под торговлю или ввод/вывод средств."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 36, 'image',
       $tmj${"src":"/images/articles/catalog-companies/img-3.jpg","alt":"Криптобиржи и кошельки"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 37, 'heading',
       $tmj${"level":2,"text":"6. Криптокошельки: хранение без лишнего риска"}$tmj$::jsonb,
       'wallets'
FROM articles a WHERE a.slug = 'katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 38, 'paragraph',
       $tmj${"text":"Раздел «Криптокошельки» включает как аппаратные, так и онлайн-решения."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 39, 'paragraph',
       $tmj${"text":"Фильтры позволяют отсортировать кошельки по:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 40, 'list',
       $tmj${"ordered":false,"items":["Поддержке NFT и монет,","Платформе,","Методу расчета комиссии,","Продолжительности работы."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 41, 'paragraph',
       $tmj${"text":"Это помогает подобрать кошелек под конкретные задачи – хранение, ежедневные операции или интеграцию с майнингом."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 42, 'heading',
       $tmj${"level":2,"text":"7. Производители асиков: кто стоит за железом"}$tmj$::jsonb,
       'makers'
FROM articles a WHERE a.slug = 'katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 43, 'paragraph',
       $tmj${"text":"В разделе «Производители асиков» собраны производители оборудования для майнинга – от крупных брендов до локальных фабрик."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 44, 'paragraph',
       $tmj${"text":"Фильтры включают:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 45, 'list',
       $tmj${"ordered":false,"items":["Поддерживаемые алгоритмы,","Количество моделей,","Лет на рынке."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 46, 'paragraph',
       $tmj${"text":"Это позволяет быстро сравнить бренды, изучить характеристики и найти официальных представителей."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 47, 'heading',
       $tmj${"level":2,"text":"8. Прошивки для асиков: оптимизация под доходность"}$tmj$::jsonb,
       'firmware'
FROM articles a WHERE a.slug = 'katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 48, 'paragraph',
       $tmj${"text":"Раздел «Прошивки для асиков» включает разработчиков и поставщиков альтернативных прошивок для асиков."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 49, 'paragraph',
       $tmj${"text":"Доступные фильтры:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 50, 'list',
       $tmj${"ordered":false,"items":["Производитель оборудования,","Локация офиса,","Условия оплаты,","Форма договора."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 51, 'paragraph',
       $tmj${"text":"Здесь можно найти решения, повышающие эффективность майнинга, снижающие энергопотребление и повышающие стабильность устройств."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 52, 'heading',
       $tmj${"level":2,"text":"9. Мероприятия: фокус на индустрии"}$tmj$::jsonb,
       'events'
FROM articles a WHERE a.slug = 'katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 53, 'paragraph',
       $tmj${"text":"Раздел «Мероприятия» включает отраслевые конференции, выставки, форумы и хакатоны."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 54, 'paragraph',
       $tmj${"text":"Фильтры позволяют искать события по:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 55, 'list',
       $tmj${"ordered":false,"items":["Году проведения,","Стране проведения,","Тегам (BUSINESS, COIN, CRYPTO, EDUCATION, HR, INVESTMENTS, MINING, TRADING),","Типу мероприятия (выставка, камерная встреча, конференция, саммит, форум)."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 56, 'paragraph',
       $tmj${"text":"Это помогает майнерам и предпринимателям быть в курсе актуальных событий, находить партнеров и инвесторов."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 57, 'image',
       $tmj${"src":"/images/articles/catalog-companies/img-4.jpg","alt":"Мероприятия и экосистема каталога"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 58, 'heading',
       $tmj${"level":2,"text":"Почему каталог TOP MINING – это больше, чем просто справочник?"}$tmj$::jsonb,
       'why-catalog'
FROM articles a WHERE a.slug = 'katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 59, 'paragraph',
       $tmj${"text":"Наш каталог – это не просто база данных, а рабочая платформа для анализа и выбора."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 60, 'paragraph',
       $tmj${"text":"Преимущества:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 61, 'list',
       $tmj${"ordered":false,"items":["Фильтры под любую задачу – находите компанию по нужным критериям, от географии до модели асика;","Проверка и модерация – все компании проходят аудит и верификацию;","Отзывы пользователей – более 4500 оценок помогают избежать ошибок при выборе;","Сравнение условий – возможность сравнить предложения и выбрать оптимальное;","Обновляемая база – каталог регулярно пополняется новыми организациями и актуальной информацией."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 62, 'heading',
       $tmj${"level":2,"text":"Как использовать каталог на практике"}$tmj$::jsonb,
       'practice'
FROM articles a WHERE a.slug = 'katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 63, 'list',
       $tmj${"ordered":false,"items":["Начинающим майнерам – чтобы выбрать оборудование и хостинг без риска.","Предпринимателям – для поиска партнеров и анализа конкурентов.","Инвесторам – чтобы понимать, какие игроки занимают ключевые позиции на рынке.","Маркетологам – для изучения рынка и построения стратегий продвижения."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 64, 'paragraph',
       $tmj${"text":"Каталог помогает сэкономить недели анализа и быстро собрать нужных подрядчиков в одном месте."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 65, 'heading',
       $tmj${"level":2,"text":"Выводы"}$tmj$::jsonb,
       'conclusion'
FROM articles a WHERE a.slug = 'katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 66, 'paragraph',
       $tmj${"text":"Каталог TOP MINING – это не просто инструмент для майнеров, а полноценная экосистема данных, которая объединяет все звенья рынка: от поставщиков оборудования до площадок хостинга, от разработчиков прошивок до криптобирж."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 67, 'paragraph',
       $tmj${"text":"Это пространство, где проверенная информация заменяет хаос, а поиск партнера превращается в осознанный выбор."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 68, 'paragraph',
       $tmj${"text":"TOP MINING помогает видеть рынок целиком, принимать решения на основе фактов и строить майнинг-проекты с максимальной эффективностью."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'katalog-majning-kompanij-kak-najti-nadezhnogo-partnera-oczenit-rynok-i-sekonomit-vremya';

-- https://top-mining.ru/instrumenty-i-servisy/proshivki-dlya-majninga-kak-zarabatyvat-bolshe/

INSERT INTO articles (
    slug, title, title_subtitle, excerpt, content, topic_id,
    reading_time_min, reading_minutes, published_at, view_count,
    display_type, sort_order, is_published, uses_blocks,
    image_url, image_alt
) VALUES (
    'proshivki-dlya-majninga-kak-zarabatyvat-bolshe',
    'Прошивки для майнинга',
    'Как зарабатывать больше?',
    $excerpt$Как кастомные прошивки для асиков повышают хешрейт, снижают расход электричества, какие риски учесть и как выбрать надёжное ПО.$excerpt$,
    $content$Прошивки для майнинга открывают разгон, андервольтинг и мониторинг асиков. Разбираем влияние на доходность, риски и критерии выбора.$content$,
    'tools',
    9,
    9,
    '2025-07-14',
    296,
    'list',
    43,
    TRUE,
    TRUE,
    '/images/articles/firmware-mining/cover.jpg',
    'Прошивки для майнинга'
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
WHERE a.slug = 'proshivki-dlya-majninga-kak-zarabatyvat-bolshe'
  AND m.path = '/images/articles/firmware-mining/cover.jpg';

DELETE FROM article_blocks
WHERE article_id = (SELECT id FROM articles WHERE slug = 'proshivki-dlya-majninga-kak-zarabatyvat-bolshe');

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 1, 'heading',
       $tmj${"level":2,"text":"Введение"}$tmj$::jsonb,
       'intro'
FROM articles a WHERE a.slug = 'proshivki-dlya-majninga-kak-zarabatyvat-bolshe';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 2, 'paragraph',
       $tmj${"text":"Современные майнеры понимают, что настоящая эффективность и прибыль приходят только к тем, кто умеет правильно настраивать оборудование и следить за всеми деталями. В этом ключевую роль играют прошивки для майнинга – специализированное ПО, которое открывает возможности для разгона, тонкой настройки и оптимизации работы асиков. Разберемся, как именно прошивки для асиков повышают доходность, на что обратить внимание при выборе и почему это не просто модный тренд, а инструмент профессионала."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'proshivki-dlya-majninga-kak-zarabatyvat-bolshe';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 3, 'heading',
       $tmj${"level":2,"text":"Что такое прошивка для майнинга и для чего она нужна?"}$tmj$::jsonb,
       'what'
FROM articles a WHERE a.slug = 'proshivki-dlya-majninga-kak-zarabatyvat-bolshe';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 4, 'paragraph',
       $tmj${"text":"Асик – это специализированное устройство для добычи криптовалют. По умолчанию любой асик поставляется с заводской прошивкой, созданной производителем для средней и стабильной работы. Однако такие «родные» прошивки для майнинга редко раскрывают весь потенциал устройства."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'proshivki-dlya-majninga-kak-zarabatyvat-bolshe';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 5, 'paragraph',
       $tmj${"text":"Именно поэтому владельцы всё чаще ищут, где скачать прошивки для асиков, разработанные независимыми командами или энтузиастами."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'proshivki-dlya-majninga-kak-zarabatyvat-bolshe';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 6, 'paragraph',
       $tmj${"text":"Эти прошивки позволяют:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'proshivki-dlya-majninga-kak-zarabatyvat-bolshe';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 7, 'list',
       $tmj${"ordered":false,"items":["Разгонять хешрейт, увеличивая скорость добычи;","Уменьшать энергопотребление при сохранении производительности;","Улучшать мониторинг и контроль за устройством;","Адаптировать работу под конкретные условия – например, высокую температуру в помещении или нестабильное электропитание."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'proshivki-dlya-majninga-kak-zarabatyvat-bolshe';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 8, 'paragraph',
       $tmj${"text":"В итоге, даже без покупки нового оборудования можно поднять доход и снизить издержки, используя лучшие прошивки для асиков."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'proshivki-dlya-majninga-kak-zarabatyvat-bolshe';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 9, 'heading',
       $tmj${"level":2,"text":"Как прошивки для майнинга влияют на доходность"}$tmj$::jsonb,
       'profit'
FROM articles a WHERE a.slug = 'proshivki-dlya-majninga-kak-zarabatyvat-bolshe';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 10, 'paragraph',
       $tmj${"text":"Экономика майнинга строится на тонком балансе между хешрейтом, энергопотреблением и стабильностью работы."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'proshivki-dlya-majninga-kak-zarabatyvat-bolshe';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 11, 'paragraph',
       $tmj${"text":"Прошивки для асиков помогают управлять всеми этими факторами."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'proshivki-dlya-majninga-kak-zarabatyvat-bolshe';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 12, 'rich_list',
       $tmj${"ordered":true,"items":[{"title":"Разгон и увеличение хешрейта","text":"Установка альтернативной прошивки часто позволяет увеличить хешрейт на 10–20% и больше. Например, асик с исходным хешрейтом 200 TH/s может работать на 210–240 TH/s, если грамотно настроить параметры;"},{"title":"Андервольтинг","text":"Снижение напряжения при сохранении производительности помогает сократить потребление электричества. При больших объемах майнинга это экономия десятков и даже сотен долларов в месяц;"},{"title":"Уменьшение простоев и сбоев","text":"Лучшие прошивки для асиков часто содержат улучшенные алгоритмы мониторинга и самодиагностики. Если одно устройство перегрелось или отключилось, владелец узнает об этом мгновенно и может быстро устранить проблему;"},{"title":"Гибкие профили работы","text":"Можно создавать разные режимы для зимы и лета, иммерсионного охлаждения или повышенной влажности. Такая гибкость повышает общую стабильность и уменьшает вероятность поломок."}]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'proshivki-dlya-majninga-kak-zarabatyvat-bolshe';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 13, 'image',
       $tmj${"src":"/images/articles/firmware-mining/img-1.jpg","alt":"Как прошивки влияют на доходность"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'proshivki-dlya-majninga-kak-zarabatyvat-bolshe';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 14, 'heading',
       $tmj${"level":2,"text":"Почему выгодно использовать прошивки для асиков?"}$tmj$::jsonb,
       'why'
FROM articles a WHERE a.slug = 'proshivki-dlya-majninga-kak-zarabatyvat-bolshe';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 15, 'paragraph',
       $tmj${"text":"Давайте посмотрим на реальные цифры. У вас есть асик с хешрейтом 190 TH/s и потреблением 3500 Вт (например, Antminer T21). При текущей стоимости электричества 4,72 рубля за кВт·ч расходы получаются немаленькие – около 397 рублей в сутки (3,5 кВт × 24 часа × 4,72 руб). В месяц это почти 12 000 рублей только на электричество."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'proshivki-dlya-majninga-kak-zarabatyvat-bolshe';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 16, 'paragraph',
       $tmj${"text":"Теперь представим, что вы решили скачать прошивки для асиков и поставили качественную кастомную версию."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'proshivki-dlya-majninga-kak-zarabatyvat-bolshe';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 17, 'paragraph',
       $tmj${"text":"Что это может дать:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'proshivki-dlya-majninga-kak-zarabatyvat-bolshe';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 18, 'list',
       $tmj${"ordered":false,"items":["За счет оптимизации и разгона реальный хешрейт может вырасти примерно на 10–15%, например, до 210–215 TH/s;","При этом правильный андервольтинг позволяет снизить энергопотребление с 3500 Вт до примерно 3200–3300 Вт без потери стабильности."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'proshivki-dlya-majninga-kak-zarabatyvat-bolshe';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 19, 'paragraph',
       $tmj${"text":"Что это значит для доходности?"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'proshivki-dlya-majninga-kak-zarabatyvat-bolshe';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 20, 'list',
       $tmj${"ordered":false,"items":["Дополнительные 20–25 TH/s повысят доход от добычи на те же 10–15%;","Одновременно экономия на электричестве составит примерно 200–250 рублей в сутки (разница между 3500 Вт и, например, 3200 Вт × 24 часа × 4,72 руб)."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'proshivki-dlya-majninga-kak-zarabatyvat-bolshe';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 21, 'paragraph',
       $tmj${"text":"В итоге только за счет установки лучшей прошивки для асиков можно дополнительно зарабатывать около 6-8 тысяч рублей в месяц (за счет разгона) и ещё сэкономить порядка 6 тысяч рублей на электроэнергии. За год это будет уже 140–170 тысяч рублей плюсом – без покупки нового оборудования, а только за счет грамотной настройки."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'proshivki-dlya-majninga-kak-zarabatyvat-bolshe';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 22, 'paragraph',
       $tmj${"text":"При этом, даже если скачать прошивки для асиков стоит денег, эти вложения окупаются буквально за пару месяцев работы. А дальше устройство продолжает работать эффективнее, снижая себестоимость каждого намайненного биткоина и увеличивая вашу чистую прибыль."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'proshivki-dlya-majninga-kak-zarabatyvat-bolshe';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 23, 'paragraph',
       $tmj${"text":"Вот почему установка продуманной прошивки – это не просто «хобби для энтузиастов», а реальный инструмент повышения доходности и конкурентного преимущества для каждого майнера."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'proshivki-dlya-majninga-kak-zarabatyvat-bolshe';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 24, 'heading',
       $tmj${"level":2,"text":"Риски и подводные камни"}$tmj$::jsonb,
       'risks'
FROM articles a WHERE a.slug = 'proshivki-dlya-majninga-kak-zarabatyvat-bolshe';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 25, 'paragraph',
       $tmj${"text":"Важно помнить: прошивки для майнинга – мощный инструмент, но только в руках того, кто понимает, что делает."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'proshivki-dlya-majninga-kak-zarabatyvat-bolshe';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 26, 'list',
       $tmj${"ordered":false,"items":["Гарантия: установка сторонней прошивки для асиков почти всегда лишает вас заводской гарантии;","Перегрев и поломки: неправильные настройки могут привести к перегреву чипов, повышенному износу вентиляторов или сгоранию платы;","Безопасность: не стоит скачивать файлы с подозрительных сайтов. Вредоносная прошивка может содержать майнер, который будет отчислять часть вашего дохода злоумышленникам или откроет доступ к управлению устройством."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'proshivki-dlya-majninga-kak-zarabatyvat-bolshe';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 27, 'paragraph',
       $tmj${"text":"Поэтому, выбирая, где скачать прошивки для асиков, отдавайте предпочтение только проверенным командам с репутацией и поддержкой."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'proshivki-dlya-majninga-kak-zarabatyvat-bolshe';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 28, 'image',
       $tmj${"src":"/images/articles/firmware-mining/img-2.jpg","alt":"Риски кастомных прошивок"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'proshivki-dlya-majninga-kak-zarabatyvat-bolshe';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 29, 'heading',
       $tmj${"level":2,"text":"Как выбрать лучшие прошивки для асиков?"}$tmj$::jsonb,
       'choose'
FROM articles a WHERE a.slug = 'proshivki-dlya-majninga-kak-zarabatyvat-bolshe';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 30, 'paragraph',
       $tmj${"text":"Чтобы найти по-настоящему лучшие прошивки для асиков, нужно обратить внимание на несколько факторов:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'proshivki-dlya-majninga-kak-zarabatyvat-bolshe';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 31, 'list',
       $tmj${"ordered":true,"items":["Репутация разработчика и отзывы пользователей.","Поддержка актуальных моделей асиков.","Возможность гибкой настройки (разгон, андервольтинг, профили).","Наличие обновлений и исправлений.","Наличие службы поддержки, которая поможет при настройке или сбоях."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'proshivki-dlya-majninga-kak-zarabatyvat-bolshe';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 32, 'paragraph',
       $tmj${"text":"Хорошая практика – сначала протестировать прошивку на одном устройстве и только после этого ставить на всю ферму."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'proshivki-dlya-majninga-kak-zarabatyvat-bolshe';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 33, 'heading',
       $tmj${"level":2,"text":"Технические возможности кастомных прошивок"}$tmj$::jsonb,
       'features'
FROM articles a WHERE a.slug = 'proshivki-dlya-majninga-kak-zarabatyvat-bolshe';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 34, 'paragraph',
       $tmj${"text":"Современные прошивки для майнинга могут не только увеличить доход, но и сделать работу с асиком удобнее:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'proshivki-dlya-majninga-kak-zarabatyvat-bolshe';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 35, 'list',
       $tmj${"ordered":false,"items":["Встроенный веб-интерфейс для мониторинга.","Настройка вентиляторов и систем охлаждения.","Автоматический перезапуск в случае ошибки.","Гибкая система уведомлений через Telegram или почту.","Учет и статистика работы асика за сутки, неделю и месяц."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'proshivki-dlya-majninga-kak-zarabatyvat-bolshe';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 36, 'paragraph',
       $tmj${"text":"Такие функции особенно ценят те, кто управляет не одним устройством, а большой фермой."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'proshivki-dlya-majninga-kak-zarabatyvat-bolshe';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 37, 'heading',
       $tmj${"level":2,"text":"Перспективы и будущее"}$tmj$::jsonb,
       'future'
FROM articles a WHERE a.slug = 'proshivki-dlya-majninga-kak-zarabatyvat-bolshe';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 38, 'paragraph',
       $tmj${"text":"С каждым годом требования к майнингу растут: увеличивается сложность сети, растут цены на электричество, а конкуренция становится жестче. Поэтому всё больше майнеров ищут, где скачать прошивки для асиков, чтобы оставаться в плюсе."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'proshivki-dlya-majninga-kak-zarabatyvat-bolshe';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 39, 'paragraph',
       $tmj${"text":"Тенденция следующая:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'proshivki-dlya-majninga-kak-zarabatyvat-bolshe';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 40, 'list',
       $tmj${"ordered":true,"items":["Рост числа разработчиков альтернативных прошивок.","Поддержка новых моделей асиков практически сразу после релиза.","Более сложные системы мониторинга и автоматизации.","Интеграция с облачными сервисами управления."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'proshivki-dlya-majninga-kak-zarabatyvat-bolshe';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 41, 'paragraph',
       $tmj${"text":"В будущем те, кто не использует лучшие прошивки для асиков, будут просто неконкурентоспособны."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'proshivki-dlya-majninga-kak-zarabatyvat-bolshe';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 42, 'heading',
       $tmj${"level":2,"text":"Выводы"}$tmj$::jsonb,
       'conclusion'
FROM articles a WHERE a.slug = 'proshivki-dlya-majninga-kak-zarabatyvat-bolshe';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 43, 'paragraph',
       $tmj${"text":"Прошивки для майнинга – это не просто «хак» или модное слово, а реальный инструмент увеличения доходности, снижения расходов и повышения стабильности работы. Если вы хотите получать максимум от своего оборудования, важно разбираться в прошивках и уметь ими пользоваться."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'proshivki-dlya-majninga-kak-zarabatyvat-bolshe';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 44, 'paragraph',
       $tmj${"text":"Помните: выбирайте лучшие прошивки для асиков, скачивайте только с проверенных сайтов и тестируйте каждое изменение. Тогда ваши устройства будут работать дольше, стабильнее и приносить больше прибыли даже в непростых условиях рынка."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'proshivki-dlya-majninga-kak-zarabatyvat-bolshe';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 45, 'paragraph',
       $tmj${"text":"ТОП прошивок для майнинга от независимых экспертов рынка майнинга."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'proshivki-dlya-majninga-kak-zarabatyvat-bolshe';

-- https://top-mining.ru/instrumenty-i-servisy/pul-dlya-majninga-bitkoina-emcd-znakomstvo-i-obzor/

INSERT INTO articles (
    slug, title, title_subtitle, excerpt, content, topic_id,
    reading_time_min, reading_minutes, published_at, view_count,
    display_type, sort_order, is_published, uses_blocks,
    image_url, image_alt
) VALUES (
    'pul-dlya-majninga-bitkoina-emcd-znakomstvo-i-obzor',
    'Пул для майнинга Биткоина EMCD',
    'Знакомство и обзор',
    $excerpt$Обзор пула EMCD: комиссии FPPS+ 1,5%, монеты, регистрация, отзывы, рефералка и Coinhold для майнеров из СНГ.$excerpt$,
    $content$Пул EMCD популярен в СНГ и входит в ТОП-10 по пользователям. Разбираем преимущества, комиссии, настройку и отзывы.$content$,
    'tools',
    7,
    7,
    '2024-03-10',
    428,
    'list',
    44,
    TRUE,
    TRUE,
    '/images/articles/emcd-pool/cover.jpg',
    'Пул для майнинга Биткоина EMCD'
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
WHERE a.slug = 'pul-dlya-majninga-bitkoina-emcd-znakomstvo-i-obzor'
  AND m.path = '/images/articles/emcd-pool/cover.jpg';

DELETE FROM article_blocks
WHERE article_id = (SELECT id FROM articles WHERE slug = 'pul-dlya-majninga-bitkoina-emcd-znakomstvo-i-obzor');

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 1, 'heading',
       $tmj${"level":2,"text":"Введение"}$tmj$::jsonb,
       'intro'
FROM articles a WHERE a.slug = 'pul-dlya-majninga-bitkoina-emcd-znakomstvo-i-obzor';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 2, 'paragraph',
       $tmj${"text":"Пул для майнинга EMCD хорошо знаком российским добытчикам криптовалют, так как в СНГ данный сервис пользуется уверенной популярностью. В мире ситуация не менее убедительная – проект входит в ТОП-10 по количеству пользователей среди всех инструментов совместной добычи цифровых активов. Публикуем честный обзор EMCD: познакомимся с проектом, узнаем о преимуществах и недостатках, оценим процесс регистрации и запуска, почитаем отзывы и выясним причины популярности пула в России."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'pul-dlya-majninga-bitkoina-emcd-znakomstvo-i-obzor';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 3, 'heading',
       $tmj${"level":2,"text":"Пул для майнинга Биткоина EMCD: обзор"}$tmj$::jsonb,
       'overview'
FROM articles a WHERE a.slug = 'pul-dlya-majninga-bitkoina-emcd-znakomstvo-i-obzor';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 4, 'paragraph',
       $tmj${"text":"Проект начал свою работу в 2018 году, штаб-квартира находится в Гонконге. Особенностью инструмента является его простота – здесь нет сложных технических решений и разнообразия выбора. Всего 1 алгоритм начисления награды, 7 монет, быстрая регистрация и простой интерфейс."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'pul-dlya-majninga-bitkoina-emcd-znakomstvo-i-obzor';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 5, 'paragraph',
       $tmj${"text":"Создается впечатление, что создатели пула EMCD планировали максимально упростить работу майнеров: по отзыву большинства пользователей, это им вполне удалось."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'pul-dlya-majninga-bitkoina-emcd-znakomstvo-i-obzor';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 6, 'paragraph',
       $tmj${"text":"Помимо простоты и легкости использования, сервис обладает другими важными особенностями:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'pul-dlya-majninga-bitkoina-emcd-znakomstvo-i-obzor';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 7, 'list',
       $tmj${"ordered":false,"items":["Возможность добычи семи популярных монет: BTC, BCH, LTC, DSC, ETC, DOGE, KAS. До переезда Эфириума на PoS, данный проект позволял добывать и ETH, однако после изменений в блокчейне от данного формата пришлось отказаться;","Инструмент предлагает только один способ начисления награды – FPPS+. С одной стороны, это ограничивает возможности пользователя, но с другой – большинству майнеров не принципиален данный выбор, поэтому наличие лишь одного формата избавляет от лишней головной боли;","EMCD – это не только пул для майнинга, но и совокупность других инструментов. Проект предлагает собственный кошелек, калькулятор доходности, сервис купли-продажи криптовалют P2P, услуги майнинг-отеля, а также систему пассивного дохода Coinhold. Каждый инструмент интересен по-своему и требует отдельного обзора;","Пул для майнинга EMCD задействует множество серверов в разных частях света – это необходимо для создания устойчивого соединения с минимальным пингом. Пользователь самостоятельно указывает свою локацию: Россия, Европа, США, Китай, Иран и Казахстан;","Пользователь способен увеличить производительность своей фермы благодаря применению прошивки от Vnish – ее можно скачать прямо на сайте пула. Оптимизация доступна для наиболее популярных асиков китайской фирмы BITMAIN – это модели Antminer S19, S19+, S19 Pro, S17, S17+, T17, T17+, L3+;","Наличие русскоязычной поддержки, что особенно важно для начинающих майнеров. Специалисты помогут осуществить подключение и ответят на все интересующие вопросы. Время ожидания помощи минимально;","Отсутствует минимальный порог вывода средств – отправлять можно любую сумму;","Есть мобильное приложение для Apple и Android, которое также отличается простотой работы и понятными логиками взаимодействия."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'pul-dlya-majninga-bitkoina-emcd-znakomstvo-i-obzor';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 8, 'paragraph',
       $tmj${"text":"Немаловажной особенностью сервиса является его лояльность к пользователям из СНГ даже в условиях санкций."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'pul-dlya-majninga-bitkoina-emcd-znakomstvo-i-obzor';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 9, 'paragraph',
       $tmj${"text":"Владельцы проекта неоднократно заявляли о том, что продолжат работу с российскими майнерами, так как любые запреты и ограничения в данной отрасли противоречат концепции честного блокчейна."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'pul-dlya-majninga-bitkoina-emcd-znakomstvo-i-obzor';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 10, 'image',
       $tmj${"src":"/images/articles/emcd-pool/img-1.jpg","alt":"Обзор пула EMCD"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'pul-dlya-majninga-bitkoina-emcd-znakomstvo-i-obzor';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 11, 'heading',
       $tmj${"level":2,"text":"Комиссии пула"}$tmj$::jsonb,
       'fees'
FROM articles a WHERE a.slug = 'pul-dlya-majninga-bitkoina-emcd-znakomstvo-i-obzor';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 12, 'paragraph',
       $tmj${"text":"Следуя политике абсолютной простоты и дружелюбного отношения к пользователю, пул предлагает фиксированную комиссию при добыче абсолютно любой монеты на FPPS+. Ставка составляет 1,5%, что является одним из наиболее низких значений в масштабах всей отрасли."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'pul-dlya-majninga-bitkoina-emcd-znakomstvo-i-obzor';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 13, 'paragraph',
       $tmj${"text":"Вывод средств возможен на внутренний и внешний кошельки, на карту банка, а также с использованием системы P2P."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'pul-dlya-majninga-bitkoina-emcd-znakomstvo-i-obzor';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 14, 'paragraph',
       $tmj${"text":"Это еще одна совокупность причин, почему пул пользуется популярностью среди майнеров из России и стран СНГ."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'pul-dlya-majninga-bitkoina-emcd-znakomstvo-i-obzor';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 15, 'heading',
       $tmj${"level":2,"text":"EMCD пул для майнинга: отзывы"}$tmj$::jsonb,
       'reviews'
FROM articles a WHERE a.slug = 'pul-dlya-majninga-bitkoina-emcd-znakomstvo-i-obzor';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 16, 'paragraph',
       $tmj${"text":"Детальный анализ отзывов позволяет сформировать положительное впечатление о сервисе. Пользователи отмечают более высокий доход по сравнению с конкурирующими разработками (возможной причиной является низкая комиссия), стабильную работу системы, хорошую поддержку, а также совокупность сопутствующих сервисов, которыми майнеры пользуются на практике."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'pul-dlya-majninga-bitkoina-emcd-znakomstvo-i-obzor';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 17, 'paragraph',
       $tmj${"text":"Редкие случаи негативной обратной связи имеют отношение к единичным случаям блокировки счета и проблемам с транзакциями. Подробности относительно данных историй отсутствуют, поэтому не исключена вероятность намеренной дезинформации со стороны конкурентов. Более того, широкого распространения и резонанса данные случаи не получили."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'pul-dlya-majninga-bitkoina-emcd-znakomstvo-i-obzor';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 18, 'heading',
       $tmj${"level":2,"text":"Как настроить пул для майнинга EMCD"}$tmj$::jsonb,
       'setup'
FROM articles a WHERE a.slug = 'pul-dlya-majninga-bitkoina-emcd-znakomstvo-i-obzor';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 19, 'paragraph',
       $tmj${"text":"Процесс регистрации и начала работы с пулом вновь соответствует концепции предельной простоты и интуитивности. Алгоритм выглядит следующим образом:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'pul-dlya-majninga-bitkoina-emcd-znakomstvo-i-obzor';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 20, 'list',
       $tmj${"ordered":true,"items":["Создание учетной записи на сайте https://emcd.io;","Подключение устройства: необходимо указать монету для майнинга и ближайшую локацию. Система автоматически подготовит технические параметры подключения – три адреса и имя воркера;","Данные параметры необходимо указать в панели управления асика, после чего устройство будет добывать криптовалюту на ваш кошелек."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'pul-dlya-majninga-bitkoina-emcd-znakomstvo-i-obzor';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 21, 'paragraph',
       $tmj${"text":"Пул для майнинга EMCD предлагает один из наиболее простых алгоритмов настройки и подключения в масштабах всей отрасли добычи криптовалют."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'pul-dlya-majninga-bitkoina-emcd-znakomstvo-i-obzor';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 22, 'paragraph',
       $tmj${"text":"Порядок действий понятен даже новичкам: трудности с началом работы встречаются крайне редко."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'pul-dlya-majninga-bitkoina-emcd-znakomstvo-i-obzor';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 23, 'image',
       $tmj${"src":"/images/articles/emcd-pool/img-2.jpg","alt":"Как настроить пул EMCD"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'pul-dlya-majninga-bitkoina-emcd-znakomstvo-i-obzor';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 24, 'heading',
       $tmj${"level":2,"text":"Максимизация прибыли на EMCD"}$tmj$::jsonb,
       'maximize'
FROM articles a WHERE a.slug = 'pul-dlya-majninga-bitkoina-emcd-znakomstvo-i-obzor';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 25, 'paragraph',
       $tmj${"text":"Существует несколько советов, как можно сделать работу на сервисе еще более привлекательной с точки зрения заработка:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'pul-dlya-majninga-bitkoina-emcd-znakomstvo-i-obzor';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 26, 'list',
       $tmj${"ordered":false,"items":["Использование реферальной программы. Как и во многих других проектах, связанных с криптовалютами, пул EMCD заинтересован в увеличении количества пользователей при помощи действующих клиентов. Привлекая рефералов, можно зарабатывать до 0.5% от их объемов, что станет ощутимой прибавкой к доходам;","Система пассивного заработка Coinhold. Актив, получаемый от майнинга, можно преумножать за счет системы стейкинга – доходность достигает 12% годовых. Ставка сравнима с банковскими вкладами;","Возможность получения специальных условий для больших ферм. Формат такого сотрудничества обсуждается индивидуально: речь идет о снижении комиссии сервиса, которая и без того находится на привлекательно низком уровне – 1,5%."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'pul-dlya-majninga-bitkoina-emcd-znakomstvo-i-obzor';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 27, 'paragraph',
       $tmj${"text":"Три базовых рекомендации по увеличению дохода от майнинга при помощи пула EMCD: воспользоваться первыми двумя возможностями способен абсолютно каждый криптоэнтузиаст вне зависимости от масштабов его фермы."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'pul-dlya-majninga-bitkoina-emcd-znakomstvo-i-obzor';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 28, 'heading',
       $tmj${"level":2,"text":"Выводы"}$tmj$::jsonb,
       'conclusion'
FROM articles a WHERE a.slug = 'pul-dlya-majninga-bitkoina-emcd-znakomstvo-i-obzor';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 29, 'paragraph',
       $tmj${"text":"Сервис EMCD вполне заслуженно занимает одну из лидирующих позиций в области добычи криптовалют пользователями из СНГ. Низкие комиссии, удобный вывод, хорошая репутация и предельная простота работы – все это привлекает майнеров со всего мира: количество аккаунтов уже превысило отметку 200 000, что является достойным показателем качества и надежности."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'pul-dlya-majninga-bitkoina-emcd-znakomstvo-i-obzor';

-- https://top-mining.ru/instrumenty-i-servisy/majning-cherez-sajt-i-brauzery-obzor-novogo-napravleniya/

INSERT INTO articles (
    slug, title, title_subtitle, excerpt, content, topic_id,
    reading_time_min, reading_minutes, published_at, view_count,
    display_type, sort_order, is_published, uses_blocks,
    image_url, image_alt
) VALUES (
    'majning-cherez-sajt-i-brauzery-obzor-novogo-napravleniya',
    'Майнинг через сайт и браузеры',
    'Обзор нового направления',
    $excerpt$Майнинг через браузеры (Grass, Nodepay): суть тренда AI-трафика, плюсы и минусы, масштабирование и перспективы.$excerpt$,
    $content$С середины 2024 года набрали популярность проекты вроде Grass и Nodepay: награды за интернет-трафик для обучения AI. Разбираем формат.$content$,
    'tools',
    8,
    8,
    '2025-01-28',
    565,
    'list',
    45,
    TRUE,
    TRUE,
    '/images/articles/browser-mining/cover.jpg',
    'Майнинг через сайт и браузеры'
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
WHERE a.slug = 'majning-cherez-sajt-i-brauzery-obzor-novogo-napravleniya'
  AND m.path = '/images/articles/browser-mining/cover.jpg';

DELETE FROM article_blocks
WHERE article_id = (SELECT id FROM articles WHERE slug = 'majning-cherez-sajt-i-brauzery-obzor-novogo-napravleniya');

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 1, 'heading',
       $tmj${"level":2,"text":"Введение"}$tmj$::jsonb,
       'intro'
FROM articles a WHERE a.slug = 'majning-cherez-sajt-i-brauzery-obzor-novogo-napravleniya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 2, 'paragraph',
       $tmj${"text":"В середине 2024 года появилось новое криптовалютное направление – майнинг через браузеры и сайты. Такие проекты как Grass и Nodepay запустили полноценный тренд, который затем был подхвачен десятками других площадок. Узнаем, в чем заключается суть подобного явления, какими преимуществами и недостатками обладает сегмент, а также познакомимся с перспективами данного течения."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-cherez-sajt-i-brauzery-obzor-novogo-napravleniya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 3, 'heading',
       $tmj${"level":2,"text":"Что такое майнинг через браузеры?"}$tmj$::jsonb,
       'what'
FROM articles a WHERE a.slug = 'majning-cherez-sajt-i-brauzery-obzor-novogo-napravleniya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 4, 'paragraph',
       $tmj${"text":"Первым проектом, предложившим подобный формат заработка, стала площадка Grass – начало было положено в середине 2024 года. Разработчики имеют прямое отношение к нейросетям и сегменту Ai, поэтому Grass предложил пользователям награды в обмен на их Интернет-трафик."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-cherez-sajt-i-brauzery-obzor-novogo-napravleniya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 5, 'paragraph',
       $tmj${"text":"Именно этот ресурс используется в процессе добычи токенов: не потенциал железа, не техническая начинка, а трафик."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-cherez-sajt-i-brauzery-obzor-novogo-napravleniya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 6, 'paragraph',
       $tmj${"text":"Биты и байты данных применяются для обучения искусственного интеллекта, что и стало основой подобного тренда. Для работы достаточно включить компьютер (или ноутбук), установить браузерное расширение (или отдельное приложение) и иметь стабильный онлайн. Обеспечивать работоспособность системы необходимо перманентно, так как объем наград пропорционален количеству активных часов."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-cherez-sajt-i-brauzery-obzor-novogo-napravleniya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 7, 'paragraph',
       $tmj${"text":"Модель оказалась настолько успешной, что подобные площадки начали появляться десятками."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-cherez-sajt-i-brauzery-obzor-novogo-napravleniya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 8, 'paragraph',
       $tmj${"text":"Процесс оказался выгоден всем участникам формата: разработчики получили доступ к внушительному массиву данных, а пользователи открыли формат пассивного заработка без каких-либо дополнительных инвестиций в сложное оборудование."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-cherez-sajt-i-brauzery-obzor-novogo-napravleniya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 9, 'image',
       $tmj${"src":"/images/articles/browser-mining/img-1.jpg","alt":"Что такое майнинг через браузеры"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-cherez-sajt-i-brauzery-obzor-novogo-napravleniya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 10, 'heading',
       $tmj${"level":2,"text":"Преимущества технологии"}$tmj$::jsonb,
       'pros'
FROM articles a WHERE a.slug = 'majning-cherez-sajt-i-brauzery-obzor-novogo-napravleniya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 11, 'paragraph',
       $tmj${"text":"Рассматривая сильные стороны формата майнинга через браузеры, необходимо учитывать интересы всех участников процесса. Первым делом оценим выигрыш самого пользователя, который участвует в процедуре:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-cherez-sajt-i-brauzery-obzor-novogo-napravleniya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 12, 'list',
       $tmj${"ordered":false,"items":["Абсолютно пассивный формат заработка, который предполагает базовые настройки и запуск в самом начале работы;","Для участия необходим только компьютер или ноутбук с доступом в Интернет. Приобретение дополнительных средств и аксессуаров не требуется;","Возможность масштабирования: задействовать в процессе можно все имеющие ПК и ноутбуки;","Одновременно можно запускать неограниченное число проектов – это не влияет на эффективность заработка;","Один из самых простых способов онбординга в мир криптовалют."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-cherez-sajt-i-brauzery-obzor-novogo-napravleniya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 13, 'paragraph',
       $tmj${"text":"Летом 2024 года формат майнинга через сайты оказался настоящим открытием: развитие сферы искусственного интеллекта запустило новое направление в работе криптоэнтузиастов."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-cherez-sajt-i-brauzery-obzor-novogo-napravleniya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 14, 'paragraph',
       $tmj${"text":"Если же рассматривать выгоды с точки зрения самих проектов (Grass, Nodepay и т.д.) здесь также есть свои преимущества:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-cherez-sajt-i-brauzery-obzor-novogo-napravleniya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 15, 'list',
       $tmj${"ordered":false,"items":["Возможность покупки реального трафика от пользователей со всего мира;","Отсутствие инвестиций в собственные вычислительные системы и комплексы;","Привлечение сторонних спонсоров за счет партнерства и смежных задач в приложениях."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-cherez-sajt-i-brauzery-obzor-novogo-napravleniya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 16, 'paragraph',
       $tmj${"text":"Проекту Grass принадлежит авторство над полноценным трендом, который прочно связывает мир Ai с криптовалютной индустрией за счет инновационного подхода."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-cherez-sajt-i-brauzery-obzor-novogo-napravleniya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 17, 'heading',
       $tmj${"level":2,"text":"Майнинг через браузеры: недостатки"}$tmj$::jsonb,
       'cons'
FROM articles a WHERE a.slug = 'majning-cherez-sajt-i-brauzery-obzor-novogo-napravleniya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 18, 'paragraph',
       $tmj${"text":"Как и в любом другом направлении, здесь также существуют свои нюансы и слабые стороны. Для пользователей это следующий перечень недостатков:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-cherez-sajt-i-brauzery-obzor-novogo-napravleniya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 19, 'list',
       $tmj${"ordered":false,"items":["Любое расширение для браузера и/или сторонняя программа, устанавливаемая на компьютер или ноутбук – это дополнительные риски. Всегда есть вероятность утечки личных данных, так как формат взаимодействия предполагает использование настоящего трафика пользователя;","Далеко не все проекты достойно награждают участников процесса. Заранее объем наград неизвестен: точная сумма становится понятной только после листинга проекта на бирже. От начала добычи до этого события могут пройти целые месяцы;","Компьютер, который участвует в процедуре, должен быть включенным 24/7, не говоря уже о важности организации качественного Интернет-соединения."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-cherez-sajt-i-brauzery-obzor-novogo-napravleniya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 20, 'paragraph',
       $tmj${"text":"Для разработчиков ПО в сфере искусственного интеллекта также есть недостатки при использовании подобного механизма получения трафика:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-cherez-sajt-i-brauzery-obzor-novogo-napravleniya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 21, 'list',
       $tmj${"ordered":false,"items":["Запуск ферм пользователями. Если это реальные компьютеры с настоящей деятельностью живого человека – такой трафик будет иметь ценность. Если же майнер запускает сотни удаленных серверов с помощью антидетект-браузеров, преследуя лишь цель заработка, качество подобной работы нельзя назвать оптимальным."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-cherez-sajt-i-brauzery-obzor-novogo-napravleniya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 22, 'paragraph',
       $tmj${"text":"Недостатки существуют, и их обязан знать каждый. В конечном итоге речь идет об информационной безопасности, поэтому решение об участии в том или ином проекте необходимо принимать индивидуально."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-cherez-sajt-i-brauzery-obzor-novogo-napravleniya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 23, 'image',
       $tmj${"src":"/images/articles/browser-mining/img-2.jpg","alt":"Недостатки и масштабирование"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-cherez-sajt-i-brauzery-obzor-novogo-napravleniya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 24, 'heading',
       $tmj${"level":2,"text":"Майнинг через сайты и браузеры: масштабирование"}$tmj$::jsonb,
       'scale'
FROM articles a WHERE a.slug = 'majning-cherez-sajt-i-brauzery-obzor-novogo-napravleniya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 25, 'paragraph',
       $tmj${"text":"Как уже отмечалось выше, процесс добычи токенов можно с легкостью масштабировать – для этих целей задействуются все имеющиеся в распоряжении компьютеры вместе с ноутбуками. Также реально запустить виртуальные серверы, купленные в удаленных дата-центрах."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-cherez-sajt-i-brauzery-obzor-novogo-napravleniya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 26, 'paragraph',
       $tmj${"text":"Проще говоря, пользователь оплачивает несколько виртуальных машин, на которых запускает процесс с разных аккаунтов."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-cherez-sajt-i-brauzery-obzor-novogo-napravleniya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 27, 'paragraph',
       $tmj${"text":"В результате объемы заработка множатся на количество активных сессий, что позволяет получить значительно больше наград. Однако подобный формат работы возможен только при соблюдении ряда условий, ведь самим Ai-проектам подобный способ получения трафика приемлем далеко не всегда. Вот какие рекомендации дают опытные владельцы ферм:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-cherez-sajt-i-brauzery-obzor-novogo-napravleniya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 28, 'list',
       $tmj${"ordered":false,"items":["Для каждого отдельного сервера необходимо иметь свой аккаунт;","Работа на серверах ведется в формате инкогнито: для этих целей необходимо использовать комплект прокси, а лучшим инструментом реализации является антидетект-браузеры;","Не стоит связывать аккаунты реферальными признаками, так как под бан может попасть вся сеть."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-cherez-sajt-i-brauzery-obzor-novogo-napravleniya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 29, 'paragraph',
       $tmj${"text":"Проекты научились вводить проверку систем на ботов, пройти которую удается далеко не всегда. Поэтому будьте готовы к тому, что не все аккаунты получат награды."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-cherez-sajt-i-brauzery-obzor-novogo-napravleniya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 30, 'paragraph',
       $tmj${"text":"Системы выявления так называемых «сибилов» (от англ. Sybil), то есть, владельцев множества учетных записей, сегодня становятся все более совершенными."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-cherez-sajt-i-brauzery-obzor-novogo-napravleniya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 31, 'paragraph',
       $tmj${"text":"Проекты заинтересованы в работе с реальными пользователями, вне зависимости от криптовалютного направления. Это актуально как для ретродропов, так и майнинга через браузеры и сайты, поэтому мультиаккаунтингу объявлена настоящая война."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-cherez-sajt-i-brauzery-obzor-novogo-napravleniya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 32, 'heading',
       $tmj${"level":2,"text":"Перспективы направления"}$tmj$::jsonb,
       'outlook'
FROM articles a WHERE a.slug = 'majning-cherez-sajt-i-brauzery-obzor-novogo-napravleniya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 33, 'paragraph',
       $tmj${"text":"Какова вероятность того, что это лишь временный тренд, как подобное произошло с тапалками и кликерами? Здесь ситуация более устойчивая, ведь сегмент Ai активно развивается. Это значит, что проекты продолжат нуждаться в качественном трафике для обучения нейросетей."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-cherez-sajt-i-brauzery-obzor-novogo-napravleniya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 34, 'paragraph',
       $tmj${"text":"Майнинг через браузеры и сайты станет постоянным направлением, однако, сопутствующие условия развития данного тренда могут измениться."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-cherez-sajt-i-brauzery-obzor-novogo-napravleniya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 35, 'paragraph',
       $tmj${"text":"Например, сократятся объемы наград, что также часто происходит в криптовалютном мире (щедро раздают лишь первые проекты). Кроме того, перспективы будут зависеть и от успехов борьбы с «сибилами». Однако учитывая наработки других криптовалютных платформ в этом направлении, высока вероятность того, что влияние мультиаккаунтеров будет сведено к минимуму."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-cherez-sajt-i-brauzery-obzor-novogo-napravleniya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 36, 'heading',
       $tmj${"level":2,"text":"Выводы"}$tmj$::jsonb,
       'conclusion'
FROM articles a WHERE a.slug = 'majning-cherez-sajt-i-brauzery-obzor-novogo-napravleniya';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 37, 'paragraph',
       $tmj${"text":"Майнинг через браузеры является полноценной сферой заработка с помощью предоставления своего трафика. Объемы можно масштабировать за счет подключения дополнительных компьютеров и ноутбуков, в то время как серьезные инвестиции для рядового пользователя не требуется. Но всегда следует учитывать риски, ведь в вашем трафике вполне может оказаться конфиденциальная информация, которая в конечном итоге окажется доступна сторонним лицам."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-cherez-sajt-i-brauzery-obzor-novogo-napravleniya';

-- https://top-mining.ru/instrumenty-i-servisy/majning-kripty-kakie-byvayut-igry-i-programmy/

INSERT INTO articles (
    slug, title, title_subtitle, excerpt, content, topic_id,
    reading_time_min, reading_minutes, published_at, view_count,
    display_type, sort_order, is_published, uses_blocks,
    image_url, image_alt
) VALUES (
    'majning-kripty-kakie-byvayut-igry-i-programmy',
    'Майнинг крипты',
    'Какие бывают игры и программы?',
    $excerpt$Кликеры, мобильный PoW, GameFi, награды за достижения, стейкинг и пирамиды: обзор жанров игр и программ для майнинга крипты.$excerpt$,
    $content$Игры и программы для майнинга крипты — от тапалок Notcoin до GameFi и стейкинга. Разбираем жанры, плюсы, минусы и риски.$content$,
    'tools',
    10,
    10,
    '2025-01-20',
    418,
    'list',
    46,
    TRUE,
    TRUE,
    '/images/articles/crypto-games/cover.jpg',
    'Майнинг крипты: игры и программы'
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
WHERE a.slug = 'majning-kripty-kakie-byvayut-igry-i-programmy'
  AND m.path = '/images/articles/crypto-games/cover.jpg';

DELETE FROM article_blocks
WHERE article_id = (SELECT id FROM articles WHERE slug = 'majning-kripty-kakie-byvayut-igry-i-programmy');

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 1, 'heading',
       $tmj${"level":2,"text":"Введение"}$tmj$::jsonb,
       'intro'
FROM articles a WHERE a.slug = 'majning-kripty-kakie-byvayut-igry-i-programmy';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 2, 'paragraph',
       $tmj${"text":"Работа с цифровыми активами при помощи игр и геймифицированных программ для разных платформ – достаточно известное явление на просторах мировой криптоиндустрии. Такие площадки, как Stepn, Notcoin и Hamster Combat известны каждому, даже если вы никогда не принимали личное участие в проектах подобного плана. Узнаем, какие игры про майнинг крипты существуют, на какие категории их можно разделить, а также насколько оправданной является идея начать свой заработок в каждой из рассмотренных ниш."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-kripty-kakie-byvayut-igry-i-programmy';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 3, 'heading',
       $tmj${"level":2,"text":"Майнинг крипты: программы кликеры"}$tmj$::jsonb,
       'clickers'
FROM articles a WHERE a.slug = 'majning-kripty-kakie-byvayut-igry-i-programmy';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 4, 'paragraph',
       $tmj${"text":"Начать следует с тренда, который появился относительно недавно – это кликеры для майнинга крипты, которые часто называют «тапалками». Основоположником является проект Notcoin, который был запущен 1 января 2024 года. Игровая механика предельно простая: необходимо кликать (тапать) по экрану мобильного телефона на монету и получать за это внутреннюю валюту. Для повышения эффективности целевых действий можно зарабатывать множители, а также проявлять социальную активность (подписки на рекламные каналы и профили)."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-kripty-kakie-byvayut-igry-i-programmy';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 5, 'paragraph',
       $tmj${"text":"Кстати, данная спонсорская механика является сопутствующей для любых форматов майнинг игр с криптой: все проекты привлекают инвестиции за счет такой рекламы."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-kripty-kakie-byvayut-igry-i-programmy';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 6, 'paragraph',
       $tmj${"text":"В конечном итоге Notcoin щедро наградил пользователей, которые проявили базовую заинтересованность: средний объем заработка всего за несколько месяцев таких незамысловатых игровых действий составил от 10 000 до 20 000 рублей. Активные пользователи заработали значительно больше – до 100 000 рублей. Впоследствии успех Notcoin пытались повторить сотни и даже тысячи других проектов, но никому не удалось продемонстрировать аналогичных результатов."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-kripty-kakie-byvayut-igry-i-programmy';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 7, 'paragraph',
       $tmj${"text":"Сводка по кликерам","html":"<table><thead><tr><th>Параметр</th><th>Значение</th></tr></thead><tbody><tr><td>Самые известные проекты</td><td>Notcoin, Tapswap</td></tr><tr><td>Сложность</td><td>1 из 5</td></tr><tr><td>Риски</td><td>1 из 5</td></tr><tr><td>Ресурсы</td><td>время</td></tr><tr><td>Оценка</td><td>2 из 5</td></tr></tbody></table>"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-kripty-kakie-byvayut-igry-i-programmy';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 8, 'paragraph',
       $tmj${"text":"Преимущества:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-kripty-kakie-byvayut-igry-i-programmy';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 9, 'list',
       $tmj${"ordered":false,"items":["Максимально простой геймплей, освоить который способен каждый;","Отсутствие других видов инвестирования, кроме собственного времени;","Совокупность разнообразных игр от множества разработчиков."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-kripty-kakie-byvayut-igry-i-programmy';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 10, 'paragraph',
       $tmj${"text":"Недостатки:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-kripty-kakie-byvayut-igry-i-programmy';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 11, 'list',
       $tmj${"ordered":false,"items":["Ощутимые награды получили только пользователи Notcoin;","Отсутствие гарантии результата по итогам нескольких месяцев действий."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-kripty-kakie-byvayut-igry-i-programmy';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 12, 'image',
       $tmj${"src":"/images/articles/crypto-games/img-1.jpg","alt":"Программы-кликеры"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-kripty-kakie-byvayut-igry-i-programmy';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 13, 'heading',
       $tmj${"level":2,"text":"Заработок крипты: программы физического майнинга"}$tmj$::jsonb,
       'mobile-pow'
FROM articles a WHERE a.slug = 'majning-kripty-kakie-byvayut-igry-i-programmy';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 14, 'paragraph',
       $tmj${"text":"Сегодня для добычи известных многим криптовалют используются процессоры, видеокарты, а также классические и домашние асики. Однако учитывая мощность современных мобильных устройств, нельзя забывать и о возможности работы с помощью смартфона, тем более, к концу 2024 года данный тренд снова стал популярным. Появилось множество проектов, которые используют техническую начинку смартфона или планшета для проведения вычислительных операций. Далее следует обмен результатов на внутренний токен проекта."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-kripty-kakie-byvayut-igry-i-programmy';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 15, 'paragraph',
       $tmj${"text":"Это можно назвать классической добычей: майнинг крипты через игру имитирует алгоритм Proof of Work."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-kripty-kakie-byvayut-igry-i-programmy';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 16, 'paragraph',
       $tmj${"text":"Разница заключается в том, что с помощью видеокарт и асиков добываются известные активы, которые уже представлены на биржах. А программы для телефонов только готовят листинг, который в конечном итоге может и не состояться. С другой стороны для работы не требуется покупка специального оборудования: запустить процесс можно с помощью смартфона, который сегодня есть у каждого. Конечно, возникают определенные риски перегрева и скорого выхода устройства из строя, но для новичков криптовалютного рынка – это проверенный инструмент заработка начального капитала."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-kripty-kakie-byvayut-igry-i-programmy';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 17, 'paragraph',
       $tmj${"text":"Сводка по физическому майнингу","html":"<table><thead><tr><th>Параметр</th><th>Значение</th></tr></thead><tbody><tr><td>Самые известные проекты</td><td>Memhash, fomo_hash, StarsHash, CUBE</td></tr><tr><td>Сложность</td><td>1 из 5</td></tr><tr><td>Риски</td><td>2 из 5</td></tr><tr><td>Ресурсы</td><td>время, потенциал устройств, железо</td></tr><tr><td>Оценка</td><td>2 из 5</td></tr></tbody></table>"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-kripty-kakie-byvayut-igry-i-programmy';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 18, 'paragraph',
       $tmj${"text":"Преимущества:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-kripty-kakie-byvayut-igry-i-programmy';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 19, 'list',
       $tmj${"ordered":false,"items":["Легкий старт, доступный каждому;","Минимальное участие пользователя;","Возможность параллельного запуска сразу нескольких приложений."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-kripty-kakie-byvayut-igry-i-programmy';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 20, 'paragraph',
       $tmj${"text":"Недостатки:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-kripty-kakie-byvayut-igry-i-programmy';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 21, 'list',
       $tmj${"ordered":false,"items":["Нагрев смартфона;","Снижение скорости и эффективности работы устройства;","Повышенная вероятность быстрого выхода из строя;","Сомнительные перспективы большинства платформ."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-kripty-kakie-byvayut-igry-i-programmy';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 22, 'image',
       $tmj${"src":"/images/articles/crypto-games/img-2.jpg","alt":"Физический майнинг на смартфоне"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-kripty-kakie-byvayut-igry-i-programmy';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 23, 'heading',
       $tmj${"level":2,"text":"Майнинг крипты: программы с геймификацией и игры"}$tmj$::jsonb,
       'gamefi'
FROM articles a WHERE a.slug = 'majning-kripty-kakie-byvayut-igry-i-programmy';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 24, 'paragraph',
       $tmj${"text":"Повышенный интерес человечества к играм и криптовалютам позволил объединить обе этих стихии в рамках одной сущности – GameFi. Речь идет о разнообразных играх, за прохождение которых можно зарабатывать внутреигровые токены или крипту, уже торгуемую на биржах. Перечень игр, жанров и тематик самый разнообразный, как и уровень графики, сюжет и геймплей. Это могут быть простые модели, например, Hamster Combat или BUMS, а также целые вселенные, например, Sandbox."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-kripty-kakie-byvayut-igry-i-programmy';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 25, 'paragraph',
       $tmj${"text":"Ключевая задача разработчиков – привлечь максимальное внимание со стороны геймеров, желающих не только «убить» время, но и заработать."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-kripty-kakie-byvayut-igry-i-programmy';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 26, 'paragraph',
       $tmj${"text":"Некоторые компании предлагают элементарные технологии и привлекают миллионы игроков за счет хайпа и грамотной работе с аудиторией. Другие разработчики предлагают увлекательные сюжеты, но их проекты проваливаются – именно так выглядит мир GameFi, где успех не гарантирован ни одному участнику."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-kripty-kakie-byvayut-igry-i-programmy';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 27, 'paragraph',
       $tmj${"text":"Сводка по GameFi","html":"<table><thead><tr><th>Параметр</th><th>Значение</th></tr></thead><tbody><tr><td>Самые известные проекты</td><td>Hamster Combat, BUMS, Stepn, Sandbox</td></tr><tr><td>Сложность</td><td>3 из 5</td></tr><tr><td>Риски</td><td>3 из 5</td></tr><tr><td>Ресурсы</td><td>время, реальные инвестиции</td></tr><tr><td>Оценка</td><td>2 из 5</td></tr></tbody></table>"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-kripty-kakie-byvayut-igry-i-programmy';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 28, 'paragraph',
       $tmj${"text":"Преимущества:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-kripty-kakie-byvayut-igry-i-programmy';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 29, 'list',
       $tmj${"ordered":false,"items":["Возможность заработка в процессе игры;","Увлекательный геймплей некоторых разработок;","Простой формат знакомства с криптовалютами."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-kripty-kakie-byvayut-igry-i-programmy';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 30, 'paragraph',
       $tmj${"text":"Недостатки:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-kripty-kakie-byvayut-igry-i-programmy';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 31, 'list',
       $tmj${"ordered":false,"items":["Помимо инвестиции личного времени некоторые площадки предлагают покупку бонусов за реальные деньги (например, кроссовки в Stepn);","Большое количество участников и всемирная известность не гарантирует заработка на проекте (пример – Hamster Combat);","Внушительное число мошеннических проектов, а также платформ для обогащения их создателей."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-kripty-kakie-byvayut-igry-i-programmy';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 32, 'image',
       $tmj${"src":"/images/articles/crypto-games/img-3.jpg","alt":"GameFi и геймификация"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-kripty-kakie-byvayut-igry-i-programmy';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 33, 'heading',
       $tmj${"level":2,"text":"Майнинг крипты: игры с наградами за достижения"}$tmj$::jsonb,
       'achievements'
FROM articles a WHERE a.slug = 'majning-kripty-kakie-byvayut-igry-i-programmy';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 34, 'paragraph',
       $tmj${"text":"Отстройка от привычных (и надоевших) многим форматов позволила появиться еще одному течению – это проекты с минимальной активностью пользователей, где ключевым фактором успеха является возраст аккаунта в Телеграм, наличие премиум-подписки, количество отправленных сообщений, успехи в предыдущих игровых проектах и т.д. Конечно, изолированно такой геймплей существовать не способен, поэтому площадки привлекают инвестиции за счет спонсоров. Это вынуждает игроков не просто ждать наград, а также совершать целевые действия, например, подписываться на социальные сети партнеров."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-kripty-kakie-byvayut-igry-i-programmy';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 35, 'paragraph',
       $tmj${"text":"С одной стороны, при любом сценарии пользователь сталкивается с минимальными рисками. Но с другой – далеко не все подобные проекты щедро награждают участников, что в конечном итоге разочаровывает многих. Однако данные программы для майнинга крипты все же существуют и занимают ощутимую долю рынка."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-kripty-kakie-byvayut-igry-i-programmy';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 36, 'paragraph',
       $tmj${"text":"Сводка по наградам за достижения","html":"<table><thead><tr><th>Параметр</th><th>Значение</th></tr></thead><tbody><tr><td>Самые известные проекты</td><td>Dogs, Cats, Paws</td></tr><tr><td>Сложность</td><td>1 из 5</td></tr><tr><td>Риски</td><td>1 из 5</td></tr><tr><td>Ресурсы</td><td>время</td></tr><tr><td>Оценка</td><td>2 из 5</td></tr></tbody></table>"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-kripty-kakie-byvayut-igry-i-programmy';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 37, 'paragraph',
       $tmj${"text":"Преимущества:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-kripty-kakie-byvayut-igry-i-programmy';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 38, 'list',
       $tmj${"ordered":false,"items":["Сложных и затратных по времени действий не требуется;","Предельная простота;","Возможность получения пассивного дохода за обычные повседневные действия."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-kripty-kakie-byvayut-igry-i-programmy';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 39, 'paragraph',
       $tmj${"text":"Недостатки:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-kripty-kakie-byvayut-igry-i-programmy';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 40, 'list',
       $tmj${"ordered":false,"items":["Небольшой объем наград;","Невозможность мультиаккинга (фиксируются реальные метрики – возраст аккаунта, наличие премиальной подписки и т.д.)"]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-kripty-kakie-byvayut-igry-i-programmy';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 41, 'image',
       $tmj${"src":"/images/articles/crypto-games/img-4.jpg","alt":"Награды за достижения"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-kripty-kakie-byvayut-igry-i-programmy';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 42, 'heading',
       $tmj${"level":2,"text":"Майнинг крипты: программы для доната и стейкинга"}$tmj$::jsonb,
       'staking'
FROM articles a WHERE a.slug = 'majning-kripty-kakie-byvayut-igry-i-programmy';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 43, 'paragraph',
       $tmj${"text":"Еще один тренд, который получил стремительное развитие к концу 2024 года – заработок за счет вложений реальных средств. В рамках серьезных проектов этот механизм получил название стейкинг, но логика актуальна и в игровой индустрии. Риски здесь ощутимо выше, но процесс более увлекательный, да и потенциал выше (несколько «иксов» к вложениям). Например, задонатив в проект определенную сумму, через несколько месяцев пользователь получает награды, кратно выше по стоимости, чем первоначальные вложения."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-kripty-kakie-byvayut-igry-i-programmy';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 44, 'paragraph',
       $tmj${"text":"При этом визуальная механика может быть различной: от предельно простых табличных форм до полноценных игр, в которые добавлены еще и экшн-механики."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-kripty-kakie-byvayut-igry-i-programmy';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 45, 'paragraph',
       $tmj${"text":"Подобный формат можно назвать традиционным механизмом стейкинга для масс-маркета: с красивыми экранами, игровыми сценариями и увлекательным процессом. К сожалению, далеко не все проекты позволяют даже вернуть вложенное – многое зависит от финансового плана и базовой сущности."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-kripty-kakie-byvayut-igry-i-programmy';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 46, 'paragraph',
       $tmj${"text":"Сводка по донату и стейкингу","html":"<table><thead><tr><th>Параметр</th><th>Значение</th></tr></thead><tbody><tr><td>Самые известные проекты</td><td>Catizen, Donot, TonStation, Earn, NotPixel</td></tr><tr><td>Сложность</td><td>2 из 5</td></tr><tr><td>Риски</td><td>3 из 5</td></tr><tr><td>Ресурсы</td><td>реальные средства</td></tr><tr><td>Оценка</td><td>2 из 5</td></tr></tbody></table>"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-kripty-kakie-byvayut-igry-i-programmy';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 47, 'paragraph',
       $tmj${"text":"Преимущества:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-kripty-kakie-byvayut-igry-i-programmy';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 48, 'list',
       $tmj${"ordered":false,"items":["Разнообразные игровые механики, объединенные одним принципом;","Возможность преумножить внесенный капитал;","Несколько вариантов инвестирования – от простых механик до более сложных форматов."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-kripty-kakie-byvayut-igry-i-programmy';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 49, 'paragraph',
       $tmj${"text":"Недостатки:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-kripty-kakie-byvayut-igry-i-programmy';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 50, 'list',
       $tmj${"ordered":false,"items":["Заморозка реальных средств;","Риски не вернуть вложенный капитал."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-kripty-kakie-byvayut-igry-i-programmy';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 51, 'image',
       $tmj${"src":"/images/articles/crypto-games/img-5.jpg","alt":"Стейкинг и пирамиды"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-kripty-kakie-byvayut-igry-i-programmy';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 52, 'heading',
       $tmj${"level":2,"text":"Майнинг крипты: программы-пирамиды"}$tmj$::jsonb,
       'pyramids'
FROM articles a WHERE a.slug = 'majning-kripty-kakie-byvayut-igry-i-programmy';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 53, 'paragraph',
       $tmj${"text":"Полноценной логикой классического майнинга это направление назвать нельзя, так как заработок участников осуществляется за счет инвестиций следующих пользователей. Но в любой пирамиде всегда есть те, кто зарабатывает, несмотря на более внушительное число потерявших свои деньги. Здесь имеет место максимальный риск, о котором следует помнить перед началом инвестирования."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-kripty-kakie-byvayut-igry-i-programmy';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 54, 'paragraph',
       $tmj${"text":"Ключевая трудность заключается в том, что отличить реальную платформу от пирамиды порой очень трудно."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-kripty-kakie-byvayut-igry-i-programmy';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 55, 'paragraph',
       $tmj${"text":"Проект может иметь инвестиции, команду, готовый продукт, но в конечном итоге оказаться лишь пирамидой в качественной упаковке. Более того, эти форматы часто обретают самый разнообразный вид – от привычных многим фармилок (с онлайн-счетчиками прироста вашей выгоды) до полноценных игр. Главная рекомендация при потенциальном знакомстве с подобными площадками – стараться избегать любого участия, каким бы перспективным не выглядел продукт."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-kripty-kakie-byvayut-igry-i-programmy';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 56, 'paragraph',
       $tmj${"text":"Сводка по пирамидам","html":"<table><thead><tr><th>Параметр</th><th>Значение</th></tr></thead><tbody><tr><td>Сложность</td><td>1 из 5</td></tr><tr><td>Риски</td><td>5 из 5</td></tr><tr><td>Ресурсы</td><td>реальные средства</td></tr><tr><td>Оценка</td><td>1 из 5</td></tr></tbody></table>"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-kripty-kakie-byvayut-igry-i-programmy';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 57, 'paragraph',
       $tmj${"text":"Преимущества:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-kripty-kakie-byvayut-igry-i-programmy';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 58, 'list',
       $tmj${"ordered":false,"items":["Первые участники, стоящие у основания, получают реальную выгоду."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-kripty-kakie-byvayut-igry-i-programmy';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 59, 'paragraph',
       $tmj${"text":"Недостатки:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-kripty-kakie-byvayut-igry-i-programmy';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 60, 'list',
       $tmj${"ordered":false,"items":["Высокая вероятность потери средств;","Сложности в том, чтобы отличить пирамиду от качественной площадки."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-kripty-kakie-byvayut-igry-i-programmy';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 61, 'heading',
       $tmj${"level":2,"text":"Выводы"}$tmj$::jsonb,
       'conclusion'
FROM articles a WHERE a.slug = 'majning-kripty-kakie-byvayut-igry-i-programmy';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 62, 'paragraph',
       $tmj${"text":"Игры про майнинг крипты – это множество разнообразных форматов, которые становятся полноценной индустрией и привлекают миллионы пользователей со всего мира. Ключевой особенностью сектора является его стремительное развитие, а также сочетание сразу несколько разновидностей программ в рамках одного проекта. Главная задача пользователя – грамотно выбрать возможную платформу, а также минимизировать собственные риски."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-kripty-kakie-byvayut-igry-i-programmy';

-- https://top-mining.ru/instrumenty-i-servisy/gde-iskat-svezhie-novosti-pro-majning-v-rossii-i-mire/

INSERT INTO articles (
    slug, title, title_subtitle, excerpt, content, topic_id,
    reading_time_min, reading_minutes, published_at, view_count,
    display_type, sort_order, is_published, uses_blocks,
    image_url, image_alt
) VALUES (
    'gde-iskat-svezhie-novosti-pro-majning-v-rossii-i-mire',
    'Где искать свежие новости про майнинг',
    'в России и мире',
    $excerpt$Производители, дистрибьюторы, криптомедиа и федеральные СМИ: где брать актуальные новости про майнинг в России и мире.$excerpt$,
    $content$Свежие данные о асиках и отрасли — конкурентное преимущество. Сравниваем источники: бренды, магазины, профильные порталы и общие СМИ.$content$,
    'tools',
    6,
    6,
    '2023-12-11',
    380,
    'list',
    47,
    TRUE,
    TRUE,
    '/images/articles/mining-news-sources/cover.jpg',
    'Где искать свежие новости про майнинг'
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
WHERE a.slug = 'gde-iskat-svezhie-novosti-pro-majning-v-rossii-i-mire'
  AND m.path = '/images/articles/mining-news-sources/cover.jpg';

DELETE FROM article_blocks
WHERE article_id = (SELECT id FROM articles WHERE slug = 'gde-iskat-svezhie-novosti-pro-majning-v-rossii-i-mire');

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 1, 'heading',
       $tmj${"level":2,"text":"Введение"}$tmj$::jsonb,
       'intro'
FROM articles a WHERE a.slug = 'gde-iskat-svezhie-novosti-pro-majning-v-rossii-i-mire';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 2, 'paragraph',
       $tmj${"text":"Своевременная и актуальная информация – один из ключевых ресурсов 21 века. Обладание свежими данными открывает перед человеком новые двери, предоставляет возможности и дарит шансы на достижение имеющихся целей. Криптовалюты и их добыча лишь подтверждают это правило – именно здесь владение знаниями позволяет выстраивать долгосрочную стратегию успешного заработка. Где искать информацию про асики на сегодня в России и мире? Ответим на этот часто задаваемый вопрос в подробном материале."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'gde-iskat-svezhie-novosti-pro-majning-v-rossii-i-mire';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 3, 'heading',
       $tmj${"level":2,"text":"Производители техники и оборудования"}$tmj$::jsonb,
       'makers'
FROM articles a WHERE a.slug = 'gde-iskat-svezhie-novosti-pro-majning-v-rossii-i-mire';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 4, 'paragraph',
       $tmj${"text":"Наиболее надежный источник свежих данных – подтвержденные ресурсы брендов техники. Именно пресс-служба самого бренда предоставляет проверенную информацию о дате выхода новых асиков, появлении свежих прошивок и разработке энергоэффективных устройств, которые могут поступить в продажу в ближайшие месяцы или годы."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'gde-iskat-svezhie-novosti-pro-majning-v-rossii-i-mire';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 5, 'paragraph',
       $tmj${"text":"Сайты и социальные сети таких компаний, как BITMAIN, MicroBT, Sunlune Technology, iPollo, Iceriver – самый качественный источник знаний."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'gde-iskat-svezhie-novosti-pro-majning-v-rossii-i-mire';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 6, 'paragraph',
       $tmj${"text":"Чтобы знать даты выхода новинок, а также иметь представление о технических особенностях, следует подписаться на социальные сети торговых марок, а также периодически посещать сайт бренда. Если имеются трудности с языковым барьером, всегда можно воспользоваться онлайн-переводчиками."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'gde-iskat-svezhie-novosti-pro-majning-v-rossii-i-mire';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 7, 'image',
       $tmj${"src":"/images/articles/mining-news-sources/img-1.jpg","alt":"Производители и дистрибьюторы"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'gde-iskat-svezhie-novosti-pro-majning-v-rossii-i-mire';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 8, 'heading',
       $tmj${"level":2,"text":"Продавцы и дистрибьюторы"}$tmj$::jsonb,
       'distributors'
FROM articles a WHERE a.slug = 'gde-iskat-svezhie-novosti-pro-majning-v-rossii-i-mire';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 9, 'paragraph',
       $tmj${"text":"Недостатком мониторинга инфоповодов на официальных сайтах производителя является сложность работы сразу с несколькими ресурсами. Именно поэтому действенной альтернативой являются новости про майнинг в России от крупнейших магазинов и дистрибьюторов."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'gde-iskat-svezhie-novosti-pro-majning-v-rossii-i-mire';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 10, 'paragraph',
       $tmj${"text":"Как правило, такие компании сотрудничают с ведущими брендами асиков. Пресс-служба всегда находится в курсе происходящего и стремится поделиться инсайдами с собственными клиентами."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'gde-iskat-svezhie-novosti-pro-majning-v-rossii-i-mire';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 11, 'paragraph',
       $tmj${"text":"На официальных сайтах и в социальных сетях дистрибьюторов можно найти актуальные инфоповоды:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'gde-iskat-svezhie-novosti-pro-majning-v-rossii-i-mire';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 12, 'list',
       $tmj${"ordered":false,"items":["Анонсы о появлении новых моделей асиков;","Подробности работы завода-изготовителя над мощными устройствами;","Данные об отгрузках и возможности покупки того или иного устройства в ближайшее время;","Анонсы в индустрии криптовалют в целом, например, изменения действующего законодательства, тарифные нововведения, ограничения и запреты."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'gde-iskat-svezhie-novosti-pro-majning-v-rossii-i-mire';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 13, 'paragraph',
       $tmj${"text":"Чтобы завладеть вниманием клиента, продавцы оборудования для добычи криптовалют стремятся сделать собственную новостную ленту полезной и интересной."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'gde-iskat-svezhie-novosti-pro-majning-v-rossii-i-mire';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 14, 'paragraph',
       $tmj${"text":"Это играет на руку покупателю, так как он получает возможность подписки на ленту. Однако есть и существенный недостаток: качество публикуемого материала зависит от уровня магазина и профессионализма пресс-службы. Если ведомство некачественно выполняет свою работу, читатели могут не узнать важные нюансы. Еще один негативный сценарий – заинтересованность магазина в продвижении техники определенного бренда. В данном случае преимущества такого производителя будут явно подчеркиваться, особенно на фоне недостатков техники конкурентов."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'gde-iskat-svezhie-novosti-pro-majning-v-rossii-i-mire';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 15, 'heading',
       $tmj${"level":2,"text":"Сайты и социальные сети про криптовалюты и их добычу"}$tmj$::jsonb,
       'crypto-media'
FROM articles a WHERE a.slug = 'gde-iskat-svezhie-novosti-pro-majning-v-rossii-i-mire';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 16, 'paragraph',
       $tmj${"text":"Уважения заслуживают порталы, а также профильные каналы по тематике криптовалют и работы с ними. Их преимущество – это нейтральное отношение к новостному фону. Как правило, подобные ресурсы не заинтересованы в продвижении того или иного бренда – мнение редакции нейтрально и независимо, что позволяет получать действительно своевременные новости про работу с криптовалютой."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'gde-iskat-svezhie-novosti-pro-majning-v-rossii-i-mire';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 17, 'paragraph',
       $tmj${"text":"Кроме того, помимо сегмента добычи, такие площадки освещают и смежные тематики, что также может быть полезным для владельца фермы."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'gde-iskat-svezhie-novosti-pro-majning-v-rossii-i-mire';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 18, 'paragraph',
       $tmj${"text":"Это могут быть новые законодательные нормы, появление выгодных форматов работы с криптовалютой, а также перспективные форматы заработка. Как правило, криптоэнтузиасты не ограничиваются одной лишь сферой добычи: работа с криптовалютами (трейдинг, дропы, инвестиции) их также интересует."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'gde-iskat-svezhie-novosti-pro-majning-v-rossii-i-mire';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 19, 'image',
       $tmj${"src":"/images/articles/mining-news-sources/img-2.jpg","alt":"Порталы и СМИ о майнинге"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'gde-iskat-svezhie-novosti-pro-majning-v-rossii-i-mire';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 20, 'heading',
       $tmj${"level":2,"text":"Порталы и сайты"}$tmj$::jsonb,
       'news-portals'
FROM articles a WHERE a.slug = 'gde-iskat-svezhie-novosti-pro-majning-v-rossii-i-mire';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 21, 'paragraph',
       $tmj${"text":"Еще один возможный источник свежей информации о заработке на цифровых активах сегодня – это общеновостные порталы, которые освещают буквально все происходящее в РФ и мире. Преимущества данного формата – это высокая степень распространенности, а также узнаваемость."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'gde-iskat-svezhie-novosti-pro-majning-v-rossii-i-mire';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 22, 'paragraph',
       $tmj${"text":"Однако следует помнить о вероятных рисках низкой экспертности: все же майнинг – это сложная техническая тематика, которая требует определенных знаний от журналистов."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'gde-iskat-svezhie-novosti-pro-majning-v-rossii-i-mire';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 23, 'paragraph',
       $tmj${"text":"Поэтому качество не всегда образцовое, не говоря уже о посредственной глубине проработки материала. Кроме того, новостные порталы не станут публиковать узкопрофильные поводы, например, о скором появлении нового асика, так как эта тематика не интересна широким массам. Поэтому читатель может пропустить важный анонс, если он черпает знания исключительно в федеральных СМИ."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'gde-iskat-svezhie-novosti-pro-majning-v-rossii-i-mire';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 24, 'heading',
       $tmj${"level":2,"text":"Выводы"}$tmj$::jsonb,
       'conclusion'
FROM articles a WHERE a.slug = 'gde-iskat-svezhie-novosti-pro-majning-v-rossii-i-mire';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 25, 'paragraph',
       $tmj${"text":"Планируете просто оставаться в курсе и знать ключевые новости про майнинг в России и мире на сегодня? Достаточно просто читать классические Интернет-СМИ. Более глубокая аналитика доступна посетителям порталов о майнинге и криптовалютах, а также подписчикам аналогичных социальных сетей. Хорошим вариантом является знакомство с плодами работы пресс-службы крупных магазинов и дистрибьюторов, однако, этот источник информации не может предложить полную нейтральность. И, наконец, самые проверенные и актуальные данные представлены на площадках самих производителей. Но качественный мониторинг таких ресурсов всегда сопряжен с тратой времени и необходимостью перевода оригинального текста на русский язык."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'gde-iskat-svezhie-novosti-pro-majning-v-rossii-i-mire';

-- https://top-mining.ru/instrumenty-i-servisy/instrukcziya-po-ispolzovaniyu-onlajn-kalkulyatora/

INSERT INTO articles (
    slug, title, title_subtitle, excerpt, content, topic_id,
    reading_time_min, reading_minutes, published_at, view_count,
    display_type, sort_order, is_published, uses_blocks,
    image_url, image_alt
) VALUES (
    'instrukcziya-po-ispolzovaniyu-onlajn-kalkulyatora',
    'Инструкция по использованию онлайн-калькулятора',
    '',
    $excerpt$Пошаговая инструкция по калькулятору майнинга: выбор асика и монеты, тариф, результат расчётов и нестандартные сценарии.$excerpt$,
    $content$Как пользоваться онлайн-калькулятором доходности майнинга: параметры ввода, автоподстановка метрик, чистая прибыль и прогнозы.$content$,
    'tools',
    7,
    7,
    '2023-10-18',
    368,
    'list',
    48,
    TRUE,
    TRUE,
    '/images/articles/calc-guide/cover.jpg',
    'Инструкция по использованию онлайн-калькулятора'
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
WHERE a.slug = 'instrukcziya-po-ispolzovaniyu-onlajn-kalkulyatora'
  AND m.path = '/images/articles/calc-guide/cover.jpg';

DELETE FROM article_blocks
WHERE article_id = (SELECT id FROM articles WHERE slug = 'instrukcziya-po-ispolzovaniyu-onlajn-kalkulyatora');

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 1, 'heading',
       $tmj${"level":2,"text":"Онлайн калькулятор майнинга: пошаговая инструкция"}$tmj$::jsonb,
       'howto'
FROM articles a WHERE a.slug = 'instrukcziya-po-ispolzovaniyu-onlajn-kalkulyatora';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 2, 'paragraph',
       $tmj${"text":"Алгоритм использования сервиса состоит из нескольких простых шагов:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'instrukcziya-po-ispolzovaniyu-onlajn-kalkulyatora';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 3, 'list',
       $tmj${"ordered":false,"items":["Выбор устройства. В выпадающем списке необходимо найти интересующую модель асика – мы постоянно дополняем базу новыми устройствами, чтобы сделать наш инструмент актуальным. Для ускорения процесса можно воспользоваться поиском – достаточно начать вводить в поисковой строке требуемое наименование;","Выбор монеты. В рамках каждого алгоритма можно добывать различные активы: на рынке представлено множество разнообразных вариантов – это как популярные токены, так и редкие альткоины;","Цены на оборудование и количество асиков. Подобное важно для калькуляции размера инвестиций и срока их возврата;","Стоимость электроэнергии. От указанной метрики зависит доход, который будет получать владелец фермы, а также период, необходимый для возврата инвестиций."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'instrukcziya-po-ispolzovaniyu-onlajn-kalkulyatora';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 4, 'paragraph',
       $tmj${"text":"Четыре указанных параметра являются индивидуальными: значения зависят от пользователя, поэтому их необходимо указать вручную."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'instrukcziya-po-ispolzovaniyu-onlajn-kalkulyatora';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 5, 'paragraph',
       $tmj${"text":"Остальные характеристики подставляются автоматически, в зависимости от указанных вами свойств:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'instrukcziya-po-ispolzovaniyu-onlajn-kalkulyatora';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 6, 'list',
       $tmj${"ordered":false,"items":["Хэшрейт – мощность указанной модели асика;","Потребление – количество расходуемого электричества;","Курс BTC по отношению к USD;","Курс USD по отношению к RUB;","Комиссия пула – процент от выручки, взимаемый сервисом за предоставление своих услуг;","Награда за блок – текущий объем BTC, получаемый за успешное вычисление блока;","Сложность сети – текущий хэшрейт, актуальный на день калькуляции."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'instrukcziya-po-ispolzovaniyu-onlajn-kalkulyatora';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 7, 'paragraph',
       $tmj${"text":"Все 7 опций устанавливаются по умолчанию: источником являются динамические базы нашего сервиса."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'instrukcziya-po-ispolzovaniyu-onlajn-kalkulyatora';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 8, 'paragraph',
       $tmj${"text":"В случае необходимости пользователь может изменить эти характеристики, указав интересующие его параметры."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'instrukcziya-po-ispolzovaniyu-onlajn-kalkulyatora';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 9, 'paragraph',
       $tmj${"text":"Это важно для проведения индивидуальных калькуляций по нестандартным сценариям. Однако для успешной работы и аналитики достаточно данных по умолчанию."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'instrukcziya-po-ispolzovaniyu-onlajn-kalkulyatora';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 10, 'image',
       $tmj${"src":"/images/articles/calc-guide/img-1.jpg","alt":"Пошаговая инструкция калькулятора"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'instrukcziya-po-ispolzovaniyu-onlajn-kalkulyatora';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 11, 'heading',
       $tmj${"level":2,"text":"Результат расчетов"}$tmj$::jsonb,
       'results'
FROM articles a WHERE a.slug = 'instrukcziya-po-ispolzovaniyu-onlajn-kalkulyatora';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 12, 'paragraph',
       $tmj${"text":"Итогом работы инструмента является ценная информация, состоящая из ключевых метрик:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'instrukcziya-po-ispolzovaniyu-onlajn-kalkulyatora';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 13, 'list',
       $tmj${"ordered":false,"items":["Объемы получаемого дохода в час, день, месяц и год;","Стоимость размещения – расходная часть, необходимая для оплаты электричества;","Срок окупаемости – период, требуемый для возврата вложений (с учетом цены на технику и затрат на электроэнергию);","Чистая прибыль – финальное значение рентабельности с учетом стоимости электричества."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'instrukcziya-po-ispolzovaniyu-onlajn-kalkulyatora';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 14, 'paragraph',
       $tmj${"text":"Таким образом, майнер получает совокупность всех требуемых значений для детального изучения рентабельности добычи: итоги можно вывести в BTC, рублях и американском долларе."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'instrukcziya-po-ispolzovaniyu-onlajn-kalkulyatora';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 15, 'paragraph',
       $tmj${"text":"Наш калькулятор майнинга Биткоина и альткоинов не только учитывает перечень вводных переменных, но и производит детальный анализ доходной части."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'instrukcziya-po-ispolzovaniyu-onlajn-kalkulyatora';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 16, 'paragraph',
       $tmj${"text":"Именно это отличает нас от большинства похожих разработок: мы помогаем проводить точный анализ на основе расширенного пула данных."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'instrukcziya-po-ispolzovaniyu-onlajn-kalkulyatora';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 17, 'image',
       $tmj${"src":"/images/articles/calc-guide/img-2.jpg","alt":"Результат расчетов и выгода"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'instrukcziya-po-ispolzovaniyu-onlajn-kalkulyatora';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 18, 'heading',
       $tmj${"level":2,"text":"Выгода от использования"}$tmj$::jsonb,
       'benefits'
FROM articles a WHERE a.slug = 'instrukcziya-po-ispolzovaniyu-onlajn-kalkulyatora';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 19, 'paragraph',
       $tmj${"text":"Используя сервис, майнер может рассчитывать на преимущества:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'instrukcziya-po-ispolzovaniyu-onlajn-kalkulyatora';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 20, 'list',
       $tmj${"ordered":false,"items":["Постоянно обновляющаяся база данных устройств: мы дополняем справочники современными моделями, чтобы пользователи могли производить наиболее точный и удобный расчет;","Возможность выбора алгоритма: рассчитываем прибыльность альтернативных токенов для поиска самых выгодных форматов и связок;","Функционал учета стоимости оборудования и количества приобретенной техники. Подобное позволяет учесть расходы не только на электричество, но и первоначальные вложения на покупку;","Возможность изменения хэшрейта и потребляемой мощности. Актуально в том случае, если вы не нашли свой асик в справочнике или КПД вашей аппаратуры отличается от заводских параметров (например, произведен разгон майнера или с годами асик утратил часть производительности);","Валютные колебания с учетом курса Биткоина и рубля. В рамках функционала можно производить разнообразные калькуляции;","Указание дополнительных метрик, например, комиссии пула, сложности добычи и награды за блок;","Расширенный результат аналитики: это не только размер ежемесячной выручки, но и расходная часть, а также срок окупаемости."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'instrukcziya-po-ispolzovaniyu-onlajn-kalkulyatora';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 21, 'paragraph',
       $tmj${"text":"Глубокий анализ и полнота данных отличают Miningcalculator.ru от альтернативных разработок. Наш инструмент действительно удобен и предлагает значительно более серьезный функционал в отличие от конкурентов."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'instrukcziya-po-ispolzovaniyu-onlajn-kalkulyatora';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 22, 'heading',
       $tmj${"level":2,"text":"Нестандартные сценарии"}$tmj$::jsonb,
       'scenarios'
FROM articles a WHERE a.slug = 'instrukcziya-po-ispolzovaniyu-onlajn-kalkulyatora';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 23, 'paragraph',
       $tmj${"text":"Чаще всего калькулятор доходности майнинга в рублях используют для определения суммы ежемесячной прибыли. В свою очередь, богатый функционал Miningcalculator.ru позволяет производить гораздо более глубокие расчеты для сложных задач:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'instrukcziya-po-ispolzovaniyu-onlajn-kalkulyatora';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 24, 'list',
       $tmj${"ordered":false,"items":["Возможность узнать рентабельность после халвинга. Для решения этой задачи можно вручную указать объем награды за блок, определяя рентабельность фермы в любой временной промежуток;","Потенциал разгона асика. Редактируемые значения мощности и энергопотребления позволяют изолироваться от заводских значений и учитывать обновленные технические параметры фермы;","Выбор лучшего пула. С помощью ручного указания комиссии пула пользователь получает возможность найти наиболее выгодную площадку, при использовании которой выручка окажется максимальной;","Прогнозирование. Ручной регулятор сложности сети помогает понять, какой объем доходов ожидается через месяц-два и любой другой промежуток времени. Зная прогнозируемый хэшрейт сети на основе статистических переменных, можно знакомиться с аналитикой рентабельности на ближайшее время;","Валютные эксперименты. Miningcalculator.ru позволяет изменять курс BTC к USD и USD к RUB. Данный механизм помогает понять, при каких объемах лучше продавать активы, чтобы добиться поставленной цели. Например, можно определить курс Биткоина, необходимый для полного возврата вложенных инвестиций;","Прогнозирование покупки для достижения интересующего уровня дохода. Вы можете рассчитать, сколько именно асиков потребуется для определенного заработка: эти метрики можно регулировать, дополнив чек-лист стоимостью фермы."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'instrukcziya-po-ispolzovaniyu-onlajn-kalkulyatora';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 25, 'paragraph',
       $tmj${"text":"Чтобы покупка фермы оказалась максимально выгодной, используйте современный калькулятор доходности."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'instrukcziya-po-ispolzovaniyu-onlajn-kalkulyatora';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 26, 'paragraph',
       $tmj${"text":"Чем детальней будет проведена аналитическая работа, тем более прогнозируемыми окажутся инвестиции в добычу цифровых активов."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'instrukcziya-po-ispolzovaniyu-onlajn-kalkulyatora';

-- Заглушка из 002 заменена production-статьёй с другим slug
UPDATE articles SET is_published = FALSE WHERE slug = 'top-mining-articles-knowledge';
