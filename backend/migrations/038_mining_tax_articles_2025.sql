SET client_encoding = 'UTF8';

-- =====================================================================
-- 038_mining_tax_articles_2025.sql
-- 1) Майнинг и налоги в России в 2025 году: новости от ФНС
--    https://top-mining.ru/mining/majning-v-nalogi-v-rossii-v-2025-godu-novosti-ot-fns/
-- 2) Сдача первой декларации по налогу на прибыль для юр. лиц
--    https://top-mining.ru/mining/sdacha-pervyj-deklaraczii-po-nalogu-na-pribyl-dlya-yur-licz-legalnyj-majning-v-rossii-v-2025-godu/
-- Статья «новые правила 2025» уже в 036_mining_rules_russia_2025_article.sql
-- =====================================================================

INSERT INTO media_assets (path, alt, source)
VALUES
    ('/images/articles/mining-taxes-fns-2025/cover.jpg', 'Майнинг и налоги в России в 2025 году', 'article_cover'),
    ('/images/articles/mining-taxes-fns-2025/quote-rates.jpg', 'Котировки ФНС для расчета налогов по майнингу', 'article'),
    ('/images/articles/mining-taxes-fns-2025/tax-rates.jpg', 'Ставки налога на майнинг в РФ', 'article'),
    ('/images/articles/mining-profit-tax-declaration-2025/cover.png', 'Декларация по налогу на прибыль для майнеров', 'article_cover'),
    ('/images/articles/mining-profit-tax-declaration-2025/fns-screenshot.jpg', 'Раздел ФНС для майнеров', 'article')
ON CONFLICT (path) DO UPDATE SET alt = EXCLUDED.alt;

