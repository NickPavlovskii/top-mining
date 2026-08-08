SET client_encoding = 'UTF8';

-- =====================================================================
-- 036_mining_rules_russia_2025_article.sql
-- Статья «Майнинг в России: новые правила 2025 года»
-- Источник: https://top-mining.ru/mining/majning-v-rossii-novye-pravila-2025-goda/
-- =====================================================================

INSERT INTO media_assets (path, alt, source)
VALUES
    (
        '/images/articles/mining-rules-2025/cover.jpg',
        'Майнинг в России: новые правила 2025 года',
        'article_cover'
    ),
    (
        '/images/articles/mining-rules-2025/taxes.jpg',
        'Учет, налоги и отчетность в майнинге',
        'article'
    )
ON CONFLICT (path) DO UPDATE SET alt = EXCLUDED.alt;

INSERT INTO articles (
    slug, title, title_subtitle, excerpt, content, topic_id,
    reading_time_min, reading_minutes, published_at, view_count,
    display_type, sort_order, is_published, uses_blocks,
    image_url, image_alt
) VALUES (
    'majning-v-rossii-novye-pravila-2025-goda',
    'Майнинг в России',
    'Новые правила 2025 года',
    $excerpt$С начала 2025 года в России вступили в силу законодательные изменения, регулирующие майнинг криптовалют. Разбор ключевых положений закона, налогов, ограничений и последствий для рынка.$excerpt$,
    $content$Введение

С начала 2025 года в России вступили в силу законодательные изменения, регулирующие деятельность в сфере майнинга криптовалют. Обновленные нормы налогообложения и юридические условия теперь официально признают криптодобычу как легальную, но строго контролируемую сферу. Ниже – разбор ключевых положений закона и его влияния на рынок.

Что представляет собой майнинг

Майнинг – это вычислительный процесс, в ходе которого специализированные устройства решают криптографические задачи и вносят новые данные в блокчейн-системы. В качестве вознаграждения участники получают цифровую валюту. Несмотря на многолетнее существование майнинга в России, до последнего времени он находился в правовом «сером поле».

По по мнению многих экспертов, необходимость в правовом урегулировании возникла давно. Юристы подчеркивают, что добросовестные участники рынка сталкивались с отказами ФНС в вычетах по НДС при импорте оборудования, что осложняло ведение бизнеса.

Закон о майнинге в России 2025 года: основные положения

Новый закон детализирует, кто и на каких условиях может заниматься майнингом, а также как должна происходить налогооблагаемая и регистрационная деятельность.

Для физических лиц:

Разрешена работа с криптобиржами и цифровыми кошельками;
Майнинг допускается без регистрации в специальном реестре, если объемы потребления электроэнергии не превышают 6 000 кВт·ч в месяц;
Снята ранее обсуждаемая норма о запрете оборота криптовалют в стране.

Для юридических лиц и ИП:

Разрешены покупка и добыча криптовалют при условии включения в государственный реестр майнеров (ФНС);
Бизнес может выступать в роли оператора майнинговых площадок при официальной регистрации;
Прямое использование криптовалюты в расчетах за товары и услуги запрещено, кроме случаев вознаграждения самих майнеров или инфраструктурных операторов.

Ограничения и запреты легального майнинга в РФ

Некоторым категориям лиц и организациям майнинг запрещен:

ИП с непогашенной судимостью по ряду экономических или тяжких преступлений;
Субъекты, находящиеся в санкционных или террористических списках;
Энергетические компании и организации, управляющие электросетями.

Кроме того, с 2025 года майнинг запрещен в 10 регионах, включая республики Северного Кавказа, Донбасс, Херсонскую и Запорожскую области. В некоторых сибирских регионах майнинг ограничен в периоды пикового потребления электричества, с января по март.

Учет, налоги и отчетность

Для физических лиц:

Все сделки с криптовалютой должны быть задокументированы;
Необходимо подавать декларацию 3-НДФЛ до 30 апреля следующего года;
Прибыль от операций облагается НДФЛ по ставке 13% (до 2,4 млн руб. в год) и 15% при превышении этого порога;
При майнинге ставка налога может достигать 22%.

Важно: убыток от продажи монет освобождает от уплаты налога.

Для юридических лиц:

Необходимо включить криптовалюту в учетную политику;
Курсовая стоимость криптовалюты фиксируется на дату операции;
Все транзакции документируются с привязкой к блокчейн-адресам;
Ставка налога на прибыль составляет 25% с 2025 года (ранее — 20%).

Компании и ИП, использующие УСН, ЕСХН или НПД, не могут применять эти режимы, если занимаются эмиссией и продажей криптовалют. В таких случаях допускается только общая система налогообложения.

Требования к регистрации и прозрачности

Участники рынка обязаны:

Встать на учет в Майнинг-реестре ФНС;
Отчитываться о добытых активах и адресах-идентификаторах;
Предоставлять информацию по запросу госорганов, включая ФСБ и Росфинмониторинг;
Дополнительно, с сентября 2024 года президент разрешил использовать криптовалюту во внешнеэкономической деятельности в рамках правового эксперимента. Центробанк займется разработкой платформы для таких расчетов на базе национальной платежной системы.

Последствия для рынка: плюсы и риски

Возможные положительные эффекты:

Легализация и упорядочивание индустрии;
Вывод «серого» майнинга из тени, снижение нагрузки на энергосистему;
Прозрачные условия для крупных инвесторов;
Возможность международных расчетов.

По мнению экспертов, новые правила упрощают работу крупным майнинг-компаниям, тогда как малому бизнесу, скорее всего, придется объединяться в пулы или делегировать часть функций операторам.

Потенциальные минусы легализации майнинга в России:

Банки могут блокировать счета клиентов, совершающих операции с криптовалютами;
Повышенная нагрузка на административные ресурсы малого и среднего бизнеса.

Новые правила майнинга в России: выводы

С 2025 года майнинг в России получил официальное признание, но лишь в обмен на обязательную отчетность, налоговую дисциплину и строгий контроль. Эти меры создают благоприятную среду для масштабного бизнеса, при этом повышая барьер входа для начинающих игроков. При грамотной реализации, закон способен преобразовать крипторынок России в стабильный и прозрачный сегмент экономики.
$content$,
    'mining',
    7,
    7,
    '2025-06-10',
    486,
    'list',
    20,
    TRUE,
    TRUE,
    '/images/articles/mining-rules-2025/cover.jpg',
    'Майнинг в России: новые правила 2025 года'
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
WHERE a.slug = 'majning-v-rossii-novye-pravila-2025-goda'
  AND m.path = '/images/articles/mining-rules-2025/cover.jpg';

DELETE FROM article_blocks
WHERE article_id = (
    SELECT id FROM articles WHERE slug = 'majning-v-rossii-novye-pravila-2025-goda'
);

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 1, 'heading',
       '{"level":2,"text":"Введение"}'::jsonb,
       'intro'
FROM articles a WHERE a.slug = 'majning-v-rossii-novye-pravila-2025-goda';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 2, 'paragraph',
       $tmj${"text":"С начала 2025 года в России вступили в силу законодательные изменения, регулирующие деятельность в сфере майнинга криптовалют. Обновленные нормы налогообложения и юридические условия теперь официально признают криптодобычу как легальную, но строго контролируемую сферу. Ниже – разбор ключевых положений закона и его влияния на рынок."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-v-rossii-novye-pravila-2025-goda';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 3, 'heading',
       '{"level":2,"text":"Что представляет собой майнинг"}'::jsonb,
       'what-is-mining'
FROM articles a WHERE a.slug = 'majning-v-rossii-novye-pravila-2025-goda';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 4, 'paragraph',
       $tmj${"text":"Майнинг – это вычислительный процесс, в ходе которого специализированные устройства решают криптографические задачи и вносят новые данные в блокчейн-системы. В качестве вознаграждения участники получают цифровую валюту. Несмотря на многолетнее существование майнинга в России, до последнего времени он находился в правовом «сером поле»."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-v-rossii-novye-pravila-2025-goda';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 5, 'paragraph',
       $tmj${"text":"По по мнению многих экспертов, необходимость в правовом урегулировании возникла давно. Юристы подчеркивают, что добросовестные участники рынка сталкивались с отказами ФНС в вычетах по НДС при импорте оборудования, что осложняло ведение бизнеса."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-v-rossii-novye-pravila-2025-goda';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 6, 'image',
       $tmj${"src":"/images/articles/mining-rules-2025/cover.jpg","alt":"Майнинг в России: законодательное регулирование"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-v-rossii-novye-pravila-2025-goda';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 7, 'heading',
       '{"level":2,"text":"Закон о майнинге в России 2025 года: основные положения"}'::jsonb,
       'law-basics'
FROM articles a WHERE a.slug = 'majning-v-rossii-novye-pravila-2025-goda';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 8, 'paragraph',
       $tmj${"text":"Новый закон детализирует, кто и на каких условиях может заниматься майнингом, а также как должна происходить налогооблагаемая и регистрационная деятельность."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-v-rossii-novye-pravila-2025-goda';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 9, 'paragraph',
       $tmj${"text":"Для физических лиц:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-v-rossii-novye-pravila-2025-goda';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 10, 'list',
       $tmj${"ordered":false,"items":["Разрешена работа с криптобиржами и цифровыми кошельками;","Майнинг допускается без регистрации в специальном реестре, если объемы потребления электроэнергии не превышают 6 000 кВт·ч в месяц;","Снята ранее обсуждаемая норма о запрете оборота криптовалют в стране."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-v-rossii-novye-pravila-2025-goda';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 11, 'paragraph',
       $tmj${"text":"Для юридических лиц и ИП:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-v-rossii-novye-pravila-2025-goda';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 12, 'list',
       $tmj${"ordered":false,"items":["Разрешены покупка и добыча криптовалют при условии включения в государственный реестр майнеров (ФНС);","Бизнес может выступать в роли оператора майнинговых площадок при официальной регистрации;","Прямое использование криптовалюты в расчетах за товары и услуги запрещено, кроме случаев вознаграждения самих майнеров или инфраструктурных операторов."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-v-rossii-novye-pravila-2025-goda';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 13, 'heading',
       '{"level":2,"text":"Ограничения и запреты легального майнинга в РФ"}'::jsonb,
       'restrictions'
FROM articles a WHERE a.slug = 'majning-v-rossii-novye-pravila-2025-goda';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 14, 'paragraph',
       $tmj${"text":"Некоторым категориям лиц и организациям майнинг запрещен:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-v-rossii-novye-pravila-2025-goda';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 15, 'rich_list',
       $tmj${"ordered":true,"items":[{"title":"ИП с непогашенной судимостью по ряду экономических или тяжких преступлений","text":""},{"title":"Субъекты, находящиеся в санкционных или террористических списках","text":""},{"title":"Энергетические компании и организации, управляющие электросетями","text":""}]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-v-rossii-novye-pravila-2025-goda';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 16, 'paragraph',
       $tmj${"text":"Кроме того, с 2025 года майнинг запрещен в 10 регионах, включая республики Северного Кавказа, Донбасс, Херсонскую и Запорожскую области. В некоторых сибирских регионах майнинг ограничен в периоды пикового потребления электричества, с января по март."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-v-rossii-novye-pravila-2025-goda';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 17, 'heading',
       '{"level":2,"text":"Учет, налоги и отчетность"}'::jsonb,
       'taxes'
FROM articles a WHERE a.slug = 'majning-v-rossii-novye-pravila-2025-goda';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 18, 'paragraph',
       $tmj${"text":"Для физических лиц:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-v-rossii-novye-pravila-2025-goda';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 19, 'list',
       $tmj${"ordered":false,"items":["Все сделки с криптовалютой должны быть задокументированы;","Необходимо подавать декларацию 3-НДФЛ до 30 апреля следующего года;","Прибыль от операций облагается НДФЛ по ставке 13% (до 2,4 млн руб. в год) и 15% при превышении этого порога;","При майнинге ставка налога может достигать 22%."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-v-rossii-novye-pravila-2025-goda';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 20, 'paragraph',
       $tmj${"text":"Важно: убыток от продажи монет освобождает от уплаты налога."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-v-rossii-novye-pravila-2025-goda';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 21, 'paragraph',
       $tmj${"text":"Для юридических лиц:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-v-rossii-novye-pravila-2025-goda';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 22, 'list',
       $tmj${"ordered":false,"items":["Необходимо включить криптовалюту в учетную политику;","Курсовая стоимость криптовалюты фиксируется на дату операции;","Все транзакции документируются с привязкой к блокчейн-адресам;","Ставка налога на прибыль составляет 25% с 2025 года (ранее — 20%)."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-v-rossii-novye-pravila-2025-goda';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 23, 'paragraph',
       $tmj${"text":"Компании и ИП, использующие УСН, ЕСХН или НПД, не могут применять эти режимы, если занимаются эмиссией и продажей криптовалют. В таких случаях допускается только общая система налогообложения."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-v-rossii-novye-pravila-2025-goda';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 24, 'image',
       $tmj${"src":"/images/articles/mining-rules-2025/taxes.jpg","alt":"Учет, налоги и отчетность в майнинге"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-v-rossii-novye-pravila-2025-goda';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 25, 'heading',
       '{"level":2,"text":"Требования к регистрации и прозрачности"}'::jsonb,
       'registration'
FROM articles a WHERE a.slug = 'majning-v-rossii-novye-pravila-2025-goda';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 26, 'paragraph',
       $tmj${"text":"Участники рынка обязаны:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-v-rossii-novye-pravila-2025-goda';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 27, 'rich_list',
       $tmj${"ordered":true,"items":[{"title":"Встать на учет в Майнинг-реестре ФНС","text":""},{"title":"Отчитываться о добытых активах и адресах-идентификаторах","text":""},{"title":"Предоставлять информацию по запросу госорганов, включая ФСБ и Росфинмониторинг","text":""},{"title":"Дополнительно, с сентября 2024 года президент разрешил использовать криптовалюту во внешнеэкономической деятельности в рамках правового эксперимента","text":"Центробанк займется разработкой платформы для таких расчетов на базе национальной платежной системы."}]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-v-rossii-novye-pravila-2025-goda';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 28, 'heading',
       '{"level":2,"text":"Последствия для рынка: плюсы и риски"}'::jsonb,
       'market-impact'
FROM articles a WHERE a.slug = 'majning-v-rossii-novye-pravila-2025-goda';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 29, 'paragraph',
       $tmj${"text":"Возможные положительные эффекты:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-v-rossii-novye-pravila-2025-goda';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 30, 'list',
       $tmj${"ordered":false,"items":["Легализация и упорядочивание индустрии;","Вывод «серого» майнинга из тени, снижение нагрузки на энергосистему;","Прозрачные условия для крупных инвесторов;","Возможность международных расчетов."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-v-rossii-novye-pravila-2025-goda';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 31, 'paragraph',
       $tmj${"text":"По мнению экспертов, новые правила упрощают работу крупным майнинг-компаниям, тогда как малому бизнесу, скорее всего, придется объединяться в пулы или делегировать часть функций операторам."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-v-rossii-novye-pravila-2025-goda';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 32, 'paragraph',
       $tmj${"text":"Потенциальные минусы легализации майнинга в России:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-v-rossii-novye-pravila-2025-goda';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 33, 'list',
       $tmj${"ordered":false,"items":["Банки могут блокировать счета клиентов, совершающих операции с криптовалютами;","Повышенная нагрузка на административные ресурсы малого и среднего бизнеса."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-v-rossii-novye-pravila-2025-goda';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 34, 'heading',
       '{"level":2,"text":"Новые правила майнинга в России: выводы"}'::jsonb,
       'conclusion'
FROM articles a WHERE a.slug = 'majning-v-rossii-novye-pravila-2025-goda';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 35, 'paragraph',
       $tmj${"text":"С 2025 года майнинг в России получил официальное признание, но лишь в обмен на обязательную отчетность, налоговую дисциплину и строгий контроль. Эти меры создают благоприятную среду для масштабного бизнеса, при этом повышая барьер входа для начинающих игроков. При грамотной реализации, закон способен преобразовать крипторынок России в стабильный и прозрачный сегмент экономики."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-v-rossii-novye-pravila-2025-goda';
