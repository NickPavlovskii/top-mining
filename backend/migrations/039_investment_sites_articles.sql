SET client_encoding = 'UTF8';

-- =====================================================================
-- 039_investment_sites_articles.sql
-- Инвестиции: строительство площадок + агрегатор площадок.
-- (chto-delat-s-bitkoinom... уже в 037)
-- =====================================================================

INSERT INTO media_assets (path, alt, source)
VALUES
    ('/images/articles/mining-site-build/cover.jpg', 'Строительство майнинг-площадок под ключ', 'article_cover'),
    ('/images/articles/mining-site-build/img-1.jpg', 'Что значит строительство площадок под ключ', 'article'),
    ('/images/articles/mining-site-build/img-2.jpg', 'Этапы строительства площадки для майнинга', 'article'),
    ('/images/articles/mining-site-build/img-3.jpg', 'Почему стоит инвестировать в собственную площадку', 'article'),
    ('/images/articles/sites-aggregator/cover.jpg', 'Агрегатор площадок для майнинга', 'article_cover'),
    ('/images/articles/sites-aggregator/img-1.jpg', 'Требования к площадке для майнинга', 'article'),
    ('/images/articles/sites-aggregator/img-2.jpg', 'Как продать площадку для майнинга', 'article')
ON CONFLICT (path) DO UPDATE SET alt = EXCLUDED.alt;

-- https://top-mining.ru/investiczii/stroitelstvo-majning-ploshhadok-pod-klyuch-ot-idei-do-zapuska-moshhnostej/

