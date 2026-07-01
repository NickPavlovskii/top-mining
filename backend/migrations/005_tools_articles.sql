-- Контент для вкладки «Инструменты и сервисы» по макету.

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
