SET client_encoding = 'UTF8';

CREATE TABLE IF NOT EXISTS article_topics (
    id TEXT PRIMARY KEY,
    label TEXT NOT NULL,
    sort_order INT NOT NULL DEFAULT 0
);

CREATE TABLE IF NOT EXISTS articles (
    id SERIAL PRIMARY KEY,
    slug TEXT NOT NULL UNIQUE,
    title TEXT NOT NULL,
    excerpt TEXT NOT NULL DEFAULT '',
    content TEXT NOT NULL DEFAULT '',
    image_url TEXT NOT NULL DEFAULT '',
    image_alt TEXT NOT NULL DEFAULT '',
    topic_id TEXT NOT NULL REFERENCES article_topics (id),
    reading_time_min INT,
    published_at DATE NOT NULL,
    display_type TEXT NOT NULL DEFAULT 'list'
        CHECK (display_type IN ('hero', 'featured', 'list')),
    sort_order INT NOT NULL DEFAULT 0,
    is_published BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE INDEX IF NOT EXISTS articles_topic_published_idx
    ON articles (topic_id, is_published, sort_order, published_at DESC);

ALTER TABLE articles
    ADD COLUMN IF NOT EXISTS title_subtitle TEXT NOT NULL DEFAULT '',
    ADD COLUMN IF NOT EXISTS view_count INT NOT NULL DEFAULT 0,
    ADD COLUMN IF NOT EXISTS content_html TEXT NOT NULL DEFAULT '';
INSERT INTO article_topics (id, label, sort_order) VALUES
    ('mining', 'Все о майнинге', 1),
    ('tools', 'Инструменты и сервисы', 2),
    ('investments', 'Инвестиции', 3),
    ('beginners', 'Новичкам', 4)
ON CONFLICT (id) DO NOTHING;

TRUNCATE articles RESTART IDENTITY CASCADE;

INSERT INTO articles (
    slug, title, excerpt, content, image_url, image_alt,
    topic_id, reading_time_min, published_at, display_type, sort_order
) VALUES
(
    'blockchain-forum-2026-moscow',
    'Blockchain Forum 2026 в Москве 14–15 апреля',
    'Главное отраслевое событие весны: программа, спикеры и форматы нетворкинга.',
    'Blockchain Forum 2026 пройдёт в Москве 14–15 апреля и соберёт представителей майнинговой индустрии, финтеха и инфраструктурных компаний.

На площадке обсудят регулирование, энергоэффективность дата-центров, новые модели размещения оборудования и тренды крипторынка.

Для участников подготовлены панельные дискуссии, закрытые встречи и демо-зона сервисов для майнеров.',
    '/images/articles/hero-blockchain-forum.jpg',
    'Blockchain Forum 2026',
    'mining', NULL, '2026-01-22', 'hero', 1
),
(
    'whatsminer-m70-line-review',
    'Новое поколение Whatsminer M70: полный обзор линейки',
    'Разбираем хешрейт, энергоэффективность и сценарии окупаемости новой линейки MicroBT.',
    'Whatsminer M70 — одно из самых ожидаемых обновлений линейки MicroBT. В обзоре сравниваем модели по хешрейту, потреблению и стабильности работы в разных условиях размещения.

Отдельно рассматриваем сервисную поддержку, доступность прошивок и реальную доходность при текущей сложности сети Bitcoin.',
    '/images/articles/whatsminer-m70.jpg',
    'Whatsminer M70',
    'mining', 10, '2025-12-12', 'hero', 2
),
(
    'best-asic-miners-2026',
    'Лучшие асики для майнинга: умный сервис, зрелая экосистема',
    'Как выбрать ASIC в 2026 году: железо, сервис, логистика и прозрачные условия размещения.',
    'Подбор ASIC — это не только сравнение хешрейта. Важны гарантия, ремонт, доступ к запчастям и партнёры по размещению.

В материале собрали критерии выбора и чек-лист для инвестора, который выходит на рынок с бюджетом от 1 млн ₽.',
    '/images/articles/best-asic-miners.jpg',
    'Лучшие ASIC-майнеры',
    'mining', 10, '2025-12-12', 'featured', 3
),
(
    'crypto-market-outlook-2026',
    'Падение или рост? Крипторынок на старте 2026 года',
    'Ключевые факторы для Bitcoin и альткоинов: ликвидность, халвинг-цикл и институциональный спрос.',
    'Рынок в начале года часто закладывает тренд на квартал. Разбираем макрофакторы, поведение майнеров и влияние ставок на аппетит к риску.

Материал поможет понять, когда имеет смысл наращивать мощности, а когда — фиксировать прибыль.',
    '/images/articles/crypto-market-2026.jpg',
    'Крипторынок 2026',
    'mining', 10, '2025-12-12', 'featured', 4
),
(
    'blockchain-life-2025-afterparty',
    'Blockchain Life 2025 — главное событие СНГ',
    'Итоги конференции, afterparty и главные анонсы для майнинг-сообщества.',
    'Blockchain Life 2025 собрал тысячи участников из более чем 100 стран. На afterparty прошли ключевые знакомства между инвесторами, производителями и операторами площадок.

В статье — главные тезисы спикеров и что из анонсов уже можно применять в работе.',
    '/images/articles/blockchain-life-2025.jpg',
    'Blockchain Life 2025',
    'mining', 10, '2025-12-12', 'featured', 5
),
(
    'the-trends-conference',
    'THE TRENDS: технологии и тренды индустрии',
    'Краткий обзор программы и тем, которые задал тон отрасли на осень.',
    'Конференция THE TRENDS сфокусировалась на инфраструктуре, энергетике и новых бизнес-моделях вокруг майнинга.

Мы выделили доклады, которые стоит пересмотреть командам, планирующим масштабирование.',
    '/images/articles/the-trends.jpg',
    'THE TRENDS',
    'mining', 8, '2025-11-16', 'featured', 6
),
(
    'top-mining-pools-2026',
    'Лучшие майнинг-пулы 2026: топ-11 по доходности',
    'Сравниваем комиссии, стабильность выплат и удобство мониторинга для майнеров.',
    'Выбор пула влияет на чистую доходность не меньше, чем модель ASIC. Сравнили 11 популярных площадок по комиссии, прозрачности статистики и скорости выплат.

Добавили рекомендации для небольших ферм и для промышленных площадок.',
    '/images/articles/mining-pools-top11.jpg',
    'Топ майнинг-пулов',
    'tools', 9, '2025-12-01', 'list', 7
),
(
    'top-mining-ecosystem',
    'Экосистема TOP MINING: от калькулятора до рейтингов',
    'Как связаны калькулятор, каталог организаций и рейтинги на платформе.',
    'TOP MINING объединяет инструменты для принятия решений: расчёт доходности, сравнение вендоров и независимые рейтинги.

В материале показываем, как использовать экосистему на каждом этапе — от покупки оборудования до выбора пула.',
    '/images/articles/top-mining-ecosystem.jpg',
    'Экосистема TOP MINING',
    'tools', 8, '2026-01-22', 'list', 8
),
(
    'mining-sites-construction',
    'Строительство площадок для майнинга: с чего начать',
    'Инженерия, энергоснабжение и требования к инфраструктуре промышленного размещения.',
    'Строительство площадки начинается с энергии и охлаждения. Разбираем этапы проектирования, типовые ошибки и бюджет на запуск.

Материал полезен инвесторам, которые переходят от размещения в отеле к собственной инфраструктуре.',
    '/images/articles/mining-sites-construction.jpg',
    'Строительство майнинг-площадок',
    'investments', 7, '2025-11-20', 'list', 9
),
(
    'mining-datacenter-guide',
    'Как устроен современный майнинг-дата-центр',
    'Мониторинг, безопасность и сервисные процессы на промышленной площадке.',
    'Современный ЦОД для майнинга — это не только стеллажи с ASIC. Важны мониторинг, SLA по ремонту, пожарная безопасность и учёт энергии.

Рассказываем, какие метрики должен видеть владелец оборудования каждый день.',
    '/images/articles/mining-datacenter.jpg',
    'Майнинг-дата-центр',
    'beginners', 6, '2025-10-15', 'list', 10
),
(
    'asic-hardware-overview',
    'Обзор промышленных ASIC: что важно при закупке',
    'Форм-фактор, охлаждение и логистика при поставке партии оборудования.',
    'Перед закупкой партии ASIC проверьте совместимость с вашей инфраструктурой: фаза, кабели, шум, тепловыделение.

В статье — практический чек-лист для закупки у дистрибьютора и напрямую у производителя.',
    '/images/articles/asic-miners.jpg',
    'Промышленные ASIC',
    'mining', 8, '2025-09-28', 'list', 11
);

UPDATE articles
SET topic_id = 'mining'
WHERE topic_id IN ('news', 'crypto', 'misc');

UPDATE article_topics
SET label = 'Все о майнинге', sort_order = 1
WHERE id = 'mining';

UPDATE article_topics SET sort_order = 2 WHERE id = 'tools';
UPDATE article_topics SET sort_order = 3 WHERE id = 'investments';
UPDATE article_topics SET sort_order = 4 WHERE id = 'beginners';

DELETE FROM article_topics WHERE id IN ('news', 'crypto', 'misc');

UPDATE articles
SET display_type = 'hero', sort_order = 1
WHERE slug = 'whatsminer-m70-line-review';

UPDATE articles
SET display_type = 'featured', sort_order = 2
WHERE slug = 'best-asic-miners-2026';

UPDATE articles
SET display_type = 'featured', sort_order = 3
WHERE slug = 'asic-hardware-overview';

UPDATE articles
SET display_type = 'featured', sort_order = 4
WHERE slug = 'blockchain-life-2025-afterparty';

UPDATE articles
SET display_type = 'featured', sort_order = 5
WHERE slug = 'the-trends-conference';

UPDATE articles SET
    title = 'Экосистема TOP MINING: единая платформа решений для майнеров, инвесторов и бизнеса',
    excerpt = 'Калькулятор, каталог, рейтинги и сервисы — как связаны инструменты платформы.',
    content = 'TOP MINING объединяет инструменты для принятия решений: расчёт доходности, сравнение вендоров, независимые рейтинги и консалтинг.

В материале показываем, как использовать экосистему на каждом этапе — от покупки оборудования до выбора пула и масштабирования.',
    image_url = '/images/articles/tools-ecosystem-hero.jpg',
    image_alt = 'Экосистема TOP MINING',
    reading_time_min = 15,
    published_at = '2025-11-05',
    display_type = 'hero',
    sort_order = 1
WHERE slug = 'top-mining-ecosystem';

INSERT INTO articles (
    slug, title, excerpt, content, image_url, image_alt,
    topic_id, reading_time_min, published_at, display_type, sort_order
) VALUES
(
    'mining-consulting-services',
    'Консалтинг в майнинге: сопровождение от идеи до запуска',
    'Аудит, подбор оборудования, юридические и технические вопросы — что входит в консалтинг.',
    'Консалтинг в майнинге помогает сократить ошибки на старте: от выбора модели ASIC до расчёта окупаемости и логистики.

Разбираем, когда нужен полный аудит, а когда достаточно точечной экспертизы по хостингу или энергоснабжению.',
    '/images/articles/tools-consulting.jpg',
    'Консалтинг в майнинге',
    'tools', 12, '2025-11-10', 'featured', 2
),
(
    'hosting-with-discount',
    'Как выбрать хостинг со скидкой: критерии и подводные камни',
    'На что смотреть при выборе площадки: тариф, аптайм, ремонт и прозрачность статистики.',
    'Скидка на хостинг — не главный критерий. Важнее SLA по ремонту, стабильность энергоснабжения и доступ к мониторингу в реальном времени.

Собрали чек-лист вопросов оператору площадки перед подписанием договора.',
    '/images/articles/tools-hosting-discount.jpg',
    'Хостинг со скидкой',
    'tools', 9, '2025-11-08', 'featured', 3
),
(
    'tools-build-mining-site',
    'Построим площадку для майнинга: полный цикл под ключ',
    'Проектирование, монтаж, пусконаладка и сервис промышленной майнинг-площадки.',
    'Строительство площадки под ключ включает инженерные изыскания, электроснабжение, систему охлаждения и мониторинг.

Рассказываем, какие этапы занимают больше всего времени и как заложить резерв мощности на масштабирование.',
    '/images/articles/tools-build-site.jpg',
    'Строительство площадки для майнинга',
    'tools', 11, '2025-11-06', 'featured', 4
),
(
    'buy-asic-below-market',
    'Купить ASIC по цене ниже рынка: как найти выгодные предложения',
    'Где искать акции, как проверить поставщика и не переплатить за логистику.',
    'Цена ниже рынка возможна при оптовых партиях, акциях дистрибьюторов и сезонных распродажах перед выходом новых моделей.

Добавили алгоритм проверки продавца и список документов, которые стоит запросить до оплаты.',
    '/images/articles/tools-buy-asic.jpg',
    'Купить ASIC ниже рынка',
    'tools', 10, '2025-11-04', 'featured', 5
),
(
    'top-mining-articles-knowledge',
    'Статьи о майнинге от TOP MINING: знание как инструмент прибыли',
    'Подборка материалов для тех, кто хочет разобраться в отрасли системно.',
    'Регулярное чтение отраслевых материалов помогает быстрее принимать решения: от выбора железа до налоговых вопросов.

В подборке — обзоры, кейсы и разборы типичных ошибок начинающих майнеров.',
    '/images/articles/tools-datacenter.jpg',
    'Статьи о майнинге',
    'tools', 6, '2025-10-28', 'list', 6
),
(
    'where-to-buy-asic',
    'Где купить ASIC — проверенный ресурс',
    'Критерии надёжного поставщика и как сравнить предложения на рынке.',
    'Проверенный ресурс — это не только цена, но и гарантия, сервис, наличие запчастей и прозрачные условия доставки.

Сравниваем маркетплейсы, дистрибьюторов и прямые продажи от производителей.',
    '/images/articles/asic-miners.jpg',
    'Где купить ASIC',
    'tools', 7, '2025-10-22', 'list', 7
)
ON CONFLICT (slug) DO NOTHING;

UPDATE articles SET
    display_type = 'list',
    sort_order = 8,
    reading_time_min = 9
WHERE slug = 'top-mining-pools-2026';

INSERT INTO articles (
    slug, title, excerpt, content, image_url, image_alt,
    topic_id, reading_time_min, published_at, display_type, sort_order
) VALUES
(
    'top-mining-ecosystem-overview',
    'Что такое экосистема TOP MINING?',
    'Краткий обзор сервисов платформы для майнеров и инвесторов.',
    'Экосистема TOP MINING — это набор инструментов для расчёта доходности, выбора поставщиков и сравнения площадок размещения.

Материал поможет быстро понять, с какого сервиса начать знакомство с платформой.',
    '/images/articles/tools-ecosystem-card.jpg',
    'Экосистема TOP MINING',
    'tools', 5, '2025-10-18', 'list', 9
)
ON CONFLICT (slug) DO UPDATE SET
    title = EXCLUDED.title,
    excerpt = EXCLUDED.excerpt,
    content = EXCLUDED.content,
    image_url = EXCLUDED.image_url,
    image_alt = EXCLUDED.image_alt,
    topic_id = EXCLUDED.topic_id,
    reading_time_min = EXCLUDED.reading_time_min,
    published_at = EXCLUDED.published_at,
    display_type = EXCLUDED.display_type,
    sort_order = EXCLUDED.sort_order;

INSERT INTO articles (
    slug, title, excerpt, content, image_url, image_alt,
    topic_id, reading_time_min, published_at, display_type, sort_order
) VALUES
(
    'modern-mining-datacenter-tools',
    'Как устроен современный майнинг-дата-центр',
    'Мониторинг, безопасность и сервисные процессы на промышленной площадке.',
    'Современный ЦОД для майнинга — это не только стеллажи с ASIC. Важны мониторинг, SLA по ремонту, пожарная безопасность и учёт энергии.

Рассказываем, какие метрики должен видеть владелец оборудования каждый день.',
    '/images/articles/tools-datacenter.jpg',
    'Майнинг-дата-центр',
    'tools', 8, '2025-10-12', 'list', 10
)
ON CONFLICT (slug) DO NOTHING;


-- >>> 006_investments_articles.sql
-- Контент для вкладки «Инвестиции» по макету.

INSERT INTO articles (
    slug, title, excerpt, content, image_url, image_alt,
    topic_id, reading_time_min, published_at, display_type, sort_order
) VALUES
(
    'best-time-to-buy-asic',
    'Почему сейчас — самый выгодный момент для покупки асиков?',
    'Разбираем факторы рынка, цены на оборудование и окно окупаемости для инвестора.',
    'Покупка ASIC зависит от цены Bitcoin, сложности сети, стоимости электричества и наличия мощностей на хостинге.

В материале — сценарии входа в майнинг с разным бюджетом и типичные ошибки, которые удлиняют срок окупаемости.',
    '/images/articles/investments-buy-asic-hero.jpg',
    'Покупка ASIC',
    'investments', 8, '2025-12-01', 'hero', 1
),
(
    'mining-on-gas-russia',
    'Майнинг на газе: как запустить ферму на природном или попутном газе в России',
    'Энергетика, оборудование и юридические аспекты размещения на газовых генераторах.',
    'Майнинг на попутном или природном газе позволяет снизить стоимость киловатт-часа при правильной инженерии.

Разбираем схему подключения генераторов, требования к площадке и экономику проекта для инвестора.',
    '/images/articles/investments-mining-gas.jpg',
    'Майнинг на газе',
    'investments', 15, '2025-11-28', 'featured', 2
),
(
    'bitcoin-as-investment-asset',
    'Bitcoin как инвестиционный актив: роль майнинга в портфеле',
    'Как совместить покупку BTC и добычу для долгосрочной стратегии.',
    'Майнинг даёт регулярный приток Bitcoin, а покупка на spot — мгновенное вхождение в актив.

Сравниваем риски, волатильность и налоговые нюансы для частного инвестора в России.',
    '/images/articles/investments-bitcoin-coins.jpg',
    'Bitcoin как инвестиция',
    'investments', 11, '2025-11-25', 'featured', 3
),
(
    'mining-datacenter-investment',
    'Инвестиции в майнинг-дата-центр: модели и доходность',
    'Когда имеет смысл вкладываться в инфраструктуру, а не только в железо.',
    'Собственный или долевой ЦОД — это масштабный проект с длинным горизонтом окупаемости.

Описываем модели co-location, аренды мощности и совместных инвестиций с оператором площадки.',
    '/images/articles/investments-datacenter.jpg',
    'Инвестиции в дата-центр',
    'investments', 12, '2025-11-22', 'featured', 4
),
(
    'asic-payback-forecast-2026',
    'Окупаемость ASIC в 2026: расчёт и прогноз для инвестора',
    'Как оценить срок возврата вложений с учётом курса, тарифа и аптайма.',
    'Калькулятор окупаемости — базовый инструмент перед покупкой партии оборудования.

Показываем, какие параметры критичны и как заложить резерв на простои и ремонт.',
    '/images/articles/investments-bitcoin-circuit.jpg',
    'Окупаемость ASIC',
    'investments', 10, '2025-11-18', 'featured', 5
),
(
    'mining-investment-entry',
    'Инвестиции в майнинг: с чего начать частному инвестору',
    'Минимальный бюджет, выбор модели и первые шаги без лишних рисков.',
    'Старт с одного ASIC на хостинге — самый простой способ проверить гипотезу до крупных вложений.

Чек-лист: договор, мониторинг, страховка оборудования и план выхода.',
    '/images/articles/investments-buy-asic-hero.jpg',
    'Старт инвестора',
    'investments', 7, '2025-11-15', 'list', 6
),
(
    'mining-farm-budget-planning',
    'Бюджет майнинг-фермы: статьи расходов и скрытые cost-центры',
    'Что заложить в финмодель кроме цены ASIC и тарифа на электричество.',
    'Логистика, таможня, монтаж, обслуживание и резерв на замену блоков питания часто недооценивают.

Разбираем типовую структуру расходов для фермы от 10 до 100 устройств.',
    '/images/articles/investments-bitcoin-circuit.jpg',
    'Бюджет фермы',
    'investments', 9, '2025-11-12', 'list', 7
),
(
    'hosting-vs-own-site-investment',
    'Хостинг или своя площадка: что выгоднее инвестору',
    'Сравниваем CAPEX, OPEX и гибкость двух моделей размещения.',
    'Хостинг быстрее запускается, своя площадка даёт контроль над тарифом и масштабом.

Материал поможет выбрать стратегию под ваш горизонт инвестиций и бюджет.',
    '/images/articles/investments-datacenter.jpg',
    'Хостинг или своя площадка',
    'investments', 8, '2025-11-08', 'list', 8
)
ON CONFLICT (slug) DO UPDATE SET
    title = EXCLUDED.title,
    excerpt = EXCLUDED.excerpt,
    content = EXCLUDED.content,
    image_url = EXCLUDED.image_url,
    image_alt = EXCLUDED.image_alt,
    topic_id = EXCLUDED.topic_id,
    reading_time_min = EXCLUDED.reading_time_min,
    published_at = EXCLUDED.published_at,
    display_type = EXCLUDED.display_type,
    sort_order = EXCLUDED.sort_order;

UPDATE articles SET
    display_type = 'list',
    sort_order = 9,
    reading_time_min = 7,
    published_at = '2025-11-20'
WHERE slug = 'mining-sites-construction';


SET client_encoding = 'UTF8';

UPDATE articles
SET
    title = 'Blockchain Forum 2026 в Москве 14-15 Апреля',
    title_subtitle = 'Мировая крипто индустрия возвращается в Москву',
    excerpt = '14–15 апреля 2026 в Москве пройдёт Blockchain Forum 2026 — крупнейшее событие, объединяющее СНГ и мировой крипторынок. Промокод TOPMINING — скидка 10%.',
    content = $txt$
14–15 апреля 2026 года состоится Blockchain Forum 2026 — крупнейшее событие, которое вновь объединит СНГ и мировой крипторынки. Это единственное мероприятие, которое соберёт в Москве ведущие международные компании индустрии, спикеров и инвесторов.

За организацией события стоит команда, подарившая индустрии форум Blockchain Life – легендарное мероприятие собирающее десятки тысяч человек в мировых крипто столицах с 2017 года.

В международном форуме традиционно участвуют основатели, топ-менеджеры и визионеры из Tether, Binance, Tron, Ripple, Bybit, Bitget, Promminer, A7A5, Animoca Brands, Circle, OKX, HTX, Kucoin, Telegram, Mastercard, ICP, Trust Wallet, Sandbox, Near, Litecoin, Bitmain, Marathon, Canaan, WhatsMiner, Bitfury, Consensys, Linea, DWF Labs, Wintermute, BNB chain и многие другие.

Для русскоязычного рынка это редкая возможность услышать мировых лидеров лично и наладить контакты без посредников.
$txt$,
    content_html = $html$
<p><img class="aligncenter" src="/images/articles/hero-blockchain-forum.jpg" alt="Blockchain Forum 2026 April" width="1920" height="1080" loading="lazy" /></p>
<p>14–15 апреля 2026 года состоится <strong>Blockchain Forum 2026</strong> — крупнейшее событие, которое вновь объединит СНГ и мировой крипторынки. Это единственное мероприятие, которое соберёт в Москве <strong>ведущие международные компании индустрии, спикеров и инвесторов</strong>.</p>
<p>За организацией события стоит команда, подарившая индустрии <strong>форум Blockchain Life</strong> – легендарное мероприятие собирающее десятки тысяч человек в мировых крипто столицах с 2017 года.</p>
<p>В международном форуме традиционно участвуют <strong>основатели, топ-менеджеры и визионеры</strong> из Tether, Binance, Tron, Ripple, Bybit, Bitget, Promminer, A7A5, Animoca Brands, Circle, OKX, HTX, Kucoin, Telegram, Mastercard, ICP, Trust Wallet, Sandbox, Near, Litecoin, Bitmain, Marathon, Canaan, WhatsMiner, Bitfury, Consensys, Linea, DWF Labs, Wintermute, BNB chain и многие другие.</p>
<p>Для русскоязычного рынка это редкая возможность услышать мировых лидеров лично и наладить контакты без посредников.</p>
<h2 id="tri-sceny-i-bezprecedentnyj-masshtab">Три сцены и беспрецедентный масштаб</h2>
<p>16-й Blockchain Forum займёт отдельный павильон <strong>Крокус Экспо</strong>, предлагая 20,000 участников <strong>три полноценных сцены</strong> с параллельными потоками выступлений, панельных сессий и воркшопов.</p>
<p><strong>Кроме того, все выступления зарубежных спикеров будут сопровождаться синхронным переводом на русский язык</strong>.</p>
<p>На территории форума будет работать <strong>масштабная выставочная зона</strong>, где более 250 компаний представят свои продукты, сервисы и технологические решения.</p>
<p>Посетители смогут не только познакомиться с уже известными брендами, но и стать первыми, кто увидит <strong>премьеры новых платформ, продуктов, токенов и инструментов</strong>, до их попадания в мейнстрим.</p>
<h2 id="ai-tehnologii-i-novye-formaty">AI технологии и новые форматы</h2>
<p>Впервые в рамках Blockchain Forum состоится <a href="https://ai-future.com/ru/" rel="noopener noreferrer" target="_blank"><strong>AI Future</strong></a> — «форум внутри форума», посвящённый пересечению <strong>искусственного интеллекта, блокчейна и цифровой экономики</strong>. Здесь встретятся представители индустрии, разработчики, исследователи и инвесторы, чтобы обсудить, как формируется синергия AI и блокчейн технологий.</p>
<p>Участников также ждут <strong>интерактивные зоны</strong>, <strong>хакатоны</strong>, <strong>конкурс стартапов</strong>, <strong>NFT-инсталляции, трейдинговый турнир</strong> и другие иммерсивные тематические активности для погружения в самые актуальные тренды рынка.</p>
<h2 id="bilety-i-uchastie">Билеты и участие</h2>
<p>Спонсорские пакеты доступны по ранним ценам, а также билеты со скидкой 10% по промокоду <strong>TOPMINING</strong>:</p>
<p>👉 <a href="https://blockchain.forum/" rel="noopener noreferrer" target="_blank">blockchain.forum</a> — принять участие в <strong>Blockchain Forum</strong><br />
👉 <a href="https://ai-future.com/" rel="noopener noreferrer" target="_blank">ai-future.com</a> — принять участие в <strong>AI Future Forum</strong></p>
$html$,
    image_url = '/images/articles/hero-blockchain-forum.jpg',
    image_alt = 'Blockchain Forum 2026 April',
    topic_id = 'mining',
    view_count = 178,
    published_at = '2026-01-22',
    display_type = 'hero',
    sort_order = 1
WHERE slug = 'blockchain-forum-2026-moscow';
