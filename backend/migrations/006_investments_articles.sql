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
