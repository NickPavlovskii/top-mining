SET client_encoding = 'UTF8';

-- =====================================================================
-- 040_four_articles_and_hide_stubs.sql
-- 1) Четыре статьи 1:1 с production
-- 2) Скрываем stub-статьи из 002 без полноценного контента
-- =====================================================================

INSERT INTO media_assets (path, alt, source)
VALUES
    ('/images/articles/gpu-after-mining/cover.jpg', 'Восстановление видеокарты после майнинга', 'article_cover'),
    ('/images/articles/gpu-after-mining/img-1.jpg', 'Как восстановить видеокарту после майнинга', 'article'),
    ('/images/articles/gpu-after-mining/img-2.jpg', 'Советы по выбору б/у видеокарты после майнинга', 'article'),
    ('/images/articles/miner-without-internet/cover.jpg', 'Может ли работать майнер без интернета', 'article_cover'),
    ('/images/articles/miner-without-internet/img-1.jpg', 'Почему интернет критически важен для майнинга', 'article'),
    ('/images/articles/miner-without-internet/img-2.jpg', 'Сколько стоят простои майнера', 'article'),
    ('/images/articles/pos-staking/cover.jpg', 'Алгоритм PoS и стейкинг', 'article_cover'),
    ('/images/articles/pos-staking/img-1.jpg', 'Преимущества PoS метода', 'article'),
    ('/images/articles/mining-site-turnkey/cover.jpg', 'Строительство площадок для майнинга под ключ', 'article_cover'),
    ('/images/articles/mining-site-turnkey/img-1.jpg', 'Зачем нужна услуга строительства ЦОД', 'article'),
    ('/images/articles/mining-site-turnkey/img-2.jpg', 'Как проходит строительство ЦОД под ключ', 'article'),
    ('/images/articles/mining-site-turnkey/img-3.jpg', 'Почему строительство дата-центров выгодно', 'article')
ON CONFLICT (path) DO UPDATE SET alt = EXCLUDED.alt;

-- ---------------------------------------------------------------------
-- GPU after mining
-- https://top-mining.ru/mining/vosstanovlenie-videokarty-posle-majninga-mif-ili-realnost/
-- ---------------------------------------------------------------------