-- ---------------------------------------------------------------------
-- Статья 1: новости от ФНС
-- ---------------------------------------------------------------------
INSERT INTO articles (
    slug, title, title_subtitle, excerpt, content, topic_id,
    reading_time_min, reading_minutes, published_at, view_count,
    display_type, sort_order, is_published, uses_blocks,
    image_url, image_alt
) VALUES (
    'majning-v-nalogi-v-rossii-v-2025-godu-novosti-ot-fns',
    'Майнинг в налоги в России в 2025 году',
    'Новости от ФНС',
    $excerpt$В 2025 году ФНС публикует котировки для расчета налогов по майнингу. Разбираем ставки НДФЛ и налога на прибыль, а также хронологию легализации майнинга в России.$excerpt$,
    $content$Введение

Регуляция майнинга в России набирает обороты: в 2025 году уточняются многие детали, которые еще совсем недавно рассматривались лишь гипотетически. В частности, определен порядок фиксации котировок для расчета налогов.

ФНС публикует данные на своем сайте для расчета налогов по майнингу в России

Теперь на сайте ФНС в специальном разделе можно найти актуальную информацию по криптовалютам для расчета налогов. У налогоплательщиков появилась возможность корректно рассчитывать доход от операций с криптовалютой.

Налог на майнинг в РФ: ставки

Размер и ставка налога на майнинг в России зависит от формата работы фермы.

Регуляция майнинга в России: как это было?

Формат, к которому власти страны приходят в 2024-2025 годах, является результатом многочисленных обсуждений, слухов и манипуляций.
$content$,
    'mining',
    5,
    5,
    '2025-04-14',
    819,
    'list',
    21,
    TRUE,
    TRUE,
    '/images/articles/mining-taxes-fns-2025/cover.jpg',
    'Майнинг и налоги в России в 2025 году'
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
WHERE a.slug = 'majning-v-nalogi-v-rossii-v-2025-godu-novosti-ot-fns'
  AND m.path = '/images/articles/mining-taxes-fns-2025/cover.jpg';

DELETE FROM article_blocks
WHERE article_id = (
    SELECT id FROM articles WHERE slug = 'majning-v-nalogi-v-rossii-v-2025-godu-novosti-ot-fns'
);

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 1, 'heading', '{"level":2,"text":"Введение"}'::jsonb, 'intro'
FROM articles a WHERE a.slug = 'majning-v-nalogi-v-rossii-v-2025-godu-novosti-ot-fns';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 2, 'paragraph',
       $tmj${"text":"Регуляция майнинга в России набирает обороты: в 2025 году уточняются многие детали, которые еще совсем недавно рассматривались лишь гипотетически. В частности, определен порядок фиксации котировок для расчета налогов."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-v-nalogi-v-rossii-v-2025-godu-novosti-ot-fns';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 3, 'heading',
       '{"level":2,"text":"ФНС публикует данные на своем сайте для расчета налогов по майнингу в России"}'::jsonb,
       'fns-data'
FROM articles a WHERE a.slug = 'majning-v-nalogi-v-rossii-v-2025-godu-novosti-ot-fns';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 4, 'paragraph',
       $tmj${"text":"Теперь на сайте ФНС в специальном разделе можно найти актуальную информацию по криптовалютам для расчета налогов. У налогоплательщиков появилась возможность корректно рассчитывать доход от операций с криптовалютой.","html":"Теперь на <a href=\"https://www.nalog.gov.ru/mining/\">сайте ФНС в специальном разделе</a> можно найти актуальную информацию по криптовалютам для расчета налогов. У налогоплательщиков появилась возможность корректно рассчитывать доход от операций с криптовалютой."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-v-nalogi-v-rossii-v-2025-godu-novosti-ot-fns';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 5, 'paragraph',
       $tmj${"text":"Каким образом выглядят особенности процесса налоговых отчислений:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-v-nalogi-v-rossii-v-2025-godu-novosti-ot-fns';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 6, 'list',
       $tmj${"ordered":false,"items":["Доход рассчитывается по рыночной цене на дату получения права распоряжения криптовалютой;","Рыночная котировка – это цена закрытия с биржи: можно использовать один из нескольких вариантов площадок на выбор (Binance, ByBit, Gate, HTX, KuCoin, MEXC, OKX);","На этой же странице представлены сопутствующие сервисы для майнеров, например, возможность внести данные в реестр, познакомиться с правилами легальной работы, получить ответы на часто задаваемые вопросы."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-v-nalogi-v-rossii-v-2025-godu-novosti-ot-fns';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 7, 'paragraph',
       $tmj${"text":"Оплата налогов на майнинг в России является обязательным требованием к осуществлению легальной деятельности."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-v-nalogi-v-rossii-v-2025-godu-novosti-ot-fns';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 8, 'paragraph',
       $tmj${"text":"То, о чем говорили несколько лет, постепенно становится реальностью и внедряется на практике в рамках системы регуляции."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-v-nalogi-v-rossii-v-2025-godu-novosti-ot-fns';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 9, 'image',
       $tmj${"src":"/images/articles/mining-taxes-fns-2025/quote-rates.jpg","alt":"Котировки ФНС для расчета налогов по майнингу"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-v-nalogi-v-rossii-v-2025-godu-novosti-ot-fns';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 10, 'heading',
       '{"level":2,"text":"Налог на майнинг в РФ: ставки"}'::jsonb,
       'tax-rates'
FROM articles a WHERE a.slug = 'majning-v-nalogi-v-rossii-v-2025-godu-novosti-ot-fns';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 11, 'paragraph',
       $tmj${"text":"Размер и ставка налога на майнинг в России зависит от формата работы фермы. Существует два варианта:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-v-nalogi-v-rossii-v-2025-godu-novosti-ot-fns';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 12, 'list',
       $tmj${"ordered":false,"items":["Для физических лиц: НДФЛ в размере 13% (при доходе до 2 400 000 рублей в год) и 15% (при доходе свыше 2 400 000 в год);","Для юридических лиц: налог на прибыль – 25% с 2025 года."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-v-nalogi-v-rossii-v-2025-godu-novosti-ot-fns';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 13, 'paragraph',
       $tmj${"text":"При этом, майнинговая деятельность в формате самозанятого, а также в рамках упрощенной системы налогообложения запрещается."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-v-nalogi-v-rossii-v-2025-godu-novosti-ot-fns';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 14, 'image',
       $tmj${"src":"/images/articles/mining-taxes-fns-2025/tax-rates.jpg","alt":"Ставки налога на майнинг в РФ"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-v-nalogi-v-rossii-v-2025-godu-novosti-ot-fns';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 15, 'heading',
       '{"level":2,"text":"Регуляция майнинга в России: как это было?"}'::jsonb,
       'regulation-history'
FROM articles a WHERE a.slug = 'majning-v-nalogi-v-rossii-v-2025-godu-novosti-ot-fns';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 16, 'paragraph',
       $tmj${"text":"Формат, к которому власти страны приходят в 2024-2025 годах, является результатом многочисленных обсуждений, слухов и манипуляций. Однако в конечном итоге было принято решение направить майнинговую деятельность в правовое русло и легализовать процесс вместе с определением порядка налоговых отчислений."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-v-nalogi-v-rossii-v-2025-godu-novosti-ot-fns';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 17, 'paragraph',
       $tmj${"text":"Тем не менее, произошло это далеко не сразу. Хронология процессов, связанных с легализацией, выглядит следующим образом:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-v-nalogi-v-rossii-v-2025-godu-novosti-ot-fns';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 18, 'list',
       $tmj${"ordered":false,"items":["2017 год: В РФ впервые заговорили о возможных запретах и ограничениях для майнеров;","2018 год: Департамент финансов не готов рассматривать полный запрет майнинга в России;","Июль 2019 года: Власти отказываются от обсуждения внедрения уголовной ответственности за майнинг;","Март 2020 года: ЦБ инициирует рассмотреть полный запрет на криптовалюту в стране;","Сентябрь 2020 года: Минфин выступает с инициативой заблокировать оборот криптовалют;","Январь 2021 года: Вступает в силу закон о ЦФА, где впервые были введены базовые понятия и термины (блокчейн, криптовалюта).","Январь 2021 года: Введен запрет оплаты товаров и услуг на территории страны с помощью криптовалют;","Январь 2022 года: ЦБ вновь предложил запретить майнинг и криптовалюты в России;","2023 год: Стартуют обсуждения форматов возможного законодательства на официальном уровне;","Август 2024 года: Подписан закон о легализации майнинга в РФ, включая создание реестра майнеров;","Ноябрь 2024 года: Введены ограничения (10 регионов) и запреты (3 субъекта) для отдельных частей России.","Ноябрь 2024 года: Принят закон о налогообложении майнинговой деятельности;","Декабрь 2024 года: Установлены лимиты на потребление электричества частными майнерами;","Апрель 2025 года: Принято решение о полном запрете майнинга на юге Иркутской области до 2031 года;","Апрель 2025 года: Криптовалюта активно используется для трансграничных расчетов между Россией и другими странами мира."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-v-nalogi-v-rossii-v-2025-godu-novosti-ot-fns';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 19, 'paragraph',
       $tmj${"text":"Статья будет дополняться по мере появления свежих данных и новых законов о майнинге."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-v-nalogi-v-rossii-v-2025-godu-novosti-ot-fns';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 20, 'paragraph',
       $tmj${"text":"Чтобы оставаться в курсе актуальных новостей и изменений законодательства, подписывайтесь на Телеграм-канал ТОП-МАЙНИНГ. Только здесь самая свежая и актуальная информация о добыче цифровых валют.","html":"Чтобы оставаться в курсе актуальных новостей и изменений законодательства, подписывайтесь на <a href=\"https://t.me/topminingru\">Телеграм-канал ТОП-МАЙНИНГ</a>. Только здесь самая свежая и актуальная информация о добыче цифровых валют."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-v-nalogi-v-rossii-v-2025-godu-novosti-ot-fns';

-- ---------------------------------------------------------------------
-- Статья 2: декларация по налогу на прибыль
-- ---------------------------------------------------------------------
INSERT INTO articles (
    slug, title, title_subtitle, excerpt, content, topic_id,
    reading_time_min, reading_minutes, published_at, view_count,
    display_type, sort_order, is_published, uses_blocks,
    image_url, image_alt
) VALUES (
    'sdacha-pervyj-deklaraczii-po-nalogu-na-pribyl-dlya-yur-licz-legalnyj-majning-v-rossii-v-2025-godu',
    'Сдача первой декларации по налогу на прибыль для юр. лиц',
    'Легальный майнинг в России в 2025 году',
    $excerpt$Апрель 2025 года: юридические лица впервые сдают декларацию по налогу на прибыль за I квартал. Ставка 25%, срок — до 25 апреля. Что нужно знать майнерам.$excerpt$,
    $content$Введение

Апрель 2025 года стал важным месяцем для сегмента добычи криптовалют в России. Причиной является не только полный запрет майнинга на юге Иркутской области до 2031 года, но и необходимость для юридических лиц сдать первую декларацию по налогу на прибыль за I квартал 2025 года.

Первая декларация по налогу на прибыль для майнеров в России

По состоянию на весну 2025 года в реестр майнеров РФ были включены более 700 российских компаний.

Что необходимо знать о налогах на майнинг в РФ

Для физических лиц применяется НДФЛ. Для юридических лиц актуален налог на прибыль — 25%.
$content$,
    'mining',
    5,
    5,
    '2025-04-18',
    848,
    'list',
    22,
    TRUE,
    TRUE,
    '/images/articles/mining-profit-tax-declaration-2025/cover.png',
    'Декларация по налогу на прибыль для майнеров'
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
WHERE a.slug = 'sdacha-pervyj-deklaraczii-po-nalogu-na-pribyl-dlya-yur-licz-legalnyj-majning-v-rossii-v-2025-godu'
  AND m.path = '/images/articles/mining-profit-tax-declaration-2025/cover.png';

DELETE FROM article_blocks
WHERE article_id = (
    SELECT id FROM articles
    WHERE slug = 'sdacha-pervyj-deklaraczii-po-nalogu-na-pribyl-dlya-yur-licz-legalnyj-majning-v-rossii-v-2025-godu'
);

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 1, 'heading', '{"level":2,"text":"Введение"}'::jsonb, 'intro'
FROM articles a
WHERE a.slug = 'sdacha-pervyj-deklaraczii-po-nalogu-na-pribyl-dlya-yur-licz-legalnyj-majning-v-rossii-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 2, 'paragraph',
       $tmj${"text":"Апрель 2025 года стал важным месяцем для сегмента добычи криптовалют в России. Причиной является не только полный запрет майнинга на юге Иркутской области до 2031 года, но и необходимость для юридических лиц сдать первую декларацию по налогу на прибыль за I квартал 2025 года. Подобный документ формируется впервые, поэтому данное событие можно считать точкой отчета в истории налогообложения ферм в РФ."}$tmj$::jsonb,
       NULL
FROM articles a
WHERE a.slug = 'sdacha-pervyj-deklaraczii-po-nalogu-na-pribyl-dlya-yur-licz-legalnyj-majning-v-rossii-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 3, 'heading',
       '{"level":2,"text":"Первая декларация по налогу на прибыль для майнеров в России"}'::jsonb,
       'first-declaration'
FROM articles a
WHERE a.slug = 'sdacha-pervyj-deklaraczii-po-nalogu-na-pribyl-dlya-yur-licz-legalnyj-majning-v-rossii-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 4, 'paragraph',
       $tmj${"text":"По состоянию на весну 2025 года в реестр майнеров РФ были включены более 700 российских компаний, осуществляющих добычу цифровых активов. Именно эти компании первыми подали первые декларации по налогу на прибыль для юридических лиц. Что необходимо знать о данной отчетности:"}$tmj$::jsonb,
       NULL
FROM articles a
WHERE a.slug = 'sdacha-pervyj-deklaraczii-po-nalogu-na-pribyl-dlya-yur-licz-legalnyj-majning-v-rossii-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 5, 'list',
       $tmj${"ordered":false,"items":["Отчетный период – I квартал 2025 года;","Налоговая ставка – 25%;","Срок подачи сведений – до 25 апреля 2025 года;"]}$tmj$::jsonb,
       NULL
FROM articles a
WHERE a.slug = 'sdacha-pervyj-deklaraczii-po-nalogu-na-pribyl-dlya-yur-licz-legalnyj-majning-v-rossii-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 6, 'paragraph',
       $tmj${"text":"Именно таким образом формируется принцип налогообложения для майнеров в России: 2025-й год можно официально считать началом действия системы ФНС в рамках процесса легализации."}$tmj$::jsonb,
       NULL
FROM articles a
WHERE a.slug = 'sdacha-pervyj-deklaraczii-po-nalogu-na-pribyl-dlya-yur-licz-legalnyj-majning-v-rossii-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 7, 'image',
       $tmj${"src":"/images/articles/mining-profit-tax-declaration-2025/cover.png","alt":"Декларация по налогу на прибыль для майнеров"}$tmj$::jsonb,
       NULL
FROM articles a
WHERE a.slug = 'sdacha-pervyj-deklaraczii-po-nalogu-na-pribyl-dlya-yur-licz-legalnyj-majning-v-rossii-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 8, 'heading',
       '{"level":2,"text":"Что необходимо знать о налогах на майнинг в РФ"}'::jsonb,
       'tax-basics'
FROM articles a
WHERE a.slug = 'sdacha-pervyj-deklaraczii-po-nalogu-na-pribyl-dlya-yur-licz-legalnyj-majning-v-rossii-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 9, 'paragraph',
       $tmj${"text":"Налоговое законодательство начало формироваться в 2025-м, а к концу года обрело свой текущий формат:"}$tmj$::jsonb,
       NULL
FROM articles a
WHERE a.slug = 'sdacha-pervyj-deklaraczii-po-nalogu-na-pribyl-dlya-yur-licz-legalnyj-majning-v-rossii-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 10, 'list',
       $tmj${"ordered":false,"items":["Для физических лиц применяется НДФЛ. Ставка от 13% до 15% (в зависимости от суммы ежегодного дохода, получаемого от майнинга);","Для юридических лиц актуален налог на прибыль. С 1 января 2025 года расчет ведется по ставке 25%."]}$tmj$::jsonb,
       NULL
FROM articles a
WHERE a.slug = 'sdacha-pervyj-deklaraczii-po-nalogu-na-pribyl-dlya-yur-licz-legalnyj-majning-v-rossii-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 11, 'paragraph',
       $tmj${"text":"Не предусмотрена реализация форматов самозанятости и упрощенной системы налогообложения."}$tmj$::jsonb,
       NULL
FROM articles a
WHERE a.slug = 'sdacha-pervyj-deklaraczii-po-nalogu-na-pribyl-dlya-yur-licz-legalnyj-majning-v-rossii-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 12, 'paragraph',
       $tmj${"text":"Для расчета необходимо использовать котировки, которые публикуются на сайте ФНС по ссылке. Здесь же представлена другая информация, которая может быть полезной для физических и юридических лиц, занимающихся майнингом.","html":"Для расчета необходимо использовать котировки, которые публикуются на сайте ФНС по <a href=\"https://www.nalog.gov.ru/rn49/promo/mining/\">ссылке</a>. Здесь же представлена другая информация, которая может быть полезной для физических и юридических лиц, занимающихся майнингом."}$tmj$::jsonb,
       NULL
FROM articles a
WHERE a.slug = 'sdacha-pervyj-deklaraczii-po-nalogu-na-pribyl-dlya-yur-licz-legalnyj-majning-v-rossii-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 13, 'image',
       $tmj${"src":"/images/articles/mining-profit-tax-declaration-2025/fns-screenshot.jpg","alt":"Раздел ФНС для майнеров"}$tmj$::jsonb,
       NULL
FROM articles a
WHERE a.slug = 'sdacha-pervyj-deklaraczii-po-nalogu-na-pribyl-dlya-yur-licz-legalnyj-majning-v-rossii-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 14, 'heading',
       '{"level":2,"text":"Что еще почитать о законодательстве, легализации и налогах?"}'::jsonb,
       'read-more'
FROM articles a
WHERE a.slug = 'sdacha-pervyj-deklaraczii-po-nalogu-na-pribyl-dlya-yur-licz-legalnyj-majning-v-rossii-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 15, 'paragraph',
       $tmj${"text":"На нашем сайте представлен полноценный цикл материалов, посвященный вопросам легализации и налогообложения майнинга в РФ. Рекомендуем обратить внимание на следующие материалы:"}$tmj$::jsonb,
       NULL
FROM articles a
WHERE a.slug = 'sdacha-pervyj-deklaraczii-po-nalogu-na-pribyl-dlya-yur-licz-legalnyj-majning-v-rossii-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 16, 'paragraph',
       $tmj${"text":"Легальны ли майнинг фермы в России в 2025 году: реестр, налоги и региональные особенности. Что необходимо знать о легализации майнинга в РФ; Майнинг-ферма дома: законно ли это?; Почему майнинг фермы запрещены в России: новое законодательство РФ.","html":"<ul><li><a href=\"https://top-mining.ru/novichkam/legalny-li-majning-fermy-v-rossii-v-2025-godu/\">Легальны ли майнинг фермы в России в 2025 году: реестр, налоги и региональные особенности</a>. Что необходимо знать о легализации майнинга в РФ;</li><li><a href=\"https://top-mining.ru/mining/majning-ferma-doma-zakonno-li-eto/\">Майнинг-ферма дома: законно ли это?</a></li><li><a href=\"https://top-mining.ru/mining/pochemu-majning-fermy-zapreshheny-v-rossii-novoe-zakonodatelstvo-rf/\">Почему майнинг фермы запрещены в России: новое законодательство РФ</a>.</li></ul>"}$tmj$::jsonb,
       NULL
FROM articles a
WHERE a.slug = 'sdacha-pervyj-deklaraczii-po-nalogu-na-pribyl-dlya-yur-licz-legalnyj-majning-v-rossii-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 17, 'paragraph',
       $tmj${"text":"Еще больше полезной и актуальной информации можно найти в нашем Телеграм-канале. Подписывайтесь, чтобы оставаться в курсе свежих новостей.","html":"Еще больше полезной и актуальной информации можно найти в нашем <a href=\"https://t.me/topminingru\">Телеграм-канале</a>. Подписывайтесь, чтобы оставаться в курсе свежих новостей."}$tmj$::jsonb,
       NULL
FROM articles a
WHERE a.slug = 'sdacha-pervyj-deklaraczii-po-nalogu-na-pribyl-dlya-yur-licz-legalnyj-majning-v-rossii-v-2025-godu';