INSERT INTO articles (
    slug, title, title_subtitle, excerpt, content, topic_id,
    reading_time_min, reading_minutes, published_at, view_count,
    display_type, sort_order, is_published, uses_blocks,
    image_url, image_alt
) VALUES (
    'stroitelstvo-majning-ploshhadok-pod-klyuch-ot-idei-do-zapuska-moshhnostej',
    'Строительство майнинг-площадок под ключ',
    'От идеи до запуска мощностей',
    $excerpt$Полный цикл строительства дата-центра для майнинга: аудит, проектирование, стройка, оснащение, кейсы и выгоды собственной площадки.$excerpt$,
    $content$Создание собственной майнинг-площадки — стратегическое решение. Разбираем, что значит «под ключ», этапы строительства и почему выгодна собственная инфраструктура.$content$,
    'investments',
    7,
    7,
    '2025-05-12',
    332,
    'list',
    36,
    TRUE,
    TRUE,
    '/images/articles/mining-site-build/cover.jpg',
    'Строительство майнинг-площадок под ключ'
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
WHERE a.slug = 'stroitelstvo-majning-ploshhadok-pod-klyuch-ot-idei-do-zapuska-moshhnostej'
  AND m.path = '/images/articles/mining-site-build/cover.jpg';

DELETE FROM article_blocks
WHERE article_id = (SELECT id FROM articles WHERE slug = 'stroitelstvo-majning-ploshhadok-pod-klyuch-ot-idei-do-zapuska-moshhnostej');

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 1, 'heading',
       $tmj${"level":2,"text":"Введение"}$tmj$::jsonb,
       'intro'
FROM articles a WHERE a.slug = 'stroitelstvo-majning-ploshhadok-pod-klyuch-ot-idei-do-zapuska-moshhnostej';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 2, 'paragraph',
       $tmj${"text":"Создание собственной майнинг-площадки – это не просто бизнес, а стратегическое решение, обеспечивающее инвестициям устойчивость, технологическую независимость и значительную экономию. Если вы рассматриваете возможность инвестировать в майнинг, то собственный дата-центр под ключ – это фундаментальный актив, который работает на вас каждый день."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'stroitelstvo-majning-ploshhadok-pod-klyuch-ot-idei-do-zapuska-moshhnostej';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 3, 'paragraph',
       $tmj${"text":"Мы занимаемся проектированием и строительством дата-центров любой сложности. Наша экспертиза охватывает полный цикл работ: от первичного аудита и инженерного проектирования до пуско-наладки, ввода объекта в эксплуатацию и последующего сопровождения."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'stroitelstvo-majning-ploshhadok-pod-klyuch-ot-idei-do-zapuska-moshhnostej';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 4, 'heading',
       $tmj${"level":2,"text":"Что значит строительство площадок для майнинга «под ключ»?"}$tmj$::jsonb,
       'what-turnkey'
FROM articles a WHERE a.slug = 'stroitelstvo-majning-ploshhadok-pod-klyuch-ot-idei-do-zapuska-moshhnostej';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 5, 'paragraph',
       $tmj${"text":"Формулировка «под ключ» базируется на концепции, согласно которой мы берем на себя абсолютно все этапы и задачи: от анализа перспективности площадки и ее энергообеспечения до установки оборудования и запуска объекта. Вы получаете полностью готовую к эксплуатации инфраструктуру, не тратя время на подбор подрядчиков, координацию логистики и решение технических задач. Все работы ведет единая команда с опытным техническим директором."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'stroitelstvo-majning-ploshhadok-pod-klyuch-ot-idei-do-zapuska-moshhnostej';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 6, 'paragraph',
       $tmj${"text":"Кому это подходит:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'stroitelstvo-majning-ploshhadok-pod-klyuch-ot-idei-do-zapuska-moshhnostej';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 7, 'list',
       $tmj${"ordered":false,"items":["Инвесторам, желающим снизить издержки на аренду;","Крупным майнерам, обладающим десятками и даже сотнями устройств;","Бизнесменам, запускающим свой майнинг-отель;","Компаниям, желающим увеличить стоимость собственных активов;","ИТ-компаниям, которым нужен доступ к собственной энергоэффективной инфраструктуре."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'stroitelstvo-majning-ploshhadok-pod-klyuch-ot-idei-do-zapuska-moshhnostej';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 8, 'image',
       $tmj${"src":"/images/articles/mining-site-build/img-1.jpg","alt":"Что значит строительство площадок под ключ"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'stroitelstvo-majning-ploshhadok-pod-klyuch-ot-idei-do-zapuska-moshhnostej';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 9, 'heading',
       $tmj${"level":2,"text":"Основные этапы строительства площадки для майнинга"}$tmj$::jsonb,
       'stages'
FROM articles a WHERE a.slug = 'stroitelstvo-majning-ploshhadok-pod-klyuch-ot-idei-do-zapuska-moshhnostej';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 10, 'paragraph',
       $tmj${"text":"Весь процесс строительства профессиональной площадки для майнинга можно разделить на три этапа. Рассмотрим каждый из них детально:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'stroitelstvo-majning-ploshhadok-pod-klyuch-ot-idei-do-zapuska-moshhnostej';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 11, 'rich_list',
       $tmj${"ordered":true,"items":[{"title":"Технический аудит и проектирование","text":"Мы начинаем с глубокого анализа бизнес-задач и площадки. Этот этап позволяет на ранней стадии предотвратить ошибки, заложить оптимальную архитектуру и предусмотреть масштабируемость. Что включает анализ: оценку предполагаемой IT-нагрузки (количество серверов, хэшрейт, энергопотребление), изучение доступных энергоресурсов, сетей, каналов связи, разработку архитектуры будущего ЦОД (тип резервирования, система охлаждения, источники бесперебойного питания). Пример: для одного из клиентов мы спроектировали модульный дата-центр мощностью 30 МВт, разделенный на шесть независимых сегментов, каждый из которых обслуживается автономно. Это обеспечило высокую отказоустойчивость и простоту управления;"},{"title":"Подбор площадки и строительные работы","text":"Мы помогаем выбрать оптимальное место: стоимость земли, близость к ЛЭП, климат, логистика – абсолютно все играет важную роль. Что мы делаем: строим здания или собираем модульные конструкции, устанавливаем системы пожаротушения, охлаждения, контроля доступа, климат-контроля, прокладываем энергетическую инфраструктуру (трансформаторы, ИБП, дизель-генераторы, распределительные щиты). Пример: в Сибири мы реализовали проект на базе контейнерного ЦОДа. Это решение позволило сократить сроки строительства на 40% и упростить доставку и монтаж оборудования на удалённой территории;"},{"title":"Оснащение и запуск","text":"Когда площадка готова, начинается финальный этап – установка оборудования и настройка всех систем. Этап включает установку серверных стоек, коммутаторов, маршрутизаторов, интеграцию систем охлаждения, настройку резервных систем и запуск нагрузочных и температурных тестов. Пример: один из наших ЦОДов успешно прошел стресс-тестирование при температуре +35°C, работая на 100% мощности без сбоев. Это стало возможным во многом благодаря продуманной системе охлаждения и резервного питания."}]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'stroitelstvo-majning-ploshhadok-pod-klyuch-ot-idei-do-zapuska-moshhnostej';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 12, 'image',
       $tmj${"src":"/images/articles/mining-site-build/img-2.jpg","alt":"Этапы строительства площадки для майнинга"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'stroitelstvo-majning-ploshhadok-pod-klyuch-ot-idei-do-zapuska-moshhnostej';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 13, 'heading',
       $tmj${"level":2,"text":"Почему стоит инвестировать в собственную майнинг-площадку?"}$tmj$::jsonb,
       'why-invest'
FROM articles a WHERE a.slug = 'stroitelstvo-majning-ploshhadok-pod-klyuch-ot-idei-do-zapuska-moshhnostej';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 14, 'paragraph',
       $tmj${"text":"Три причины, почему именно формат собственной площадки для майнинга оптимален в случае ощутимых инвестиций в сегмент добычи цифровых активов:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'stroitelstvo-majning-ploshhadok-pod-klyuch-ot-idei-do-zapuska-moshhnostej';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 15, 'list',
       $tmj${"ordered":false,"items":["Экономия в долгосрочной перспективе. Собственные мощности позволяют экономить от 1,5 до 2 млн рублей в месяц при подключении 1 МВт. За год — это до 25 млн рублей чистой экономии. При этом вы можете подключаться напрямую по оптовым тарифам и влиять на структуру издержек;","Полный контроль. Вы сами определяете архитектуру, доступ, уровень резервирования. Не менее важна независимость от провайдеров и арендодателей, а также возможность быстрой модернизации и гибкой настройки под задачи бизнеса;","Масштабируемость без лишних затрат. Модульная архитектура позволяет быстро наращивать мощности. Добавить стойки, увеличить питание, модернизировать охлаждение – все это возможно без остановки работы объекта."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'stroitelstvo-majning-ploshhadok-pod-klyuch-ot-idei-do-zapuska-moshhnostej';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 16, 'image',
       $tmj${"src":"/images/articles/mining-site-build/img-3.jpg","alt":"Почему стоит инвестировать в собственную площадку"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'stroitelstvo-majning-ploshhadok-pod-klyuch-ot-idei-do-zapuska-moshhnostej';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 17, 'paragraph',
       $tmj${"text":"Пример: клиент, владеющий дата-центром на 1 МВт, увеличил мощность до 2,5 МВт за 6 месяцев без прерывания операций и модернизировал системы охлаждения в процессе."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'stroitelstvo-majning-ploshhadok-pod-klyuch-ot-idei-do-zapuska-moshhnostej';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 18, 'heading',
       $tmj${"level":2,"text":"Строительство майнинг площадки вместе с ТОП МАЙНИНГ"}$tmj$::jsonb,
       'with-us'
FROM articles a WHERE a.slug = 'stroitelstvo-majning-ploshhadok-pod-klyuch-ot-idei-do-zapuska-moshhnostej';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 19, 'paragraph',
       $tmj${"text":"Преимущества работы с нами:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'stroitelstvo-majning-ploshhadok-pod-klyuch-ot-idei-do-zapuska-moshhnostej';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 20, 'list',
       $tmj${"ordered":false,"items":["Инженерная экспертиза: в штате архитекторы, инженеры, проектировщики, специалисты по охлаждению и электропитанию;","Гибкость решений: от контейнерных решений до капитальных зданий;","Проектирование по международным стандартам;","Полное сопровождение: лицензирование, согласования, сервисное обслуживание, управление энергетикой."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'stroitelstvo-majning-ploshhadok-pod-klyuch-ot-idei-do-zapuska-moshhnostej';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 21, 'heading',
       $tmj${"level":2,"text":"Примеры и кейсы"}$tmj$::jsonb,
       'cases'
FROM articles a WHERE a.slug = 'stroitelstvo-majning-ploshhadok-pod-klyuch-ot-idei-do-zapuska-moshhnostej';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 22, 'rich_list',
       $tmj${"ordered":false,"items":[{"title":"Кейс 1: От хостинга к собственному дата-центру","text":"До: ИТ-предприниматель из Татарстана арендовал 100 кВт мощности на внешнем хостинге. Ежемесячные расходы на услуги составили около 700 000 рублей, без учета комиссии за обслуживание. Были случаи отключений и перегрева оборудования. После: После строительства собственной площадки на 120 кВт затраты снизились почти вдвое – за счет прямого подключения к сетям и отсутствия посредников. Удалось сократить расходы на обслуживание, получить полный контроль над оборудованием и избежать простоя. Окупаемость – менее 18 месяцев."},{"title":"Кейс 2: Рост в лизинг — расширение без лишних рисков","text":"Ситуация: компания из Новосибирска эксплуатировала майнинг-центр мощностью 1,2 МВт. При устойчивом рынке и прогнозируемом доходе было принято решение о масштабировании. Решение: за счет роста активов компания получила возможность взять оборудование в лизинг, не отвлекая оборотные средства. Построив вторую очередь площадки, бизнес увеличил производительность на 70% без критических инвестиций."},{"title":"Кейс 3: Двойной доход — собственный майнинг + хостинг","text":"История: владелец промышленной площадки в Хакасии построил дата-центр на 3 МВт, из которых только 2 МВт были задействованы для собственного майнинга. Результат: оставшиеся 1 МВт он сдает в аренду под хостинг другим майнерам, получая стабильный доход с каждого размещенного устройства. Это дало возможность сократить срок окупаемости и дополнительно покрывать расходы на инфраструктуру."},{"title":"Кейс 4: Мобильная площадка для масштабируемого майнинга","text":"Решение: один из заказчиков выбрал модульный дата-центр в контейнерном исполнении (2×40-футовых блоков). Благодаря гибкости решения он смог оперативно перевезти площадку в регион с более дешевой электроэнергией, сэкономив до 30% ежемесячно."},{"title":"Кейс 5: Инвестпроект под управление","text":"Сценарий: частный инвестор решил вложиться в майнинг как в актив, но без желания заниматься операционной деятельностью. Мы реализовали для него проект «под ключ» – от подбора площадки и строительства до найма персонала и настройки оборудования. Результат: через 4 месяца площадка на 800 кВт была полностью запущена и управляется по доверительной модели, принося стабильный пассивный доход."}]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'stroitelstvo-majning-ploshhadok-pod-klyuch-ot-idei-do-zapuska-moshhnostej';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 23, 'paragraph',
       $tmj${"text":"Еще больше примеров и кейсов мы рассмотрели в отдельной статье."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'stroitelstvo-majning-ploshhadok-pod-klyuch-ot-idei-do-zapuska-moshhnostej';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 24, 'heading',
       $tmj${"level":2,"text":"Готовы обсудить ваш проект?"}$tmj$::jsonb,
       'cta'
FROM articles a WHERE a.slug = 'stroitelstvo-majning-ploshhadok-pod-klyuch-ot-idei-do-zapuska-moshhnostej';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 25, 'paragraph',
       $tmj${"text":"Оставьте заявку, и мы проведем бесплатную предварительную оценку, рассчитаем мощность, определим архитектуру дата-центра под ваши задачи и составим ориентировочный бюджет. Постройте дата-центр, который работает только на вас!"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'stroitelstvo-majning-ploshhadok-pod-klyuch-ot-idei-do-zapuska-moshhnostej';

-- https://top-mining.ru/investiczii/pervyj-agregator-ploshhadok-dlya-majninga-top-majning-kak-kupit-prodat-i-arendovat-prostranstvo-dlya-dobychi-kriptovalyut/

INSERT INTO articles (
    slug, title, title_subtitle, excerpt, content, topic_id,
    reading_time_min, reading_minutes, published_at, view_count,
    display_type, sort_order, is_published, uses_blocks,
    image_url, image_alt
) VALUES (
    'pervyj-agregator-ploshhadok-dlya-majninga-top-majning-kak-kupit-prodat-i-arendovat-prostranstvo-dlya-dobychi-kriptovalyut',
    'Первый агрегатор площадок для майнинга',
    'Как купить, продать и арендовать пространство для добычи криптовалют?',
    $excerpt$Как через ТОП-МАЙНИНГ купить, продать или арендовать площадку для майнинга: требования к инфраструктуре, примеры сделок и преимущества агрегатора.$excerpt$,
    $content$Площадка для майнинга определяет эффективность оборудования и затраты. Разбираем, как купить, продать или арендовать площадку через агрегатор ТОП-МАЙНИНГ.$content$,
    'investments',
    8,
    8,
    '2025-05-06',
    672,
    'list',
    37,
    TRUE,
    TRUE,
    '/images/articles/sites-aggregator/cover.jpg',
    'Агрегатор площадок для майнинга'
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
WHERE a.slug = 'pervyj-agregator-ploshhadok-dlya-majninga-top-majning-kak-kupit-prodat-i-arendovat-prostranstvo-dlya-dobychi-kriptovalyut'
  AND m.path = '/images/articles/sites-aggregator/cover.jpg';

DELETE FROM article_blocks
WHERE article_id = (SELECT id FROM articles WHERE slug = 'pervyj-agregator-ploshhadok-dlya-majninga-top-majning-kak-kupit-prodat-i-arendovat-prostranstvo-dlya-dobychi-kriptovalyut');

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 1, 'heading',
       $tmj${"level":2,"text":"Введение"}$tmj$::jsonb,
       'intro'
FROM articles a WHERE a.slug = 'pervyj-agregator-ploshhadok-dlya-majninga-top-majning-kak-kupit-prodat-i-arendovat-prostranstvo-dlya-dobychi-kriptovalyut';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 2, 'paragraph',
       $tmj${"text":"Развитие майнинга сегодня требует не только современного оборудования, но и грамотного подхода к инфраструктуре. Площадка для майнинга – это основа всего процесса: именно она определяет, насколько эффективно будет работать оборудование, каковы будут затраты на электричество, охлаждение и обслуживание. Что представляет собой площадка для майнинга? Зачем использовать агрегатор? Как купить, продать или арендовать площадку для майнинга через платформу ТОП-МАЙНИНГ и почему это выгодно? Обо всем этом подробно и в деталях."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'pervyj-agregator-ploshhadok-dlya-majninga-top-majning-kak-kupit-prodat-i-arendovat-prostranstvo-dlya-dobychi-kriptovalyut';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 3, 'heading',
       $tmj${"level":2,"text":"Что такое площадка для майнинга и какие требования существуют?"}$tmj$::jsonb,
       'what-is'
FROM articles a WHERE a.slug = 'pervyj-agregator-ploshhadok-dlya-majninga-top-majning-kak-kupit-prodat-i-arendovat-prostranstvo-dlya-dobychi-kriptovalyut';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 4, 'paragraph',
       $tmj${"text":"Площадка для майнинга – это место, специально подготовленное для размещения вычислительного оборудования (как правило, асиков для BTC и альткоинов), обеспеченное достаточной мощностью электроснабжения, системами охлаждения и защиты. Это может быть как небольшой контейнер, так и промышленный дата-центр мощностью в десятки и даже сотни мегаватт."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'pervyj-agregator-ploshhadok-dlya-majninga-top-majning-kak-kupit-prodat-i-arendovat-prostranstvo-dlya-dobychi-kriptovalyut';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 5, 'paragraph',
       $tmj${"text":"Основные требования к площадкам для майнинга:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'pervyj-agregator-ploshhadok-dlya-majninga-top-majning-kak-kupit-prodat-i-arendovat-prostranstvo-dlya-dobychi-kriptovalyut';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 6, 'list',
       $tmj${"ordered":false,"items":["Электрическая мощность и стабильность подачи. Основной параметр – наличие высокомощной и надежной линии электропитания. Чем выше потребление, тем серьезнее требования к трансформаторным подстанциям, кабельным линиям и согласованиям с энергосбытовыми организациями;","Низкий тариф на электроэнергию. Это один из ключевых факторов. В среднем разница между тарифами в регионах России может составлять до 40–50%. Поэтому география размещения ферм напрямую влияет на доходность;","Охлаждение и вентиляция. Современное оборудование выделяет огромное количество тепла. Без принудительной вентиляции, водяного или иммерсионного охлаждения ферма долго не проработает;","Физическая безопасность. Заборы, камеры видеонаблюдения, контроль доступа, наличие обслуживающего персонала – все это критично при больших объемах оборудования;","Юридическая прозрачность. Площадка должна быть легализована: земля в собственности или аренде, разрешение на подключение, отсутствие «серых» схем. Особое внимание уделяется соответствию новому законодательству о майнинге в России, которое появилось в 2024 году, а в 2025-м начало активно применяться на практике."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'pervyj-agregator-ploshhadok-dlya-majninga-top-majning-kak-kupit-prodat-i-arendovat-prostranstvo-dlya-dobychi-kriptovalyut';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 7, 'image',
       $tmj${"src":"/images/articles/sites-aggregator/img-1.jpg","alt":"Требования к площадке для майнинга"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'pervyj-agregator-ploshhadok-dlya-majninga-top-majning-kak-kupit-prodat-i-arendovat-prostranstvo-dlya-dobychi-kriptovalyut';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 8, 'paragraph',
       $tmj${"text":"Пример: ферма на 30 МВт в Московской области может быть размещена в промышленной зоне с выгодным тарифом на электроэнергию около 5,3 руб./кВт⋅ч. Это дешевле, чем во многих других майнинг-отелях, что позволяет окупить вложения значительно быстрее."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'pervyj-agregator-ploshhadok-dlya-majninga-top-majning-kak-kupit-prodat-i-arendovat-prostranstvo-dlya-dobychi-kriptovalyut';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 9, 'heading',
       $tmj${"level":2,"text":"Как купить площадку для майнинга?"}$tmj$::jsonb,
       'buy'
FROM articles a WHERE a.slug = 'pervyj-agregator-ploshhadok-dlya-majninga-top-majning-kak-kupit-prodat-i-arendovat-prostranstvo-dlya-dobychi-kriptovalyut';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 10, 'paragraph',
       $tmj${"text":"Если инвестор планирует заниматься майнингом в больших объемах, выгоднее всего купить собственную площадку для майнинга. Это даст вам полный контроль над инфраструктурой и возможность оптимизировать расходы под свои задачи."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'pervyj-agregator-ploshhadok-dlya-majninga-top-majning-kak-kupit-prodat-i-arendovat-prostranstvo-dlya-dobychi-kriptovalyut';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 11, 'paragraph',
       $tmj${"text":"Где найти максимально полный перечень вариантов? Как убедиться, что документы в порядке, а инфраструктура действительно соответствует заявленным характеристикам?"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'pervyj-agregator-ploshhadok-dlya-majninga-top-majning-kak-kupit-prodat-i-arendovat-prostranstvo-dlya-dobychi-kriptovalyut';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 12, 'paragraph',
       $tmj${"text":"Именно для решения этих задач мы запустили ТОП-МАЙНИНГ – первый агрегатор площадок для майнинга. Платформа создана для того, чтобы собрать на одном ресурсе все предложения по размещению ферм. Здесь можно купить площадку для майнинга любого масштаба: от 50 кВт до 50 МВт и выше. В каталоге представлены:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'pervyj-agregator-ploshhadok-dlya-majninga-top-majning-kak-kupit-prodat-i-arendovat-prostranstvo-dlya-dobychi-kriptovalyut';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 13, 'list',
       $tmj${"ordered":false,"items":["Подключенные участки в Сибири, на Урале, в Поволжье и других регионах;","Новые площадки под строительство с выведенными мощностями;","Объекты с готовыми зданиями и инфраструктурой;","Региональные предложения с уникальными условиями по тарифам."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'pervyj-agregator-ploshhadok-dlya-majninga-top-majning-kak-kupit-prodat-i-arendovat-prostranstvo-dlya-dobychi-kriptovalyut';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 14, 'paragraph',
       $tmj${"text":"Преимущества покупки площадки для майнинга через ТОП-МАЙНИНГ:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'pervyj-agregator-ploshhadok-dlya-majninga-top-majning-kak-kupit-prodat-i-arendovat-prostranstvo-dlya-dobychi-kriptovalyut';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 15, 'rich_list',
       $tmj${"ordered":true,"items":[{"title":"Широкий выбор","text":"совокупная мощность всех доступных объектов превышает 150 мегаватт;"},{"title":"Проверенные объекты","text":"все площадки проходят тщательную проверку и верификацию;"},{"title":"Реальные технические параметры","text":"фотографии, юридический статус;"},{"title":"Возможность привлечения инвестиционных партнеров","text":""}]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'pervyj-agregator-ploshhadok-dlya-majninga-top-majning-kak-kupit-prodat-i-arendovat-prostranstvo-dlya-dobychi-kriptovalyut';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 16, 'paragraph',
       $tmj${"text":"Пример: инвестор из Иркутска после введения полного запрета на майнинг в своем регионе приобрел через наш агрегатор площадку мощностью 3 МВт в Тверской области. Стоимость 1 кВт подключения составила 12 000 рублей – в два раза дешевле, чем при строительстве с нуля. Дополнительно: доступ к промышленному тарифу – около 5 руб./кВт⋅ч."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'pervyj-agregator-ploshhadok-dlya-majninga-top-majning-kak-kupit-prodat-i-arendovat-prostranstvo-dlya-dobychi-kriptovalyut';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 17, 'heading',
       $tmj${"level":2,"text":"Как продать площадку для майнинга?"}$tmj$::jsonb,
       'sell'
FROM articles a WHERE a.slug = 'pervyj-agregator-ploshhadok-dlya-majninga-top-majning-kak-kupit-prodat-i-arendovat-prostranstvo-dlya-dobychi-kriptovalyut';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 18, 'paragraph',
       $tmj${"text":"Если вы владеете действующей фермой или есть участок с подведенными мощностями – у вас есть актив, который можно монетизировать. Вы можете продать площадку для майнинга быстро и выгодно с помощью агрегатора ТОП-МАЙНИНГ."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'pervyj-agregator-ploshhadok-dlya-majninga-top-majning-kak-kupit-prodat-i-arendovat-prostranstvo-dlya-dobychi-kriptovalyut';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 19, 'paragraph',
       $tmj${"text":"Работая с нами, вы получаете:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'pervyj-agregator-ploshhadok-dlya-majninga-top-majning-kak-kupit-prodat-i-arendovat-prostranstvo-dlya-dobychi-kriptovalyut';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 20, 'list',
       $tmj${"ordered":false,"items":["Размещение на крупнейшем агрегаторе площадок для майнинга;","Привлечение покупателя из актуальной базы инвесторов;","Помощь с оценкой и подготовкой документации."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'pervyj-agregator-ploshhadok-dlya-majninga-top-majning-kak-kupit-prodat-i-arendovat-prostranstvo-dlya-dobychi-kriptovalyut';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 21, 'image',
       $tmj${"src":"/images/articles/sites-aggregator/img-2.jpg","alt":"Как продать площадку для майнинга"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'pervyj-agregator-ploshhadok-dlya-majninga-top-majning-kak-kupit-prodat-i-arendovat-prostranstvo-dlya-dobychi-kriptovalyut';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 22, 'paragraph',
       $tmj${"text":"Пример: владелец площадки в Сибири с мощностью 10 МВт выставил объект на ТОП-МАЙНИНГ. Через 18 дней был найден покупатель, заинтересованный в размещении своей фермы. Сделка закрылась в течение месяца."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'pervyj-agregator-ploshhadok-dlya-majninga-top-majning-kak-kupit-prodat-i-arendovat-prostranstvo-dlya-dobychi-kriptovalyut';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 23, 'heading',
       $tmj${"level":2,"text":"Аренда площадок для майнинга"}$tmj$::jsonb,
       'rent'
FROM articles a WHERE a.slug = 'pervyj-agregator-ploshhadok-dlya-majninga-top-majning-kak-kupit-prodat-i-arendovat-prostranstvo-dlya-dobychi-kriptovalyut';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 24, 'paragraph',
       $tmj${"text":"Покупка не всегда оптимальна, и мы это знаем: в ряде случаев разумнее арендовать площадку для майнинга, особенно на первом этапе, когда только тестируется модель, оборудование и тарифы."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'pervyj-agregator-ploshhadok-dlya-majninga-top-majning-kak-kupit-prodat-i-arendovat-prostranstvo-dlya-dobychi-kriptovalyut';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 25, 'paragraph',
       $tmj${"text":"Через агрегатор площадок для майнинга ТОП-МАЙНИНГ вы можете:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'pervyj-agregator-ploshhadok-dlya-majninga-top-majning-kak-kupit-prodat-i-arendovat-prostranstvo-dlya-dobychi-kriptovalyut';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 26, 'list',
       $tmj${"ordered":false,"items":["Арендовать площадку для майнинга на гибких условиях: от нескольких юнитов до целых контейнеров;","Выбрать площадку по региону, цене за кВт⋅ч, условиям обслуживания;","Найти площадки с обслуживанием «под ключ» – подключение, настройка, ремонт."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'pervyj-agregator-ploshhadok-dlya-majninga-top-majning-kak-kupit-prodat-i-arendovat-prostranstvo-dlya-dobychi-kriptovalyut';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 27, 'paragraph',
       $tmj${"text":"Формат аренды особенно выгоден и привлекателен, если:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'pervyj-agregator-ploshhadok-dlya-majninga-top-majning-kak-kupit-prodat-i-arendovat-prostranstvo-dlya-dobychi-kriptovalyut';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 28, 'rich_list',
       $tmj${"ordered":true,"items":[{"title":"У вас нет капитала на покупку","text":""},{"title":"Вы тестируете новую модель или оборудование","text":""},{"title":"Планируете переезд фермы из «домашних» условий","text":""},{"title":"Расширяете собственные мощности","text":""}]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'pervyj-agregator-ploshhadok-dlya-majninga-top-majning-kak-kupit-prodat-i-arendovat-prostranstvo-dlya-dobychi-kriptovalyut';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 29, 'paragraph',
       $tmj${"text":"Пример: предприниматель из Казани с 50 устройствами Antminer S21 арендовал площадку в Красноярском крае с тарифом 5,5 руб./кВт⋅ч и круглосуточным обслуживанием. Через 6 месяцев он принял решение выкупить часть арендованной мощности и перевести ферму в постоянный режим."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'pervyj-agregator-ploshhadok-dlya-majninga-top-majning-kak-kupit-prodat-i-arendovat-prostranstvo-dlya-dobychi-kriptovalyut';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 30, 'heading',
       $tmj${"level":2,"text":"Почему ТОП-МАЙНИНГ – это удобно, быстро и выгодно?"}$tmj$::jsonb,
       'why'
FROM articles a WHERE a.slug = 'pervyj-agregator-ploshhadok-dlya-majninga-top-majning-kak-kupit-prodat-i-arendovat-prostranstvo-dlya-dobychi-kriptovalyut';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 31, 'paragraph',
       $tmj${"text":"Если вы задумываетесь о масштабировании или входе в майнинг с нуля – начните с инфраструктуры. А лучшая инфраструктура – это та, что найдена через ТОП-МАЙНИНГ – крупнейший агрегатор площадок для майнинга в России и СНГ."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'pervyj-agregator-ploshhadok-dlya-majninga-top-majning-kak-kupit-prodat-i-arendovat-prostranstvo-dlya-dobychi-kriptovalyut';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 32, 'paragraph',
       $tmj${"text":"ТОП-МАЙНИНГ – первый в России агрегатор площадок для майнинга, где можно:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'pervyj-agregator-ploshhadok-dlya-majninga-top-majning-kak-kupit-prodat-i-arendovat-prostranstvo-dlya-dobychi-kriptovalyut';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 33, 'list',
       $tmj${"ordered":false,"items":["Купить площадку для майнинга любого масштаба;","Продать площадку для майнинга быстро и по рыночной цене;","Арендовать площадку для майнинга на гибких условиях;","Совокупная мощность площадок в нашей базе – свыше 150 МВт;","Проверенные предложения, юридическая чистота и профессиональное сопровождение;","Удобный поиск, фильтрация по параметрам, прямой контакт с собственниками."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'pervyj-agregator-ploshhadok-dlya-majninga-top-majning-kak-kupit-prodat-i-arendovat-prostranstvo-dlya-dobychi-kriptovalyut';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 34, 'paragraph',
       $tmj${"text":"Свяжитесь с нашим менеджером, чтобы узнать подробности."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'pervyj-agregator-ploshhadok-dlya-majninga-top-majning-kak-kupit-prodat-i-arendovat-prostranstvo-dlya-dobychi-kriptovalyut';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 35, 'paragraph',
       $tmj${"text":"Еще больше полезной и актуальной информации можно найти в нашем Телеграм-канале. Подписывайтесь, чтобы оставаться в курсе свежих новостей."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'pervyj-agregator-ploshhadok-dlya-majninga-top-majning-kak-kupit-prodat-i-arendovat-prostranstvo-dlya-dobychi-kriptovalyut';