INSERT INTO articles (
    slug, title, title_subtitle, excerpt, content, topic_id,
    reading_time_min, reading_minutes, published_at, view_count,
    display_type, sort_order, is_published, uses_blocks,
    image_url, image_alt
) VALUES (
    'vosstanovlenie-videokarty-posle-majninga-mif-ili-realnost',
    'Восстановление видеокарты после майнинга',
    'Миф или реальность?',
    $excerpt$Можно ли восстановить видеокарту после майнинга и стоит ли это делать: износ, диагностика, чистка, ремонт и экономика выбора б/у карты.$excerpt$,
    $content$После завершения эры активного майнинга Эфириума и перехода монеты на PoS на рынке появилось огромное количество бывших в употреблении видеокарт. Карты, которые месяцами работали без остановки, нередко теряют производительность. В статье — как майнинг влияет на оборудование и какие шаги помогут вернуть ему жизнь.$content$,
    'mining',
    10,
    10,
    '2025-08-27',
    493,
    'list',
    25,
    TRUE,
    TRUE,
    '/images/articles/gpu-after-mining/cover.jpg',
    'Восстановление видеокарты после майнинга'
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
WHERE a.slug = 'vosstanovlenie-videokarty-posle-majninga-mif-ili-realnost'
  AND m.path = '/images/articles/gpu-after-mining/cover.jpg';

DELETE FROM article_blocks
WHERE article_id = (SELECT id FROM articles WHERE slug = 'vosstanovlenie-videokarty-posle-majninga-mif-ili-realnost');

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 1, 'heading',
       $tmj${"level":2,"text":"Введение"}$tmj$::jsonb,
       'intro'
FROM articles a WHERE a.slug = 'vosstanovlenie-videokarty-posle-majninga-mif-ili-realnost';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 2, 'paragraph',
       $tmj${"text":"После завершения эры активного майнинга Эфириума и перехода монеты на PoS на рынке появилось огромное количество бывших в употреблении видеокарт. Еще два-три года назад такие модели трудились на фермах круглосуточно, а теперь они массово продаются в Интернете. Для геймеров и специалистов по графике это шанс купить мощное «железо» дешевле, чем новое. Но есть и обратная сторона – износ после майнинга."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'vosstanovlenie-videokarty-posle-majninga-mif-ili-realnost';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 3, 'paragraph',
       $tmj${"text":"Карты, которые месяцами работали без остановки, нередко теряют производительность, начинают перегреваться или вести себя нестабильно. В этой связи встает главный вопрос: можно ли восстановить видеокарту после майнинга и насколько это вообще целесообразно? Чтобы ответить, нужно разобраться, как именно майнинг влияет на оборудование и какие шаги помогут вернуть ему жизнь."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'vosstanovlenie-videokarty-posle-majninga-mif-ili-realnost';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 4, 'image',
       $tmj${"src":"/images/articles/gpu-after-mining/cover.jpg","alt":"Восстановление видеокарты после майнинга"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'vosstanovlenie-videokarty-posle-majninga-mif-ili-realnost';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 5, 'heading',
       $tmj${"level":2,"text":"Как майнинг влияет на работу видеокарты?"}$tmj$::jsonb,
       'mining-impact'
FROM articles a WHERE a.slug = 'vosstanovlenie-videokarty-posle-majninga-mif-ili-realnost';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 6, 'paragraph',
       $tmj${"text":"Майнинг – это не «игра пару часов вечером», а круглосуточная работа под высокой нагрузкой. Представьте, что двигатель автомобиля работает 24/7 без перерывов – он рано или поздно потребует капитального ремонта. С видеокартами ситуация аналогичная."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'vosstanovlenie-videokarty-posle-majninga-mif-ili-realnost';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 7, 'paragraph',
       $tmj${"text":"Основные факторы износа:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'vosstanovlenie-videokarty-posle-majninga-mif-ili-realnost';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 8, 'list',
       $tmj${"ordered":false,"items":["Перегрев. Даже при хорошем охлаждении температура видеочипа и памяти во время майнинга держится на высоком уровне. Термопаста и термопрокладки постепенно высыхают и теряют эффективность.","Деградация памяти. В процессе добычи криптовалют память нагружается сильнее, чем при обычных играх. Со временем чипы могут терять стабильность, что проявляется артефактами или снижением частот.","Износ вентиляторов. Кулеры работают без остановки, и подшипники начинают шуметь, люфтить или вовсе заклинивают.","Запыленность. Фермы часто размещаются в помещениях без должной вентиляции, где оборудование покрывается слоем пыли, мешающим охлаждению."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'vosstanovlenie-videokarty-posle-majninga-mif-ili-realnost';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 9, 'paragraph',
       $tmj${"text":"Пример: на профильных форумах пользователи нередко рассказывают истории, как карты после полутора лет майнинга без обслуживания показывали температуры под 95 °C и начинали отключаться. После полной чистки и замены расходников удавалось снизить нагрев на 20–25 °C."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'vosstanovlenie-videokarty-posle-majninga-mif-ili-realnost';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 10, 'heading',
       $tmj${"level":2,"text":"Можно ли восстановить видеокарту после майнинга?"}$tmj$::jsonb,
       'can-restore'
FROM articles a WHERE a.slug = 'vosstanovlenie-videokarty-posle-majninga-mif-ili-realnost';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 11, 'paragraph',
       $tmj${"text":"Здесь все зависит от конкретной ситуации. Если карта относительно свежая (работала меньше года и обслуживалась), шанс на успешное восстановление очень высок. Если видеокарта отработала 2-3 года в условиях плохого охлаждения и без замены термопасты, восстановление может оказаться невыгодным."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'vosstanovlenie-videokarty-posle-majninga-mif-ili-realnost';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 12, 'paragraph',
       $tmj${"text":"Факторы успеха:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'vosstanovlenie-videokarty-posle-majninga-mif-ili-realnost';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 13, 'list',
       $tmj${"ordered":false,"items":["качество охлаждения (фермы с нормальными обдувами страдают меньше),","аккуратность владельца (чистка, своевременная замена пасты и прокладок),","исходное качество самой модели (некоторые линейки Nvidia и AMD лучше выдерживают долгую работу)."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'vosstanovlenie-videokarty-posle-majninga-mif-ili-realnost';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 14, 'paragraph',
       $tmj${"text":"Кейс: у одного майнера RTX 3080 после двух лет работы в ферме показывала артефакты даже в простых играх. Замена термопрокладок и перепайка пары чипов памяти в сервисе обошлась в $180, но карта снова заработала стабильно. В другом случае дешевле было просто купить б/у аналог без проблем."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'vosstanovlenie-videokarty-posle-majninga-mif-ili-realnost';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 15, 'heading',
       $tmj${"level":2,"text":"Как восстановить видеокарту после майнинга?"}$tmj$::jsonb,
       'how-to-restore'
FROM articles a WHERE a.slug = 'vosstanovlenie-videokarty-posle-majninga-mif-ili-realnost';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 16, 'paragraph',
       $tmj${"text":"Теперь к практической части – как восстановить видеокарту после майнинга шаг за шагом:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'vosstanovlenie-videokarty-posle-majninga-mif-ili-realnost';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 17, 'rich_list',
       $tmj${"ordered":true,"items":[{"title":"Диагностика","text":"Перед началом любых работ запускаются стресс-тесты (3DMark, FurMark, OCCT) для проверки температур и стабильности. Это покажет, какие узлы проблемные."},{"title":"Глубокая чистка","text":"Разбираем карту, полностью удаляем пыль, меняем термопасту и термопрокладки. Часто только этот шаг дает +10–20% к стабильности."},{"title":"BIOS и частоты","text":"Многие фермеры перепрошивают BIOS ради оптимизации под майнинг. Чтобы вернуть стабильность, рекомендуется прошить заводскую версию и сбросить все разгоны."},{"title":"Настройка работы","text":"Снижение частот ядра/памяти и ограничение потребления могут продлить жизнь видеокарты."},{"title":"Замена компонентов","text":"Если вентиляторы шумят или память нестабильна, лучше доверить ремонт сервисному центру – самостоятельная пайка почти всегда заканчивается неудачей."}]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'vosstanovlenie-videokarty-posle-majninga-mif-ili-realnost';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 18, 'paragraph',
       $tmj${"text":"Пример: после чистки и замены прокладок на RX 5700 XT один пользователь получил стабильный FPS в играх, хотя до этого карта зависала каждые 20 минут."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'vosstanovlenie-videokarty-posle-majninga-mif-ili-realnost';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 19, 'image',
       $tmj${"src":"/images/articles/gpu-after-mining/img-1.jpg","alt":"Как восстановить видеокарту после майнинга"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'vosstanovlenie-videokarty-posle-majninga-mif-ili-realnost';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 20, 'heading',
       $tmj${"level":2,"text":"Стоит ли заниматься восстановлением самостоятельно?"}$tmj$::jsonb,
       'diy'
FROM articles a WHERE a.slug = 'vosstanovlenie-videokarty-posle-majninga-mif-ili-realnost';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 21, 'paragraph',
       $tmj${"text":"В домашних условиях можно сделать многое:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'vosstanovlenie-videokarty-posle-majninga-mif-ili-realnost';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 22, 'list',
       $tmj${"ordered":false,"items":["разобрать карту и удалить пыль,","заменить термопасту и прокладки,","проверить частоты через MSI Afterburner."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'vosstanovlenie-videokarty-posle-majninga-mif-ili-realnost';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 23, 'paragraph',
       $tmj${"text":"Но серьезный ремонт (пайка памяти, цепей питания, восстановление BIOS после сбоя) требует оборудования и опыта. Ошибка может привести к тому, что карта превратится в «кирпич»."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'vosstanovlenie-videokarty-posle-majninga-mif-ili-realnost';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 24, 'paragraph',
       $tmj${"text":"Совет: если карта дорогая (RTX 3090, 4080), лучше сразу обратиться в проверенный сервис. Для старых бюджетных моделей иногда выгоднее купить другую б/у карту, чем вкладываться в сложный ремонт."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'vosstanovlenie-videokarty-posle-majninga-mif-ili-realnost';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 25, 'heading',
       $tmj${"level":2,"text":"Экономическая целесообразность"}$tmj$::jsonb,
       'economics'
FROM articles a WHERE a.slug = 'vosstanovlenie-videokarty-posle-majninga-mif-ili-realnost';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 26, 'paragraph',
       $tmj${"text":"Финансовый вопрос часто решающий. Например, замена пасты и прокладок обойдется в $10–20. Сервисный ремонт памяти – $80–150. Цена б/у RTX 3070 на рынке – около $250–300."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'vosstanovlenie-videokarty-posle-majninga-mif-ili-realnost';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 27, 'paragraph',
       $tmj${"text":"Вывод: если ремонт стоит дороже 50% цены аналогичной карты на вторичке, лучше задуматься о замене."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'vosstanovlenie-videokarty-posle-majninga-mif-ili-realnost';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 28, 'heading',
       $tmj${"level":2,"text":"Советы по выбору б/у видеокарты после майнинга"}$tmj$::jsonb,
       'buying-tips'
FROM articles a WHERE a.slug = 'vosstanovlenie-videokarty-posle-majninga-mif-ili-realnost';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 29, 'paragraph',
       $tmj${"text":"Если вы решили взять карту с рук, обратите внимание:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'vosstanovlenie-videokarty-posle-majninga-mif-ili-realnost';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 30, 'list',
       $tmj${"ordered":false,"items":["Прогоните стресс-тесты и посмотрите на температуру. Если ядро выше 85 °C – тревожный знак.","Проверяйте вентиляторы: шум, скрежет или вибрации говорят об износе.","Осмотрите плату на наличие следов пайки или следов перегрева.","Узнайте у продавца, где карта использовалась: в ферме или в домашнем ПК."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'vosstanovlenie-videokarty-posle-majninga-mif-ili-realnost';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 31, 'paragraph',
       $tmj${"text":"Если на экране появляются артефакты, карта зависает или сильно греется даже без нагрузки – лучше отказаться от покупки."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'vosstanovlenie-videokarty-posle-majninga-mif-ili-realnost';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 32, 'image',
       $tmj${"src":"/images/articles/gpu-after-mining/img-2.jpg","alt":"Советы по выбору б/у видеокарты после майнинга"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'vosstanovlenie-videokarty-posle-majninga-mif-ili-realnost';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 33, 'heading',
       $tmj${"level":2,"text":"Выводы"}$tmj$::jsonb,
       'conclusion'
FROM articles a WHERE a.slug = 'vosstanovlenie-videokarty-posle-majninga-mif-ili-realnost';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 34, 'paragraph',
       $tmj${"text":"Восстановление видеокарты после майнинга реально, но требует комплексного подхода. На вопрос «можно ли восстановить видеокарту после майнинга» ответ положительный – да, но успех зависит от состояния устройства и вложенных усилий."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'vosstanovlenie-videokarty-posle-majninga-mif-ili-realnost';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 35, 'paragraph',
       $tmj${"text":"Главное правило: чем раньше проведена чистка и замена расходников, тем выше шанс продлить срок службы. В простых случаях достаточно заменить термопасту и сбросить разгон, в сложных – обратиться в сервис."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'vosstanovlenie-videokarty-posle-majninga-mif-ili-realnost';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 36, 'paragraph',
       $tmj${"text":"Если вы не уверены, как восстановить видеокарту после майнинга без риска, начните с диагностики и элементарного обслуживания. А для серьезных неисправностей лучше доверить работу профессионалам – это позволит сэкономить и сохранить устройство в рабочем состоянии."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'vosstanovlenie-videokarty-posle-majninga-mif-ili-realnost';

-- ---------------------------------------------------------------------
-- Miner without internet
-- https://top-mining.ru/novichkam/mozhet-li-rabotat-majner-bez-interneta/
-- ---------------------------------------------------------------------

INSERT INTO articles (
    slug, title, title_subtitle, excerpt, content, topic_id,
    reading_time_min, reading_minutes, published_at, view_count,
    display_type, sort_order, is_published, uses_blocks,
    image_url, image_alt
) VALUES (
    'mozhet-li-rabotat-majner-bez-interneta',
    'Может ли работать майнер без интернета?',
    '',
    $excerpt$Технически майнер продолжит работать без сети, но без интернета добыча бессмысленна: нет заданий, нет выплат. Разбираем простои, мифы и как снизить риски.$excerpt$,
    $content$Любой человек, начинающий заниматься криптовалютами, задается вопросом: может ли работать майнер без интернета? Майнинг — участие в распределенной сети. Без интернета вычисления превращаются в бесполезный нагрев воздуха.$content$,
    'beginners',
    7,
    7,
    '2025-09-18',
    584,
    'list',
    26,
    TRUE,
    TRUE,
    '/images/articles/miner-without-internet/cover.jpg',
    'Может ли работать майнер без интернета'
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
WHERE a.slug = 'mozhet-li-rabotat-majner-bez-interneta'
  AND m.path = '/images/articles/miner-without-internet/cover.jpg';

DELETE FROM article_blocks
WHERE article_id = (SELECT id FROM articles WHERE slug = 'mozhet-li-rabotat-majner-bez-interneta');

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 1, 'heading',
       $tmj${"level":2,"text":"Введение"}$tmj$::jsonb,
       'intro'
FROM articles a WHERE a.slug = 'mozhet-li-rabotat-majner-bez-interneta';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 2, 'paragraph',
       $tmj${"text":"Любой человек, начинающий заниматься криптовалютами, в какой-то момент задается вопросом: может ли работать майнер без интернета? На первый взгляд все выглядит просто: устройство включено в розетку, выполняет вычисления и должно приносить прибыль. Но на практике все куда сложнее."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'mozhet-li-rabotat-majner-bez-interneta';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 3, 'paragraph',
       $tmj${"text":"Майнинг — это не только процесс подсчета хэшей. Это участие в глобальной распределенной сети, где миллионы устройств синхронизируются, обмениваются данными и подтверждают друг друга. Поэтому логично задаться вопросом: можно ли майнить без интернета или это лишь красивая теория, не имеющая отношения к реальной жизни?"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'mozhet-li-rabotat-majner-bez-interneta';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 4, 'heading',
       $tmj${"level":2,"text":"Почему интернет критически важен для майнинга?"}$tmj$::jsonb,
       'why-internet'
FROM articles a WHERE a.slug = 'mozhet-li-rabotat-majner-bez-interneta';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 5, 'paragraph',
       $tmj${"text":"Чтобы понять, работает ли майнер без интернета, нужно разобраться в его функциях. Асик или ферма выполняют вычисления."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'mozhet-li-rabotat-majner-bez-interneta';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 6, 'paragraph',
       $tmj${"text":"Но:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'mozhet-li-rabotat-majner-bez-interneta';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 7, 'list',
       $tmj${"ordered":false,"items":["через интернет они получают задания на расчет новых блоков;","через интернет же отправляют найденные решения в пул;","синхронизация с сетью также происходит онлайн."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'mozhet-li-rabotat-majner-bez-interneta';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 8, 'paragraph',
       $tmj${"text":"Если отключить интернет, устройство не сможет обмениваться данными, а значит, все вычисления превратятся в бесполезный нагрев воздуха."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'mozhet-li-rabotat-majner-bez-interneta';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 9, 'paragraph',
       $tmj${"text":"Иными словами, майнинг без интернета технически возможен (оборудование будет крутиться), но экономически бессмысленен."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'mozhet-li-rabotat-majner-bez-interneta';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 10, 'image',
       $tmj${"src":"/images/articles/miner-without-internet/img-1.jpg","alt":"Почему интернет критически важен для майнинга"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'mozhet-li-rabotat-majner-bez-interneta';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 11, 'heading',
       $tmj${"level":2,"text":"Что реально происходит при отключении?"}$tmj$::jsonb,
       'outage'
FROM articles a WHERE a.slug = 'mozhet-li-rabotat-majner-bez-interneta';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 12, 'paragraph',
       $tmj${"text":"Чтобы глубже разобраться, давайте рассмотрим разные ситуации:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'mozhet-li-rabotat-majner-bez-interneta';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 13, 'list',
       $tmj${"ordered":false,"items":["Пропал интернет на несколько минут. Майнер успеет потерять несколько заданий, но в масштабах месяца это практически не отразится на доходности.","Перебои на час-два. В этом случае заметно падает эффективность. Вы могли бы найти несколько решений и отправить их в сеть, но все вычисления идут впустую.","Нет интернета сутки и более. Тогда ситуация становится катастрофической: вы тратите электричество, оборудование работает, но дохода нет. Фактически будет ли работать майнер без интернета — да, но толку от этого ноль."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'mozhet-li-rabotat-majner-bez-interneta';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 14, 'heading',
       $tmj${"level":2,"text":"Майнинг оффлайн: мифы и реальность"}$tmj$::jsonb,
       'offline-myths'
FROM articles a WHERE a.slug = 'mozhet-li-rabotat-majner-bez-interneta';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 15, 'paragraph',
       $tmj${"text":"Многие новички полагают, что можно хранить копию блокчейна на локальном компьютере и таким образом обойтись без соединения. Теоретически это возможно, особенно если речь идет о соло-майнинге."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'mozhet-li-rabotat-majner-bez-interneta';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 16, 'paragraph',
       $tmj${"text":"Но на практике:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'mozhet-li-rabotat-majner-bez-interneta';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 17, 'rich_list',
       $tmj${"ordered":true,"items":[{"title":"Блокчейн постоянно растет и требует регулярной синхронизации","text":""},{"title":"Любые найденные блоки должны быть подтверждены сетью, а это невозможно без интернета","text":""},{"title":"Хранение полной базы требует сотен гигабайт памяти и стабильного обновления","text":""}]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'mozhet-li-rabotat-majner-bez-interneta';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 18, 'paragraph',
       $tmj${"text":"Поэтому майнинг без интернета в соло-режиме остается мифом."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'mozhet-li-rabotat-majner-bez-interneta';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 19, 'heading',
       $tmj${"level":2,"text":"Чем опасны перебои связи?"}$tmj$::jsonb,
       'risks'
FROM articles a WHERE a.slug = 'mozhet-li-rabotat-majner-bez-interneta';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 20, 'paragraph',
       $tmj${"text":"Если задуматься, может ли работать майнер без интернета и стоит ли рисковать, важно учесть не только потерю прибыли."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'mozhet-li-rabotat-majner-bez-interneta';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 21, 'paragraph',
       $tmj${"text":"Есть и другие негативные факторы:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'mozhet-li-rabotat-majner-bez-interneta';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 22, 'rich_list',
       $tmj${"ordered":true,"items":[{"title":"Износ оборудования","text":"устройство продолжает работать на полную мощность, но впустую;"},{"title":"Нагрузка на систему охлаждения","text":"вентиляторы и радиаторы крутятся, увеличивая расход энергии;"},{"title":"Потерянные блоки","text":"особенно критично для тех, кто рассчитывает на соло-добычу;"},{"title":"Лишние расходы на электричество","text":"счета растут, а прибыли нет."}]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'mozhet-li-rabotat-majner-bez-interneta';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 23, 'heading',
       $tmj${"level":2,"text":"Сколько стоят простои: расчеты"}$tmj$::jsonb,
       'downtime-cost'
FROM articles a WHERE a.slug = 'mozhet-li-rabotat-majner-bez-interneta';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 24, 'paragraph',
       $tmj${"text":"Представим ситуацию: ваш майнер приносит около 1 500 рублей в день."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'mozhet-li-rabotat-majner-bez-interneta';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 25, 'list',
       $tmj${"ordered":false,"items":["Простой 1 час = около 60 рублей убытка.","Простой сутки = минус 1 500 рублей.","Простой неделя = почти 10 500 рублей."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'mozhet-li-rabotat-majner-bez-interneta';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 26, 'paragraph',
       $tmj${"text":"И это без учета потерь на износ оборудования. Таким образом, дешевле заплатить за резервное подключение к интернету, чем допускать такие простои."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'mozhet-li-rabotat-majner-bez-interneta';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 27, 'image',
       $tmj${"src":"/images/articles/miner-without-internet/img-2.jpg","alt":"Сколько стоят простои майнера"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'mozhet-li-rabotat-majner-bez-interneta';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 28, 'heading',
       $tmj${"level":2,"text":"Как снизить риски отключений?"}$tmj$::jsonb,
       'mitigation'
FROM articles a WHERE a.slug = 'mozhet-li-rabotat-majner-bez-interneta';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 29, 'paragraph',
       $tmj${"text":"Опытные майнеры прекрасно знают: работает ли майнер без интернета — вопрос риторический. Чтобы майнинг оставался стабильным, нужно заранее позаботиться о резервных каналах связи."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'mozhet-li-rabotat-majner-bez-interneta';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 30, 'paragraph',
       $tmj${"text":"Вот несколько рабочих решений:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'mozhet-li-rabotat-majner-bez-interneta';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 31, 'list',
       $tmj${"ordered":false,"items":["подключение двух разных провайдеров;","использование LTE/5G модема как аварийного источника интернета;","роутеры с функцией переключения между каналами;","спутниковый интернет вроде Starlink — дорогой, но надежный вариант для отдаленных регионов."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'mozhet-li-rabotat-majner-bez-interneta';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 32, 'heading',
       $tmj${"level":2,"text":"Когда лучше не рисковать: майнинг-отели и дата-центры"}$tmj$::jsonb,
       'hosting'
FROM articles a WHERE a.slug = 'mozhet-li-rabotat-majner-bez-interneta';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 33, 'paragraph',
       $tmj${"text":"Если у вас нет возможности обеспечить стабильное соединение дома или на складе, то одним из решений может стать размещение оборудования в майнинг-отеле. Там гарантируется бесперебойный интернет, резервное электропитание и круглосуточный мониторинг."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'mozhet-li-rabotat-majner-bez-interneta';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 34, 'paragraph',
       $tmj${"text":"Это не дешевое решение, но оно снимает все проблемы с вопросами: может ли работать майнер без интернета или будет ли работать майнер без интернета при аварии у провайдера."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'mozhet-li-rabotat-majner-bez-interneta';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 35, 'heading',
       $tmj${"level":2,"text":"Экспертные рекомендации"}$tmj$::jsonb,
       'expert-tips'
FROM articles a WHERE a.slug = 'mozhet-li-rabotat-majner-bez-interneta';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 36, 'rich_list',
       $tmj${"ordered":true,"items":[{"title":"Рассчитайте стоимость простоя вашего оборудования","text":"Иногда даже час без интернета может стоить дороже месячной абонплаты за резервный канал."},{"title":"Установите мониторинг","text":"многие сервисы позволяют отслеживать подключение и сразу уведомляют о проблемах."},{"title":"Если перебои случаются регулярно","text":"подумайте о переезде оборудования в дата-центр или хостинг."}]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'mozhet-li-rabotat-majner-bez-interneta';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 37, 'heading',
       $tmj${"level":2,"text":"Выводы"}$tmj$::jsonb,
       'conclusion'
FROM articles a WHERE a.slug = 'mozhet-li-rabotat-majner-bez-interneta';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 38, 'paragraph',
       $tmj${"text":"Итак, может ли работать майнер без интернета? Да, технически устройство продолжит вращать вентиляторы и выполнять вычисления. Но можно ли майнить без интернета так, чтобы это приносило прибыль? Нет."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'mozhet-li-rabotat-majner-bez-interneta';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 39, 'list',
       $tmj${"ordered":false,"items":["Майнинг без интернета превращает оборудование в дорогой электрический обогреватель.","Работает ли майнер без интернета — да, но вся работа впустую.","Будет ли работать майнер без интернета — только в техническом смысле, но не в экономическом."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'mozhet-li-rabotat-majner-bez-interneta';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 40, 'paragraph',
       $tmj${"text":"Интернет для майнинга — это не роскошь, а обязательное условие. Без него невозможно участие в блокчейне, получение заданий и вознаграждений. Именно поэтому стабильное подключение — такой же важный фактор, как дешевые розетки и правильный выбор асика."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'mozhet-li-rabotat-majner-bez-interneta';

-- ---------------------------------------------------------------------
-- PoS staking
-- https://top-mining.ru/novichkam/algoritm-pos-kak-rabotaet-stejking-i-pochemu-on-menyaet-rynok-kriptovalyut/
-- ---------------------------------------------------------------------

INSERT INTO articles (
    slug, title, title_subtitle, excerpt, content, topic_id,
    reading_time_min, reading_minutes, published_at, view_count,
    display_type, sort_order, is_published, uses_blocks,
    image_url, image_alt
) VALUES (
    'algoritm-pos-kak-rabotaet-stejking-i-pochemu-on-menyaet-rynok-kriptovalyut',
    'Алгоритм PoS',
    'Как работает стейкинг и почему он меняет рынок криптовалют?',
    $excerpt$Что такое PoS в криптовалюте, как работает стейкинг, сравнение с PoW, плюсы, риски и перспективы алгоритма Proof-of-Stake.$excerpt$,
    $content$Каждый блокчейн строится на алгоритме консенсуса. Proof-of-Stake использует стейкинг токенов вместо вычислительной мощности. Разбираем, что такое PoS, как он работает и почему меняет рынок.$content$,
    'beginners',
    9,
    9,
    '2025-08-21',
    213,
    'list',
    27,
    TRUE,
    TRUE,
    '/images/articles/pos-staking/cover.jpg',
    'Алгоритм PoS и стейкинг'
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
WHERE a.slug = 'algoritm-pos-kak-rabotaet-stejking-i-pochemu-on-menyaet-rynok-kriptovalyut'
  AND m.path = '/images/articles/pos-staking/cover.jpg';

DELETE FROM article_blocks
WHERE article_id = (SELECT id FROM articles WHERE slug = 'algoritm-pos-kak-rabotaet-stejking-i-pochemu-on-menyaet-rynok-kriptovalyut');

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 1, 'heading',
       $tmj${"level":2,"text":"Введение"}$tmj$::jsonb,
       'intro'
FROM articles a WHERE a.slug = 'algoritm-pos-kak-rabotaet-stejking-i-pochemu-on-menyaet-rynok-kriptovalyut';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 2, 'paragraph',
       $tmj${"text":"Каждый блокчейн строится на алгоритме консенсуса – правилах, по которым сеть принимает решение о том, какие транзакции будут записаны в блок. Первыми стали использовать Proof-of-Work, где главную роль играют вычисления и энергозатраты. Но с ростом популярности криптовалют встал вопрос: можно ли сделать процесс быстрее, доступнее и экологичнее? Так появился алгоритм PoS (Proof-of-Stake)."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'algoritm-pos-kak-rabotaet-stejking-i-pochemu-on-menyaet-rynok-kriptovalyut';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 3, 'paragraph',
       $tmj${"text":"Сегодня он постепенно вытесняет «классический» майнинг и задает новые стандарты. Чтобы понять, почему стейкинг изменил рынок, важно разобраться, что такое PoS в криптовалюте и как именно работает pos метод."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'algoritm-pos-kak-rabotaet-stejking-i-pochemu-on-menyaet-rynok-kriptovalyut';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 4, 'heading',
       $tmj${"level":2,"text":"Что такое PoS в криптовалюте"}$tmj$::jsonb,
       'what-is-pos'
FROM articles a WHERE a.slug = 'algoritm-pos-kak-rabotaet-stejking-i-pochemu-on-menyaet-rynok-kriptovalyut';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 5, 'paragraph',
       $tmj${"text":"Если Proof-of-Work делает ставку на вычислительную мощность и энергию, то алгоритм PoS использует совсем другой принцип. Новые блоки создают валидаторы – пользователи, которые «замораживают» свои токены в сети. Этот процесс называют стейкингом."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'algoritm-pos-kak-rabotaet-stejking-i-pochemu-on-menyaet-rynok-kriptovalyut';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 6, 'paragraph',
       $tmj${"text":"Чем больше монет находится на счету участника и чем дольше они удерживаются, тем выше шанс быть выбранным для добавления нового блока."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'algoritm-pos-kak-rabotaet-stejking-i-pochemu-on-menyaet-rynok-kriptovalyut';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 7, 'paragraph',
       $tmj${"text":"За работу полагается вознаграждение: часть комиссии за транзакции и новые токены. Таким образом, ответ на вопрос что такое PoS в криптовалюте прост: это система, где шанс заработать зависит не от мощности оборудования, а от количества монет, которыми владеет пользователь."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'algoritm-pos-kak-rabotaet-stejking-i-pochemu-on-menyaet-rynok-kriptovalyut';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 8, 'image',
       $tmj${"src":"/images/articles/pos-staking/cover.jpg","alt":"Алгоритм PoS и стейкинг"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'algoritm-pos-kak-rabotaet-stejking-i-pochemu-on-menyaet-rynok-kriptovalyut';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 9, 'heading',
       $tmj${"level":2,"text":"История и развитие PoS метода"}$tmj$::jsonb,
       'history'
FROM articles a WHERE a.slug = 'algoritm-pos-kak-rabotaet-stejking-i-pochemu-on-menyaet-rynok-kriptovalyut';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 10, 'paragraph',
       $tmj${"text":"Впервые pos метод упоминался в 2011 году на форумах биткоин-сообщества. Тогда многие обсуждали, как снизить энергопотребление сетей. В 2012 году проект Peercoin первым внедрил его в реальности. Затем появились BlackCoin, Nxt, Decred – проекты, которые доказали жизнеспособность идеи."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'algoritm-pos-kak-rabotaet-stejking-i-pochemu-on-menyaet-rynok-kriptovalyut';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 11, 'paragraph',
       $tmj${"text":"Но по-настоящему массовое распространение алгоритм PoS получил после того, как Ethereum начал переход на Proof-of-Stake."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'algoritm-pos-kak-rabotaet-stejking-i-pochemu-on-menyaet-rynok-kriptovalyut';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 12, 'paragraph',
       $tmj${"text":"Запуск Ethereum 2.0 стал важнейшей вехой и показал: эта технология способна выдержать нагрузку миллионов транзакций. Сейчас стейкинг используется в десятках сетей: Cardano, Solana, Polkadot, Tezos, Avalanche, Cosmos. Фактически, pos метод становится индустриальным стандартом."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'algoritm-pos-kak-rabotaet-stejking-i-pochemu-on-menyaet-rynok-kriptovalyut';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 13, 'heading',
       $tmj${"level":2,"text":"Как работает алгоритм PoS"}$tmj$::jsonb,
       'how-it-works'
FROM articles a WHERE a.slug = 'algoritm-pos-kak-rabotaet-stejking-i-pochemu-on-menyaet-rynok-kriptovalyut';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 14, 'paragraph',
       $tmj${"text":"Техническая схема алгоритма pos выглядит так:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'algoritm-pos-kak-rabotaet-stejking-i-pochemu-on-menyaet-rynok-kriptovalyut';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 15, 'rich_list',
       $tmj${"ordered":true,"items":[{"title":"Стейкинг монет","text":"пользователь блокирует токены на определенный срок, подтверждая свою заинтересованность в работе сети."},{"title":"Выбор валидатора","text":"система случайным образом определяет участника для создания блока, учитывая размер и возраст депозита."},{"title":"Создание блока","text":"выбранный валидатор добавляет транзакции и передает блок в сеть."},{"title":"Награда","text":"участник получает вознаграждение в монетах или комиссиях."}]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'algoritm-pos-kak-rabotaet-stejking-i-pochemu-on-menyaet-rynok-kriptovalyut';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 16, 'paragraph',
       $tmj${"text":"Для защиты от атак внедрены механизмы «слэшинга» – штрафов за попытку обмана сети или отключение узла."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'algoritm-pos-kak-rabotaet-stejking-i-pochemu-on-menyaet-rynok-kriptovalyut';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 17, 'paragraph',
       $tmj${"text":"Пример: у вас 10 000 ADA (Cardano). При доходности 4% годовых вы зарабатываете 400 ADA в год. Если курс монеты 0,6 $, то это около $240 пассивного дохода – без покупки дорогих асиков и оплаты электричества."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'algoritm-pos-kak-rabotaet-stejking-i-pochemu-on-menyaet-rynok-kriptovalyut';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 18, 'heading',
       $tmj${"level":2,"text":"Сравнение PoW и PoS"}$tmj$::jsonb,
       'pow-vs-pos'
FROM articles a WHERE a.slug = 'algoritm-pos-kak-rabotaet-stejking-i-pochemu-on-menyaet-rynok-kriptovalyut';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 19, 'paragraph',
       $tmj${"text":"Чтобы лучше понять что такое PoS в криптовалюте, сравним его с PoW:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'algoritm-pos-kak-rabotaet-stejking-i-pochemu-on-menyaet-rynok-kriptovalyut';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 20, 'paragraph',
       $tmj${"text":"Сравнение PoW и PoS по энергозатратам, входному порогу, скорости, безопасности и доходу.","html":"<table><thead><tr><th>Критерий</th><th>Proof-of-Work (PoW)</th><th>Proof-of-Stake (PoS)</th></tr></thead><tbody><tr><td>Энергозатраты</td><td>Очень высокие, особенно в BTC</td><td>Минимальные</td></tr><tr><td>Входной порог</td><td>Дорогое оборудование</td><td>Достаточно купить токены</td></tr><tr><td>Скорость транзакций</td><td>Низкая</td><td>Выше, масштабируемая</td></tr><tr><td>Безопасность</td><td>Защита через мощность сети</td><td>Защита через капитал и слэшинг</td></tr><tr><td>Доход</td><td>От добычи блоков</td><td>От стейкинга токенов</td></tr></tbody></table>"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'algoritm-pos-kak-rabotaet-stejking-i-pochemu-on-menyaet-rynok-kriptovalyut';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 21, 'heading',
       $tmj${"level":2,"text":"Преимущества PoS метода"}$tmj$::jsonb,
       'advantages'
FROM articles a WHERE a.slug = 'algoritm-pos-kak-rabotaet-stejking-i-pochemu-on-menyaet-rynok-kriptovalyut';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 22, 'paragraph',
       $tmj${"text":"Алгоритм pos дает пользователям и разработчикам сразу несколько важных преимуществ:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'algoritm-pos-kak-rabotaet-stejking-i-pochemu-on-menyaet-rynok-kriptovalyut';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 23, 'list',
       $tmj${"ordered":false,"items":["Экономичность – нет затрат на электричество и оборудование.","Экологичность – сети на PoS потребляют на 99% меньше энергии, чем биткоин.","Доступность – войти в процесс можно с минимальными суммами.","Масштабируемость – транзакции проходят быстрее, комиссии ниже.","Надежность – чем больше людей стейкает монеты, тем выше устойчивость сети."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'algoritm-pos-kak-rabotaet-stejking-i-pochemu-on-menyaet-rynok-kriptovalyut';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 24, 'image',
       $tmj${"src":"/images/articles/pos-staking/img-1.jpg","alt":"Преимущества PoS метода"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'algoritm-pos-kak-rabotaet-stejking-i-pochemu-on-menyaet-rynok-kriptovalyut';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 25, 'heading',
       $tmj${"level":2,"text":"Риски и слабые стороны"}$tmj$::jsonb,
       'risks'
FROM articles a WHERE a.slug = 'algoritm-pos-kak-rabotaet-stejking-i-pochemu-on-menyaet-rynok-kriptovalyut';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 26, 'paragraph',
       $tmj${"text":"При этом у pos метода есть и недостатки:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'algoritm-pos-kak-rabotaet-stejking-i-pochemu-on-menyaet-rynok-kriptovalyut';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 27, 'list',
       $tmj${"ordered":false,"items":["Концентрация монет у крупных игроков может привести к централизации.","Падение курса токена снижает мотивацию держать его в стейкинге.","Требуется стабильная работа узлов и защита от атак."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'algoritm-pos-kak-rabotaet-stejking-i-pochemu-on-menyaet-rynok-kriptovalyut';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 28, 'paragraph',
       $tmj${"text":"Эти риски решаются через продуманные механизмы штрафов, делегирование стейкинга и активное сообщество."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'algoritm-pos-kak-rabotaet-stejking-i-pochemu-on-menyaet-rynok-kriptovalyut';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 29, 'heading',
       $tmj${"level":2,"text":"Что дает алгоритм PoS пользователям"}$tmj$::jsonb,
       'for-users'
FROM articles a WHERE a.slug = 'algoritm-pos-kak-rabotaet-stejking-i-pochemu-on-menyaet-rynok-kriptovalyut';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 30, 'paragraph',
       $tmj${"text":"Для инвесторов ответ на вопрос что такое PoS в криптовалюте звучит так: это инструмент для пассивного дохода. Стейкинг напоминает банковский депозит, только доходность обычно выше."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'algoritm-pos-kak-rabotaet-stejking-i-pochemu-on-menyaet-rynok-kriptovalyut';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 31, 'list',
       $tmj${"ordered":false,"items":["Ethereum – 4–6% годовых.","Polkadot – до 13%.","Cosmos – 10–12%."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'algoritm-pos-kak-rabotaet-stejking-i-pochemu-on-menyaet-rynok-kriptovalyut';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 32, 'paragraph',
       $tmj${"text":"Для майнеров же это сигнал перемен: рынок уходит от железа и электричества в сторону финансовых активов. Теперь вместо покупки асиков выгоднее накапливать монеты и удерживать их."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'algoritm-pos-kak-rabotaet-stejking-i-pochemu-on-menyaet-rynok-kriptovalyut';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 33, 'heading',
       $tmj${"level":2,"text":"Перспективы развития"}$tmj$::jsonb,
       'outlook'
FROM articles a WHERE a.slug = 'algoritm-pos-kak-rabotaet-stejking-i-pochemu-on-menyaet-rynok-kriptovalyut';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 34, 'paragraph',
       $tmj${"text":"В 2025 году более половины новых блокчейн-проектов запускаются на алгоритме PoS. По оценкам аналитиков, через 5-7 лет этот стандарт станет доминирующим, а PoW сохранится лишь у биткоина как у «цифрового золота»."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'algoritm-pos-kak-rabotaet-stejking-i-pochemu-on-menyaet-rynok-kriptovalyut';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 35, 'paragraph',
       $tmj${"text":"Ускорение транзакций, минимальные комиссии и «зеленый» имидж делают PoS метод привлекательным и для инвесторов, и для регуляторов."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'algoritm-pos-kak-rabotaet-stejking-i-pochemu-on-menyaet-rynok-kriptovalyut';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 36, 'heading',
       $tmj${"level":2,"text":"Заключение"}$tmj$::jsonb,
       'conclusion'
FROM articles a WHERE a.slug = 'algoritm-pos-kak-rabotaet-stejking-i-pochemu-on-menyaet-rynok-kriptovalyut';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 37, 'paragraph',
       $tmj${"text":"Мы разобрались, что такое PoS в криптовалюте, как работает алгоритм PoS и почему именно PoS метод формирует будущее блокчейнов. Это не просто способ снизить энергозатраты, а новая модель участия пользователей в экономике криптовалют."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'algoritm-pos-kak-rabotaet-stejking-i-pochemu-on-menyaet-rynok-kriptovalyut';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 38, 'paragraph',
       $tmj${"text":"Стейкинг открывает путь к пассивному доходу миллионам инвесторов и превращает блокчейны в более устойчивые и гибкие системы. Всё говорит о том, что PoS – это не мода, а новый фундамент крипторынка."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'algoritm-pos-kak-rabotaet-stejking-i-pochemu-on-menyaet-rynok-kriptovalyut';

-- ---------------------------------------------------------------------
-- Mining site turnkey
-- https://top-mining.ru/instrumenty-i-servisy/stroitelstvo-ploshhadok-dlya-majninga-pod-klyuch/
-- ---------------------------------------------------------------------

INSERT INTO articles (
    slug, title, title_subtitle, excerpt, content, topic_id,
    reading_time_min, reading_minutes, published_at, view_count,
    display_type, sort_order, is_published, uses_blocks,
    image_url, image_alt
) VALUES (
    'stroitelstvo-ploshhadok-dlya-majninga-pod-klyuch',
    'Строительство площадок для майнинга «под ключ»',
    '',
    $excerpt$Строительство ЦОД под ключ в России: кому подходит, этапы работ, модели дохода, кейсы и почему собственная площадка выгоднее аренды.$excerpt$,
    $content$Услуга строительства дата-центров — стратегическая инвестиция. Разбираем, зачем она нужна, кому подходит, какие модели дохода дает и как проходит строительство ЦОД под ключ.$content$,
    'tools',
    9,
    9,
    '2025-11-05',
    307,
    'list',
    28,
    TRUE,
    TRUE,
    '/images/articles/mining-site-turnkey/cover.jpg',
    'Строительство площадок для майнинга под ключ'
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
WHERE a.slug = 'stroitelstvo-ploshhadok-dlya-majninga-pod-klyuch'
  AND m.path = '/images/articles/mining-site-turnkey/cover.jpg';

DELETE FROM article_blocks
WHERE article_id = (SELECT id FROM articles WHERE slug = 'stroitelstvo-ploshhadok-dlya-majninga-pod-klyuch');

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 1, 'heading',
       $tmj${"level":2,"text":"Введение"}$tmj$::jsonb,
       'intro'
FROM articles a WHERE a.slug = 'stroitelstvo-ploshhadok-dlya-majninga-pod-klyuch';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 2, 'paragraph',
       $tmj${"text":"Современный бизнес все чаще нуждается в мощных вычислительных ресурсах, будь то размещение майнинг-оборудования, аренда серверных площадей или организация собственной инфраструктуры для обработки данных. Именно поэтому услуга строительства дата-центров становится не просто технической, а стратегической инвестицией. Ниже подробно разберем, зачем она нужна, кому подходит и какие выгоды дает."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'stroitelstvo-ploshhadok-dlya-majninga-pod-klyuch';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 3, 'heading',
       $tmj${"level":2,"text":"Зачем нужна услуга строительства"}$tmj$::jsonb,
       'why-needed'
FROM articles a WHERE a.slug = 'stroitelstvo-ploshhadok-dlya-majninga-pod-klyuch';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 4, 'rich_list',
       $tmj${"ordered":true,"items":[{"title":"Инфраструктура как инвестиционный актив","text":"Строительство дата-центра под ключ позволяет превратить технический объект в источник дохода. К примеру, вложив от 125 млн ₽, можно получить проект с окупаемостью от 17 месяцев."},{"title":"Полная независимость от аренды","text":"При аренде чужого хостинга вы зависите от тарифов и правил сторонних компаний. Собственный ЦОД обеспечивает полный контроль над инфраструктурой, условиями работы и загрузкой."},{"title":"Снижение рисков и стабильность дохода","text":"Объект, созданный по услуге строительства ЦОД, может приносить стабильную прибыль от аренды или эксплуатации — независимо от рыночных колебаний или курса криптовалют."},{"title":"Оптимизация затрат","text":"Строительство собственной площадки помогает существенно сократить расходы на электричество, охлаждение, техническое обслуживание и сторонние услуги."},{"title":"Масштабируемость и гибкость","text":"Проект ЦОД под ключ разрабатывается с учетом будущего роста — можно добавлять мощности и модернизировать оборудование без глобальной реконструкции."}]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'stroitelstvo-ploshhadok-dlya-majninga-pod-klyuch';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 5, 'image',
       $tmj${"src":"/images/articles/mining-site-turnkey/img-1.jpg","alt":"Зачем нужна услуга строительства ЦОД"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'stroitelstvo-ploshhadok-dlya-majninga-pod-klyuch';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 6, 'heading',
       $tmj${"level":2,"text":"Кому подойдет строительство дата-центра"}$tmj$::jsonb,
       'audience'
FROM articles a WHERE a.slug = 'stroitelstvo-ploshhadok-dlya-majninga-pod-klyuch';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 7, 'list',
       $tmj${"ordered":false,"items":["Инвесторам, ищущим актив с высокой доходностью и быстрой окупаемостью.","Майнерам и майнинговым компаниям, которым важно контролировать мощность, энергопотребление и тарифы.","Бизнесу, который хочет диверсифицировать активы: не только майнить, но и сдавать площадки в аренду.","IT-компаниям и облачным провайдерам, заинтересованным в собственных надежных инфраструктурах.","Предприятиям, которые хотят перенести оборудование с чужих площадок и управлять всеми процессами самостоятельно."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'stroitelstvo-ploshhadok-dlya-majninga-pod-klyuch';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 8, 'heading',
       $tmj${"level":2,"text":"Как проходит строительство ЦОД под ключ"}$tmj$::jsonb,
       'process'
FROM articles a WHERE a.slug = 'stroitelstvo-ploshhadok-dlya-majninga-pod-klyuch';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 9, 'paragraph',
       $tmj${"text":"Работа с экспертами ТОП МАЙНИНГ в сфере строительства ЦОД разделена на несколько этапов:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'stroitelstvo-ploshhadok-dlya-majninga-pod-klyuch';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 10, 'rich_list',
       $tmj${"ordered":true,"items":[{"title":"Аналитика и проектирование","text":"Проводится аудит площадки, рассчитываются нагрузки, составляется техническое задание, продумывается система электроснабжения, охлаждения, резервирования и связи."},{"title":"Подбор площадки и оформление документов","text":"Выбирается оптимальное место с учетом стоимости земли, логистики и доступа к сетям. Получаются технические условия (ТУ) и другие разрешения."},{"title":"Строительно-монтажные работы","text":"Возводится здание или модульная конструкция, монтируются системы пожаротушения, охлаждения, безопасности, электропитания, устанавливаются ИБП и распределительные устройства."},{"title":"Ввод в эксплуатацию","text":"Оборудование устанавливается, тестируется под нагрузкой, проверяются температурные и аварийные режимы. После этого площадка запускается и может быть сразу заполнена клиентами."}]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'stroitelstvo-ploshhadok-dlya-majninga-pod-klyuch';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 11, 'image',
       $tmj${"src":"/images/articles/mining-site-turnkey/img-2.jpg","alt":"Как проходит строительство ЦОД под ключ"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'stroitelstvo-ploshhadok-dlya-majninga-pod-klyuch';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 12, 'heading',
       $tmj${"level":2,"text":"Что получает заказчик: модели дохода и примеры"}$tmj$::jsonb,
       'models'
FROM articles a WHERE a.slug = 'stroitelstvo-ploshhadok-dlya-majninga-pod-klyuch';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 13, 'paragraph',
       $tmj${"text":"Основные форматы сотрудничества"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'stroitelstvo-ploshhadok-dlya-majninga-pod-klyuch';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 14, 'list',
       $tmj${"ordered":false,"items":["Модель 1: строительство ЦОД без покупки ASIC-майнеров. Вложения ~125 млн ₽ → окупаемость ~17 мес.","Модель 2: строительство и последующая продажа. Вложения ~125 млн ₽ → продажа через 4 мес. за ~150 млн ₽.","Модель 3: строительство с покупкой майнеров. Вложения ~567 млн ₽ → окупаемость ~14 мес.","Модель 4: строительство ЦОД под аренду на 7 лет. Вложения ~62,5 млн ₽ → возврат инвестиций за ~17 мес."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'stroitelstvo-ploshhadok-dlya-majninga-pod-klyuch';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 15, 'heading',
       $tmj${"level":2,"text":"Преимущества эксплуатации"}$tmj$::jsonb,
       'ops-benefits'
FROM articles a WHERE a.slug = 'stroitelstvo-ploshhadok-dlya-majninga-pod-klyuch';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 16, 'list',
       $tmj${"ordered":false,"items":["При аренде площадки минимальны операционные риски — объект остается вашей собственностью.","Прибыль может достигать ~7 млн ₽ в месяц за счет разницы тарифов на электроэнергию.","При самостоятельном майнинге снижаются расходы и комиссии за размещение оборудования."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'stroitelstvo-ploshhadok-dlya-majninga-pod-klyuch';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 17, 'heading',
       $tmj${"level":2,"text":"Кейсы"}$tmj$::jsonb,
       'cases'
FROM articles a WHERE a.slug = 'stroitelstvo-ploshhadok-dlya-majninga-pod-klyuch';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 18, 'list',
       $tmj${"ordered":false,"items":["Татарстан: клиент арендовал 100 кВт (расход ~700 000 ₽/мес), построил 120 кВт — расходы снизились почти вдвое, окупаемость < 18 мес.","Новосибирск: компания расширила мощности на 70 % с помощью строительства второй очереди.","Хакасия: площадка 3 МВт — 2 МВт собственный майнинг, 1 МВт аренда → ускоренная окупаемость.","Мобильный вариант: контейнерный дата-центр, перевезенный в регион с низкими тарифами, дал экономию ~30 %.","Инвестпроект: 800 кВт, юг России — запуск за 4 мес., инвестор получает пассивный доход.","Регион с тарифом ≈ 3 ₽/кВт⋅ч: северная зона, генерация на газу → срок окупаемости < 14 мес."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'stroitelstvo-ploshhadok-dlya-majninga-pod-klyuch';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 19, 'heading',
       $tmj${"level":2,"text":"Почему строительство дата-центров особенно выгодно"}$tmj$::jsonb,
       'why-profitable'
FROM articles a WHERE a.slug = 'stroitelstvo-ploshhadok-dlya-majninga-pod-klyuch';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 20, 'list',
       $tmj${"ordered":false,"items":["Контроль инфраструктуры. Собственный ЦОД — это полная автономия от операторов и посредников.","Снижение расходов. Возможность выбирать самые дешевые тарифы на электричество и оптимизировать системы охлаждения.","Рост и масштабирование. Модульные решения позволяют наращивать мощности без остановки работы.","Растущий спрос. Российский рынок ЦОД активно развивается, мощности ежегодно увеличиваются.","Региональные преимущества. Север и Сибирь предлагают дешевую энергию, холодный климат и свободные площадки — идеальные условия для строительства ЦОД в России."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'stroitelstvo-ploshhadok-dlya-majninga-pod-klyuch';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 21, 'image',
       $tmj${"src":"/images/articles/mining-site-turnkey/img-3.jpg","alt":"Почему строительство дата-центров выгодно"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'stroitelstvo-ploshhadok-dlya-majninga-pod-klyuch';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 22, 'heading',
       $tmj${"level":2,"text":"Что важно учесть при запуске ЦОД"}$tmj$::jsonb,
       'checklist'
FROM articles a WHERE a.slug = 'stroitelstvo-ploshhadok-dlya-majninga-pod-klyuch';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 23, 'rich_list',
       $tmj${"ordered":true,"items":[{"title":"Выбор региона (тариф, климат, инфраструктура)","text":""},{"title":"Надежные инженерные системы: питание, охлаждение, безопасность","text":""},{"title":"Управление рисками (пожар, кража, удаленный контроль)","text":""},{"title":"Возможность модернизации без остановки","text":""},{"title":"Юридическая поддержка и получение всех технических условий","text":""}]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'stroitelstvo-ploshhadok-dlya-majninga-pod-klyuch';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 24, 'heading',
       $tmj${"level":2,"text":"Почему стоит заказывать строительство дата-центра «под ключ»"}$tmj$::jsonb,
       'turnkey'
FROM articles a WHERE a.slug = 'stroitelstvo-ploshhadok-dlya-majninga-pod-klyuch';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 25, 'paragraph',
       $tmj${"text":"Подрядчик, предлагающий строительство ЦОД под ключ, берет на себя полный цикл:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'stroitelstvo-ploshhadok-dlya-majninga-pod-klyuch';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 26, 'list',
       $tmj${"ordered":false,"items":["проектирование и аудит,","подбор площадки и оформление ТУ,","строительство и монтаж,","пусконаладку и ввод в эксплуатацию,","дальнейшее техническое сопровождение."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'stroitelstvo-ploshhadok-dlya-majninga-pod-klyuch';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 27, 'paragraph',
       $tmj${"text":"Такой формат позволяет заказчику сосредоточиться на бизнес-результате, а не на операционных вопросах."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'stroitelstvo-ploshhadok-dlya-majninga-pod-klyuch';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 28, 'heading',
       $tmj${"level":2,"text":"Выводы"}$tmj$::jsonb,
       'conclusion'
FROM articles a WHERE a.slug = 'stroitelstvo-ploshhadok-dlya-majninga-pod-klyuch';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 29, 'paragraph',
       $tmj${"text":"Строительство площадки для майнинга — это не просто технический проект, а полноценная инвестиция. Она дает контроль над инфраструктурой, снижает зависимость от аренды и обеспечивает стабильный доход."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'stroitelstvo-ploshhadok-dlya-majninga-pod-klyuch';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 30, 'paragraph',
       $tmj${"text":"В условиях растущего спроса на вычислительные мощности в России именно сейчас — идеальный момент, чтобы построить собственный дата-центр и превратить технологию в актив."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'stroitelstvo-ploshhadok-dlya-majninga-pod-klyuch';

-- ---------------------------------------------------------------------
-- Скрываем stub-статьи из 002 без полноценного тела статьи
-- ---------------------------------------------------------------------
UPDATE articles
SET is_published = FALSE
WHERE slug IN (
    'best-asic-miners-2026',
    'crypto-market-outlook-2026',
    'the-trends-conference',
    'asic-hardware-overview',
    'top-mining-pools-2026',
    'top-mining-ecosystem',
    'mining-consulting-services',
    'hosting-with-discount',
    'tools-build-mining-site',
    'buy-asic-below-market',
    'top-mining-articles-knowledge',
    'where-to-buy-asic',
    'top-mining-ecosystem-overview',
    'modern-mining-datacenter-tools',
    'mining-sites-construction',
    'best-time-to-buy-asic',
    'mining-on-gas-russia',
    'bitcoin-as-investment-asset',
    'mining-datacenter-investment',
    'asic-payback-forecast-2026',
    'mining-investment-entry',
    'mining-farm-budget-planning',
    'hosting-vs-own-site-investment',
    'mining-datacenter-guide'
);
