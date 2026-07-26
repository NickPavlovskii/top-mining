SET client_encoding = 'UTF8';

-- Combined article content migrations (formerly 027-041)
-- Each section is idempotent (ON CONFLICT DO UPDATE + replace blocks).

-- =====================================================================
-- 027_article_best_antminer.sql
-- =====================================================================

-- Лучшие асики Antminer: ТОП-10 майнеров от Bitmain в 2026 году

INSERT INTO articles (
    slug, title, title_subtitle, excerpt, content, topic_id,
    reading_time_min, reading_minutes, published_at, view_count,
    display_type, sort_order, is_published, uses_blocks,
    image_url, image_alt
) VALUES (
    'luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu',
    'Лучшие асики Antminer',
    'ТОП-10 майнеров от Bitmain в 2026 году',
    $excerpt$ТОП-10 лучших асиков Antminer от Bitmain в 2026 году: от KS5 Pro до S23 Hydro 3U — хешрейт, энергоэффективность, плюсы и минусы.$excerpt$,
    $content$Введение

Китайская компания Bitmain является общепризнанным мировым лидером в сфере производства и продажи техники для добычи криптовалют. В линейке бренда Antminer есть десятки разнообразных устройств как для алгоритма SHA-256, так и альткоинов.

Почему именно Antminer и Bitmain?

Компания Bitmain Technologies была основана в 2013 году в Китае и быстро стала ведущим игроком в индустрии майнинга криптовалют.

Выводы

Компания Bitmain неустанно доказывает свое лидерство в сфере техники для майнинга.$content$,
    'mining',
    9,
    9,
    '2024-12-25',
    5918,
    'list',
    10,
    TRUE,
    TRUE,
    '/images/articles/best-antminer-2026/antminer-s23-hydro-3u.png',
    'Antminer S23 Hydro 3U'
)
ON CONFLICT (slug) DO UPDATE SET
    title = EXCLUDED.title,
    title_subtitle = EXCLUDED.title_subtitle,
    excerpt = EXCLUDED.excerpt,
    content = EXCLUDED.content,
    reading_time_min = EXCLUDED.reading_time_min,
    reading_minutes = EXCLUDED.reading_minutes,
    published_at = EXCLUDED.published_at,
    view_count = EXCLUDED.view_count,
    uses_blocks = TRUE,
    image_url = EXCLUDED.image_url,
    image_alt = EXCLUDED.image_alt,
    is_published = TRUE;

DELETE FROM article_blocks
WHERE article_id = (SELECT id FROM articles WHERE slug = 'luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu');

UPDATE rating_items
SET href = '/articles/luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu',
    label = 'Лучшие асики Antminer: ТОП-10 майнеров от Bitmain в 2026 году'
WHERE href LIKE '%luchshie-asiki-antminer%';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 1, 'heading',
       $p1${"level":2,"text":"Введение"}$p1$::jsonb,
       'vvedenie'
FROM articles a WHERE a.slug = 'luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 2, 'paragraph',
       $p2${"text":"Китайская компания Bitmain является общепризнанным мировым лидером в сфере производства и продажи техники для добычи криптовалют. В линейке бренда Antminer есть десятки разнообразных устройств как для алгоритма SHA-256, так и альткоинов: каждый инвестор в цифровые фермы знает данную торговую марку. Многие сервисные центры успешно работают с продукцией Bitmain, а запчасти к оборудованию можно найти в любой профильной мастерской. Познакомимся с перечнем лучших моделей Antminer – проанализируем ТОП-10 асиков, которые максимально интересны в 2026 году.","html":"Китайская компания Bitmain является общепризнанным мировым лидером в сфере производства и продажи техники для добычи криптовалют. В линейке бренда Antminer есть десятки разнообразных устройств как для алгоритма SHA-256, так и альткоинов: каждый инвестор в цифровые фермы знает данную торговую марку. Многие сервисные центры успешно работают с продукцией Bitmain, а запчасти к оборудованию можно найти в любой профильной мастерской. Познакомимся с перечнем лучших моделей Antminer – проанализируем ТОП-10 асиков, которые максимально интересны в 2026 году."}$p2$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 3, 'heading',
       $p3${"level":2,"text":"Почему именно Antminer и Bitmain?"}$p3$::jsonb,
       'pochemu-antminer'
FROM articles a WHERE a.slug = 'luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 4, 'paragraph',
       $p4${"text":"Компания Bitmain Technologies была основана в 2013 году в Китае и быстро стала ведущим игроком в индустрии майнинга криптовалют. Ее флагманская линейка устройств под брендом Antminer произвела революцию в добыче Bitcoin, благодаря высокой энергоэффективности и вычислительной мощности.","html":"Компания Bitmain Technologies была основана в 2013 году в Китае и быстро стала ведущим игроком в индустрии майнинга криптовалют. Ее флагманская линейка устройств под брендом Antminer произвела революцию в добыче Bitcoin, благодаря высокой энергоэффективности и вычислительной мощности."}$p4$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 5, 'paragraph',
       $p5${"text":"Bitmain начала с выпуска ASIC-чипов – специализированных интегральных схем, разработанных исключительно для майнинга. В отличие от обычных видеокарт (GPU), асики оптимизированы под конкретные алгоритмы, например SHA-256, используемый в Bitcoin.","html":"Bitmain начала с выпуска ASIC-чипов – специализированных интегральных схем, разработанных исключительно для майнинга. В отличие от обычных видеокарт (GPU), асики оптимизированы под конкретные алгоритмы, например SHA-256, используемый в Bitcoin."}$p5$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 6, 'paragraph',
       $p6${"text":"Уже в 2014 году Antminer S1 стал одним из самых популярных устройств у майнеров по всему миру.","html":"Уже в 2014 году Antminer S1 стал одним из самых популярных устройств у майнеров по всему миру."}$p6$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 7, 'paragraph',
       $p7${"text":"С тех пор компания последовательно выпускала новые модели, каждая из которых превосходила предыдущую по мощности и энергоэффективности. Устройства серии S (S9, S17, S19 и т. д.) задают стандарты индустрии.","html":"С тех пор компания последовательно выпускала новые модели, каждая из которых превосходила предыдущую по мощности и энергоэффективности. Устройства серии S (S9, S17, S19 и т. д.) задают стандарты индустрии."}$p7$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 8, 'image',
       $p8${"src":"/images/articles/best-antminer-2026/bitmain-antminer-intro.png","alt":"ASIC-майнер Bitmain Antminer"}$p8$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 9, 'rich_list',
       $p9${"ordered":false,"items":[{"title":"Максимальная производительность","text":"Асики от Antminer обеспечивают высокую скорость хеширования при относительно низком энергопотреблении;"},{"title":"Надежность","text":"Устройства рассчитаны на длительную работу в круглосуточном режиме;"},{"title":"Простота эксплуатации","text":"Удобный интерфейс, поддержка обновлений и быстрая настройка – важные плюсы для как начинающих, так и опытных майнеров;"},{"title":"Глобальное сообщество","text":"Bitmain имеет поддержку на нескольких языках, развитую сеть поставок и комьюнити пользователей по всему миру;"},{"title":"Высокая энергоэффективность","text":"Современные модели Antminer предлагают лучшее соотношение хешрейта к потребляемой энергии;"},{"title":"Надежная система охлаждения","text":"Устройства оснащаются долговечными вентиляторами или, в случае некоторых моделей, системой водяного охлаждения;"},{"title":"Масштабируемость","text":"Асики Antminer хорошо подходят как для домашних ферм, так и для промышленных майнинг-центров;"},{"title":"Непрерывное обновление модельного ряда","text":"Bitmain регулярно выпускает новые поколения устройств, что позволяет майнерам оставаться на передовой."}]}$p9$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 10, 'paragraph',
       $p10${"text":"Antminer от Bitmain давно стал символом эффективности и надежности в мире криптовалютного майнинга. Благодаря мощным техническим решениям, грамотной стратегии развития и качественной поддержке, Bitmain удерживает лидирующие позиции на рынке ASIC-устройств, оставаясь выбором номер один для майнеров по всему миру.","html":"Antminer от Bitmain давно стал символом эффективности и надежности в мире криптовалютного майнинга. Благодаря мощным техническим решениям, грамотной стратегии развития и качественной поддержке, Bitmain удерживает лидирующие позиции на рынке ASIC-устройств, оставаясь выбором номер один для майнеров по всему миру."}$p10$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 11, 'heading',
       $p11${"level":2,"text":"10 место: Antminer KAS Miner KS5 Pro"}$p11$::jsonb,
       'antminer-ks5-pro'
FROM articles a WHERE a.slug = 'luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 12, 'paragraph',
       $p12${"text":"Ажиотаж вокруг алгоритма kHeavyHash к концу 2024 году стал заметно меньше, причиной чего является существенное увеличение сложности добычи Kaspa. Если вы планируете добывать KAS, делать это рекомендуется с привлечением ТОПового оборудования, которое сохранит свою актуальность на несколько лет вперед. Одним из таких устройств является KAS Miner KS5 Pro – мощный асик, работающий на алгоритме kHeavyHash.","html":"Ажиотаж вокруг алгоритма kHeavyHash к концу 2024 году стал заметно меньше, причиной чего является существенное увеличение сложности добычи Kaspa. Если вы планируете добывать KAS, делать это рекомендуется с привлечением ТОПового оборудования, которое сохранит свою актуальность на несколько лет вперед. Одним из таких устройств является KAS Miner KS5 Pro – мощный асик, работающий на алгоритме kHeavyHash."}$p12$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 13, 'paragraph',
       $p13${"text":"Kaspa можно считать надежной криптовалютой из числа проверенных альткоинов. Несмотря на свою относительную молодость, актив торгуется на всех крупнейших площадках, а высокая капитализация позволяет минимизировать риски серьезной волатильности. Единственное, что угрожает майнерам – продолжение роста сложности добычи. Но владельцы KAS Miner KS5 Pro находятся в относительной безопасности, так как высокая производительность модели позволяет сохранять эффективность работы при растущем хешрейте блокчейна.","html":"Kaspa можно считать надежной криптовалютой из числа проверенных альткоинов. Несмотря на свою относительную молодость, актив торгуется на всех крупнейших площадках, а высокая капитализация позволяет минимизировать риски серьезной волатильности. Единственное, что угрожает майнерам – продолжение роста сложности добычи. Но владельцы KAS Miner KS5 Pro находятся в относительной безопасности, так как высокая производительность модели позволяет сохранять эффективность работы при растущем хешрейте блокчейна."}$p13$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 14, 'image',
       $p14${"src":"/images/articles/best-antminer-2026/antminer-ks5-pro.png","alt":"Antminer KAS Miner KS5 Pro"}$p14$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 15, 'stats',
       $p15${"rows":[{"label":"Производитель","value":"Bitmain"},{"label":"Год выпуска","value":"2024"},{"label":"Хешрейт","value":"21 Тх/с"},{"label":"Энергопотребление","value":"3 300 Вт"},{"label":"Энергоэффективность","value":"157 Вт на Тх"},{"label":"Алгоритм","value":"kHeavyHash"},{"label":"Количество монет, доступных для майнинга","value":"3"},{"label":"Уровень шума","value":"76 Дб"}]}$p15$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 16, 'pros_cons',
       $p16${"pros":["Одно из ТОПовых устройств для работы с Kaspa","Актив KAS уже успел доказать свою состоятельность и надежность","Сохранение актуальности майнера на перспективу"],"cons":["Стремительный рост сложности добычи KAS","Небольшое количество монет, доступных для добычи на этом асике"]}$p16$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 17, 'heading',
       $p17${"level":2,"text":"9 место: Antminer L9"}$p17$::jsonb,
       'antminer-l9'
FROM articles a WHERE a.slug = 'luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 18, 'paragraph',
       $p18${"text":"Алгоритм Scrypt стал настоящим лидером среди альткоинов в 2024-2025 годах. DOGE демонстрирует ощутимый рост, а помимо этого токена с помощью асиков на Scrypt можно добывать еще 5 монет (именно в формате объединенного майнинга). На текущий момент Antminer L9 является самым мощным асиком для добычи Dogecoin, что становится причиной впечатляющей доходности и повышенного спроса.","html":"Алгоритм Scrypt стал настоящим лидером среди альткоинов в 2024-2025 годах. DOGE демонстрирует ощутимый рост, а помимо этого токена с помощью асиков на Scrypt можно добывать еще 5 монет (именно в формате объединенного майнинга). На текущий момент Antminer L9 является самым мощным асиком для добычи Dogecoin, что становится причиной впечатляющей доходности и повышенного спроса."}$p18$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 19, 'paragraph',
       $p19${"text":"Модель появилась в 2024 году, ее мощность составляет 16 Гх/с: это гарантия сохранения актуальности в течение нескольких лет. L9 является одним из бестселлеров текущего цикла среди майнеров для альткоинов – продажи бьют рекорды, так как покупатели осознают перспективы использования такого оборудования, а также текущую доходность майнинга на ТОПовой аппаратуре для Scrypt.","html":"Модель появилась в 2024 году, ее мощность составляет 16 Гх/с: это гарантия сохранения актуальности в течение нескольких лет. L9 является одним из бестселлеров текущего цикла среди майнеров для альткоинов – продажи бьют рекорды, так как покупатели осознают перспективы использования такого оборудования, а также текущую доходность майнинга на ТОПовой аппаратуре для Scrypt."}$p19$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 20, 'image',
       $p20${"src":"/images/articles/best-antminer-2026/antminer-l9.png","alt":"Antminer L9"}$p20$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 21, 'stats',
       $p21${"rows":[{"label":"Производитель","value":"Bitmain"},{"label":"Год выпуска","value":"2024"},{"label":"Хешрейт","value":"16 Гх/с"},{"label":"Энергопотребление","value":"3 360 Вт"},{"label":"Энергоэффективность","value":"210 Вт на Гх"},{"label":"Алгоритм","value":"Scrypt"},{"label":"Количество монет, доступных для майнинга","value":"22"},{"label":"Уровень шума","value":"76 Дб"}]}$p21$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 22, 'pros_cons',
       $p22${"pros":["Один из самых мощных асиков для Scrypt","Объединенный майнинг сразу 6 активов (LTC + DOGE + BELLS + PEP + LKY + JKC)","Актуальность на несколько циклов","Работа с самым популярным алгоритмом для альткоинов"],"cons":["Высокая стоимость"]}$p22$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 23, 'heading',
       $p23${"level":2,"text":"8 место: Antminer T21"}$p23$::jsonb,
       'antminer-t21'
FROM articles a WHERE a.slug = 'luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 24, 'paragraph',
       $p24${"text":"Работа с первым блокчейном остается наиболее популярным форматом майнинга: в этом сегменте есть свои бестселлеры, которые оптимальны по соотношению цены и производительности. В 2024-2025 году такой моделью является Antminer T21, с помощью которого можно добывать BTC. Работа в рамках алгоритма SHA-256 представляет собой наиболее стабильный и прогнозируемый формат майнинга, что и привлекает сотни тысяч инвесторов со всего мира.","html":"Работа с первым блокчейном остается наиболее популярным форматом майнинга: в этом сегменте есть свои бестселлеры, которые оптимальны по соотношению цены и производительности. В 2024-2025 году такой моделью является Antminer T21, с помощью которого можно добывать BTC. Работа в рамках алгоритма SHA-256 представляет собой наиболее стабильный и прогнозируемый формат майнинга, что и привлекает сотни тысяч инвесторов со всего мира."}$p24$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 25, 'paragraph',
       $p25${"text":"Ключевая особенность Antminer T21 – относительно низкая стоимость террахеша мощности на фоне конкурентов. Возможной причиной является трехфазное подключение, что реализуемо далеко не на всех площадках. Но если данную проблему удастся решить, инвестор получает отличную возможность для создания мощной и производительной фермы на классическом воздушном охлаждении. Майнер Antminer T21 неприхотлив, стабилен и отлично знаком практически всем сервисным центрам, что лишь увеличивает популярность данной модели.","html":"Ключевая особенность Antminer T21 – относительно низкая стоимость террахеша мощности на фоне конкурентов. Возможной причиной является трехфазное подключение, что реализуемо далеко не на всех площадках. Но если данную проблему удастся решить, инвестор получает отличную возможность для создания мощной и производительной фермы на классическом воздушном охлаждении. Майнер Antminer T21 неприхотлив, стабилен и отлично знаком практически всем сервисным центрам, что лишь увеличивает популярность данной модели."}$p25$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 26, 'image',
       $p26${"src":"/images/articles/best-antminer-2026/antminer-t21.png","alt":"Antminer T21"}$p26$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 27, 'stats',
       $p27${"rows":[{"label":"Производитель","value":"Bitmain"},{"label":"Год выпуска","value":"2024"},{"label":"Хешрейт","value":"190 Тх/с"},{"label":"Энергопотребление","value":"3 500 Вт"},{"label":"Энергоэффективность","value":"18,5 Вт на Тх"},{"label":"Алгоритм","value":"SHA-256"},{"label":"Количество монет, доступных для майнинга","value":"36"},{"label":"Уровень шума","value":"75 ДБ"}]}$p27$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 28, 'pros_cons',
       $p28${"pros":["Бестселлер алгоритма SHA-256 в 2024-2025 годах","Надежный и проверенный формат майнинга","Одна из наиболее привлекательных цен за террахеш мощности","Надежность и неприхотливость"],"cons":["Трехфазное подключение","Рост сложности снижает доходность модели"]}$p28$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 29, 'heading',
       $p29${"level":2,"text":"7 место: Antminer S21 XP"}$p29$::jsonb,
       'antminer-s21-xp'
FROM articles a WHERE a.slug = 'luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 30, 'paragraph',
       $p30${"text":"Наиболее современной линейкой асиков Antminer в рамках алгоритма SHA-256 является 21-я серия майнеров. Здесь есть оборудование как с водяным, так и воздушным охлаждением – общее количество моделей превысило отметку в 10 единиц. Если же вы являетесь сторонником классического формата работы с температурами и не готовы экспериментировать с водой, Antminer S21 XP станет достойным выбором. В отличие от T21, майнер S21 XP обладает более внушительной мощностью – 270 Тх/с, что делает его одним из самых производительных аппаратов для BTC на «воздухе» сегодня.","html":"Наиболее современной линейкой асиков Antminer в рамках алгоритма SHA-256 является 21-я серия майнеров. Здесь есть оборудование как с водяным, так и воздушным охлаждением – общее количество моделей превысило отметку в 10 единиц. Если же вы являетесь сторонником классического формата работы с температурами и не готовы экспериментировать с водой, Antminer S21 XP станет достойным выбором. В отличие от T21, майнер S21 XP обладает более внушительной мощностью – 270 Тх/с, что делает его одним из самых производительных аппаратов для BTC на «воздухе» сегодня."}$p30$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 31, 'paragraph',
       $p31${"text":"Энергоэффективность Antminer S21 XP достигает внушительных значений – это 13,5 Вт на Тх, что еще несколько лет назад казалось невозможным. Высока вероятность того, что в ближайшее время будет сложно придумать что-то более мощное при сохранении традиционного объема электропотребления: новые рекорды энергоэффективности и производительности будут достигаться только в рамках водяного охлаждения. Поэтому модель Antminer S21 XP на 270 Тх/с можно считать уникальной.","html":"Энергоэффективность Antminer S21 XP достигает внушительных значений – это 13,5 Вт на Тх, что еще несколько лет назад казалось невозможным. Высока вероятность того, что в ближайшее время будет сложно придумать что-то более мощное при сохранении традиционного объема электропотребления: новые рекорды энергоэффективности и производительности будут достигаться только в рамках водяного охлаждения. Поэтому модель Antminer S21 XP на 270 Тх/с можно считать уникальной."}$p31$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 32, 'image',
       $p32${"src":"/images/articles/best-antminer-2026/antminer-s21-xp.png","alt":"Antminer S21 XP"}$p32$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 33, 'stats',
       $p33${"rows":[{"label":"Производитель","value":"Bitmain"},{"label":"Год выпуска","value":"2024"},{"label":"Хешрейт","value":"270 Тх/с"},{"label":"Энергопотребление","value":"3 645 Вт"},{"label":"Энергоэффективность","value":"13,5 Вт на Тх"},{"label":"Алгоритм","value":"SHA-256"},{"label":"Количество монет, доступных для майнинга","value":"36"},{"label":"Уровень шума","value":"75 ДБ"}]}$p33$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 34, 'pros_cons',
       $p34${"pros":["Один из самых мощных асиков на воздушном охлаждении для работы с SHA-256","Непревзойденное значение энергоэффективности","Взаимодействие в рамках самого надежного алгоритма","Сохранение актуальности на несколько лет вперед"],"cons":["Высокая стоимость","Вероятность серьезного нагрева, что формирует серьезные требования к помещению и условиям работы"]}$p34$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 35, 'heading',
       $p35${"level":2,"text":"6 место: Antminer L11 Pro"}$p35$::jsonb,
       'antminer-l11-pro'
FROM articles a WHERE a.slug = 'luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 36, 'paragraph',
       $p36${"text":"Bitmain продолжает развивать направление оборудования для Scrypt, анонсировав в 2025 году модель Antminer L11 Pro. Асик ориентирован на добычу Litecoin, Dogecoin и объединенный майнинг дополнительных токенов, что делает его выгодным вариантом для тех, кто ищет стабильный источник дохода в сегменте альткоинов.","html":"Bitmain продолжает развивать направление оборудования для Scrypt, анонсировав в 2025 году модель Antminer L11 Pro. Асик ориентирован на добычу Litecoin, Dogecoin и объединенный майнинг дополнительных токенов, что делает его выгодным вариантом для тех, кто ищет стабильный источник дохода в сегменте альткоинов."}$p36$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 37, 'paragraph',
       $p37${"text":"Устройство обладает внушительным хешрейтом 21 GH/s, что заметно превосходит показатели предыдущих моделей линейки. Конструкция привычна большинству майнеров: воздушное охлаждение, стандартные размеры и понятная настройка. Antminer L11 Pro рассчитан на долгий срок актуальности — высокая мощность и объединенный майнинг помогают сохранять прибыльность даже при росте сложности сети.","html":"Устройство обладает внушительным хешрейтом 21 GH/s, что заметно превосходит показатели предыдущих моделей линейки. Конструкция привычна большинству майнеров: воздушное охлаждение, стандартные размеры и понятная настройка. Antminer L11 Pro рассчитан на долгий срок актуальности — высокая мощность и объединенный майнинг помогают сохранять прибыльность даже при росте сложности сети."}$p37$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 38, 'image',
       $p38${"src":"/images/articles/best-antminer-2026/antminer-l11-pro.png","alt":"Antminer L11 Pro"}$p38$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 39, 'stats',
       $p39${"rows":[{"label":"Производитель","value":"Bitmain"},{"label":"Год выпуска","value":"2025"},{"label":"Хешрейт","value":"21 GH/s"},{"label":"Энергопотребление","value":"3 680 Вт"},{"label":"Энергоэффективность","value":"0,183 Вт на ГХ"},{"label":"Алгоритм","value":"Scrypt"},{"label":"Количество монет, доступных для майнинга","value":"22"},{"label":"Уровень шума","value":"76 Дб"}]}$p39$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 40, 'pros_cons',
       $p40${"pros":["Высокая производительность","Объединенный майнинг","Энергоэффективность"],"cons":["Высокая стоимость","Требования к электросети и охлаждению"]}$p40$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 41, 'heading',
       $p41${"level":2,"text":"5 место: Antminer S23"}$p41$::jsonb,
       'antminer-s23'
FROM articles a WHERE a.slug = 'luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 42, 'paragraph',
       $p42${"text":"Серия Antminer продолжает развиваться, и модель S23 стала одним из ключевых релизов Bitmain в 2025 году. Асик ориентирован на майнинг Bitcoin и других монет SHA-256 (всего более 20 активов) и создан как универсальное решение для тех, кто хочет максимизировать производительность без перехода на водяное охлаждение.","html":"Серия Antminer продолжает развиваться, и модель S23 стала одним из ключевых релизов Bitmain в 2025 году. Асик ориентирован на майнинг Bitcoin и других монет SHA-256 (всего более 20 активов) и создан как универсальное решение для тех, кто хочет максимизировать производительность без перехода на водяное охлаждение."}$p42$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 43, 'paragraph',
       $p43${"text":"Antminer S23 оснащен современной архитектурой чипов и демонстрирует отличный хешрейт 318 TH/s, что ставит его в один ряд с топовыми устройствами текущего поколения. При этом энергоэффективность составляет 11 J/TH — один из лучших показателей среди моделей на воздушном охлаждении. Потребление в 3498 Вт делает асик оптимальным для площадок, где важна окупаемость оборудования при стабильных энергозатратах.","html":"Antminer S23 оснащен современной архитектурой чипов и демонстрирует отличный хешрейт 318 TH/s, что ставит его в один ряд с топовыми устройствами текущего поколения. При этом энергоэффективность составляет 11 J/TH — один из лучших показателей среди моделей на воздушном охлаждении. Потребление в 3498 Вт делает асик оптимальным для площадок, где важна окупаемость оборудования при стабильных энергозатратах."}$p43$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 44, 'paragraph',
       $p44${"text":"Модель ориентирована на долгосрочную актуальность: высокая мощность позволяет уверенно выдерживать рост сложности сети, а классическая конструкция облегчает обслуживание и интеграцию в существующую ферму.","html":"Модель ориентирована на долгосрочную актуальность: высокая мощность позволяет уверенно выдерживать рост сложности сети, а классическая конструкция облегчает обслуживание и интеграцию в существующую ферму."}$p44$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 45, 'image',
       $p45${"src":"/images/articles/best-antminer-2026/antminer-s23.png","alt":"Antminer S23"}$p45$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 46, 'stats',
       $p46${"rows":[{"label":"Производитель","value":"Bitmain"},{"label":"Год выпуска","value":"2025"},{"label":"Хешрейт","value":"318 TH/s"},{"label":"Энергопотребление","value":"3 498 Вт"},{"label":"Энергоэффективность","value":"11 J/TH"},{"label":"Алгоритм","value":"SHA-256"},{"label":"Количество монет, доступных для майнинга","value":"20+"},{"label":"Уровень шума","value":"76 Дб"}]}$p46$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 47, 'pros_cons',
       $p47${"pros":["Высокая производительность","Энергоэффективность","Воздушное охлаждение без усложненной инфраструктуры"],"cons":["Высокая нагрузка на электросеть","Необходимость обеспечения стабильного охлаждения в помещении"]}$p47$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 48, 'heading',
       $p48${"level":2,"text":"4 место: Antminer S23 Imm"}$p48$::jsonb,
       'antminer-s23-imm'
FROM articles a WHERE a.slug = 'luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 49, 'paragraph',
       $p49${"text":"Версия Antminer S23 Immersion — специализированная модификация линейки Bitmain, созданная специально для промышленных ферм и дата-центров. Устройство работает в иммерсионной среде, что означает отсутствие вентиляторов, сниженный уровень шума и значительно увеличенный срок службы оборудования за счет минимизации износа.","html":"Версия Antminer S23 Immersion — специализированная модификация линейки Bitmain, созданная специально для промышленных ферм и дата-центров. Устройство работает в иммерсионной среде, что означает отсутствие вентиляторов, сниженный уровень шума и значительно увеличенный срок службы оборудования за счет минимизации износа."}$p49$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 50, 'paragraph',
       $p50${"text":"Асик демонстрирует хешрейт 368 TH/s, что превосходит показатели большинства моделей на воздушном охлаждении в том же классе. Энергоэффективность при этом сохраняется на уровне 11 J/TH, что делает устройство оптимальным решением для крупных проектов, где важны стабильность, прогнозируемая окупаемость и максимальная рентабельность в условиях растущей сложности сети.","html":"Асик демонстрирует хешрейт 368 TH/s, что превосходит показатели большинства моделей на воздушном охлаждении в том же классе. Энергоэффективность при этом сохраняется на уровне 11 J/TH, что делает устройство оптимальным решением для крупных проектов, где важны стабильность, прогнозируемая окупаемость и максимальная рентабельность в условиях растущей сложности сети."}$p50$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 51, 'paragraph',
       $p51${"text":"Иммерсионное охлаждение обеспечивает стабильную температуру даже при длительных нагрузках, что позволяет масштабировать майнинг-мощности без риска перегрева. Antminer S23 Imm рассчитан на работу с алгоритмом SHA-256, включая Bitcoin, Bitcoin Cash и более 20 совместимых криптовалют.","html":"Иммерсионное охлаждение обеспечивает стабильную температуру даже при длительных нагрузках, что позволяет масштабировать майнинг-мощности без риска перегрева. Antminer S23 Imm рассчитан на работу с алгоритмом SHA-256, включая Bitcoin, Bitcoin Cash и более 20 совместимых криптовалют."}$p51$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 52, 'image',
       $p52${"src":"/images/articles/best-antminer-2026/antminer-s23-imm.png","alt":"Antminer S23 Immersion"}$p52$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 53, 'stats',
       $p53${"rows":[{"label":"Производитель","value":"Bitmain"},{"label":"Год выпуска","value":"2025"},{"label":"Хешрейт","value":"368 TH/s"},{"label":"Энергопотребление","value":"4 048 Вт"},{"label":"Энергоэффективность","value":"11 J/TH"},{"label":"Алгоритм","value":"SHA-256"},{"label":"Количество монет, доступных для майнинга","value":"20+"},{"label":"Уровень шума","value":"40 Дб"}]}$p53$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 54, 'pros_cons',
       $p54${"pros":["Высокая мощность","Работа без вентиляторов – низкий уровень шума","Стабильность при круглосуточных нагрузках","Промышленная масштабируемость"],"cons":["Требует жидкостной инфраструктуры и специального оборудования для размещения"]}$p54$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 55, 'heading',
       $p55${"level":2,"text":"3 место: Antminer S21e XP Hyd 3U"}$p55$::jsonb,
       'antminer-s21e-xp-hyd-3u'
FROM articles a WHERE a.slug = 'luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 56, 'paragraph',
       $p56${"text":"Данной модели не суждено стать бестселлером и обрести мировую популярность. Однако это не отменяет другого простого факта: Antminer S21e XP Hyd 3U является самым мощным асиком для майнинга Bitcoin сегодня – его мощность составляет 860 Тх/с, что считается недостижимым значением для конкурентов. Потребление не менее внушительное – 11 180 Вт, что серьезно ограничивает сферу использования подобного оборудования.","html":"Данной модели не суждено стать бестселлером и обрести мировую популярность. Однако это не отменяет другого простого факта: Antminer S21e XP Hyd 3U является самым мощным асиком для майнинга Bitcoin сегодня – его мощность составляет 860 Тх/с, что считается недостижимым значением для конкурентов. Потребление не менее внушительное – 11 180 Вт, что серьезно ограничивает сферу использования подобного оборудования."}$p56$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 57, 'paragraph',
       $p57${"text":"Еще одна особенность модели – это водяное охлаждение: далеко не все площадки способны разместить подобную технику, что и ставит под вопрос перспективы данного асика. Зато показатели энергоэффективности также рекордные – 13 Вт на ТХ. Именно так выглядит самый мощный майнер на алгоритме SHA-256: в рамках подобной концепции будет формироваться рынок нового оборудования для BTC с еще более впечатляющими значениями производительности.","html":"Еще одна особенность модели – это водяное охлаждение: далеко не все площадки способны разместить подобную технику, что и ставит под вопрос перспективы данного асика. Зато показатели энергоэффективности также рекордные – 13 Вт на ТХ. Именно так выглядит самый мощный майнер на алгоритме SHA-256: в рамках подобной концепции будет формироваться рынок нового оборудования для BTC с еще более впечатляющими значениями производительности."}$p57$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 58, 'image',
       $p58${"src":"/images/articles/best-antminer-2026/antminer-s21e-xp-hyd-3u.png","alt":"Antminer S21e XP Hyd 3U"}$p58$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 59, 'stats',
       $p59${"rows":[{"label":"Производитель","value":"Bitmain"},{"label":"Год выпуска","value":"2024"},{"label":"Хешрейт","value":"860 ТХ/с"},{"label":"Энергопотребление","value":"11 180 Вт"},{"label":"Энергоэффективность","value":"13 Вт на ТХ"},{"label":"Алгоритм","value":"SHA-256"},{"label":"Количество монет, доступных для майнинга","value":"22"},{"label":"Уровень шума","value":"50 Дб"}]}$p59$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 60, 'pros_cons',
       $p60${"pros":["Самый мощный асик для добычи BTC","Лидирующий алгоритм добычи","Низкий уровень шума","Безупречная энергоэффективность"],"cons":["Высокая стоимость","Внушительное энергопотребление","Водяной принцип охлаждения"]}$p60$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 61, 'heading',
       $p61${"level":2,"text":"2 место: Antminer L11 Hydro 6U"}$p61$::jsonb,
       'antminer-l11-hydro-6u'
FROM articles a WHERE a.slug = 'luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 62, 'paragraph',
       $p62${"text":"Модель Antminer L11 Hydro 6U стала одним из наиболее технологичных решений Bitmain в сегменте Scrypt-майнинга. Устройство ориентировано на добычу Litecoin, Dogecoin и объединенный майнинг еще нескольких активов, предлагая высокий хешрейт 33 GH/s, что выводит его в категорию премиального оборудования для крупных площадок.","html":"Модель Antminer L11 Hydro 6U стала одним из наиболее технологичных решений Bitmain в сегменте Scrypt-майнинга. Устройство ориентировано на добычу Litecoin, Dogecoin и объединенный майнинг еще нескольких активов, предлагая высокий хешрейт 33 GH/s, что выводит его в категорию премиального оборудования для крупных площадок."}$p62$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 63, 'paragraph',
       $p63${"text":"Главная особенность модели — водяное охлаждение, которое обеспечивает стабильную работу при длительных нагрузках и уменьшает риск перегрева. Энергоэффективность при потреблении 5676 Вт позволяет сохранять привлекательную окупаемость на фоне роста сложности сети. Благодаря продуманной архитектуре, L11 Hydro 6U подходит для круглосуточной эксплуатации и минимизирует простои, что особенно важно в условиях промышленного майнинга.","html":"Главная особенность модели — водяное охлаждение, которое обеспечивает стабильную работу при длительных нагрузках и уменьшает риск перегрева. Энергоэффективность при потреблении 5676 Вт позволяет сохранять привлекательную окупаемость на фоне роста сложности сети. Благодаря продуманной архитектуре, L11 Hydro 6U подходит для круглосуточной эксплуатации и минимизирует простои, что особенно важно в условиях промышленного майнинга."}$p63$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 64, 'paragraph',
       $p64${"text":"Устройство работает тихо (около 50 дБ), что по меркам Scrypt-оборудования считается редким преимуществом. Это делает модель удобной для дата-центров и крупных ферм, где важны низкий уровень шума и строгий контроль температуры.","html":"Устройство работает тихо (около 50 дБ), что по меркам Scrypt-оборудования считается редким преимуществом. Это делает модель удобной для дата-центров и крупных ферм, где важны низкий уровень шума и строгий контроль температуры."}$p64$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 65, 'image',
       $p65${"src":"/images/articles/best-antminer-2026/antminer-l11-hydro-6u.png","alt":"Antminer L11 Hydro 6U"}$p65$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 66, 'stats',
       $p66${"rows":[{"label":"Производитель","value":"Bitmain"},{"label":"Год выпуска","value":"2025"},{"label":"Хешрейт","value":"33 GH/s"},{"label":"Энергопотребление","value":"5 676 Вт"},{"label":"Энергоэффективность","value":"0,172 Вт на ГХ"},{"label":"Алгоритм","value":"Scrypt"},{"label":"Количество монет, доступных для майнинга","value":"22"},{"label":"Уровень шума","value":"50 Дб"}]}$p66$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 67, 'pros_cons',
       $p67${"pros":["Высокая мощность","Водяное охлаждение – низкий уровень шума","Мощнейший асик на Scrypt"],"cons":["Требует гидросистемы и повышенного ресурса для инфраструктуры","Высокая стоимость"]}$p67$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 68, 'heading',
       $p68${"level":2,"text":"1 место: Antminer S23 Hydro 3U"}$p68$::jsonb,
       'antminer-s23-hydro-3u'
FROM articles a WHERE a.slug = 'luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 69, 'paragraph',
       $p69${"text":"Antminer S23 Hydro 3U стал революцией в мире майнинга: это первый асик Bitmain, преодолевший порог 1 петахеша мощности. Хешрейт модели достигает 1160 TH/s, что делает устройство самым производительным майнером на алгоритме SHA-256 на сегодняшний день. Такой уровень мощности позволяет операторам дата-центров и крупным инвесторам значительно увеличить плотность вычислений при минимальных требованиях к пространству.","html":"Antminer S23 Hydro 3U стал революцией в мире майнинга: это первый асик Bitmain, преодолевший порог 1 петахеша мощности. Хешрейт модели достигает 1160 TH/s, что делает устройство самым производительным майнером на алгоритме SHA-256 на сегодняшний день. Такой уровень мощности позволяет операторам дата-центров и крупным инвесторам значительно увеличить плотность вычислений при минимальных требованиях к пространству."}$p69$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 70, 'paragraph',
       $p70${"text":"Устройство использует водяное охлаждение, что обеспечивает стабильную температуру при высокой нагрузке, низкий уровень шума и продлевает срок службы оборудования. Энергоэффективность составляет 9.5 J/TH, что является одним из лучших показателей в индустрии и гарантирует привлекательную доходность даже с учетом роста сложности сети и изменений на криптовалютном рынке.","html":"Устройство использует водяное охлаждение, что обеспечивает стабильную температуру при высокой нагрузке, низкий уровень шума и продлевает срок службы оборудования. Энергоэффективность составляет 9.5 J/TH, что является одним из лучших показателей в индустрии и гарантирует привлекательную доходность даже с учетом роста сложности сети и изменений на криптовалютном рынке."}$p70$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 71, 'paragraph',
       $p71${"text":"Компактный форм-фактор 3U позволяет интегрировать устройство в стандартные серверные стойки, превращая его в мощный инструмент для масштабирования промышленных ферм. Antminer S23 Hydro 3U ориентирован исключительно на крупный майнинг — его потенциал раскрывается в условиях профессиональной инфраструктуры, где возможна установка комплексной системы гидроохлаждения.","html":"Компактный форм-фактор 3U позволяет интегрировать устройство в стандартные серверные стойки, превращая его в мощный инструмент для масштабирования промышленных ферм. Antminer S23 Hydro 3U ориентирован исключительно на крупный майнинг — его потенциал раскрывается в условиях профессиональной инфраструктуры, где возможна установка комплексной системы гидроохлаждения."}$p71$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 72, 'image',
       $p72${"src":"/images/articles/best-antminer-2026/antminer-s23-hydro-3u.png","alt":"Antminer S23 Hydro 3U"}$p72$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 73, 'stats',
       $p73${"rows":[{"label":"Производитель","value":"Bitmain"},{"label":"Год выпуска","value":"2025"},{"label":"Хешрейт","value":"1160 TH/s"},{"label":"Энергопотребление","value":"11 020 Вт"},{"label":"Энергоэффективность","value":"9,5 J/TH"},{"label":"Алгоритм","value":"SHA-256"},{"label":"Количество монет, доступных для майнинга","value":"20+"},{"label":"Уровень шума","value":"40 Дб"}]}$p73$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 74, 'pros_cons',
       $p74${"pros":["Рекордная производительность","Компактность для серверных стоек","Водяное охлаждение","Лучшая энергоэффективность среди асиков на SHA-256"],"cons":["Высокая стоимость инфраструктуры и энергопотребления","Подходит только для промышленных площадок","Высокая стоимость"]}$p74$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 75, 'heading',
       $p75${"level":2,"text":"Выводы"}$p75$::jsonb,
       'vyvody'
FROM articles a WHERE a.slug = 'luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 76, 'paragraph',
       $p76${"text":"Компания Bitmain неустанно доказывает свое лидерство в сфере техники для майнинга сразу по нескольким параметрам: это и объемы продаж, и количество моделей в линейке и многообразие монет, которые можно добывать с помощью Antminer. Именно так и выглядят ведущие позиции, которые позволяют инвесторам выбирать именно то оборудование, которое оптимально и предельно доходно в текущий момент времени.","html":"Компания Bitmain неустанно доказывает свое лидерство в сфере техники для майнинга сразу по нескольким параметрам: это и объемы продаж, и количество моделей в линейке и многообразие монет, которые можно добывать с помощью Antminer. Именно так и выглядят ведущие позиции, которые позволяют инвесторам выбирать именно то оборудование, которое оптимально и предельно доходно в текущий момент времени."}$p76$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu';

-- =====================================================================
-- 028_article_wifi_miners.sql
-- =====================================================================

-- Рейтинг майнеров с Wi-Fi: ТОП-3 асика без проводов

INSERT INTO articles (
    slug, title, title_subtitle, excerpt, content, topic_id,
    reading_time_min, reading_minutes, published_at, view_count,
    display_type, sort_order, is_published, uses_blocks,
    image_url, image_alt
) VALUES (
    'rejting-majnerov-s-wi-fi-top-3-asika-bez-provodov',
    'Рейтинг майнеров с Wi-Fi',
    'ТОП-3 асика без проводов',
    $excerpt$ТОП-3 асика с Wi-Fi для домашнего майнинга: iPollo V1 Mini, Jasminer X16-Q PRO и Elphapex DG Home 1 — без лишних проводов.$excerpt$,
    $content$Введение

Запуск фермы для добычи криптовалют дома – это не только низкий уровень шума, но и отсутствие проводного подключения.

Выводы

Несмотря на развитие формата домашнего майнинга, существует лишь небольшой ассортимент оборудования, ориентированного на работу с Wi-Fi сетями.$content$,
    'mining',
    9,
    9,
    '2024-12-23',
    996,
    'list',
    20,
    TRUE,
    TRUE,
    '/images/articles/wifi-miners/home-wifi-farm.png',
    'Домашняя майнинг-ферма с Wi-Fi'
)
ON CONFLICT (slug) DO UPDATE SET
    title = EXCLUDED.title,
    title_subtitle = EXCLUDED.title_subtitle,
    excerpt = EXCLUDED.excerpt,
    content = EXCLUDED.content,
    reading_time_min = EXCLUDED.reading_time_min,
    reading_minutes = EXCLUDED.reading_minutes,
    published_at = EXCLUDED.published_at,
    view_count = EXCLUDED.view_count,
    uses_blocks = TRUE,
    image_url = EXCLUDED.image_url,
    image_alt = EXCLUDED.image_alt,
    is_published = TRUE;

DELETE FROM article_blocks
WHERE article_id = (SELECT id FROM articles WHERE slug = 'rejting-majnerov-s-wi-fi-top-3-asika-bez-provodov');

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 1, 'heading',
       $p1${"level":2,"text":"Введение"}$p1$::jsonb,
       'vvedenie'
FROM articles a WHERE a.slug = 'rejting-majnerov-s-wi-fi-top-3-asika-bez-provodov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 2, 'paragraph',
       $p2${"text":"Запуск фермы для добычи криптовалют дома – это не только низкий уровень шума, но и отсутствие проводного подключения. Эстетическая составляющая и беспроводное соединение являются важнейшими требованиями тех, кто предпочитает майнить в жилых помещениях. Познакомимся с тремя устройствами, которые полностью соответствуют заданным характеристикам: это компактные, тихие, «холодные» асики, которые можно запустить с помощью встроенного Wi-Fi модуля.","html":"Запуск фермы для добычи криптовалют дома – это не только низкий уровень шума, но и отсутствие проводного подключения. Эстетическая составляющая и беспроводное соединение являются важнейшими требованиями тех, кто предпочитает майнить в жилых помещениях. Познакомимся с тремя устройствами, которые полностью соответствуют заданным характеристикам: это компактные, тихие, «холодные» асики, которые можно запустить с помощью встроенного Wi-Fi модуля."}$p2$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-majnerov-s-wi-fi-top-3-asika-bez-provodov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 3, 'image',
       $p3${"src":"/images/articles/wifi-miners/home-wifi-farm.png","alt":"Домашняя майнинг-ферма без лишних проводов"}$p3$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-majnerov-s-wi-fi-top-3-asika-bez-provodov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 4, 'heading',
       $p4${"level":2,"text":"3 место: iPollo V1 Mini"}$p4$::jsonb,
       'ipollo-v1-mini'
FROM articles a WHERE a.slug = 'rejting-majnerov-s-wi-fi-top-3-asika-bez-provodov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 5, 'paragraph',
       $p5${"text":"Именно серию V1 Mini от компании iPollo можно считать основоположником линейки асиков с беспроводным подключением. Майнеры были призваны заменить добычу на CPU и GPU, сохранив все преимущества работы в подобном формате. Это органичный внешний вид, низкий уровень шума, комфортные температуры работы, а также отсутствие большого количества проводов, что позволяет произвести быстрое и комфортное подключение.","html":"Именно серию V1 Mini от компании iPollo можно считать основоположником линейки асиков с беспроводным подключением. Майнеры были призваны заменить добычу на CPU и GPU, сохранив все преимущества работы в подобном формате. Это органичный внешний вид, низкий уровень шума, комфортные температуры работы, а также отсутствие большого количества проводов, что позволяет произвести быстрое и комфортное подключение."}$p5$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-majnerov-s-wi-fi-top-3-asika-bez-provodov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 6, 'paragraph',
       $p6${"text":"Работает продукция iPollo на алгоритме Ethash – это популярный формат майнинга, который сложно назвать новым. В этом заключается его преимущество: производится работа с известными монетами, курс которых стабилен и не подвержен серьезной волатильности. Самым мощным асиком серии iPollo является модель V1 Mini SE Plus. Обладая мощностью 400 MH/с, устройство потребляет всего 232 Вт электричества, а уровень шума не превышает 35 Дб.","html":"Работает продукция iPollo на алгоритме Ethash – это популярный формат майнинга, который сложно назвать новым. В этом заключается его преимущество: производится работа с известными монетами, курс которых стабилен и не подвержен серьезной волатильности. Самым мощным асиком серии iPollo является модель V1 Mini SE Plus. Обладая мощностью 400 MH/с, устройство потребляет всего 232 Вт электричества, а уровень шума не превышает 35 Дб."}$p6$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-majnerov-s-wi-fi-top-3-asika-bez-provodov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 7, 'image',
       $p7${"src":"/images/articles/wifi-miners/ipollo-v1-mini.png","alt":"iPollo V1 Mini Wi-Fi"}$p7$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-majnerov-s-wi-fi-top-3-asika-bez-provodov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 8, 'stats',
       $p8${"rows":[{"label":"Производитель","value":"iPollo"},{"label":"Год выпуска","value":"2022"},{"label":"Хешрейт","value":"400 MH/с"},{"label":"Энергопотребление","value":"232 Вт"},{"label":"Энергоэффективность","value":"0,58 Вт на MH"},{"label":"Алгоритм","value":"Ethash"},{"label":"Количество монет, доступных для майнинга","value":"16"},{"label":"Уровень шума","value":"35 Дб"}]}$p8$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-majnerov-s-wi-fi-top-3-asika-bez-provodov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 9, 'pros_cons',
       $p9${"pros":["Целая линейка моделей с различной производительностью","Приятный дизайн устройств, включая вариации в золотом цвете","Уже проверенный производитель, который знаком многим","Предельно низкий уровень шума","Работа в рамках проверенного алгоритма"],"cons":["Минимальная доходность среди всех домашних асиков с Wi-Fi"]}$p9$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-majnerov-s-wi-fi-top-3-asika-bez-provodov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 10, 'heading',
       $p10${"level":2,"text":"2 место: Jasminer X16-Q PRO"}$p10$::jsonb,
       'jasminer-x16-q-pro'
FROM articles a WHERE a.slug = 'rejting-majnerov-s-wi-fi-top-3-asika-bez-provodov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 11, 'paragraph',
       $p11${"text":"Асики Jasminer X16-Q также можно считать открытием нового сегмента: в отличие от продукции iPollo, это уже значительно более производительное оборудование, которое занимает нишу между майнерами начального уровня и профессиональными асиками промышленного образца. При этом производителю удалось сохранить все преимущества формата добычи в жилых помещениях – относительная компактность, небольшой объем потребления, достаточно низкий уровень шума и беспроводное подключение к сети.","html":"Асики Jasminer X16-Q также можно считать открытием нового сегмента: в отличие от продукции iPollo, это уже значительно более производительное оборудование, которое занимает нишу между майнерами начального уровня и профессиональными асиками промышленного образца. При этом производителю удалось сохранить все преимущества формата добычи в жилых помещениях – относительная компактность, небольшой объем потребления, достаточно низкий уровень шума и беспроводное подключение к сети."}$p11$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-majnerov-s-wi-fi-top-3-asika-bez-provodov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 12, 'paragraph',
       $p12${"text":"Асик предлагает пользователям сразу два алгоритма – Etchash и Ethash, что превращает использование Jasminer в надежный формат инвестирования. Более того, именно эта модель стала образцом для многих других производителей: после выхода на свет X16-Q бренды принялись стремительно заполнять нишу, выпуская схожие по концепции майнеры, включая оборудование на других алгоритмах.","html":"Асик предлагает пользователям сразу два алгоритма – Etchash и Ethash, что превращает использование Jasminer в надежный формат инвестирования. Более того, именно эта модель стала образцом для многих других производителей: после выхода на свет X16-Q бренды принялись стремительно заполнять нишу, выпуская схожие по концепции майнеры, включая оборудование на других алгоритмах."}$p12$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-majnerov-s-wi-fi-top-3-asika-bez-provodov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 13, 'image',
       $p13${"src":"/images/articles/wifi-miners/jasminer-x16-q-pro.png","alt":"Jasminer X16-Q PRO"}$p13$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-majnerov-s-wi-fi-top-3-asika-bez-provodov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 14, 'stats',
       $p14${"rows":[{"label":"Производитель","value":"Sunlune Technology"},{"label":"Год выпуска","value":"2023"},{"label":"Хешрейт","value":"5 800 MH/с"},{"label":"Энергопотребление","value":"1 900 Вт"},{"label":"Энергоэффективность","value":"0,32 Вт на MH"},{"label":"Алгоритм","value":"Etchash/Ethash"},{"label":"Количество монет, доступных для майнинга","value":"16"},{"label":"Уровень шума","value":"40 Дб"}]}$p14$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-majnerov-s-wi-fi-top-3-asika-bez-provodov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 15, 'pros_cons',
       $p15${"pros":["Полноценный майнер в форм-факторе классического компьютера","Устойчивый и надежный алгоритм работы","Jasminer – это относительно молодой бренд, но его надежность уже доказана временем","Одна из мощнейших модификаций для работы с Etchash и Ethash","Хорошая доходность для формата домашней добычи"],"cons":["Высокая стоимость","Возможные трудности с поиском запчастей из-за молодого бренда"]}$p15$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-majnerov-s-wi-fi-top-3-asika-bez-provodov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 16, 'heading',
       $p16${"level":2,"text":"1 место: Elphapex DG Home 1"}$p16$::jsonb,
       'elphapex-dg-home-1'
FROM articles a WHERE a.slug = 'rejting-majnerov-s-wi-fi-top-3-asika-bez-provodov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 17, 'paragraph',
       $p17${"text":"Безоговорочным лидером сегмента домашних майнеров с Wi-Fi интерфейсом является модель DG Home 1 от компании Elphapex. Новый бренд, который громко заявил о себе, навязав ощутимую конкурентную борьбу лидерам в сегменте майнеров на алгоритме Scrypt. Начав с классических промышленных асиков, Elphapex не забыл и об интересах домашних майнеров, выпустив модель DG Home 1.","html":"Безоговорочным лидером сегмента домашних майнеров с Wi-Fi интерфейсом является модель DG Home 1 от компании Elphapex. Новый бренд, который громко заявил о себе, навязав ощутимую конкурентную борьбу лидерам в сегменте майнеров на алгоритме Scrypt. Начав с классических промышленных асиков, Elphapex не забыл и об интересах домашних майнеров, выпустив модель DG Home 1."}$p17$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-majnerov-s-wi-fi-top-3-asika-bez-provodov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 18, 'paragraph',
       $p18${"text":"Производитель появился относительно недавно, но за небольшой промежуток времени сумел завоевать впечатляющую популярность.","html":"Производитель появился относительно недавно, но за небольшой промежуток времени сумел завоевать впечатляющую популярность."}$p18$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-majnerov-s-wi-fi-top-3-asika-bez-provodov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 19, 'paragraph',
       $p19${"text":"Причиной спроса на всю линейку DG от Elphapex является удачный выбор алгоритма: сегодня с помощью Scrypt можно добывать сразу 6 монет одновременно – именно так функционирует принцип объединенного майнинга. Всего же владельцам подобной аппаратуры доступно более двух десятков токенов, что является важным преимуществом формата.","html":"Причиной спроса на всю линейку DG от Elphapex является удачный выбор алгоритма: сегодня с помощью Scrypt можно добывать сразу 6 монет одновременно – именно так функционирует принцип объединенного майнинга. Всего же владельцам подобной аппаратуры доступно более двух десятков токенов, что является важным преимуществом формата."}$p19$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-majnerov-s-wi-fi-top-3-asika-bez-provodov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 20, 'image',
       $p20${"src":"/images/articles/wifi-miners/elphapex-dg-home-1.png","alt":"Elphapex DG Home 1"}$p20$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-majnerov-s-wi-fi-top-3-asika-bez-provodov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 21, 'stats',
       $p21${"rows":[{"label":"Производитель","value":"Elphapex"},{"label":"Год выпуска","value":"2024"},{"label":"Хешрейт","value":"2100 MH/с"},{"label":"Энергопотребление","value":"630 Вт"},{"label":"Энергоэффективность","value":"0,3 Вт на MH"},{"label":"Алгоритм","value":"Scrypt"},{"label":"Количество монет, доступных для майнинга","value":"21"},{"label":"Уровень шума","value":"50 ДБ"}]}$p21$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-majnerov-s-wi-fi-top-3-asika-bez-provodov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 22, 'pros_cons',
       $p22${"pros":["Один из ведущих алгоритмов для альткоинов – Scrypt (объединенная добыча LTC + DOGE + BELLS + PEP + LKY + JKC)","Достойные параметры производительности для сегмента добычи в жилых помещениях","Привлекательный внешний вид","Приемлемая стоимость из-за молодости бренда"],"cons":["Компания Elphapex еще не успела пройти проверку временем","Возможные трудности с поиском запчастей и сервисных центров"]}$p22$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-majnerov-s-wi-fi-top-3-asika-bez-provodov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 23, 'heading',
       $p23${"level":2,"text":"Как превратить любой асик в Wi-Fi майнер?"}$p23$::jsonb,
       'kak-prevratit-asik-v-wifi'
FROM articles a WHERE a.slug = 'rejting-majnerov-s-wi-fi-top-3-asika-bez-provodov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 24, 'paragraph',
       $p24${"text":"Техника для добычи криптовалют с Wi-Fi интерфейсом – достаточно редкое явление на фоне совокупного ассортимента аппаратуры. Однако существует способ превращения любого майнера с LAN-выходом в Wi-Fi модель. Для решения этой задачи потребуется всего несколько комплектующих:","html":"Техника для добычи криптовалют с Wi-Fi интерфейсом – достаточно редкое явление на фоне совокупного ассортимента аппаратуры. Однако существует способ превращения любого майнера с LAN-выходом в Wi-Fi модель. Для решения этой задачи потребуется всего несколько комплектующих:"}$p24$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-majnerov-s-wi-fi-top-3-asika-bez-provodov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 25, 'list',
       $p25${"ordered":false,"items":["Преобразователь Wi-Fi соединения в проводной способ передачи данных. Это может быть обычный усилитель сигнала с LAN-разъемом: стоимость подобных устройств не превышает 1 000 рублей;","Ethernet-кабель небольшой длины;","Роутер (в том числе, без LAN-интерфейса)."]}$p25$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-majnerov-s-wi-fi-top-3-asika-bez-provodov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 26, 'paragraph',
       $p26${"text":"Система подключения основывается на передаче беспроводного сигнала от роутера к усилителю, к которому, в свою очередь, с помощью провода подключается асик.","html":"Система подключения основывается на передаче беспроводного сигнала от роутера к усилителю, к которому, в свою очередь, с помощью провода подключается асик."}$p26$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-majnerov-s-wi-fi-top-3-asika-bez-provodov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 27, 'paragraph',
       $p27${"text":"С помощью подобного комплекта можно использовать любой промышленный майнер, который не оснащен Wi-Fi. Вместо этого используется преобразователь, выполняющий функцию посредника между асиком и роутером.","html":"С помощью подобного комплекта можно использовать любой промышленный майнер, который не оснащен Wi-Fi. Вместо этого используется преобразователь, выполняющий функцию посредника между асиком и роутером."}$p27$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-majnerov-s-wi-fi-top-3-asika-bez-provodov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 28, 'heading',
       $p28${"level":2,"text":"Wi-Fi в майнинге: преимущества и недостатки"}$p28$::jsonb,
       'wifi-plusy-minusy'
FROM articles a WHERE a.slug = 'rejting-majnerov-s-wi-fi-top-3-asika-bez-provodov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 29, 'paragraph',
       $p29${"text":"Какими достоинствами обладает формат использования беспроводного доступа при организации собственной фермы? Существует три причины сделать выбор в пользу такого способа работы:","html":"Какими достоинствами обладает формат использования беспроводного доступа при организации собственной фермы? Существует три причины сделать выбор в пользу такого способа работы:"}$p29$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-majnerov-s-wi-fi-top-3-asika-bez-provodov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 30, 'list',
       $p30${"ordered":false,"items":["Минимальное количество проводов, что особенно актуально для домашнего формата. Лаконичный вариант подключения эстетически привлекателен и позволяет сохранить дизайнерскую целостность помещения;","Использование роутера без возможности подключения кабеля. Многие модели 3G и 4G модемов предполагают реализацию только Wi-Fi стандарта, поэтому использовать LAN-кабель здесь не представляется возможным;","Внушительное расстояние между роутером и майнером, что часто актуально в формате домашнего майнинга. Чтобы не перегружать квартиру проводами, проще выбрать Wi-Fi-интерфейс."]}$p30$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-majnerov-s-wi-fi-top-3-asika-bez-provodov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 31, 'paragraph',
       $p31${"text":"Недостаток реализации механизма беспроводной передачи данных один – это пинг.","html":"Недостаток реализации механизма беспроводной передачи данных один – это пинг."}$p31$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-majnerov-s-wi-fi-top-3-asika-bez-provodov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 32, 'paragraph',
       $p32${"text":"Далеко не каждое Wi-Fi подключение соответствует требованиям, необходимым для качественной и бесперебойной работы фермы. Именно поэтому немногие производители ориентируются на асики с Wi-Fi, отдавая предпочтение традиционному (и более надежному) типу функционирования.","html":"Далеко не каждое Wi-Fi подключение соответствует требованиям, необходимым для качественной и бесперебойной работы фермы. Именно поэтому немногие производители ориентируются на асики с Wi-Fi, отдавая предпочтение традиционному (и более надежному) типу функционирования."}$p32$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-majnerov-s-wi-fi-top-3-asika-bez-provodov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 33, 'heading',
       $p33${"level":2,"text":"Выводы"}$p33$::jsonb,
       'vyvody'
FROM articles a WHERE a.slug = 'rejting-majnerov-s-wi-fi-top-3-asika-bez-provodov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 34, 'paragraph',
       $p34${"text":"Несмотря на развитие формата домашнего майнинга, существует лишь небольшой ассортимент оборудования, ориентированного на работу с Wi-Fi сетями:","html":"Несмотря на развитие формата домашнего майнинга, существует лишь небольшой ассортимент оборудования, ориентированного на работу с Wi-Fi сетями:"}$p34$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-majnerov-s-wi-fi-top-3-asika-bez-provodov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 35, 'list',
       $p35${"ordered":false,"items":["iPollo V1 Mini;","Jasminer X16-Q PRO;","Elphapex DG Home 1."]}$p35$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-majnerov-s-wi-fi-top-3-asika-bez-provodov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 36, 'paragraph',
       $p36${"text":"Однако рекомендация, приведенная нами выше, позволяет использовать любой классический асик с беспроводными форматами раздачи сигнала. Стоимость подобного дополнения ничтожно мала по сравнению с преимуществами, которые получает пользователь.","html":"Однако рекомендация, приведенная нами выше, позволяет использовать любой классический асик с беспроводными форматами раздачи сигнала. Стоимость подобного дополнения ничтожно мала по сравнению с преимуществами, которые получает пользователь."}$p36$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-majnerov-s-wi-fi-top-3-asika-bez-provodov';

-- =====================================================================
-- 029_article_scrypt_miners.sql
-- =====================================================================

-- Рейтинг асиков на Scrypt: ТОП-10 лучших майнеров DOGE

INSERT INTO articles (
    slug, title, title_subtitle, excerpt, content, topic_id,
    reading_time_min, reading_minutes, published_at, view_count,
    display_type, sort_order, is_published, uses_blocks,
    image_url, image_alt
) VALUES (
    'rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge',
    'Рейтинг асиков на Scrypt',
    'ТОП-10 лучших майнеров DOGE',
    $excerpt$ТОП-10 лучших асиков на Scrypt для майнинга DOGE и LTC: от Elphapex DG Home 1 до Antminer L11 Hydro 6U.$excerpt$,
    $content$Введение

Scrypt является самым популярным стандартом добычи цифровых активов после майнинга Bitcoin на SHA-256.

Выводы

В рейтинге лучших асиков на алгоритме Scrypt оказались модели Antminer, Elphapex и VolcMiner.$content$,
    'mining',
    9,
    9,
    '2024-12-17',
    1902,
    'list',
    30,
    TRUE,
    TRUE,
    '/images/articles/scrypt-miners/doge-scrypt-intro.png',
    'Dogecoin и майнинг на Scrypt'
)
ON CONFLICT (slug) DO UPDATE SET
    title = EXCLUDED.title,
    title_subtitle = EXCLUDED.title_subtitle,
    excerpt = EXCLUDED.excerpt,
    content = EXCLUDED.content,
    reading_time_min = EXCLUDED.reading_time_min,
    reading_minutes = EXCLUDED.reading_minutes,
    published_at = EXCLUDED.published_at,
    view_count = EXCLUDED.view_count,
    uses_blocks = TRUE,
    image_url = EXCLUDED.image_url,
    image_alt = EXCLUDED.image_alt,
    is_published = TRUE;

DELETE FROM article_blocks
WHERE article_id = (SELECT id FROM articles WHERE slug = 'rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge');

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 1, 'heading',
       $p1${"level":2,"text":"Введение"}$p1$::jsonb,
       'vvedenie'
FROM articles a WHERE a.slug = 'rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 2, 'paragraph',
       $p2${"text":"Scrypt является самым популярным стандартом добычи цифровых активов после майнинга Bitcoin на SHA-256. Причин популярности этого алгоритма множество – от поддержки DOGE со стороны Илона Маска до объединенной добычи сразу шести монет (LTC + DOGE + BELLS + PEP + LKY + JKC + DINGO), что позволяет максимизировать доходность без дополнительных расходов. Познакомимся с ТОП-10 наиболее популярных майнеров на алгоритме Scrypt: проанализируем классические модели, а также отметим пару форматов, идеально адаптированных для работы в домашних условиях.","html":"Scrypt является самым популярным стандартом добычи цифровых активов после майнинга Bitcoin на SHA-256. Причин популярности этого алгоритма множество – от поддержки DOGE со стороны Илона Маска до объединенной добычи сразу шести монет (LTC + DOGE + BELLS + PEP + LKY + JKC + DINGO), что позволяет максимизировать доходность без дополнительных расходов. Познакомимся с ТОП-10 наиболее популярных майнеров на алгоритме Scrypt: проанализируем классические модели, а также отметим пару форматов, идеально адаптированных для работы в домашних условиях."}$p2$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 3, 'image',
       $p3${"src":"/images/articles/scrypt-miners/doge-scrypt-intro.png","alt":"Dogecoin и объединенный майнинг на Scrypt"}$p3$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 4, 'heading',
       $p4${"level":2,"text":"Алгоритм Scrypt: от создания до преимуществ"}$p4$::jsonb,
       'algoritm-scrypt'
FROM articles a WHERE a.slug = 'rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 5, 'paragraph',
       $p5${"text":"Scrypt был предложен в 2009 году Колином Персивалем как функция защиты паролей, требующая больших объемов памяти, чтобы затруднить взлом. В 2011 году Чарли Ли использовал его при создании Litecoin – альтернативы Bitcoin с более быстрыми транзакциями и упором на децентрализацию.","html":"Scrypt был предложен в 2009 году Колином Персивалем как функция защиты паролей, требующая больших объемов памяти, чтобы затруднить взлом. В 2011 году Чарли Ли использовал его при создании Litecoin – альтернативы Bitcoin с более быстрыми транзакциями и упором на децентрализацию."}$p5$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 6, 'paragraph',
       $p6${"text":"Главная идея: предложить майнинг на обычных видеокартах и процессорах, требуя незначительной вычислительной мощности. Это делало Scrypt более «демократичным» в первые годы – майнить могли даже обычные пользователи.","html":"Главная идея: предложить майнинг на обычных видеокартах и процессорах, требуя незначительной вычислительной мощности. Это делало Scrypt более «демократичным» в первые годы – майнить могли даже обычные пользователи."}$p6$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 7, 'paragraph',
       $p7${"text":"Преимущества Scrypt-алгоритма:","html":"Преимущества Scrypt-алгоритма:"}$p7$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 8, 'list',
       $p8${"ordered":false,"items":["Поддержка объединенного майнинга. Например, можно майнить Litecoin и Dogecoin одновременно (а также еще ряд монет), получая вознаграждение за параллельную работу без потери мощности;","Более демократичный старт. Алгоритм задумывался как защита от централизации майнинга, хотя со временем появились Scrypt-асики;","Низкий порог входа. До сих пор существуют монеты на Scrypt, которые можно майнить даже с относительно недорогим оборудованием;","Быстрые транзакции и низкие комиссии у многих Scrypt-монет."]}$p8$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 9, 'paragraph',
       $p9${"text":"Наиболее известные монеты, добываемые на алгоритме Scrypt:","html":"Наиболее известные монеты, добываемые на алгоритме Scrypt:"}$p9$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 10, 'list',
       $p10${"ordered":false,"items":["Litecoin (LTC) – «цифровое серебро», основная и первая Scrypt-монета;","Dogecoin (DOGE) – популярная мем-монета, активно используется в объединённом майнинге с Litecoin. Поддерживается Илоном Маском;","Viacoin (VIA) – быстрые транзакции и высокая масштабируемость;","DigiByte (DGB) – мультиалгоритмичная сеть, частично использует Scrypt."]}$p10$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 11, 'paragraph',
       $p11${"text":"Отдельно следует отметить объединенный майнинг (Merged Mining): Scrypt позволяет одновременно добывать несколько совместимых монет, не увеличивая энергозатраты. Это делается с помощью так называемого «auxiliary proof-of-work».","html":"Отдельно следует отметить объединенный майнинг (Merged Mining): Scrypt позволяет одновременно добывать несколько совместимых монет, не увеличивая энергозатраты. Это делается с помощью так называемого «auxiliary proof-of-work»."}$p11$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 12, 'paragraph',
       $p12${"text":"Например, добывая Litecoin, вы автоматически майните и Dogecoin, если пул это поддерживает. Подход увеличивает доходность и снижает риски.","html":"Например, добывая Litecoin, вы автоматически майните и Dogecoin, если пул это поддерживает. Подход увеличивает доходность и снижает риски."}$p12$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 13, 'paragraph',
       $p13${"text":"Всего же в формате объединенного майнинга на Scrypt доступно 7 монет: LTC + DOGE + BELLS + PEP + LKY + JKC + DINGO. Это ощутимое преимущество формата, которое интересно не только с маркетинговой, но и практической точки зрения.","html":"Всего же в формате объединенного майнинга на Scrypt доступно 7 монет: LTC + DOGE + BELLS + PEP + LKY + JKC + DINGO. Это ощутимое преимущество формата, которое интересно не только с маркетинговой, но и практической точки зрения."}$p13$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 14, 'heading',
       $p14${"level":2,"text":"10 место: Elphapex DG Home 1"}$p14$::jsonb,
       'elphapex-dg-home-1'
FROM articles a WHERE a.slug = 'rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 15, 'paragraph',
       $p15${"text":"Вторым домашним асиком нашего рейтинга является модель DG Home 1 от достаточно нового производителя Elphapex. В отличие от предшественника этот майнер отличается более внушительным уровнем мощности – 2 100 МХ/с, что при потреблении всего 630 Вт делает его весьма энергоэффективным. Внешний вид юнита напоминает современный системный блок, что позволяет модели интегрироваться в любой интерьер.","html":"Вторым домашним асиком нашего рейтинга является модель DG Home 1 от достаточно нового производителя Elphapex. В отличие от предшественника этот майнер отличается более внушительным уровнем мощности – 2 100 МХ/с, что при потреблении всего 630 Вт делает его весьма энергоэффективным. Внешний вид юнита напоминает современный системный блок, что позволяет модели интегрироваться в любой интерьер."}$p15$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 16, 'paragraph',
       $p16${"text":"Среди недостатков DG Home 1 – это молодость как самого асика, так и производителя. Компания Elphapex еще не успела доказать качество своей продукции временем, так как бренд вышел на рынок относительно недавно. Более того, модель также является новой: первыми майнерами производителя стали классические промышленные форматы, а уже через некоторое время появилась версия для домашнего использования.","html":"Среди недостатков DG Home 1 – это молодость как самого асика, так и производителя. Компания Elphapex еще не успела доказать качество своей продукции временем, так как бренд вышел на рынок относительно недавно. Более того, модель также является новой: первыми майнерами производителя стали классические промышленные форматы, а уже через некоторое время появилась версия для домашнего использования."}$p16$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 17, 'image',
       $p17${"src":"/images/articles/scrypt-miners/elphapex-dg-home-1.png","alt":"Elphapex DG Home 1"}$p17$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 18, 'stats',
       $p18${"rows":[{"label":"Производитель","value":"Elphapex"},{"label":"Год выпуска","value":"2024"},{"label":"Базовый хешрейт","value":"2100 МХ/с"},{"label":"Энергопотребление","value":"630 Вт"},{"label":"Энергоэффективность","value":"0,3 Вт на МХ"},{"label":"Алгоритм","value":"Scrypt"},{"label":"Количество монет, доступных для майнинга","value":"21"},{"label":"Размеры","value":"57 x 54 x 32 см"},{"label":"Масса","value":"10,3 кг"},{"label":"Уровень шума","value":"50 ДБ"}]}$p18$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 19, 'pros_cons',
       $p19${"pros":["Мощный асик для домашнего запуска на алгоритме Scrypt","Достойная энергоэффективность"],"cons":["Молодой производитель","Новая модель, надежность которой только предстоит выяснить","50 ДБ является достаточно серьезным порогом шума для использования в жилых помещениях"]}$p19$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 20, 'heading',
       $p20${"level":2,"text":"9 место: Antminer L7"}$p20$::jsonb,
       'antminer-l7'
FROM articles a WHERE a.slug = 'rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 21, 'paragraph',
       $p21${"text":"Асик от ведущего мирового производителя техники для добычи криптовалют. Седьмая серия майнеров на Scrypt от компании Bitmain объединяет сразу несколько устройств различной мощности (от 8 500 до 9 500 МХ/с). Модель начала терять свою актуальность на фоне выхода более мощных альтернатив, однако рост стоимости Dogecoin и появление новых монет в формате объединенного майнинга сделало работу на Antminer L7 вновь выгодной и актуальной.","html":"Асик от ведущего мирового производителя техники для добычи криптовалют. Седьмая серия майнеров на Scrypt от компании Bitmain объединяет сразу несколько устройств различной мощности (от 8 500 до 9 500 МХ/с). Модель начала терять свою актуальность на фоне выхода более мощных альтернатив, однако рост стоимости Dogecoin и появление новых монет в формате объединенного майнинга сделало работу на Antminer L7 вновь выгодной и актуальной."}$p21$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 22, 'paragraph',
       $p22${"text":"Модель выпускается в форм-факторе классического промышленного майнера с соответствующими техническими характеристиками – большой объем энергопотребления, внушительный массив выделяемого тепла, а также серьезный уровень шума. Запуск такой аппаратуры в домашних условиях возможен только при дополнении системы качественным шумбоксом, но доходность L7 значительно превышает выгоду применения майнеров домашнего формата.","html":"Модель выпускается в форм-факторе классического промышленного майнера с соответствующими техническими характеристиками – большой объем энергопотребления, внушительный массив выделяемого тепла, а также серьезный уровень шума. Запуск такой аппаратуры в домашних условиях возможен только при дополнении системы качественным шумбоксом, но доходность L7 значительно превышает выгоду применения майнеров домашнего формата."}$p22$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 23, 'image',
       $p23${"src":"/images/articles/scrypt-miners/antminer-l7.png","alt":"Antminer L7"}$p23$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 24, 'stats',
       $p24${"rows":[{"label":"Производитель","value":"Bitmain"},{"label":"Год выпуска","value":"2021"},{"label":"Базовый хешрейт","value":"9 500 МХ/с"},{"label":"Энергопотребление","value":"3 500 Вт"},{"label":"Энергоэффективность","value":"0,36 Вт на МХ"},{"label":"Алгоритм","value":"Scrypt"},{"label":"Количество монет, доступных для майнинга","value":"21"},{"label":"Размеры","value":"37 x 19,5 x 29 см"},{"label":"Масса","value":"15 кг"},{"label":"Уровень шума","value":"70 ДБ"}]}$p24$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 25, 'pros_cons',
       $p25${"pros":["Ведущий бренд, отличающийся хорошей репутацией","Старая и проверенная модель с большим количеством запчастей и ремонтных мастерских","Уверенная доходность даже несмотря на появление майнеров нового поколения","Актуальность на вторичном рынке"],"cons":["Устаревающий асик, перспективы которого зависят от курса DOGE","Не самая лучшая энергоэффективность","Промышленный формат с невозможностью комфортного запуска в домашних условиях"]}$p25$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 26, 'heading',
       $p26${"level":2,"text":"8 место: Elphapex DG1"}$p26$::jsonb,
       'elphapex-dg1'
FROM articles a WHERE a.slug = 'rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 27, 'paragraph',
       $p27${"text":"Молодая компания Elphapex громко заявила о себе выходом линейки майнеров DG1 и DG1+ на алгоритме Scrypt. Появление данной серии оказало серьезную конкуренцию продукции Bitmain, так как новинки обратили на себя внимание не только техническими характеристиками, но и более низкой ценой. Бренду только предстоит доказать надежность собственной аппаратуры, но такой уверенный старт убеждает инвесторов в появлении еще одного сильного игрока на рынке.","html":"Молодая компания Elphapex громко заявила о себе выходом линейки майнеров DG1 и DG1+ на алгоритме Scrypt. Появление данной серии оказало серьезную конкуренцию продукции Bitmain, так как новинки обратили на себя внимание не только техническими характеристиками, но и более низкой ценой. Бренду только предстоит доказать надежность собственной аппаратуры, но такой уверенный старт убеждает инвесторов в появлении еще одного сильного игрока на рынке."}$p27$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 28, 'paragraph',
       $p28${"text":"Выбирая продукцию Elphapex, можно отдать предпочтение асикам различной мощности – от 8 000 до 14 400 МХ/с. Таким образом, линейка DG1 практически полностью повторяет ассортимент Antminer L7 и L9, что и является основой успеха производителя. Elphapex уступает Bitmain только в сегменте ТОПовых моделей, однако это может оказаться лишь временной проблемой нового бренда.","html":"Выбирая продукцию Elphapex, можно отдать предпочтение асикам различной мощности – от 8 000 до 14 400 МХ/с. Таким образом, линейка DG1 практически полностью повторяет ассортимент Antminer L7 и L9, что и является основой успеха производителя. Elphapex уступает Bitmain только в сегменте ТОПовых моделей, однако это может оказаться лишь временной проблемой нового бренда."}$p28$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 29, 'image',
       $p29${"src":"/images/articles/scrypt-miners/elphapex-dg1.png","alt":"Elphapex DG1"}$p29$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 30, 'stats',
       $p30${"rows":[{"label":"Производитель","value":"Elphapex"},{"label":"Год выпуска","value":"2024"},{"label":"Максимальный хешрейт","value":"14 400 МХ/с"},{"label":"Энергопотребление","value":"3 920 Вт"},{"label":"Энергоэффективность","value":"0,27 Вт на МХ"},{"label":"Алгоритм","value":"Scrypt"},{"label":"Количество монет, доступных для майнинга","value":"21"},{"label":"Размеры","value":"58 x 34 x 43 см"},{"label":"Масса","value":"18,3 кг"},{"label":"Уровень шума","value":"75 ДБ"}]}$p30$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 31, 'pros_cons',
       $p31${"pros":["Богатая линейка разнообразных моделей","Более низкая стоимость (при сравнении с конкурентами)","Отличная энергоэффективность"],"cons":["Молодой производитель","Возможные трудности с запчастями и ремонтом"]}$p31$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 32, 'heading',
       $p32${"level":2,"text":"7 место: Antminer L9"}$p32$::jsonb,
       'antminer-l9'
FROM articles a WHERE a.slug = 'rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 33, 'paragraph',
       $p33${"text":"Самый мощный и прибыльный асик на алгоритме Scrypt – ТОПовая модель Antminer L9 от компании Bitmain. Обладая впечатляющими характеристиками производительности и энергоэффективности, майнер отличается не только предельной доходностью, но и внушительной стоимостью – за L9 придется заплатить значительно больше, чем за аналогичные модели. Это вполне объяснимо, так как оборудование появилось относительно недавно и обладает на сегодняшний день образцовыми техническими параметрами.","html":"Самый мощный и прибыльный асик на алгоритме Scrypt – ТОПовая модель Antminer L9 от компании Bitmain. Обладая впечатляющими характеристиками производительности и энергоэффективности, майнер отличается не только предельной доходностью, но и внушительной стоимостью – за L9 придется заплатить значительно больше, чем за аналогичные модели. Это вполне объяснимо, так как оборудование появилось относительно недавно и обладает на сегодняшний день образцовыми техническими параметрами."}$p33$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 34, 'paragraph',
       $p34${"text":"Antminer L9 представлен в нескольких модификациях мощностью до 17 600 МХ/с при потреблении всего 3 260 Вт. Результатом использования новейших технологий в рамках алгоритма Scrypt от компании Bitmain стала впечатляющая энергоэффективность, которая пока выглядит недостижимой для конкурентов.","html":"Antminer L9 представлен в нескольких модификациях мощностью до 17 600 МХ/с при потреблении всего 3 260 Вт. Результатом использования новейших технологий в рамках алгоритма Scrypt от компании Bitmain стала впечатляющая энергоэффективность, которая пока выглядит недостижимой для конкурентов."}$p34$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 35, 'image',
       $p35${"src":"/images/articles/scrypt-miners/antminer-l9.png","alt":"Antminer L9"}$p35$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 36, 'stats',
       $p36${"rows":[{"label":"Производитель","value":"Bitmain"},{"label":"Год выпуска","value":"2024"},{"label":"Максимальный хешрейт","value":"17 600 МХ/с"},{"label":"Энергопотребление","value":"3 260 Вт"},{"label":"Энергоэффективность","value":"0,185 Вт на МХ"},{"label":"Алгоритм","value":"Scrypt"},{"label":"Количество монет, доступных для майнинга","value":"21"},{"label":"Размеры","value":"40 x 29 x 19,5 см"},{"label":"Масса","value":"14,1 кг"},{"label":"Уровень шума","value":"75 ДБ"}]}$p36$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 37, 'pros_cons',
       $p37${"pros":["Самый мощный асик на алгоритме Scrypt в мире","Предельная доходность","Впечатляющая энергоэффективность","Ведущий производитель"],"cons":["Высокая стоимость"]}$p37$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 38, 'heading',
       $p38${"level":2,"text":"6 место: Antminer L11"}$p38$::jsonb,
       'antminer-l11'
FROM articles a WHERE a.slug = 'rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 39, 'paragraph',
       $p39${"text":"Antminer L11 — это сбалансированная модель от Bitmain, ориентированная на добычу Litecoin, Dogecoin и объединенный майнинг еще нескольких альткоинов. Именно баланс характеристик делает модель особенно привлекательной: 20 GH/s хешрейта, поддержка объединенного майнинга и энергоэффективность 0.183 Вт/ГХ — надежный фундамент для стабильного заработка.","html":"Antminer L11 — это сбалансированная модель от Bitmain, ориентированная на добычу Litecoin, Dogecoin и объединенный майнинг еще нескольких альткоинов. Именно баланс характеристик делает модель особенно привлекательной: 20 GH/s хешрейта, поддержка объединенного майнинга и энергоэффективность 0.183 Вт/ГХ — надежный фундамент для стабильного заработка."}$p39$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 40, 'paragraph',
       $p40${"text":"L11 стал заметным шагом вперед для серии: устройство значительно производительнее предшественников и при этом остается простым, понятным и неприхотливым в эксплуатации. Классическое воздушное охлаждение, компактные размеры и дружелюбный интерфейс превращают Antminer L11 в идеального партнера для новичков или тех, кто строит небольшую, но продуманную ферму.","html":"L11 стал заметным шагом вперед для серии: устройство значительно производительнее предшественников и при этом остается простым, понятным и неприхотливым в эксплуатации. Классическое воздушное охлаждение, компактные размеры и дружелюбный интерфейс превращают Antminer L11 в идеального партнера для новичков или тех, кто строит небольшую, но продуманную ферму."}$p40$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 41, 'image',
       $p41${"src":"/images/articles/scrypt-miners/antminer-l11.png","alt":"Antminer L11"}$p41$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 42, 'stats',
       $p42${"rows":[{"label":"Производитель","value":"Bitmain"},{"label":"Год выпуска","value":"2025"},{"label":"Максимальный хешрейт","value":"20 000 МХ/с"},{"label":"Энергопотребление","value":"3 680 Вт"},{"label":"Энергоэффективность","value":"0,183 Вт на МХ"},{"label":"Алгоритм","value":"Scrypt"},{"label":"Количество монет, доступных для майнинга","value":"21"},{"label":"Уровень шума","value":"75 ДБ"}]}$p42$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 43, 'pros_cons',
       $p43${"pros":["Отличное соотношение мощности и потребления","Поддержка нескольких монет","Простое обслуживание","Привычный формат охлаждения"],"cons":["Не дотягивает до флагманов по прибыльности"]}$p43$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 44, 'heading',
       $p44${"level":2,"text":"5 место: VolcMiner D3"}$p44$::jsonb,
       'volcminer-d3'
FROM articles a WHERE a.slug = 'rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 45, 'paragraph',
       $p45${"text":"VolcMiner D3 появился на рынке словно вызов лидерам сегмента Scrypt. Он сразу привлек внимание тех, кто хочет добывать Litecoin и Dogecoin на высокой скорости, не уходя в иммерсионные системы и сложные инженерные решения. С хешрейтом 20 GH/s и потреблением 3580 Вт, VolcMiner D3 демонстрирует энергоэффективность 0.179 J/MH, что делает его одним из наиболее сбалансированных решений в классе.","html":"VolcMiner D3 появился на рынке словно вызов лидерам сегмента Scrypt. Он сразу привлек внимание тех, кто хочет добывать Litecoin и Dogecoin на высокой скорости, не уходя в иммерсионные системы и сложные инженерные решения. С хешрейтом 20 GH/s и потреблением 3580 Вт, VolcMiner D3 демонстрирует энергоэффективность 0.179 J/MH, что делает его одним из наиболее сбалансированных решений в классе."}$p45$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 46, 'paragraph',
       $p46${"text":"Корпус выполнен в индустриальном стиле — ничего лишнего, только функциональность. Два мощных вентилятора уверенно удерживают температуру в рабочем диапазоне от 5 до 45°C, а защита от экстремальной влажности (до 95%) делают устройство подходящим даже для нестандартных дата-центров.","html":"Корпус выполнен в индустриальном стиле — ничего лишнего, только функциональность. Два мощных вентилятора уверенно удерживают температуру в рабочем диапазоне от 5 до 45°C, а защита от экстремальной влажности (до 95%) делают устройство подходящим даже для нестандартных дата-центров."}$p46$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 47, 'paragraph',
       $p47${"text":"VolcMiner D3 не претендует на тишину — его 75 дБ слышны. Он создан для ферм, а не квартир. Но там, где есть пространство и питание — он превращается в стабильный и производительный инструмент добычи.","html":"VolcMiner D3 не претендует на тишину — его 75 дБ слышны. Он создан для ферм, а не квартир. Но там, где есть пространство и питание — он превращается в стабильный и производительный инструмент добычи."}$p47$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 48, 'image',
       $p48${"src":"/images/articles/scrypt-miners/volcminer-d3.png","alt":"VolcMiner D3"}$p48$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 49, 'stats',
       $p49${"rows":[{"label":"Производитель","value":"VolcMiner"},{"label":"Год выпуска","value":"2026"},{"label":"Максимальный хешрейт","value":"20 000 МХ/с"},{"label":"Энергопотребление","value":"3 580 Вт"},{"label":"Энергоэффективность","value":"0,179 Вт на МХ"},{"label":"Алгоритм","value":"Scrypt"},{"label":"Количество монет, доступных для майнинга","value":"21"},{"label":"Уровень шума","value":"75 ДБ"}]}$p49$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 50, 'pros_cons',
       $p50${"pros":["Высокая энергоэффективность","Стандартная архитектура","Стабильная работа при высокой нагрузке","Дешевле A-брендов"],"cons":["Не самый популярный производитель"]}$p50$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 51, 'heading',
       $p51${"level":2,"text":"4 место: ElphaPex DG2"}$p51$::jsonb,
       'elphapex-dg2'
FROM articles a WHERE a.slug = 'rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 52, 'paragraph',
       $p52${"text":"Компания ElphaPex — молодой игрок на рынке, но уже успевший зарекомендовать себя как производитель инновационного и качественного оборудования. DG2 подтверждает этот курс: сочетание стабильного хешрейта, энергоэффективности и надежной конструкции делает модель интересной альтернативой более известным брендам.","html":"Компания ElphaPex — молодой игрок на рынке, но уже успевший зарекомендовать себя как производитель инновационного и качественного оборудования. DG2 подтверждает этот курс: сочетание стабильного хешрейта, энергоэффективности и надежной конструкции делает модель интересной альтернативой более известным брендам."}$p52$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 53, 'paragraph',
       $p53${"text":"ElphaPex DG2 20G — это свежий и амбициозный продукт на рынке Scrypt-майнеров. С хешрейтом 20 GH/s и потреблением 3800 Вт устройство демонстрирует энергоэффективность 0.19 J/MH, что позволяет поддерживать стабильную доходность даже при колебаниях цен на Litecoin и Dogecoin.","html":"ElphaPex DG2 20G — это свежий и амбициозный продукт на рынке Scrypt-майнеров. С хешрейтом 20 GH/s и потреблением 3800 Вт устройство демонстрирует энергоэффективность 0.19 J/MH, что позволяет поддерживать стабильную доходность даже при колебаниях цен на Litecoin и Dogecoin."}$p53$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 54, 'paragraph',
       $p54${"text":"Модель выделяется надежностью и предсказуемостью работы. ElphaPex DG2 создана для майнеров, которым важна высокая производительность при умеренной стоимости эксплуатации. Классическое воздушное охлаждение, компактные размеры и уровень шума 75 дБ делают устройство удобным для ферм разного масштаба — от домашних до профессиональных.","html":"Модель выделяется надежностью и предсказуемостью работы. ElphaPex DG2 создана для майнеров, которым важна высокая производительность при умеренной стоимости эксплуатации. Классическое воздушное охлаждение, компактные размеры и уровень шума 75 дБ делают устройство удобным для ферм разного масштаба — от домашних до профессиональных."}$p54$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 55, 'image',
       $p55${"src":"/images/articles/scrypt-miners/elphapex-dg2.png","alt":"ElphaPex DG2"}$p55$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 56, 'stats',
       $p56${"rows":[{"label":"Производитель","value":"ElphaPex"},{"label":"Год выпуска","value":"2025"},{"label":"Максимальный хешрейт","value":"20 000 МХ/с"},{"label":"Энергопотребление","value":"3 800 Вт"},{"label":"Энергоэффективность","value":"0,19 Вт на МХ"},{"label":"Алгоритм","value":"Scrypt"},{"label":"Количество монет, доступных для майнинга","value":"21"},{"label":"Уровень шума","value":"75 ДБ"}]}$p56$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 57, 'pros_cons',
       $p57${"pros":["Высокая стабильность работы","Энергоэффективность","Надежность","Дешевле конкурентов от A-брендов"],"cons":["Не самый высокий хешрейт по сравнению с топовыми моделями","Принадлежность к бренду второй волны"]}$p57$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 58, 'heading',
       $p58${"level":2,"text":"3 место: Antminer L11 Pro"}$p58$::jsonb,
       'antminer-l11-pro'
FROM articles a WHERE a.slug = 'rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 59, 'paragraph',
       $p59${"text":"Antminer L11 Pro от Bitmain — это уверенный шаг вперед в сегменте Scrypt-майнинга. Асик демонстрирует хешрейт 21 GH/s и потребление 3680 Вт, обеспечивая отличное соотношение производительности и энергозатрат (0,183 Вт/ГХ). Модель сохраняет актуальность на несколько лет вперед, позволяя уверенно справляться с ростом сложности сети и поддерживать стабильную доходность.","html":"Antminer L11 Pro от Bitmain — это уверенный шаг вперед в сегменте Scrypt-майнинга. Асик демонстрирует хешрейт 21 GH/s и потребление 3680 Вт, обеспечивая отличное соотношение производительности и энергозатрат (0,183 Вт/ГХ). Модель сохраняет актуальность на несколько лет вперед, позволяя уверенно справляться с ростом сложности сети и поддерживать стабильную доходность."}$p59$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 60, 'paragraph',
       $p60${"text":"Главные преимущества L11 Pro — стабильность работы, простота эксплуатации и высокая эффективность. Устройство легко интегрируется в существующую инфраструктуру благодаря стандартному воздушному охлаждению и понятному интерфейсу. Это делает асик востребованным как у начинающих майнеров, так и у опытных операторов ферм.","html":"Главные преимущества L11 Pro — стабильность работы, простота эксплуатации и высокая эффективность. Устройство легко интегрируется в существующую инфраструктуру благодаря стандартному воздушному охлаждению и понятному интерфейсу. Это делает асик востребованным как у начинающих майнеров, так и у опытных операторов ферм."}$p60$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 61, 'image',
       $p61${"src":"/images/articles/scrypt-miners/antminer-l11-pro.png","alt":"Antminer L11 Pro"}$p61$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 62, 'stats',
       $p62${"rows":[{"label":"Производитель","value":"Bitmain"},{"label":"Год выпуска","value":"2025"},{"label":"Максимальный хешрейт","value":"21 000 МХ/с"},{"label":"Энергопотребление","value":"3 680 Вт"},{"label":"Энергоэффективность","value":"0,183 Вт на МХ"},{"label":"Алгоритм","value":"Scrypt"},{"label":"Количество монет, доступных для майнинга","value":"21"},{"label":"Уровень шума","value":"75 ДБ"}]}$p62$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 63, 'pros_cons',
       $p63${"pros":["Высокая производительность (одна из ТОПовых среди асиков на воздушном охлаждении)","Энергоэффективность","Надежность","Простое обслуживание"],"cons":["Высокая стоимость"]}$p63$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 64, 'heading',
       $p64${"level":2,"text":"2 место: Antminer U2L9H"}$p64$::jsonb,
       'antminer-u2l9h'
FROM articles a WHERE a.slug = 'rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 65, 'paragraph',
       $p65${"text":"Главная особенность модели — водяное охлаждение, позволяющее поддерживать стабильную работу при высоких нагрузках и снижать износ оборудования. Уровень шума при этом составляет всего 50 дБ, что по меркам Scrypt-майнеров является очень комфортным показателем. С хешрейтом 27 GH/s и потреблением 5670 Вт, асик обеспечивает оптимальный баланс мощности и затрат на электроэнергию, что делает его привлекательным для крупных ферм и профессиональных майнеров.","html":"Главная особенность модели — водяное охлаждение, позволяющее поддерживать стабильную работу при высоких нагрузках и снижать износ оборудования. Уровень шума при этом составляет всего 50 дБ, что по меркам Scrypt-майнеров является очень комфортным показателем. С хешрейтом 27 GH/s и потреблением 5670 Вт, асик обеспечивает оптимальный баланс мощности и затрат на электроэнергию, что делает его привлекательным для крупных ферм и профессиональных майнеров."}$p65$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 66, 'paragraph',
       $p66${"text":"U2L9H создан для тех, кто ищет надежность, долгосрочную актуальность и предсказуемую доходность. Компактный форм-фактор и продуманная конструкция позволяют легко интегрировать устройство в существующую инфраструктуру, а высокая эффективность гарантирует быстрое возвращение вложений.","html":"U2L9H создан для тех, кто ищет надежность, долгосрочную актуальность и предсказуемую доходность. Компактный форм-фактор и продуманная конструкция позволяют легко интегрировать устройство в существующую инфраструктуру, а высокая эффективность гарантирует быстрое возвращение вложений."}$p66$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 67, 'image',
       $p67${"src":"/images/articles/scrypt-miners/antminer-u2l9h.png","alt":"Antminer U2L9H"}$p67$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 68, 'stats',
       $p68${"rows":[{"label":"Производитель","value":"Bitmain"},{"label":"Год выпуска","value":"2025"},{"label":"Максимальный хешрейт","value":"27 000 МХ/с"},{"label":"Энергопотребление","value":"5 670 Вт"},{"label":"Энергоэффективность","value":"0,21 Вт на МХ"},{"label":"Алгоритм","value":"Scrypt"},{"label":"Количество монет, доступных для майнинга","value":"21"},{"label":"Уровень шума","value":"50 ДБ"}]}$p68$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 69, 'pros_cons',
       $p69${"pros":["Высокая производительность","Низкий уровень шума","Энергоэффективность"],"cons":["Требует водяной инфраструктуры"]}$p69$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 70, 'heading',
       $p70${"level":2,"text":"1 место: Antminer L11 Hyd 6U"}$p70$::jsonb,
       'antminer-l11-hyd-6u'
FROM articles a WHERE a.slug = 'rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 71, 'paragraph',
       $p71${"text":"Antminer L11 Hydro 6U от Bitmain — это настоящий рекордсмен в мире Scrypt. Модель демонстрирует хешрейт 33 GH/s при потреблении 5676 Вт, сочетая высокую производительность с продуманной энергоэффективностью. L11 Hydro 6U создан для тех, кто строит промышленные фермы с упором на максимальную производительность, надежность и долгосрочную окупаемость.","html":"Antminer L11 Hydro 6U от Bitmain — это настоящий рекордсмен в мире Scrypt. Модель демонстрирует хешрейт 33 GH/s при потреблении 5676 Вт, сочетая высокую производительность с продуманной энергоэффективностью. L11 Hydro 6U создан для тех, кто строит промышленные фермы с упором на максимальную производительность, надежность и долгосрочную окупаемость."}$p71$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 72, 'paragraph',
       $p72${"text":"Главная особенность L11 Hydro 6U — водяное охлаждение, которое обеспечивает стабильную работу при высоких нагрузках, минимизирует износ компонентов и снижает риск перегрева. Уровень шума всего 50 дБ, что для такого класса оборудования является редким преимуществом. Безоговорочный лидер нашего рейтинга.","html":"Главная особенность L11 Hydro 6U — водяное охлаждение, которое обеспечивает стабильную работу при высоких нагрузках, минимизирует износ компонентов и снижает риск перегрева. Уровень шума всего 50 дБ, что для такого класса оборудования является редким преимуществом. Безоговорочный лидер нашего рейтинга."}$p72$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 73, 'image',
       $p73${"src":"/images/articles/scrypt-miners/antminer-l11-hyd-6u.png","alt":"Antminer L11 Hydro 6U"}$p73$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 74, 'stats',
       $p74${"rows":[{"label":"Производитель","value":"Bitmain"},{"label":"Год выпуска","value":"2025"},{"label":"Максимальный хешрейт","value":"33 000 МХ/с"},{"label":"Энергопотребление","value":"5 670 Вт"},{"label":"Энергоэффективность","value":"0,17 Вт на МХ"},{"label":"Алгоритм","value":"Scrypt"},{"label":"Количество монет, доступных для майнинга","value":"21"},{"label":"Уровень шума","value":"50 ДБ"}]}$p74$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 75, 'pros_cons',
       $p75${"pros":["Высочайшая мощность","Низкий уровень шума","Актуальность на годы вперед"],"cons":["Требует гидросистемы","Стоимость"]}$p75$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 76, 'heading',
       $p76${"level":2,"text":"Выводы"}$p76$::jsonb,
       'vyvody'
FROM articles a WHERE a.slug = 'rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 77, 'paragraph',
       $p77${"text":"В рейтинге лучших асиков на алгоритме Scrypt оказались модели Antminer, Elphapex и VolcMiner. При этом можно выбрать как домашний формат добычи, так и классический – промышленный, где лидерство удерживает Antminer L11 Hydro 6U. Эта модель значительно опережает конкурентов по мощности, энергоэффективности и долгосрочной актуальности.","html":"В рейтинге лучших асиков на алгоритме Scrypt оказались модели Antminer, Elphapex и VolcMiner. При этом можно выбрать как домашний формат добычи, так и классический – промышленный, где лидерство удерживает Antminer L11 Hydro 6U. Эта модель значительно опережает конкурентов по мощности, энергоэффективности и долгосрочной актуальности."}$p77$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge';

-- =====================================================================
-- 030_article_altcoin_asics.sql
-- =====================================================================

-- Лучшие асики для майнинга альткоинов 2026: ТОП-10 майнеров не для BTC

INSERT INTO articles (
    slug, title, title_subtitle, excerpt, content, topic_id,
    reading_time_min, reading_minutes, published_at, view_count,
    display_type, sort_order, is_published, uses_blocks,
    image_url, image_alt
) VALUES (
    'luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc',
    'Лучшие асики для майнинга альткоинов 2026',
    'ТОП-10 майнеров не для BTC',
    $excerpt$ТОП-10 асиков для майнинга альткоинов в 2026 году: от Iceriver AE3 до Antminer L11 Hydro 6U — не для BTC.$excerpt$,
    $content$Введение

Чаще всего майнеры делятся на два типа: одни предпочитают добывать Bitcoin, другие выбирают альткоины.

Выводы

Альткоины – это самостоятельные криптовалютные проекты с разными технологиями и целями.$content$,
    'mining',
    15,
    15,
    '2024-10-29',
    1014,
    'list',
    40,
    TRUE,
    TRUE,
    '/images/articles/altcoin-asics-2026/intro-engineer.png',
    'Инженер и оборудование для майнинга альткоинов'
)
ON CONFLICT (slug) DO UPDATE SET
    title = EXCLUDED.title,
    title_subtitle = EXCLUDED.title_subtitle,
    excerpt = EXCLUDED.excerpt,
    content = EXCLUDED.content,
    reading_time_min = EXCLUDED.reading_time_min,
    reading_minutes = EXCLUDED.reading_minutes,
    published_at = EXCLUDED.published_at,
    view_count = EXCLUDED.view_count,
    uses_blocks = TRUE,
    image_url = EXCLUDED.image_url,
    image_alt = EXCLUDED.image_alt,
    is_published = TRUE;

DELETE FROM article_blocks
WHERE article_id = (SELECT id FROM articles WHERE slug = 'luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc');

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 1, 'heading',
       $p1${"level":2,"text":"Введение"}$p1$::jsonb,
       'vvedenie'
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 2, 'paragraph',
       $p2${"text":"Чаще всего майнеры делятся на два типа: одни предпочитают добывать Bitcoin, считая данный актив самым надежным и устойчивым в мире, другие выбирают альткоины, доходность которых может быть значительно выше. Уделим внимание второй группе пользователей, проанализировав ТОП-10 асиков не для BTC. Подготовили полный обзор лучших майнеров для добычи альткоинов в порядке возрастания качества, надежности и фундаментальности получаемых токенов.","html":"Чаще всего майнеры делятся на два типа: одни предпочитают добывать Bitcoin, считая данный актив самым надежным и устойчивым в мире, другие выбирают альткоины, доходность которых может быть значительно выше. Уделим внимание второй группе пользователей, проанализировав ТОП-10 асиков не для BTC. Подготовили полный обзор лучших майнеров для добычи альткоинов в порядке возрастания качества, надежности и фундаментальности получаемых токенов."}$p2$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 3, 'heading',
       $p3${"level":2,"text":"Майнинг альткоинов – что необходимо знать?"}$p3$::jsonb,
       'majning-altkoinov'
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 4, 'paragraph',
       $p4${"text":"Альткоины (от англ. alternative coins) – это все криптовалюты, помимо Биткоина. С момента появления BTC в 2009 году было запущено множество других цифровых активов, каждый из которых предлагает собственные технологические решения, модели использования и механизмы функционирования. Эфириум, Солана и даже Трампкоин – все это примеры так называемых «альтов», некоторые из которых можно добывать при помощи асиков.","html":"Альткоины (от англ. alternative coins) – это все криптовалюты, помимо Биткоина. С момента появления BTC в 2009 году было запущено множество других цифровых активов, каждый из которых предлагает собственные технологические решения, модели использования и механизмы функционирования. Эфириум, Солана и даже Трампкоин – все это примеры так называемых «альтов», некоторые из которых можно добывать при помощи асиков."}$p4$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 5, 'paragraph',
       $p5${"text":"Майнинг альткоинов представляет собой процесс добычи криптовалют, альтернативных Биткоину. Сюда входят такие монеты, как Ethereum (до перехода на алгоритм Proof-of-Stake), Litecoin, Monero, Zcash, Kaspa и множество других. Хотя Биткоин по-прежнему остается самой известной криптовалютой, интерес к альткоинам только растет. И во многом благодаря возможностям майнинга, а также предлагаемой доходности.","html":"Майнинг альткоинов представляет собой процесс добычи криптовалют, альтернативных Биткоину. Сюда входят такие монеты, как Ethereum (до перехода на алгоритм Proof-of-Stake), Litecoin, Monero, Zcash, Kaspa и множество других. Хотя Биткоин по-прежнему остается самой известной криптовалютой, интерес к альткоинам только растет. И во многом благодаря возможностям майнинга, а также предлагаемой доходности."}$p5$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 6, 'image',
       $p6${"src":"/images/articles/altcoin-asics-2026/doge-altcoins.png","alt":"Dogecoin и другие альткоины"}$p6$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 7, 'paragraph',
       $p7${"text":"В случае альткоинов майнинг может происходить на разных алгоритмах (не только SHA-256, как у Биткоина), например:","html":"В случае альткоинов майнинг может происходить на разных алгоритмах (не только SHA-256, как у Биткоина), например:"}$p7$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 8, 'list',
       $p8${"ordered":false,"items":["Scrypt – Litecoin и Dogecoin;","RandomX (Monero);","Equihash (Zcash);","Ethash (у Ethereum до перехода на Proof-of-Stake);","kHeavyHash (Kaspa)."]}$p8$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 9, 'paragraph',
       $p9${"text":"В зависимости от алгоритма можно использовать ASIC-устройства или обычные видеокарты (GPU).","html":"В зависимости от алгоритма можно использовать ASIC-устройства или обычные видеокарты (GPU)."}$p9$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 10, 'paragraph',
       $p10${"text":"Преимущества майнинга альткоинов:","html":"Преимущества майнинга альткоинов:"}$p10$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 11, 'list',
       $p11${"ordered":false,"items":["Низкий порог входа. Некоторые альткоины можно добывать даже на домашнем компьютере, не говоря уже о существовании десятков моделей асиков для «альтов»;","Меньшая конкуренция. По сравнению с Биткоином, у многих альткоинов значительно меньше участников сети, что делает добычу более доступной;","Возможность роста. Некоторые альткоины могут резко вырасти в цене, принося прибыль тем, кто начал их майнить заранее;","Разнообразие алгоритмов. Это позволяет подбирать оптимальную валюту под доступное оборудование."]}$p11$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 12, 'paragraph',
       $p12${"text":"Недостатки тоже есть, и о них следует помнить:","html":"Недостатки тоже есть, и о них следует помнить:"}$p12$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 13, 'list',
       $p13${"ordered":false,"items":["Высокая волатильность. Цена на альткоины может резко меняться, и не всегда в положительную сторону;","Риски «скама»: некоторые проекты оказываются ненадежными или вовсе исчезают также быстро, как и появляются;","Низкая ликвидность. Не все альткоины можно легко обменять на фиатные деньги или другие криптовалюты;","Сложность выбора. Среди тысяч альткоинов сложно выбрать перспективные и действительно надежные."]}$p13$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 14, 'paragraph',
       $p14${"text":"Примеры популярных альткоинов для майнинга, которые можно добывать с помощью современных асиков:","html":"Примеры популярных альткоинов для майнинга, которые можно добывать с помощью современных асиков:"}$p14$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 15, 'list',
       $p15${"ordered":false,"items":["Litecoin (LTC): работает на алгоритме Scrypt. Популярен среди майнеров благодаря стабильности и поддержке;","Dogecoin (DOGE): добывается вместе с LTC на алгоритме Scrypt в формате объединенного майнинга;","Kaspa (KAS): относительно новый перспективный проект с высокой скоростью обработки блоков, активно обсуждается в сообществе и привлекает внимание майнеров;","Ethereum Classic (ETC) — оригинальная версия блокчейна Ethereum, которая осталась неизменной после перехода Эфира на PoS. Добывается на асиках, в том числе для домашнего использования."]}$p15$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 16, 'paragraph',
       $p16${"text":"Примечательно, что в случае с майнингом альткоинов актуальны так называемые майнеры для домашнего использования.","html":"Примечательно, что в случае с майнингом альткоинов актуальны так называемые майнеры для домашнего использования."}$p16$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 17, 'paragraph',
       $p17${"text":"Это тихие и экономные с точки зрения энергопотребления устройства, практикующие «гражданский» принцип работы с блокчейном. И это еще одно важное преимущество, так как, например, техника под добычу Биткоина сегодня актуальна лишь в промышленных форматах.","html":"Это тихие и экономные с точки зрения энергопотребления устройства, практикующие «гражданский» принцип работы с блокчейном. И это еще одно важное преимущество, так как, например, техника под добычу Биткоина сегодня актуальна лишь в промышленных форматах."}$p17$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 18, 'image',
       $p18${"src":"/images/articles/altcoin-asics-2026/intro-engineer.png","alt":"Работа с оборудованием для майнинга альткоинов"}$p18$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 19, 'heading',
       $p19${"level":2,"text":"10 место: Iceriver AE3"}$p19$::jsonb,
       'iceriver-ae3'
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 20, 'paragraph',
       $p20${"text":"Iceriver AE3 — мощный ASIC нового поколения, созданный специально для добычи ALEO. Устройство ориентировано на стабильную и долгую работу, поэтому производитель сделал упор на надежность, продуманное охлаждение и энергоэффективность. Майнер хорошо переносит круглосуточные нагрузки и поддерживает устойчивую работу сети, что особенно важно для алгоритма zkSNARK, требовательного к вычислительным ресурсам.","html":"Iceriver AE3 — мощный ASIC нового поколения, созданный специально для добычи ALEO. Устройство ориентировано на стабильную и долгую работу, поэтому производитель сделал упор на надежность, продуманное охлаждение и энергоэффективность. Майнер хорошо переносит круглосуточные нагрузки и поддерживает устойчивую работу сети, что особенно важно для алгоритма zkSNARK, требовательного к вычислительным ресурсам."}$p20$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 21, 'paragraph',
       $p21${"text":"Благодаря встроенному блоку питания и относительно компактному корпусу AE3 удобно устанавливать как в небольших домашних пространствах, так и в профессиональных фермах. Он не требует сложной подготовки — подключается быстро и работает стабильно. Уровень шума остается типичным для устройств такого класса, поэтому чаще всего AE3 размещают в отдельных помещениях или стойках.","html":"Благодаря встроенному блоку питания и относительно компактному корпусу AE3 удобно устанавливать как в небольших домашних пространствах, так и в профессиональных фермах. Он не требует сложной подготовки — подключается быстро и работает стабильно. Уровень шума остается типичным для устройств такого класса, поэтому чаще всего AE3 размещают в отдельных помещениях или стойках."}$p21$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 22, 'paragraph',
       $p22${"text":"Главное преимущество устройства — высокая производительность, позволяющая получать стабильный доход на перспективной сети Aleo. Майнер рассчитан на пользователей, которым важно сочетание мощности, энергоэффективности и надежности без лишних сложностей в эксплуатации.","html":"Главное преимущество устройства — высокая производительность, позволяющая получать стабильный доход на перспективной сети Aleo. Майнер рассчитан на пользователей, которым важно сочетание мощности, энергоэффективности и надежности без лишних сложностей в эксплуатации."}$p22$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 23, 'image',
       $p23${"src":"/images/articles/altcoin-asics-2026/iceriver-ae3.png","alt":"Iceriver AE3"}$p23$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 24, 'stats',
       $p24${"rows":[{"label":"Производитель","value":"ICERIVER"},{"label":"Модель","value":"Iceriver AE3"},{"label":"Алгоритм","value":"zkSNARK"},{"label":"Хешрейт","value":"2000 Mh/s"},{"label":"Потребление","value":"3400 Вт"},{"label":"Монета","value":"ALEO"},{"label":"Уровень шума","value":"75 дБ"},{"label":"Размеры","value":"370 × 195 × 290 мм"},{"label":"Вес","value":"15 кг"},{"label":"Год выпуска","value":"2025"}]}$p24$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 25, 'pros_cons',
       $p25${"pros":["Высокая производительность, подходящая для долгосрочного майнинга ALEO","Простая установка и быстрый запуск","Подходит как для домашних условий (при наличии отдельного помещения или шумбокса), так и для ферм","Надежная работа под круглосуточными нагрузками","Современная модель 2025 года с актуальной архитектурой"],"cons":["Уровень шума выше комфортного для размещения рядом с жилой зоной","Узкая специализация — устройство подходит только для добычи ALEO"]}$p25$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 26, 'heading',
       $p26${"level":2,"text":"9 место: Jasminer X44-P"}$p26$::jsonb,
       'jasminer-x44-p'
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 27, 'paragraph',
       $p27${"text":"Jasminer X44-P — обновленная модель семейства Ethash/Etchash-майнеров, созданная для стабильной и предсказуемой добычи ETC. Устройство делает ставку на энергоэффективность и долговечность: благодаря фирменным 3D-чипам Jasminer обеспечивает высокую пропускную способность при сравнительно низком энергопотреблении.","html":"Jasminer X44-P — обновленная модель семейства Ethash/Etchash-майнеров, созданная для стабильной и предсказуемой добычи ETC. Устройство делает ставку на энергоэффективность и долговечность: благодаря фирменным 3D-чипам Jasminer обеспечивает высокую пропускную способность при сравнительно низком энергопотреблении."}$p27$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 28, 'paragraph',
       $p28${"text":"Майнер подойдёт как для профессиональных ферм, так и для тех, кто ищет надежное оборудование с минимальными рисками по окупаемости. X44-P работает стабильно даже при круглосуточной нагрузке, не требуя сложной настройки — достаточно подключить устройство, указать пул и начать добычу.","html":"Майнер подойдёт как для профессиональных ферм, так и для тех, кто ищет надежное оборудование с минимальными рисками по окупаемости. X44-P работает стабильно даже при круглосуточной нагрузке, не требуя сложной настройки — достаточно подключить устройство, указать пул и начать добычу."}$p28$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 29, 'paragraph',
       $p29${"text":"Из-за традиционного уровня шума модель лучше всего размещать в отдельном помещении, серверной стойке или гаражной ферме. Благодаря энергоэффективности и качественной архитектуре X44-P способен приносить доход в долгосрочной перспективе, даже в условиях изменения сложности сети.","html":"Из-за традиционного уровня шума модель лучше всего размещать в отдельном помещении, серверной стойке или гаражной ферме. Благодаря энергоэффективности и качественной архитектуре X44-P способен приносить доход в долгосрочной перспективе, даже в условиях изменения сложности сети."}$p29$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 30, 'image',
       $p30${"src":"/images/articles/altcoin-asics-2026/jasminer-x44-p.png","alt":"Jasminer X44-P"}$p30$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 31, 'stats',
       $p31${"rows":[{"label":"Производитель","value":"Jasminer"},{"label":"Модель","value":"Jasminer X44-P"},{"label":"Алгоритм","value":"Etchash"},{"label":"Хешрейт","value":"2340 MH/s (2.34 GH/s)"},{"label":"Потребление","value":"2550 Вт"},{"label":"Монета","value":"ETC"},{"label":"Уровень шума","value":"70 дБ"},{"label":"Размеры","value":"212 × 300 × 374 мм"},{"label":"Вес","value":"14.5 кг"},{"label":"Год выпуска","value":"2025"}]}$p31$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 32, 'pros_cons',
       $p32${"pros":["Высокая энергоэффективность благодаря фирменной архитектуре Jasminer","Стабильная прогнозируемая доходность на Etchash","Простота запуска и обслуживания","Современная модель с актуальными характеристиками","Подходит для 24/7 работы без потери производительности"],"cons":["Достаточно высокий уровень шума — нежелательно размещать рядом с жилыми комнатами","Работает только с Etchash, отсутствует универсальность","Цена выше по сравнению с менее мощными моделями предыдущих поколений"]}$p32$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 33, 'heading',
       $p33${"level":2,"text":"8 место: Antminer Z15 Pro"}$p33$::jsonb,
       'antminer-z15-pro'
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 34, 'paragraph',
       $p34${"text":"Antminer Z15 Pro — обновленная версия одного из самых популярных ASIC-майнеров для алгоритма Equihash. Устройство предназначено для добычи Zcash и других монет на этом алгоритме, сочетая высокую вычислительную мощность с грамотной энергоэффективностью.","html":"Antminer Z15 Pro — обновленная версия одного из самых популярных ASIC-майнеров для алгоритма Equihash. Устройство предназначено для добычи Zcash и других монет на этом алгоритме, сочетая высокую вычислительную мощность с грамотной энергоэффективностью."}$p34$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 35, 'paragraph',
       $p35${"text":"Модель отлично подходит тем, кто хочет стабильно добывать ZEC без сложной настройки: подключение и запуск занимают минимальное время, а майнер показывает устойчивую производительность даже при круглосуточной работе.","html":"Модель отлично подходит тем, кто хочет стабильно добывать ZEC без сложной настройки: подключение и запуск занимают минимальное время, а майнер показывает устойчивую производительность даже при круглосуточной работе."}$p35$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 36, 'paragraph',
       $p36${"text":"Несмотря на компактный корпус и небольшой вес, Z15 Pro выдает впечатляющий хешрейт при относительно умеренном энергопотреблении. Благодаря проверенной архитектуре Bitmain модель остается востребованной как среди новичков, так и среди опытных майнеров, ищущих надежное оборудование для Equihash.","html":"Несмотря на компактный корпус и небольшой вес, Z15 Pro выдает впечатляющий хешрейт при относительно умеренном энергопотреблении. Благодаря проверенной архитектуре Bitmain модель остается востребованной как среди новичков, так и среди опытных майнеров, ищущих надежное оборудование для Equihash."}$p36$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 37, 'image',
       $p37${"src":"/images/articles/altcoin-asics-2026/antminer-z15-pro.png","alt":"Antminer Z15 Pro"}$p37$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 38, 'stats',
       $p38${"rows":[{"label":"Производитель","value":"Bitmain Antminer"},{"label":"Модель","value":"Antminer Z15 Pro"},{"label":"Алгоритм","value":"Equihash"},{"label":"Хешрейт","value":"860 Kh/s"},{"label":"Потребление","value":"2600 Вт"},{"label":"Монета","value":"ZEC"},{"label":"Уровень шума","value":"70 дБ"},{"label":"Размеры","value":"132.5 × 245 × 290 мм"},{"label":"Вес","value":"5.9 кг"},{"label":"Год выпуска","value":"2023"}]}$p38$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 39, 'pros_cons',
       $p39${"pros":["Высокая эффективность на алгоритме Equihash","Компактные размеры и небольшой вес","Простота установки и запуска","Подходит для круглосуточной стабильной работы","Один из самых мощных надежных майнеров для Zcash в своем классе"],"cons":["Средний уровень шума — для жилых комнат не подойдет","Энергоэффективность ниже по сравнению с более современными линейками ASIC"]}$p39$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 40, 'heading',
       $p40${"level":2,"text":"7 место: Antminer L9"}$p40$::jsonb,
       'antminer-l9'
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 41, 'paragraph',
       $p41${"text":"Безальтернативным лидером нашего рейтинга можно по праву считать Antminer L9 от компании Bitmain. Прежде всего, это майнер на популярном алгоритме Scrypt, который благодаря появлению Bellscoin отличается повышенной доходностью. Кроме того, принадлежность Bitmain является гарантией высокого качества и надежности техники: лидер рынка является отличным примером грамотной работы с клиентами.","html":"Безальтернативным лидером нашего рейтинга можно по праву считать Antminer L9 от компании Bitmain. Прежде всего, это майнер на популярном алгоритме Scrypt, который благодаря появлению Bellscoin отличается повышенной доходностью. Кроме того, принадлежность Bitmain является гарантией высокого качества и надежности техники: лидер рынка является отличным примером грамотной работы с клиентами."}$p41$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 42, 'paragraph',
       $p42${"text":"Несмотря на относительно высокую стоимость, Antminer L9 на 16 GH/с уже успел завоевать звание бестселлера. Это качественное решение в рамках проверенного алгоритма, который будет актуален еще несколько лет. А максимальная производительность обеспечивает задел актуальности на несколько циклов, что и привлекает многих покупателей со всего мира.","html":"Несмотря на относительно высокую стоимость, Antminer L9 на 16 GH/с уже успел завоевать звание бестселлера. Это качественное решение в рамках проверенного алгоритма, который будет актуален еще несколько лет. А максимальная производительность обеспечивает задел актуальности на несколько циклов, что и привлекает многих покупателей со всего мира."}$p42$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 43, 'image',
       $p43${"src":"/images/articles/altcoin-asics-2026/antminer-l9.png","alt":"Antminer L9"}$p43$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 44, 'stats',
       $p44${"rows":[{"label":"Производитель","value":"Bitmain"},{"label":"Год выпуска","value":"2024"},{"label":"Хешрейт","value":"16 GH/с"},{"label":"Энергопотребление","value":"3 360 Вт"},{"label":"Энергоэффективность","value":"210 Вт на GH"},{"label":"Алгоритм","value":"Scrypt"},{"label":"Количество монет, доступных для майнинга","value":"22"},{"label":"Уровень шума","value":"76 Дб"}]}$p44$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 45, 'pros_cons',
       $p45${"pros":["Один из самых надежных алгоритмов в рамках альткоинов","Объединенный майнинг LTC+DOGE+BEL","Множество альтернативных вариантов майнинга","Проверенный производитель"],"cons":["Высокая стоимость"]}$p45$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 46, 'heading',
       $p46${"level":2,"text":"6 место: Antminer L11"}$p46$::jsonb,
       'antminer-l11'
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 47, 'paragraph',
       $p47${"text":"Antminer L11 — топовая модель семейства Scrypt-майнеров, созданная Bitmain для максимальной производительности при добыче Litecoin, Dogecoin и еще шести монет на этом алгоритме. С хешрейтом 20 GH/s устройство стало логичным развитием линейки, обеспечив примерно двойной прирост мощности по сравнению с предыдущими поколениями, сохранив при этом стабильность и высокую энергоэффективность.","html":"Antminer L11 — топовая модель семейства Scrypt-майнеров, созданная Bitmain для максимальной производительности при добыче Litecoin, Dogecoin и еще шести монет на этом алгоритме. С хешрейтом 20 GH/s устройство стало логичным развитием линейки, обеспечив примерно двойной прирост мощности по сравнению с предыдущими поколениями, сохранив при этом стабильность и высокую энергоэффективность."}$p47$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 48, 'paragraph',
       $p48${"text":"Майнер отличается сбалансированным энергопотреблением, продуманной конструкцией и надежной системой охлаждения, что делает его подходящим как для частных ферм, так и для промышленного использования. Antminer L11 особенно востребован среди майнеров, которые хотят масштабировать добычу Scrypt-монет и получить максимальную отдачу в условиях растущей сложности сети.","html":"Майнер отличается сбалансированным энергопотреблением, продуманной конструкцией и надежной системой охлаждения, что делает его подходящим как для частных ферм, так и для промышленного использования. Antminer L11 особенно востребован среди майнеров, которые хотят масштабировать добычу Scrypt-монет и получить максимальную отдачу в условиях растущей сложности сети."}$p48$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 49, 'image',
       $p49${"src":"/images/articles/altcoin-asics-2026/antminer-l11.png","alt":"Antminer L11"}$p49$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 50, 'stats',
       $p50${"rows":[{"label":"Производитель","value":"Bitmain Antminer"},{"label":"Модель","value":"Antminer L11"},{"label":"Алгоритм","value":"Scrypt"},{"label":"Хешрейт","value":"20000 Mh/s"},{"label":"Потребление","value":"3680 Вт"},{"label":"Монеты","value":"LTC, DOGE"},{"label":"Уровень шума","value":"76 дБ"},{"label":"Размеры","value":"400 × 195 × 290 мм"},{"label":"Вес","value":"14.2 кг"},{"label":"Год выпуска","value":"2025"}]}$p50$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 51, 'pros_cons',
       $p51${"pros":["Увеличенная мощность — значительно выше по сравнению с предыдущими аналогами","Поддержка добычи восьми Scrypt-монет одновременно","Высокая энергоэффективность для своего хешрейта","Надежная и стабильная работа при круглосуточной нагрузке","Оптимален для масштабируемых ферм и больших пулов"],"cons":["Высокий уровень шума — требуется отдельное помещение, шумбокс или майнинг-отель","Значительное энергопотребление в сравнении с моделями среднего класса","Высокая стоимость относительно предыдущих поколений"]}$p51$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 52, 'heading',
       $p52${"level":2,"text":"5 место: VolcMiner D3"}$p52$::jsonb,
       'volcminer-d3'
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 53, 'paragraph',
       $p53${"text":"VolcMiner D3 — это современный промышленный ASIC на алгоритме Scrypt, созданный специально для стабильной высокопроизводительной добычи Litecoin, Dogecoin и других совместимых монет. Устройство развивает хешрейт 20 GH/s при потреблении 3580 Вт, сохраняя отличную энергоэффективность — 0.179 J/Mh. Такой баланс делает D3 привлекательным решением для тех, кто стремится получить максимальную отдачу при работе с Scrypt-монетами.","html":"VolcMiner D3 — это современный промышленный ASIC на алгоритме Scrypt, созданный специально для стабильной высокопроизводительной добычи Litecoin, Dogecoin и других совместимых монет. Устройство развивает хешрейт 20 GH/s при потреблении 3580 Вт, сохраняя отличную энергоэффективность — 0.179 J/Mh. Такой баланс делает D3 привлекательным решением для тех, кто стремится получить максимальную отдачу при работе с Scrypt-монетами."}$p53$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 54, 'paragraph',
       $p54${"text":"Майнер выполнен в прочном металлическом корпусе с двумя вентиляторами, рассчитанными на работу в условиях круглосуточной нагрузки. Поддержка температуры от 5 до 45 °C и устойчивость к повышенной влажности позволяют безопасно эксплуатировать VolcMiner D3 в майнинг-отелях и профессиональных фермах. Модель ориентирована на крупные установки, где важны надежность, производительность и стабильность.","html":"Майнер выполнен в прочном металлическом корпусе с двумя вентиляторами, рассчитанными на работу в условиях круглосуточной нагрузки. Поддержка температуры от 5 до 45 °C и устойчивость к повышенной влажности позволяют безопасно эксплуатировать VolcMiner D3 в майнинг-отелях и профессиональных фермах. Модель ориентирована на крупные установки, где важны надежность, производительность и стабильность."}$p54$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 55, 'image',
       $p55${"src":"/images/articles/altcoin-asics-2026/volcminer-d3.png","alt":"VolcMiner D3"}$p55$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 56, 'stats',
       $p56${"rows":[{"label":"Производитель","value":"VolcMiner"},{"label":"Модель","value":"VolcMiner D3"},{"label":"Алгоритм","value":"Scrypt"},{"label":"Хешрейт","value":"20 GH/s"},{"label":"Потребление","value":"3580 Вт"},{"label":"Монеты","value":"LTC, DOGE"},{"label":"Уровень шума","value":"75 дБ"},{"label":"Размеры","value":"384 × 217 × 316 мм"},{"label":"Вес","value":"22 кг"},{"label":"Год выпуска","value":"2026"}]}$p56$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 57, 'pros_cons',
       $p57${"pros":["Высокий хешрейт при умеренном энергопотреблении","Прочная промышленная конструкция, рассчитанная на круглосуточную работу","Энергоэффективность выше, чем у многих конкурентов на Scrypt","Стабильная работа в широком диапазоне температур и влажности","Подходит для профессиональных майнинг-ферм и крупных размещений"],"cons":["Модель рассчитана на промышленные помещения: невысокая пригодность для домашнего майнинга из-за шума и тепловыделения","Производитель еще не имеет такой истории надежности, как лидеры рынка"]}$p57$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 58, 'heading',
       $p58${"level":2,"text":"4 место: ElphaPex DG2"}$p58$::jsonb,
       'elphapex-dg2'
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 59, 'paragraph',
       $p59${"text":"ElphaPex DG2 — это модель нового поколения на алгоритме Scrypt, созданная для добычи Litecoin, Dogecoin и других совместимых монет. Модель рассчитана на тех, кто ищет максимальную доходность и стабильность в условиях растущей сложности сети. С мощностью 20 GH/s и энергопотреблением 3800 Вт DG2 обеспечивает энергоэффективность 0,19–0,22 J/MH — показатель, который позволяет уверенно конкурировать с лидерами рынка.","html":"ElphaPex DG2 — это модель нового поколения на алгоритме Scrypt, созданная для добычи Litecoin, Dogecoin и других совместимых монет. Модель рассчитана на тех, кто ищет максимальную доходность и стабильность в условиях растущей сложности сети. С мощностью 20 GH/s и энергопотреблением 3800 Вт DG2 обеспечивает энергоэффективность 0,19–0,22 J/MH — показатель, который позволяет уверенно конкурировать с лидерами рынка."}$p59$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 60, 'paragraph',
       $p60${"text":"Асик ориентирован на профессиональное использование: надежная конструкция, продуманная система охлаждения и способность работать под постоянными нагрузками делают его подходящим для крупных майнинг-ферм. Несмотря на то что бренд Elphapex молод, серия DG быстро завоевывает популярность за счет сочетания производительности, надежности и оптимальной стоимости на фоне аналогов.","html":"Асик ориентирован на профессиональное использование: надежная конструкция, продуманная система охлаждения и способность работать под постоянными нагрузками делают его подходящим для крупных майнинг-ферм. Несмотря на то что бренд Elphapex молод, серия DG быстро завоевывает популярность за счет сочетания производительности, надежности и оптимальной стоимости на фоне аналогов."}$p60$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 61, 'image',
       $p61${"src":"/images/articles/altcoin-asics-2026/elphapex-dg2.png","alt":"ElphaPex DG2"}$p61$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 62, 'stats',
       $p62${"rows":[{"label":"Производитель","value":"Elphapex"},{"label":"Модель","value":"ElphaPex DG2"},{"label":"Алгоритм","value":"Scrypt"},{"label":"Хешрейт","value":"20000 Mh/s (20 GH/s)"},{"label":"Потребление","value":"3800 Вт"},{"label":"Монеты","value":"LTC, DOGE"},{"label":"Уровень шума","value":"75 дБ"},{"label":"Размеры","value":"432 × 196 × 287 мм"},{"label":"Вес","value":"18,3 кг"},{"label":"Год выпуска","value":"2025"}]}$p62$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 63, 'pros_cons',
       $p63${"pros":["Высокая производительность — 20 GH/s при оптимальном энергопотреблении","Конкурентная энергоэффективность","Прочная конструкция и надежная система охлаждения","Подходит для круглосуточной работы в промышленных условиях","Перспективный бренд, фокусирующийся на инновациях и качестве"],"cons":["Молодой производитель — срок надежности в долгосрочной перспективе еще предстоит подтвердить","Высокий уровень шума, не подходящий для домашнего майнинга","Требует хорошего электрического подключения и качественного охлаждения"]}$p63$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 64, 'heading',
       $p64${"level":2,"text":"3 место: Antminer L11 Pro"}$p64$::jsonb,
       'antminer-l11-pro'
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 65, 'paragraph',
       $p65${"text":"Antminer L11 Pro выделяется улучшенной стабильностью и повышенной доходностью благодаря хешрейту 21 GH/s. Устройство рассчитано на круглосуточную работу и легко вписывается как в небольшие установки, так и в промышленные фермы.","html":"Antminer L11 Pro выделяется улучшенной стабильностью и повышенной доходностью благодаря хешрейту 21 GH/s. Устройство рассчитано на круглосуточную работу и легко вписывается как в небольшие установки, так и в промышленные фермы."}$p65$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 66, 'paragraph',
       $p66${"text":"L11 Pro быстро запускается, не требует сложной настройки и подходит тем, кто хочет повысить общий хешрейт без увеличения количества устройств. Благодаря обновленной системе охлаждения майнер сохраняет стабильную работу даже под высокой нагрузкой. Он хорошо подходит для пользователей, стремящихся сделать добычу более предсказуемой и эффективной, а также для тех, кто модернизирует старые фермы и хочет получить больше доходности с каждого киловатта.","html":"L11 Pro быстро запускается, не требует сложной настройки и подходит тем, кто хочет повысить общий хешрейт без увеличения количества устройств. Благодаря обновленной системе охлаждения майнер сохраняет стабильную работу даже под высокой нагрузкой. Он хорошо подходит для пользователей, стремящихся сделать добычу более предсказуемой и эффективной, а также для тех, кто модернизирует старые фермы и хочет получить больше доходности с каждого киловатта."}$p66$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 67, 'image',
       $p67${"src":"/images/articles/altcoin-asics-2026/antminer-l11-pro.png","alt":"Antminer L11 Pro"}$p67$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 68, 'stats',
       $p68${"rows":[{"label":"Производитель","value":"Bitmain Antminer"},{"label":"Модель","value":"Antminer L11 Pro"},{"label":"Алгоритм","value":"Scrypt"},{"label":"Хешрейт","value":"21000 Mh/s"},{"label":"Потребление","value":"3680 Вт"},{"label":"Монеты","value":"LTC, DOGE"},{"label":"Уровень шума","value":"76 дБ"},{"label":"Размеры","value":"400 × 195 × 290 мм"},{"label":"Вес","value":"14,2 кг"},{"label":"Год выпуска","value":"2025"}]}$p68$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 69, 'pros_cons',
       $p69${"pros":["Высокая доходность благодаря хешрейту 21 GH/s","Простая установка и быстрый запуск","Подходит для фермеров, которые хотят увеличить мощность без расширения площади","Стабильная работа под постоянной нагрузкой","Хорошее соотношение производительности и энергопотребления"],"cons":["Сильный шум — рекомендуется только для специализированных помещений","Требует качественного охлаждения","Потребляет довольно много энергии для домашнего размещения"]}$p69$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 70, 'heading',
       $p70${"level":2,"text":"2 место: Antminer U2L9H"}$p70$::jsonb,
       'antminer-u2l9h'
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 71, 'paragraph',
       $p71${"text":"Асик Antminer U2L9H рассчитан на пользователей, которые хотят максимально увеличить хешрейт без значительного расширения фермы. Система водяного охлаждения обеспечивает стабильную работу даже при длительной высокой нагрузке, снижая риск перегрева и продлевая срок службы оборудования.","html":"Асик Antminer U2L9H рассчитан на пользователей, которые хотят максимально увеличить хешрейт без значительного расширения фермы. Система водяного охлаждения обеспечивает стабильную работу даже при длительной высокой нагрузке, снижая риск перегрева и продлевая срок службы оборудования."}$p71$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 72, 'paragraph',
       $p72${"text":"Благодаря хешрейту 27 GH/s и оптимальной энергоэффективности, U2L9H позволяет снизить расходы на электроэнергию и повысить прибыльность добычи. Майнер подходит как для промышленных ферм, так и для опытных энтузиастов, которые ищут надежное и долгосрочное решение для майнинга.","html":"Благодаря хешрейту 27 GH/s и оптимальной энергоэффективности, U2L9H позволяет снизить расходы на электроэнергию и повысить прибыльность добычи. Майнер подходит как для промышленных ферм, так и для опытных энтузиастов, которые ищут надежное и долгосрочное решение для майнинга."}$p72$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 73, 'image',
       $p73${"src":"/images/articles/altcoin-asics-2026/antminer-u2l9h.png","alt":"Antminer U2L9H"}$p73$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 74, 'stats',
       $p74${"rows":[{"label":"Производитель","value":"Bitmain Antminer"},{"label":"Модель","value":"Antminer U2L9H"},{"label":"Алгоритм","value":"Scrypt"},{"label":"Хешрейт","value":"27000 Mh/s"},{"label":"Потребление","value":"5670 Вт"},{"label":"Монеты","value":"LTC, DOGE"},{"label":"Уровень шума","value":"50 дБ"},{"label":"Размеры","value":"445 × 188 × 670 мм"},{"label":"Вес","value":"12,8 кг"},{"label":"Год выпуска","value":"2025"}]}$p74$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 75, 'pros_cons',
       $p75${"pros":["Высокий хешрейт 27 GH/s для максимальной доходности","Система водяного охлаждения обеспечивает стабильную работу под нагрузкой","Энергоэффективность снижает затраты на электроэнергию","Подходит для долгосрочной эксплуатации на промышленных фермах","Надежная и стабильная работа оборудования"],"cons":["Требует подключение к водяной системе охлаждения","Высокое энергопотребление — оптимально для промышленных условий","Габариты и вес делают домашнее размещение затруднительным"]}$p75$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 76, 'heading',
       $p76${"level":2,"text":"1 место: Antminer L11 Hyd 6U"}$p76$::jsonb,
       'antminer-l11-hyd-6u'
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 77, 'paragraph',
       $p77${"text":"Antminer L11 Hydro 6U — это топовый Scrypt-майнер для добычи Litecoin, Dogecoin и еще шести совместимых криптовалют. Модель рассчитана на крупные промышленные фермы и пользователей, стремящихся к максимальной производительности при оптимальном энергопотреблении. Гидроохлаждение обеспечивает стабильную работу даже при высоких нагрузках, снижая риск перегрева и минимизируя простои.","html":"Antminer L11 Hydro 6U — это топовый Scrypt-майнер для добычи Litecoin, Dogecoin и еще шести совместимых криптовалют. Модель рассчитана на крупные промышленные фермы и пользователей, стремящихся к максимальной производительности при оптимальном энергопотреблении. Гидроохлаждение обеспечивает стабильную работу даже при высоких нагрузках, снижая риск перегрева и минимизируя простои."}$p77$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 78, 'paragraph',
       $p78${"text":"С хешрейтом 33 GH/s и энергоэффективностью на уровне промышленных стандартов, Antminer L11 Hydro 6U позволяет получать максимальный доход при разумных затратах на электроэнергию. Надежная конструкция и продуманная архитектура делают его идеальным решением для длительного использования и масштабирования майнинговой инфраструктуры.","html":"С хешрейтом 33 GH/s и энергоэффективностью на уровне промышленных стандартов, Antminer L11 Hydro 6U позволяет получать максимальный доход при разумных затратах на электроэнергию. Надежная конструкция и продуманная архитектура делают его идеальным решением для длительного использования и масштабирования майнинговой инфраструктуры."}$p78$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 79, 'image',
       $p79${"src":"/images/articles/altcoin-asics-2026/antminer-l11-hyd-6u.png","alt":"Antminer L11 Hydro 6U"}$p79$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 80, 'stats',
       $p80${"rows":[{"label":"Производитель","value":"Bitmain Antminer"},{"label":"Модель","value":"Antminer L11 Hydro 6U"},{"label":"Алгоритм","value":"Scrypt"},{"label":"Хешрейт","value":"33000 Mh/s"},{"label":"Потребление","value":"5676 Вт"},{"label":"Монеты","value":"LTC, DOGE"},{"label":"Уровень шума","value":"50 дБ"},{"label":"Размеры","value":"600 × 450 × 350 мм"},{"label":"Вес","value":"25 кг"},{"label":"Год выпуска","value":"2025"}]}$p80$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 81, 'pros_cons',
       $p81${"pros":["Максимальная производительность 33 GH/s для высокой доходности","Гидроохлаждение обеспечивает стабильную работу и долгий срок службы","Оптимальное энергопотребление для промышленных условий","Надежная и долговечная конструкция","Подходит для масштабируемых майнинговых ферм с минимальными простоями"],"cons":["Не подходит для домашнего использования из-за габаритов и водяного охлаждения","Высокая стоимость — ориентирован на профессиональные фермы","Требует организации гидросистемы для охлаждения"]}$p81$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 82, 'heading',
       $p82${"level":2,"text":"Выводы"}$p82$::jsonb,
       'vyvody'
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 83, 'paragraph',
       $p83${"text":"Альткоины – это самостоятельные криптовалютные проекты с разными технологиями и целями. Майнинг альткоинов остается актуальным способом заработка в криптоиндустрии, особенно для тех, кто использует современные асики.","html":"Альткоины – это самостоятельные криптовалютные проекты с разными технологиями и целями. Майнинг альткоинов остается актуальным способом заработка в криптоиндустрии, особенно для тех, кто использует современные асики."}$p83$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc';

-- =====================================================================
-- 031_article_hydro_asics.sql
-- =====================================================================

-- Рейтинг асиков с водяным охлаждением 2026: ТОП-10 майнеров

INSERT INTO articles (
    slug, title, title_subtitle, excerpt, content, topic_id,
    reading_time_min, reading_minutes, published_at, view_count,
    display_type, sort_order, is_published, uses_blocks,
    image_url, image_alt
) VALUES (
    'rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov',
    'Рейтинг асиков с водяным охлаждением 2026',
    'ТОП-10 майнеров',
    $excerpt$ТОП-10 асиков с водяным охлаждением в 2026 году: от Antminer S19 XP Hydro до Antminer S23 Hydro 3U.$excerpt$,
    $content$Введение

Борьба за энергоэффективность вынуждает производителей оборудования для майнинга искать новые технические форматы достижения рекордных результатов. Примечательно, что сегодня самые мощные асики – это майнеры на водяном охлаждении. Классически (воздушный) принцип все еще применим, но такой способ снижения температур значительно уступает жидкостному по своей эффективности. Познакомимся с рейтингом асиков на водяном охлаждении, изучив 10 топовых вариантов.

Выводы

Системы водяного охлаждения в асиках представляют собой современное и технологичное решение для эффективного управления тепловыделением оборудования при высоких нагрузках. По сравнению с традиционным воздушным охлаждением, они обеспечивают более стабильную работу устройств, снижают уровень шума и позволяют размещать оборудование с большей плотностью.$content$,
    'mining',
    15,
    15,
    '2024-10-23',
    2749,
    'list',
    50,
    TRUE,
    TRUE,
    '/images/articles/hydro-asics-2026/antminer-s23-hydro-3u.png',
    'Antminer S23 Hydro 3U'
)
ON CONFLICT (slug) DO UPDATE SET
    title = EXCLUDED.title,
    title_subtitle = EXCLUDED.title_subtitle,
    excerpt = EXCLUDED.excerpt,
    content = EXCLUDED.content,
    reading_time_min = EXCLUDED.reading_time_min,
    reading_minutes = EXCLUDED.reading_minutes,
    published_at = EXCLUDED.published_at,
    view_count = EXCLUDED.view_count,
    uses_blocks = TRUE,
    image_url = EXCLUDED.image_url,
    image_alt = EXCLUDED.image_alt,
    is_published = TRUE;

DELETE FROM article_blocks
WHERE article_id = (SELECT id FROM articles WHERE slug = 'rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov');

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 1, 'heading',
       $p1${"level":2,"text":"Введение"}$p1$::jsonb,
       'vvedenie'
FROM articles a WHERE a.slug = 'rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 2, 'paragraph',
       $p2${"text":"Борьба за энергоэффективность вынуждает производителей оборудования для майнинга искать новые технические форматы достижения рекордных результатов. Примечательно, что сегодня самые мощные асики – это майнеры на водяном охлаждении. Классически (воздушный) принцип все еще применим, но такой способ снижения температур значительно уступает жидкостному по своей эффективности. Познакомимся с рейтингом асиков на водяном охлаждении, изучив 10 топовых вариантов.","html":"Борьба за энергоэффективность вынуждает производителей оборудования для майнинга искать новые технические форматы достижения рекордных результатов. Примечательно, что сегодня самые мощные асики – это майнеры на водяном охлаждении. Классически (воздушный) принцип все еще применим, но такой способ снижения температур значительно уступает жидкостному по своей эффективности. Познакомимся с рейтингом асиков на водяном охлаждении, изучив 10 топовых вариантов."}$p2$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 3, 'image',
       $p3${"src":"/images/articles/hydro-asics-2026/intro-hydro-farm.png","alt":"Майнинг-ферма с водяным охлаждением"}$p3$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 4, 'heading',
       $p4${"level":2,"text":"Что необходимо знать про асики с водяным охлаждением?"}$p4$::jsonb,
       'chto-neobhodimo-znat'
FROM articles a WHERE a.slug = 'rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 5, 'paragraph',
       $p5${"text":"Водяное охлаждение (или жидкостное охлаждение) – это система, где тепло от чипов отводится с помощью циркулирующей жидкости (обычно воды или специального теплоносителя), а не воздуха.","html":"Водяное охлаждение (или жидкостное охлаждение) – это система, где тепло от чипов отводится с помощью циркулирующей жидкости (обычно воды или специального теплоносителя), а не воздуха."}$p5$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 6, 'paragraph',
       $p6${"text":"Преимущества водяного охлаждения:","html":"Преимущества водяного охлаждения:"}$p6$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 7, 'list',
       $p7${"ordered":false,"items":["Эффективность отвода тепла. Вода в десятки раз эффективнее воздуха по теплоемкости и теплопроводности, поэтому такие системы справляются с перегревом даже при экстремальных нагрузках;","Снижение шума. В отличие от воздушных асиков, у которых работают мощные вентиляторы, водяные асики гораздо тише;","Повышенная стабильность. Поддержание постоянной температуры снижает риск перегрева и выхода из строя компонентов, продлевая срок службы;","Компактность ферм. За счет лучшего теплоотвода можно ставить устройства плотнее друг к другу, экономя место."]}$p7$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 8, 'paragraph',
       $p8${"text":"Недостатки водяного охлаждения:","html":"Недостатки водяного охлаждения:"}$p8$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 9, 'list',
       $p9${"ordered":false,"items":["Более высокая стоимость. Сами асики дороже, так как бюджет включает расходы на систему охлаждения, установку и обслуживание;","Сложность обслуживания. Водяные системы требуют внимательного контроля за утечками, давлением, чистотой жидкости;","Необходимость технической подготовки. Особенно если используется сложная система, требуется грамотный монтаж, настройка и понимание гидравлики."]}$p9$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 10, 'paragraph',
       $p10${"text":"Асики с водяным охлаждением – это шаг вперед в направлении эффективного и масштабируемого майнинга.","html":"Асики с водяным охлаждением – это шаг вперед в направлении эффективного и масштабируемого майнинга."}$p10$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 11, 'paragraph',
       $p11${"text":"Они особенно актуальны для промышленных ферм, где важно снизить уровень шума и максимально использовать доступное пространство. Но для домашнего майнинга их выбор может быть избыточным из-за стоимости и сложности.","html":"Они особенно актуальны для промышленных ферм, где важно снизить уровень шума и максимально использовать доступное пространство. Но для домашнего майнинга их выбор может быть избыточным из-за стоимости и сложности."}$p11$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 12, 'paragraph',
       $p12${"text":"Если у вас крупная ферма, стабильное электроснабжение и возможность контролировать температурный режим – водяной асик может стать выгодной инвестицией. В остальных случаях – стоит тщательно просчитать рентабельность и сравнить с более простыми в установке воздушными решениями.","html":"Если у вас крупная ферма, стабильное электроснабжение и возможность контролировать температурный режим – водяной асик может стать выгодной инвестицией. В остальных случаях – стоит тщательно просчитать рентабельность и сравнить с более простыми в установке воздушными решениями."}$p12$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 13, 'heading',
       $p13${"level":2,"text":"10 место: Antminer S19 XP Hydro"}$p13$::jsonb,
       'antminer-s19-xp-hydro'
FROM articles a WHERE a.slug = 'rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 14, 'paragraph',
       $p14${"text":"Самый мощный асик всей 19-й линейки от Antminer. Образцовые на момент выхода параметры производительности и энергоэффективности позволили сохранить актуальность модели на несколько лет вперед. Это все тот же узнаваемый концепт, который стал основой будущих новинок компании Bitmain (в частности, 21-й линейки майнеров с водяным охлаждением).","html":"Самый мощный асик всей 19-й линейки от Antminer. Образцовые на момент выхода параметры производительности и энергоэффективности позволили сохранить актуальность модели на несколько лет вперед. Это все тот же узнаваемый концепт, который стал основой будущих новинок компании Bitmain (в частности, 21-й линейки майнеров с водяным охлаждением)."}$p14$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 15, 'paragraph',
       $p15${"text":"Мощность модели Antminer S19 XP Hydro составляет 257 ТХ/с при потреблении 5 450 Вт электричества: энергоэффективность на уровне 21 Вт на ТХ даже спустя несколько лет после выхода выглядит впечатляюще. Майнер требует трехфазного подключения, а также дополнения комплекта помпой и радиатором. Однако, как отмечают многие пользователи, аппарат более капризный при сравнении с конкурентами и асиками предыдущих поколений.","html":"Мощность модели Antminer S19 XP Hydro составляет 257 ТХ/с при потреблении 5 450 Вт электричества: энергоэффективность на уровне 21 Вт на ТХ даже спустя несколько лет после выхода выглядит впечатляюще. Майнер требует трехфазного подключения, а также дополнения комплекта помпой и радиатором. Однако, как отмечают многие пользователи, аппарат более капризный при сравнении с конкурентами и асиками предыдущих поколений."}$p15$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 16, 'image',
       $p16${"src":"/images/articles/hydro-asics-2026/antminer-s19-xp-hydro.png","alt":"Antminer S19 XP Hydro"}$p16$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 17, 'stats',
       $p17${"rows":[]}$p17$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 18, 'pros_cons',
       $p18${"pros":["Самый мощный асик всей 19-й серии от Bitmain","Отличные показатели энергоэффективности, актуальные даже спустя годы после выхода модели","Низкий уровень шума."],"cons":["Нет помпы и радиатора в комплекте","Серьезные требования к розетке и электропроводке","Наличие доли негативных отзывов."]}$p18$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 19, 'heading',
       $p19${"level":2,"text":"9 место: Whatsminer M66 Hydro и M66S Hydro"}$p19$::jsonb,
       'whatsminer-m66-hydro'
FROM articles a WHERE a.slug = 'rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 20, 'paragraph',
       $p20${"text":"Вслед за моделью M56 в линейке Whatsminer появилось еще два асика для работы с иммерсионным принципом охлаждения: 66-я серия, состоящая из майнеров M66 Hydro и M66S Hydro. Оба асика также появились в 2023 году, вслед за дебютным продуктом. Производительность была увеличена до 280 и 298 ТХ/с, в то время как потребление юнитов примерно одинаковое – 5 600 и 5 550 Вт.","html":"Вслед за моделью M56 в линейке Whatsminer появилось еще два асика для работы с иммерсионным принципом охлаждения: 66-я серия, состоящая из майнеров M66 Hydro и M66S Hydro. Оба асика также появились в 2023 году, вслед за дебютным продуктом. Производительность была увеличена до 280 и 298 ТХ/с, в то время как потребление юнитов примерно одинаковое – 5 600 и 5 550 Вт."}$p20$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 21, 'paragraph',
       $p21${"text":"Итог работы инженеров MicroBT – образцовые показатели энергоэффективности: 19-20 Вт на ТХ, что в 2023 году оказалось настоящим открытием. Массовым выпуск M66 Hydro и M66S Hydro не стал (ввиду более сложной эксплуатации для пользователей), однако, была доказана возможность практически безграничного роста мощности и энергоэффективности за счет водяного принципа охлаждения.","html":"Итог работы инженеров MicroBT – образцовые показатели энергоэффективности: 19-20 Вт на ТХ, что в 2023 году оказалось настоящим открытием. Массовым выпуск M66 Hydro и M66S Hydro не стал (ввиду более сложной эксплуатации для пользователей), однако, была доказана возможность практически безграничного роста мощности и энергоэффективности за счет водяного принципа охлаждения."}$p21$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 22, 'image',
       $p22${"src":"/images/articles/hydro-asics-2026/whatsminer-m66-hydro.png","alt":"Whatsminer M66 Hydro и M66S Hydro"}$p22$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 23, 'stats',
       $p23${"rows":[]}$p23$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 24, 'pros_cons',
       $p24${"pros":["Максимальная производительность для класса асиков с иммерсионным охлаждением","Низкий уровень шума","Отличная энергоэффективность","Надежный производитель."],"cons":["Серьезные требования к розетке и электропроводке","Необходимость покупки дополнительных комплектующих","Сложность запуска и обслуживания."]}$p24$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 25, 'heading',
       $p25${"level":2,"text":"8 место: Whatsminer M63 Hydro и M63S Hydro"}$p25$::jsonb,
       'whatsminer-m63-hydro'
FROM articles a WHERE a.slug = 'rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 26, 'paragraph',
       $p26${"text":"63-я линейка от MicroBT – это самые мощные асики бренда Whatsminer на сегодняшний день. Используя систему водяного охлаждения, производителю удалось достичь значений, которые еще несколько лет назад казались фантастическими. 366 и 390 ТХ/с для асиков с потребляемой мощностью 7 300 и 7 250 Вт – это важное техническое достижение в рамках всей индустрии добычи криптовалют.","html":"63-я линейка от MicroBT – это самые мощные асики бренда Whatsminer на сегодняшний день. Используя систему водяного охлаждения, производителю удалось достичь значений, которые еще несколько лет назад казались фантастическими. 366 и 390 ТХ/с для асиков с потребляемой мощностью 7 300 и 7 250 Вт – это важное техническое достижение в рамках всей индустрии добычи криптовалют."}$p26$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 27, 'paragraph',
       $p27${"text":"Энергоэффективность на уровне 18,5 Вт на ТХ является эталонным значением для Whatsminer, однако, подобное стало возможным только в рамках применения жидкостного охлаждения. К сожалению, для классического (воздушного) принципа подобные метрики пока является недостижимой планкой.","html":"Энергоэффективность на уровне 18,5 Вт на ТХ является эталонным значением для Whatsminer, однако, подобное стало возможным только в рамках применения жидкостного охлаждения. К сожалению, для классического (воздушного) принципа подобные метрики пока является недостижимой планкой."}$p27$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 28, 'image',
       $p28${"src":"/images/articles/hydro-asics-2026/whatsminer-m63-hydro.png","alt":"Whatsminer M63 Hydro и M63S Hydro"}$p28$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 29, 'stats',
       $p29${"rows":[]}$p29$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 30, 'pros_cons',
       $p30${"pros":["Самые мощные и производительные асики в линейке Whatsminer","Проверенный и надежный бренд","Эталонная энергоэффективность для данного производителя","Низкий уровень шума."],"cons":["Потребление более 7 КВт – серьезные требования к качественной проводке и мощной розетке","Необходимость в комплектовании дополнительными элементами системы охлаждения."]}$p30$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 31, 'heading',
       $p31${"level":2,"text":"7 место: Antminer S21 Hydro"}$p31$::jsonb,
       'antminer-s21-hydro'
FROM articles a WHERE a.slug = 'rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 32, 'paragraph',
       $p32${"text":"Замыкает тройку лидеров младшая модель 21-й линейки с водяным охлаждением от компании Bitmain. Это все тот же узнаваемый корпус, но мощность модели 2024 года составляет уже 335 Th/s при потреблении всего 5 360 Вт. На момент выхода майнера, инженерам Antminer удалось установить новый рекорд энергоэффективности – всего 16 Вт на ТХ, что стало настоящим открытием весной 2024-го. И подобное вновь оказалось возможным благодаря водяному охлаждению, в то время как для воздушного принципа подобные метрики пока недостижимы.","html":"Замыкает тройку лидеров младшая модель 21-й линейки с водяным охлаждением от компании Bitmain. Это все тот же узнаваемый корпус, но мощность модели 2024 года составляет уже 335 Th/s при потреблении всего 5 360 Вт. На момент выхода майнера, инженерам Antminer удалось установить новый рекорд энергоэффективности – всего 16 Вт на ТХ, что стало настоящим открытием весной 2024-го. И подобное вновь оказалось возможным благодаря водяному охлаждению, в то время как для воздушного принципа подобные метрики пока недостижимы."}$p32$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 33, 'paragraph',
       $p33${"text":"Antminer S21 Hydro требует наличия помпы и радиатора, поэтому запустить майнер «из коробки» не получится. Однако это актуально для любой модели с жидкостным охлаждением, поэтому для опытных майнеров сюрпризов не будет.","html":"Antminer S21 Hydro требует наличия помпы и радиатора, поэтому запустить майнер «из коробки» не получится. Однако это актуально для любой модели с жидкостным охлаждением, поэтому для опытных майнеров сюрпризов не будет."}$p33$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 34, 'image',
       $p34${"src":"/images/articles/hydro-asics-2026/antminer-s21-hydro.png","alt":"Antminer S21 Hydro"}$p34$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 35, 'stats',
       $p35${"rows":[]}$p35$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 36, 'pros_cons',
       $p36${"pros":["Высокая производительность","Безупречная энергоэффективность","Проверенный производитель","Низкий уровень шума."],"cons":["Необходимость покупки дополнительных компонентов","Новая линейка, надежность которой еще не доказана временем."]}$p36$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 37, 'heading',
       $p37${"level":2,"text":"6 место: Antminer S23 Imm"}$p37$::jsonb,
       'antminer-s23-imm'
FROM articles a WHERE a.slug = 'rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 38, 'paragraph',
       $p38${"text":"Antminer S23 Immersion – это асик нового поколения, созданный специально для работы в иммерсионных баках. Модель ориентирована на крупные фермы, которым требуется высокая плотность размещения, низкий уровень шума и возможность круглосуточной эксплуатации без простоев. Производительность устройства составляет 442 Th/s, что делает его привлекательным решением для проектов, стремящихся увеличить суммарный хешрейт без расширения площади.","html":"Antminer S23 Immersion – это асик нового поколения, созданный специально для работы в иммерсионных баках. Модель ориентирована на крупные фермы, которым требуется высокая плотность размещения, низкий уровень шума и возможность круглосуточной эксплуатации без простоев. Производительность устройства составляет 442 Th/s, что делает его привлекательным решением для проектов, стремящихся увеличить суммарный хешрейт без расширения площади."}$p38$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 39, 'paragraph',
       $p39${"text":"Иммерсионное охлаждение позволяет S23 Imm работать стабильнее обычных воздушных моделей: нет вентиляторов, нет риска перегрева, а температурный режим остается равномерным даже при высокой нагрузке. Майнер отличается устойчивостью к запыленности, не требует регулярной чистки и удобен в эксплуатации при больших масштабах инфраструктуры. В то же время для запуска потребуется полноценная иммерсионная ванна и система циркуляции жидкости, что важно учитывать при покупке.","html":"Иммерсионное охлаждение позволяет S23 Imm работать стабильнее обычных воздушных моделей: нет вентиляторов, нет риска перегрева, а температурный режим остается равномерным даже при высокой нагрузке. Майнер отличается устойчивостью к запыленности, не требует регулярной чистки и удобен в эксплуатации при больших масштабах инфраструктуры. В то же время для запуска потребуется полноценная иммерсионная ванна и система циркуляции жидкости, что важно учитывать при покупке."}$p39$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 40, 'image',
       $p40${"src":"/images/articles/hydro-asics-2026/antminer-s23-imm.png","alt":"Antminer S23 Imm"}$p40$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 41, 'stats',
       $p41${"rows":[{"label":"Производитель","value":"Bitmain"},{"label":"Модель","value":"Antminer S23 Imm"},{"label":"Алгоритм","value":"SHA-256"},{"label":"Хешрейт","value":"442 Th/s"},{"label":"Потребление","value":"5304 Вт"},{"label":"Монета","value":"BTC"},{"label":"Год выпуска","value":"2025"}]}$p41$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 42, 'pros_cons',
       $p42${"pros":["Создан для работы в иммерсионной системе охлаждения — стабильность при круглосуточных нагрузках.","Высокая производительность.","Низкий уровень шума благодаря отсутствию вентиляторов.","Устойчивость к пыли и окружающей среде.","Подходит для крупных ферм и дата-центров с высокой плотностью размещения."],"cons":["Требуется иммерсионная ванна и дополнительная инфраструктура.","Не подходит для небольших домашних установок.","Более высокая стоимость внедрения."]}$p42$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 43, 'heading',
       $p43${"level":2,"text":"5 место: Antminer S21 XP Hydro"}$p43$::jsonb,
       'antminer-s21-xp-hydro'
FROM articles a WHERE a.slug = 'rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 44, 'paragraph',
       $p44${"text":"Версия XP является логичным продолжением 21-й линейки Antminer с водяным охлаждением. Мощность выросла до внушительных 473 ТХ/с при потреблении всего 5 676 Вт. Результатом работы инженеров Bitmain стало рекордное на текущий момент значение энергоэффективности: 12 Вт на ТХ, что еще несколько лет назад казалось фантастикой. Это действительно невероятное достижение научного и технического прогресса в области добычи криптовалют.","html":"Версия XP является логичным продолжением 21-й линейки Antminer с водяным охлаждением. Мощность выросла до внушительных 473 ТХ/с при потреблении всего 5 676 Вт. Результатом работы инженеров Bitmain стало рекордное на текущий момент значение энергоэффективности: 12 Вт на ТХ, что еще несколько лет назад казалось фантастикой. Это действительно невероятное достижение научного и технического прогресса в области добычи криптовалют."}$p44$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 45, 'paragraph',
       $p45${"text":"Antminer S21 XP Hydro обладает производительностью аналогичной пяти S19 на 95 ТХ/с. Однако для работы майнера, появившегося в 2024 году, требуется в 2,5 раза меньше электричества. Именно так выглядит успешная борьба за энергоэффективность, в которой компания Bitmain демонстрирует отличные результаты.","html":"Antminer S21 XP Hydro обладает производительностью аналогичной пяти S19 на 95 ТХ/с. Однако для работы майнера, появившегося в 2024 году, требуется в 2,5 раза меньше электричества. Именно так выглядит успешная борьба за энергоэффективность, в которой компания Bitmain демонстрирует отличные результаты."}$p45$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 46, 'image',
       $p46${"src":"/images/articles/hydro-asics-2026/antminer-s21-xp-hydro.png","alt":"Antminer S21 XP Hydro"}$p46$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 47, 'stats',
       $p47${"rows":[]}$p47$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 48, 'pros_cons',
       $p48${"pros":["Один из мощнейших асиков в мире","Эталонная энергоэффективность в 2024 году","Ведущий мировой производитель","Низкий уровень шума."],"cons":["Высокая стоимость","Отсутствие в комплекте помпы и радиатора."]}$p48$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 49, 'heading',
       $p49${"level":2,"text":"4 место: Antminer U2L9H"}$p49$::jsonb,
       'antminer-u2l9h'
FROM articles a WHERE a.slug = 'rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 50, 'paragraph',
       $p50${"text":"Antminer U2L9H — это профессиональный Scrypt-майнер, рассчитанный на добычу Litecoin и Dogecoin с высокой стабильностью и минимальными рисками перегрева. Благодаря водяной системе охлаждения устройство выдерживает круглосуточные нагрузки и сохраняет стабильный хешрейт даже в жарких помещениях или условиях плотной установки.","html":"Antminer U2L9H — это профессиональный Scrypt-майнер, рассчитанный на добычу Litecoin и Dogecoin с высокой стабильностью и минимальными рисками перегрева. Благодаря водяной системе охлаждения устройство выдерживает круглосуточные нагрузки и сохраняет стабильный хешрейт даже в жарких помещениях или условиях плотной установки."}$p50$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 51, 'paragraph',
       $p51${"text":"С производительностью 27 Gh/s и потреблением 5670 Вт модель ориентирована на пользователей, которым важно получить максимум доходности при оптимальных затратах на электроэнергию. Водяное охлаждение снижает шум, увеличивает срок службы оборудования и делает майнер более надежным для долгосрочной эксплуатации. Antminer U2L9H станет хорошим решением для тех, кто строит ферму или масштабирует уже существующую инфраструктуру.","html":"С производительностью 27 Gh/s и потреблением 5670 Вт модель ориентирована на пользователей, которым важно получить максимум доходности при оптимальных затратах на электроэнергию. Водяное охлаждение снижает шум, увеличивает срок службы оборудования и делает майнер более надежным для долгосрочной эксплуатации. Antminer U2L9H станет хорошим решением для тех, кто строит ферму или масштабирует уже существующую инфраструктуру."}$p51$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 52, 'image',
       $p52${"src":"/images/articles/hydro-asics-2026/antminer-u2l9h.png","alt":"Antminer U2L9H"}$p52$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 53, 'stats',
       $p53${"rows":[{"label":"Производитель","value":"Bitmain"},{"label":"Модель","value":"Antminer U2L9H"},{"label":"Алгоритм","value":"Scrypt"},{"label":"Хешрейт","value":"27000 Mh/s (27 Gh/s)"},{"label":"Потребление","value":"5670 Вт"},{"label":"Монета","value":"LTC, DOGE"},{"label":"Год выпуска","value":"2025"}]}$p53$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 54, 'pros_cons',
       $p54${"pros":["Водяное охлаждение обеспечивает тихую и стабильную работу.","Высокая производительность на алгоритме Scrypt.","Подходит для длительной нагрузки без перегрева.","Оптимальный баланс между хешрейтом и энергопотреблением.","Удобен для размещения в плотных фермах и контейнерах."],"cons":["Не подходит для домашнего использования.","Более высокая стоимость инфраструктуры по сравнению с воздушными моделями."]}$p54$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 55, 'heading',
       $p55${"level":2,"text":"3 место: Antminer L11 Hydro 6U"}$p55$::jsonb,
       'antminer-l11-hydro-6u'
FROM articles a WHERE a.slug = 'rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 56, 'paragraph',
       $p56${"text":"Antminer L11 Hydro 6U — это флагманский Scrypt-майнер с водяным охлаждением, созданный для добычи Litecoin, Dogecoin и других монет на этом алгоритме. Благодаря хешрейту 33 Gh/s устройство ориентировано на крупные фермы и пользователей, которым требуется максимальная производительность при стабильной круглосуточной работе.","html":"Antminer L11 Hydro 6U — это флагманский Scrypt-майнер с водяным охлаждением, созданный для добычи Litecoin, Dogecoin и других монет на этом алгоритме. Благодаря хешрейту 33 Gh/s устройство ориентировано на крупные фермы и пользователей, которым требуется максимальная производительность при стабильной круглосуточной работе."}$p56$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 57, 'paragraph',
       $p57${"text":"Гидроохлаждение обеспечивает низкую температуру чипов, продлевает срок службы оборудования и заметно снижает уровень шума по сравнению с воздушными системами. Майнер эффективен в больших проектах, дата-центрах и контейнерах, где важны плотность размещения и минимальные простои. Antminer L11 Hydro 6U сочетает высокую мощность, экономичность и надежность, что делает его одним из лучших вариантов для профессионального Scrypt-майнинга.","html":"Гидроохлаждение обеспечивает низкую температуру чипов, продлевает срок службы оборудования и заметно снижает уровень шума по сравнению с воздушными системами. Майнер эффективен в больших проектах, дата-центрах и контейнерах, где важны плотность размещения и минимальные простои. Antminer L11 Hydro 6U сочетает высокую мощность, экономичность и надежность, что делает его одним из лучших вариантов для профессионального Scrypt-майнинга."}$p57$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 58, 'image',
       $p58${"src":"/images/articles/hydro-asics-2026/antminer-l11-hydro-6u.png","alt":"Antminer L11 Hydro 6U"}$p58$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 59, 'stats',
       $p59${"rows":[{"label":"Производитель","value":"Bitmain"},{"label":"Модель","value":"Antminer L11 Hydro 6U"},{"label":"Алгоритм","value":"Scrypt"},{"label":"Хешрейт","value":"33000 Mh/s (33 Gh/s)"},{"label":"Потребление","value":"5676 Вт"},{"label":"Монета","value":"LTC, DOGE"},{"label":"Год выпуска","value":"2025"}]}$p59$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 60, 'pros_cons',
       $p60${"pros":["Высокий хешрейт для алгоритма Scrypt.","Гидроохлаждение снижает шум и повышает стабильность.","Подходит для крупных ферм и больших помещений.","Эффективное охлаждение продлевает срок службы оборудования.","Оптимальная работа при круглосуточной нагрузке."],"cons":["Занимает больше места, чем стандартные воздушные модели.","Не предназначен для домашнего использования.","Высока цена."]}$p60$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 61, 'heading',
       $p61${"level":2,"text":"2 место: Antminer S21E XP Hyd 3U"}$p61$::jsonb,
       'antminer-s21e-xp-hyd-3u'
FROM articles a WHERE a.slug = 'rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 62, 'paragraph',
       $p62${"text":"Безоговорочным лидером среди асиков на водяном охлаждении является модель Antminer S21E XP Hyd 3U от компании Bitmain. На фоне конкурентов и более ранних майнеров это оборудование выглядит фантастическим, однако, инженерам бренда действительно удалось добиться уникальных результатов на практике. 860 ТХ/с – это главная техническая особенность асика, что делает его безоговорочным лидером. Потребление также не менее внушительное – 11 180 Вт, что демонстрирует энергоэффективность на уровне 13 Вт на ТХ. Модель S21 XP Hydro в этом плане выглядит предпочтительней, однако, ее мощность практически в 2 раза ниже.","html":"Безоговорочным лидером среди асиков на водяном охлаждении является модель Antminer S21E XP Hyd 3U от компании Bitmain. На фоне конкурентов и более ранних майнеров это оборудование выглядит фантастическим, однако, инженерам бренда действительно удалось добиться уникальных результатов на практике. 860 ТХ/с – это главная техническая особенность асика, что делает его безоговорочным лидером. Потребление также не менее внушительное – 11 180 Вт, что демонстрирует энергоэффективность на уровне 13 Вт на ТХ. Модель S21 XP Hydro в этом плане выглядит предпочтительней, однако, ее мощность практически в 2 раза ниже."}$p62$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 63, 'paragraph',
       $p63${"text":"S21E XP Hyd 3U открывает принципиально новые требования к розетке и электропроводке помещения. Потребление более 10 КВт подходит далеко не всем локациям, поэтому запуск данного Antminer может быть сопряжен с дополнительными трудностями. Стоимость модели также удивляет, но за технологичность и целый ряд рекордных значений приходится переплачивать.","html":"S21E XP Hyd 3U открывает принципиально новые требования к розетке и электропроводке помещения. Потребление более 10 КВт подходит далеко не всем локациям, поэтому запуск данного Antminer может быть сопряжен с дополнительными трудностями. Стоимость модели также удивляет, но за технологичность и целый ряд рекордных значений приходится переплачивать."}$p63$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 64, 'image',
       $p64${"src":"/images/articles/hydro-asics-2026/antminer-s21e-xp-hyd-3u.png","alt":"Antminer S21E XP Hyd 3U"}$p64$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 65, 'stats',
       $p65${"rows":[]}$p65$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 66, 'pros_cons',
       $p66${"pros":["Самый мощный асик в мире","Отличная энергоэффективность","Максимальная доходность среди асиков на SHA-256","Низкий уровень шума","Проверенный бренд."],"cons":["Высокая стоимость","Серьезные требования к розетке и проводке","Отсутствие необходимых для запуска элементов в комплекте."]}$p66$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 67, 'heading',
       $p67${"level":2,"text":"1 место: Antminer S23 Hydro 3U"}$p67$::jsonb,
       'antminer-s23-hydro-3u'
FROM articles a WHERE a.slug = 'rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 68, 'paragraph',
       $p68${"text":"Antminer S23 Hydro 3U — инновационный SHA-256 майнер, ставший первым устройством, перешагнувшим порог в 1 петахеш мощности. Хешрейт 1160 Th/s, компактный форм-фактор 3U и водяное охлаждение делают его оптимальным выбором для профессиональных дата-центров и индустриальных ферм, где важны максимальная плотность вычислений, эффективное энергопотребление и стабильность при круглосуточной работе.","html":"Antminer S23 Hydro 3U — инновационный SHA-256 майнер, ставший первым устройством, перешагнувшим порог в 1 петахеш мощности. Хешрейт 1160 Th/s, компактный форм-фактор 3U и водяное охлаждение делают его оптимальным выбором для профессиональных дата-центров и индустриальных ферм, где важны максимальная плотность вычислений, эффективное энергопотребление и стабильность при круглосуточной работе."}$p68$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 69, 'paragraph',
       $p69${"text":"Гидроохлаждение обеспечивает низкую температуру чипов, снижает акустический шум и помогает поддерживать стабильную работу вне зависимости от внешних условий. Благодаря высокой энергоэффективности устройство помогает снизить операционные расходы, что особенно важно для крупных майнинговых кластеров.","html":"Гидроохлаждение обеспечивает низкую температуру чипов, снижает акустический шум и помогает поддерживать стабильную работу вне зависимости от внешних условий. Благодаря высокой энергоэффективности устройство помогает снизить операционные расходы, что особенно важно для крупных майнинговых кластеров."}$p69$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 70, 'image',
       $p70${"src":"/images/articles/hydro-asics-2026/antminer-s23-hydro-3u.png","alt":"Antminer S23 Hydro 3U"}$p70$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 71, 'stats',
       $p71${"rows":[{"label":"Производитель","value":"Bitmain"},{"label":"Модель","value":"Antminer S23 Hydro 3U"},{"label":"Алгоритм","value":"SHA-256"},{"label":"Хешрейт","value":"1160 Th/s"},{"label":"Потребление","value":"11020 Вт"},{"label":"Монета","value":"BTC"},{"label":"Год выпуска","value":"2025"}]}$p71$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 72, 'pros_cons',
       $p72${"pros":["Хешрейт более 1 петахеша.","Гидроохлаждение снижает шум и увеличивает стабильность.","Компактный форм-фактор 3U для плотного размещения в стойках.","Высокая энергоэффективность 9.5 J/TH.","Подходит для крупных майнинговых центров и промышленных установок."],"cons":["Высокая стоимость.","Высокое энергопотребление требует продуманной инфраструктуры.","Не подходит для домашних условий или небольших ферм."]}$p72$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 73, 'heading',
       $p73${"level":2,"text":"Выводы"}$p73$::jsonb,
       'vyvody'
FROM articles a WHERE a.slug = 'rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 74, 'paragraph',
       $p74${"text":"Системы водяного охлаждения в асиках представляют собой современное и технологичное решение для эффективного управления тепловыделением оборудования при высоких нагрузках. По сравнению с традиционным воздушным охлаждением, они обеспечивают более стабильную работу устройств, снижают уровень шума и позволяют размещать оборудование с большей плотностью.","html":"Системы водяного охлаждения в асиках представляют собой современное и технологичное решение для эффективного управления тепловыделением оборудования при высоких нагрузках. По сравнению с традиционным воздушным охлаждением, они обеспечивают более стабильную работу устройств, снижают уровень шума и позволяют размещать оборудование с большей плотностью."}$p74$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 75, 'paragraph',
       $p75${"text":"Водяное охлаждение особенно актуально для промышленных майнинговых ферм, где важно поддерживать стабильную производительность и минимизировать риски перегрева. Однако внедрение таких систем требует дополнительных затрат на оборудование, монтаж и техническое обслуживание, а также наличия соответствующей квалификации персонала.","html":"Водяное охлаждение особенно актуально для промышленных майнинговых ферм, где важно поддерживать стабильную производительность и минимизировать риски перегрева. Однако внедрение таких систем требует дополнительных затрат на оборудование, монтаж и техническое обслуживание, а также наличия соответствующей квалификации персонала."}$p75$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 76, 'paragraph',
       $p76${"text":"В целом, использование водяного охлаждения оправдано при наличии крупных объемов майнингового оборудования, высокой плотности размещения и долгосрочной стратегии. В остальных случаях, особенно при маломасштабной добыче, более рациональным может оказаться использование традиционного воздушного охлаждения.","html":"В целом, использование водяного охлаждения оправдано при наличии крупных объемов майнингового оборудования, высокой плотности размещения и долгосрочной стратегии. В остальных случаях, особенно при маломасштабной добыче, более рациональным может оказаться использование традиционного воздушного охлаждения."}$p76$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 77, 'paragraph',
       $p77${"text":"Выбирая технику с жидкостным охлаждением, майнер вправе рассчитывать на высокую мощность и сниженный уровень шума. Однако каждая модель требует дополнительного оснащения в виде помпы, радиатора и/или иммерсионной ванны.","html":"Выбирая технику с жидкостным охлаждением, майнер вправе рассчитывать на высокую мощность и сниженный уровень шума. Однако каждая модель требует дополнительного оснащения в виде помпы, радиатора и/или иммерсионной ванны."}$p77$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 78, 'paragraph',
       $p78${"text":"ТОП-10 лучших асиков с водяным охлаждением в 2024 году выглядит следующим образом:","html":"ТОП-10 лучших асиков с водяным охлаждением в 2024 году выглядит следующим образом:"}$p78$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 79, 'list',
       $p79${"ordered":false,"items":["Antminer S19 XP Hydro","Whatsminer M66 Hydro и M66S Hydro","Whatsminer M63 Hydro и M63S Hydro","Antminer S21 Hydro","Antminer S23 Imm","Antminer S21 XP Hydro","Antminer U2L9H","Antminer L11 Hydro 6U","Antminer S21E XP Hyd 3U","Antminer S23 Hydro 3U"]}$p79$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov';

-- =====================================================================
-- 032_article_asic_manufacturers.sql
-- =====================================================================

-- Какие асики выбрать: ТОП-10 производителей оборудования для майнинга

INSERT INTO articles (
    slug, title, title_subtitle, excerpt, content, topic_id,
    reading_time_min, reading_minutes, published_at, view_count,
    display_type, sort_order, is_published, uses_blocks,
    image_url, image_alt
) VALUES (
    'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga',
    'Какие асики выбрать',
    'ТОП-10 производителей оборудования для майнинга',
    $excerpt$ТОП-10 производителей ASIC-оборудования для майнинга: от Goldshell до BITMAIN — как выбрать бренд.$excerpt$,
    $content$Введение

Покупка асика – это серьезная инвестиция, требующая продуманного подхода.

Выводы

При покупке нужно учитывать не только цену устройства, но и множество других важных параметров.$content$,
    'mining',
    15,
    15,
    '2024-10-15',
    3200,
    'list',
    60,
    TRUE,
    TRUE,
    '/images/articles/asic-manufacturers/bitmain.png',
    'BITMAIN'
)
ON CONFLICT (slug) DO UPDATE SET
    title = EXCLUDED.title,
    title_subtitle = EXCLUDED.title_subtitle,
    excerpt = EXCLUDED.excerpt,
    content = EXCLUDED.content,
    reading_time_min = EXCLUDED.reading_time_min,
    reading_minutes = EXCLUDED.reading_minutes,
    published_at = EXCLUDED.published_at,
    view_count = EXCLUDED.view_count,
    uses_blocks = TRUE,
    image_url = EXCLUDED.image_url,
    image_alt = EXCLUDED.image_alt,
    is_published = TRUE;

DELETE FROM article_blocks
WHERE article_id = (SELECT id FROM articles WHERE slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga');

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 1, 'heading',
       $p1${"level":2,"text":"Введение"}$p1$::jsonb,
       'vvedenie'
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 2, 'paragraph',
       $p2${"text":"Покупка асика – это серьезная инвестиция, требующая продуманного подхода. И один из ключевых факторов, который напрямую влияет на успех майнингового проекта – выбор бренда-производителя устройства. Сегодня мы познакомимся с тематикой выбора бренда майнера, а также изучим ключевых участников рынка майнингового оборудования.","html":"Покупка асика – это серьезная инвестиция, требующая продуманного подхода. И один из ключевых факторов, который напрямую влияет на успех майнингового проекта – выбор бренда-производителя устройства. Сегодня мы познакомимся с тематикой выбора бренда майнера, а также изучим ключевых участников рынка майнингового оборудования."}$p2$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 3, 'heading',
       $p3${"level":2,"text":"Как выбрать производителя асиков и на что это влияет?"}$p3$::jsonb,
       'kak-vybrat-proizvoditelya'
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 4, 'paragraph',
       $p4${"text":"На первый взгляд все ASIC-и похожи: корпус, шумные вентиляторы, цифры в характеристиках. Но на практике именно бренд определяет:","html":"На первый взгляд все ASIC-и похожи: корпус, шумные вентиляторы, цифры в характеристиках. Но на практике именно бренд определяет:"}$p4$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 5, 'list',
       $p5${"ordered":false,"items":["Как долго устройство проработает;","Насколько быстро решится гарантийный вопрос;","Как легко будет найти запчасти;","Какая общая доходность вас ждет."]}$p5$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 6, 'paragraph',
       $p6${"text":"Разберем подробно, что именно зависит от правильного выбора производителя.","html":"Разберем подробно, что именно зависит от правильного выбора производителя."}$p6$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 7, 'image',
       $p7${"src":"/images/articles/asic-manufacturers/circuit-board.png","alt":"Чип и платы ASIC-майнера"}$p7$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 8, 'rich_list',
       $p8${"ordered":false,"items":[{"title":"Надежность оборудования","text":"Что это значит: качественные бренды используют лучшие комплектующие, проверенные технологии охлаждения и сборки. Почему это важно: асик работает 24/7 в условиях высокой нагрузки и температуры. Надежное оборудование снижает риск поломок, простоя, потери дохода. Примеры: Bitmain славится высокой стабильностью моделей Antminer. WhatsMiner от MicroBT показывает отличную выносливость на длительных дистанциях;"},{"title":"Репутация производителя","text":"Что это значит: бренды с хорошей репутацией ценят своих клиентов и стремятся производить действительно качественные устройства. Почему это важно: надежная репутация снижает риск столкнуться с бракованным товаром, недобросовестной гарантией или несоответствием характеристик. Примеры: Bitmain и MicroBT — лидеры рынка с многолетним опытом. Молодые бренды без репутации могут привлекать ценой, но часто вызывают вопросы по качеству;"},{"title":"Условия гарантии и поддержки","text":"Что это значит: уважающие себя производители дают официальную гарантию и быстро обрабатывают гарантийные случаи. Почему это важно: при выходе асика из строя в первые месяцы гарантия – ваша защита от убытков. Примеры: Bitmain предлагает стандартную гарантию на 6 месяцев. MicroBT предлагает расширенную поддержку для некоторых моделей;"},{"title":"Наличие сервисных центров","text":"Что это значит: официальные или партнерские сервисные центры позволяют быстро и качественно ремонтировать оборудование. Почему это важно: отправка майнера в Китай или отсутствие ремонта в вашем регионе могут сделать обслуживание нерентабельным. Примеры: Bitmain имеет авторизованные сервисные центры в Азии, Европе и США. Некоторые производители работают через локальных партнеров, ускоряя процесс ремонта;"},{"title":"Доступность запчастей","text":"Что это значит: наличие в продаже вентиляторов, контроллеров, чипов, блоков питания для майнера. Почему это важно: мелкие ремонты без замены всего устройства могут существенно продлить срок службы ASIC. Примеры: для Antminer можно легко найти любые комплектующие. Редкие модели от малоизвестных брендов часто «умирают» без возможности восстановления;"},{"title":"Отзывы пользователей и сообществ","text":"Что это значит: реальные мнения майнеров, обсуждения на форумах, ютуб-обзоры дают реальное понимание плюсов и минусов моделей. Почему это важно: бренд с реальными отзывами – это меньше риск купить «кота в мешке»;"},{"title":"Возможность перепрошивки и настройки","text":"Что это значит: возможность безопасно обновить ПО устройства, разгонять, оптимизировать энергопотребление. Почему это важно: прошивки могут существенно повысить доходность или стабильность работы майнера. Примеры: Antminer имеет множество прошивок от сторонних разработчиков (например, Braiins OS). Некоторые ASIC-и не поддерживают сторонние обновления, что ограничивает возможности пользователя."}]}$p8$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 9, 'paragraph',
       $p9${"text":"Выбор правильного производителя асика – это инвестиция в долгосрочную надежность, стабильность дохода и спокойствие. Познакомимся с перечнем доступных брендов, чтобы совершить грамотное приобретение.","html":"Выбор правильного производителя асика – это инвестиция в долгосрочную надежность, стабильность дохода и спокойствие. Познакомимся с перечнем доступных брендов, чтобы совершить грамотное приобретение."}$p9$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 10, 'heading',
       $p10${"level":2,"text":"10 место: Goldshell"}$p10$::jsonb,
       'goldshell'
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 11, 'paragraph',
       $p11${"text":"В 2017 году появилась на свет компания Goldshell, специализирующаяся на производстве оборудования для майнинга. Бренд хорошо известен на рынке добычи криптовалют, однако навязать конкурентную борьбу лидерам майнинга на SHA-256 ему не удалось. Это заставило руководство Goldshell искать альтернативные пути развития: именно так китайский производитель начал разработку оборудования для получения специфических монет на разнообразных блокчейнах. Сегодня техника Goldshell успешно добывает токены на алгоритмах Blake2s, Scrypt, Eaglesong, Blake2B-Sia, Lbry, CryptoNightR и Eaglesong.","html":"В 2017 году появилась на свет компания Goldshell, специализирующаяся на производстве оборудования для майнинга. Бренд хорошо известен на рынке добычи криптовалют, однако навязать конкурентную борьбу лидерам майнинга на SHA-256 ему не удалось. Это заставило руководство Goldshell искать альтернативные пути развития: именно так китайский производитель начал разработку оборудования для получения специфических монет на разнообразных блокчейнах. Сегодня техника Goldshell успешно добывает токены на алгоритмах Blake2s, Scrypt, Eaglesong, Blake2B-Sia, Lbry, CryptoNightR и Eaglesong."}$p11$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 12, 'paragraph',
       $p12${"text":"Наибольшую популярность компания Goldshell обрела на рынке Азии, но и в России данного производителя отлично знают. Тем не менее, технику данного бренда сложно назвать популярной в СНГ, так как добыча альтов всегда сопряжена с рисками. Но заказать асики все же можно, и в первую очередь это актуально для моделей, добывающих Kadena на алгоритме Blake2s. Потенциал этой валюты изведан не до конца, поэтому перспективы ее добычи остаются весьма ощутимыми.","html":"Наибольшую популярность компания Goldshell обрела на рынке Азии, но и в России данного производителя отлично знают. Тем не менее, технику данного бренда сложно назвать популярной в СНГ, так как добыча альтов всегда сопряжена с рисками. Но заказать асики все же можно, и в первую очередь это актуально для моделей, добывающих Kadena на алгоритме Blake2s. Потенциал этой валюты изведан не до конца, поэтому перспективы ее добычи остаются весьма ощутимыми."}$p12$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 13, 'image',
       $p13${"src":"/images/articles/asic-manufacturers/goldshell.png","alt":"Goldshell BOX Series"}$p13$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 14, 'stats',
       $p14${"rows":[{"label":"Страна производителя","value":"Китай"},{"label":"Дата основания","value":"2017"},{"label":"Бренд","value":"Goldshell"},{"label":"Устройств в модельном ряде","value":"более 20"},{"label":"Какой асик купить","value":"Goldshell KD5 (майнинг KDA с оптимальной энергоэффективностью)"},{"label":"Какой асик лучше (ТОПовая модель)","value":"Goldshell KD6 на 26,3 ТХ/с"},{"label":"Алгоритмы асиков","value":"Blake2s, Scrypt, Eaglesong, Blake2B-Sia, Lbry, CryptoNightR и Eaglesong"}]}$p14$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 15, 'heading',
       $p15${"level":2,"text":"9 место: SealMiner"}$p15$::jsonb,
       'sealminer'
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 16, 'paragraph',
       $p16${"text":"SealMiner — это молодой бренд (основан в 2024 году), но за ним стоит инфраструктура, опыт и репутация Bitdeer, что делает его одним из самых обсуждаемых и многообещающих участников рынка ASIC-оборудования. SealMiner сосредоточен на производстве асиков под алгоритм SHA-256, а значит его предназначение – майнинг Bitcoin. Но если многие компании стремятся просто нарастить хешрейт, SealMiner делает ставку на энергоэффективность и технологии охлаждения.","html":"SealMiner — это молодой бренд (основан в 2024 году), но за ним стоит инфраструктура, опыт и репутация Bitdeer, что делает его одним из самых обсуждаемых и многообещающих участников рынка ASIC-оборудования. SealMiner сосредоточен на производстве асиков под алгоритм SHA-256, а значит его предназначение – майнинг Bitcoin. Но если многие компании стремятся просто нарастить хешрейт, SealMiner делает ставку на энергоэффективность и технологии охлаждения."}$p16$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 17, 'paragraph',
       $p17${"text":"SealMiner — это производитель, который пришел не просто продавать майнеры, а внедрять инженерные решения, способные менять экономику добычи BTC. Комбинация энергоэффективности, продуманной системы охлаждения и поддержки от Bitdeer делает бренд особенно привлекательным для тех, кто рассматривает долгосрочное инвестирование в майнинг.","html":"SealMiner — это производитель, который пришел не просто продавать майнеры, а внедрять инженерные решения, способные менять экономику добычи BTC. Комбинация энергоэффективности, продуманной системы охлаждения и поддержки от Bitdeer делает бренд особенно привлекательным для тех, кто рассматривает долгосрочное инвестирование в майнинг."}$p17$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 18, 'image',
       $p18${"src":"/images/articles/asic-manufacturers/sealminer.png","alt":"SealMiner / Bitdeer"}$p18$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 19, 'stats',
       $p19${"rows":[{"label":"Страна производителя","value":"США"},{"label":"Дата основания","value":"2024 год"},{"label":"Бренд","value":"SealMiner"},{"label":"Количество устройств в линейке","value":"около 10"},{"label":"Какой ASIC купить","value":"SealMiner A3 (оптимален по эффективности и уровню хешрейта)"},{"label":"Какой ASIC лучше (ТОП-модель)","value":"Sealminer A3 Pro Hydro на 660 Th/s"},{"label":"Алгоритмы ASIC","value":"SHA-256"}]}$p19$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 20, 'pros_cons',
       $p20${"pros":["Один из лучших показателей энергоэффективности на рынке;","Поддержка воздушного и водяного охлаждения – выбор под инфраструктуру;","Подходит как для крупных ферм, так и профессиональных майнеров;","Низкий уровень шума относительно мощности;","Прямая поддержка и технологическая база Bitdeer."],"cons":["Молодой бренд, который еще только формирует репутацию на практике;","Высокая стоимость оборудования, характерная для премиум-сегмента;","Ограниченная доступность в продаже и возможные очереди на поставку."]}$p20$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 21, 'heading',
       $p21${"level":2,"text":"8 место: IceRiver"}$p21$::jsonb,
       'iceriver'
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 22, 'paragraph',
       $p22${"text":"Китайская компания IceRiver уникальна в своем роде: модельный ряд производителя состоит из шести устройств, которые были разработаны для добычи одной единственной монеты – KASPA на алгоритме kHeavyHash. Молодой производитель решил не конкурировать с именитыми брендами, а просто пошел своей дорогой, избрав бесконкурентную сферу KASPA. Таким образом, если майнер принимает решение добывать этот токен, ему не придется выбирать среди многочисленных производителей, так как вариант на рынке только один.","html":"Китайская компания IceRiver уникальна в своем роде: модельный ряд производителя состоит из шести устройств, которые были разработаны для добычи одной единственной монеты – KASPA на алгоритме kHeavyHash. Молодой производитель решил не конкурировать с именитыми брендами, а просто пошел своей дорогой, избрав бесконкурентную сферу KASPA. Таким образом, если майнер принимает решение добывать этот токен, ему не придется выбирать среди многочисленных производителей, так как вариант на рынке только один."}$p22$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 23, 'paragraph',
       $p23${"text":"С одной стороны небольшая конкуренция в нише интересна не только производителю IceRiver, но и майнерам, так как небольшая сложность сети позволяет зарабатывать больше. Но с другой – появляются дополнительные риски в виде скама монеты или серьезного падения курса: в этом случае оборудование для получения KASPA превратится в груду металла. Причем, весьма дорогостоящую.","html":"С одной стороны небольшая конкуренция в нише интересна не только производителю IceRiver, но и майнерам, так как небольшая сложность сети позволяет зарабатывать больше. Но с другой – появляются дополнительные риски в виде скама монеты или серьезного падения курса: в этом случае оборудование для получения KASPA превратится в груду металла. Причем, весьма дорогостоящую."}$p23$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 24, 'image',
       $p24${"src":"/images/articles/asic-manufacturers/iceriver.png","alt":"IceRiver"}$p24$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 25, 'stats',
       $p25${"rows":[{"label":"Страна производителя","value":"Китай"},{"label":"Дата основания","value":"Нет данных"},{"label":"Бренд","value":"IceRiver"},{"label":"Устройств в модельном ряде","value":"6"},{"label":"Какой асик купить","value":"IceRiver KAS KS2 (оптимально по соотношению стоимости оборудования к производительности)"},{"label":"Какой асик лучше (ТОПовая модель)","value":"IceRiver KAS KS2 на 8 ТХ/с"},{"label":"Алгоритмы асиков","value":"kHeavyHash"}]}$p25$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 26, 'pros_cons',
       $p26${"pros":["Малоконкурентная сфера – возможность зарабатывать больше, чем на других алгоритмах;","Отсутствие проблемы выбора производителя: майнинг KASPA возможен только на асиках от IceRiver."],"cons":["Молодой и непроверенный производитель;","Риски майнинга не самых популярных монет;","Возможность добычи лишь одного токена;","Высокая стоимость ТОПовых моделей."]}$p26$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 27, 'heading',
       $p27${"level":2,"text":"7 место: Sunlune Technology"}$p27$::jsonb,
       'sunlune'
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 28, 'paragraph',
       $p28${"text":"Название Sunlune Technology практически ни о чем не говорит отечественным майнерам, так как компания лишь недавно вышла на рынок майнинга. Более узнаваемо звучит бренд асиков, под которым китайский производитель выпускает технику – Jasminer. Речь идет про линейку аппаратуры для добычи альткоинов: Jasminer работают на алгоритмах EtHash и EtcHash, что позволяет добывать около четырех десятков монет.","html":"Название Sunlune Technology практически ни о чем не говорит отечественным майнерам, так как компания лишь недавно вышла на рынок майнинга. Более узнаваемо звучит бренд асиков, под которым китайский производитель выпускает технику – Jasminer. Речь идет про линейку аппаратуры для добычи альткоинов: Jasminer работают на алгоритмах EtHash и EtcHash, что позволяет добывать около четырех десятков монет."}$p28$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 29, 'paragraph',
       $p29${"text":"Продукция Jasminer обращает на себя внимание отличными показателями энергоэффективности – это одно из лучших значений на рынке. Кроме того, есть модели и для домашней эксплуатации с небольшим объемом потребления и низким уровнем шума. И это уже не компактные iPollo, а производительные асики мощностью около 2 000 МХ/с. Данный фактор является причиной ощутимой популярности Jasminer среди майнеров даже несмотря на небольшую известность бренда.","html":"Продукция Jasminer обращает на себя внимание отличными показателями энергоэффективности – это одно из лучших значений на рынке. Кроме того, есть модели и для домашней эксплуатации с небольшим объемом потребления и низким уровнем шума. И это уже не компактные iPollo, а производительные асики мощностью около 2 000 МХ/с. Данный фактор является причиной ощутимой популярности Jasminer среди майнеров даже несмотря на небольшую известность бренда."}$p29$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 30, 'image',
       $p30${"src":"/images/articles/asic-manufacturers/jasminer.png","alt":"Jasminer X16-Q Pro"}$p30$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 31, 'stats',
       $p31${"rows":[{"label":"Страна производителя","value":"Китай"},{"label":"Дата основания","value":"Нет данных"},{"label":"Бренд","value":"Jasminer"},{"label":"Устройств в модельном ряде","value":"до 10"},{"label":"Какой асик купить","value":"Jasminer X16-Q (комфортный домашний майнинг – 1 950 МХ/с, 620 Ватт потребления и всего 40 дБ шума)"},{"label":"Какой асик лучше (ТОПовая модель)","value":"Jasminer X16-P на 5 800 МХ/с"},{"label":"Алгоритмы асиков","value":"EtHash, EtcHash"}]}$p31$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 32, 'pros_cons',
       $p32${"pros":["Формат полноценного домашнего майнинга;","Один из лучших параметров энергоэффективности на рынке."],"cons":["Малоизвестный производитель;","Высокая стоимость оборудования;","Сложности с ремонтом и обслуживанием."]}$p32$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 33, 'heading',
       $p33${"level":2,"text":"6 место: iPollo"}$p33$::jsonb,
       'ipollo'
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 34, 'paragraph',
       $p34${"text":"Сингапурская компания iPollo – одна из наиболее молодых в нашем рейтинге: бренд был основан в 2022 году и за небольшой промежуток времени громко заявил о себе мировой общественности. Несмотря на полноценную линейку оборудования, особое внимание обращает на себя модель V1 Mini, созданная специально для домашнего майнинга. Пять устройств серии отличаются низким объемом потребления и практически бесшумной работой, что возможно в том числе благодаря ориентации на алгоритм Ethash.","html":"Сингапурская компания iPollo – одна из наиболее молодых в нашем рейтинге: бренд был основан в 2022 году и за небольшой промежуток времени громко заявил о себе мировой общественности. Несмотря на полноценную линейку оборудования, особое внимание обращает на себя модель V1 Mini, созданная специально для домашнего майнинга. Пять устройств серии отличаются низким объемом потребления и практически бесшумной работой, что возможно в том числе благодаря ориентации на алгоритм Ethash."}$p34$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 35, 'paragraph',
       $p35${"text":"В целом, фокус продукции iPollo сделан именно на этот алгоритм, в то время как другие стандарты представлены больше в экспериментальном формате. Например, есть один асик для добычи BTC, а также модель для работы с Cuckatoo32 (монета GRIN). Можно обратить внимание на классические асики под Ethash – здесь iPollo выглядят конкурентоспособными, но молодость бренда может отпугнуть многих покупателей.","html":"В целом, фокус продукции iPollo сделан именно на этот алгоритм, в то время как другие стандарты представлены больше в экспериментальном формате. Например, есть один асик для добычи BTC, а также модель для работы с Cuckatoo32 (монета GRIN). Можно обратить внимание на классические асики под Ethash – здесь iPollo выглядят конкурентоспособными, но молодость бренда может отпугнуть многих покупателей."}$p35$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 36, 'image',
       $p36${"src":"/images/articles/asic-manufacturers/ipollo.png","alt":"iPollo"}$p36$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 37, 'stats',
       $p37${"rows":[{"label":"Страна производителя","value":"Сингапур"},{"label":"Дата основания","value":"2022 год"},{"label":"Бренд","value":"iPollo"},{"label":"Устройств в модельном ряде","value":"до 20"},{"label":"Какой асик купить","value":"iPollo V1 Mini (компактный, бесшумный и не прожорливый асик для домашнего майнинга)"},{"label":"Какой асик лучше (ТОПовая модель)","value":"Ipollo G1 на алгоритме Cuckatoo32 для добычи монеты Grin"},{"label":"Алгоритмы асиков","value":"SHA-256, Ethash, Cuckatoo32"}]}$p37$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 38, 'pros_cons',
       $p38${"pros":["Интересная линейка V1 Mini для домашнего майнинга;","Цены ниже, чем у конкурентов;","Стремительно развивающаяся компания, которой удалось громко заявить о себе за небольшой промежуток времени;","Работа с экспериментальными форматами, например, наличие асика на Cuckatoo32."],"cons":["Техника от молодого бренда, не проверенная временем;","Трудности с ремонтом и приобретением комплектующих."]}$p38$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 39, 'heading',
       $p39${"level":2,"text":"5 место: Innosilicon"}$p39$::jsonb,
       'innosilicon'
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 40, 'paragraph',
       $p40${"text":"Начало существования компании Innosilicon было положено в 2006 году – тогда китайский бренд занимался производством полупроводников для компьютерной и ИТ-отраслей. Позже с появлением института майнинга бренд переключил свое внимание на выпуск техники для добычи криптовалют, чем Innosilicon зарабатывает и сегодня. Но несмотря на впечатляющий опыт, традиции и знание ниши, модельный ряд бренда в последние годы начал проигрывать борьбу конкурентам, уступая позиции более современным производителям.","html":"Начало существования компании Innosilicon было положено в 2006 году – тогда китайский бренд занимался производством полупроводников для компьютерной и ИТ-отраслей. Позже с появлением института майнинга бренд переключил свое внимание на выпуск техники для добычи криптовалют, чем Innosilicon зарабатывает и сегодня. Но несмотря на впечатляющий опыт, традиции и знание ниши, модельный ряд бренда в последние годы начал проигрывать борьбу конкурентам, уступая позиции более современным производителям."}$p40$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 41, 'paragraph',
       $p41${"text":"Причиной падающей популярности Innosilicon являются проблемы с энергоэффективностью устройств, что негативным образом сказывается на сроках окупаемости оборудования. Вероятно, именно по этой причине компания практически отказалась от работы с алгоритмом SHA-256, обратив свое внимание на аппаратуру для майнинга альткоинов. Сегодня Innosilicon предлагает устройства не только для BTC, но и асики на алгоритмах Equihash, Ethash и Scrypt.","html":"Причиной падающей популярности Innosilicon являются проблемы с энергоэффективностью устройств, что негативным образом сказывается на сроках окупаемости оборудования. Вероятно, именно по этой причине компания практически отказалась от работы с алгоритмом SHA-256, обратив свое внимание на аппаратуру для майнинга альткоинов. Сегодня Innosilicon предлагает устройства не только для BTC, но и асики на алгоритмах Equihash, Ethash и Scrypt."}$p41$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 42, 'image',
       $p42${"src":"/images/articles/asic-manufacturers/innosilicon.png","alt":"Innosilicon"}$p42$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 43, 'stats',
       $p43${"rows":[{"label":"Страна производителя","value":"Китай"},{"label":"Дата основания","value":"2006 год"},{"label":"Бренд","value":"Innosilicon"},{"label":"Устройств в модельном ряде","value":"до 15"},{"label":"Какой асик купить","value":"Innosilicon A11 Pro (один из немногих асиков компании, работающий с ощутимой выгодой на рынке)"},{"label":"Какой асик лучше (ТОПовая модель)","value":"Innosilicon A11 Pro мощностью 1 500 МХ/с"},{"label":"Алгоритмы асиков","value":"SHA-256, Equihash, Ethash и Scrypt"}]}$p43$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 44, 'pros_cons',
       $p44${"pros":["Старейший бренд с богатой историей;","Недорогая продукция;","Хороший уровень надежности;","Множество алгоритмов работы."],"cons":["Скромная энергоэффективность оборудования;","Отсутствие действительно выгодных моделей (особенно для BTC);","Стратегические ошибки и как результат – утрата позиций в конкурентной борьбе."]}$p44$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 45, 'heading',
       $p45${"level":2,"text":"4 место: Canaan"}$p45$::jsonb,
       'canaan'
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 46, 'paragraph',
       $p46${"text":"По неофициальным данным первый в мире асик был разработан в 2013 году именно китайской компанией Canaan в год своего основания. Несмотря на инновационный подход к добыче и постоянному развитию, этот изготовитель находится в тени своих более популярных соперников, хотя техника AvalonMiner (собственный бренд Canaan) является вполне конкурентоспособной. Продукция компании никогда не находилась на первых строчках рейтингов по совокупному объему продаж, но это не мешает фирме выпускать современные и энергоэффективные асики.","html":"По неофициальным данным первый в мире асик был разработан в 2013 году именно китайской компанией Canaan в год своего основания. Несмотря на инновационный подход к добыче и постоянному развитию, этот изготовитель находится в тени своих более популярных соперников, хотя техника AvalonMiner (собственный бренд Canaan) является вполне конкурентоспособной. Продукция компании никогда не находилась на первых строчках рейтингов по совокупному объему продаж, но это не мешает фирме выпускать современные и энергоэффективные асики."}$p46$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 47, 'paragraph',
       $p47${"text":"Canaan специализируется на технике с алгоритмом SHA-256: модельный ряд AvalonMiner состоит почти из 20 устройств, а их стоимость несколько ниже аналогов у конкурентов. Наиболее производительной сегодня является 14-я серия от Canaan: например, модель A1466 демонстрирует мощность 150 TХ/с. Производитель не стремится ставить рекорды хешрейта, так как выиграть конкурентную борьбу у именитых брендов в этом сегменте крайне сложно. Поэтому ключевой рынок для Canaan – это асики начального уровня и продукция среднего класса.","html":"Canaan специализируется на технике с алгоритмом SHA-256: модельный ряд AvalonMiner состоит почти из 20 устройств, а их стоимость несколько ниже аналогов у конкурентов. Наиболее производительной сегодня является 14-я серия от Canaan: например, модель A1466 демонстрирует мощность 150 TХ/с. Производитель не стремится ставить рекорды хешрейта, так как выиграть конкурентную борьбу у именитых брендов в этом сегменте крайне сложно. Поэтому ключевой рынок для Canaan – это асики начального уровня и продукция среднего класса."}$p47$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 48, 'image',
       $p48${"src":"/images/articles/asic-manufacturers/canaan.png","alt":"Canaan AvalonMiner"}$p48$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 49, 'stats',
       $p49${"rows":[{"label":"Страна производителя","value":"Китай"},{"label":"Дата основания","value":"2013 год"},{"label":"Бренд","value":"AvalonMiner"},{"label":"Устройств в модельном ряде","value":"до 20"},{"label":"Какой асик купить","value":"Avalon A1346 (мощный и относительно недорогой майнер для добычи BTC)"},{"label":"Какой асик лучше (ТОПовая модель)","value":"Avalon A16XP на 300 TH/s"},{"label":"Алгоритмы асиков","value":"SHA-256"}]}$p49$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 50, 'pros_cons',
       $p50${"pros":["Один из старейших производителей асиков с богатыми традициями;","Неофициальное звание первопроходца, выпустившего первый в мире асик;","Хорошая надежность техники;","Стоимость оборудования ниже, чем у конкурентов."],"cons":["Пользователи жалуются на снижение заявленной производительности чипов со временем;","Дорогостоящий ремонт и возможные проблемы с комплектующими."]}$p50$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 51, 'heading',
       $p51${"level":2,"text":"3 место: ElphaPex"}$p51$::jsonb,
       'elphapex'
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 52, 'paragraph',
       $p52${"text":"ElphaPex — это не громогласный лидер рынка, но уверенный игрок, который постепенно собирает вокруг себя сообщество майнеров, ценящих практичность, энергоэффективность и стабильную работу оборудования. Особенно бренд интересен тем, кто видит перспективу в долгосрочной добыче Litecoin и Dogecoin, где узкая специализация иногда важнее многофункциональности. Этот производитель специализируется исключительно на ASIC-устройствах под алгоритм Scrypt, а значит, его техника предназначена для добычи самых популярных монет семейства: Litecoin и Dogecoin.","html":"ElphaPex — это не громогласный лидер рынка, но уверенный игрок, который постепенно собирает вокруг себя сообщество майнеров, ценящих практичность, энергоэффективность и стабильную работу оборудования. Особенно бренд интересен тем, кто видит перспективу в долгосрочной добыче Litecoin и Dogecoin, где узкая специализация иногда важнее многофункциональности. Этот производитель специализируется исключительно на ASIC-устройствах под алгоритм Scrypt, а значит, его техника предназначена для добычи самых популярных монет семейства: Litecoin и Dogecoin."}$p52$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 53, 'paragraph',
       $p53${"text":"Сосредоточенность на узкой нише позволяет компании тщательно отточить параметры оборудования: баланс мощности, энергоэффективность и стабильная работа стали ключевой философией разработчиков. ElphaPex активно поддерживает пользователей: фирменная гарантия, доступность сервисов и техническая поддержка — это не маркетинговая надпись, а рабочий инструмент бренда в борьбе за доверие комьюнити.","html":"Сосредоточенность на узкой нише позволяет компании тщательно отточить параметры оборудования: баланс мощности, энергоэффективность и стабильная работа стали ключевой философией разработчиков. ElphaPex активно поддерживает пользователей: фирменная гарантия, доступность сервисов и техническая поддержка — это не маркетинговая надпись, а рабочий инструмент бренда в борьбе за доверие комьюнити."}$p53$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 54, 'image',
       $p54${"src":"/images/articles/asic-manufacturers/elphapex.png","alt":"ElphaPex Miner"}$p54$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 55, 'stats',
       $p55${"rows":[{"label":"Страна производителя","value":"Китай"},{"label":"Дата основания","value":"2005"},{"label":"Бренд","value":"ElphaPex"},{"label":"Количество устройств в линейке","value":"около 10"},{"label":"Какой ASIC купить","value":"ElphaPex DG Home 1 (эффективный майнер Scrypt для дома и фермы)"},{"label":"Какой ASIC лучше (ТОП-модель)","value":"ElphaPex DG2 на 20 000 Mh/s"},{"label":"Алгоритмы ASIC","value":"Scrypt"}]}$p55$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 56, 'pros_cons',
       $p56${"pros":["Сосредоточенность на алгоритме Scrypt и оптимизация оборудования под LTC и DOGE;","Высокая энергоэффективность по сравнению с аналогами;","Полноценная гарантия и техническая поддержка;","Есть асики как на водяном, так и воздушном охлаждении."],"cons":["Узкая специализация: оборудование подходит только для майнинга на Scrypt;","Молодой бренд, который пока не доказал надежность временем;","Ограниченный выбор моделей в сравнении с гигантами индустрии."]}$p56$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 57, 'heading',
       $p57${"level":2,"text":"2 место: MicroBT"}$p57$::jsonb,
       'microbt'
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 58, 'paragraph',
       $p58${"text":"Основателем компании MicroBT является инженер Ян Цзосин, который до 2016 года работал в BITMAIN, а затем принял решение создать собственное предприятие по производству техники для майнинга. Примечательно, что Ян Цзосин является непосредственным участником разработки модели Antminer S9, поэтому его личность можно назвать культовой для мира майнинга. Тем не менее, дороги BITMAIN и специалиста разошлись – так на свет появился новый участник рынка.","html":"Основателем компании MicroBT является инженер Ян Цзосин, который до 2016 года работал в BITMAIN, а затем принял решение создать собственное предприятие по производству техники для майнинга. Примечательно, что Ян Цзосин является непосредственным участником разработки модели Antminer S9, поэтому его личность можно назвать культовой для мира майнинга. Тем не менее, дороги BITMAIN и специалиста разошлись – так на свет появился новый участник рынка."}$p58$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 59, 'paragraph',
       $p59${"text":"Продукция MicroBT выпускается под брендом Whatsminer – марка, которая не только хорошо знакома майнерам, но и является эталоном надежности. Продукция Whatsminer уверенно занимает почетное второе место в сегменте техники для майнинга, а легендарную линейку моделей Whatsminer M21S знает каждый. Самым производительным асиком компании сегодня является Whatsminer M53S++ на 320 TХ/с. Стоит отметить, что MicroBT по сей день является прямым конкурентом BITMAIN, поэтому ассортимент обоих брендов схож.","html":"Продукция MicroBT выпускается под брендом Whatsminer – марка, которая не только хорошо знакома майнерам, но и является эталоном надежности. Продукция Whatsminer уверенно занимает почетное второе место в сегменте техники для майнинга, а легендарную линейку моделей Whatsminer M21S знает каждый. Самым производительным асиком компании сегодня является Whatsminer M53S++ на 320 TХ/с. Стоит отметить, что MicroBT по сей день является прямым конкурентом BITMAIN, поэтому ассортимент обоих брендов схож."}$p59$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 60, 'image',
       $p60${"src":"/images/articles/asic-manufacturers/microbt-whatsminer.png","alt":"MicroBT WhatsMiner"}$p60$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 61, 'stats',
       $p61${"rows":[{"label":"Страна производителя","value":"Китай"},{"label":"Дата основания","value":"2016 год"},{"label":"Бренд","value":"Whatsminer"},{"label":"Устройств в модельном ряде","value":"более 20"},{"label":"Какой асик купить","value":"Whatsminer M50 (бестселлер бренда на сегодняшний день)"},{"label":"Какой асик лучше (ТОПовая модель)","value":"WhatsMiner M63S++ 464 Тх/с"},{"label":"Алгоритмы асиков","value":"SHA-256"}]}$p61$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 62, 'pros_cons',
       $p62${"pros":["Второй по популярности мировой бренд;","Репутация производителя качественной и надежной техники;","Достойный модельный ряд;","Доступность запчастей и сервисных центров."],"cons":["Переплата за бренд;","По отзывам пользователей, асики Whatsminer отличаются повышенным уровнем шума по сравнению с конкурентами."]}$p62$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 63, 'heading',
       $p63${"level":2,"text":"1 место: BITMAIN"}$p63$::jsonb,
       'bitmain'
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 64, 'paragraph',
       $p64${"text":"Китайская компания BITMAIN была основана в 2013 году, а сегодня производитель удерживает 75-процентную долю рынка по продаже и обслуживанию техники для майнинга. Головное предприятие располагается в Пекине, а представительства бренда ведут свою деятельность в Сингапуре, Гонконге и США. Продукция BITMAIN известна майнерам под названием Antminer – это более двух десятков моделей, используемых для добычи BTC, ETC, LTC, DOGE, KDA и других монет на алгоритмах SHA-256, Scrypt, Kadena и EtHash.","html":"Китайская компания BITMAIN была основана в 2013 году, а сегодня производитель удерживает 75-процентную долю рынка по продаже и обслуживанию техники для майнинга. Головное предприятие располагается в Пекине, а представительства бренда ведут свою деятельность в Сингапуре, Гонконге и США. Продукция BITMAIN известна майнерам под названием Antminer – это более двух десятков моделей, используемых для добычи BTC, ETC, LTC, DOGE, KDA и других монет на алгоритмах SHA-256, Scrypt, Kadena и EtHash."}$p64$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 65, 'paragraph',
       $p65${"text":"Первой моделью асика от компании BITMAIN является Antminer S1, выпущенный в 2013 году. Сегодня совокупный модельный ряд производителя насчитывает более двух десятков вариантов техники, включая современные Antminer T21, Antminer S21 и даже Antminer S21 Hyd с водяным охлаждением. А легендарными моделями BITMAIN являются «неубиваемые» Antminer S9, а также 19-я серия, появившаяся в 2020 году и актуальная до сих пор.","html":"Первой моделью асика от компании BITMAIN является Antminer S1, выпущенный в 2013 году. Сегодня совокупный модельный ряд производителя насчитывает более двух десятков вариантов техники, включая современные Antminer T21, Antminer S21 и даже Antminer S21 Hyd с водяным охлаждением. А легендарными моделями BITMAIN являются «неубиваемые» Antminer S9, а также 19-я серия, появившаяся в 2020 году и актуальная до сих пор."}$p65$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 66, 'image',
       $p66${"src":"/images/articles/asic-manufacturers/bitmain.png","alt":"BITMAIN Antminer"}$p66$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 67, 'stats',
       $p67${"rows":[{"label":"Страна производителя","value":"Китай"},{"label":"Дата основания","value":"2013 год"},{"label":"Бренд","value":"Antminer"},{"label":"Устройств в модельном ряде","value":"более 20"},{"label":"Какой асик купить","value":"Antminer S21 (оптимальное соотношение цены и эффективности)"},{"label":"Какой асик лучше (ТОПовая модель)","value":"Antminer S23 Hydro 3U на 1.16 PH/s"},{"label":"Алгоритмы асиков","value":"SHA-256, Scrypt, Kadena и EtHash"}]}$p67$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 68, 'pros_cons',
       $p68${"pros":["Один из старейших производителей асиков и лидер рынка;","Внушительный модельный ряд, включая разные алгоритмы майнинга;","Высокая конкуренция среди магазинов, продающих Antminer – это положительным образом влияет на цены;","Доступность запчастей и сервисных центров;","Хорошая репутация бренда и высокое качество продукции."],"cons":["Встречались случаи выпуска неудачных моделей, например, 17-я линейка Antminer;","Переплата за бренд."]}$p68$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 69, 'heading',
       $p69${"level":2,"text":"Выводы"}$p69$::jsonb,
       'vyvody'
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 70, 'paragraph',
       $p70${"text":"При покупке нужно учитывать не только цену устройства, но и множество других важных параметров. Среди них:","html":"При покупке нужно учитывать не только цену устройства, но и множество других важных параметров. Среди них:"}$p70$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 71, 'list',
       $p71${"ordered":false,"items":["Проверенная репутация бренда;","Условия гарантии и поддержка;","Наличие сервисных центров и запчастей;","Реальный опыт пользователей;","Возможности оптимизации через прошивки."]}$p71$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 72, 'paragraph',
       $p72${"text":"Рекомендуемые бренды для покупки сегодня: Bitmain (Antminer) – золотой стандарт индустрии, MicroBT (WhatsMiner) – мощные и надежные устройства, iPollo и Goldshell – хорошие решения для специфичных алгоритмов и домашних условий.","html":"Рекомендуемые бренды для покупки сегодня: Bitmain (Antminer) – золотой стандарт индустрии, MicroBT (WhatsMiner) – мощные и надежные устройства, iPollo и Goldshell – хорошие решения для специфичных алгоритмов и домашних условий."}$p72$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

-- =====================================================================
-- 033_article_kaspa_asics.sql
-- =====================================================================

-- Лучшие асики для майнинга Каспы: ТОП-5

INSERT INTO articles (
    slug, title, title_subtitle, excerpt, content, topic_id,
    reading_time_min, reading_minutes, published_at, view_count,
    display_type, sort_order, is_published, uses_blocks,
    image_url, image_alt
) VALUES (
    'luchshie-asiki-dlya-majninga-kaspy-top-5',
    'Лучшие асики для майнинга Каспы',
    'ТОП-5',
    $excerpt$ТОП-5 лучших асиков для майнинга Kaspa (KAS) на алгоритме kHeavyHash: от тихого IceRiver KS0 до мощного Antminer KS7 40T.$excerpt$,
    $content$Введение

Рост хэшрейта сети Bitcoin и недавний халвинг BTC вынуждает многих майнеров искать альтернативные активы для добычи.

Выводы

Если вы ищете актуальный и выгодный проект для майнинга – Kaspa (KAS) стоит рассмотреть.$content$,
    'mining',
    8,
    8,
    '2023-03-02',
    994,
    'list',
    20,
    TRUE,
    TRUE,
    '/images/articles/kaspa-asics/antminer-ks7.png',
    'Antminer KS7 40T'
)
ON CONFLICT (slug) DO UPDATE SET
    title = EXCLUDED.title,
    title_subtitle = EXCLUDED.title_subtitle,
    excerpt = EXCLUDED.excerpt,
    content = EXCLUDED.content,
    reading_time_min = EXCLUDED.reading_time_min,
    reading_minutes = EXCLUDED.reading_minutes,
    published_at = EXCLUDED.published_at,
    view_count = EXCLUDED.view_count,
    uses_blocks = TRUE,
    image_url = EXCLUDED.image_url,
    image_alt = EXCLUDED.image_alt,
    is_published = TRUE;

DELETE FROM article_blocks
WHERE article_id = (SELECT id FROM articles WHERE slug = 'luchshie-asiki-dlya-majninga-kaspy-top-5');

UPDATE rating_items
SET href = '/articles/luchshie-asiki-dlya-majninga-kaspy-top-5',
    label = 'Лучшие асики для майнинга Каспы: ТОП-5'
WHERE href LIKE '%luchshie-asiki-dlya-majninga-kaspy%'
   OR label ILIKE '%Каспы%';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 1, 'heading',
       $p1${"level":2,"text":"Введение"}$p1$::jsonb,
       'vvedenie'
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-kaspy-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 2, 'paragraph',
       $p2${"text":"Рост хэшрейта сети Bitcoin и недавний халвинг BTC вынуждает многих майнеров искать альтернативные активы для добычи. Одним из наиболее популярных вариантов является монета Каспа, (Kaspa, KAS), которая вычисляется на алгоритме kHeavyHash. Сам по себе формат относительно новый и количество профильных токенов небольшое. Однако именно низкая конкуренция в сети привлекает новых майнеров, стремящихся отдать свое предпочтение Kaspa. Расскажем о пяти лучших асиков для добычи KAS, проанализируем их преимущества и недостатки.","html":"Рост хэшрейта сети Bitcoin и недавний халвинг BTC вынуждает многих майнеров искать альтернативные активы для добычи. Одним из наиболее популярных вариантов является монета Каспа, (Kaspa, KAS), которая вычисляется на алгоритме kHeavyHash. Сам по себе формат относительно новый и количество профильных токенов небольшое. Однако именно низкая конкуренция в сети привлекает новых майнеров, стремящихся отдать свое предпочтение Kaspa. Расскажем о пяти лучших асиков для добычи KAS, проанализируем их преимущества и недостатки."}$p2$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-kaspy-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 3, 'heading',
       $p3${"level":2,"text":"Как майнить Kaspa?"}$p3$::jsonb,
       'kak-majnit-kaspa'
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-kaspy-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 4, 'paragraph',
       $p4${"text":"Майнинг Kaspa осуществляется по классической схеме Proof-of-Work с использованием алгоритма kHeavyHash. Этот алгоритм разработан таким образом, чтобы быть энергоэффективным и лучше всего подходить для GPU и ASIC-майнеров нового поколения.","html":"Майнинг Kaspa осуществляется по классической схеме Proof-of-Work с использованием алгоритма kHeavyHash. Этот алгоритм разработан таким образом, чтобы быть энергоэффективным и лучше всего подходить для GPU и ASIC-майнеров нового поколения."}$p4$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-kaspy-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 5, 'paragraph',
       $p5${"text":"Основные способы майнинга:","html":"Основные способы майнинга:"}$p5$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-kaspy-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 6, 'rich_list',
       $p6${"ordered":true,"items":[{"title":"Соло-майнинг","text":"требует собственного полного узла, высокая сложность, редко используется;"},{"title":"Майнинг в пуле","text":"самый популярный способ, стабильные выплаты, меньший риск."}]}$p6$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-kaspy-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 7, 'paragraph',
       $p7${"text":"Популярные пулы для Kaspa: K1Pool, WoolyPooly, KaspaPool, HeroMiners.","html":"Популярные пулы для Kaspa: K1Pool, WoolyPooly, KaspaPool, HeroMiners."}$p7$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-kaspy-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 8, 'heading',
       $p8${"level":2,"text":"Что такое Kaspa?"}$p8$::jsonb,
       'chto-takoe-kaspa'
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-kaspy-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 9, 'paragraph',
       $p9${"text":"Kaspa – это Layer-1 блокчейн, основанный на структуре графа (BlockDAG), а не на традиционной цепочке блоков. Эта архитектура позволяет системе обрабатывать несколько блоков параллельно, значительно увеличивая скорость транзакций и уменьшая время подтверждения.","html":"Kaspa – это Layer-1 блокчейн, основанный на структуре графа (BlockDAG), а не на традиционной цепочке блоков. Эта архитектура позволяет системе обрабатывать несколько блоков параллельно, значительно увеличивая скорость транзакций и уменьшая время подтверждения."}$p9$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-kaspy-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 10, 'image',
       $p10${"src":"/images/articles/kaspa-asics/kaspa-banner.png","alt":"Kaspa — Beyond the Block"}$p10$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-kaspy-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 11, 'paragraph',
       $p11${"text":"Основные особенности Kaspa:","html":"Основные особенности Kaspa:"}$p11$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-kaspy-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 12, 'rich_list',
       $p12${"ordered":false,"items":[{"title":"Алгоритм консенсуса","text":"GHOSTDAG (модификация протокола Nakamoto);"},{"title":"Время блока","text":"≈ 1 секунда;"},{"title":"Без смарт-контрактов","text":"ориентирована на высокоскоростные p2p-платежи;"},{"title":"Proof-of-Work (PoW)","text":"да, используется для защиты сети;"},{"title":"Алгоритм хеширования","text":"kHeavyHash."}]}$p12$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-kaspy-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 13, 'paragraph',
       $p13${"text":"Kaspa привлекает майнеров благодаря своей децентрализации, высокой пропускной способности и возможности добычи с помощью мощных асиков.","html":"Kaspa привлекает майнеров благодаря своей децентрализации, высокой пропускной способности и возможности добычи с помощью мощных асиков."}$p13$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-kaspy-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 14, 'heading',
       $p14${"level":2,"text":"Прогноз и потенциал Kaspa"}$p14$::jsonb,
       'prognoz-kaspa'
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-kaspy-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 15, 'paragraph',
       $p15${"text":"Цена KAS в 2024–2025 гг. демонстрировала активный рост, привлечённый интересом от майнеров и инвесторов.","html":"Цена KAS в 2024–2025 гг. демонстрировала активный рост, привлечённый интересом от майнеров и инвесторов."}$p15$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-kaspy-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 16, 'paragraph',
       $p16${"text":"Сообщество активно развивается: постоянные обновления, листинг на биржах, интерес со стороны разработчиков.","html":"Сообщество активно развивается: постоянные обновления, листинг на биржах, интерес со стороны разработчиков."}$p16$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-kaspy-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 17, 'paragraph',
       $p17${"text":"Благодаря быстрой и дешёвой транзакционной сети, KAS может стать востребованным средством для p2p-платежей.","html":"Благодаря быстрой и дешёвой транзакционной сети, KAS может стать востребованным средством для p2p-платежей."}$p17$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-kaspy-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 18, 'heading',
       $p18${"level":2,"text":"5 место: IceRiver KS0"}$p18$::jsonb,
       'iceriver-ks0'
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-kaspy-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 19, 'paragraph',
       $p19${"text":"Одним из преимуществ добычи криптовалюты в формате kHeavyHash является возможность использования асиков для домашнего майнинга. Отличным примером можно считать модель KS0 от известного производителя IceRiver. Ключевая особенность данной техники – отсутствие в конструкции вентиляторов: производитель задействовал пассивный способ охлаждения с помощью массивных радиаторов. Тепло самостоятельно рассеивается в помещении, что делает работу IceRiver KS0 практически бесшумной.","html":"Одним из преимуществ добычи криптовалюты в формате kHeavyHash является возможность использования асиков для домашнего майнинга. Отличным примером можно считать модель KS0 от известного производителя IceRiver. Ключевая особенность данной техники – отсутствие в конструкции вентиляторов: производитель задействовал пассивный способ охлаждения с помощью массивных радиаторов. Тепло самостоятельно рассеивается в помещении, что делает работу IceRiver KS0 практически бесшумной."}$p19$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-kaspy-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 20, 'image',
       $p20${"src":"/images/articles/kaspa-asics/iceriver-ks0.png","alt":"IceRiver KS0"}$p20$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-kaspy-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 21, 'paragraph',
       $p21${"text":"Обратной стороной подобного комфорта является относительно низкая производительность устройства – мощность модели составляет скромные даже по меркам kHeavyHash 0,1 ТХ/с. Есть в линейке бренда и старшие модели на 0,2 и даже 0,4 ТХ/с – рекомендуется приобретать именно эти модификации, так как при небольшой разнице в энергопотреблении производительность заметно отличается.","html":"Обратной стороной подобного комфорта является относительно низкая производительность устройства – мощность модели составляет скромные даже по меркам kHeavyHash 0,1 ТХ/с. Есть в линейке бренда и старшие модели на 0,2 и даже 0,4 ТХ/с – рекомендуется приобретать именно эти модификации, так как при небольшой разнице в энергопотреблении производительность заметно отличается."}$p21$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-kaspy-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 22, 'stats',
       $p22${"rows":[{"label":"Производитель","value":"IceRiver"},{"label":"Год выпуска","value":"2023"},{"label":"Хешрейт","value":"0,1-0,4 TХ /с"},{"label":"Энергопотребление","value":"65-100 Вт"},{"label":"Энергоэффективность","value":"250-650 Вт на ТХ"},{"label":"Алгоритм","value":"kHeavyHash"},{"label":"Количество монет, доступных для майнинга","value":"3"},{"label":"Уровень шума","value":"25 Дб"}]}$p22$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-kaspy-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 23, 'pros_cons',
       $p23${"pros":["Один из самых тихих асиков среди всей техники для добычи криптовалют (включая Kaspa)","Несколько моделей в линейке","Старшие модификации обладают отличной энергоэффективностью","Компактность, что упрощает формат домашнего использования","Достаточно известный производитель"],"cons":["Скромная производительность по сравнению с асиками классической архитектуры"]}$p23$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-kaspy-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 24, 'heading',
       $p24${"level":2,"text":"4 место: Goldshell KA BOX PRO"}$p24$::jsonb,
       'goldshell-ka-box-pro'
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-kaspy-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 25, 'paragraph',
       $p25${"text":"Оставаясь долгое время брендом второй волны, компания Goldshell продолжает поиски оптимального для себя сегмента. Одним из таких направлений является ниша альткоинов, для которых производитель подготовил несколько любопытных устройств. Отличный пример – модель KA BOX, которая работает на алгоритме kHeavyHash и добывает Kaspa. Данный продукт можно считать условно адаптированным для домашнего майнинга: уровень шума не превышает 35 Дб. Нельзя сказать, что Goldshell KA BOX абсолютно комфортен при размещении в квартире, но в сравнении с асиками для BTC это можно считать феноменальным показателем.","html":"Оставаясь долгое время брендом второй волны, компания Goldshell продолжает поиски оптимального для себя сегмента. Одним из таких направлений является ниша альткоинов, для которых производитель подготовил несколько любопытных устройств. Отличный пример – модель KA BOX, которая работает на алгоритме kHeavyHash и добывает Kaspa. Данный продукт можно считать условно адаптированным для домашнего майнинга: уровень шума не превышает 35 Дб. Нельзя сказать, что Goldshell KA BOX абсолютно комфортен при размещении в квартире, но в сравнении с асиками для BTC это можно считать феноменальным показателем."}$p25$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-kaspy-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 26, 'paragraph',
       $p26${"text":"Производительность аппаратуры составляет 1,6 ТХ/с при потреблении 600 Вт: подобное сочетание позволяет продемонстрировать неплохую энергоэффективность, что особенно актуально для использования в жилых помещениях. В целом, асик Goldshell KA BOX можно назвать промежуточной моделью при переходе от домашнего майнинга к профессиональной добыче Kaspa на классических устройствах.","html":"Производительность аппаратуры составляет 1,6 ТХ/с при потреблении 600 Вт: подобное сочетание позволяет продемонстрировать неплохую энергоэффективность, что особенно актуально для использования в жилых помещениях. В целом, асик Goldshell KA BOX можно назвать промежуточной моделью при переходе от домашнего майнинга к профессиональной добыче Kaspa на классических устройствах."}$p26$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-kaspy-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 27, 'stats',
       $p27${"rows":[{"label":"Производитель","value":"Goldshell"},{"label":"Год выпуска","value":"2024"},{"label":"Хешрейт","value":"1,6 TХ /с"},{"label":"Энергопотребление","value":"600 Вт"},{"label":"Энергоэффективность","value":"375 Вт на ТХ"},{"label":"Алгоритм","value":"kHeavyHash"},{"label":"Количество монет, доступных для майнинга","value":"3"},{"label":"Уровень шума","value":"35 Дб"}]}$p27$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-kaspy-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 28, 'pros_cons',
       $p28${"pros":["Приятный внешний вид","Достаточно известный изготовитель","Приемлемая производительность и энергоэффективность","Относительно невысокий уровень шума"],"cons":["Достаточно высокая стоимость"]}$p28$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-kaspy-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 29, 'heading',
       $p29${"level":2,"text":"3 место: IceRiver KS1, KS2, KS3, KS5 и KS7"}$p29$::jsonb,
       'iceriver-ks-series'
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-kaspy-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 30, 'paragraph',
       $p30${"text":"Помимо асика для Kaspa с пассивной системой охлаждения, есть у IceRiver несколько устройств классической архитектуры с привычными многим вентиляторами. Это линейка KS, состоящая сразу из пяти моделей мощностью от 1 до 30Тх/с. Производитель акцентирует повышенное внимание на токене KAS, что объясняет подобное многообразие техники для работы с алгоритмом kHeavyHash.","html":"Помимо асика для Kaspa с пассивной системой охлаждения, есть у IceRiver несколько устройств классической архитектуры с привычными многим вентиляторами. Это линейка KS, состоящая сразу из пяти моделей мощностью от 1 до 30Тх/с. Производитель акцентирует повышенное внимание на токене KAS, что объясняет подобное многообразие техники для работы с алгоритмом kHeavyHash."}$p30$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-kaspy-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 31, 'image',
       $p31${"src":"/images/articles/kaspa-asics/iceriver-ks-series.png","alt":"IceRiver KS series"}$p31$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-kaspy-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 32, 'paragraph',
       $p32${"text":"Линейку KS нельзя считать адаптированной для домашнего использования: наличие четырех вентиляторов предполагает высокий уровень шума, а также внушительный объем выделяемого тепла. Более того, ТОПовы модели серии отличаются прожорливостью с точки зрения потребления электричества. Именно поэтому IceRiver KS считается профессиональной аппаратурой для запуска в специализированных помещениях.","html":"Линейку KS нельзя считать адаптированной для домашнего использования: наличие четырех вентиляторов предполагает высокий уровень шума, а также внушительный объем выделяемого тепла. Более того, ТОПовы модели серии отличаются прожорливостью с точки зрения потребления электричества. Именно поэтому IceRiver KS считается профессиональной аппаратурой для запуска в специализированных помещениях."}$p32$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-kaspy-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 33, 'stats',
       $p33${"rows":[{"label":"Производитель","value":"IceRiver"},{"label":"Год выпуска","value":"2023"},{"label":"Хешрейт","value":"1-30TХ /с"},{"label":"Энергопотребление","value":"600 - 3 400 Вт"},{"label":"Энергоэффективность","value":"226-600 Вт на ТХ"},{"label":"Алгоритм","value":"kHeavyHash"},{"label":"Количество монет, доступных для майнинга","value":"3"},{"label":"Уровень шума","value":"75 Дб"}]}$p33$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-kaspy-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 34, 'pros_cons',
       $p34${"pros":["Линейка профессиональных устройств от известного производителя","Отличная энергоэффективность старших модификаций"],"cons":["Высокий уровень шума","Большой объем потребляемой энергии у старших версий"]}$p34$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-kaspy-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 35, 'heading',
       $p35${"level":2,"text":"2 место: Antminer KAS Miner KS5 и KS5 Pro"}$p35$::jsonb,
       'antminer-ks5'
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-kaspy-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 36, 'paragraph',
       $p36${"text":"Ведущий производитель техники для добычи криптовалют, компания Bitmain, также обращает внимание на сегмент kHeavyHash и асики для майнинга Каспы, в частности. Помимо третьей серии KAS Miner, это еще и ТОПовая, пятая линейка KAS Miner KS5, включая версию Pro. Именно пара этих экземпляров и интересует нас в статусе самых мощных асиков для майнинга Каспы сегодня. Производительность устройств составляет 20 и 21 TХ /с при потреблении 3000 и 3150 Вт, соответственно. Образцовые значения энергоэффективности, что позволило компании Bitmain оставить далеко позади всех своих конкурентов.","html":"Ведущий производитель техники для добычи криптовалют, компания Bitmain, также обращает внимание на сегмент kHeavyHash и асики для майнинга Каспы, в частности. Помимо третьей серии KAS Miner, это еще и ТОПовая, пятая линейка KAS Miner KS5, включая версию Pro. Именно пара этих экземпляров и интересует нас в статусе самых мощных асиков для майнинга Каспы сегодня. Производительность устройств составляет 20 и 21 TХ /с при потреблении 3000 и 3150 Вт, соответственно. Образцовые значения энергоэффективности, что позволило компании Bitmain оставить далеко позади всех своих конкурентов."}$p36$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-kaspy-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 37, 'image',
       $p37${"src":"/images/articles/kaspa-asics/antminer-ks5.png","alt":"Antminer KAS Miner KS5"}$p37$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-kaspy-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 38, 'paragraph',
       $p38${"text":"Учитывая известность и высокую степень популярности бренда Antminer, можно назвать еще одно преимущество добычи Kaspa на KAS Miner KS5 и KS5 Pro – это отсутствие трудностей с ремонтом и запасными частями. Именно совокупность данных причин делает линейку KS5 от Bitmain лучшей для работы в рамках алгоритма kHeavyHash на сегодняшний день.","html":"Учитывая известность и высокую степень популярности бренда Antminer, можно назвать еще одно преимущество добычи Kaspa на KAS Miner KS5 и KS5 Pro – это отсутствие трудностей с ремонтом и запасными частями. Именно совокупность данных причин делает линейку KS5 от Bitmain лучшей для работы в рамках алгоритма kHeavyHash на сегодняшний день."}$p38$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-kaspy-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 39, 'stats',
       $p39${"rows":[{"label":"Производитель","value":"Bitmain"},{"label":"Год выпуска","value":"2024"},{"label":"Хешрейт","value":"20-21TХ /с"},{"label":"Энергопотребление","value":"3 000 - 3 150 Вт"},{"label":"Энергоэффективность","value":"150 Вт на ТХ"},{"label":"Алгоритм","value":"kHeavyHash"},{"label":"Количество монет, доступных для майнинга","value":"3"},{"label":"Уровень шума","value":"75 Дб"}]}$p39$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-kaspy-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 40, 'pros_cons',
       $p40${"pros":["Самый мощный асик для Каспы","Образцовая энергоэффективность","Ведущий производитель","Доступность запчастей и сервисных центров"],"cons":["Внушительный уровень шума","Высокая цена"]}$p40$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-kaspy-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 41, 'heading',
       $p41${"level":2,"text":"1 место: Antminer KS7 40T"}$p41$::jsonb,
       'antminer-ks7'
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-kaspy-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 42, 'paragraph',
       $p42${"text":"Компания Bitmain продолжает активно развивать направление асиков для Kaspa, и модель Antminer KS7 40T наглядно демонстрирует этот курс. Устройство ориентировано на алгоритм kHeavyHash и относится к новому поколению майнеров, где основной упор сделан на резкий рост производительности при сохранении адекватного энергопотребления. На фоне предыдущих серий KS линейка KS7 выглядит логичным эволюционным шагом, а не косметическим обновлением.","html":"Компания Bitmain продолжает активно развивать направление асиков для Kaspa, и модель Antminer KS7 40T наглядно демонстрирует этот курс. Устройство ориентировано на алгоритм kHeavyHash и относится к новому поколению майнеров, где основной упор сделан на резкий рост производительности при сохранении адекватного энергопотребления. На фоне предыдущих серий KS линейка KS7 выглядит логичным эволюционным шагом, а не косметическим обновлением."}$p42$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-kaspy-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 43, 'image',
       $p43${"src":"/images/articles/kaspa-asics/antminer-ks7.png","alt":"Antminer KS7 40T"}$p43$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-kaspy-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 44, 'paragraph',
       $p44${"text":"Производительность в 40 TH/s делает KS7 одним из самых мощных асиков для Kaspa на рынке. При этом энергопотребление удерживается на уровне 3080 Вт, что обеспечивает отличную энергоэффективность по меркам kHeavyHash. Однако формат остается строго профессиональным: высокий уровень шума и классическая воздушная система охлаждения исключают домашнее использование. KS7 ориентирован на фермы, дата-центры и специализированные помещения с подготовленной электросетью и вентиляцией.","html":"Производительность в 40 TH/s делает KS7 одним из самых мощных асиков для Kaspa на рынке. При этом энергопотребление удерживается на уровне 3080 Вт, что обеспечивает отличную энергоэффективность по меркам kHeavyHash. Однако формат остается строго профессиональным: высокий уровень шума и классическая воздушная система охлаждения исключают домашнее использование. KS7 ориентирован на фермы, дата-центры и специализированные помещения с подготовленной электросетью и вентиляцией."}$p44$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-kaspy-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 45, 'stats',
       $p45${"rows":[{"label":"Производитель","value":"Bitmain"},{"label":"Год выпуска","value":"2025"},{"label":"Хешрейт","value":"40 TH/s"},{"label":"Энергопотребление","value":"3080 Вт"},{"label":"Энергоэффективность","value":"77 J/TH"},{"label":"Алгоритм","value":"kHeavyHash"},{"label":"Добываемые монеты","value":"KAS (Kaspa)"},{"label":"Уровень шума","value":"75 дБ"},{"label":"Размеры","value":"430 х 196 х 290 мм"},{"label":"Вес","value":"16,4 кг"},{"label":"Рабочая температура","value":"0–40 °C"}]}$p45$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-kaspy-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 46, 'pros_cons',
       $p46${"pros":["Один из самых производительных асиков для Kaspa","Существенно улучшенная энергоэффективность по сравнению с предыдущими поколениями","Проверенный бренд Bitmain","Полная ориентация на kHeavyHash","Актуальность для промышленного майнинга"],"cons":["Высокий уровень шума, не подходит для жилых помещений","Воздушное охлаждение требует качественной вентиляции","Узкая специализация только под Kaspa","Высокая стоимость входа в сегмент"]}$p46$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-kaspy-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 47, 'heading',
       $p47${"level":2,"text":"Выводы"}$p47$::jsonb,
       'vyvody'
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-kaspy-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 48, 'paragraph',
       $p48${"text":"Kaspa – это технологически продвинутый блокчейн с уникальной архитектурой, высокой скоростью и активным развитием. Проект привлекателен для майнеров благодаря:","html":"Kaspa – это технологически продвинутый блокчейн с уникальной архитектурой, высокой скоростью и активным развитием. Проект привлекателен для майнеров благодаря:"}$p48$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-kaspy-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 49, 'list',
       $p49${"ordered":false,"items":["Энергоэффективному алгоритму kHeavyHash;","Возможности использовать мощное и производительное оборудование;","Перспективам роста стоимости токена."]}$p49$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-kaspy-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 50, 'paragraph',
       $p50${"text":"Если вы ищете актуальный и выгодный проект для майнинга – Kaspa (KAS) стоит рассмотреть. Он сочетает в себе технологичность, справедливую экономику и потенциал для долгосрочного участия.","html":"Если вы ищете актуальный и выгодный проект для майнинга – Kaspa (KAS) стоит рассмотреть. Он сочетает в себе технологичность, справедливую экономику и потенциал для долгосрочного участия."}$p50$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-asiki-dlya-majninga-kaspy-top-5';

-- =====================================================================
-- 034_article_home_asics.sql
-- =====================================================================

-- Лучший асик для домашнего майнинга в 2026 году: ТОП-8 устройств

INSERT INTO articles (
    slug, title, title_subtitle, excerpt, content, topic_id,
    reading_time_min, reading_minutes, published_at, view_count,
    display_type, sort_order, is_published, uses_blocks,
    image_url, image_alt
) VALUES (
    'luchshij-asik-dlya-domashnego-majninga-v-2024-godu',
    'Лучший асик для домашнего майнинга в 2026 году',
    'ТОП-8 устройств',
    $excerpt$ТОП-8 лучших асиков для домашнего майнинга в 2026 году: от Goldshell Mini-DOGE до ElphaPex DG Home 1 — тихие, компактные и энергоэффективные модели.$excerpt$,
    $content$Введение

Добыча криптовалют в домашних условиях остается актуальным форматом для многих.

Выводы

При наличии навыков любое устройство адаптируется под жилые помещения, но «из коробки» лучше выбирать оптимизированные домашние модели.$content$,
    'mining',
    11,
    11,
    '2023-03-08',
    2180,
    'list',
    18,
    TRUE,
    TRUE,
    '/images/articles/home-asics-2026/elphapex-dg-home-1.png',
    'ElphaPex DG Home 1'
)
ON CONFLICT (slug) DO UPDATE SET
    title = EXCLUDED.title,
    title_subtitle = EXCLUDED.title_subtitle,
    excerpt = EXCLUDED.excerpt,
    content = EXCLUDED.content,
    reading_time_min = EXCLUDED.reading_time_min,
    reading_minutes = EXCLUDED.reading_minutes,
    published_at = EXCLUDED.published_at,
    view_count = EXCLUDED.view_count,
    uses_blocks = TRUE,
    image_url = EXCLUDED.image_url,
    image_alt = EXCLUDED.image_alt,
    is_published = TRUE;

DELETE FROM article_blocks
WHERE article_id = (SELECT id FROM articles WHERE slug = 'luchshij-asik-dlya-domashnego-majninga-v-2024-godu');

UPDATE rating_items
SET href = '/articles/luchshij-asik-dlya-domashnego-majninga-v-2024-godu',
    label = 'ТОП-8 лучших асиков для домашнего майнинга в 2026 году'
WHERE href LIKE '%luchshij-asik-dlya-domashnego-majninga%'
   OR label ILIKE '%домашнего майнинга%';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 1, 'heading',
       $p1${"level":2,"text":"Введение"}$p1$::jsonb,
       'vvedenie'
FROM articles a WHERE a.slug = 'luchshij-asik-dlya-domashnego-majninga-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 2, 'paragraph',
       $p2${"text":"Добыча криптовалют в домашних условиях остается актуальным форматом для многих: несмотря на халвинг и рост сложности, тысячи пользователей предпочитают майнить именно дома. С какими трудностями сталкиваются криптоэнтузиасты и как выглядит ТОП-8 наиболее подходящих асиков для домашнего применения? Даем ответы на актуальные вопросы.","html":"Добыча криптовалют в домашних условиях остается актуальным форматом для многих: несмотря на халвинг и рост сложности, тысячи пользователей предпочитают майнить именно дома. С какими трудностями сталкиваются криптоэнтузиасты и как выглядит ТОП-8 наиболее подходящих асиков для домашнего применения? Даем ответы на актуальные вопросы."}$p2$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshij-asik-dlya-domashnego-majninga-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 3, 'image',
       $p3${"src":"/images/articles/home-asics-2026/intro-home-living.png","alt":"Домашний майнинг в жилой комнате"}$p3$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshij-asik-dlya-domashnego-majninga-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 4, 'heading',
       $p4${"level":2,"text":"Каким должен быть домашний асик для майнинга?"}$p4$::jsonb,
       'kakim-dolzhen-byt'
FROM articles a WHERE a.slug = 'luchshij-asik-dlya-domashnego-majninga-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 5, 'paragraph',
       $p5${"text":"Если инвестор столкнулся с трудностями поиска подходящего помещения, он вправе разместить небольшую ферму в жилой недвижимости – это могут быть многоквартирные дома, дачи или коттеджи. Именно поэтому техника для майнинга должна отвечать трем базовым требованиям:","html":"Если инвестор столкнулся с трудностями поиска подходящего помещения, он вправе разместить небольшую ферму в жилой недвижимости – это могут быть многоквартирные дома, дачи или коттеджи. Именно поэтому техника для майнинга должна отвечать трем базовым требованиям:"}$p5$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshij-asik-dlya-domashnego-majninga-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 6, 'rich_list',
       $p6${"ordered":false,"items":[{"title":"Низкий уровень шума","text":"Ключевое условие домашнего майнинга, так как ощущать присутствие фермы смогут не только жильцы квартиры, но и соседи. Среднее значение уровня шума традиционного асика составляет около 80-90 децибел, что сравнимо с работой промышленного пылесоса. Именно поэтому аппаратура для использования в жилых пространствах должна отличаться сниженным уровнем шума. Альтернатива – размещение асиков в шумбоксах, однако, ввиду внушительных габаритов таких дополнений ферма съедает большой объем свободного пространства;"},{"title":"Энергопотребление","text":"Классический асик для добычи Биткоина потребляет около 3,5 КВт электричества, в то время как лимиты на жилое помещение не превышают значения 15 КВт. Всего три асика для BTC способны полностью израсходовать имеющийся потенциал розетки, сделав включение других электроприборов невозможным. Электрические автоматы в щитовой будут срабатывать с завидной регулярностью, что превратит проживание в данной квартире в настоящую пытку. Решение проблемы – использовать асиков со сниженным объемом электропотребления: как правило, с помощью такого оборудования добывается не Биткоин, а альтернативные токены;"},{"title":"Теплоотдача","text":"Третья трудность, с которой сталкиваются владельцы домашних ферм – это внушительный объем выделяемого тепла. Конечно, асик можно задействовать для отопления помещения, однако, это актуально далеко не для любого времени года и не всех регионов страны. Владельцу техники придется разрабатывать системы отвода тепла, либо обратить внимание на «холодные» модели майнеров."}]}$p6$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshij-asik-dlya-domashnego-majninga-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 7, 'paragraph',
       $p7${"text":"С данными проблемами сталкиваются не только домашние, но и промышленные майнеры. Но решение подобных трудностей в квартирах является более сложной задачей.","html":"С данными проблемами сталкиваются не только домашние, но и промышленные майнеры. Но решение подобных трудностей в квартирах является более сложной задачей."}$p7$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshij-asik-dlya-domashnego-majninga-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 8, 'paragraph',
       $p8${"text":"Поэтому выбирая лучший асик для домашнего майнинга, стоит учитывать все три фактора, описанные выше. Проанализируем актуальный модельный ряд техники с учетом данных требований.","html":"Поэтому выбирая лучший асик для домашнего майнинга, стоит учитывать все три фактора, описанные выше. Проанализируем актуальный модельный ряд техники с учетом данных требований."}$p8$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshij-asik-dlya-domashnego-majninga-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 9, 'heading',
       $p9${"level":2,"text":"8 место: Goldshell Mini-DOGE"}$p9$::jsonb,
       'goldshell-mini-doge'
FROM articles a WHERE a.slug = 'luchshij-asik-dlya-domashnego-majninga-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 10, 'paragraph',
       $p10${"text":"В помещениях жилого типа можно успешно добывать такие криптовалюты, как LTC и DOGE: работа ведется в рамках алгоритма Scrypt, который не требует наличия шумного, «горячего» и прожорливого оборудования. Одним из примеров является асик Goldshell Mini-DOGE и в частности третье поколение линейки. Устройство отличается компактными габаритами и приятным внешним видом – майнеры успешно размещаются в жилой квартире, не оказывая негативного влияния на интерьер и комфорт жильцов. Уровень шума не превышает 35 децибел, что сравнимо с работой классического ПК.","html":"В помещениях жилого типа можно успешно добывать такие криптовалюты, как LTC и DOGE: работа ведется в рамках алгоритма Scrypt, который не требует наличия шумного, «горячего» и прожорливого оборудования. Одним из примеров является асик Goldshell Mini-DOGE и в частности третье поколение линейки. Устройство отличается компактными габаритами и приятным внешним видом – майнеры успешно размещаются в жилой квартире, не оказывая негативного влияния на интерьер и комфорт жильцов. Уровень шума не превышает 35 децибел, что сравнимо с работой классического ПК."}$p10$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshij-asik-dlya-domashnego-majninga-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 11, 'image',
       $p11${"src":"/images/articles/home-asics-2026/goldshell-mini-doge.png","alt":"Goldshell Mini-DOGE"}$p11$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshij-asik-dlya-domashnego-majninga-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 12, 'paragraph',
       $p12${"text":"Что же касается актива, доступного для добычи с помощью Goldshell Mini-DOGE, эти монеты входят в ТОП криптовалют по надежности и капитализации. Алгоритм Scrypt является популярным и актуальным форматом, поэтому приобретение подобных асиков выглядит оправданным форматом работы в домашних условиях.","html":"Что же касается актива, доступного для добычи с помощью Goldshell Mini-DOGE, эти монеты входят в ТОП криптовалют по надежности и капитализации. Алгоритм Scrypt является популярным и актуальным форматом, поэтому приобретение подобных асиков выглядит оправданным форматом работы в домашних условиях."}$p12$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshij-asik-dlya-domashnego-majninga-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 13, 'stats',
       $p13${"rows":[{"label":"Производитель","value":"Goldshell"},{"label":"Год выпуска","value":"2023"},{"label":"Базовый хешрейт","value":"700 МХ /с"},{"label":"Энергопотребление","value":"400 Вт"},{"label":"Энергоэффективность","value":"0,57 Вт на МХ"},{"label":"Алгоритм","value":"Scrypt"},{"label":"Количество монет, доступных для майнинга","value":"22"},{"label":"Размеры","value":"20 x 15 x 9,6 см"},{"label":"Масса","value":"2,2 кг"},{"label":"Уровень шума","value":"35 ДБ"}]}$p13$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshij-asik-dlya-domashnego-majninga-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 14, 'pros_cons',
       $p14${"pros":["Работа в рамках надежного алгоритма Scrypt: возможность добычи более двух десятков монет, включая LTC и DOGE","Низкий уровень шума","Отличная энергоэффективность в рамках алгоритма Scrypt","Компактность, малый вес, небольшое потребление"],"cons":["Не самый популярный производитель","Редкая модель со своей спецификой ремонта"]}$p14$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshij-asik-dlya-domashnego-majninga-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 15, 'heading',
       $p15${"level":2,"text":"7 место: Goldshell KA Box Pro"}$p15$::jsonb,
       'goldshell-ka-box-pro'
FROM articles a WHERE a.slug = 'luchshij-asik-dlya-domashnego-majninga-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 16, 'paragraph',
       $p16${"text":"Майнер KA Box Pro от компании Goldshell также можно считать адаптированным для работы в помещениях жилого типа – устройство функционирует в рамках алгоритма kHeavyHash. Этот формат, в отличие от описанного выше Scrypt, следует считать значительно более рискованным, так как майнер адаптирован для добычи только трех активов – Kaspa (KAS), Sedra (SDR) и Bugna (BGA). И если первый токен является достаточно известным, то две оставшиеся монеты – относительно новые проекты со скромной капитализацией. Работа в указанных направлениях связана с ощутимыми рисками ввиду высокой волатильности курса.","html":"Майнер KA Box Pro от компании Goldshell также можно считать адаптированным для работы в помещениях жилого типа – устройство функционирует в рамках алгоритма kHeavyHash. Этот формат, в отличие от описанного выше Scrypt, следует считать значительно более рискованным, так как майнер адаптирован для добычи только трех активов – Kaspa (KAS), Sedra (SDR) и Bugna (BGA). И если первый токен является достаточно известным, то две оставшиеся монеты – относительно новые проекты со скромной капитализацией. Работа в указанных направлениях связана с ощутимыми рисками ввиду высокой волатильности курса."}$p16$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshij-asik-dlya-domashnego-majninga-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 17, 'paragraph',
       $p17${"text":"С технической точки зрения Goldshell KA Box Pro можно назвать условно оптимальным устройством для домашнего применения – модель потребляет 600 Вт электричества, выделяет небольшой объем тепла и отличается приемлемым уровнем шума. Доходность от добычи активов в рамках алгоритма kHeavyHash больше, чем у ряда более именитых и известных форматов, однако, наличие рисков уже было обозначено нами ранее.","html":"С технической точки зрения Goldshell KA Box Pro можно назвать условно оптимальным устройством для домашнего применения – модель потребляет 600 Вт электричества, выделяет небольшой объем тепла и отличается приемлемым уровнем шума. Доходность от добычи активов в рамках алгоритма kHeavyHash больше, чем у ряда более именитых и известных форматов, однако, наличие рисков уже было обозначено нами ранее."}$p17$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshij-asik-dlya-domashnego-majninga-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 18, 'stats',
       $p18${"rows":[{"label":"Производитель","value":"Goldshell"},{"label":"Год выпуска","value":"2024"},{"label":"Базовый хешрейт","value":"1 600 ТХ /с"},{"label":"Энергопотребление","value":"600 Вт"},{"label":"Энергоэффективность","value":"0,375 Вт на ТХ"},{"label":"Алгоритм","value":"kHeavyHash"},{"label":"Количество монет, доступных для майнинга","value":"3"},{"label":"Размеры","value":"37 x 19,6 x 29 см"},{"label":"Масса","value":"3 кг"},{"label":"Уровень шума","value":"55 ДБ"}]}$p18$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshij-asik-dlya-domashnego-majninga-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 19, 'pros_cons',
       $p19${"pros":["Один из самых производительных асиков на kHeavyHash, подходящий для домашнего использования","Приемлемый уровень шума","Небольшой объем потребления электричества","Компактность и малый вес"],"cons":["Риски добычи альткоинов с малой капитализацией","Не самый известный производитель, что усложняет ремонт","Новая модель без наличия отзывов от реальных пользователей"]}$p19$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshij-asik-dlya-domashnego-majninga-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 20, 'heading',
       $p20${"level":2,"text":"6 место: Canaan Avalon Mini 3"}$p20$::jsonb,
       'canaan-avalon-mini-3'
FROM articles a WHERE a.slug = 'luchshij-asik-dlya-domashnego-majninga-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 21, 'paragraph',
       $p21${"text":"Canaan Avalon Mini 3 — одна из немногих моделей линейки Avalon, ориентированных именно на домашнюю среду. Главная особенность устройства — корпус и конструкция, выполненные в формате бытового обогревателя. Такая концепция позволяет совмещать процесс добычи криптовалюты с практической функцией — обогревом помещения. Во время майнинга тепло от оборудования не теряется впустую, а используется с пользой, что делает устройство особенно привлекательным в условиях холодного климата или при работе в зимний период.","html":"Canaan Avalon Mini 3 — одна из немногих моделей линейки Avalon, ориентированных именно на домашнюю среду. Главная особенность устройства — корпус и конструкция, выполненные в формате бытового обогревателя. Такая концепция позволяет совмещать процесс добычи криптовалюты с практической функцией — обогревом помещения. Во время майнинга тепло от оборудования не теряется впустую, а используется с пользой, что делает устройство особенно привлекательным в условиях холодного климата или при работе в зимний период."}$p21$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshij-asik-dlya-domashnego-majninga-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 22, 'image',
       $p22${"src":"/images/articles/home-asics-2026/canaan-avalon-mini-3.png","alt":"Canaan Avalon Mini 3"}$p22$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshij-asik-dlya-domashnego-majninga-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 23, 'paragraph',
       $p23${"text":"Майнер функционирует на популярном алгоритме SHA-256 и подходит для добычи Bitcoin. При этом уровень шума составляет около 40 дБ — показатель сравним с обычным ПК или бытовым вентилятором. Такой режим позволяет разместить Avalon Mini 3 в квартире, частном доме, кабинете или небольшом серверном помещении без дискомфорта для окружающих.","html":"Майнер функционирует на популярном алгоритме SHA-256 и подходит для добычи Bitcoin. При этом уровень шума составляет около 40 дБ — показатель сравним с обычным ПК или бытовым вентилятором. Такой режим позволяет разместить Avalon Mini 3 в квартире, частном доме, кабинете или небольшом серверном помещении без дискомфорта для окружающих."}$p23$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshij-asik-dlya-domashnego-majninga-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 24, 'stats',
       $p24${"rows":[{"label":"Производитель","value":"Canaan"},{"label":"Модель","value":"Avalon Mini 3"},{"label":"Алгоритм","value":"SHA-256"},{"label":"Хешрейт","value":"37.50 Th/s"},{"label":"Потребление","value":"800 Вт"},{"label":"Монеты для майнинга","value":"BTC"},{"label":"Уровень шума","value":"40 дБ"},{"label":"Размеры","value":"250 × 180 × 120 мм"},{"label":"Вес","value":"4 кг"},{"label":"Год выпуска","value":"2024"}]}$p24$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshij-asik-dlya-domashnego-majninga-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 25, 'pros_cons',
       $p25${"pros":["Форм-фактор бытового обогревателя с функцией отопления","Низкий уровень шума — подходит для жилых помещений","Достойная энергоэффективность в рамках алгоритма SHA-256","Поддержка добычи Bitcoin","Компактность и малый вес"],"cons":["Поддержка только одного алгоритма (SHA-256)","Ограниченная производительность по сравнению с промышленными ASIC-устройствами","Небольшая доступность модели на рынке ввиду специфики"]}$p25$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshij-asik-dlya-domashnego-majninga-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 26, 'heading',
       $p26${"level":2,"text":"5 место: Canaan Avalon Q"}$p26$::jsonb,
       'canaan-avalon-q'
FROM articles a WHERE a.slug = 'luchshij-asik-dlya-domashnego-majninga-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 27, 'paragraph',
       $p27${"text":"Canaan Avalon Q — домашний асик на алгоритме SHA-256, созданный для добычи Bitcoin и других совместимых активов. Хешрейт устройства составляет 90 Th/s при энергопотреблении 1 675 Вт, что делает модель привлекательной для майнеров, стремящихся к стабильной доходности и оптимальному энергорежиму.","html":"Canaan Avalon Q — домашний асик на алгоритме SHA-256, созданный для добычи Bitcoin и других совместимых активов. Хешрейт устройства составляет 90 Th/s при энергопотреблении 1 675 Вт, что делает модель привлекательной для майнеров, стремящихся к стабильной доходности и оптимальному энергорежиму."}$p27$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshij-asik-dlya-domashnego-majninga-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 28, 'image',
       $p28${"src":"/images/articles/home-asics-2026/canaan-avalon-q.png","alt":"Canaan Avalon Q"}$p28$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshij-asik-dlya-domashnego-majninga-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 29, 'paragraph',
       $p29${"text":"Несмотря на более высокий уровень шума по сравнению с компактными домашними моделями, Avalon Q остается универсальным решением — он подойдет для домашнего применения. Система охлаждения продумана для долговременной работы под нагрузкой, что исключает перегрев и обеспечивает стабильность в долгосрочной перспективе.","html":"Несмотря на более высокий уровень шума по сравнению с компактными домашними моделями, Avalon Q остается универсальным решением — он подойдет для домашнего применения. Система охлаждения продумана для долговременной работы под нагрузкой, что исключает перегрев и обеспечивает стабильность в долгосрочной перспективе."}$p29$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshij-asik-dlya-domashnego-majninga-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 30, 'stats',
       $p30${"rows":[{"label":"Производитель","value":"Canaan Avalon"},{"label":"Модель","value":"Avalon Q"},{"label":"Алгоритм","value":"SHA-256"},{"label":"Хешрейт","value":"90 Th/s"},{"label":"Потребление","value":"1 675 Вт"},{"label":"Монеты для майнинга","value":"BTC"},{"label":"Уровень шума","value":"65 дБ"},{"label":"Размеры","value":"455 × 130,5 × 440 мм"},{"label":"Вес","value":"10,5 кг"},{"label":"Год выпуска","value":"2025"}]}$p30$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshij-asik-dlya-domashnego-majninga-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 31, 'pros_cons',
       $p31${"pros":["Возможен домашний формат использования","Поддержка добычи Bitcoin и других SHA-256 активов","Надежная система охлаждения","Простая настройка и подключение"],"cons":["Средняя энергоэффективность по сравнению с топовыми ASIC-моделями","Не самый популярный формат"]}$p31$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshij-asik-dlya-domashnego-majninga-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 32, 'heading',
       $p32${"level":2,"text":"4 место: IceRiver KS0 Pro"}$p32$::jsonb,
       'iceriver-ks0-pro'
FROM articles a WHERE a.slug = 'luchshij-asik-dlya-domashnego-majninga-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 33, 'paragraph',
       $p33${"text":"Рассматривая уже знакомый нам алгоритм kHeavyHash, нельзя обойти стороной асик IceRiver KS0 Pro, который при работе с монетами Kaspa (KAS), Sedra (SDR) и Bugna (BGA) является лучшим решением для домашнего применения. Причина – в конструкции модели нет не одного вентилятора: тепло рассеивается за счет массивного радиатора (такую систему охлаждения называют пассивной). Среди прочих преимуществ – скромное энергопотребление, что позволяет создавать целые фермы с использованием IceRiver KS0 Pro.","html":"Рассматривая уже знакомый нам алгоритм kHeavyHash, нельзя обойти стороной асик IceRiver KS0 Pro, который при работе с монетами Kaspa (KAS), Sedra (SDR) и Bugna (BGA) является лучшим решением для домашнего применения. Причина – в конструкции модели нет не одного вентилятора: тепло рассеивается за счет массивного радиатора (такую систему охлаждения называют пассивной). Среди прочих преимуществ – скромное энергопотребление, что позволяет создавать целые фермы с использованием IceRiver KS0 Pro."}$p33$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshij-asik-dlya-domashnego-majninga-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 34, 'image',
       $p34${"src":"/images/articles/home-asics-2026/iceriver-ks0-pro.png","alt":"IceRiver KS0 Pro"}$p34$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshij-asik-dlya-domashnego-majninga-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 35, 'paragraph',
       $p35${"text":"Это именно тот формат работы, который действительно на 100% адаптирован для применения в жилых помещениях. Устройство не занимает много места, работа абсолютно бесшумна, а энергопотребление сравнимо с обычным телевизором. Из недостатков – все то же инвестирование в молодые криптовалюты, надежность которых еще не подтверждена временем.","html":"Это именно тот формат работы, который действительно на 100% адаптирован для применения в жилых помещениях. Устройство не занимает много места, работа абсолютно бесшумна, а энергопотребление сравнимо с обычным телевизором. Из недостатков – все то же инвестирование в молодые криптовалюты, надежность которых еще не подтверждена временем."}$p35$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshij-asik-dlya-domashnego-majninga-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 36, 'stats',
       $p36${"rows":[{"label":"Производитель","value":"IceRiver"},{"label":"Год выпуска","value":"2023"},{"label":"Базовый хешрейт","value":"200 ГХ /с"},{"label":"Энергопотребление","value":"100 Вт"},{"label":"Энергоэффективность","value":"0,5 Вт на ГХ"},{"label":"Алгоритм","value":"kHeavyHash"},{"label":"Количество монет, доступных для майнинга","value":"3"},{"label":"Размеры","value":"20 x 19,4 x 7,4 см"},{"label":"Масса","value":"3,2 кг"},{"label":"Уровень шума","value":"25 ДБ"}]}$p36$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshij-asik-dlya-domashnego-majninga-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 37, 'pros_cons',
       $p37${"pros":["Один из самых тихих асиков на рынке (конструкция без вентиляторов)","Компактность, малый вес","Небольшой объем энергопотребления"],"cons":["Ориентация только на три монеты","Небольшая производительность по сравнению с традиционным оборудованием для добычи KAS","Не самый популярный производитель – возможные трудности с ремонтом и поиском запчастей"]}$p37$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshij-asik-dlya-domashnego-majninga-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 38, 'heading',
       $p38${"level":2,"text":"3 место: Jasminer X16-Q PRO"}$p38$::jsonb,
       'jasminer-x16-q-pro'
FROM articles a WHERE a.slug = 'luchshij-asik-dlya-domashnego-majninga-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 39, 'paragraph',
       $p39${"text":"Продукцию компании Jasminer можно считать настоящей находкой для домашнего использования. Это достаточно мощные устройства, которые не отличаются высоким объемом энергопотребления, внушительным уровнем шума и серьезным нагревом. По внешнему виду асик напоминает системный блок обыкновенного ПК, что позволяет разместить ферму в любом интерьере без негативного влияния не целостность дизайна помещения.","html":"Продукцию компании Jasminer можно считать настоящей находкой для домашнего использования. Это достаточно мощные устройства, которые не отличаются высоким объемом энергопотребления, внушительным уровнем шума и серьезным нагревом. По внешнему виду асик напоминает системный блок обыкновенного ПК, что позволяет разместить ферму в любом интерьере без негативного влияния не целостность дизайна помещения."}$p39$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshij-asik-dlya-domashnego-majninga-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 40, 'image',
       $p40${"src":"/images/articles/home-asics-2026/jasminer-x16-q-pro.png","alt":"Jasminer X16-Q PRO"}$p40$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshij-asik-dlya-domashnego-majninga-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 41, 'paragraph',
       $p41${"text":"Отдельного внимания заслуживают алгоритмы, в рамках которых работает Jasminer X16-Q PRO – это EtHash и EtcHash. Формат позволяет добывать несколько десятков цифровых активов, включая известный всем Ethereum Classic (ETC). Именно по этой причине инвестиции в покупку такой фермы выглядят не только оптимальными для использования в жилых помещениях, но и надежными с точки зрения специфики добычи.","html":"Отдельного внимания заслуживают алгоритмы, в рамках которых работает Jasminer X16-Q PRO – это EtHash и EtcHash. Формат позволяет добывать несколько десятков цифровых активов, включая известный всем Ethereum Classic (ETC). Именно по этой причине инвестиции в покупку такой фермы выглядят не только оптимальными для использования в жилых помещениях, но и надежными с точки зрения специфики добычи."}$p41$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshij-asik-dlya-domashnego-majninga-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 42, 'stats',
       $p42${"rows":[{"label":"Производитель","value":"Sunlune Technology"},{"label":"Год выпуска","value":"2024"},{"label":"Базовый хешрейт","value":"2 050 МХ /с"},{"label":"Энергопотребление","value":"520 Вт"},{"label":"Энергоэффективность","value":"0,25 Вт на МХ"},{"label":"Алгоритм","value":"EtHash и EtcHash"},{"label":"Количество монет, доступных для майнинга","value":"39"},{"label":"Размеры","value":"44,5 x 13,2 x 44,3 см"},{"label":"Масса","value":"10 кг"},{"label":"Уровень шума","value":"40 ДБ"}]}$p42$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshij-asik-dlya-domashnego-majninga-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 43, 'pros_cons',
       $p43${"pros":["Достойная энергоэффективность (одна из лучших среди устройств подобного формата)","Низкий уровень шума","Компактность","Работа в рамках известных алгоритмов"],"cons":["Молодой и непроверенный производитель","Растущая стоимость техники Jasminer ввиду популярности"]}$p43$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshij-asik-dlya-domashnego-majninga-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 44, 'heading',
       $p44${"level":2,"text":"2 место: iPollo V1 Mini"}$p44$::jsonb,
       'ipollo-v1-mini'
FROM articles a WHERE a.slug = 'luchshij-asik-dlya-domashnego-majninga-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 45, 'paragraph',
       $p45${"text":"Во время своего появления в 2022 году модельная линейка iPollo V1 произвела настоящий фурор: именно эту модель можно считать основоположником тренда домашнего майнинга. Легкие, компактные, достаточно тихие устройства, оснащенные Wi-Fi модулем – именно так выглядит лучший асик для домашнего майнинга и сегодня. Продажи аппаратуры iPollo остаются стабильно высокими даже несмотря на наличие конкурентов.","html":"Во время своего появления в 2022 году модельная линейка iPollo V1 произвела настоящий фурор: именно эту модель можно считать основоположником тренда домашнего майнинга. Легкие, компактные, достаточно тихие устройства, оснащенные Wi-Fi модулем – именно так выглядит лучший асик для домашнего майнинга и сегодня. Продажи аппаратуры iPollo остаются стабильно высокими даже несмотря на наличие конкурентов."}$p45$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshij-asik-dlya-domashnego-majninga-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 46, 'image',
       $p46${"src":"/images/articles/home-asics-2026/ipollo-v1-mini.png","alt":"iPollo V1 Mini"}$p46$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshij-asik-dlya-domashnego-majninga-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 47, 'paragraph',
       $p47${"text":"Асик настроен на работу в рамках логики Ethash: владельцам фермы доступна добыча более трех десятков монет, включая Ethereum Classic (ETC). При желании, майнер всегда может переключиться на альтернативу, если курс сторонних активов демонстрирует рост и повышенную рентабельность.","html":"Асик настроен на работу в рамках логики Ethash: владельцам фермы доступна добыча более трех десятков монет, включая Ethereum Classic (ETC). При желании, майнер всегда может переключиться на альтернативу, если курс сторонних активов демонстрирует рост и повышенную рентабельность."}$p47$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshij-asik-dlya-domashnego-majninga-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 48, 'stats',
       $p48${"rows":[{"label":"Производитель","value":"IPollo Miner"},{"label":"Год выпуска","value":"2022"},{"label":"Базовый хешрейт","value":"130-400 МХ /с"},{"label":"Энергопотребление","value":"104-232 Вт"},{"label":"Энергоэффективность","value":"0,58-0,8 Вт на МХ"},{"label":"Алгоритм","value":"EtHash и EtcHash"},{"label":"Количество монет, доступных для майнинга","value":"36"},{"label":"Размеры","value":"от 17,9 x 14,3 x 9"},{"label":"Масса","value":"2,1 кг"},{"label":"Уровень шума","value":"от 55 ДБ"}]}$p48$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshij-asik-dlya-domashnego-majninga-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 49, 'pros_cons',
       $p49${"pros":["Полноценная линейка устройств с разной производительностью","Подобный формат добычи альткоинов в домашних условиях","Наличие Wi-Fi подключения","Проверенный алгоритм работы","Множество монет для майнинга"],"cons":["Достаточно молодой производитель","Низкая энергоэффективность некоторых моделей"]}$p49$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshij-asik-dlya-domashnego-majninga-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 50, 'heading',
       $p50${"level":2,"text":"1 место: ElphaPex DG home 1"}$p50$::jsonb,
       'elphapex-dg-home-1'
FROM articles a WHERE a.slug = 'luchshij-asik-dlya-domashnego-majninga-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 51, 'paragraph',
       $p51${"text":"Elphapex DG Home 1 — устройство, ориентированное на добычу криптовалют по алгоритму Scrypt. Асик показывает производительность 4 GH/s при энергопотреблении 960 Вт, что делает его востребованным среди домашних майнеров, которым важны низкий уровень шума, компактность и эстетичный внешний вид оборудования. В отличие от промышленных решений, DG Home 1 рассчитан на работу в жилых помещениях — поддерживаемый уровень шума составляет около 50 дБ, что сопоставимо с тихим вентилятором настольного ПК.","html":"Elphapex DG Home 1 — устройство, ориентированное на добычу криптовалют по алгоритму Scrypt. Асик показывает производительность 4 GH/s при энергопотреблении 960 Вт, что делает его востребованным среди домашних майнеров, которым важны низкий уровень шума, компактность и эстетичный внешний вид оборудования. В отличие от промышленных решений, DG Home 1 рассчитан на работу в жилых помещениях — поддерживаемый уровень шума составляет около 50 дБ, что сопоставимо с тихим вентилятором настольного ПК."}$p51$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshij-asik-dlya-domashnego-majninga-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 52, 'image',
       $p52${"src":"/images/articles/home-asics-2026/elphapex-dg-home-1.png","alt":"ElphaPex DG Home 1"}$p52$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshij-asik-dlya-domashnego-majninga-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 53, 'paragraph',
       $p53${"text":"Асик можно использовать для добычи таких монет, как Litecoin (LTC) и Dogecoin (DOGE), что делает его привлекательным выбором для майнеров, ориентирующихся на стабильные и известные активы. Модель совместима с большинством домашних электросетей и не требует специальных условий для запуска, кроме базовой вентиляции для отвода тепла.","html":"Асик можно использовать для добычи таких монет, как Litecoin (LTC) и Dogecoin (DOGE), что делает его привлекательным выбором для майнеров, ориентирующихся на стабильные и известные активы. Модель совместима с большинством домашних электросетей и не требует специальных условий для запуска, кроме базовой вентиляции для отвода тепла."}$p53$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshij-asik-dlya-domashnego-majninga-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 54, 'stats',
       $p54${"rows":[{"label":"Производитель","value":"Elphapex"},{"label":"Модель","value":"DG Home 1"},{"label":"Алгоритм","value":"Scrypt"},{"label":"Хешрейт","value":"4 GH/s"},{"label":"Потребление","value":"960 Вт"},{"label":"Монеты для майнинга","value":"LTC, DOGE"},{"label":"Уровень шума","value":"50 дБ"},{"label":"Размеры","value":"300 × 150 × 200 мм"},{"label":"Вес","value":"7 кг"},{"label":"Год выпуска","value":"2023"}]}$p54$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshij-asik-dlya-domashnego-majninga-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 55, 'pros_cons',
       $p55${"pros":["Подходит для домашнего майнинга","Поддержка популярных монет Litecoin и Dogecoin","Современный дизайн и компактные размеры","Простая настройка и эксплуатация","Умеренный уровень шума"],"cons":["Более низкая мощность по сравнению с промышленными моделями","Ограничение только алгоритмом Scrypt — не подходит для добычи BTC и других популярных SHA-256 активов"]}$p55$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshij-asik-dlya-domashnego-majninga-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 56, 'heading',
       $p56${"level":2,"text":"Лучший асик для домашнего майнинга: альтернативы"}$p56$::jsonb,
       'alternativy'
FROM articles a WHERE a.slug = 'luchshij-asik-dlya-domashnego-majninga-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 57, 'paragraph',
       $p57${"text":"Выше мы рассмотрели ТОП-8 майнеров, наиболее подходящих для использования фермы в домашних условиях. Однако при решении ряда определенных задач практически любой асик можно считать подходящим для запуска в квартире. Достаточно решить три актуальные задачи, которые были названы нами ранее:","html":"Выше мы рассмотрели ТОП-8 майнеров, наиболее подходящих для использования фермы в домашних условиях. Однако при решении ряда определенных задач практически любой асик можно считать подходящим для запуска в квартире. Достаточно решить три актуальные задачи, которые были названы нами ранее:"}$p57$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshij-asik-dlya-domashnego-majninga-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 58, 'rich_list',
       $p58${"ordered":false,"items":[{"title":"Шум","text":"Качественный шумбокс способен сократить уровень шума практически в два раза, снизив метрики до приемлемых значений. Например, 40-50 децибел – это именно тот порог, который позволяет эксплуатировать технику для добычи криптовалют в квартирах и жилых домах. Однако в погоне за тишиной нельзя забывать об эффективности охлаждения – в некоторых шумбоксах техника способна перегреваться;"},{"title":"Электричество","text":"Глобального решения этой проблемы не существует, так как мощные асики требуют серьезных энергетических ресурсов. В некоторых регионах России реально расширить лимиты электропитания помещения или установить собственную трансформаторную подстанцию, однако, оба способа сопряжены с дополнительными финансовыми тратами;"},{"title":"Охлаждение","text":"Создание качественной приточной и вытяжной вентиляции, расположение фермы на балконе с прямым выводом воздушных масс на улицу, включение асиков в систему отопления дома – три эффективных формата решения проблемы перегрева. А в некоторых случаях вы сможете еще и сэкономить на коммунальных платежах: именно такой формат широко распространен на родине российского майнинга – в Иркутске."}]}$p58$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshij-asik-dlya-domashnego-majninga-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 59, 'image',
       $p59${"src":"/images/articles/home-asics-2026/home-mining-office.png","alt":"Домашняя майнинг-станция"}$p59$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshij-asik-dlya-domashnego-majninga-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 60, 'paragraph',
       $p60${"text":"Если пользователь обладает необходимым опытом и соответствующими техническими знаниями, практически любой асик можно адаптировать для использования в жилых помещениях.","html":"Если пользователь обладает необходимым опытом и соответствующими техническими знаниями, практически любой асик можно адаптировать для использования в жилых помещениях."}$p60$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshij-asik-dlya-domashnego-majninga-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 61, 'paragraph',
       $p61${"text":"Однако в любом случае следует рассчитывать рентабельность, так как оптимизация процесса повышает планку рентабельности и способна сделать достижение порога окупаемости практически невозможным ввиду ощутимым финансовых трат.","html":"Однако в любом случае следует рассчитывать рентабельность, так как оптимизация процесса повышает планку рентабельности и способна сделать достижение порога окупаемости практически невозможным ввиду ощутимым финансовых трат."}$p61$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshij-asik-dlya-domashnego-majninga-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 62, 'heading',
       $p62${"level":2,"text":"Выводы"}$p62$::jsonb,
       'vyvody'
FROM articles a WHERE a.slug = 'luchshij-asik-dlya-domashnego-majninga-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 63, 'paragraph',
       $p63${"text":"Какой асик для домашнего майнинга можно считать лучшим? При наличии навыков и дополнительных расходов любое устройство адаптируется под реалии эксплуатации в жилых помещениях. Но если вы планируете использовать ферму «из коробки», стоит обратить внимание на оптимизированные модели – это ElphaPex DG Home 1, iPollo V1 Mini, Jasminer X16-Q PRO, IceRiver KS0 Pro, Canaan Avalon Q, Canaan Avalon Mini 3, Goldshell KA Box Pro и Goldshell Mini-DOGE.","html":"Какой асик для домашнего майнинга можно считать лучшим? При наличии навыков и дополнительных расходов любое устройство адаптируется под реалии эксплуатации в жилых помещениях. Но если вы планируете использовать ферму «из коробки», стоит обратить внимание на оптимизированные модели – это ElphaPex DG Home 1, iPollo V1 Mini, Jasminer X16-Q PRO, IceRiver KS0 Pro, Canaan Avalon Q, Canaan Avalon Mini 3, Goldshell KA Box Pro и Goldshell Mini-DOGE."}$p63$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshij-asik-dlya-domashnego-majninga-v-2024-godu';

-- =====================================================================
-- 035_article_mining_containers.sql
-- =====================================================================

-- Рейтинг контейнеров для майнинга в 2026 году: ТОП-9 производителей

INSERT INTO articles (
    slug, title, title_subtitle, excerpt, content, topic_id,
    reading_time_min, reading_minutes, published_at, view_count,
    display_type, sort_order, is_published, uses_blocks,
    image_url, image_alt
) VALUES (
    'rejting-kontejnerov-dlya-majninga-top-10',
    'Рейтинг контейнеров для майнинга в 2026 году',
    'ТОП-9 производителей',
    $excerpt$ТОП-9 производителей контейнеров для майнинга в 2026 году: от IBMM до Bitferma — сравнение моделей, охлаждения, мощности и цен.$excerpt$,
    $content$Введение

Майнинг криптовалют продолжает набирать популярность, а вместе с этим растет и потребность в эффективных решениях для размещения и охлаждения оборудования.

Выводы

Контейнеры для майнинга – оптимальное решение для быстрого масштабирования фермы.$content$,
    'mining',
    17,
    17,
    '2023-03-04',
    1177,
    'list',
    19,
    TRUE,
    TRUE,
    '/images/articles/mining-containers-2026/intro-containers.png',
    'Майнинговые контейнеры'
)
ON CONFLICT (slug) DO UPDATE SET
    title = EXCLUDED.title,
    title_subtitle = EXCLUDED.title_subtitle,
    excerpt = EXCLUDED.excerpt,
    content = EXCLUDED.content,
    reading_time_min = EXCLUDED.reading_time_min,
    reading_minutes = EXCLUDED.reading_minutes,
    published_at = EXCLUDED.published_at,
    view_count = EXCLUDED.view_count,
    uses_blocks = TRUE,
    image_url = EXCLUDED.image_url,
    image_alt = EXCLUDED.image_alt,
    is_published = TRUE;

DELETE FROM article_blocks
WHERE article_id = (SELECT id FROM articles WHERE slug = 'rejting-kontejnerov-dlya-majninga-top-10');

UPDATE rating_items
SET href = '/articles/rejting-kontejnerov-dlya-majninga-top-10',
    label = 'Рейтинг контейнеров для майнинга в 2026 году: ТОП-9 производителей'
WHERE href LIKE '%rejting-kontejnerov-dlya-majninga%'
   OR label ILIKE '%контейнеров для майнинга%';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 1, 'heading',
       $p1${"level":2,"text":"Введение"}$p1$::jsonb,
       'vvedenie'
FROM articles a WHERE a.slug = 'rejting-kontejnerov-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 2, 'paragraph',
       $p2${"text":"Майнинг криптовалют продолжает набирать популярность, а вместе с этим растет и потребность в эффективных решениях для размещения и охлаждения оборудования. Одним из таких решений стали контейнеры для майнинга – мобильные, автономные блоки, специально приспособленные для размещения майнинг-ферм. Узнаем, что такое майнинговые контейнеры, как они работают, чем отличаются, на что обращать внимание при выборе, а также познакомимся с ТОП-9 производителями подобных форматов для размещения ферм.","html":"Майнинг криптовалют продолжает набирать популярность, а вместе с этим растет и потребность в эффективных решениях для размещения и охлаждения оборудования. Одним из таких решений стали контейнеры для майнинга – мобильные, автономные блоки, специально приспособленные для размещения майнинг-ферм. Узнаем, что такое майнинговые контейнеры, как они работают, чем отличаются, на что обращать внимание при выборе, а также познакомимся с ТОП-9 производителями подобных форматов для размещения ферм."}$p2$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kontejnerov-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 3, 'image',
       $p3${"src":"/images/articles/mining-containers-2026/intro-containers.png","alt":"Майнинговые контейнеры на складе"}$p3$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kontejnerov-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 4, 'heading',
       $p4${"level":2,"text":"Что такое контейнеры для майнинга?"}$p4$::jsonb,
       'chto-takoe-kontejnery'
FROM articles a WHERE a.slug = 'rejting-kontejnerov-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 5, 'paragraph',
       $p5${"text":"Контейнер для майнинга – это модульная конструкция, основой которой часто является морской контейнер. Внутри установлено все необходимое для работы большого количества майнеров: стойки, электроснабжение, системы охлаждения и вентиляции, системы мониторинга и безопасности. Такой контейнер можно установить практически в любом месте с подходящей инфраструктурой.","html":"Контейнер для майнинга – это модульная конструкция, основой которой часто является морской контейнер. Внутри установлено все необходимое для работы большого количества майнеров: стойки, электроснабжение, системы охлаждения и вентиляции, системы мониторинга и безопасности. Такой контейнер можно установить практически в любом месте с подходящей инфраструктурой."}$p5$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kontejnerov-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 6, 'paragraph',
       $p6${"text":"Главная задача контейнера – обеспечить стабильную и эффективную работу большого количества майнингового оборудования в одном месте, с минимальными затратами на инфраструктуру.","html":"Главная задача контейнера – обеспечить стабильную и эффективную работу большого количества майнингового оборудования в одном месте, с минимальными затратами на инфраструктуру."}$p6$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kontejnerov-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 7, 'paragraph',
       $p7${"text":"Преимущества данного формата размещения:","html":"Преимущества данного формата размещения:"}$p7$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kontejnerov-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 8, 'rich_list',
       $p8${"ordered":false,"items":[{"title":"Мобильность","text":"легко транспортируются к месту с дешевой электроэнергией;"},{"title":"Быстрая установка","text":"не требует капитальное строительство;"},{"title":"Масштабируемость","text":"можно объединять в кластеры;"},{"title":"Эффективное охлаждение","text":"продуманные системы отвода тепла;"},{"title":"Безопасность","text":"контролируемый доступ, пожарная безопасность, видеонаблюдение."}]}$p8$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kontejnerov-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 9, 'paragraph',
       $p9${"text":"Контейнеры различаются по конструкции, размерам и системам охлаждения. Основные виды:","html":"Контейнеры различаются по конструкции, размерам и системам охлаждения. Основные виды:"}$p9$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kontejnerov-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 10, 'rich_list',
       $p10${"ordered":true,"items":[{"title":"20-футовые и 40-футовые контейнеры","text":"Стандартные габариты, легко перевозятся. Вмещают от 180 до 600 асиков в зависимости от модели и плотности установки;"},{"title":"Контейнеры с воздушным охлаждением","text":"Самый распространенный вариант. Используют мощные вентиляторы и воздухозаборники;"},{"title":"Контейнеры с жидкостным охлаждением (Immersion Cooling)","text":"Подходит для высокоплотного размещения оборудования. Дороже в производстве, но эффективнее при работе в жарком климате;"},{"title":"Гибридные контейнеры","text":"Сочетают в себе элементы воздушного и жидкостного охлаждения. Подходят для разных типов оборудования."}]}$p10$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kontejnerov-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 11, 'image',
       $p11${"src":"/images/articles/mining-containers-2026/container-types.png","alt":"Виды майнинговых контейнеров"}$p11$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kontejnerov-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 12, 'heading',
       $p12${"level":2,"text":"Как производятся и из чего состоят майнинговые контейнеры?"}$p12$::jsonb,
       'kak-proizvodyatsya'
FROM articles a WHERE a.slug = 'rejting-kontejnerov-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 13, 'paragraph',
       $p13${"text":"Производство контейнеров включает несколько этапов:","html":"Производство контейнеров включает несколько этапов:"}$p13$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kontejnerov-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 14, 'list',
       $p14${"ordered":false,"items":["Подбор корпуса – часто используется стандартный морской контейнер (новый или б/у);","Проектирование внутренней инфраструктуры – расчет вентиляции, электрики, размещения оборудования;","Монтаж инженерных систем: электрощиты и распределение питания, системы охлаждения (вентиляторы, кондиционеры, иммерсионные ванны), системы контроля доступа и мониторинга;","Испытания – проверка всех систем в рабочих условиях;","Подключение и доставка заказчику."]}$p14$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kontejnerov-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 15, 'image',
       $p15${"src":"/images/articles/mining-containers-2026/container-interior.png","alt":"Внутренняя инфраструктура майнингового контейнера"}$p15$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kontejnerov-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 16, 'paragraph',
       $p16${"text":"Из чего состоит майнинговый контейнер? Типовой контейнер включает:","html":"Из чего состоит майнинговый контейнер? Типовой контейнер включает:"}$p16$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kontejnerov-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 17, 'list',
       $p17${"ordered":false,"items":["Металлический корпус (морской контейнер или сварной каркас);","Стеллажи для оборудования;","Силовая электрика (трансформаторы, кабели, автоматические выключатели);","Система вентиляции и охлаждения;","Устройства удаленного мониторинга (датчики температуры, влажности, потребления энергии);","Система пожаротушения (опционально);","Система безопасности (замки, камеры, сигнализация)."]}$p17$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kontejnerov-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 18, 'heading',
       $p18${"level":2,"text":"Как выбрать контейнер для майнинга?"}$p18$::jsonb,
       'kak-vybrat'
FROM articles a WHERE a.slug = 'rejting-kontejnerov-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 19, 'paragraph',
       $p19${"text":"При выборе контейнера стоит учитывать следующие факторы:","html":"При выборе контейнера стоит учитывать следующие факторы:"}$p19$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kontejnerov-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 20, 'rich_list',
       $p20${"ordered":false,"items":[{"title":"Количество и тип оборудования","text":"Здесь необходимо ответить на следующие вопросы: какие майнеры предстоит установить? Сколько устройств планируется разместить?"},{"title":"Энергетическая нагрузка","text":"Учитывайте максимальную потребляемую мощность и проверьте, есть ли соответствующие вводы электропитания;"},{"title":"Тип охлаждения","text":"Для холодных регионов подходит воздушное, для жарких – лучше выбирать жидкостное или гибридное;"},{"title":"Локация и логистика","text":"Важно проанализировать такие вопросы, как возможность доставки и размещения на объекте, а также наличие инфраструктуры – подстанции, интернет, охрана;"},{"title":"Цена и производитель","text":"Не гонитесь за самым дешевым вариантом – надежность здесь критична. Изучите репутацию производителя, наличие гарантии и техподдержки."}]}$p20$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kontejnerov-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 21, 'heading',
       $p21${"level":2,"text":"9 место: IBMM"}$p21$::jsonb,
       'ibmm'
FROM articles a WHERE a.slug = 'rejting-kontejnerov-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 22, 'paragraph',
       $p22${"text":"Контейнер от крупнейшего продавца техники для майнинга, а также хостнг-провайдера в РФ. Несмотря на то, что заявленный опыт изготовления боксов превышает 3 года, маркетинговая составляющая данной услуги оставляет желать лучшего. Потенциальным покупателям доступна лишь поверхностная информация без технических данных и цен. IBMM предлагает получить ответы на все интересующие вопросы во время общения с менеджерами – многим такой формат знакомства с предложением будет неудобен.","html":"Контейнер от крупнейшего продавца техники для майнинга, а также хостнг-провайдера в РФ. Несмотря на то, что заявленный опыт изготовления боксов превышает 3 года, маркетинговая составляющая данной услуги оставляет желать лучшего. Потенциальным покупателям доступна лишь поверхностная информация без технических данных и цен. IBMM предлагает получить ответы на все интересующие вопросы во время общения с менеджерами – многим такой формат знакомства с предложением будет неудобен."}$p22$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kontejnerov-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 23, 'image',
       $p23${"src":"/images/articles/mining-containers-2026/ibmm.png","alt":"IBMM — майнинг-контейнер"}$p23$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kontejnerov-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 24, 'paragraph',
       $p24${"text":"Характеристик единственной модели контейнера от IBMM немного: основой является 40-футовый морской контейнер, в котором можно разместить до 264 асиков. Принцип охлаждения – прямой, в базовой комплектации скорость вращения вентиляторов регулируется вручную. За дополнительную плату изготовитель установит в бокс климатическую систему и видеонаблюдение.","html":"Характеристик единственной модели контейнера от IBMM немного: основой является 40-футовый морской контейнер, в котором можно разместить до 264 асиков. Принцип охлаждения – прямой, в базовой комплектации скорость вращения вентиляторов регулируется вручную. За дополнительную плату изготовитель установит в бокс климатическую систему и видеонаблюдение."}$p24$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kontejnerov-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 25, 'stats',
       $p25${"rows":[{"label":"Производитель","value":"IBMM"},{"label":"Сайт","value":"ibmm.ru"},{"label":"Год регистрации домена","value":"2017"},{"label":"Количество моделей в продаже","value":"нет данных"},{"label":"Количество асиков для размещения","value":"нет данных"},{"label":"Общая мощность","value":"нет данных"},{"label":"Температурный диапазон эксплуатации","value":"нет данных"},{"label":"Охлаждение","value":"прямой принцип"},{"label":"Электрическая схема","value":"нет данных"},{"label":"Стоимость модельного ряда","value":"по запросу"}]}$p25$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kontejnerov-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 26, 'pros_cons',
       $p26${"pros":["Контейнеры от известнейшего магазина техники для майнинга","Практичное решение от дата-центра: оборудование клиентов размещаются в аналогичных боксах"],"cons":["Абсолютный дефицит информации на сайте"]}$p26$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kontejnerov-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 27, 'heading',
       $p27${"level":2,"text":"8 место: Майнинг Кластер"}$p27$::jsonb,
       'majning-klaster'
FROM articles a WHERE a.slug = 'rejting-kontejnerov-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 28, 'paragraph',
       $p28${"text":"Компания «Майнинг Кластер» осуществляет комплексный подход к продажам и размещению вычислительного оборудования на территории России. Помимо реализации асиков и видеокарт, предоставления услуг хостинга, ремонта техники и строительства дата-центров, это еще и изготовление контейнеров для майнинга. Ассортимент компании большой – более 10 вариантов.","html":"Компания «Майнинг Кластер» осуществляет комплексный подход к продажам и размещению вычислительного оборудования на территории России. Помимо реализации асиков и видеокарт, предоставления услуг хостинга, ремонта техники и строительства дата-центров, это еще и изготовление контейнеров для майнинга. Ассортимент компании большой – более 10 вариантов."}$p28$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kontejnerov-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 29, 'image',
       $p29${"src":"/images/articles/mining-containers-2026/mining-cluster.png","alt":"Майнинг Кластер — контейнеры"}$p29$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kontejnerov-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 30, 'paragraph',
       $p30${"text":"На сайте представлена базовая техническая информация о контейнерах, однако, ее содержания вполне достаточно для формирования общего представления. Цены также указаны, что является ощутимым преимуществом.","html":"На сайте представлена базовая техническая информация о контейнерах, однако, ее содержания вполне достаточно для формирования общего представления. Цены также указаны, что является ощутимым преимуществом."}$p30$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kontejnerov-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 31, 'stats',
       $p31${"rows":[{"label":"Производитель","value":"«Майнинг Кластер»"},{"label":"Сайт","value":"cluster-mining.com"},{"label":"Год регистрации домена","value":"2021"},{"label":"Количество моделей в продаже","value":"12"},{"label":"Количество асиков для размещения","value":"от 148 до 315"},{"label":"Общая мощность","value":"от 0,535 до 1,06 МВт"},{"label":"Температурный диапазон эксплуатации","value":"от -40 C до +35 C"},{"label":"Охлаждение","value":"прямой принцип"},{"label":"Электрическая схема","value":"нет данных"},{"label":"Стоимость модельного ряда","value":"от 1 857 675 ₽ до 20 987 775 ₽"}]}$p31$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kontejnerov-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 32, 'pros_cons',
       $p32${"pros":["Комплексный подход к решению задач майнеров","Большой ассортимент контейнеров","Наличие базовой информации о продукции на сайте, включая цены"],"cons":[]}$p32$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kontejnerov-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 33, 'heading',
       $p33${"level":2,"text":"7 место: PROMMINER"}$p33$::jsonb,
       'promminer'
FROM articles a WHERE a.slug = 'rejting-kontejnerov-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 34, 'paragraph',
       $p34${"text":"Компания «Проммайнер» является одним из крупнейших продавцов оборудования для добычи криптовалют на территории РФ. Помимо магазина – это еще и сервисный центр, инвестиционный формат, хостнг для размещения техники, а также изготовитель контейнеров. Ассортимент впечатляет: компания предлагает 11 моделей, часть из которых представлена в наличии, остальное – под заказ. Основой является модульный принцип, что позволяет создавать боксы самых разных спецификаций для решения задач бизнеса.","html":"Компания «Проммайнер» является одним из крупнейших продавцов оборудования для добычи криптовалют на территории РФ. Помимо магазина – это еще и сервисный центр, инвестиционный формат, хостнг для размещения техники, а также изготовитель контейнеров. Ассортимент впечатляет: компания предлагает 11 моделей, часть из которых представлена в наличии, остальное – под заказ. Основой является модульный принцип, что позволяет создавать боксы самых разных спецификаций для решения задач бизнеса."}$p34$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kontejnerov-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 35, 'image',
       $p35${"src":"/images/articles/mining-containers-2026/promminer.png","alt":"PROMMINER — контейнеры для майнинга"}$p35$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kontejnerov-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 36, 'paragraph',
       $p36${"text":"Для создания комфортного температурного режима работы техники инженеры реализовали принцип прямого охлаждения. Несмотря на масштабы магазина и производителя, ощущается некоторый недостаток технической информации о моделях – нет видеообзоров, реальных фото готовой продукции и сертификатов. PROMMINER предлагает контейнеры как для частого использования (36 устройств), так для промышленных масштабов добычи (на 308 мест).","html":"Для создания комфортного температурного режима работы техники инженеры реализовали принцип прямого охлаждения. Несмотря на масштабы магазина и производителя, ощущается некоторый недостаток технической информации о моделях – нет видеообзоров, реальных фото готовой продукции и сертификатов. PROMMINER предлагает контейнеры как для частого использования (36 устройств), так для промышленных масштабов добычи (на 308 мест)."}$p36$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kontejnerov-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 37, 'stats',
       $p37${"rows":[{"label":"Производитель","value":"PROMMINER"},{"label":"Сайт","value":"promminer.ru"},{"label":"Год регистрации домена","value":"2019"},{"label":"Количество моделей в продаже","value":"11"},{"label":"Количество асиков для размещения","value":"от 36 до 308"},{"label":"Общая мощность","value":"от 0,198 до 1,355 МВт"},{"label":"Температурный диапазон эксплуатации","value":"нет данных"},{"label":"Охлаждение","value":"прямой принцип"},{"label":"Электрическая схема","value":"нет данных"},{"label":"Стоимость модельного ряда","value":"от 950 000 ₽ до 11 750 000 ₽"}]}$p37$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kontejnerov-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 38, 'pros_cons',
       $p38${"pros":["Крупнейший участник майнерского сектора в РФ: магазин, дата-центр, сервис, инвестиции","Внушительный ассортимент моделей","Удобный модульный принцип производства","Контейнеры в наличии и под заказ"],"cons":["Нехватка технических и презентационных данных","Высокая стоимость некоторых моделей"]}$p38$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kontejnerov-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 39, 'heading',
       $p39${"level":2,"text":"6 место: GreenChain Technologies"}$p39$::jsonb,
       'greenchain'
FROM articles a WHERE a.slug = 'rejting-kontejnerov-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 40, 'paragraph',
       $p40${"text":"Комплексный подход к майнинговой деятельности позволяет компании GreenChain Technologies оказывать весь спектр услуг, необходимых для добычи цифровых активов. Помимо продажи оборудования – это еще и майнинг-отель, сервисный центр, а также инвестиции «под ключ». Есть в ассортименте компании и модельный ряд контейнеров: восемь вариантов размещения вместимостью от 91 до 490 устройств.","html":"Комплексный подход к майнинговой деятельности позволяет компании GreenChain Technologies оказывать весь спектр услуг, необходимых для добычи цифровых активов. Помимо продажи оборудования – это еще и майнинг-отель, сервисный центр, а также инвестиции «под ключ». Есть в ассортименте компании и модельный ряд контейнеров: восемь вариантов размещения вместимостью от 91 до 490 устройств."}$p40$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kontejnerov-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 41, 'image',
       $p41${"src":"/images/articles/mining-containers-2026/greenchain.png","alt":"GreenChain Technologies — майнинг-контейнеры"}$p41$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kontejnerov-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 42, 'paragraph',
       $p42${"text":"Для удобного выбора подходящей модели был разработан простой конфигуратор: указав комплектацию и опции интересующей модели, потенциальный покупатель может сразу же узнать стоимость контейнера. Но несмотря на такой открытый подход, пользоваться сайтом несколько неудобно, особенно на мобильных устройствах. С одной стороны, опыт GreenChain Technologies и широкий спектр услуг вызывает уважение, но с другой – эргономика сайта оставляет желать лучшего.","html":"Для удобного выбора подходящей модели был разработан простой конфигуратор: указав комплектацию и опции интересующей модели, потенциальный покупатель может сразу же узнать стоимость контейнера. Но несмотря на такой открытый подход, пользоваться сайтом несколько неудобно, особенно на мобильных устройствах. С одной стороны, опыт GreenChain Technologies и широкий спектр услуг вызывает уважение, но с другой – эргономика сайта оставляет желать лучшего."}$p42$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kontejnerov-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 43, 'stats',
       $p43${"rows":[{"label":"Производитель","value":"GreenChain Technologies"},{"label":"Сайт","value":"greenchain.tech"},{"label":"Год регистрации домена","value":"2017"},{"label":"Количество моделей в продаже","value":"21"},{"label":"Количество асиков для размещения","value":"от 91 до 490"},{"label":"Общая мощность","value":"от 0,434 до 0,69 МВт"},{"label":"Температурный диапазон эксплуатации","value":"нет данных"},{"label":"Охлаждение","value":"прямой принцип (с пассивным или принудительным охлаждением)"},{"label":"Электрическая схема","value":"нет данных"},{"label":"Стоимость модельного ряда","value":"от 750 000 ₽ до 9 930 000 ₽"}]}$p43$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kontejnerov-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 44, 'pros_cons',
       $p44${"pros":["Комплексный подход к решению задач клиента","Достойный ассортимент моделей","Информативный сайт","Удобный конфигуратор","Наличие опций"],"cons":["Пользоваться сайтом откровенно неудобно"]}$p44$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kontejnerov-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 45, 'heading',
       $p45${"level":2,"text":"5 место: Гексакон"}$p45$::jsonb,
       'geksakon'
FROM articles a WHERE a.slug = 'rejting-kontejnerov-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 46, 'paragraph',
       $p46${"text":"Казанская компания ООО «ГЕКСАКОН» объединяет сразу три направления, связанных с процессом добычи цифровых активов. Помимо услуг по размещению оборудования заказчика и сервисного центра, это еще и продажа контейнеров для асиков. В модельном ассортименте производителя представлен только один вариант бокса – это 40-футовый контейнер на 300 майнеров с полностью готовой инфраструктурой.","html":"Казанская компания ООО «ГЕКСАКОН» объединяет сразу три направления, связанных с процессом добычи цифровых активов. Помимо услуг по размещению оборудования заказчика и сервисного центра, это еще и продажа контейнеров для асиков. В модельном ассортименте производителя представлен только один вариант бокса – это 40-футовый контейнер на 300 майнеров с полностью готовой инфраструктурой."}$p46$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kontejnerov-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 47, 'image',
       $p47${"src":"/images/articles/mining-containers-2026/geksakon.png","alt":"Гексакон — контейнер для майнинга"}$p47$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kontejnerov-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 48, 'paragraph',
       $p48${"text":"Приятно удивляют некоторые инженерные решения, призванные оптимизировать работу техники. Например, щит ВРУ вынесен наружу, а внутреннее пространство разделено на две независимые части. Система охлаждения стандартная (холодный и горячий коридоры с вентиляторами), однако, комплекс дополнен автоматикой, позволяющая сохранять программируемую температуру внутри модуля. Кроме того, реализован принцип подмеса горячего воздуха, позволяющий асикам работать в комфортных условиях даже в зимнее время года.","html":"Приятно удивляют некоторые инженерные решения, призванные оптимизировать работу техники. Например, щит ВРУ вынесен наружу, а внутреннее пространство разделено на две независимые части. Система охлаждения стандартная (холодный и горячий коридоры с вентиляторами), однако, комплекс дополнен автоматикой, позволяющая сохранять программируемую температуру внутри модуля. Кроме того, реализован принцип подмеса горячего воздуха, позволяющий асикам работать в комфортных условиях даже в зимнее время года."}$p48$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kontejnerov-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 49, 'stats',
       $p49${"rows":[{"label":"Производитель","value":"«ГЕКСАКОН»"},{"label":"Сайт","value":"geksakon.ru"},{"label":"Год регистрации домена","value":"2022"},{"label":"Количество моделей в продаже","value":"1"},{"label":"Количество асиков для размещения","value":"300"},{"label":"Общая мощность","value":"1,06 МВт"},{"label":"Температурный диапазон эксплуатации","value":"от -40 C до +35 C"},{"label":"Охлаждение","value":"прямой принцип + вентиляторы"},{"label":"Электрическая схема","value":"два независимых блока и внешний щит ВРУ"},{"label":"Стоимость модельного ряда","value":"по запросу"}]}$p49$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kontejnerov-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 50, 'pros_cons',
       $p50${"pros":["Проверенное решение от промышленных майнеров","Комплексный подход к добыче (не только изготовление контейнеров, но и хостинг с сервисными услугами)","Автоматическое управление температурой","Система подмеса горячего воздуха","Качественный сайт"],"cons":["Всего 1 модель в продаже","Стоимость по запросу","Небольшой объем фотоматериалов и технических данных"]}$p50$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kontejnerov-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 51, 'heading',
       $p51${"level":2,"text":"4 место: 1Mining"}$p51$::jsonb,
       '1mining'
FROM articles a WHERE a.slug = 'rejting-kontejnerov-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 52, 'paragraph',
       $p52${"text":"Компания 1Mining специализируется на производстве контейнеров для майнинга с 2019 года. Изготовитель предлагает несколько моделей, что закрывает потребности большинства майнеров, работающих в промышленном формате. Каждая модель дополнена множеством фотографий и подробными техническими характеристиками, что упрощает процедуру знакомства с ассортиментом. Правда, стоимость изделий не приведена – цены компания 1Mining предлагает узнавать лишь во время общения с менеджером. Как и технические характеристики изделий.","html":"Компания 1Mining специализируется на производстве контейнеров для майнинга с 2019 года. Изготовитель предлагает несколько моделей, что закрывает потребности большинства майнеров, работающих в промышленном формате. Каждая модель дополнена множеством фотографий и подробными техническими характеристиками, что упрощает процедуру знакомства с ассортиментом. Правда, стоимость изделий не приведена – цены компания 1Mining предлагает узнавать лишь во время общения с менеджером. Как и технические характеристики изделий."}$p52$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kontejnerov-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 53, 'image',
       $p53${"src":"/images/articles/mining-containers-2026/1mining.png","alt":"1Mining — контейнеры для майнинга"}$p53$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kontejnerov-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 54, 'paragraph',
       $p54${"text":"Сайт производителя нельзя назвать информативным и удобным: некоторые вопросы вызывает маркетинговая концепция ресурса. Создается впечатление, что нам пытаются продать вещь из телемагазина со всеми ее преимуществами, акциями и подарками при совершении заказа в первые 10 минут. Именно эта составляющая вызывает противоречия у потенциального покупателя.","html":"Сайт производителя нельзя назвать информативным и удобным: некоторые вопросы вызывает маркетинговая концепция ресурса. Создается впечатление, что нам пытаются продать вещь из телемагазина со всеми ее преимуществами, акциями и подарками при совершении заказа в первые 10 минут. Именно эта составляющая вызывает противоречия у потенциального покупателя."}$p54$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kontejnerov-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 55, 'stats',
       $p55${"rows":[{"label":"Производитель","value":"1Mining"},{"label":"Сайт","value":"1-mining.ru"},{"label":"Год регистрации домена","value":"2023"},{"label":"Количество моделей в продаже","value":"нет данных"},{"label":"Количество асиков для размещения","value":"нет данных"},{"label":"Общая мощность","value":"нет данных"},{"label":"Температурный диапазон эксплуатации","value":"нет данных"},{"label":"Охлаждение","value":"прямой принцип"},{"label":"Электрическая схема","value":"нет данных"},{"label":"Стоимость модельного ряда","value":"по запросу"}]}$p55$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kontejnerov-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 56, 'pros_cons',
       $p56${"pros":["Производство контейнеров с 2019 года","Профильная специализация компании на изготовлении боксов"],"cons":["Отсутствуют цены и характеристики на сайте","Противоречивая концепция сайта: формат классического маркетингового лендинга для серьезной товарной группы"]}$p56$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kontejnerov-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 57, 'heading',
       $p57${"level":2,"text":"3 место: Bitcube"}$p57$::jsonb,
       'bitcube'
FROM articles a WHERE a.slug = 'rejting-kontejnerov-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 58, 'paragraph',
       $p58${"text":"Производитель, предлагающий мощный модельный ряд контейнеров для майнингв в РФ: ассортимент состоит как из промышленных модификаций, так и небольших боксов для частного использования. Каждый вариант детально спроектирован и качественно выполнен с соблюдением всех требований удобства эксплуатации и безопасности. Разработчики Bitcube приняли решение задействовать концепцию прямого продува.","html":"Производитель, предлагающий мощный модельный ряд контейнеров для майнингв в РФ: ассортимент состоит как из промышленных модификаций, так и небольших боксов для частного использования. Каждый вариант детально спроектирован и качественно выполнен с соблюдением всех требований удобства эксплуатации и безопасности. Разработчики Bitcube приняли решение задействовать концепцию прямого продува."}$p58$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kontejnerov-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 59, 'image',
       $p59${"src":"/images/articles/mining-containers-2026/bitcube.png","alt":"Bitcube — контейнеры для майнинга"}$p59$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kontejnerov-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 60, 'paragraph',
       $p60${"text":"Впечатляет содержание презентационного сайта производителя: здесь есть исчерпывающая информация о продукции и ее технических особенностях: фото, видео, характеристики, спецификации, инструкции и сертификаты. Объем данных действительно впечатляет – такой открытый подход импонирует и вызывает уважение. Bitcube изготавливает контейнеры сразу на трех площадках в России, что говорит об успешности и популярности данной компании среди заказчиков.","html":"Впечатляет содержание презентационного сайта производителя: здесь есть исчерпывающая информация о продукции и ее технических особенностях: фото, видео, характеристики, спецификации, инструкции и сертификаты. Объем данных действительно впечатляет – такой открытый подход импонирует и вызывает уважение. Bitcube изготавливает контейнеры сразу на трех площадках в России, что говорит об успешности и популярности данной компании среди заказчиков."}$p60$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kontejnerov-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 61, 'stats',
       $p61${"rows":[{"label":"Производитель","value":"Bitcube"},{"label":"Сайт","value":"bit-cube.ru"},{"label":"Год регистрации домена","value":"2018"},{"label":"Количество моделей в продаже","value":"10"},{"label":"Количество асиков для размещения","value":"от 100 до 350"},{"label":"Общая мощность","value":"от 0,05 до 1,2 МВт"},{"label":"Температурный диапазон эксплуатации","value":"от -40 C до +35 C"},{"label":"Охлаждение","value":"прямой принцип"},{"label":"Электрическая схема","value":"нет данных"},{"label":"Стоимость модельного ряда","value":"от 2 450 000 ₽ до 4 380 000 ₽"}]}$p61$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kontejnerov-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 62, 'pros_cons',
       $p62${"pros":["Крупный и известный бренд с тремя производственными площадками","Широкий ассортимент продукции","Возможность заказать дополнительное оборудование и оснащение","Многообразие вариантов практически для любого объема техники","Качественный сайт с максимально подробной информацией","Удобные форматы выбора контейнера: каталог и конфигуратор","Максимальная степень защиты и автоматизации","Наличие небольших боксов для частного использования","Возможность работы не только с асиками, но и видеокартами"],"cons":["Высокая стоимость моделей"]}$p62$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kontejnerov-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 63, 'heading',
       $p63${"level":2,"text":"2 место: MinerPark"}$p63$::jsonb,
       'minerpark'
FROM articles a WHERE a.slug = 'rejting-kontejnerov-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 64, 'paragraph',
       $p64${"text":"Компания «ИНТОРА-ИНЖИНИРИНГ», выпускающая контейнеры для майнинга под брендом MinerPark, является частью инжинирингового холдинга «Свободные Технологии». Ключевых направлений работы два – это изготовление боксов для размещения майнерского оборудования, а такие дата-центр сразу в трех локациях (две в России или одна в США). Производитель успешно работает как с российскими клиентами, так и иностранными заказчиками по всему миру.","html":"Компания «ИНТОРА-ИНЖИНИРИНГ», выпускающая контейнеры для майнинга под брендом MinerPark, является частью инжинирингового холдинга «Свободные Технологии». Ключевых направлений работы два – это изготовление боксов для размещения майнерского оборудования, а такие дата-центр сразу в трех локациях (две в России или одна в США). Производитель успешно работает как с российскими клиентами, так и иностранными заказчиками по всему миру."}$p64$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kontejnerov-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 65, 'image',
       $p65${"src":"/images/articles/mining-containers-2026/minerpark.png","alt":"MinerPark — контейнеры для майнинга"}$p65$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kontejnerov-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 66, 'paragraph',
       $p66${"text":"Модельный ряд бренда состоит из четырех модификаций контейнеров различной вместимости – от 90 до 480 асиков. Основой производства является стандартный морской бокс. Охлаждение строится на принципе разделения потоков на холодный и горячий коридоры с добавлением системы вентиляторов. Продукция предоставляется в полностью собранном виде, сразу готовым к запуску.","html":"Модельный ряд бренда состоит из четырех модификаций контейнеров различной вместимости – от 90 до 480 асиков. Основой производства является стандартный морской бокс. Охлаждение строится на принципе разделения потоков на холодный и горячий коридоры с добавлением системы вентиляторов. Продукция предоставляется в полностью собранном виде, сразу готовым к запуску."}$p66$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kontejnerov-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 67, 'stats',
       $p67${"rows":[{"label":"Производитель","value":"«ИНТОРА-ИНЖИНИРИНГ»"},{"label":"Сайт","value":"miner-park.ru"},{"label":"Год регистрации домена","value":"2018"},{"label":"Количество моделей в продаже","value":"4"},{"label":"Количество асиков для размещения","value":"от 90 до 480"},{"label":"Общая мощность","value":"от 0,32 до 1,8 МВт"},{"label":"Температурный диапазон эксплуатации","value":"от -45 C до +35 C"},{"label":"Охлаждение","value":"прямой принцип + вентиляторы"},{"label":"Электрическая схема","value":"несколько независимых блоков"},{"label":"Стоимость модельного ряда","value":"по запросу"}]}$p67$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kontejnerov-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 68, 'pros_cons',
       $p68${"pros":["Проверенный производитель, являющийся частью крупного инжинирингового холдинга","Наличие не только российских, но и международных клиентов","Достойный модельный ряд","Возможность удешевления продукции за счет ряда технических решений","Наличие дополнительного оборудования, устанавливаемого по запросу (рекуперация воздуха, сигнализация, видеонаблюдение, удаленный контроль и т.д.)","Информативный сайт с исчерпывающей информацией"],"cons":["Отсутствие цен на сайте"]}$p68$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kontejnerov-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 69, 'heading',
       $p69${"level":2,"text":"1 место: Bitferma"}$p69$::jsonb,
       'bitferma'
FROM articles a WHERE a.slug = 'rejting-kontejnerov-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 70, 'paragraph',
       $p70${"text":"Производитель контейнеров для майнинга Bitferma ориентирован на максимально полное и качественное знакомство потенциальных покупателей с собственной продукцией. На подробном и удобном сайте представлена вся необходимая информация: модельный ряд с техническим описанием и видеообзор, рендеры изделий и спецификации, цены и даже официальные сертификаты соответствия. В плане количества полезных данных на своем сайте Bitferma является одним из лучших производителей.","html":"Производитель контейнеров для майнинга Bitferma ориентирован на максимально полное и качественное знакомство потенциальных покупателей с собственной продукцией. На подробном и удобном сайте представлена вся необходимая информация: модельный ряд с техническим описанием и видеообзор, рендеры изделий и спецификации, цены и даже официальные сертификаты соответствия. В плане количества полезных данных на своем сайте Bitferma является одним из лучших производителей."}$p70$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kontejnerov-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 71, 'image',
       $p71${"src":"/images/articles/mining-containers-2026/bitferma.png","alt":"Bitferma — контейнеры для майнинга"}$p71$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kontejnerov-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 72, 'paragraph',
       $p72${"text":"Компания предлагает четыре модели контейнеров вместимостью от 180 до 400 асиков. Каждая позиция подробно описана и качественно презентована. Впечатляет внушительное число инженерных решений – полная автоматизация, системы защиты и контроля. Необходимые данные можно найти на самом сайте производителя, а также скачать в виде подробных презентаций.","html":"Компания предлагает четыре модели контейнеров вместимостью от 180 до 400 асиков. Каждая позиция подробно описана и качественно презентована. Впечатляет внушительное число инженерных решений – полная автоматизация, системы защиты и контроля. Необходимые данные можно найти на самом сайте производителя, а также скачать в виде подробных презентаций."}$p72$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kontejnerov-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 73, 'stats',
       $p73${"rows":[{"label":"Производитель","value":"Bitferma"},{"label":"Сайт","value":"bitferma.ru"},{"label":"Год регистрации домена","value":"2017"},{"label":"Количество моделей в продаже","value":"4"},{"label":"Количество асиков для размещения","value":"от 180 до 360"},{"label":"Общая мощность","value":"от 0,66 до 1,43 МВт"},{"label":"Температурный диапазон эксплуатации","value":"от -40 C до +35 C"},{"label":"Охлаждение","value":"холодный и горячие коридоры + вентиляторы"},{"label":"Электрическая схема","value":"нет данных"},{"label":"Стоимость модельного ряда","value":"от 2 970 000 ₽ до 4 000 000 ₽"}]}$p73$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kontejnerov-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 74, 'pros_cons',
       $p74${"pros":["Работа на рынке инфраструктуры для майнинга с 2016 года","Максимально подробный сайт с внушительным объемом данных","Наличие видеообзора контейнеров","Достойный модельный ряд","Боксы «под ключ» с наличием всех необходимых систем и дополнений","Максимальная автоматизация и степень защиты","Альтернативный формат вентиляции (непрямой)","Наличие официальных сертификатов"],"cons":["Отсутствие фотографий готовых изделий на сайте"]}$p74$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kontejnerov-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 75, 'heading',
       $p75${"level":2,"text":"Выводы"}$p75$::jsonb,
       'vyvody'
FROM articles a WHERE a.slug = 'rejting-kontejnerov-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 76, 'paragraph',
       $p76${"text":"Контейнеры для майнинга – это оптимальное решение для тех, кто хочет быстро масштабировать ферму, снизить затраты на инфраструктуру и обеспечить стабильную работу оборудования. Они особенно полезны в регионах с дешевой электроэнергией, холодным климатом и удаленными площадками. Правильно выбранный и установленный контейнер способен значительно повысить рентабельность майнинга.","html":"Контейнеры для майнинга – это оптимальное решение для тех, кто хочет быстро масштабировать ферму, снизить затраты на инфраструктуру и обеспечить стабильную работу оборудования. Они особенно полезны в регионах с дешевой электроэнергией, холодным климатом и удаленными площадками. Правильно выбранный и установленный контейнер способен значительно повысить рентабельность майнинга."}$p76$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kontejnerov-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 77, 'paragraph',
       $p77${"text":"Если вам нужна консультация по подбору контейнера, анализу локации или проектированию инфраструктуры, обращайтесь к специалистам ТОП МАЙНИНГ: индивидуальный подход и технический аудит помогут избежать дорогих ошибок.","html":"Если вам нужна консультация по подбору контейнера, анализу локации или проектированию инфраструктуры, обращайтесь к специалистам ТОП МАЙНИНГ: индивидуальный подход и технический аудит помогут избежать дорогих ошибок."}$p77$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kontejnerov-dlya-majninga-top-10';

-- =====================================================================
-- 036_article_quiet_asics.sql
-- =====================================================================

-- Самые тихие асики для майнинга в квартире: ТОП-8

INSERT INTO articles (
    slug, title, title_subtitle, excerpt, content, topic_id,
    reading_time_min, reading_minutes, published_at, view_count,
    display_type, sort_order, is_published, uses_blocks,
    image_url, image_alt
) VALUES (
    'samyj-tihij-asik-dlya-majninga-v-kvartire-top-5',
    'Самые тихие асики для майнинга в квартире',
    'ТОП-8',
    $excerpt$ТОП-8 самых тихих асиков для майнинга в квартире: от IceRiver KS0 Pro до ElphaPex DG Home 1 — бесшумные модели для дома.$excerpt$,
    $content$Введение

Добыча криптовалюты возможна не только в профильных помещениях — есть формат тихого домашнего майнинга.

Выводы

Инвестиции в тишину окупаются спокойствием и устойчивой работой фермы.$content$,
    'mining',
    9,
    9,
    '2023-03-12',
    1914,
    'list',
    16,
    TRUE,
    TRUE,
    '/images/articles/quiet-asics-2026/elphapex-dg-home-1.png',
    'ElphaPex DG Home 1'
)
ON CONFLICT (slug) DO UPDATE SET
    title = EXCLUDED.title,
    title_subtitle = EXCLUDED.title_subtitle,
    excerpt = EXCLUDED.excerpt,
    content = EXCLUDED.content,
    reading_time_min = EXCLUDED.reading_time_min,
    reading_minutes = EXCLUDED.reading_minutes,
    published_at = EXCLUDED.published_at,
    view_count = EXCLUDED.view_count,
    uses_blocks = TRUE,
    image_url = EXCLUDED.image_url,
    image_alt = EXCLUDED.image_alt,
    is_published = TRUE;

DELETE FROM article_blocks
WHERE article_id = (SELECT id FROM articles WHERE slug = 'samyj-tihij-asik-dlya-majninga-v-kvartire-top-5');

UPDATE rating_items
SET href = '/articles/samyj-tihij-asik-dlya-majninga-v-kvartire-top-5',
    label = 'Самые тихие асики для майнинга в квартире: ТОП-8'
WHERE href LIKE '%samyj-tihij-asik-dlya-majninga-v-kvartire%'
   OR label ILIKE '%тихие асики%';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 1, 'heading',
       $p1${"level":2,"text":"Введение"}$p1$::jsonb,
       'vvedenie'
FROM articles a WHERE a.slug = 'samyj-tihij-asik-dlya-majninga-v-kvartire-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 2, 'paragraph',
       $p2${"text":"Добыча криптовалюты возможна не только в профильных и специально подготовленных для этих целей помещениях. Существует формат домашнего майнинга, в рамках которого целесообразно использовать оборудование, отличающееся невысоким уровнем шума. Представляем вашему вниманию рейтинг – самые тихие асики для майнинга в квартире: ТОП-8 бесшумных устройств, работа которых будет практически незаметна для вас и ваших соседей.","html":"Добыча криптовалюты возможна не только в профильных и специально подготовленных для этих целей помещениях. Существует формат домашнего майнинга, в рамках которого целесообразно использовать оборудование, отличающееся невысоким уровнем шума. Представляем вашему вниманию рейтинг – самые тихие асики для майнинга в квартире: ТОП-8 бесшумных устройств, работа которых будет практически незаметна для вас и ваших соседей."}$p2$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samyj-tihij-asik-dlya-majninga-v-kvartire-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 3, 'image',
       $p3${"src":"/images/articles/quiet-asics-2026/intro-home.png","alt":"Тихий домашний майнинг в квартире"}$p3$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samyj-tihij-asik-dlya-majninga-v-kvartire-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 4, 'heading',
       $p4${"level":2,"text":"Почему в квартире важно использовать только тихие асики?"}$p4$::jsonb,
       'pochemu-tihie'
FROM articles a WHERE a.slug = 'samyj-tihij-asik-dlya-majninga-v-kvartire-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 5, 'paragraph',
       $p5${"text":"Шум от стандартного оборудования способен не просто мешать сну или работе, а буквально выживать жильцов из собственных квартир. Поэтому использование «тихих» асиков – не роскошь, а необходимость.","html":"Шум от стандартного оборудования способен не просто мешать сну или работе, а буквально выживать жильцов из собственных квартир. Поэтому использование «тихих» асиков – не роскошь, а необходимость."}$p5$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samyj-tihij-asik-dlya-majninga-v-kvartire-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 6, 'paragraph',
       $p6${"text":"Почему шум – это критично?","html":"Почему шум – это критично?"}$p6$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samyj-tihij-asik-dlya-majninga-v-kvartire-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 7, 'rich_list',
       $p7${"ordered":false,"items":[{"title":"Здоровье и психика","text":"Человеческий мозг крайне чувствителен к фоновому шуму. Постоянный гул вентиляторов (а уровень шума у стандартных асиков может доходить до 80–90 дБ – как у работающего пылесоса) может привести к хронической усталости, бессоннице, раздражительности, снижению концентрации и работоспособности;"},{"title":"Отношения с соседями","text":"Шум легко проходит через стены и полы: даже если вы готовы терпеть гудение оборудования, ваши соседи вряд ли разделят энтузиазм. Это чревато жалобами, конфликтами и даже вмешательством со стороны правоохранительных органов."}]}$p7$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samyj-tihij-asik-dlya-majninga-v-kvartire-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 8, 'paragraph',
       $p8${"text":"Как решить данную проблему? Тишину можно обеспечить несколькими способами, и современные производители оборудования (и периферии) позволяют добиться поставленной цели несколькими способами:","html":"Как решить данную проблему? Тишину можно обеспечить несколькими способами, и современные производители оборудования (и периферии) позволяют добиться поставленной цели несколькими способами:"}$p8$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samyj-tihij-asik-dlya-majninga-v-kvartire-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 9, 'rich_list',
       $p9${"ordered":false,"items":[{"title":"Асики с пассивным или модифицированным охлаждением","text":"Вместо стандартных вентиляторов используются тихие кулеры с большими лопастями или даже водяное охлаждение (liquid cooling). Такие решения снижают уровень шума до 40–50 дБ, что сравнимо с обычным настольным ПК;"},{"title":"Шумопоглощающие корпуса (шумбоксы)","text":"Асики помещают в специальные боксы, где используются звукопоглощающие материалы (вроде вспененного полиуретана, каменной ваты и т.д.). Это особенно удобно, если у вас уже есть «шумный» асик, но вы хотите снизить уровень гула;"},{"title":"Низковаттные и энергоэффективные модели","text":"Асики с пониженным энергопотреблением (например, те, что рассчитаны на майнинг менее ресурсоемких монет, как Kaspa или Dogecoin) в целом выделяют меньше тепла, требуют меньшего охлаждения и, соответственно, работают тише."}]}$p9$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samyj-tihij-asik-dlya-majninga-v-kvartire-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 10, 'paragraph',
       $p10${"text":"А теперь познакомимся с ТОП-8 самых тихих асиков для оптимального запуска в домашних условиях.","html":"А теперь познакомимся с ТОП-8 самых тихих асиков для оптимального запуска в домашних условиях."}$p10$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samyj-tihij-asik-dlya-majninga-v-kvartire-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 11, 'heading',
       $p11${"level":2,"text":"8 место: IceRiver KS0 Pro"}$p11$::jsonb,
       'iceriver-ks0-pro'
FROM articles a WHERE a.slug = 'samyj-tihij-asik-dlya-majninga-v-kvartire-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 12, 'paragraph',
       $p12${"text":"Современный асик с пассивной системой охлаждения – в конструкции устройства нет ни одного вентилятора, поэтому работа модели абсолютно бесшумна. Техника ориентирована на добычу монеты Kaspa (KAS) – это достаточно популярный сегодня альткоин, майнинг которого выгоден и крайне рентабелен. В качестве альтернативы можно выбрать еще пару активов – это малоизвестные Sedra (SDR) и Bugna (BGA). Но данный факт следует считать недостатком, так как в случае серьезного снижения курса KAS, использовать IceRiver KS0 Pro станет невыгодно. А добыча остальных токенов рискованна из-за незначительной их популярности.","html":"Современный асик с пассивной системой охлаждения – в конструкции устройства нет ни одного вентилятора, поэтому работа модели абсолютно бесшумна. Техника ориентирована на добычу монеты Kaspa (KAS) – это достаточно популярный сегодня альткоин, майнинг которого выгоден и крайне рентабелен. В качестве альтернативы можно выбрать еще пару активов – это малоизвестные Sedra (SDR) и Bugna (BGA). Но данный факт следует считать недостатком, так как в случае серьезного снижения курса KAS, использовать IceRiver KS0 Pro станет невыгодно. А добыча остальных токенов рискованна из-за незначительной их популярности."}$p12$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samyj-tihij-asik-dlya-majninga-v-kvartire-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 13, 'image',
       $p13${"src":"/images/articles/quiet-asics-2026/iceriver-ks0-pro.png","alt":"IceRiver KS0 Pro"}$p13$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samyj-tihij-asik-dlya-majninga-v-kvartire-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 14, 'paragraph',
       $p14${"text":"Модель KS0 Pro – это не только один самых тихих асиков, но и весьма экономичная модель с точки зрения потребления электричества. Потребляемая мощность составляет всего 100 Ватт, что сравнимо с работой обыкновенного ноутбука. Для успешной работы асика достаточно традиционного помещения с хорошей циркуляцией воздуха.","html":"Модель KS0 Pro – это не только один самых тихих асиков, но и весьма экономичная модель с точки зрения потребления электричества. Потребляемая мощность составляет всего 100 Ватт, что сравнимо с работой обыкновенного ноутбука. Для успешной работы асика достаточно традиционного помещения с хорошей циркуляцией воздуха."}$p14$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samyj-tihij-asik-dlya-majninga-v-kvartire-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 15, 'stats',
       $p15${"rows":[{"label":"Производитель","value":"IceRiver"},{"label":"Год выпуска","value":"2023"},{"label":"Базовый хешрейт","value":"200 ГХ /с"},{"label":"Энергопотребление","value":"100 Вт"},{"label":"Энергоэффективность","value":"0,5 Вт на ГХ"},{"label":"Алгоритм","value":"kHeavyHash"},{"label":"Количество монет, доступных для майнинга","value":"3"},{"label":"Размеры","value":"20 x 19,4 x 7,4 см"},{"label":"Масса","value":"3,2 кг"},{"label":"Уровень шума","value":"25 ДБ"}]}$p15$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samyj-tihij-asik-dlya-majninga-v-kvartire-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 16, 'pros_cons',
       $p16${"pros":["Один из самых тихих асиков на рынке (конструкция без вентиляторов)","Компактность, малый вес","Небольшой объем энергопотребления"],"cons":["Ориентация только на три монеты","Небольшая производительность по сравнению с традиционным оборудованием для добычи KAS","Не самый популярный производитель – возможные трудности с ремонтом и поиском запчастей"]}$p16$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samyj-tihij-asik-dlya-majninga-v-kvartire-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 17, 'heading',
       $p17${"level":2,"text":"7 место: Goldshell KA Box Pro"}$p17$::jsonb,
       'goldshell-ka-box-pro'
FROM articles a WHERE a.slug = 'samyj-tihij-asik-dlya-majninga-v-kvartire-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 18, 'paragraph',
       $p18${"text":"Свежая модель от компании Goldshell, которая известна своей техникой для добычи альткоинов. Асик KA Box Pro работает на алгоритме kHeavyHash, который предполагает добычу только трех монет – это Kaspa (KAS), Sedra (SDR) и Bugna (BGA). В рамках данного формата модель от Goldshell представляет собой переходную линию от маломощных систем с пассивным охлаждением (например, IceRiver KS0 Pro) к классической технике с мощными вентиляторами (непригодной для домашнего использования).","html":"Свежая модель от компании Goldshell, которая известна своей техникой для добычи альткоинов. Асик KA Box Pro работает на алгоритме kHeavyHash, который предполагает добычу только трех монет – это Kaspa (KAS), Sedra (SDR) и Bugna (BGA). В рамках данного формата модель от Goldshell представляет собой переходную линию от маломощных систем с пассивным охлаждением (например, IceRiver KS0 Pro) к классической технике с мощными вентиляторами (непригодной для домашнего использования)."}$p18$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samyj-tihij-asik-dlya-majninga-v-kvartire-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 19, 'image',
       $p19${"src":"/images/articles/quiet-asics-2026/goldshell-ka-box-pro.png","alt":"Goldshell KA Box Pro"}$p19$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samyj-tihij-asik-dlya-majninga-v-kvartire-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 20, 'paragraph',
       $p20${"text":"Уровень шума, возникающий во время работы асика, не превышает 55 Децибел, потребление электричества также приемлемое – 600 Ватт. Модель новая (аппарат появился на свет в 2024 году), поэтому большого количества отзывов о надежности разработки пока нет. Тем не менее, концепция весьма привлекательная: формат предполагает добычу в домашних условиях с получением ощутимых доходов.","html":"Уровень шума, возникающий во время работы асика, не превышает 55 Децибел, потребление электричества также приемлемое – 600 Ватт. Модель новая (аппарат появился на свет в 2024 году), поэтому большого количества отзывов о надежности разработки пока нет. Тем не менее, концепция весьма привлекательная: формат предполагает добычу в домашних условиях с получением ощутимых доходов."}$p20$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samyj-tihij-asik-dlya-majninga-v-kvartire-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 21, 'stats',
       $p21${"rows":[{"label":"Производитель","value":"Goldshell"},{"label":"Год выпуска","value":"2024"},{"label":"Базовый хешрейт","value":"1 600 ТХ /с"},{"label":"Энергопотребление","value":"600 Вт"},{"label":"Энергоэффективность","value":"0,375 Вт на ТХ"},{"label":"Алгоритм","value":"kHeavyHash"},{"label":"Количество монет, доступных для майнинга","value":"3"},{"label":"Размеры","value":"37 x 19,6 x 29 см"},{"label":"Масса","value":"3 кг"},{"label":"Уровень шума","value":"55 ДБ"}]}$p21$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samyj-tihij-asik-dlya-majninga-v-kvartire-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 22, 'pros_cons',
       $p22${"pros":["Один из самых производительных асиков на kHeavyHash, подходящий для домашнего использования","Приемлемый уровень шума","Небольшой объем потребления электричества","Компактность и малый вес"],"cons":["Риски добычи альткоинов с малой капитализацией","Не самый известный производитель, что усложняет ремонт","Новая модель без наличия отзывов от реальных пользователей"]}$p22$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samyj-tihij-asik-dlya-majninga-v-kvartire-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 23, 'heading',
       $p23${"level":2,"text":"6 место: Goldshell Mini-DOGE III"}$p23$::jsonb,
       'goldshell-mini-doge-iii'
FROM articles a WHERE a.slug = 'samyj-tihij-asik-dlya-majninga-v-kvartire-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 24, 'paragraph',
       $p24${"text":"Алгоритм Scrypt хорошо знаком опытным майнерам, ведь именно в таком формате добываются такие известные монеты, как LTC и DOGE. Это надежные активы, которые торгуются на большинстве бирж и входят в ТОП-20 криптовалют по объемам капитализации. Goldshell Mini-DOGE III оптимален для использования в домашних условиях: уровень работы шума не превышает 35 Децибел, а потребляемая мощность – всего 400 Ватт. Если рассматривать такой параметр, как энергоэффективность, можно отметить блестящую метрику – одно из лучших значений для сегмента в рамках алгоритма Scrypt.","html":"Алгоритм Scrypt хорошо знаком опытным майнерам, ведь именно в таком формате добываются такие известные монеты, как LTC и DOGE. Это надежные активы, которые торгуются на большинстве бирж и входят в ТОП-20 криптовалют по объемам капитализации. Goldshell Mini-DOGE III оптимален для использования в домашних условиях: уровень работы шума не превышает 35 Децибел, а потребляемая мощность – всего 400 Ватт. Если рассматривать такой параметр, как энергоэффективность, можно отметить блестящую метрику – одно из лучших значений для сегмента в рамках алгоритма Scrypt."}$p24$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samyj-tihij-asik-dlya-majninga-v-kvartire-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 25, 'image',
       $p25${"src":"/images/articles/quiet-asics-2026/goldshell-mini-doge.png","alt":"Goldshell Mini-DOGE III"}$p25$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samyj-tihij-asik-dlya-majninga-v-kvartire-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 26, 'paragraph',
       $p26${"text":"Асик выполнен в классическом форм-факторе с двумя вентиляторами для охлаждения. Модель отличается компактностью и стильным внешним видом, что упрощает работу в домашних условиях. Производитель достаточно хорошо знаком многим майнерам: компания Goldshell специализируется на производстве техники для добычи альткионов.","html":"Асик выполнен в классическом форм-факторе с двумя вентиляторами для охлаждения. Модель отличается компактностью и стильным внешним видом, что упрощает работу в домашних условиях. Производитель достаточно хорошо знаком многим майнерам: компания Goldshell специализируется на производстве техники для добычи альткионов."}$p26$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samyj-tihij-asik-dlya-majninga-v-kvartire-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 27, 'stats',
       $p27${"rows":[{"label":"Производитель","value":"Goldshell"},{"label":"Год выпуска","value":"2023"},{"label":"Базовый хешрейт","value":"700 МХ /с"},{"label":"Энергопотребление","value":"400 Вт"},{"label":"Энергоэффективность","value":"0,57 Вт на МХ"},{"label":"Алгоритм","value":"Scrypt"},{"label":"Количество монет, доступных для майнинга","value":"22"},{"label":"Размеры","value":"20 x 15 x 9,6 см"},{"label":"Масса","value":"2,2 кг"},{"label":"Уровень шума","value":"35 ДБ"}]}$p27$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samyj-tihij-asik-dlya-majninga-v-kvartire-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 28, 'pros_cons',
       $p28${"pros":["Работа в рамках надежного алгоритма Scrypt: возможность добычи более двух десятков монет, включая LTC и DOGE","Низкий уровень шума","Отличная энергоэффективность в рамках алгоритма Scrypt","Компактность, малый вес, небольшое потребление"],"cons":["Не самый популярный производитель","Редкая модель со своей спецификой ремонта"]}$p28$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samyj-tihij-asik-dlya-majninga-v-kvartire-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 29, 'heading',
       $p29${"level":2,"text":"5 место: iPollo V1 Mini"}$p29$::jsonb,
       'ipollo-v1-mini'
FROM articles a WHERE a.slug = 'samyj-tihij-asik-dlya-majninga-v-kvartire-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 30, 'paragraph',
       $p30${"text":"Во время своего появления в 2022 году линейка V1 Mini от компании iPollo стала настоящие открытием. Это серия компактных и бесшумных устройств, ориентированных на домашнее применение в рамках алгоритма Ethash. С помощью такой техники можно добывать несколько десятков криптовалют, включая известный многим Ethereum Classic (ETC). Еще одно преимущество модели – наличие Wi-Fi модуля, что исключает необходимость проводного соединения.","html":"Во время своего появления в 2022 году линейка V1 Mini от компании iPollo стала настоящие открытием. Это серия компактных и бесшумных устройств, ориентированных на домашнее применение в рамках алгоритма Ethash. С помощью такой техники можно добывать несколько десятков криптовалют, включая известный многим Ethereum Classic (ETC). Еще одно преимущество модели – наличие Wi-Fi модуля, что исключает необходимость проводного соединения."}$p30$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samyj-tihij-asik-dlya-majninga-v-kvartire-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 31, 'image',
       $p31${"src":"/images/articles/quiet-asics-2026/ipollo-v1-mini.png","alt":"iPollo V1 Mini"}$p31$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samyj-tihij-asik-dlya-majninga-v-kvartire-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 32, 'paragraph',
       $p32${"text":"Уровень доходов, получаемых при работе с линейкой Mini, незначительный. Данный формат подходит для минимального пассивного заработка, либо для знакомства с сегментом криптовалют с перспективой дальнейшего переезда на традиционную технику. Например, тот же производитель iPollo предлагает классические асики на Ethash, производительность которых значительно выше. Однако их использование в домашних условиях затруднительно.","html":"Уровень доходов, получаемых при работе с линейкой Mini, незначительный. Данный формат подходит для минимального пассивного заработка, либо для знакомства с сегментом криптовалют с перспективой дальнейшего переезда на традиционную технику. Например, тот же производитель iPollo предлагает классические асики на Ethash, производительность которых значительно выше. Однако их использование в домашних условиях затруднительно."}$p32$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samyj-tihij-asik-dlya-majninga-v-kvartire-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 33, 'stats',
       $p33${"rows":[{"label":"Производитель","value":"IPollo Miner"},{"label":"Год выпуска","value":"2022"},{"label":"Базовый хешрейт","value":"130-400 МХ /с"},{"label":"Энергопотребление","value":"104-232 Вт"},{"label":"Энергоэффективность","value":"0,58-0,8 Вт на МХ"},{"label":"Алгоритм","value":"EtHash и EtcHash"},{"label":"Количество монет, доступных для майнинга","value":"36"},{"label":"Размеры","value":"от 17,9 x 14,3 x 9"},{"label":"Масса","value":"2,1 кг"},{"label":"Уровень шума","value":"от 55 ДБ"}]}$p33$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samyj-tihij-asik-dlya-majninga-v-kvartire-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 34, 'pros_cons',
       $p34${"pros":["Полноценная линейка устройств с разной производительностью","Подобный формат добычи альткоинов в домашних условиях","Наличие Wi-Fi подключения","Проверенный алгоритм работы","Множество монет для майнинга"],"cons":["Достаточно молодой производитель","Низкая энергоэффективность некоторых моделей"]}$p34$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samyj-tihij-asik-dlya-majninga-v-kvartire-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 35, 'heading',
       $p35${"level":2,"text":"4 место: Canaan Avalon Mini 3"}$p35$::jsonb,
       'canaan-avalon-mini-3'
FROM articles a WHERE a.slug = 'samyj-tihij-asik-dlya-majninga-v-kvartire-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 36, 'paragraph',
       $p36${"text":"Canaan Avalon Mini 3 — самый «домашний» ASIC в линейке Avalon, созданный специально для работы в жилой среде. В отличие от классических майнеров, эта модель выполнена в формате компактного обогревателя, который не только добывает Bitcoin, но и эффективно согревает помещение. Такой подход делает устройство особенно привлекательным для тех, кто хочет совмещать майнинг с бытовой пользой — например, отапливать комнату в межсезонье или зимой.","html":"Canaan Avalon Mini 3 — самый «домашний» ASIC в линейке Avalon, созданный специально для работы в жилой среде. В отличие от классических майнеров, эта модель выполнена в формате компактного обогревателя, который не только добывает Bitcoin, но и эффективно согревает помещение. Такой подход делает устройство особенно привлекательным для тех, кто хочет совмещать майнинг с бытовой пользой — например, отапливать комнату в межсезонье или зимой."}$p36$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samyj-tihij-asik-dlya-majninga-v-kvartire-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 37, 'image',
       $p37${"src":"/images/articles/quiet-asics-2026/canaan-avalon-mini-3.png","alt":"Canaan Avalon Mini 3"}$p37$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samyj-tihij-asik-dlya-majninga-v-kvartire-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 38, 'paragraph',
       $p38${"text":"Главное преимущество Avalon Mini 3 — очень низкий уровень шума, всего около 40 дБ. Это сопоставимо с обычным настольным компьютером или тихим вентилятором. Майнер можно разместить прямо в квартире, спальне, кабинете или частном доме — его работа не будет создавать дискомфорт, что делает модель одним из лучших вариантов для домашнего майнинга в 2024–2025 годах.","html":"Главное преимущество Avalon Mini 3 — очень низкий уровень шума, всего около 40 дБ. Это сопоставимо с обычным настольным компьютером или тихим вентилятором. Майнер можно разместить прямо в квартире, спальне, кабинете или частном доме — его работа не будет создавать дискомфорт, что делает модель одним из лучших вариантов для домашнего майнинга в 2024–2025 годах."}$p38$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samyj-tihij-asik-dlya-majninga-v-kvartire-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 39, 'paragraph',
       $p39${"text":"При этом устройство работает на алгоритме SHA-256 и подходит для добычи Bitcoin. Хешрейт составляет 37.5 Th/s — это не промышленный уровень, но для домашнего сценария модель предлагает сбалансированное сочетание производительности, тишины и энергоэффективности.","html":"При этом устройство работает на алгоритме SHA-256 и подходит для добычи Bitcoin. Хешрейт составляет 37.5 Th/s — это не промышленный уровень, но для домашнего сценария модель предлагает сбалансированное сочетание производительности, тишины и энергоэффективности."}$p39$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samyj-tihij-asik-dlya-majninga-v-kvartire-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 40, 'stats',
       $p40${"rows":[{"label":"Производитель","value":"Canaan"},{"label":"Модель","value":"Avalon Mini 3"},{"label":"Алгоритм","value":"SHA-256"},{"label":"Хешрейт","value":"37.50 Th/s"},{"label":"Потребление","value":"800 Вт"},{"label":"Монеты для майнинга","value":"BTC"},{"label":"Уровень шума","value":"40 дБ"},{"label":"Размеры","value":"250 × 180 × 120 мм"},{"label":"Вес","value":"4 кг"},{"label":"Год выпуска","value":"2024"}]}$p40$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samyj-tihij-asik-dlya-majninga-v-kvartire-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 41, 'pros_cons',
       $p41${"pros":["Форм-фактор обогревателя позволяет обогревать помещение во время майнинга","Очень низкий уровень шума — подходит для квартиры и других жилых помещений","Энергоэффективность, приемлемая для домашнего использования","Добыча Bitcoin – первой криптовалюты мира","Компактные габариты и малый вес"],"cons":["Невысокая производительность для алгоритма SHA-256","Ограниченная доступность из-за специфичного позиционирования"]}$p41$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samyj-tihij-asik-dlya-majninga-v-kvartire-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 42, 'heading',
       $p42${"level":2,"text":"3 место: Canaan Avalon Q"}$p42$::jsonb,
       'canaan-avalon-q'
FROM articles a WHERE a.slug = 'samyj-tihij-asik-dlya-majninga-v-kvartire-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 43, 'paragraph',
       $p43${"text":"Canaan Avalon Q — сбалансированный ASIC для тех, кто ищет мощность, стабильность и приемлемый уровень шума в домашних условиях. Устройство работает на алгоритме SHA-256 и ориентировано на добычу Bitcoin, предлагая хешрейт 90 Th/s при потреблении 1 675 Вт. Это добротное сочетание для майнеров, которые хотят получать уверенную доходность без перехода к промышленным фермам.","html":"Canaan Avalon Q — сбалансированный ASIC для тех, кто ищет мощность, стабильность и приемлемый уровень шума в домашних условиях. Устройство работает на алгоритме SHA-256 и ориентировано на добычу Bitcoin, предлагая хешрейт 90 Th/s при потреблении 1 675 Вт. Это добротное сочетание для майнеров, которые хотят получать уверенную доходность без перехода к промышленным фермам."}$p43$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samyj-tihij-asik-dlya-majninga-v-kvartire-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 44, 'image',
       $p44${"src":"/images/articles/quiet-asics-2026/canaan-avalon-q.png","alt":"Canaan Avalon Q"}$p44$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samyj-tihij-asik-dlya-majninga-v-kvartire-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 45, 'paragraph',
       $p45${"text":"Уровень шума около 65 дБ делает Avalon Q значительно громче «тихих» домашних моделей, но все же пригодным для расположения в жилой среде — например, в отдельной комнате, на балконе, в кладовке или подсобке. Шум приблизительно сопоставим с работающим бытовым кондиционером на высокой мощности. Для части пользователей такой уровень вполне комфортен, особенно при грамотной организации вентиляции и размещения.","html":"Уровень шума около 65 дБ делает Avalon Q значительно громче «тихих» домашних моделей, но все же пригодным для расположения в жилой среде — например, в отдельной комнате, на балконе, в кладовке или подсобке. Шум приблизительно сопоставим с работающим бытовым кондиционером на высокой мощности. Для части пользователей такой уровень вполне комфортен, особенно при грамотной организации вентиляции и размещения."}$p45$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samyj-tihij-asik-dlya-majninga-v-kvartire-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 46, 'paragraph',
       $p46${"text":"Отдельного внимания заслуживает система охлаждения: она рассчитана на длительное функционирование под нагрузкой, поддерживает стабильную температуру и уменьшает риск перегревов. Это повышает надежность устройства и обеспечивает долговременную работу без просадок по хешрейту.","html":"Отдельного внимания заслуживает система охлаждения: она рассчитана на длительное функционирование под нагрузкой, поддерживает стабильную температуру и уменьшает риск перегревов. Это повышает надежность устройства и обеспечивает долговременную работу без просадок по хешрейту."}$p46$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samyj-tihij-asik-dlya-majninga-v-kvartire-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 47, 'stats',
       $p47${"rows":[{"label":"Производитель","value":"Canaan Avalon"},{"label":"Модель","value":"Avalon Q"},{"label":"Алгоритм","value":"SHA-256"},{"label":"Хешрейт","value":"90 Th/s"},{"label":"Потребление","value":"1 675 Вт"},{"label":"Монеты для майнинга","value":"BTC"},{"label":"Уровень шума","value":"65 дБ"},{"label":"Размеры","value":"455 × 130.5 × 440 мм"},{"label":"Вес","value":"10.5 кг"},{"label":"Год выпуска","value":"2025"}]}$p47$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samyj-tihij-asik-dlya-majninga-v-kvartire-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 48, 'pros_cons',
       $p48${"pros":["Подходит для домашнего использования при правильном размещении","Поддержка добычи Bitcoin и всех SHA-256 монет","Надежная система охлаждения для длительной работы","Простая настройка и интуитивное подключение"],"cons":["Средняя энергоэффективность на фоне более продвинутых ASIC","Сравнительно редкая модель на рынке"]}$p48$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samyj-tihij-asik-dlya-majninga-v-kvartire-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 49, 'heading',
       $p49${"level":2,"text":"2 место: Jasminer X16-Q PRO"}$p49$::jsonb,
       'jasminer-x16-q-pro'
FROM articles a WHERE a.slug = 'samyj-tihij-asik-dlya-majninga-v-kvartire-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 50, 'paragraph',
       $p50${"text":"Китайской компании Sunlune Technology удалось решить непростую задачу: производитель создал асик Jasminer X16-Q PRO, который отличается высокой мощностью при сохранении низкого уровня шума и скромного энергопотребления. Это удобный формат домашнего майнинга на надежных алгоритмах EtHash и EtcHash (более 30 монет, доступных для добычи). Jasminer X16-Q PRO является более совершенной моделью «младшего» устройства, которое хорошо зарекомендовало себя среди активных пользователей.","html":"Китайской компании Sunlune Technology удалось решить непростую задачу: производитель создал асик Jasminer X16-Q PRO, который отличается высокой мощностью при сохранении низкого уровня шума и скромного энергопотребления. Это удобный формат домашнего майнинга на надежных алгоритмах EtHash и EtcHash (более 30 монет, доступных для добычи). Jasminer X16-Q PRO является более совершенной моделью «младшего» устройства, которое хорошо зарекомендовало себя среди активных пользователей."}$p50$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samyj-tihij-asik-dlya-majninga-v-kvartire-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 51, 'image',
       $p51${"src":"/images/articles/quiet-asics-2026/jasminer-x16-q-pro.png","alt":"Jasminer X16-Q PRO"}$p51$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samyj-tihij-asik-dlya-majninga-v-kvartire-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 52, 'paragraph',
       $p52${"text":"Недостатком оборудования можно назвать молодость производителя – компания Sunlune Technology пока лишь завоевывает популярность среди конкурентов, однако, темпы роста доверия покупателей впечатляют.","html":"Недостатком оборудования можно назвать молодость производителя – компания Sunlune Technology пока лишь завоевывает популярность среди конкурентов, однако, темпы роста доверия покупателей впечатляют."}$p52$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samyj-tihij-asik-dlya-majninga-v-kvartire-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 53, 'stats',
       $p53${"rows":[{"label":"Производитель","value":"Sunlune Technology"},{"label":"Год выпуска","value":"2024"},{"label":"Базовый хешрейт","value":"2 050 МХ /с"},{"label":"Энергопотребление","value":"520 Вт"},{"label":"Энергоэффективность","value":"0,25 Вт на МХ"},{"label":"Алгоритм","value":"EtHash и EtcHash"},{"label":"Количество монет, доступных для майнинга","value":"39"},{"label":"Размеры","value":"44,5 x 13,2 x 44,3 см"},{"label":"Масса","value":"10 кг"},{"label":"Уровень шума","value":"40 ДБ"}]}$p53$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samyj-tihij-asik-dlya-majninga-v-kvartire-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 54, 'pros_cons',
       $p54${"pros":["Достойная энергоэффективность (одна из лучших среди устройств подобного формата)","Низкий уровень шума","Компактность","Работа в рамках известных алгоритмов"],"cons":["Молодой и непроверенный производитель","Растущая стоимость техники Jasminer ввиду популярности"]}$p54$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samyj-tihij-asik-dlya-majninga-v-kvartire-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 55, 'heading',
       $p55${"level":2,"text":"1 место: ElphaPex DG home 1"}$p55$::jsonb,
       'elphapex-dg-home-1'
FROM articles a WHERE a.slug = 'samyj-tihij-asik-dlya-majninga-v-kvartire-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 56, 'paragraph',
       $p56${"text":"ElphaPex DG Home 1 — тихий и стильный ASIC для домашнего майнинга на алгоритме Scrypt. Устройство разработано специально для работы в жилых условиях, где важны комфорт, компактность и минимальный шум. Хешрейт 4 GH/s при потреблении 960 Вт делает его эффективным решением для добычи популярных монет типа Litecoin и Dogecoin, а уровень шума около 50 дБ сравним с тихим настольным вентилятором или системным блоком под нагрузкой. Именно это делает DG Home 1 одним из самых удобных вариантов для квартирного майнинга.","html":"ElphaPex DG Home 1 — тихий и стильный ASIC для домашнего майнинга на алгоритме Scrypt. Устройство разработано специально для работы в жилых условиях, где важны комфорт, компактность и минимальный шум. Хешрейт 4 GH/s при потреблении 960 Вт делает его эффективным решением для добычи популярных монет типа Litecoin и Dogecoin, а уровень шума около 50 дБ сравним с тихим настольным вентилятором или системным блоком под нагрузкой. Именно это делает DG Home 1 одним из самых удобных вариантов для квартирного майнинга."}$p56$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samyj-tihij-asik-dlya-majninga-v-kvartire-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 57, 'image',
       $p57${"src":"/images/articles/quiet-asics-2026/elphapex-dg-home-1.png","alt":"ElphaPex DG Home 1"}$p57$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samyj-tihij-asik-dlya-majninga-v-kvartire-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 58, 'paragraph',
       $p58${"text":"Модель не требует установки промышленной вентиляции или усиленной электролинии — достаточно стандартной домашней розетки и минимального охлаждения помещения. Компактный корпус и аккуратный дизайн позволяют разместить асик в любой комнате, не нарушая эстетики пространства.","html":"Модель не требует установки промышленной вентиляции или усиленной электролинии — достаточно стандартной домашней розетки и минимального охлаждения помещения. Компактный корпус и аккуратный дизайн позволяют разместить асик в любой комнате, не нарушая эстетики пространства."}$p58$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samyj-tihij-asik-dlya-majninga-v-kvartire-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 59, 'stats',
       $p59${"rows":[{"label":"Производитель","value":"Elphapex"},{"label":"Модель","value":"DG Home 1"},{"label":"Алгоритм","value":"Scrypt"},{"label":"Хешрейт","value":"4 GH/s"},{"label":"Потребление","value":"960 Вт"},{"label":"Монеты для майнинга","value":"LTC, DOGE"},{"label":"Уровень шума","value":"50 дБ"},{"label":"Размеры","value":"300 × 150 × 200 мм"},{"label":"Вес","value":"7 кг"},{"label":"Год выпуска","value":"2023"}]}$p59$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samyj-tihij-asik-dlya-majninga-v-kvartire-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 60, 'pros_cons',
       $p60${"pros":["Идеален для домашнего майнинга благодаря низкому уровню шума","Поддержка популярных и надежных монет — Litecoin и Dogecoin","Современный внешний вид, компактность и аккуратный форм-фактор","Простая настройка даже для новичков","Не требует специальных коммуникаций или промышленной вентиляции"],"cons":["Существенно уступает по мощности промышленным асикам","Работает только на алгоритме Scrypt — не подходит для майнинга BTC"]}$p60$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samyj-tihij-asik-dlya-majninga-v-kvartire-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 61, 'heading',
       $p61${"level":2,"text":"Почему домашний майнинг становится популярным?"}$p61$::jsonb,
       'pochemu-populyaren'
FROM articles a WHERE a.slug = 'samyj-tihij-asik-dlya-majninga-v-kvartire-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 62, 'paragraph',
       $p62${"text":"Еще недавно майнинг ассоциировался с гудящими ангарами и промышленными фермами, но все чаще вектор смещается в сторону домашнего майнинга. Производители реагируют быстро – на рынке появляется все больше компактных, тихих и энергоэффективных асиков, ориентированных на использование в квартире. Это уже не временный тренд, а новая реальность.","html":"Еще недавно майнинг ассоциировался с гудящими ангарами и промышленными фермами, но все чаще вектор смещается в сторону домашнего майнинга. Производители реагируют быстро – на рынке появляется все больше компактных, тихих и энергоэффективных асиков, ориентированных на использование в квартире. Это уже не временный тренд, а новая реальность."}$p62$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samyj-tihij-asik-dlya-majninga-v-kvartire-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 63, 'image',
       $p63${"src":"/images/articles/quiet-asics-2026/home-mining-setup.png","alt":"Домашняя майнинг-ферма в квартире"}$p63$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samyj-tihij-asik-dlya-majninga-v-kvartire-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 64, 'paragraph',
       $p64${"text":"Почему это происходит?","html":"Почему это происходит?"}$p64$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samyj-tihij-asik-dlya-majninga-v-kvartire-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 65, 'rich_list',
       $p65${"ordered":false,"items":[{"title":"Снижение доходности GPU- и CPU-майнинга","text":"Видеокарты и процессоры стремительно теряют свою привлекательность: доходность снизилась почти до нуля из-за высокой конкуренции и роста сложности алгоритмов, а некоторые крупные блокчейны (включая Ethereum) ушли от классического майнинга совсем. Асики остаются единственным стабильным способом майнинга, особенно на таких алгоритмах, как SHA-256 (Bitcoin) и kHeavyHash (Kaspa). А с каждым годом все более ощутимо в домашнем масштабе;"},{"title":"Доступность и компактность асиков нового поколения","text":"Производители вроде Goldshell, iPollo, Antminer (в гидро- или мини-форматах) выпускают малошумные модели, потребляющие от 100 до 1000 Вт – не больше, чем обычный обогреватель. Они легко размещаются на полке, работают без промышленной вентиляции и идеально подходят для квартир и частных домов;"},{"title":"Контроль и независимость","text":"Для многих майнеров важно не зависеть от хостинга и аренды, самому обслуживать устройство, лично распоряжаться доходом – без комиссии посредников. Домашний майнинг дает этот контроль и предоставляет формат полной независимости;"},{"title":"Низкий порог входа","text":"Сегодня можно начать майнить дома с вложений в 50–80 тысяч рублей. Это ниже стоимости ферм на видеокартах даже 2–3 года назад."}]}$p65$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samyj-tihij-asik-dlya-majninga-v-kvartire-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 66, 'paragraph',
       $p66${"text":"Почему пользователи выбирают домашний майнинг? Среди причин тишина и энергоэффективность – новые модели асиков шумят на уровне системного блока, а потребляют в 2–3 раза меньше электроэнергии, чем старые видеокарты. Также важна стабильная окупаемость – асик работает только с одним алгоритмом, но стабильно добывает выбранную монету без лишних простоев. И, наконец, простота использования – современное устройство настраивается за 10 минут, подключается к Wi-Fi и не требует специальных знаний.","html":"Почему пользователи выбирают домашний майнинг? Среди причин тишина и энергоэффективность – новые модели асиков шумят на уровне системного блока, а потребляют в 2–3 раза меньше электроэнергии, чем старые видеокарты. Также важна стабильная окупаемость – асик работает только с одним алгоритмом, но стабильно добывает выбранную монету без лишних простоев. И, наконец, простота использования – современное устройство настраивается за 10 минут, подключается к Wi-Fi и не требует специальных знаний."}$p66$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samyj-tihij-asik-dlya-majninga-v-kvartire-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 67, 'heading',
       $p67${"level":2,"text":"Выводы"}$p67$::jsonb,
       'vyvody'
FROM articles a WHERE a.slug = 'samyj-tihij-asik-dlya-majninga-v-kvartire-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 68, 'paragraph',
       $p68${"text":"Майнинг в квартире – это удобно, но только если он не превращает ваш дом в серверную. Шум – главный враг домашнего майнинга, и с ним обязательно нужно бороться. Использование тихих асиков, шумоизоляции и современных решений позволяет сохранить комфорт, хорошее настроение и добрососедские отношения.","html":"Майнинг в квартире – это удобно, но только если он не превращает ваш дом в серверную. Шум – главный враг домашнего майнинга, и с ним обязательно нужно бороться. Использование тихих асиков, шумоизоляции и современных решений позволяет сохранить комфорт, хорошее настроение и добрососедские отношения."}$p68$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samyj-tihij-asik-dlya-majninga-v-kvartire-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 69, 'paragraph',
       $p69${"text":"Если вы хотите заниматься майнингом дома – выбирайте с умом: инвестиции в тишину окупаются спокойствием и сном, а также устойчивой работой вашей фермы.","html":"Если вы хотите заниматься майнингом дома – выбирайте с умом: инвестиции в тишину окупаются спокойствием и сном, а также устойчивой работой вашей фермы."}$p69$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samyj-tihij-asik-dlya-majninga-v-kvartire-top-5';

-- =====================================================================
-- 037_article_asic_lifehacks.sql
-- =====================================================================

-- ТОП-7 секретов и лайфхаков майнинга на асиках

INSERT INTO articles (
    slug, title, title_subtitle, excerpt, content, topic_id,
    reading_time_min, reading_minutes, published_at, view_count,
    display_type, sort_order, is_published, uses_blocks,
    image_url, image_alt
) VALUES (
    'sekrety-i-lajfhaki-majninga-na-asikah-kak-vyzhat-maksimum-iz-majnerov-v-2025-godu',
    'ТОП-7 секретов и лайфхаков майнинга на асиках',
    'Как выжать максимум из майнеров в 2026 году?',
    $excerpt$ТОП-7 лайфхаков майнинга на асиках в 2026 году: undervolting, отопление, дешёвое электричество, альтернативные алгоритмы, аренда хешрейта и контейнеры.$excerpt$,
    $content$В 2026 году майнинг на асиках остается одним из самых стабильных способов заработка в криптоиндустрии.

Секреты и лайфхаки: выводы

Применение практик позволяет сократить издержки и повысить устойчивость бизнеса.$content$,
    'mining',
    8,
    8,
    '2025-06-05',
    483,
    'list',
    1,
    TRUE,
    TRUE,
    '/images/articles/asic-lifehacks-2026/bitcoin-pcb.png',
    'Bitcoin и ASIC-майнинг'
)
ON CONFLICT (slug) DO UPDATE SET
    title = EXCLUDED.title,
    title_subtitle = EXCLUDED.title_subtitle,
    excerpt = EXCLUDED.excerpt,
    content = EXCLUDED.content,
    reading_time_min = EXCLUDED.reading_time_min,
    reading_minutes = EXCLUDED.reading_minutes,
    published_at = EXCLUDED.published_at,
    view_count = EXCLUDED.view_count,
    uses_blocks = TRUE,
    image_url = EXCLUDED.image_url,
    image_alt = EXCLUDED.image_alt,
    is_published = TRUE;

DELETE FROM article_blocks
WHERE article_id = (SELECT id FROM articles WHERE slug = 'sekrety-i-lajfhaki-majninga-na-asikah-kak-vyzhat-maksimum-iz-majnerov-v-2025-godu');

UPDATE rating_items
SET href = '/articles/sekrety-i-lajfhaki-majninga-na-asikah-kak-vyzhat-maksimum-iz-majnerov-v-2025-godu',
    label = 'Секреты и лайфхаки майнинга на асиках: как выжать максимум из майнеров в 2026 году'
WHERE href LIKE '%sekrety-i-lajfhaki-majninga-na-asikah%'
   OR label ILIKE '%лайфхаки майнинга%';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 1, 'paragraph',
       $p1${"text":"В 2026 году майнинг на асиках остается одним из самых стабильных способов заработка в криптоиндустрии. Но времена легкой добычи остались позади: чтобы оставаться в плюсе, теперь мало просто купить Antminer и включить его в розетку. Сегодняшний майнер – это не только техник, но и стратег, умеющий экономить, адаптироваться и выжимать максимум из каждой машины.","html":"В 2026 году майнинг на асиках остается одним из самых стабильных способов заработка в криптоиндустрии. Но времена легкой добычи остались позади: чтобы оставаться в плюсе, теперь мало просто купить Antminer и включить его в розетку. Сегодняшний майнер – это не только техник, но и стратег, умеющий экономить, адаптироваться и выжимать максимум из каждой машины."}$p1$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'sekrety-i-lajfhaki-majninga-na-asikah-kak-vyzhat-maksimum-iz-majnerov-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 2, 'paragraph',
       $p2${"text":"В этой статье мы собрали наиболее эффективные и малоизвестные лайфхаки для майнинга, которые помогут снизить затраты, повысить доход и продлить срок службы оборудования.","html":"В этой статье мы собрали наиболее эффективные и малоизвестные лайфхаки для майнинга, которые помогут снизить затраты, повысить доход и продлить срок службы оборудования."}$p2$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'sekrety-i-lajfhaki-majninga-na-asikah-kak-vyzhat-maksimum-iz-majnerov-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 3, 'image',
       $p3${"src":"/images/articles/asic-lifehacks-2026/bitcoin-pcb.png","alt":"Bitcoin и ASIC-майнинг"}$p3$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'sekrety-i-lajfhaki-majninga-na-asikah-kak-vyzhat-maksimum-iz-majnerov-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 4, 'heading',
       $p4${"level":2,"text":"Лайфхак майнинга №1: undervolting – снижение энергопотребления"}$p4$::jsonb,
       'lifehack-1-undervolting'
FROM articles a WHERE a.slug = 'sekrety-i-lajfhaki-majninga-na-asikah-kak-vyzhat-maksimum-iz-majnerov-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 5, 'paragraph',
       $p5${"text":"Суть: майнеры можно «прошить» кастомной прошивкой, которая позволяет снизить потребление на 20-40% при минимальной потере хешрейта или вообще без нее.","html":"Суть: майнеры можно «прошить» кастомной прошивкой, которая позволяет снизить потребление на 20-40% при минимальной потере хешрейта или вообще без нее."}$p5$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'sekrety-i-lajfhaki-majninga-na-asikah-kak-vyzhat-maksimum-iz-majnerov-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 6, 'rich_list',
       $p6${"ordered":false,"items":[{"title":"Пример","text":"Antminer S19 Pro (110 TH/s) – потребление 3250 Вт. С прошивкой Braiins OS+ можно снизить до: 2800 Вт при 105 TH/s или до 2400 Вт при 95 TH/s;"},{"title":"Что использовать","text":"Braiins OS+ (для Bitmain) или VNish, Hiveon ASIC, Asic.to – альтернативы с поддержкой множества моделей;"},{"title":"Выгода","text":"Разница в 800 Вт при цене 0.10 $/кВт·ч = $58.00/мес экономии с одного устройства."}]}$p6$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'sekrety-i-lajfhaki-majninga-na-asikah-kak-vyzhat-maksimum-iz-majnerov-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 7, 'image',
       $p7${"src":"/images/articles/asic-lifehacks-2026/mining-farm.png","alt":"Промышленная ASIC-ферма"}$p7$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'sekrety-i-lajfhaki-majninga-na-asikah-kak-vyzhat-maksimum-iz-majnerov-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 8, 'heading',
       $p8${"level":2,"text":"Лайфхак майнинга №2: отопление площадей майнерами"}$p8$::jsonb,
       'lifehack-2-otoplenie'
FROM articles a WHERE a.slug = 'sekrety-i-lajfhaki-majninga-na-asikah-kak-vyzhat-maksimum-iz-majnerov-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 9, 'paragraph',
       $p9${"text":"Идея: Асик выделяет большое количество тепла: им можно отапливать помещения, склады, теплицы, бани или бассейны.","html":"Идея: Асик выделяет большое количество тепла: им можно отапливать помещения, склады, теплицы, бани или бассейны."}$p9$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'sekrety-i-lajfhaki-majninga-na-asikah-kak-vyzhat-maksimum-iz-majnerov-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 10, 'rich_list',
       $p10${"ordered":false,"items":[{"title":"Пример","text":"Практически любой майнер работает как обогреватель мощностью 3.2 кВт – этого достаточно, чтобы отапливать комнату в 25–30 м² при уличной температуре до −10°C;"},{"title":"Лайфхаки","text":"подключение теплоотвода к водяному теплообменнику, вывод горячего воздуха в вентиляционные каналы, использование асиков в домашнем отоплении."}]}$p10$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'sekrety-i-lajfhaki-majninga-na-asikah-kak-vyzhat-maksimum-iz-majnerov-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 11, 'paragraph',
       $p11${"text":"Зима – меньше расходов на отопление + оптимальный режим охлаждения фермы. Итог – экономия на оплате счетов за коммуналку, что является дополнительной выгодой майнинга.","html":"Зима – меньше расходов на отопление + оптимальный режим охлаждения фермы. Итог – экономия на оплате счетов за коммуналку, что является дополнительной выгодой майнинга."}$p11$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'sekrety-i-lajfhaki-majninga-na-asikah-kak-vyzhat-maksimum-iz-majnerov-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 12, 'heading',
       $p12${"level":2,"text":"Лайфхак №3: майнинг в регионах с недорогим электричеством"}$p12$::jsonb,
       'lifehack-3-electrichestvo'
FROM articles a WHERE a.slug = 'sekrety-i-lajfhaki-majninga-na-asikah-kak-vyzhat-maksimum-iz-majnerov-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 13, 'paragraph',
       $p13${"text":"Суть: найти и использовать локации с дешевой или льготной электроэнергией.","html":"Суть: найти и использовать локации с дешевой или льготной электроэнергией."}$p13$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'sekrety-i-lajfhaki-majninga-na-asikah-kak-vyzhat-maksimum-iz-majnerov-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 14, 'rich_list',
       $p14${"ordered":false,"items":[{"title":"Примеры","text":"сельская местность с тарифами ниже 0.04 $/кВт·ч, объекты с недорогим электричеством (гаражи, склады, отели, загородные дома), промышленные тарифы через ИП и другие юридические форматы;"},{"title":"Расчет","text":"при цене 0.12 $/кВт·ч доход с S19 = $2.5/день. При 0.04 $/кВт·ч – $5.1/день. Разница более чем в 2 раза!"}]}$p14$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'sekrety-i-lajfhaki-majninga-na-asikah-kak-vyzhat-maksimum-iz-majnerov-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 15, 'image',
       $p15${"src":"/images/articles/asic-lifehacks-2026/cheap-electricity.png","alt":"Электросети и дешёвое электричество"}$p15$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'sekrety-i-lajfhaki-majninga-na-asikah-kak-vyzhat-maksimum-iz-majnerov-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 16, 'heading',
       $p16${"level":2,"text":"Лайфхак №4: альтернативные алгоритмы"}$p16$::jsonb,
       'lifehack-4-algoritmy'
FROM articles a WHERE a.slug = 'sekrety-i-lajfhaki-majninga-na-asikah-kak-vyzhat-maksimum-iz-majnerov-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 17, 'paragraph',
       $p17${"text":"Суть: Не все асики работают на алгоритме SHA-256 для добычи Bitcoin. Есть множество альтернативных форматов и перспективных монет с менее перегруженными сетями.","html":"Суть: Не все асики работают на алгоритме SHA-256 для добычи Bitcoin. Есть множество альтернативных форматов и перспективных монет с менее перегруженными сетями."}$p17$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'sekrety-i-lajfhaki-majninga-na-asikah-kak-vyzhat-maksimum-iz-majnerov-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 18, 'rich_list',
       $p18${"ordered":false,"items":[{"title":"Примеры","text":"Kadena (KDA) – асик Goldshell KD6, Kaspa (KAS) – Antminer KS3, Ironfish, Nervos, Handshake – более молодые монеты с низкой конкуренцией;"},{"title":"Вывод","text":"Покупка асика под активы «второй волны» монет дает больше прибыли в период роста, чем, например, серия S19 в Биткоин-сети."}]}$p18$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'sekrety-i-lajfhaki-majninga-na-asikah-kak-vyzhat-maksimum-iz-majnerov-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 19, 'heading',
       $p19${"level":2,"text":"Лайфхак №5: использование ферм для сдачи хешрейта в аренду"}$p19$::jsonb,
       'lifehack-5-arenda'
FROM articles a WHERE a.slug = 'sekrety-i-lajfhaki-majninga-na-asikah-kak-vyzhat-maksimum-iz-majnerov-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 20, 'paragraph',
       $p20${"text":"Суть: можно купить 5-10 майнеров, арендовать помещение с электричеством и сдавать их в хешрейт-аренду через платформы NiceHash, MiningRigRentals, Poolin Hashrate Market.","html":"Суть: можно купить 5-10 майнеров, арендовать помещение с электричеством и сдавать их в хешрейт-аренду через платформы NiceHash, MiningRigRentals, Poolin Hashrate Market."}$p20$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'sekrety-i-lajfhaki-majninga-na-asikah-kak-vyzhat-maksimum-iz-majnerov-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 21, 'paragraph',
       $p21${"text":"Пример: Antminer S19 XP генерирует 140 TH/s. Средняя аренда: $0.015/TH/s/сутки = $2.10/день.","html":"Пример: Antminer S19 XP генерирует 140 TH/s. Средняя аренда: $0.015/TH/s/сутки = $2.10/день."}$p21$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'sekrety-i-lajfhaki-majninga-na-asikah-kak-vyzhat-maksimum-iz-majnerov-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 22, 'paragraph',
       $p22${"text":"Если вы сдаёте 10 юнитов, получаете стабильный пассивный доход, без настройки пула и забот.","html":"Если вы сдаёте 10 юнитов, получаете стабильный пассивный доход, без настройки пула и забот."}$p22$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'sekrety-i-lajfhaki-majninga-na-asikah-kak-vyzhat-maksimum-iz-majnerov-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 23, 'heading',
       $p23${"level":2,"text":"Лайфхак №6: отслеживание курсов и сложности в режиме 24/7"}$p23$::jsonb,
       'lifehack-6-monitoring'
FROM articles a WHERE a.slug = 'sekrety-i-lajfhaki-majninga-na-asikah-kak-vyzhat-maksimum-iz-majnerov-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 24, 'paragraph',
       $p24${"text":"Суть: не все майнеры реагируют на изменение сложности сети и курса монет. При гибком подходе к данному вопросу можно разработать собственную стратегию работы с повышенной доходностью.","html":"Суть: не все майнеры реагируют на изменение сложности сети и курса монет. При гибком подходе к данному вопросу можно разработать собственную стратегию работы с повышенной доходностью."}$p24$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'sekrety-i-lajfhaki-majninga-na-asikah-kak-vyzhat-maksimum-iz-majnerov-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 25, 'rich_list',
       $p25${"ordered":false,"items":[{"title":"Что использовать","text":"Miningpoolstats – для отслеживания пула и монеты, WhatToMine (раздел ASIC) – выбор оптимальной монеты, Coinwarz Difficulty Charts – график сложности, установка ботов в Telegram на ключевые метрики;"},{"title":"Порядок использования","text":"при падении сложности – временно ориентироваться на эту монету, чтобы собрать максимум до восстановления сети."}]}$p25$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'sekrety-i-lajfhaki-majninga-na-asikah-kak-vyzhat-maksimum-iz-majnerov-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 26, 'heading',
       $p26${"level":2,"text":"Лайфхак №7: модульная ферма на контейнерах"}$p26$::jsonb,
       'lifehack-7-kontejnery'
FROM articles a WHERE a.slug = 'sekrety-i-lajfhaki-majninga-na-asikah-kak-vyzhat-maksimum-iz-majnerov-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 27, 'paragraph',
       $p27${"text":"Суть: Вместо стационарного помещения можно использовать морские контейнеры или промышленные блоки, оборудованные под майнинг. Это позволяет быстро переместить ферму туда, где дешевле электричество или лучше климат.","html":"Суть: Вместо стационарного помещения можно использовать морские контейнеры или промышленные блоки, оборудованные под майнинг. Это позволяет быстро переместить ферму туда, где дешевле электричество или лучше климат."}$p27$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'sekrety-i-lajfhaki-majninga-na-asikah-kak-vyzhat-maksimum-iz-majnerov-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 28, 'rich_list',
       $p28${"ordered":false,"items":[{"title":"Преимущества","text":"легко переехать в другую страну или регион, быстрая сборка и запуск (2–3 дня), контейнер – уже защищенная структура с возможностью шумо- и термоизоляции;"},{"title":"Пример","text":"контейнер на 40 ASIC (например, S19) потребляет ~120 кВт. В одном регионе майнер платит 0.12 $/кВт·ч → $3456/мес. В другом регионе – 0.05 $/кВт·ч → $1440/мес. Экономия $2,000+ в месяц."}]}$p28$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'sekrety-i-lajfhaki-majninga-na-asikah-kak-vyzhat-maksimum-iz-majnerov-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 29, 'paragraph',
       $p29${"text":"Вывод: контейнер – это мобильный актив, особенно выгодный в странах с колеблющимися тарифами или в случае запретов.","html":"Вывод: контейнер – это мобильный актив, особенно выгодный в странах с колеблющимися тарифами или в случае запретов."}$p29$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'sekrety-i-lajfhaki-majninga-na-asikah-kak-vyzhat-maksimum-iz-majnerov-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 30, 'heading',
       $p30${"level":2,"text":"Секреты и лайфхаки: выводы"}$p30$::jsonb,
       'vyvody'
FROM articles a WHERE a.slug = 'sekrety-i-lajfhaki-majninga-na-asikah-kak-vyzhat-maksimum-iz-majnerov-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 31, 'paragraph',
       $p31${"text":"Будущее в майнинге принадлежит тем, кто не просто включает оборудование, а думает, считает и экспериментирует. Применяя описанные лайфхаки, вы сможете быть на шаг впереди большинства.","html":"Будущее в майнинге принадлежит тем, кто не просто включает оборудование, а думает, считает и экспериментирует. Применяя описанные лайфхаки, вы сможете быть на шаг впереди большинства."}$p31$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'sekrety-i-lajfhaki-majninga-na-asikah-kak-vyzhat-maksimum-iz-majnerov-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 32, 'stats',
       $p32${"rows":[{"label":"Undervolting","value":"до $50+/мес на устройстве"},{"label":"Геолокация с дешёвым током","value":"×2 чистой прибыли"},{"label":"Альтернативные монеты","value":"+100–300% ROI при росте"},{"label":"Автоаренда хешрейта","value":"стабильный пассивный доход"},{"label":"Использование тепла","value":"экономия на отоплении"},{"label":"Мобильные контейнеры","value":"лёгкий и быстрый переезд"},{"label":"Отслеживание курсов и сложности","value":"оперативная смена алгоритма для доп. дохода"}]}$p32$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'sekrety-i-lajfhaki-majninga-na-asikah-kak-vyzhat-maksimum-iz-majnerov-v-2025-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 33, 'paragraph',
       $p33${"text":"Применение представленных практик позволяет существенно сократить издержки, повысить устойчивость бизнеса и адаптироваться к изменениям внешней среды.","html":"Применение представленных практик позволяет существенно сократить издержки, повысить устойчивость бизнеса и адаптироваться к изменениям внешней среды."}$p33$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'sekrety-i-lajfhaki-majninga-na-asikah-kak-vyzhat-maksimum-iz-majnerov-v-2025-godu';

-- =====================================================================
-- 038_article_mining_pools.sql
-- =====================================================================

-- Лучшие пулы для майнинга: ТОП-10

INSERT INTO articles (
    slug, title, title_subtitle, excerpt, content, topic_id,
    reading_time_min, reading_minutes, published_at, view_count,
    display_type, sort_order, is_published, uses_blocks,
    image_url, image_alt
) VALUES (
    'luchshie-puly-dlya-majninga-top-10',
    'Лучшие пулы для майнинга',
    'ТОП-10',
    $excerpt$ТОП-10 лучших пулов для майнинга: ViaBTC, AntPool, Poolin, F2Pool и другие — комиссии, выплаты и особенности для СНГ.$excerpt$,
    $content$Введение

Майнинг криптовалют требует оптимизации каждого элемента, включая выбор пула.

Выводы

Для майнеров из СНГ стоит выбирать платформы с понятными условиями и удобным выводом.$content$,
    'mining',
    14,
    14,
    '2023-11-25',
    1272,
    'list',
    8,
    TRUE,
    TRUE,
    '/images/articles/mining-pools-top10/viabtc.png',
    'ViaBTC'
)
ON CONFLICT (slug) DO UPDATE SET
    title = EXCLUDED.title,
    title_subtitle = EXCLUDED.title_subtitle,
    excerpt = EXCLUDED.excerpt,
    content = EXCLUDED.content,
    reading_time_min = EXCLUDED.reading_time_min,
    reading_minutes = EXCLUDED.reading_minutes,
    published_at = EXCLUDED.published_at,
    view_count = EXCLUDED.view_count,
    uses_blocks = TRUE,
    image_url = EXCLUDED.image_url,
    image_alt = EXCLUDED.image_alt,
    is_published = TRUE;

DELETE FROM article_blocks
WHERE article_id = (SELECT id FROM articles WHERE slug = 'luchshie-puly-dlya-majninga-top-10');

UPDATE rating_items
SET href = '/articles/luchshie-puly-dlya-majninga-top-10',
    label = 'Лучшие пулы для майнинга: ТОП-10'
WHERE href LIKE '%luchshie-puly-dlya-majninga%'
   OR label ILIKE '%пулы для майнинга%';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 1, 'heading',
       $p1${"level":2,"text":"Введение"}$p1$::jsonb,
       'vvedenie'
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 2, 'paragraph',
       $p2${"text":"Майнинг криптовалют – это не просто подключение оборудования и ожидание прибыли. Современные реалии индустрии требуют оптимизации каждого элемента: от выбора оборудования до стратегий распределения вычислительных мощностей. Один из ключевых компонентов в цепочке добычи криптовалют – пулы для майнинга. Особенно это актуально для тех, кто не владеет огромными фермами, а майнит с несколькими ASIC-устройствами или на GPU. Участие в пуле может повысить шансы на регулярный доход и упростить техническое сопровождение процесса.","html":"Майнинг криптовалют – это не просто подключение оборудования и ожидание прибыли. Современные реалии индустрии требуют оптимизации каждого элемента: от выбора оборудования до стратегий распределения вычислительных мощностей. Один из ключевых компонентов в цепочке добычи криптовалют – пулы для майнинга. Особенно это актуально для тех, кто не владеет огромными фермами, а майнит с несколькими ASIC-устройствами или на GPU. Участие в пуле может повысить шансы на регулярный доход и упростить техническое сопровождение процесса."}$p2$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 3, 'image',
       $p3${"src":"/images/articles/mining-pools-top10/asic-farm.png","alt":"Майнинг-ферма и пулы"}$p3$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 4, 'heading',
       $p4${"level":2,"text":"Что такое пул и какие функции он выполняет?"}$p4$::jsonb,
       'chto-takoe-pul'
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 5, 'paragraph',
       $p5${"text":"Майнинговый пул – это объединение майнеров, работающих над добычей одного и того же блока совместно. Если пулу удается найти блок, награда распределяется между всеми участниками пропорционально их вкладу (вычислительной мощности).","html":"Майнинговый пул – это объединение майнеров, работающих над добычей одного и того же блока совместно. Если пулу удается найти блок, награда распределяется между всеми участниками пропорционально их вкладу (вычислительной мощности)."}$p5$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 6, 'image',
       $p6${"src":"/images/articles/mining-pools-top10/what-is-pool.png","alt":"Что такое майнинг-пул"}$p6$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 7, 'paragraph',
       $p7${"text":"Функции пула:","html":"Функции пула:"}$p7$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 8, 'rich_list',
       $p8${"ordered":false,"items":[{"title":"Распределение заданий","text":"Сервер пула отправляет каждому участнику задачу по хешированию;"},{"title":"Прием и проверка решений","text":"Пул определяет, какие шары (решения) приняты, а какие нет;"},{"title":"Начисление вознаграждения","text":"На основе принятых решений рассчитывается доля участия и доход;"},{"title":"Выплата средств","text":"Пользователь получает доход на указанный кошелёк или аккаунт;"},{"title":"Аналитика и отчётность","text":"Участники могут отслеживать эффективность устройств, статистику доходов и активность."}]}$p8$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 9, 'paragraph',
       $p9${"text":"Сами пулы обычно представляют собой серверное программное обеспечение с интерфейсом для управления, мониторинга и поддержки пользователей.","html":"Сами пулы обычно представляют собой серверное программное обеспечение с интерфейсом для управления, мониторинга и поддержки пользователей."}$p9$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 10, 'heading',
       $p10${"level":2,"text":"Преимущества и недостатки пулов"}$p10$::jsonb,
       'preimushhestva-nedostatki'
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 11, 'paragraph',
       $p11${"text":"Преимущества:","html":"Преимущества:"}$p11$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 12, 'list',
       $p12${"ordered":false,"items":["Регулярные выплаты. Даже при небольшом хешрейте можно получать доход ежедневно;","Надежность. Современные пулы имеют резервные сервера и защиту от DDoS-атак;","Удобство. Не нужно самостоятельно искать блоки и обслуживать собственный узел блокчейна;","Мониторинг. Подробные дашборды позволяют отслеживать статус работы оборудования в реальном времени;","Гибкие схемы выплат. Некоторые пулы предлагают выбор алгоритма вознаграждения – в зависимости от ваших предпочтений по стабильности и доходности."]}$p12$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 13, 'paragraph',
       $p13${"text":"Недостатки:","html":"Недостатки:"}$p13$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 14, 'list',
       $p14${"ordered":false,"items":["Комиссия. За обслуживание и инфраструктуру пул удерживает небольшой процент (обычно 1-3%);","Централизация. Участие большого количества майнеров в одном пуле снижает децентрализацию сети (вредно для идеологии блокчейна);","Зависимость от пула. При технических сбоях доход может быть временно приостановлен;","Меньшая потенциальная награда. В теории, одиночный майнер, нашедший блок, получает всё вознаграждение, но это маловероятно без крупных мощностей."]}$p14$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 15, 'heading',
       $p15${"level":2,"text":"Как выбрать пул для майнинга?"}$p15$::jsonb,
       'kak-vybrat'
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 16, 'paragraph',
       $p16${"text":"Выбор пула – важнейший шаг. От него напрямую зависит стабильность доходов и надежность всей майнинговой схемы.","html":"Выбор пула – важнейший шаг. От него напрямую зависит стабильность доходов и надежность всей майнинговой схемы."}$p16$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 17, 'paragraph',
       $p17${"text":"Основные критерии:","html":"Основные критерии:"}$p17$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 18, 'rich_list',
       $p18${"ordered":false,"items":[{"title":"Хешрейт пула","text":"Чем выше общий хешрейт, тем чаще пул находит блоки;"},{"title":"Метод распределения прибыли","text":"PPS (Pay Per Share) – стабильные выплаты за каждый принятый шар, PPLNS (Pay Per Last N Shares) – зависит от нахождения блока, FPPS – гибридная модель, включающая комиссию и доход от транзакций;"},{"title":"Комиссия пула","text":"Влияет на итоговую доходность;"},{"title":"Геолокация серверов","text":"Чем ближе сервер пула к вашей ферме, тем меньше пинг и лучше стабильность;"},{"title":"Прозрачность","text":"Надежные пулы публикуют статистику блоков, выплат, онлайн-поддержку;"},{"title":"Поддержка монет","text":"Одни пулы ориентированы на BTC, другие – под ETH, LTC, Kaspa и т.д.;"},{"title":"Порог выплат и способы вывода","text":"Некоторые пулы позволяют автоматически выводить доход на кошелёк, другие требуют ручного вывода."}]}$p18$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 19, 'heading',
       $p19${"level":2,"text":"Особенности пулов для пользователей из СНГ"}$p19$::jsonb,
       'osobennosti-sng'
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 20, 'paragraph',
       $p20${"text":"Майнерам из стран СНГ и других государств региона стоит учитывать следующие факторы, которые могут повлиять на возможность работы, безопасный запуск и стабильность дохода:","html":"Майнерам из стран СНГ и других государств региона стоит учитывать следующие факторы, которые могут повлиять на возможность работы, безопасный запуск и стабильность дохода:"}$p20$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 21, 'list',
       $p21${"ordered":false,"items":["Русскоязычный интерфейс. Удобство в настройке и мониторинге;","Сервера ближе к региону. Это снижает задержки и потери шар;","Юридические риски. Некоторые пулы (например, работающие через американские банки) могут ограничить доступ гражданам РФ;","Выплаты в USDT или напрямую в рублях через обменники. Это особенно важно при регулярных обналичиваниях;","Техническая поддержка. Желательно иметь возможность связи с техподдержкой на русском языке и через популярные каналы (Telegram, WhatsApp)."]}$p21$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 22, 'paragraph',
       $p22${"text":"А теперь познакомимся с ТОП-10 лучших пулов для майнинга в России и мире.","html":"А теперь познакомимся с ТОП-10 лучших пулов для майнинга в России и мире."}$p22$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 23, 'heading',
       $p23${"level":2,"text":"10 место: BTC.com (Битиси дот ком)"}$p23$::jsonb,
       'btc-com'
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 24, 'paragraph',
       $p24${"text":"Еще один пул, связанный с Bitmain Tech Ltd – платформа создана в 2016 году, хотя изначально компания основывалась как обозреватель блокчейна. Ключевая концепция BTC.com – максимально простой в использовании продукт для добычи основных криптоактивов. Авторам удалось реализовать идею на практике, так как популярность площадки достаточно высока.","html":"Еще один пул, связанный с Bitmain Tech Ltd – платформа создана в 2016 году, хотя изначально компания основывалась как обозреватель блокчейна. Ключевая концепция BTC.com – максимально простой в использовании продукт для добычи основных криптоактивов. Авторам удалось реализовать идею на практике, так как популярность площадки достаточно высока."}$p24$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 25, 'image',
       $p25${"src":"/images/articles/mining-pools-top10/btc-com.png","alt":"BTC.com"}$p25$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 26, 'paragraph',
       $p26${"text":"К сожалению, российские пользователи больше не могут оценить простоту и удобство BTC.com, так как сервис заблокирован для майнеров РУ-сегмента. Причина, как и в случае с другими площадками – исполнение санкций. Кстати, несмотря на восточное происхождение, сервис также недоступен для пользователей из Китая.","html":"К сожалению, российские пользователи больше не могут оценить простоту и удобство BTC.com, так как сервис заблокирован для майнеров РУ-сегмента. Причина, как и в случае с другими площадками – исполнение санкций. Кстати, несмотря на восточное происхождение, сервис также недоступен для пользователей из Китая."}$p26$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 27, 'stats',
       $p27${"rows":[{"label":"Способ распределения награды","value":"FPPS"},{"label":"Лимиты выплат","value":"0,005 BTC"},{"label":"Периодичность начисления","value":"ежедневно"},{"label":"Комиссия","value":"4%"}]}$p27$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 28, 'pros_cons',
       $p28${"pros":["Простой и понятный интерфейс","Высокая степень защиты","Открытый исходный код","Квалифицированная служба поддержки","Добыча ключевых криптоактивов","Множество языков поддержки"],"cons":["Отказ от работы с российскими майнерами","Высокие комиссионные сборы","Внушительная минимальная сумма для вывода – 0,005 BTC"]}$p28$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 29, 'heading',
       $p29${"level":2,"text":"9 место: Binance Pool (Бинанс Пул)"}$p29$::jsonb,
       'binance-pool'
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 30, 'paragraph',
       $p30${"text":"Сервис для майнинга от крупнейшей в мире биржи начал свою работу в 2020 году, поэтому данную площадку можно назвать относительно молодой. Являясь частью инфраструктуры Binance, платформа уделяет повышенное внимание алгоритму SHA-256 (добыча BTC и BCH), однако, возможно «копать» и другие монеты. Пошлины за использование сервиса стандартные – 2,5%. Также существует формат работы с VIP-статусом для клиентов с высоким хэшрейтом. Таким майнерам предлагаются разнообразные бонусы и дополнительные преимущества.","html":"Сервис для майнинга от крупнейшей в мире биржи начал свою работу в 2020 году, поэтому данную площадку можно назвать относительно молодой. Являясь частью инфраструктуры Binance, платформа уделяет повышенное внимание алгоритму SHA-256 (добыча BTC и BCH), однако, возможно «копать» и другие монеты. Пошлины за использование сервиса стандартные – 2,5%. Также существует формат работы с VIP-статусом для клиентов с высоким хэшрейтом. Таким майнерам предлагаются разнообразные бонусы и дополнительные преимущества."}$p30$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 31, 'image',
       $p31${"src":"/images/articles/mining-pools-top10/binance-pool.png","alt":"Binance Pool"}$p31$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 32, 'paragraph',
       $p32${"text":"Для того чтобы начать пользоваться Binance Pool, необходимо зарегистрироваться на платформе и осуществить верификацию личности. Это может стать препятствием для работы РУ-сегмента, так как Бинанс постепенно ограничивает работу российских пользователей со своими инструментами.","html":"Для того чтобы начать пользоваться Binance Pool, необходимо зарегистрироваться на платформе и осуществить верификацию личности. Это может стать препятствием для работы РУ-сегмента, так как Бинанс постепенно ограничивает работу российских пользователей со своими инструментами."}$p32$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 33, 'stats',
       $p33${"rows":[{"label":"Способ распределения награды","value":"FPPS"},{"label":"Лимиты выплат","value":"ограничений нет"},{"label":"Периодичность начисления","value":"ежедневно"},{"label":"Комиссия","value":"2,5%"}]}$p33$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 34, 'pros_cons',
       $p34${"pros":["Надежность благодаря принадлежности к инфраструктуре Binance","Ежедневное начисление заработка","Хэшрейт отображается в онлайн-формате","Дополнительные инструменты для увеличения доходов майнера","Возможность получить VIP-статус и пользоваться преимуществами","Поддержка большинства алгоритмов и монет","Круглосуточная тех. поддержка"],"cons":["Необходимость прохождения обязательной верификации","Трудности работы для РУ-сегмента"]}$p34$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 35, 'heading',
       $p35${"level":2,"text":"8 место: KuCoin (Кукоин)"}$p35$::jsonb,
       'kucoin'
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 36, 'paragraph',
       $p36${"text":"«Карманный» майнинговый пул известной криптобиржи с одноименным названием. Это очень молодая платформа, запуск которой состоялся в 2021 году, однако, работая в связке с биржей, инструмент прост и удобен. Именно легкость интерфейса и предельная производительность является основой сервиса, который позволяет добывать всего две монеты – это BTC и BCH. Зачисление средств производится на следующий день – активы поступают на связанный с пулом аккаунт пользователя на бирже KuCoin.","html":"«Карманный» майнинговый пул известной криптобиржи с одноименным названием. Это очень молодая платформа, запуск которой состоялся в 2021 году, однако, работая в связке с биржей, инструмент прост и удобен. Именно легкость интерфейса и предельная производительность является основой сервиса, который позволяет добывать всего две монеты – это BTC и BCH. Зачисление средств производится на следующий день – активы поступают на связанный с пулом аккаунт пользователя на бирже KuCoin."}$p36$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 37, 'image',
       $p37${"src":"/images/articles/mining-pools-top10/kucoin.png","alt":"KuCoin Pool"}$p37$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 38, 'paragraph',
       $p38${"text":"Затраты майнера составляют 2%, что ниже среднего значения в масштабах всего сегмента. Площадка отличается простотой регистрации, настройки и запуска. Поддержка своевременно обрабатывает запросы и оперативно помогает майнерам, интерфейсы сайта качественно переведены на русский язык.","html":"Затраты майнера составляют 2%, что ниже среднего значения в масштабах всего сегмента. Площадка отличается простотой регистрации, настройки и запуска. Поддержка своевременно обрабатывает запросы и оперативно помогает майнерам, интерфейсы сайта качественно переведены на русский язык."}$p38$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 39, 'stats',
       $p39${"rows":[{"label":"Способ распределения награды","value":"FPPS"},{"label":"Лимиты выплат","value":"ограничений нет"},{"label":"Периодичность начисления","value":"ежедневно"},{"label":"Комиссия","value":"2%"}]}$p39$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 40, 'pros_cons',
       $p40${"pros":["Привязка к известной бирже","Доступность и простота","Качественная поддержка","Удобный интерфейс"],"cons":["Всего две монеты для майнинга","Осенью 2023 года была зафиксирована приостановка сервиса для переезда на обновленную платформу. Данное явление понизило репутацию KuCoin у опытных пользователей"]}$p40$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 41, 'heading',
       $p41${"level":2,"text":"7 место: 2miners (Тумайнерс)"}$p41$::jsonb,
       '2miners'
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 42, 'paragraph',
       $p42${"text":"В противовес Braiins Pool, где можно «копать» только Биток, существует 2miners, с помощью которого добывается множество монет, среди которых Биткоина нет. Мультивалютная платформа с 20+ вариантами майнинга ориентирована на международное сообщество. Пользователь самостоятельно выбирает формат добычи, от которого зависит в том числе и пошлина (1% для PPLNS и 1,5% для Solo).","html":"В противовес Braiins Pool, где можно «копать» только Биток, существует 2miners, с помощью которого добывается множество монет, среди которых Биткоина нет. Мультивалютная платформа с 20+ вариантами майнинга ориентирована на международное сообщество. Пользователь самостоятельно выбирает формат добычи, от которого зависит в том числе и пошлина (1% для PPLNS и 1,5% для Solo)."}$p42$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 43, 'image',
       $p43${"src":"/images/articles/mining-pools-top10/2miners.png","alt":"2miners"}$p43$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 44, 'paragraph',
       $p44${"text":"Отзывы о 2miners противоречивые. С одной стороны, это современный инструмент с множеством монет для заработка. Но с другой – поддержка не отличается эффективностью работы, в процессе добычи встречаются сбои и доходы не всегда оправдывают ожиданий. Но несмотря на такие данные, продукт обладает своими поклонниками по всему миру.","html":"Отзывы о 2miners противоречивые. С одной стороны, это современный инструмент с множеством монет для заработка. Но с другой – поддержка не отличается эффективностью работы, в процессе добычи встречаются сбои и доходы не всегда оправдывают ожиданий. Но несмотря на такие данные, продукт обладает своими поклонниками по всему миру."}$p44$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 45, 'stats',
       $p45${"rows":[{"label":"Способ распределения награды","value":"PPLNS, Solo"},{"label":"Лимиты выплат","value":"0,1 ETC"},{"label":"Периодичность начисления","value":"ежедневно"},{"label":"Комиссия","value":"1% (PPLNS), 1,5% (Solo)"}]}$p45$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 46, 'pros_cons',
       $p46${"pros":["Множество монет для майнинга","Простая регистрация и быстрый старт","Два формата работы","Система ботов и уведомлений для оповещении о важных событиях","Встроенный калькулятор","Детальная статистика","Низкие комиссионные сборы","Поддержка множества языков"],"cons":["Работа платформы не отличается стабильностью","Среди добываемых монет нет BTC","Претензии пользователей к работе поддержки"]}$p46$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 47, 'heading',
       $p47${"level":2,"text":"6 место: Braiins Pool (Брэйнз Пул)"}$p47$::jsonb,
       'braiins-pool'
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 48, 'paragraph',
       $p48${"text":"Старейший пул для майнинга, основанный в далеком 2010 году (ранее проект назывался Slush Pool, его авторами являются разработчики кошелька Trezor). Принято считать, что Braiins Pool является лучшим продуктом для начинающих майнеров, так как процесс подключения прост и понятен. Инструмент обладает удобным мобильным приложением, интерфейсы качественно переведены на различные языки мира, включая русский. Еще одно отличительная черта – максимальная прозрачность работы Braiins Pool за счет детальной статистики и точности данных.","html":"Старейший пул для майнинга, основанный в далеком 2010 году (ранее проект назывался Slush Pool, его авторами являются разработчики кошелька Trezor). Принято считать, что Braiins Pool является лучшим продуктом для начинающих майнеров, так как процесс подключения прост и понятен. Инструмент обладает удобным мобильным приложением, интерфейсы качественно переведены на различные языки мира, включая русский. Еще одно отличительная черта – максимальная прозрачность работы Braiins Pool за счет детальной статистики и точности данных."}$p48$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 49, 'image',
       $p49${"src":"/images/articles/mining-pools-top10/braiins-pool.png","alt":"Braiins Pool"}$p49$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 50, 'paragraph',
       $p50${"text":"Интересно, что на этом сервисе можно добывать только Биткоин, так как авторы разработки признают лишь первую криптовалюту. Именно по этой причине многие майнеры после получения базового опыта на Braiins Pool переезжают на альтернативные площадки, где перечень монет значительно больше.","html":"Интересно, что на этом сервисе можно добывать только Биткоин, так как авторы разработки признают лишь первую криптовалюту. Именно по этой причине многие майнеры после получения базового опыта на Braiins Pool переезжают на альтернативные площадки, где перечень монет значительно больше."}$p50$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 51, 'stats',
       $p51${"rows":[{"label":"Способ распределения награды","value":"Score"},{"label":"Лимиты выплат","value":"0,001 BTC"},{"label":"Периодичность начисления","value":"ежедневно"},{"label":"Комиссия","value":"2%"}]}$p51$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 52, 'pros_cons',
       $p52${"pros":["Хорошая репутация за счет возраста","Простота для новичков","Детальная статистика в режиме реального времени","Качественная поддержка 24/7","Ежедневные выплаты"],"cons":["Всего одна валюта для майнинга","Особая система начисления награды Score, которая зависит в том числе от возраста аккаунта","Минимальная сумма вывода – 0,001 Биткоина (можно вывести и меньше, но с дополнительными расходами)"]}$p52$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 53, 'heading',
       $p53${"level":2,"text":"5 место: OKX Pool (Окейикс Пул)"}$p53$::jsonb,
       'okx-pool'
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 54, 'paragraph',
       $p54${"text":"Собственный пул еще одной крупной биржи. Позволяет добывать основные криптовалюты, однако, наибольшую популярность OKX Pool обрел именно у добытчиков ETC. Работа платформы стабильна, механизмы защиты находятся на высоком уровне, что позволяет не беспокоиться за сохранность активов. Ежедневное начисление награды удобно пользователю, как и отсутствие минимальной суммы для вывода.","html":"Собственный пул еще одной крупной биржи. Позволяет добывать основные криптовалюты, однако, наибольшую популярность OKX Pool обрел именно у добытчиков ETC. Работа платформы стабильна, механизмы защиты находятся на высоком уровне, что позволяет не беспокоиться за сохранность активов. Ежедневное начисление награды удобно пользователю, как и отсутствие минимальной суммы для вывода."}$p54$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 55, 'paragraph',
       $p55${"text":"Главной ложкой дегтя является наличие обязательной верификации, да еще и в фото-формате: многие майнеры стараются сохранить анонимность, следовательно, подобный фактор может оказаться неприемлемым. Кроме того, OKX Pool отличается высокими пошлинами – 4%. Это значение несколько выше среднего по отрасли.","html":"Главной ложкой дегтя является наличие обязательной верификации, да еще и в фото-формате: многие майнеры стараются сохранить анонимность, следовательно, подобный фактор может оказаться неприемлемым. Кроме того, OKX Pool отличается высокими пошлинами – 4%. Это значение несколько выше среднего по отрасли."}$p55$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 56, 'stats',
       $p56${"rows":[{"label":"Способ распределения награды","value":"PPLNS"},{"label":"Лимиты выплат","value":"ограничений нет"},{"label":"Периодичность начисления","value":"ежедневно"},{"label":"Комиссия","value":"4%"}]}$p56$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 57, 'pros_cons',
       $p57${"pros":["Доход майнера отображается в режиме реального времени и начисляется автоматически","Отсутствуют ограничения по минимальной сумме вывода","Поддержка основных монет и алгоритмов добычи","Достойная поддержка пользователей 24/7","Ежедневные выплаты"],"cons":["Обязательная фото-верификация","Высокие комиссионные сборы"]}$p57$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 58, 'heading',
       $p58${"level":2,"text":"4 место: F2Pool (Эфтупул)"}$p58$::jsonb,
       'f2pool'
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 59, 'paragraph',
       $p59${"text":"Один из крупнейших пулов для майнинга, который существует с 2013 года (на момент основания он назывался Discus Fish). Старая и проверенная платформа, которой доверяют миллионы майнеров со всего мира – площадка успешно работает по всему миру, предлагая множество языков интерфейса и поддержки, включая русский.","html":"Один из крупнейших пулов для майнинга, который существует с 2013 года (на момент основания он назывался Discus Fish). Старая и проверенная платформа, которой доверяют миллионы майнеров со всего мира – площадка успешно работает по всему миру, предлагая множество языков интерфейса и поддержки, включая русский."}$p59$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 60, 'image',
       $p60${"src":"/images/articles/mining-pools-top10/f2pool.png","alt":"F2Pool"}$p60$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 61, 'paragraph',
       $p61${"text":"F2Pool предлагает функции дополнительного заработка, например, объединенный майнинг – участие в добыче бонусных монет, получаемых вместе с основными. Это позволяет зарабатывать больше, не увеличивая хэшрейт оборудования. Но есть и недостаток – это необычный формат работы с пассивными аккаунтами. Если вовремя не выводить средства и не проявлять активность в учетной записи, профиль могут заморозить, а имеющиеся средства направить в формате доната на развитие F2Pool.","html":"F2Pool предлагает функции дополнительного заработка, например, объединенный майнинг – участие в добыче бонусных монет, получаемых вместе с основными. Это позволяет зарабатывать больше, не увеличивая хэшрейт оборудования. Но есть и недостаток – это необычный формат работы с пассивными аккаунтами. Если вовремя не выводить средства и не проявлять активность в учетной записи, профиль могут заморозить, а имеющиеся средства направить в формате доната на развитие F2Pool."}$p61$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 62, 'stats',
       $p62${"rows":[{"label":"Способ распределения награды","value":"PPS+"},{"label":"Лимиты выплат","value":"0,005 BTC"},{"label":"Периодичность начисления","value":"ежедневно"},{"label":"Комиссия","value":"2,5%"}]}$p62$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 63, 'pros_cons',
       $p63${"pros":["Возраст и репутация","Высокая степень защиты аккаунтов","Множество монет для добычи","Функция объединенного майнинга","Мировая известность и популярность","Хорошая поддержка"],"cons":["Необходимость своевременного вывода монет","Важность активности в аккаунте для защиты от блокировки","Существенные минимальные лимиты выплат"]}$p63$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 64, 'heading',
       $p64${"level":2,"text":"3 место: Poolin (Пулин)"}$p64$::jsonb,
       'poolin'
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 65, 'paragraph',
       $p65${"text":"Относительно молодая платформа для добычи криптовалют, которая быстро завоевала популярность в мире майнинга. Подобное стало возможным благодаря совокупности преимуществ, главным из которых является формат объединенного майнинга. В зависимости от курса криптовалют, система позволяет добывать сразу несколько монет, задействовав одни и те же вычислительные мощности. Данная функция работает автоматически, исключая вмешательство майнера.","html":"Относительно молодая платформа для добычи криптовалют, которая быстро завоевала популярность в мире майнинга. Подобное стало возможным благодаря совокупности преимуществ, главным из которых является формат объединенного майнинга. В зависимости от курса криптовалют, система позволяет добывать сразу несколько монет, задействовав одни и те же вычислительные мощности. Данная функция работает автоматически, исключая вмешательство майнера."}$p65$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 66, 'image',
       $p66${"src":"/images/articles/mining-pools-top10/poolin.png","alt":"Poolin"}$p66$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 67, 'paragraph',
       $p67${"text":"Пользователи отмечают простой интерфейс системы, быструю регистрацию и ежедневные выплаты. Среди недостатков называется высокий лимит на экспорт – 0,005 Биткоина. Также с именем Poolin связано громкое судебное разбирательство – поскольку создателями являются разработчики компании Bitmain, ей пришлось подать иск с обвинением в нарушении трудового договора. Сумма выплат составила почти 200 000$.","html":"Пользователи отмечают простой интерфейс системы, быструю регистрацию и ежедневные выплаты. Среди недостатков называется высокий лимит на экспорт – 0,005 Биткоина. Также с именем Poolin связано громкое судебное разбирательство – поскольку создателями являются разработчики компании Bitmain, ей пришлось подать иск с обвинением в нарушении трудового договора. Сумма выплат составила почти 200 000$."}$p67$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 68, 'stats',
       $p68${"rows":[{"label":"Способ распределения награды","value":"FPPS"},{"label":"Лимиты выплат","value":"0,005 BTC"},{"label":"Периодичность начисления","value":"ежедневно"},{"label":"Комиссия","value":"2,5%"}]}$p68$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 69, 'pros_cons',
       $p69${"pros":["Простая регистрация аккаунта, легкое подключение и быстрый старт","Анонимность майнинга","Функция объединенной добычи нескольких монет","Качественная поддержка пользователей, в том числе в Telegram","Внутренний рейтинг майнеров","Собственный калькулятор доходности","Оперативное оповещение об изменениях хэшрейта"],"cons":["Высокая сумма экспорта актива – 0,005 BTC","Не все разделы сайта качественно переведены на русский язык"]}$p69$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 70, 'heading',
       $p70${"level":2,"text":"2 место: AntPool (ЭнтПул)"}$p70$::jsonb,
       'antpool'
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 71, 'paragraph',
       $p71${"text":"Один из старейших пулов по добыче криптовалют, основанный в 2014 году. Принадлежит известнейшему производителю оборудования для майнинга, компании Bitmain Tech Ltd. AntPool долгое время удерживал лидерство в сегменте по числу пользователей и суммарному хэшрейту, а сегодня площадка продолжается входить в ТОП-10 наиболее популярных сервисов совместной добычи цифровых активов.","html":"Один из старейших пулов по добыче криптовалют, основанный в 2014 году. Принадлежит известнейшему производителю оборудования для майнинга, компании Bitmain Tech Ltd. AntPool долгое время удерживал лидерство в сегменте по числу пользователей и суммарному хэшрейту, а сегодня площадка продолжается входить в ТОП-10 наиболее популярных сервисов совместной добычи цифровых активов."}$p71$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 72, 'image',
       $p72${"src":"/images/articles/mining-pools-top10/antpool.png","alt":"AntPool"}$p72$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 73, 'paragraph',
       $p73${"text":"Пользователям предлагается два формата распределения награды – это FPPS (комиссия 4%) и PPLNS (0%). Кроме того, допустима возможность Solo-майнинга для пользователей с большими объемами вычислительных мощностей. Выплаты осуществляются ежедневно, однако есть ограничение минимальной суммы экспорта – 0,005 BTC.","html":"Пользователям предлагается два формата распределения награды – это FPPS (комиссия 4%) и PPLNS (0%). Кроме того, допустима возможность Solo-майнинга для пользователей с большими объемами вычислительных мощностей. Выплаты осуществляются ежедневно, однако есть ограничение минимальной суммы экспорта – 0,005 BTC."}$p73$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 74, 'stats',
       $p74${"rows":[{"label":"Способ распределения награды","value":"FPPS и PPLNS"},{"label":"Лимиты выплат","value":"0,005 BTC"},{"label":"Периодичность начисления","value":"ежедневно"},{"label":"Комиссия","value":"4% (FPPS), 0% (PPLNS)"}]}$p74$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 75, 'pros_cons',
       $p75${"pros":["Статус старейшего и надежного","Быстрая регистрация","Отсутствие необходимости верификации личности","Ежедневные выплаты","Возможность выбора одного из нескольких форматов работы","Множество настроек","Поддержка 24/7","Наличие базовых монет для майнинга","Отсутствие комиссии для PPLNS","Множество языков интерфейса","Общение между пользователями в чате и на форуме"],"cons":["Высокие комиссии для FPPS (4%)","Сложность настройки для новичков","Высокая стартовая сумма вывода - 0,005 BTC"]}$p75$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 76, 'heading',
       $p76${"level":2,"text":"1 место: ViaBTC (Виабитиси)"}$p76$::jsonb,
       'viabtc'
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 77, 'paragraph',
       $p77${"text":"Китайская платформа, начавшая свою работу в 2016 году. Площадка ViaBTC полюбилась пользователям за простоту интерфейса, высокую степень надежности и функцию смарт-майнинга (инструмент автоматического переключения добычи на более выгодную монету). Пул является частью экосистемы, объединяющей кошелек и биржу CoinEx, что удобно с инфраструктурной точки зрения.","html":"Китайская платформа, начавшая свою работу в 2016 году. Площадка ViaBTC полюбилась пользователям за простоту интерфейса, высокую степень надежности и функцию смарт-майнинга (инструмент автоматического переключения добычи на более выгодную монету). Пул является частью экосистемы, объединяющей кошелек и биржу CoinEx, что удобно с инфраструктурной точки зрения."}$p77$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 78, 'image',
       $p78${"src":"/images/articles/mining-pools-top10/viabtc.png","alt":"ViaBTC"}$p78$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 79, 'paragraph',
       $p79${"text":"Платформа позволяет выводить минимум 0,001 Биткоина, а процесс экспорта без комиссии может потребовать дополнительных действий. Например, сначала вывести имеющийся актив на биржу CoinEx (сборы 0%), а уже затем отправлять на сторонние сервисы (биржи или криптокошельки). Кроме того, ViaBTC предлагает пользователям сразу три формата добычи – это PPLNS, PPS+ и Solo (комиссии на добычу зависят от сделанного выбора).","html":"Платформа позволяет выводить минимум 0,001 Биткоина, а процесс экспорта без комиссии может потребовать дополнительных действий. Например, сначала вывести имеющийся актив на биржу CoinEx (сборы 0%), а уже затем отправлять на сторонние сервисы (биржи или криптокошельки). Кроме того, ViaBTC предлагает пользователям сразу три формата добычи – это PPLNS, PPS+ и Solo (комиссии на добычу зависят от сделанного выбора)."}$p79$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 80, 'stats',
       $p80${"rows":[{"label":"Способ распределения награды","value":"PPLNS, PPS+, Solo"},{"label":"Лимиты выплат","value":"0,001 BTC"},{"label":"Периодичность начисления","value":"ежедневно"},{"label":"Комиссия","value":"4% (PPS+), 2% (PPLNS), 1% (Solo)"}]}$p80$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 81, 'pros_cons',
       $p81${"pros":["Простой и понятный интерфейс (один из лучших вариантов для новичков)","Возраст и трастовость","Три формата добычи","Функция смарт-майнинга","Добыча популярных форматов и криптовалют","Является частью целой экосистемы","Удобное приложение для мобильных устройств"],"cons":["Наличие минимальной суммы для вывода – 0,001 BTC","Высокие сборы для PPS+ майнинга","Необходимость совершения «лишних» транзакций для вывода средств без дополнительных расходов"]}$p81$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 82, 'heading',
       $p82${"level":2,"text":"Выводы"}$p82$::jsonb,
       'vyvody'
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 83, 'paragraph',
       $p83${"text":"Майнинговые пулы – необходимый инструмент для большинства участников рынка. Они повышают шансы на стабильный доход, упрощают процесс добычи и снижают технические риски.","html":"Майнинговые пулы – необходимый инструмент для большинства участников рынка. Они повышают шансы на стабильный доход, упрощают процесс добычи и снижают технические риски."}$p83$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 84, 'paragraph',
       $p84${"text":"При выборе пула важно учитывать:","html":"При выборе пула важно учитывать:"}$p84$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 85, 'list',
       $p85${"ordered":false,"items":["Комиссии;","Репутацию;","Географическую близость серверов;","Методы выплат;","Поддерживаемые монеты;","Наличие русскоязычной поддержки и прозрачных правил."]}$p85$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 86, 'paragraph',
       $p86${"text":"Для майнеров из СНГ стоит выбирать платформы с понятными условиями, быстрым доступом, поддержкой локальной валюты и удобным выводом средств. Участие в качественном пуле позволяет сосредоточиться на главном – повышении эффективности и окупаемости оборудования.","html":"Для майнеров из СНГ стоит выбирать платформы с понятными условиями, быстрым доступом, поддержкой локальной валюты и удобным выводом средств. Участие в качественном пуле позволяет сосредоточиться на главном – повышении эффективности и окупаемости оборудования."}$p86$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

-- =====================================================================
-- 039_article_asic_firmware.sql
-- =====================================================================

-- Рейтинг прошивок для асиков: ТОП-6

INSERT INTO articles (
    slug, title, title_subtitle, excerpt, content, topic_id,
    reading_time_min, reading_minutes, published_at, view_count,
    display_type, sort_order, is_published, uses_blocks,
    image_url, image_alt
) VALUES (
    'rejting-proshivok-dlya-asikov-top-5',
    'Рейтинг прошивок для асиков',
    'ТОП-6',
    $excerpt$ТОП прошивок для асиков: PitBit, Vnish, HiveOn, Bixbit и Braiins OS — сравнение функций, комиссий и совместимости.$excerpt$,
    $content$Введение

Сторонние прошивки помогают оптимизировать хешрейт, энергопотребление и управление фермой.

Выводы

Используйте проверенные решения с хорошей репутацией и поддержкой.$content$,
    'mining',
    9,
    9,
    '2023-10-22',
    1487,
    'list',
    9,
    TRUE,
    TRUE,
    '/images/articles/asic-firmware-top6/pitbit-boxes.png',
    'PitBit Firmware'
)
ON CONFLICT (slug) DO UPDATE SET
    title = EXCLUDED.title,
    title_subtitle = EXCLUDED.title_subtitle,
    excerpt = EXCLUDED.excerpt,
    content = EXCLUDED.content,
    reading_time_min = EXCLUDED.reading_time_min,
    reading_minutes = EXCLUDED.reading_minutes,
    published_at = EXCLUDED.published_at,
    view_count = EXCLUDED.view_count,
    uses_blocks = TRUE,
    image_url = EXCLUDED.image_url,
    image_alt = EXCLUDED.image_alt,
    is_published = TRUE;

DELETE FROM article_blocks
WHERE article_id = (SELECT id FROM articles WHERE slug = 'rejting-proshivok-dlya-asikov-top-5');

UPDATE rating_items
SET href = '/articles/rejting-proshivok-dlya-asikov-top-5',
    label = 'Рейтинг прошивок для асиков: ТОП-6'
WHERE href LIKE '%rejting-proshivok-dlya-asikov%'
   OR label ILIKE '%прошивок для асиков%';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 1, 'heading',
       $p1${"level":2,"text":"Введение"}$p1$::jsonb,
       'vvedenie'
FROM articles a WHERE a.slug = 'rejting-proshivok-dlya-asikov-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 2, 'paragraph',
       $p2${"text":"Майнинг криптовалюты – это технически сложный процесс, в котором важна не только мощность оборудования, но и правильная настройка. А один из ключевых инструментов, позволяющих оптимизировать работу асика – это прошивка.","html":"Майнинг криптовалюты – это технически сложный процесс, в котором важна не только мощность оборудования, но и правильная настройка. А один из ключевых инструментов, позволяющих оптимизировать работу асика – это прошивка."}$p2$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-proshivok-dlya-asikov-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 3, 'image',
       $p3${"src":"/images/articles/asic-firmware-top6/pcb-hero.png","alt":"Печатная плата ASIC и прошивки"}$p3$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-proshivok-dlya-asikov-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 4, 'paragraph',
       $p4${"text":"Заводская прошивка, поставляемая с устройством, обеспечивает базовую функциональность, но часто ограничивает возможности кастомизации и управления. Именно поэтому все больше майнеров переходят на сторонние прошивки, которые позволяют выжать максимум из оборудования.","html":"Заводская прошивка, поставляемая с устройством, обеспечивает базовую функциональность, но часто ограничивает возможности кастомизации и управления. Именно поэтому все больше майнеров переходят на сторонние прошивки, которые позволяют выжать максимум из оборудования."}$p4$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-proshivok-dlya-asikov-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 5, 'heading',
       $p5${"level":2,"text":"Что такое сторонняя прошивка и зачем она нужна?"}$p5$::jsonb,
       'chto-takoe-storonnyaya-proshivka'
FROM articles a WHERE a.slug = 'rejting-proshivok-dlya-asikov-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 6, 'paragraph',
       $p6${"text":"Прошивка для майнинга – это программное обеспечение, установленное на контроллер майнера, управляющее его работой: частотой, напряжением, вентиляцией, алгоритмом подключения к пулу и другими параметрами.","html":"Прошивка для майнинга – это программное обеспечение, установленное на контроллер майнера, управляющее его работой: частотой, напряжением, вентиляцией, алгоритмом подключения к пулу и другими параметрами."}$p6$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-proshivok-dlya-asikov-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 7, 'paragraph',
       $p7${"text":"Сторонняя прошивка – это неофициальное ПО, разработанное независимыми командами или компаниями. Она устанавливается вместо заводской с целью расширить функциональность и оптимизировать параметры работы устройства.","html":"Сторонняя прошивка – это неофициальное ПО, разработанное независимыми командами или компаниями. Она устанавливается вместо заводской с целью расширить функциональность и оптимизировать параметры работы устройства."}$p7$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-proshivok-dlya-asikov-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 8, 'paragraph',
       $p8${"text":"Зачем нужна сторонняя прошивка:","html":"Зачем нужна сторонняя прошивка:"}$p8$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-proshivok-dlya-asikov-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 9, 'rich_list',
       $p9${"ordered":false,"items":[{"title":"Разгон","text":"Для разгона (оверклокинга) чипов и повышения хешрейта;"},{"title":"Андерволтинг","text":"Для снижения потребления энергии при сохранении производительности;"},{"title":"Температура и вентиляторы","text":"Для улучшенного контроля температуры и вентиляторов;"},{"title":"Мониторинг","text":"Для дополнительной статистики и мониторинга;"},{"title":"Стабильность","text":"Для автоматического перезапуска, защиты от зависаний и ошибок;"},{"title":"Управление парком","text":"Для управления большим парком устройств из одного интерфейса."}]}$p9$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-proshivok-dlya-asikov-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 10, 'heading',
       $p10${"level":2,"text":"Преимущества и недостатки сторонних прошивок"}$p10$::jsonb,
       'preimushchestva-i-nedostatki'
FROM articles a WHERE a.slug = 'rejting-proshivok-dlya-asikov-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 11, 'paragraph',
       $p11${"text":"Преимущества:","html":"Преимущества:"}$p11$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-proshivok-dlya-asikov-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 12, 'rich_list',
       $p12${"ordered":false,"items":[{"title":"Повышение доходности","text":"Благодаря разгону можно увеличить хешрейт на 10–30%, а андерволтинг уменьшает затраты на электроэнергию;"},{"title":"Гибкость","text":"Широкий набор настроек позволяет адаптировать устройство под конкретные условия (например, понизить шум или нагрев);"},{"title":"Дополнительные функции","text":"Часто реализованы полезные фичи: автофейловер пулов, удаленное управление, API-доступ, журнал логов;"},{"title":"Продление срока службы","text":"За счет точной настройки температуры и энергопотребления снижается износ оборудования;"},{"title":"Обновляемость","text":"Многие сторонние прошивки регулярно получают обновления и поддержку от разработчиков."}]}$p12$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-proshivok-dlya-asikov-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 13, 'paragraph',
       $p13${"text":"Недостатки:","html":"Недостатки:"}$p13$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-proshivok-dlya-asikov-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 14, 'rich_list',
       $p14${"ordered":false,"items":[{"title":"Потеря гарантии","text":"После установки сторонней прошивки производитель может отказать в гарантийном обслуживании;"},{"title":"Совместимость","text":"Не каждая прошивка подходит для всех моделей асиков – возможны сбои;"},{"title":"Риск вредоносного ПО","text":"Использование непроверенных прошивок может привести к краже хешрейта или вредоносной активности;"},{"title":"Ручная настройка","text":"Требуется техническое понимание параметров и основ майнинга."}]}$p14$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-proshivok-dlya-asikov-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 15, 'heading',
       $p15${"level":2,"text":"Как выбрать прошивку: ключевые критерии"}$p15$::jsonb,
       'kak-vybrat-proshivku'
FROM articles a WHERE a.slug = 'rejting-proshivok-dlya-asikov-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 16, 'paragraph',
       $p16${"text":"Перед выбором того или иного ПО следует проанализировать ряд базовых параметров, отвечающих за доходность, эффективность и безопасность.","html":"Перед выбором того или иного ПО следует проанализировать ряд базовых параметров, отвечающих за доходность, эффективность и безопасность."}$p16$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-proshivok-dlya-asikov-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 17, 'paragraph',
       $p17${"text":"Ключевые характеристики:","html":"Ключевые характеристики:"}$p17$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-proshivok-dlya-asikov-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 18, 'rich_list',
       $p18${"ordered":false,"items":[{"title":"Совместимость с асиком","text":"Проверьте, поддерживается ли конкретная модель. Некоторые прошивки заточены под Antminer S19, другие – под S21, T21 и так далее;"},{"title":"Функциональность","text":"Нужен ли вам разгон, андерволтинг, удаленный доступ, автоматизация или другие функции?"},{"title":"Надежность и репутация","text":"Выбирайте только проверенные и широко используемые прошивки. Обратите внимание на отзывы, частоту обновлений и наличие техподдержки;"},{"title":"Удобство интерфейса","text":"Интуитивно понятная панель управления упростит настройку и мониторинг. Некоторые прошивки поддерживают русский язык;"},{"title":"Безопасность","text":"Ищите проекты с открытым кодом или прозрачной политикой конфиденциальности. Некоторые прошивки интегрируют защиту от вирусов и сбоев;"},{"title":"Стоимость","text":"Некоторые прошивки бесплатны, но продвинутые функции могут потребовать подписки или лицензии (например, по хешрейту или количеству устройств)."}]}$p18$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-proshivok-dlya-asikov-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 19, 'heading',
       $p19${"level":2,"text":"Риски использования сторонних прошивок"}$p19$::jsonb,
       'riski-ispolzovaniya'
FROM articles a WHERE a.slug = 'rejting-proshivok-dlya-asikov-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 20, 'paragraph',
       $p20${"text":"Программное обеспечение, разработанное сторонними командами – это всегда риски, о которых важно помнить.","html":"Программное обеспечение, разработанное сторонними командами – это всегда риски, о которых важно помнить."}$p20$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-proshivok-dlya-asikov-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 21, 'paragraph',
       $p21${"text":"Ключевые факторы, способные привести к возникновению проблем:","html":"Ключевые факторы, способные привести к возникновению проблем:"}$p21$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-proshivok-dlya-asikov-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 22, 'rich_list',
       $p22${"ordered":false,"items":[{"title":"Потеря хешрейта","text":"В случае использования небезопасной прошивки часть вычислений может быть перенаправлена третьим лицам;"},{"title":"Нестабильная работа","text":"Разгон может повысить температуру и износ оборудования, особенно если отсутствует должное охлаждение;"},{"title":"Сложность возврата","text":"В ряде случаев, особенно при сбоях, восстановить оригинальную прошивку бывает непросто;"},{"title":"Нарушение гарантии","text":"Производители не поддерживают сторонние решения и могут аннулировать гарантию."}]}$p22$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-proshivok-dlya-asikov-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 23, 'paragraph',
       $p23${"text":"Чтобы снизить риски:","html":"Чтобы снизить риски:"}$p23$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-proshivok-dlya-asikov-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 24, 'list',
       $p24${"ordered":false,"items":["Используйте только официальные сайты разработчиков;","Делайте бэкапы конфигурации перед обновлением;","Настраивайте температурные ограничения и автоматику отключения."]}$p24$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-proshivok-dlya-asikov-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 25, 'paragraph',
       $p25${"text":"Познакомимся с ТОП-5 лучших сторонних прошивок для асиков.","html":"Познакомимся с ТОП-5 лучших сторонних прошивок для асиков."}$p25$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-proshivok-dlya-asikov-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 26, 'heading',
       $p26${"level":2,"text":"5 место: Braiins OS"}$p26$::jsonb,
       'braiins-os'
FROM articles a WHERE a.slug = 'rejting-proshivok-dlya-asikov-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 27, 'paragraph',
       $p27${"text":"У достаточно известного пула для майнинга Braiins, который существует с 2010 года, есть свой комплект прошивок для асиков. И подобный формат вызывает доверие, так как программное обеспечение представлено на официальном сайте пула. Разработчики подготовили обновленные прошивки для линейки Bitmain – с помощью данного софта можно разогнать модели 9-й, 17-й и 19-й серии. Производитель обещает простую установку и быстрый запуск, что позволит использовать обновление даже новичкам.","html":"У достаточно известного пула для майнинга Braiins, который существует с 2010 года, есть свой комплект прошивок для асиков. И подобный формат вызывает доверие, так как программное обеспечение представлено на официальном сайте пула. Разработчики подготовили обновленные прошивки для линейки Bitmain – с помощью данного софта можно разогнать модели 9-й, 17-й и 19-й серии. Производитель обещает простую установку и быстрый запуск, что позволит использовать обновление даже новичкам."}$p27$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-proshivok-dlya-asikov-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 28, 'image',
       $p28${"src":"/images/articles/asic-firmware-top6/braiins-os.png","alt":"Braiins OS — апгрейд производительности Antminer"}$p28$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-proshivok-dlya-asikov-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 29, 'paragraph',
       $p29${"text":"Устройства, перепрошитые с помощью Braiins OS, могут успешно работать на любых пулах – в этом случае майнеру придется отдавать 2,5% комиссионных разработчикам. Но если владелец фермы выбирает пул Braiins, комиссии за прошивку отсутствуют – правообладатели зарабатывают только на отчислениях за сам пул. Среди явных недостатков – некачественно переведенный на русский язык сайт: лишь часть интерфейсов понятна русскоязычным пользователям.","html":"Устройства, перепрошитые с помощью Braiins OS, могут успешно работать на любых пулах – в этом случае майнеру придется отдавать 2,5% комиссионных разработчикам. Но если владелец фермы выбирает пул Braiins, комиссии за прошивку отсутствуют – правообладатели зарабатывают только на отчислениях за сам пул. Среди явных недостатков – некачественно переведенный на русский язык сайт: лишь часть интерфейсов понятна русскоязычным пользователям."}$p29$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-proshivok-dlya-asikov-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 30, 'stats',
       $p30${"rows":[{"label":"Сайт","value":"braiins.com/os/plus"},{"label":"Год регистрации домена","value":"2011"},{"label":"Поддерживаемые асики","value":"Antminer S9, S17, S19"},{"label":"Заявленное увеличение доходности","value":"до 20%"},{"label":"Стоимость","value":"от 0 до 2,5% от хэша"}]}$p30$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-proshivok-dlya-asikov-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 31, 'pros_cons',
       $p31${"pros":["Официальная прошивка от знакомого многим пула, что повышает степень доверия к ПО;","Отсутствие комиссий за прошивку при использовании пула Braiins;","Простой и понятный процесс установки;","Безопасная эксплуатация с минимизацией рисков;","Возможность работы с иммерсионным охлаждением;","Функция предварительного прогрева для предотвращения холодного запуска фермы;","Автоматическое обновление ПО;","Формат массовой установки."],"cons":["Ориентир на продукцию лишь одного производителя – Bitmain;","Ограниченный модельный ряд – всего 3 линейки;","Некачественно переведенный на русский язык сайт."]}$p31$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-proshivok-dlya-asikov-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 32, 'heading',
       $p32${"level":2,"text":"4 место: Bixbit"}$p32$::jsonb,
       'bixbit'
FROM articles a WHERE a.slug = 'rejting-proshivok-dlya-asikov-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 33, 'paragraph',
       $p33${"text":"Компания Bixbit является достаточно известным производителем систем иммерсионного охлаждения для майнинговых ферм. Вместе с этим предлагаются кастомные прошивки для повышения производительности техники и возможности размещения в контейнерах с иммерсией. Заявленное увеличение производительности – до 40%, комиссия сервиса – от 1,8% до 2,8% (в зависимости от модели асика). Дизайн сайта и его наполнение приятно удивляют: представлена полная и максимально подробная информация, которая вызывает доверие.","html":"Компания Bixbit является достаточно известным производителем систем иммерсионного охлаждения для майнинговых ферм. Вместе с этим предлагаются кастомные прошивки для повышения производительности техники и возможности размещения в контейнерах с иммерсией. Заявленное увеличение производительности – до 40%, комиссия сервиса – от 1,8% до 2,8% (в зависимости от модели асика). Дизайн сайта и его наполнение приятно удивляют: представлена полная и максимально подробная информация, которая вызывает доверие."}$p33$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-proshivok-dlya-asikov-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 34, 'image',
       $p34${"src":"/images/articles/asic-firmware-top6/bixbit.png","alt":"BiXBiT — фирменная прошивка для ASIC"}$p34$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-proshivok-dlya-asikov-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 35, 'paragraph',
       $p35${"text":"Разработчики Bixbit подготовили программное обеспечение не только для Bitmain Antminer, но и для Whatsminer от компании MicroBT, что также выгодно отличает данные прошивки от большинства конкурентов. Модельный ряд устройств, подходящих для использования софта, также впечатляет – это практически два десятка асиков от названных выше производителей.","html":"Разработчики Bixbit подготовили программное обеспечение не только для Bitmain Antminer, но и для Whatsminer от компании MicroBT, что также выгодно отличает данные прошивки от большинства конкурентов. Модельный ряд устройств, подходящих для использования софта, также впечатляет – это практически два десятка асиков от названных выше производителей."}$p35$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-proshivok-dlya-asikov-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 36, 'stats',
       $p36${"rows":[{"label":"Сайт","value":"bixbit.io/ru/firmwares"},{"label":"Год регистрации домена","value":"2017"},{"label":"Поддерживаемые асики","value":"Antminer L3, S9, S17, S19 и Whatsminer M2, M3, M5"},{"label":"Заявленное увеличение доходности","value":"до 40%"},{"label":"Стоимость","value":"от 1,8% до 2,8% от хэша"}]}$p36$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-proshivok-dlya-asikov-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 37, 'pros_cons',
       $p37${"pros":["Прошивки от известного продавца систем иммерсионного охлаждения;","Работа с продукцией Bitmain и MicroBT;","Множество подходящих моделей для оптимизации;","Детализированная статистика;","Качественный сайт;","Выгодная партнерская программа;","Дополнительные услуги по разработке индивидуального ПО;","Множество форматов технической поддержки."],"cons":["Комиссия для некоторых моделей асиков выше, чем у конкурентов."]}$p37$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-proshivok-dlya-asikov-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 38, 'heading',
       $p38${"level":2,"text":"3 место: HiveOn"}$p38$::jsonb,
       'hiveon'
FROM articles a WHERE a.slug = 'rejting-proshivok-dlya-asikov-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 39, 'paragraph',
       $p39${"text":"Прошивка HiveOn для асиков Antminer анонсирует увеличение хэшрейта до 30%, что внушительным образом влияет на доход майнеров. Данное программное обеспечение подходит для оптимизации наиболее популярных моделей асиков от Bitmain – это 9-я, 17-я и 19-я серии, а также L3 и L7. На сайте разработчика представлен удобный калькулятор, позволяющий рассчитать реальную выгоду от применения прошивки для любой доступной модели техники.","html":"Прошивка HiveOn для асиков Antminer анонсирует увеличение хэшрейта до 30%, что внушительным образом влияет на доход майнеров. Данное программное обеспечение подходит для оптимизации наиболее популярных моделей асиков от Bitmain – это 9-я, 17-я и 19-я серии, а также L3 и L7. На сайте разработчика представлен удобный калькулятор, позволяющий рассчитать реальную выгоду от применения прошивки для любой доступной модели техники."}$p39$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-proshivok-dlya-asikov-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 40, 'paragraph',
       $p40${"text":"К сожалению, сам сайт не переведен на русский язык, что усложняет работу для пользователей. Ценовая политика также сложна и непонятна: в некоторых случаях использование прошивки не потребует оплаты комиссии, но есть и форматы коммерческого взаимодействия с отчислениями в размере 2% от суммы извлекаемых доходов.","html":"К сожалению, сам сайт не переведен на русский язык, что усложняет работу для пользователей. Ценовая политика также сложна и непонятна: в некоторых случаях использование прошивки не потребует оплаты комиссии, но есть и форматы коммерческого взаимодействия с отчислениями в размере 2% от суммы извлекаемых доходов."}$p40$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-proshivok-dlya-asikov-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 41, 'stats',
       $p41${"rows":[{"label":"Сайт","value":"hiveon.com"},{"label":"Год регистрации домена","value":"2012"},{"label":"Поддерживаемые асики","value":"Antminer L3, L7, S9, S17, S19"},{"label":"Заявленное увеличение доходности","value":"до 30%"},{"label":"Стоимость","value":"от 0 до 2% от хэша"}]}$p41$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-proshivok-dlya-asikov-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 42, 'pros_cons',
       $p42${"pros":["Знакомые многим прошивки от проекта с богатой историей;","У разработчиков есть свой пул для майнинга;","Удобный калькулятор на сайте, отражающий реальную выгоду для каждого устройства;","Работа с основными моделями Antminer от Bitmain;","Сохранение заводской гарантии устройств при работе в формате ASIC Hub;","Удобное управление большими фермами;","Специальные условия для масштабных ферм и майнинг-отелей."],"cons":["Полное отсутствие русификации;","Техподдержка только на английском языке;","Сложная и запутанная ценовая политика."]}$p42$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-proshivok-dlya-asikov-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 43, 'heading',
       $p43${"level":2,"text":"2 место: Vnish"}$p43$::jsonb,
       'vnish'
FROM articles a WHERE a.slug = 'rejting-proshivok-dlya-asikov-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 44, 'paragraph',
       $p44${"text":"Пожалуй, самая известная кастомная прошивка для асиков принадлежит команде Vnish – это наиболее популярный софт по увеличению производительности оборудования, даунвольтинга и оптимизации работы фермы. Разработчики обещают повышение доходности оборудования до 50% – выгода зависит от используемого устройства и стоимости электричества. Vnish работает с оборудованием от Bitmain (Antminer 9-й, 17-й, 19-й серий, а также L3) и Innosilicon (только T2Tz). Прошивки для Whatsminer от MicroBT уже долгое время находятся в разработке (хотя анонсированы на сайте).","html":"Пожалуй, самая известная кастомная прошивка для асиков принадлежит команде Vnish – это наиболее популярный софт по увеличению производительности оборудования, даунвольтинга и оптимизации работы фермы. Разработчики обещают повышение доходности оборудования до 50% – выгода зависит от используемого устройства и стоимости электричества. Vnish работает с оборудованием от Bitmain (Antminer 9-й, 17-й, 19-й серий, а также L3) и Innosilicon (только T2Tz). Прошивки для Whatsminer от MicroBT уже долгое время находятся в разработке (хотя анонсированы на сайте)."}$p44$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-proshivok-dlya-asikov-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 45, 'image',
       $p45${"src":"/images/articles/asic-firmware-top6/vnish.png","alt":"ASIC Firmware from VNISH Developers"}$p45$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-proshivok-dlya-asikov-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 46, 'paragraph',
       $p46${"text":"Прошивки от Vnish предлагают множество преимуществ использования – заявлен богатый функционал, который в значительной степени оптимизирует подход к майнерской деятельности. Здесь есть множество опций и инструментов, начиная от антивируса и заканчивая снижением уровня шума вентиляторов. Сайт качественно переведен на русский язык, но поддержка доступна только на английском.","html":"Прошивки от Vnish предлагают множество преимуществ использования – заявлен богатый функционал, который в значительной степени оптимизирует подход к майнерской деятельности. Здесь есть множество опций и инструментов, начиная от антивируса и заканчивая снижением уровня шума вентиляторов. Сайт качественно переведен на русский язык, но поддержка доступна только на английском."}$p46$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-proshivok-dlya-asikov-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 47, 'paragraph',
       $p47${"text":"Принято считать, что прошивка Vnish бесплатна, но на практике это не так. Дело в том, что часть дохода автоматически отправляется на кошельки разработчика – о суммах комиссионных платежей не сообщается. Но пользователи данного софта положительно отзываются об эффективности ПО, отмечая реально растущую доходность. Поэтому дискуссий о комиссионных не возникает – всех участников процесса данный формат устраивает.","html":"Принято считать, что прошивка Vnish бесплатна, но на практике это не так. Дело в том, что часть дохода автоматически отправляется на кошельки разработчика – о суммах комиссионных платежей не сообщается. Но пользователи данного софта положительно отзываются об эффективности ПО, отмечая реально растущую доходность. Поэтому дискуссий о комиссионных не возникает – всех участников процесса данный формат устраивает."}$p47$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-proshivok-dlya-asikov-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 48, 'stats',
       $p48${"rows":[{"label":"Сайт","value":"vnish.com"},{"label":"Год регистрации домена","value":"2009"},{"label":"Поддерживаемые асики","value":"Antminer L3, S9, S17, S19 и Innosilicon T2Tz"},{"label":"Заявленное увеличение доходности","value":"до 50%"},{"label":"Стоимость","value":"неизвестна"}]}$p48$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-proshivok-dlya-asikov-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 49, 'pros_cons',
       $p49${"pros":["Одна из старейших и наиболее известных разработок в области кастомных прошивок для асиков;","Комплексный подход к оптимизации: повышение хэшрейта, даунвольтинг, антивирус, автотюн, поиск по ферме, умные вентиляторы, режим сна, несколько профилей и т.д.;","Простая и быстрая установка;","Большой объем пользовательской информации в Сети об использовании прошивок и настройке;","Наличие прошивки для Innosilicon."],"cons":["Техподдержка только на английском;","Отсутствует ПО для Whatsminer."]}$p49$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-proshivok-dlya-asikov-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 50, 'heading',
       $p50${"level":2,"text":"1 место: PitBit"}$p50$::jsonb,
       'pitbit'
FROM articles a WHERE a.slug = 'rejting-proshivok-dlya-asikov-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 51, 'paragraph',
       $p51${"text":"PitBit Firmware – это инновационный лидер в мире прошивок! Их кастомная прошивка для популярных моделей майнеров, разработанная с акцентом на экономию электроэнергии и дистанционное управление. Решение предназначено для владельцев оборудования, стремящихся повысить эффективность майнинга и снизить эксплуатационные издержки.","html":"PitBit Firmware – это инновационный лидер в мире прошивок! Их кастомная прошивка для популярных моделей майнеров, разработанная с акцентом на экономию электроэнергии и дистанционное управление. Решение предназначено для владельцев оборудования, стремящихся повысить эффективность майнинга и снизить эксплуатационные издержки."}$p51$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-proshivok-dlya-asikov-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 52, 'image',
       $p52${"src":"/images/articles/asic-firmware-top6/pitbit-boxes.png","alt":"PitBit Online — ПО для майнинг-оборудования"}$p52$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-proshivok-dlya-asikov-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 53, 'paragraph',
       $p53${"text":"Компания предлагает два формата использования: прошивка с DEVFEE 2.75% – вариант для тестирования или установки на менее производительные устройства (до 100 Th/s); единоразовая лицензия – для стабильной работы без комиссии, предполагает окупаемость в среднем за 2–5 месяцев.","html":"Компания предлагает два формата использования: прошивка с DEVFEE 2.75% – вариант для тестирования или установки на менее производительные устройства (до 100 Th/s); единоразовая лицензия – для стабильной работы без комиссии, предполагает окупаемость в среднем за 2–5 месяцев."}$p53$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-proshivok-dlya-asikov-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 54, 'paragraph',
       $p54${"text":"PitBit Firmware – это удаленное управление (контроль и настройка через систему PITBIT Online), почиповая настройка (индивидуальная регулировка параметров на уровне чипов), интеллектуальный режим (автоматическая адаптация под внешние условия – температура, нагрузка), снижение потребления (поддержка undervolting – снижение энергозатрат до 20–30%), поддержка водяного охлаждения (работает с линейками ASIC с гидроохлаждением, например, S19 XP Hyd).","html":"PitBit Firmware – это удаленное управление (контроль и настройка через систему PITBIT Online), почиповая настройка (индивидуальная регулировка параметров на уровне чипов), интеллектуальный режим (автоматическая адаптация под внешние условия – температура, нагрузка), снижение потребления (поддержка undervolting – снижение энергозатрат до 20–30%), поддержка водяного охлаждения (работает с линейками ASIC с гидроохлаждением, например, S19 XP Hyd)."}$p54$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-proshivok-dlya-asikov-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 55, 'stats',
       $p55${"rows":[{"label":"Сайт","value":"pitbitecosystem.com/firmware/"},{"label":"Год регистрации домена","value":"2025"},{"label":"Поддерживаемые асики","value":"Antminer S19 Hyd, S21, S21 Imm, S21 Hyd, T21, L9, L7, D7"},{"label":"Заявленное увеличение доходности","value":"в зависимости от модели"},{"label":"Стоимость","value":"от 105 USDT"}]}$p55$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-proshivok-dlya-asikov-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 56, 'pros_cons',
       $p56${"pros":["Встроенная система мониторинга и управления PITBIT Online доступна каждому пользователю;","Есть поддержка как новых моделей Bitmain, так и менее распространенных решений (например, L7 и L9);","Регулярно обновляются прошивки под новые устройства (в т.ч. S21 Pro и S21+)."],"cons":["Информация о стоимости некоторых лицензий доступна только по запросу;","Нет поддержки старых моделей (например, S9, T17)."]}$p56$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-proshivok-dlya-asikov-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 57, 'image',
       $p57${"src":"/images/articles/asic-firmware-top6/pitbit-ecosystem.png","alt":"PitBit — Your Mining Ecosystem"}$p57$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-proshivok-dlya-asikov-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 58, 'heading',
       $p58${"level":2,"text":"Выводы"}$p58$::jsonb,
       'vyvody'
FROM articles a WHERE a.slug = 'rejting-proshivok-dlya-asikov-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 59, 'paragraph',
       $p59${"text":"Сторонние прошивки – это мощный инструмент для тех, кто хочет максимизировать доходность майнинга и адаптировать работу устройств под свои условия. Они открывают доступ к функциям, которых нет в заводском ПО, и позволяют тонко настраивать поведение асика.","html":"Сторонние прошивки – это мощный инструмент для тех, кто хочет максимизировать доходность майнинга и адаптировать работу устройств под свои условия. Они открывают доступ к функциям, которых нет в заводском ПО, и позволяют тонко настраивать поведение асика."}$p59$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-proshivok-dlya-asikov-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 60, 'paragraph',
       $p60${"text":"Тем не менее, такие прошивки требуют внимательности: они связаны с определёнными рисками и должны использоваться только при наличии базовых технических знаний. Главный совет – использовать проверенные решения с хорошей репутацией и поддержкой.","html":"Тем не менее, такие прошивки требуют внимательности: они связаны с определёнными рисками и должны использоваться только при наличии базовых технических знаний. Главный совет – использовать проверенные решения с хорошей репутацией и поддержкой."}$p60$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-proshivok-dlya-asikov-top-5';

-- =====================================================================
-- 040_article_crypto_exchangers.sql
-- =====================================================================

-- Рейтинг криптообменников: ТОП-8

INSERT INTO articles (
    slug, title, title_subtitle, excerpt, content, topic_id,
    reading_time_min, reading_minutes, published_at, view_count,
    display_type, sort_order, is_published, uses_blocks,
    image_url, image_alt
) VALUES (
    'rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu',
    'Рейтинг криптообменников',
    'ТОП-8 лучших обменников криптовалют в 2026 году',
    $excerpt$ТОП-8 обменников криптовалют: 60cek, Prostocash, Baksman, 24paybank и другие — комиссии, резервы и особенности для РФ.$excerpt$,
    $content$Введение

Обменники позволяют быстро купить или продать криптовалюту без биржи.

Выводы

Работайте с проверенными сервисами с мониторингов и учитывайте банковские риски.$content$,
    'mining',
    15,
    15,
    '2023-10-19',
    747,
    'list',
    10,
    TRUE,
    TRUE,
    '/images/articles/crypto-exchangers-top8/60cek.png',
    '60cek'
)
ON CONFLICT (slug) DO UPDATE SET
    title = EXCLUDED.title,
    title_subtitle = EXCLUDED.title_subtitle,
    excerpt = EXCLUDED.excerpt,
    content = EXCLUDED.content,
    reading_time_min = EXCLUDED.reading_time_min,
    reading_minutes = EXCLUDED.reading_minutes,
    published_at = EXCLUDED.published_at,
    view_count = EXCLUDED.view_count,
    uses_blocks = TRUE,
    image_url = EXCLUDED.image_url,
    image_alt = EXCLUDED.image_alt,
    is_published = TRUE;

DELETE FROM article_blocks
WHERE article_id = (SELECT id FROM articles WHERE slug = 'rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu');

UPDATE rating_items
SET href = '/articles/rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu',
    label = 'ТОП-8 лучших обменников криптовалют в 2026 году'
WHERE href LIKE '%rejting-kriptoobmennikov%'
   OR label ILIKE '%обменников криптовалют%';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 1, 'heading',
       $p1${"level":2,"text":"Введение"}$p1$::jsonb,
       'vvedenie'
FROM articles a WHERE a.slug = 'rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 2, 'paragraph',
       $p2${"text":"С развитием криптовалютного рынка у пользователей возникла потребность в удобных способах быстрого обмена цифровых активов на фиатные деньги и обратно. Именно для этой цели появились обменники криптовалют – сервисы, позволяющие приобрести или продать криптовалюту без регистрации на бирже и лишних сложностей. Особенно они актуальны для пользователей в странах СНГ, где работа с криптой часто связана с юридическими и банковскими ограничениями.","html":"С развитием криптовалютного рынка у пользователей возникла потребность в удобных способах быстрого обмена цифровых активов на фиатные деньги и обратно. Именно для этой цели появились обменники криптовалют – сервисы, позволяющие приобрести или продать криптовалюту без регистрации на бирже и лишних сложностей. Особенно они актуальны для пользователей в странах СНГ, где работа с криптой часто связана с юридическими и банковскими ограничениями."}$p2$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 3, 'image',
       $p3${"src":"/images/articles/crypto-exchangers-top8/trader-hero.png","alt":"Работа с криптовалютой и обменниками"}$p3$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 4, 'paragraph',
       $p4${"text":"В этой статье рассмотрим, что собой представляют обменники, чем они отличаются от бирж, какие у них преимущества и недостатки, какие риски существуют, особенно в РФ, и как правильно выбрать надежный обменный сервис.","html":"В этой статье рассмотрим, что собой представляют обменники, чем они отличаются от бирж, какие у них преимущества и недостатки, какие риски существуют, особенно в РФ, и как правильно выбрать надежный обменный сервис."}$p4$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 5, 'heading',
       $p5${"level":2,"text":"Что такое обменник криптовалют и зачем он нужен?"}$p5$::jsonb,
       'chto-takoe-obmennik'
FROM articles a WHERE a.slug = 'rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 6, 'paragraph',
       $p6${"text":"Криптообменник – это онлайн-платформа или сервис, через который пользователи могут обменивать фиатные средства (рубли, доллары и др.) на криптовалюту (BTC, ETH, USDT и т.д.) и наоборот. В отличие от криптобиржи, обменник работает по фиксированному курсу – пользователь сразу видит сумму, которую получит на выходе.","html":"Криптообменник – это онлайн-платформа или сервис, через который пользователи могут обменивать фиатные средства (рубли, доллары и др.) на криптовалюту (BTC, ETH, USDT и т.д.) и наоборот. В отличие от криптобиржи, обменник работает по фиксированному курсу – пользователь сразу видит сумму, которую получит на выходе."}$p6$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 7, 'image',
       $p7${"src":"/images/articles/crypto-exchangers-top8/crypto-coins.png","alt":"Криптовалюты для обмена"}$p7$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 8, 'paragraph',
       $p8${"text":"Основные функции обменников:","html":"Основные функции обменников:"}$p8$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 9, 'list',
       $p9${"ordered":false,"items":["Покупка криптовалюты за фиатные деньги;","Продажа криптовалюты с выводом на карту, кошелек или счет;","Обмен одной криптовалюты на другую;","Работа с различными платежными системами: банковские карты (МИР, Visa, MasterCard), QIWI, ЮMoney, Tinkoff, Сбербанк, Payeer, Advcash и др.;","Поддержка популярных криптовалют: BTC, ETH, LTC, TRX, USDT (TRC20/ERC20), BNB и многих других."]}$p9$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 10, 'heading',
       $p10${"level":2,"text":"Преимущества и недостатки обменников"}$p10$::jsonb,
       'preimushchestva-i-nedostatki'
FROM articles a WHERE a.slug = 'rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 11, 'paragraph',
       $p11${"text":"Преимущества:","html":"Преимущества:"}$p11$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 12, 'rich_list',
       $p12${"ordered":false,"items":[{"title":"Быстрота","text":"В большинстве случаев операция занимает от 5 до 30 минут;"},{"title":"Простота использования","text":"Не требуется регистрация, верификация или торговые навыки;"},{"title":"Поддержка российских карт","text":"Работа с картами и кошельками РФ особенно важна в условиях ограничений;"},{"title":"Фиксированный курс","text":"На момент заявки пользователь точно знает, сколько получит;"},{"title":"Доступность небольших сумм","text":"Можно работать с минимальными объемами (от 1 000–2 000 руб.)."}]}$p12$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 13, 'paragraph',
       $p13${"text":"Недостатки:","html":"Недостатки:"}$p13$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 14, 'rich_list',
       $p14${"ordered":false,"items":[{"title":"Курс выше биржевого","text":"Разница составляет от 1% до 5%, особенно на популярных направлениях;"},{"title":"Лимиты","text":"У некоторых обменников ограниченный суточный объем обмена;"},{"title":"Ручная обработка","text":"В ручном режиме возможны задержки;"},{"title":"Блокировки карт","text":"Вероятность блокировки карт и переводов – особенно актуально для РФ;"},{"title":"Верификация","text":"Может потребоваться верификация личности и/или карты."}]}$p14$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 15, 'heading',
       $p15${"level":2,"text":"Риски при использовании обменников"}$p15$::jsonb,
       'riski'
FROM articles a WHERE a.slug = 'rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 16, 'paragraph',
       $p16${"text":"Особенно внимательно к обмену криптовалют следует относиться пользователям из России. Несмотря на то, что законодательный запрет на владение криптовалютами отсутствует, банки и финмониторинг внимательно следят за переводами, особенно если они регулярные или крупные.","html":"Особенно внимательно к обмену криптовалют следует относиться пользователям из России. Несмотря на то, что законодательный запрет на владение криптовалютами отсутствует, банки и финмониторинг внимательно следят за переводами, особенно если они регулярные или крупные."}$p16$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 17, 'paragraph',
       $p17${"text":"Основные риски:","html":"Основные риски:"}$p17$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 18, 'list',
       $p18${"ordered":false,"items":["Блокировка банковской карты. Банки могут заморозить перевод, а саму карту – заблокировать до выяснения источника поступлений;","Заморозка счета с требованием объяснить происхождение средств;","Отклонение перевода – особенно при использовании P2P-сервисов без пояснений в назначении платежа;","Работа с мошенниками – при использовании непроверенных обменников можно потерять все средства."]}$p18$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 19, 'paragraph',
       $p19${"text":"Совет: избегайте упоминания слов «крипта», «биткоин», «обмен» в назначении платежа. Используйте нейтральные формулировки или оставляйте поле пустым, если это возможно.","html":"Совет: избегайте упоминания слов «крипта», «биткоин», «обмен» в назначении платежа. Используйте нейтральные формулировки или оставляйте поле пустым, если это возможно."}$p19$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 20, 'heading',
       $p20${"level":2,"text":"Как выбрать обменник?"}$p20$::jsonb,
       'kak-vybrat'
FROM articles a WHERE a.slug = 'rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 21, 'paragraph',
       $p21${"text":"Для принятия решения о выборе того или иного обменного сервиса рекомендуется оценить следующие факторы:","html":"Для принятия решения о выборе того или иного обменного сервиса рекомендуется оценить следующие факторы:"}$p21$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 22, 'rich_list',
       $p22${"ordered":false,"items":[{"title":"Репутация и возраст проекта","text":"Обратите внимание на дату регистрации. Используйте мониторинги BestChange, KursExpert, OkChanger. Читайте отзывы на форумах, в соцсетях, Trustpilot и т.д.;"},{"title":"Прозрачные условия","text":"Ясно указанный курс, комиссии, лимиты и сроки обмена, информация о возврате средств и службе поддержки;"},{"title":"Популярные направления","text":"BTC, USDT (TRC20/ERC20), ETH, карты российских банков, QIWI, ЮMoney;"},{"title":"Безопасность сайта","text":"HTTPS, отсутствие подозрительной рекламы, 2FA, подтверждение транзакций по email и др.;"},{"title":"Техническая поддержка","text":"Онлайн-чат или быстрые каналы (Telegram, e-mail). Желательна круглосуточная работа;"},{"title":"Режим работы","text":"Автоматический формат быстрее и надежнее, ручной может быть дешевле, но чаще связан с задержками."}]}$p22$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 23, 'heading',
       $p23${"level":2,"text":"Особенности работы с обменниками в РФ и СНГ"}$p23$::jsonb,
       'osobennosti-rf-sng'
FROM articles a WHERE a.slug = 'rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 24, 'paragraph',
       $p24${"text":"В России банки пристально следят за входящими/исходящими переводами. Лучше работать с проверенными обменниками, которые давно функционируют и адаптированы под требования банковской системы.","html":"В России банки пристально следят за входящими/исходящими переводами. Лучше работать с проверенными обменниками, которые давно функционируют и адаптированы под требования банковской системы."}$p24$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 25, 'paragraph',
       $p25${"text":"В других странах СНГ также есть свои нюансы: поддержка местных карт, регулирование P2P, работа с международными биржами.","html":"В других странах СНГ также есть свои нюансы: поддержка местных карт, регулирование P2P, работа с международными биржами."}$p25$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 26, 'paragraph',
       $p26${"text":"Некоторые обменники специально создаются для клиентов из СНГ – с поддержкой местных языков, удобной навигацией, оперативной поддержкой.","html":"Некоторые обменники специально создаются для клиентов из СНГ – с поддержкой местных языков, удобной навигацией, оперативной поддержкой."}$p26$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 27, 'heading',
       $p27${"level":2,"text":"8 место: 365cash.co"}$p27$::jsonb,
       '365cash'
FROM articles a WHERE a.slug = 'rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 28, 'paragraph',
       $p28${"text":"В этом обменнике нет рекордного количества валютных пар, однако сервис ценят прежде всего за простоту работы и быстрые переводы в подавляющем большинстве случаев. Трастовость площадки также не подвергается сомнениям: инструмент начал работу в 2015 году, с тех пор не было зафиксировано громких скандалов, связанных с проектом 365cash. Здесь нет обязательной верификации личности, зато обязательна проверка банковской карты для совершения транзакций.","html":"В этом обменнике нет рекордного количества валютных пар, однако сервис ценят прежде всего за простоту работы и быстрые переводы в подавляющем большинстве случаев. Трастовость площадки также не подвергается сомнениям: инструмент начал работу в 2015 году, с тех пор не было зафиксировано громких скандалов, связанных с проектом 365cash. Здесь нет обязательной верификации личности, зато обязательна проверка банковской карты для совершения транзакций."}$p28$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 29, 'image',
       $p29${"src":"/images/articles/crypto-exchangers-top8/365cash.png","alt":"365Cash — обменник криптовалют"}$p29$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 30, 'paragraph',
       $p30${"text":"Работа российских пользователей возможна, но временами встречаются случаи долгих переводов (до 5 дней на банки РФ). Сам же интерфейс качественно переведен на русский язык, есть круглосуточная поддержка, которая помогает решать проблемы с транзакциями. В некоторых случаях процедура усложняется, так как работа обменника ведется в полуавтоматическом режиме.","html":"Работа российских пользователей возможна, но временами встречаются случаи долгих переводов (до 5 дней на банки РФ). Сам же интерфейс качественно переведен на русский язык, есть круглосуточная поддержка, которая помогает решать проблемы с транзакциями. В некоторых случаях процедура усложняется, так как работа обменника ведется в полуавтоматическом режиме."}$p30$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 31, 'stats',
       $p31${"rows":[{"label":"Год запуска проекта","value":"2015"},{"label":"Адрес сайта","value":"365cash.co"},{"label":"Год регистрации домена","value":"2015"},{"label":"Страна регистрации","value":"Германия"},{"label":"Комиссии","value":"от 0,5% до 1,5%"},{"label":"Резервы","value":"опубликованы"},{"label":"Число доступных к обмену криптовалют","value":"более 15"},{"label":"Количество поддерживаемых банковских карт в РФ","value":"более 10"}]}$p31$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 32, 'pros_cons',
       $p32${"pros":["Старый и проверенный обменник;","Быстрые переводы в большинстве случаев;","Беспрепятственная работа в РФ;","Отсутствует обязательная верификация пользователей."],"cons":["Долгое зачисление некоторых переводов на карты РФ – до 5 дней;","Полуавтоматическая обработка ряда транзакций;","Обязательная верификация банковской карты;","Небольшое количество обменных пар;","Дизайн сайта, не вызывающий высокой степени доверия."]}$p32$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 33, 'heading',
       $p33${"level":2,"text":"7 место: Sova"}$p33$::jsonb,
       'sova'
FROM articles a WHERE a.slug = 'rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 34, 'paragraph',
       $p34${"text":"Главная особенность обменника Sova – это возможность совершения транзакций с участием наличных средств в физических офисах компании. Такие отделения есть в Москве, Санкт-Петербурге, Новосибирске, Краснодаре, Стамбуле, Анталии, Ереване, Тбилиси, Бишкеке и Дубае. В то же время на сайте сервиса отсутствует какая-либо информация об основателях и юридическом лице, что делает процедуру обмена с наличными несколько рискованной. Тем не менее, такая услуга заявлена, что нечасто предлагают конкурирующие обменники.","html":"Главная особенность обменника Sova – это возможность совершения транзакций с участием наличных средств в физических офисах компании. Такие отделения есть в Москве, Санкт-Петербурге, Новосибирске, Краснодаре, Стамбуле, Анталии, Ереване, Тбилиси, Бишкеке и Дубае. В то же время на сайте сервиса отсутствует какая-либо информация об основателях и юридическом лице, что делает процедуру обмена с наличными несколько рискованной. Тем не менее, такая услуга заявлена, что нечасто предлагают конкурирующие обменники."}$p34$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 35, 'image',
       $p35${"src":"/images/articles/crypto-exchangers-top8/sova.png","alt":"Sova — обменник криптовалют"}$p35$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 36, 'paragraph',
       $p36${"text":"Сервис работает со всеми популярными монетами, платежными системами и картами российских банков. Интерфейсы сайта качественно переведены на русский язык, есть круглосуточная поддержка. Время транзакции стандартное, однако при участии банковских карт РФ могут быть задержки – об этом сервис предупреждает заранее.","html":"Сервис работает со всеми популярными монетами, платежными системами и картами российских банков. Интерфейсы сайта качественно переведены на русский язык, есть круглосуточная поддержка. Время транзакции стандартное, однако при участии банковских карт РФ могут быть задержки – об этом сервис предупреждает заранее."}$p36$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 37, 'stats',
       $p37${"rows":[{"label":"Год запуска проекта","value":"2020"},{"label":"Адрес сайта","value":"sova.gg"},{"label":"Год регистрации домена","value":"2020"},{"label":"Страна регистрации","value":"Сербия"},{"label":"Комиссии","value":"точной информации на сайте нет"},{"label":"Резервы","value":"опубликованы"},{"label":"Число доступных к обмену криптовалют","value":"более 20"},{"label":"Количество поддерживаемых банковских карт в РФ","value":"более 15"}]}$p37$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 38, 'pros_cons',
       $p38${"pros":["Возможность совершения операций с наличными в городах присутствия;","Наличие популярных монет и платежных систем;","Качественный и удобный сайт;","Русскоязычная поддержка 24/7;","Удобный индикатор загруженности сети Bitcoin на сайте;","Опубликована информация о резервах."],"cons":["Относительно молодой обменник;","Отсутствует юридическая информация;","Противоречивые данные о необходимости верификации карты."]}$p38$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 39, 'heading',
       $p39${"level":2,"text":"6 место: Ferma"}$p39$::jsonb,
       'ferma'
FROM articles a WHERE a.slug = 'rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 40, 'paragraph',
       $p40${"text":"Один из максимально простых и интуитивно понятных обменников, освоить который в считанные минуты сможет даже начинающий криптоинвестор. Легкость интерфейсов – одно из ключевых преимуществ проекта, в то время как некоторые другие важные условия могут оказаться неподходящими для более опытных пользователей. Например, частые задержки при совершении транзакции: несмотря на то, что Ferma заявляет максимально сжатые временные промежутки, некоторые обмены могут подтверждаться дольше часа. Также есть жалобы на высокие комиссии.","html":"Один из максимально простых и интуитивно понятных обменников, освоить который в считанные минуты сможет даже начинающий криптоинвестор. Легкость интерфейсов – одно из ключевых преимуществ проекта, в то время как некоторые другие важные условия могут оказаться неподходящими для более опытных пользователей. Например, частые задержки при совершении транзакции: несмотря на то, что Ferma заявляет максимально сжатые временные промежутки, некоторые обмены могут подтверждаться дольше часа. Также есть жалобы на высокие комиссии."}$p40$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 41, 'image',
       $p41${"src":"/images/articles/crypto-exchangers-top8/ferma.png","alt":"Ferma — обменник криптовалют"}$p41$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 42, 'paragraph',
       $p42${"text":"Количества обменных пар и платежных сервисов более чем достаточно для комфортной работы – обменник предлагает убедительное разнообразие. Объемы резервов опубликованы на сайте, как и подробные инструкции по работе с инструментом. Обязательная верификация личности отсутствует, но использовать проверку карты придется. В целом отзывы о площадке положительные: с самого начала работы в 2017 году не было зафиксировано громких скандалов и негатива.","html":"Количества обменных пар и платежных сервисов более чем достаточно для комфортной работы – обменник предлагает убедительное разнообразие. Объемы резервов опубликованы на сайте, как и подробные инструкции по работе с инструментом. Обязательная верификация личности отсутствует, но использовать проверку карты придется. В целом отзывы о площадке положительные: с самого начала работы в 2017 году не было зафиксировано громких скандалов и негатива."}$p42$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 43, 'stats',
       $p43${"rows":[{"label":"Год запуска проекта","value":"2017"},{"label":"Адрес сайта","value":"ferma.cc"},{"label":"Год регистрации домена","value":"2017"},{"label":"Страна регистрации","value":"Нидерланды"},{"label":"Комиссии","value":"точной информации на сайте нет"},{"label":"Резервы","value":"опубликованы"},{"label":"Число доступных к обмену криптовалют","value":"более 40"},{"label":"Количество поддерживаемых банковских карт в РФ","value":"более 15"}]}$p43$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 44, 'pros_cons',
       $p44${"pros":["Честная и качественная работа с 2017 года;","Большое количество доступных для обмена монет;","Качественный перевод сайта на русский язык;","Русскоязычная техподдержка 24/7;","Нет обязательной верификации личности."],"cons":["Высокие комиссии;","Минимальный порог обмена – от 5 000 рублей;","Частые задержки при обработке транзакций;","Всего два языка интерфейса."]}$p44$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 45, 'heading',
       $p45${"level":2,"text":"5 место: Kassa"}$p45$::jsonb,
       'kassa'
FROM articles a WHERE a.slug = 'rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 46, 'paragraph',
       $p46${"text":"Предельно простой сервис по обмену криптоактивов: инструмент работает с 2016 года и пользуется популярностью у владельцев цифровых активов. Пользователи отмечают элементарную логику обмена: быстро разобраться с интерфейсами способен даже новичок, совершающий подобные транзакции впервые. Скорость обработки заявок также неплохая: Kassa совершает обмен в рамках разумных временных промежутков, практически не отличаясь от ключевых конкурентов.","html":"Предельно простой сервис по обмену криптоактивов: инструмент работает с 2016 года и пользуется популярностью у владельцев цифровых активов. Пользователи отмечают элементарную логику обмена: быстро разобраться с интерфейсами способен даже новичок, совершающий подобные транзакции впервые. Скорость обработки заявок также неплохая: Kassa совершает обмен в рамках разумных временных промежутков, практически не отличаясь от ключевых конкурентов."}$p46$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 47, 'image',
       $p47${"src":"/images/articles/crypto-exchangers-top8/kassa.png","alt":"Kassa.cc — обменник криптовалют"}$p47$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 48, 'paragraph',
       $p48${"text":"Здесь нет десятков разнообразных монет, платежных систем и партнерских банков: сервис предлагает базовый функционал, которого достаточно в большинстве случаев. Если вам требуется обмен не самых популярных валютных пар, придется искать альтернативу. Но если вы ищете простой и понятный инструмент с хорошей репутацией, Kassa стоит вашего внимания.","html":"Здесь нет десятков разнообразных монет, платежных систем и партнерских банков: сервис предлагает базовый функционал, которого достаточно в большинстве случаев. Если вам требуется обмен не самых популярных валютных пар, придется искать альтернативу. Но если вы ищете простой и понятный инструмент с хорошей репутацией, Kassa стоит вашего внимания."}$p48$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 49, 'stats',
       $p49${"rows":[{"label":"Год запуска проекта","value":"2016"},{"label":"Адрес сайта","value":"kassa.cc"},{"label":"Год регистрации домена","value":"2016"},{"label":"Страна регистрации","value":"Грузия"},{"label":"Комиссии","value":"от 0,5% до 1,99%"},{"label":"Резервы","value":"не опубликованы"},{"label":"Число доступных к обмену криптовалют","value":"более 15"},{"label":"Количество поддерживаемых банковских карт в РФ","value":"более 5"}]}$p49$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 50, 'pros_cons',
       $p50${"pros":["Успешная работа с 2016 года;","Простой, легкий и интуитивно понятный интерфейс;","Нет обязательной верификации;","Работа с картами российских банков;","Качественный перевод сайта на русский язык;","Наличие информационного центра с актуальными новостями из мира криптовалют;","Выгодная партнерская программа."],"cons":["Нет информации о резервах;","Всего 3 языка интерфейсов;","Возможны задержки при работе с картами российских банков;","Обязательна верификация карты;","Поддержка отвечает на вопросы лишь в рабочее время;","Небольшое число поддерживаемых монет и карт."]}$p50$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 51, 'heading',
       $p51${"level":2,"text":"4 место: 24paybank"}$p51$::jsonb,
       '24paybank'
FROM articles a WHERE a.slug = 'rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 52, 'paragraph',
       $p52${"text":"Старый и проверенный обменник, который активно применяется пользователями из РФ. Сервис предлагает большой набор обменных пар, неплохую скорость обработки транзакций, а также приемлемый уровень комиссий. Сайт полностью переведен на русский язык, есть качественная поддержка и реферальная система. Резервы полностью публичны и представлены на отдельной странице.","html":"Старый и проверенный обменник, который активно применяется пользователями из РФ. Сервис предлагает большой набор обменных пар, неплохую скорость обработки транзакций, а также приемлемый уровень комиссий. Сайт полностью переведен на русский язык, есть качественная поддержка и реферальная система. Резервы полностью публичны и представлены на отдельной странице."}$p52$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 53, 'image',
       $p53${"src":"/images/articles/crypto-exchangers-top8/24paybank.png","alt":"24PAYBANK — мультивалютный обменный сервис"}$p53$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 54, 'paragraph',
       $p54${"text":"Еще одно преимущество проекта – возможность совершения транзакций через бота в Telegram. Верификация личности рекомендована, но необязательна, а без подтверждения карты невозможна работа с платежными системами российских банков. Это достаточно популярный обменник без каких-либо явных особенностей и существенных недостатков.","html":"Еще одно преимущество проекта – возможность совершения транзакций через бота в Telegram. Верификация личности рекомендована, но необязательна, а без подтверждения карты невозможна работа с платежными системами российских банков. Это достаточно популярный обменник без каких-либо явных особенностей и существенных недостатков."}$p54$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 55, 'stats',
       $p55${"rows":[{"label":"Год запуска проекта","value":"2015"},{"label":"Адрес сайта","value":"24paybank.net"},{"label":"Год регистрации домена","value":"2015"},{"label":"Страна регистрации","value":"Грузия"},{"label":"Комиссии","value":"от 0,5% до 1%"},{"label":"Резервы","value":"опубликованы"},{"label":"Число доступных к обмену криптовалют","value":"более 30"},{"label":"Количество поддерживаемых банковских карт в РФ","value":"более 15"}]}$p55$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 56, 'pros_cons',
       $p56${"pros":["Большое количество поддерживаемых криптовалют и банков РФ;","Достаточно высокая скорость обмена;","Приемлемый размер комиссий;","Наличие удобного бота в Telegram;","Нет обязательной верификации личности;","Выгодная реферальная программа."],"cons":["Обязательная верификация карты."]}$p56$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 57, 'heading',
       $p57${"level":2,"text":"3 место: Baksman"}$p57$::jsonb,
       'baksman'
FROM articles a WHERE a.slug = 'rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 58, 'paragraph',
       $p58${"text":"Проверенный сервис, который работает с 2015 года. Главная отличительная черта проекта – большое количество монет, доступных для обмена. Кроме того, Baksman предлагает воспользоваться удобным ботом в Telegram, а также оценить полезную функцию выставления счетов. С ее помощью можно создать заказ на оплату и отправить ее любому контрагенту.","html":"Проверенный сервис, который работает с 2015 года. Главная отличительная черта проекта – большое количество монет, доступных для обмена. Кроме того, Baksman предлагает воспользоваться удобным ботом в Telegram, а также оценить полезную функцию выставления счетов. С ее помощью можно создать заказ на оплату и отправить ее любому контрагенту."}$p58$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 59, 'image',
       $p59${"src":"/images/articles/crypto-exchangers-top8/baksman.png","alt":"Baksman — обменник криптовалют"}$p59$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 60, 'paragraph',
       $p60${"text":"Скорость обработки транзакций высокая, объемы резервов опубликованы на отдельной странице, есть выгодная реферальная программа. Некоторые сомнения вызывает дизайн сервиса, который напоминает сайты казино – это явно не повышает степень доверия к ресурсу. Для работы с системой требуется верификация карты, в то время как прохождение KYC не является обязательным.","html":"Скорость обработки транзакций высокая, объемы резервов опубликованы на отдельной странице, есть выгодная реферальная программа. Некоторые сомнения вызывает дизайн сервиса, который напоминает сайты казино – это явно не повышает степень доверия к ресурсу. Для работы с системой требуется верификация карты, в то время как прохождение KYC не является обязательным."}$p60$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 61, 'stats',
       $p61${"rows":[{"label":"Год запуска проекта","value":"2015"},{"label":"Адрес сайта","value":"baksman.net"},{"label":"Год регистрации домена","value":"2015"},{"label":"Страна регистрации","value":"Эстония"},{"label":"Комиссии","value":"точной информации на сайте нет"},{"label":"Резервы","value":"опубликованы"},{"label":"Число доступных к обмену криптовалют","value":"более 40"},{"label":"Количество поддерживаемых банковских карт в РФ","value":"более 15"}]}$p61$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 62, 'pros_cons',
       $p62${"pros":["Старый и надежный проект, работающий с 2015 года;","Множество монет и банков для обмена;","Хорошая скорость обработки транзакций;","Есть собственный бот в Telegram;","Функция выставления счетов;","Отсутствует обязательная верификация личности;","Представлены резервы;","Мультиязычный сервис, отлично адаптированный для РФ и стран Азии."],"cons":["Обязательная верификация карты;","Нет точной информации о размере комиссий;","Своеобразный дизайн сайта."]}$p62$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 63, 'heading',
       $p63${"level":2,"text":"2 место: Prostocash"}$p63$::jsonb,
       'prostocash'
FROM articles a WHERE a.slug = 'rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 64, 'paragraph',
       $p64${"text":"Обменник, который начал свою работу в 2017 году, предлагает множество криптовалют и платежных систем, оказывая поддержку 24/7. Верификация личности необходима лишь в некоторых случаях (например, при решении спорных ситуаций или подозрений в мошенничестве), скорость обмена достаточно высокая. Сайт полностью переведен на русский (есть другие языки интерфейса), техническое сопровождение быстро и качественно реагирует на обращения.","html":"Обменник, который начал свою работу в 2017 году, предлагает множество криптовалют и платежных систем, оказывая поддержку 24/7. Верификация личности необходима лишь в некоторых случаях (например, при решении спорных ситуаций или подозрений в мошенничестве), скорость обмена достаточно высокая. Сайт полностью переведен на русский (есть другие языки интерфейса), техническое сопровождение быстро и качественно реагирует на обращения."}$p64$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 65, 'image',
       $p65${"src":"/images/articles/crypto-exchangers-top8/prostocash.png","alt":"Prostocash — обменник криптовалют"}$p65$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 66, 'paragraph',
       $p66${"text":"Резервы обменника действительно впечатляют: объемы представлены на отдельной странице и вызывают уважение. Проект предлагает выгодную партнерскую программу и возможность реферального заработка. Рассматривая недостатки, стоит отметить серьезные комиссии для перевода больших сумм. Также требуется верификация карты.","html":"Резервы обменника действительно впечатляют: объемы представлены на отдельной странице и вызывают уважение. Проект предлагает выгодную партнерскую программу и возможность реферального заработка. Рассматривая недостатки, стоит отметить серьезные комиссии для перевода больших сумм. Также требуется верификация карты."}$p66$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 67, 'stats',
       $p67${"rows":[{"label":"Год запуска проекта","value":"2017"},{"label":"Адрес сайта","value":"prostocash.com"},{"label":"Год регистрации домена","value":"2016"},{"label":"Страна регистрации","value":"Эстония"},{"label":"Комиссии","value":"от 0,1% до 0,5%"},{"label":"Резервы","value":"опубликованы"},{"label":"Число доступных к обмену криптовалют","value":"более 35"},{"label":"Количество поддерживаемых банковских карт в РФ","value":"более 15"}]}$p67$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 68, 'pros_cons',
       $p68${"pros":["Старый и проверенный обменник, работающий с 2017 года;","Множество вариантов обмена;","Достаточно быстрые транзакции;","Полный перевод интерфейсов на русский язык;","Небольшие заявленные комиссии;","Выгодная партнерская программа;","Нет ограничений работы в России;","Обязательная верификация личности отсутствует."],"cons":["Обязательная верификация карты;","Жалобы пользователей на высокие комиссии при переводе больших сумм;","Некоторые транзакции продолжительны по времени."]}$p68$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 69, 'heading',
       $p69${"level":2,"text":"1 место: 60cek"}$p69$::jsonb,
       '60cek'
FROM articles a WHERE a.slug = 'rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 70, 'paragraph',
       $p70${"text":"Один из наиболее известных и старейших обменников криптовалют, который начал свою работу в 2016 году. Сервис предлагает быстрый обмен множества токенов, работает с картами российских банков и поддерживает наиболее популярные платежные системы. Сайт качественно переведен на несколько языков, включая русский. Есть круглосуточная техническая поддержка также на русском языке. Обменник не скрывает объемы своих резервов: актуальная информация представлена на сайте и постоянно обновляется.","html":"Один из наиболее известных и старейших обменников криптовалют, который начал свою работу в 2016 году. Сервис предлагает быстрый обмен множества токенов, работает с картами российских банков и поддерживает наиболее популярные платежные системы. Сайт качественно переведен на несколько языков, включая русский. Есть круглосуточная техническая поддержка также на русском языке. Обменник не скрывает объемы своих резервов: актуальная информация представлена на сайте и постоянно обновляется."}$p70$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 71, 'image',
       $p71${"src":"/images/articles/crypto-exchangers-top8/60cek.png","alt":"60cek — обменник криптовалют"}$p71$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 72, 'paragraph',
       $p72${"text":"Достаточно высокие комиссии сервиса компенсируются множеством преимуществ, например наличием бота в Telegram, небольшим порогом минимальных сумм для обмена, бонусной программой и возможностью дополнительной защиты аккаунта. Верификация личности не является обязательным условием работы с сервисом, однако она может потребоваться при решении технических проблем или подозрений в совершении сомнительных операций. Но если личность подтверждать необязательно, то верификация карты для совершения транзакций является обязательным условием работы с сервисом «60cek».","html":"Достаточно высокие комиссии сервиса компенсируются множеством преимуществ, например наличием бота в Telegram, небольшим порогом минимальных сумм для обмена, бонусной программой и возможностью дополнительной защиты аккаунта. Верификация личности не является обязательным условием работы с сервисом, однако она может потребоваться при решении технических проблем или подозрений в совершении сомнительных операций. Но если личность подтверждать необязательно, то верификация карты для совершения транзакций является обязательным условием работы с сервисом «60cek»."}$p72$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 73, 'stats',
       $p73${"rows":[{"label":"Год запуска проекта","value":"2016"},{"label":"Адрес сайта","value":"60cek.net"},{"label":"Год регистрации домена","value":"2016"},{"label":"Страна регистрации","value":"Эстония"},{"label":"Комиссии","value":"от 0,5% до 2%"},{"label":"Резервы","value":"опубликованы"},{"label":"Число доступных к обмену криптовалют","value":"более 30"},{"label":"Количество поддерживаемых банковских карт в РФ","value":"более 15"}]}$p73$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 74, 'pros_cons',
       $p74${"pros":["Высокий уровень доверия: работа с 2016 года;","Большое количество поддерживаемых криптовалют, платежных сервисов и карт;","Небольшой минимальный порог для обмена;","Работа в России (банковские карты, язык интерфейсов, техподдержка);","Высокая скорость обмена;","Необязательная верификация личности;","Бот для обмена в Telegram;","Возможность подключить двухфакторную аутентификацию;","Множество положительных отзывов на самых разных площадках."],"cons":["Высокие комиссии;","Обязательная верификация карты;","Устаревший дизайн сайта."]}$p74$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 75, 'heading',
       $p75${"level":2,"text":"Выводы"}$p75$::jsonb,
       'vyvody'
FROM articles a WHERE a.slug = 'rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 76, 'paragraph',
       $p76${"text":"Обменники криптовалют – это важный и удобный инструмент, позволяющий быстро купить или продать цифровые активы без лишних сложностей.","html":"Обменники криптовалют – это важный и удобный инструмент, позволяющий быстро купить или продать цифровые активы без лишних сложностей."}$p76$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 77, 'paragraph',
       $p77${"text":"Особенно они полезны тем, кто:","html":"Особенно они полезны тем, кто:"}$p77$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 78, 'list',
       $p78${"ordered":false,"items":["Не хочет разбираться с биржами;","Хочет быстро обналичить криптовалюту;","Работает с небольшими суммами."]}$p78$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 79, 'paragraph',
       $p79${"text":"Однако с удобством приходит и ответственность: важно всегда проверять обменник, избегать сомнительных площадок и учитывать банковские риски. Для минимизации проблем лучше работать с обменниками, представленными на крупных мониторингах, а также следить за обновлениями законодательства в своей стране.","html":"Однако с удобством приходит и ответственность: важно всегда проверять обменник, избегать сомнительных площадок и учитывать банковские риски. Для минимизации проблем лучше работать с обменниками, представленными на крупных мониторингах, а также следить за обновлениями законодательства в своей стране."}$p79$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu';

-- =====================================================================
-- 041_article_youtube_mining_channels.sql
-- =====================================================================

-- Лучшие каналы о майнинге на YouTube: ТОП-10

INSERT INTO articles (
    slug, title, title_subtitle, excerpt, content, topic_id,
    reading_time_min, reading_minutes, published_at, view_count,
    display_type, sort_order, is_published, uses_blocks,
    image_url, image_alt
) VALUES (
    'luchshie-kanaly-o-majninge-na-youtube-top-10',
    'Лучшие каналы о майнинге на YouTube',
    'ТОП-10',
    $excerpt$ТОП-10 YouTube-каналов о майнинге: Miner World, Serega Soleniy, Заметки Майнера и другие — обзоры, статистика и критерии выбора.$excerpt$,
    $content$Введение

YouTube помогает быстрее разбираться в технических вопросах майнинга.

Выводы

Подписывайтесь на проверенные каналы и проверяйте информацию из видео.$content$,
    'mining',
    17,
    17,
    '2023-03-14',
    739,
    'list',
    12,
    TRUE,
    TRUE,
    '/images/articles/youtube-mining-channels/miner-world.png',
    'Miner World'
)
ON CONFLICT (slug) DO UPDATE SET
    title = EXCLUDED.title,
    title_subtitle = EXCLUDED.title_subtitle,
    excerpt = EXCLUDED.excerpt,
    content = EXCLUDED.content,
    reading_time_min = EXCLUDED.reading_time_min,
    reading_minutes = EXCLUDED.reading_minutes,
    published_at = EXCLUDED.published_at,
    view_count = EXCLUDED.view_count,
    uses_blocks = TRUE,
    image_url = EXCLUDED.image_url,
    image_alt = EXCLUDED.image_alt,
    is_published = TRUE;

DELETE FROM article_blocks
WHERE article_id = (SELECT id FROM articles WHERE slug = 'luchshie-kanaly-o-majninge-na-youtube-top-10');

UPDATE rating_items
SET href = '/articles/luchshie-kanaly-o-majninge-na-youtube-top-10',
    label = 'Лучшие каналы о майнинге на YouTube: ТОП-10'
WHERE href LIKE '%luchshie-kanaly-o-majninge-na-youtube%'
   OR label ILIKE '%каналы о майнинге на youtube%';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 1, 'heading',
       $p1${"level":2,"text":"Введение"}$p1$::jsonb,
       'vvedenie'
FROM articles a WHERE a.slug = 'luchshie-kanaly-o-majninge-na-youtube-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 2, 'paragraph',
       $p2${"text":"Знакомство с миром майнинга в видеоформате – наглядный способ познакомиться с добычей криптовалют. Сочетание визуального и акустического восприятия позволяет максимально качественно усвоить материал и своими глазами увидеть происходящее. Представляем рейтинг лучших русскоязычных каналов о майнинге на YouTube: ТОП-10 проектов с детальной оценкой каждого проекта.","html":"Знакомство с миром майнинга в видеоформате – наглядный способ познакомиться с добычей криптовалют. Сочетание визуального и акустического восприятия позволяет максимально качественно усвоить материал и своими глазами увидеть происходящее. Представляем рейтинг лучших русскоязычных каналов о майнинге на YouTube: ТОП-10 проектов с детальной оценкой каждого проекта."}$p2$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kanaly-o-majninge-na-youtube-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 3, 'image',
       $p3${"src":"/images/articles/youtube-mining-channels/youtube-hero.png","alt":"YouTube и майнинг"}$p3$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kanaly-o-majninge-na-youtube-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 4, 'heading',
       $p4${"level":2,"text":"Почему YouTube?"}$p4$::jsonb,
       'pochemu-youtube'
FROM articles a WHERE a.slug = 'luchshie-kanaly-o-majninge-na-youtube-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 5, 'paragraph',
       $p5${"text":"Мир майнинга криптовалют стремительно меняется – появляются новые модели ASIC-устройств, обновляются прошивки, растет конкуренция в пулах и ужесточается регулирование. В этой динамичной среде важно не только добывать монеты, но и быть в курсе всех новшеств. Именно YouTube остается одной из главных платформ, где майнеры находят актуальные знания, делятся опытом и обсуждают свежие новости.","html":"Мир майнинга криптовалют стремительно меняется – появляются новые модели ASIC-устройств, обновляются прошивки, растет конкуренция в пулах и ужесточается регулирование. В этой динамичной среде важно не только добывать монеты, но и быть в курсе всех новшеств. Именно YouTube остается одной из главных платформ, где майнеры находят актуальные знания, делятся опытом и обсуждают свежие новости."}$p5$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kanaly-o-majninge-na-youtube-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 6, 'paragraph',
       $p6${"text":"Причины такой популярности YouTube в майнинг-сообществе очевидны:","html":"Причины такой популярности YouTube в майнинг-сообществе очевидны:"}$p6$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kanaly-o-majninge-na-youtube-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 7, 'rich_list',
       $p7${"ordered":false,"items":[{"title":"Быстрый доступ к актуальной информации","text":"Каналы с техническими обзорами, новостями и инструкциями позволяют быть в тренде;"},{"title":"Наглядность","text":"Видео позволяют понять сложные технические моменты проще, чем текст;"},{"title":"Доступность","text":"YouTube можно смотреть с телефона, планшета или компьютера – в дороге, на работе или дома;"},{"title":"Комьюнити","text":"Каналы часто становятся центрами общения – обсуждения в комментариях, стримы, ответы на вопросы."}]}$p7$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kanaly-o-majninge-na-youtube-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 8, 'paragraph',
       $p8${"text":"Для новичков YouTube часто становится стартовой точкой, с которой они начинают погружаться в мир криптовалют и майнинга. А для опытных пользователей – это способ оставаться в курсе изменений и находить интересные кейсы.","html":"Для новичков YouTube часто становится стартовой точкой, с которой они начинают погружаться в мир криптовалют и майнинга. А для опытных пользователей – это способ оставаться в курсе изменений и находить интересные кейсы."}$p8$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kanaly-o-majninge-na-youtube-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 9, 'image',
       $p9${"src":"/images/articles/youtube-mining-channels/youtube-hardware.png","alt":"YouTube в центре майнинг-оборудования"}$p9$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kanaly-o-majninge-na-youtube-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 10, 'heading',
       $p10${"level":2,"text":"Чем видеоформат удобен для изучения сложных технических тем?"}$p10$::jsonb,
       'chem-udoben-videoformat'
FROM articles a WHERE a.slug = 'luchshie-kanaly-o-majninge-na-youtube-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 11, 'paragraph',
       $p11${"text":"Майнинг связан с множеством технических задач: подключение и настройка асиков, организация электропитания, выбор пулов, работа с прошивками и охлаждением. Объяснять это только в текстовом формате сложно и долго.","html":"Майнинг связан с множеством технических задач: подключение и настройка асиков, организация электропитания, выбор пулов, работа с прошивками и охлаждением. Объяснять это только в текстовом формате сложно и долго."}$p11$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kanaly-o-majninge-na-youtube-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 12, 'paragraph',
       $p12${"text":"Видео дает сразу несколько ключевых преимуществ:","html":"Видео дает сразу несколько ключевых преимуществ:"}$p12$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kanaly-o-majninge-na-youtube-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 13, 'rich_list',
       $p13${"ordered":false,"items":[{"title":"Визуальное восприятие","text":"Важно не только прочитать, как настроить майнер, но и увидеть, как это делается на практике. Это экономит часы проб и ошибок;"},{"title":"Аудиовизуальное объяснение","text":"Автор видео может комментировать действия, объясняя их смысл и возможные ошибки;"},{"title":"Сравнения в реальном времени","text":"Например, как различаются прошивки, как влияет разгон на хэшрейт и температуру;"},{"title":"Проверка «в бою»","text":"Настоящая эффективность оборудования или прошивки проявляется только в работе – и это можно наглядно увидеть на YouTube;"},{"title":"Лайфхаки и редкие кейсы","text":"Например, подключение к нестандартному источнику питания, работа в условиях высокой влажности, бюджетное охлаждение и т.п."}]}$p13$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kanaly-o-majninge-na-youtube-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 14, 'paragraph',
       $p14${"text":"Таким образом, видеоформат – это не просто способ подачи информации, а полноценный инструмент для обучения, анализа и практики.","html":"Таким образом, видеоформат – это не просто способ подачи информации, а полноценный инструмент для обучения, анализа и практики."}$p14$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kanaly-o-majninge-na-youtube-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 15, 'heading',
       $p15${"level":2,"text":"Как выбрать лучший канал о майнинге на YouTube?"}$p15$::jsonb,
       'kak-vybrat-kanal'
FROM articles a WHERE a.slug = 'luchshie-kanaly-o-majninge-na-youtube-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 16, 'paragraph',
       $p16${"text":"На платформе много контента, но не все одинаково полезно. Чтобы не тратить время впустую и не попасть на мошенников или дилетантов, нужно оценивать каналы по ряду критериев:","html":"На платформе много контента, но не все одинаково полезно. Чтобы не тратить время впустую и не попасть на мошенников или дилетантов, нужно оценивать каналы по ряду критериев:"}$p16$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kanaly-o-majninge-na-youtube-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 17, 'rich_list',
       $p17${"ordered":false,"items":[{"title":"Регулярность контента","text":"Каналы, которые публикуют ролики хотя бы раз в месяц, говорят о вовлеченности автора. Заброшенные каналы часто устаревают;"},{"title":"Практическая направленность","text":"Лучшие каналы показывают реальную работу оборудования, настраивают асики, тестируют прошивки и делятся результатами по доходности;"},{"title":"География и актуальность","text":"Важно, чтобы информация учитывала локальные реалии: электротарифы, таможенные нюансы и законы СНГ;"},{"title":"Честность и прозрачность","text":"Полезный контент – это не только успехи, но и честный рассказ о трудностях и рисках;"},{"title":"Обратная связь","text":"Комментарии, ответы на вопросы, участие в обсуждениях помогают лучше понимать материал."}]}$p17$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kanaly-o-majninge-na-youtube-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 18, 'heading',
       $p18${"level":2,"text":"На что стоит обращать внимание при просмотре YouTube-каналов о майнинге?"}$p18$::jsonb,
       'na-chto-obraschat-vnimanie'
FROM articles a WHERE a.slug = 'luchshie-kanaly-o-majninge-na-youtube-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 19, 'paragraph',
       $p19${"text":"YouTube – это не только платформа для знаний, но и пространство, где процветает реклама, а иногда – и откровенное мошенничество.","html":"YouTube – это не только платформа для знаний, но и пространство, где процветает реклама, а иногда – и откровенное мошенничество."}$p19$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kanaly-o-majninge-na-youtube-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 20, 'paragraph',
       $p20${"text":"Вот на что важно обращать внимание:","html":"Вот на что важно обращать внимание:"}$p20$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kanaly-o-majninge-na-youtube-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 21, 'rich_list',
       $p21${"ordered":false,"items":[{"title":"Рекламные вставки и скрытая реклама","text":"Если автор активно продвигает конкретный магазин, пул или облачный сервис, стоит отнестись критически;"},{"title":"Недостоверные обещания","text":"Слишком оптимистичные заголовки вроде «Заработай $500 в день с одного асика» или «Майнинг без вложений» – тревожный сигнал;"},{"title":"Финансовые схемы","text":"Если канал предлагает инвестировать деньги, перевести криптовалюту на некий кошелек или купить оборудование по «особой ссылке» – это может быть скам;"},{"title":"Мошеннические конкурсы","text":"Будьте осторожны с «розыгрышами», особенно если для участия нужно что-то перевести или оставить личные данные."}]}$p21$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kanaly-o-majninge-na-youtube-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 22, 'heading',
       $p22${"level":2,"text":"10 место: Bogdan Musk/GetAsic"}$p22$::jsonb,
       'getasic'
FROM articles a WHERE a.slug = 'luchshie-kanaly-o-majninge-na-youtube-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 23, 'paragraph',
       $p23${"text":"Авторский канал представителя известного магазина по продаже техники для майнинга – GetAsic: достаточно популярный формат, когда дистрибьютор готовит контент с целью повышения продаж оборудования. Ресурс ориентирован именно на асики, однако время от времени автор стремится разнообразить подачу информации за счет освещения смежных тем – интервью с известными лицами, обзор трендов на рынке криптовалют и т.д.","html":"Авторский канал представителя известного магазина по продаже техники для майнинга – GetAsic: достаточно популярный формат, когда дистрибьютор готовит контент с целью повышения продаж оборудования. Ресурс ориентирован именно на асики, однако время от времени автор стремится разнообразить подачу информации за счет освещения смежных тем – интервью с известными лицами, обзор трендов на рынке криптовалют и т.д."}$p23$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kanaly-o-majninge-na-youtube-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 24, 'image',
       $p24${"src":"/images/articles/youtube-mining-channels/getasic.png","alt":"GetAsic — YouTube-канал о майнинге"}$p24$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kanaly-o-majninge-na-youtube-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 25, 'paragraph',
       $p25${"text":"Некоторые ролики затрагивают крайне актуальные темы, становясь настоящей находкой для начинающих майнеров. Формат подачи интересный, монтаж качественный. Однако частота выхода новых видео оставляет желать лучшего, что следует считать главным недостатком канала. Также слабая сторона проекта (как и всех каналов от магазинов) – это заинтересованность в продвижении техники определенных марок, что является препятствием в подготовке независимого контента.","html":"Некоторые ролики затрагивают крайне актуальные темы, становясь настоящей находкой для начинающих майнеров. Формат подачи интересный, монтаж качественный. Однако частота выхода новых видео оставляет желать лучшего, что следует считать главным недостатком канала. Также слабая сторона проекта (как и всех каналов от магазинов) – это заинтересованность в продвижении техники определенных марок, что является препятствием в подготовке независимого контента."}$p25$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kanaly-o-majninge-na-youtube-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 26, 'stats',
       $p26${"rows":[{"label":"Ссылка на канал","value":"https://www.youtube.com/@getasic"},{"label":"Год создания канала","value":"2015"},{"label":"Число подписчиков","value":"18 000+"},{"label":"Количество видео","value":"более 650+"},{"label":"Средняя частота публикации видео","value":"5+ в месяц"},{"label":"Просмотров, в среднем","value":"8 800+"},{"label":"Лайков, в среднем","value":"220+"},{"label":"Комментариев, в среднем","value":"12+"}]}$p26$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kanaly-o-majninge-na-youtube-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 27, 'pros_cons',
       $p27${"pros":["Качественный и интересный формат подачи информации;","Возрастной канал;","Разнообразный контент."],"cons":["Заинтересованность представителя магазина в продвижении техники определенных брендов;","Небольшое число подписчиков;","Скромная активность комьюнити в комментариях;","Небольшая частота выхода новых видео."]}$p27$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kanaly-o-majninge-na-youtube-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 28, 'heading',
       $p28${"level":2,"text":"9 место: Ruslan PRO MINING"}$p28$::jsonb,
       'ruslan-pro-mining'
FROM articles a WHERE a.slug = 'luchshie-kanaly-o-majninge-na-youtube-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 29, 'paragraph',
       $p29${"text":"Авторский канал о майнинге на видеокартах, асиках и даже ноутбуках как в домашних условиях, так и промышленных масштабах. Любопытен формат: это именно неформальный видеоблог, который ориентирован на ценителей свободной подачи информации. Контент позволяет знакомиться с техническими особенностями добычи, а также бытовыми аспектами – такой подход не надоедает, видео воспринимаются легко и свободно. Перечень тематик роликов крайне разнообразен, от добычи Биткоина в бытовке до обзоров новых асиков.","html":"Авторский канал о майнинге на видеокартах, асиках и даже ноутбуках как в домашних условиях, так и промышленных масштабах. Любопытен формат: это именно неформальный видеоблог, который ориентирован на ценителей свободной подачи информации. Контент позволяет знакомиться с техническими особенностями добычи, а также бытовыми аспектами – такой подход не надоедает, видео воспринимаются легко и свободно. Перечень тематик роликов крайне разнообразен, от добычи Биткоина в бытовке до обзоров новых асиков."}$p29$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kanaly-o-majninge-na-youtube-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 30, 'image',
       $p30${"src":"/images/articles/youtube-mining-channels/ruslan-pro.png","alt":"Ruslan PRO mining — YouTube-канал"}$p30$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kanaly-o-majninge-na-youtube-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 31, 'paragraph',
       $p31${"text":"Автор канала занимается не только майнингом цифровых активов, но и смежными направлениями бизнеса, например продажей запчастей. Подобную концепцию профиля трудно назвать профессиональной, однако содержание контента не вызывает сомнений в мастерстве ведущего. Канал станет настоящим открытием для поклонников неформального знакомства с майнингом и порой юмористического отношения к инвестициям.","html":"Автор канала занимается не только майнингом цифровых активов, но и смежными направлениями бизнеса, например продажей запчастей. Подобную концепцию профиля трудно назвать профессиональной, однако содержание контента не вызывает сомнений в мастерстве ведущего. Канал станет настоящим открытием для поклонников неформального знакомства с майнингом и порой юмористического отношения к инвестициям."}$p31$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kanaly-o-majninge-na-youtube-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 32, 'stats',
       $p32${"rows":[{"label":"Ссылка на канал","value":"https://www.youtube.com/@Ruslanpromining/"},{"label":"Год создания канала","value":"2017"},{"label":"Число подписчиков","value":"24 000+"},{"label":"Количество видео","value":"более 225+"},{"label":"Средняя частота публикации видео","value":"5+ в месяц"},{"label":"Просмотров, в среднем","value":"23 000+"},{"label":"Лайков, в среднем","value":"330+"},{"label":"Комментариев, в среднем","value":"60+"}]}$p32$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kanaly-o-majninge-na-youtube-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 33, 'pros_cons',
       $p33${"pros":["Интересный формат подачи информации, который действительно не надоедает;","Широкий спектр тематик для освещения;","Знакомство с добычей криптовалют в полупромышленных масштабах;","Активность подписчиков в комментариях."],"cons":["Упоминание сторонних видов деятельности ведущего в профиле;","Авторский формат ведения канала подходит не всем подписчикам;","Новые видео выходят редко."]}$p33$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kanaly-o-majninge-na-youtube-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 34, 'heading',
       $p34${"level":2,"text":"8 место: MINING CENTER"}$p34$::jsonb,
       'mining-center'
FROM articles a WHERE a.slug = 'luchshie-kanaly-o-majninge-na-youtube-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 35, 'paragraph',
       $p35${"text":"Канал от одноименного магазина оборудования для майнинга криптовалюты. Известный участник крипторынка РФ, который успешно освещает новости сегмента в том числе при помощи YouTube: на канале более 30 000 подписчиков и порядка 800 роликов. Основная масса видео имеет отношение именно к майнингу: в ленте практически отсутствует сторонний контент, а также информация о криптовалюте в целом, что позволяет сфокусировать внимание именно на вопросах добычи. MINING CENTER специализируется на асиках, поэтому информация об использовании видеокарт и процессоров отсутствует.","html":"Канал от одноименного магазина оборудования для майнинга криптовалюты. Известный участник крипторынка РФ, который успешно освещает новости сегмента в том числе при помощи YouTube: на канале более 30 000 подписчиков и порядка 800 роликов. Основная масса видео имеет отношение именно к майнингу: в ленте практически отсутствует сторонний контент, а также информация о криптовалюте в целом, что позволяет сфокусировать внимание именно на вопросах добычи. MINING CENTER специализируется на асиках, поэтому информация об использовании видеокарт и процессоров отсутствует."}$p35$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kanaly-o-majninge-na-youtube-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 36, 'image',
       $p36${"src":"/images/articles/youtube-mining-channels/mining-center.png","alt":"MINING CENTER — YouTube-канал"}$p36$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kanaly-o-majninge-na-youtube-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 37, 'paragraph',
       $p37${"text":"Ключевым недостатком можно считать принадлежность канала магазину: авторы контента могут субъективно освещать информацию, фокусируясь только на технике, имеющейся в продаже. Таким образом, продукция других производителей, с которыми не сотрудничает MINING CENTER, обделена вниманием. Тем не менее, контент качественный, разнообразный и полезный как для начинающих, так и опытных майнеров.","html":"Ключевым недостатком можно считать принадлежность канала магазину: авторы контента могут субъективно освещать информацию, фокусируясь только на технике, имеющейся в продаже. Таким образом, продукция других производителей, с которыми не сотрудничает MINING CENTER, обделена вниманием. Тем не менее, контент качественный, разнообразный и полезный как для начинающих, так и опытных майнеров."}$p37$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kanaly-o-majninge-na-youtube-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 38, 'stats',
       $p38${"rows":[{"label":"Ссылка на канал","value":"https://www.youtube.com/@MININGCENTER"},{"label":"Год создания канала","value":"2012"},{"label":"Число подписчиков","value":"30 000+"},{"label":"Количество видео","value":"более 800+"},{"label":"Средняя частота публикации видео","value":"10+ в месяц"},{"label":"Просмотров, в среднем","value":"6 500+"},{"label":"Лайков, в среднем","value":"150+"},{"label":"Комментариев, в среднем","value":"13+"}]}$p38$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kanaly-o-majninge-na-youtube-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 39, 'pros_cons',
       $p39${"pros":["Канал с фокусом на майнинг;","Качественный материал от профессионалов рынка;","Хорошая частота публикации новых материалов;","Один из старейших каналов о майнинге."],"cons":["Небольшое число подписчиков;","Заинтересованность в обзоре техники, представленной в магазине;","Небольшая активность подписчиков;","Отсутствие информации о майнинге на видеокартах."]}$p39$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kanaly-o-majninge-na-youtube-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 40, 'heading',
       $p40${"level":2,"text":"7 место: КОЛЯ МАЙНЕР"}$p40$::jsonb,
       'kolya-mainer'
FROM articles a WHERE a.slug = 'luchshie-kanaly-o-majninge-na-youtube-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 41, 'paragraph',
       $p41${"text":"Известный белорусский блогер ведет свой канал на YouTube с 2014 года, что делает этот ресурс одним из старейших в РУ-сегменте. Неформальный подход к подаче информации пришелся по душе многим подписчикам – Николаю удалось привлечь более 40 000 человек, которые активно смотрят видео, ставят лайки и охотно комментируют ролики. Контент крайне разнообразен – перечень раскрываемых тем действительно впечатляет: от заработка на криптовалюте в целом до профильных технических деталей с подробным обзором по 20–40 минут.","html":"Известный белорусский блогер ведет свой канал на YouTube с 2014 года, что делает этот ресурс одним из старейших в РУ-сегменте. Неформальный подход к подаче информации пришелся по душе многим подписчикам – Николаю удалось привлечь более 40 000 человек, которые активно смотрят видео, ставят лайки и охотно комментируют ролики. Контент крайне разнообразен – перечень раскрываемых тем действительно впечатляет: от заработка на криптовалюте в целом до профильных технических деталей с подробным обзором по 20–40 минут."}$p41$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kanaly-o-majninge-na-youtube-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 42, 'image',
       $p42${"src":"/images/articles/youtube-mining-channels/kolya-mainer.png","alt":"КОЛЯ МАЙНЕР — YouTube-канал"}$p42$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kanaly-o-majninge-na-youtube-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 43, 'paragraph',
       $p43${"text":"Автор канала не специализируется на той или иной технологии майнинга: майнер отлично знаком с тематиками видеокарт, процессоров, асиков, а также программных инструментов. Популярностью пользуются рубрики из раздела советов, рекомендаций и лайфхаков, которые также представлены на ресурсе. Единственный недостаток – неформальный подход к созданию контента. Автор сосредоточен на содержании материала, а не условиях и качестве съемки.","html":"Автор канала не специализируется на той или иной технологии майнинга: майнер отлично знаком с тематиками видеокарт, процессоров, асиков, а также программных инструментов. Популярностью пользуются рубрики из раздела советов, рекомендаций и лайфхаков, которые также представлены на ресурсе. Единственный недостаток – неформальный подход к созданию контента. Автор сосредоточен на содержании материала, а не условиях и качестве съемки."}$p43$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kanaly-o-majninge-na-youtube-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 44, 'stats',
       $p44${"rows":[{"label":"Ссылка на канал","value":"https://www.youtube.com/@koliamainer"},{"label":"Год создания канала","value":"2014"},{"label":"Число подписчиков","value":"40 000+"},{"label":"Количество видео","value":"более 200+"},{"label":"Средняя частота публикации видео","value":"7+ в месяц"},{"label":"Просмотров, в среднем","value":"13 000+"},{"label":"Лайков, в среднем","value":"550+"},{"label":"Комментариев, в среднем","value":"110+"}]}$p44$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kanaly-o-majninge-na-youtube-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 45, 'pros_cons',
       $p45${"pros":["Один из старейших каналов о майнинге и криптовалютах;","Нескучный авторский подход к разработке контента;","Разнообразные тематики видео;","Наличие не только обзоров, но и лайфхаков;","Активность подписчиков в комментариях."],"cons":["Небольшое количество видео для одного из старейших каналов СНГ;","Качество видео и условия съемки понравятся далеко не всем зрителям."]}$p45$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kanaly-o-majninge-na-youtube-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 46, 'heading',
       $p46${"level":2,"text":"6 место: ПРО100 Майнинг"}$p46$::jsonb,
       'pro100-mining'
FROM articles a WHERE a.slug = 'luchshie-kanaly-o-majninge-na-youtube-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 47, 'paragraph',
       $p47${"text":"Известный канал не только о майнинге, но и криптовалютах в целом. Ключевая особенность проекта – качественный контент, при подготовке которого осуществляется действительно глубокая проработка вопроса. Перечень тематик также достаточно широкий – добыча новых криптовалют, обзор техники, советы и рекомендации по работе с цифровыми активами. Повышенное внимание уделяется не только содержанию материала, но и качеству съемки: работа выполняется профессионально, что вызывает уважение.","html":"Известный канал не только о майнинге, но и криптовалютах в целом. Ключевая особенность проекта – качественный контент, при подготовке которого осуществляется действительно глубокая проработка вопроса. Перечень тематик также достаточно широкий – добыча новых криптовалют, обзор техники, советы и рекомендации по работе с цифровыми активами. Повышенное внимание уделяется не только содержанию материала, но и качеству съемки: работа выполняется профессионально, что вызывает уважение."}$p47$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kanaly-o-majninge-na-youtube-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 48, 'image',
       $p48${"src":"/images/articles/youtube-mining-channels/pro100-mining.png","alt":"ПРО100 Майнинг — YouTube-канал"}$p48$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kanaly-o-majninge-na-youtube-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 49, 'paragraph',
       $p49${"text":"Ключевым недостатком канала ПРО100 Майнинг является скромная частота выхода новых видео: не более одного нового ролика ежемесячно, чего для большинства подписчиков явно недостаточно. Многие хотели бы видеть больше материалов от авторов, однако концепция ресурса не меняется уже продолжительное время.","html":"Ключевым недостатком канала ПРО100 Майнинг является скромная частота выхода новых видео: не более одного нового ролика ежемесячно, чего для большинства подписчиков явно недостаточно. Многие хотели бы видеть больше материалов от авторов, однако концепция ресурса не меняется уже продолжительное время."}$p49$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kanaly-o-majninge-na-youtube-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 50, 'stats',
       $p50${"rows":[{"label":"Ссылка на канал","value":"https://www.youtube.com/@pro100mining"},{"label":"Год создания канала","value":"2017"},{"label":"Число подписчиков","value":"125 000+"},{"label":"Количество видео","value":"более 120+"},{"label":"Средняя частота публикации видео","value":"1 в месяц"},{"label":"Просмотров, в среднем","value":"78 000+"},{"label":"Лайков, в среднем","value":"2 700+"},{"label":"Комментариев, в среднем","value":"500+"}]}$p50$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kanaly-o-majninge-na-youtube-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 51, 'pros_cons',
       $p51${"pros":["Профессиональный и качественный канал не только о майнинге, но и криптовалютной тематике в целом;","Большое количество подписчиков, отличная активность в комментариях;","Разнообразие освещаемых тем."],"cons":["Новые видео выходят крайне редко;","Недостаточно информации о классическом майнинге."]}$p51$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kanaly-o-majninge-na-youtube-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 52, 'heading',
       $p52${"level":2,"text":"5 место: IBMM | technology"}$p52$::jsonb,
       'ibmm-technology'
FROM articles a WHERE a.slug = 'luchshie-kanaly-o-majninge-na-youtube-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 53, 'paragraph',
       $p53${"text":"Один из крупнейших продавцов техники для майнинга на территории России также имеет в собственном арсенале канал на YouTube. Тематика ресурса посвящена технике для добычи цифровых активов (асикам), а также профильным материалам, среди которых интервью с членами команды и известными личностями, знакомство с альтернативными системами охлаждения и многое другое. Канал появился в 2018 году, с тех пор IBMM уделяет определенный объем времени и ресурсов для развития этого направления.","html":"Один из крупнейших продавцов техники для майнинга на территории России также имеет в собственном арсенале канал на YouTube. Тематика ресурса посвящена технике для добычи цифровых активов (асикам), а также профильным материалам, среди которых интервью с членами команды и известными личностями, знакомство с альтернативными системами охлаждения и многое другое. Канал появился в 2018 году, с тех пор IBMM уделяет определенный объем времени и ресурсов для развития этого направления."}$p53$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kanaly-o-majninge-na-youtube-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 54, 'image',
       $p54${"src":"/images/articles/youtube-mining-channels/ibmm.png","alt":"IBMM technology — YouTube-канал"}$p54$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kanaly-o-majninge-na-youtube-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 55, 'paragraph',
       $p55${"text":"К сожалению для зрителей, новые ролики выходят на канале нечасто. Количество комментариев к материалам минимально, даже несмотря на интересные тематики обзоров. Время от времени на ресурсе появляются резонансные темы и оригинальные идеи, которые редко встретишь в альтернативных источниках информации.","html":"К сожалению для зрителей, новые ролики выходят на канале нечасто. Количество комментариев к материалам минимально, даже несмотря на интересные тематики обзоров. Время от времени на ресурсе появляются резонансные темы и оригинальные идеи, которые редко встретишь в альтернативных источниках информации."}$p55$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kanaly-o-majninge-na-youtube-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 56, 'stats',
       $p56${"rows":[{"label":"Ссылка на канал","value":"https://www.youtube.com/@IBMMtechnology"},{"label":"Год создания канала","value":"2018"},{"label":"Число подписчиков","value":"35 000+"},{"label":"Количество видео","value":"более 280+"},{"label":"Средняя частота публикации видео","value":"4+ в месяц"},{"label":"Просмотров, в среднем","value":"65 000+"},{"label":"Лайков, в среднем","value":"2 100+"},{"label":"Комментариев, в среднем","value":"40+"}]}$p56$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kanaly-o-majninge-na-youtube-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 57, 'pros_cons',
       $p57${"pros":["Проверенный ресурс от одного из лидеров по продажам майнингового оборудования;","Интересные тематики и качественный материал."],"cons":["Низкая активность подписчиков канала;","Новые видео выходят нечасто."]}$p57$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kanaly-o-majninge-na-youtube-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 58, 'heading',
       $p58${"level":2,"text":"4 место: CryptoLeo"}$p58$::jsonb,
       'cryptoleo'
FROM articles a WHERE a.slug = 'luchshie-kanaly-o-majninge-na-youtube-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 59, 'paragraph',
       $p59${"text":"Один из крупнейших авторских каналов про майнинг и криптовалюты на русском языке. Автор в неформальной манере рассказывает о своих активностях, делится аналитикой и стремится соответствовать трендам, господствующим на рынке цифровых активов. Именно по этой причине тематика канала – не только классическая добыча крипты на асиках и видеокартах, но и многие другие активности.","html":"Один из крупнейших авторских каналов про майнинг и криптовалюты на русском языке. Автор в неформальной манере рассказывает о своих активностях, делится аналитикой и стремится соответствовать трендам, господствующим на рынке цифровых активов. Именно по этой причине тематика канала – не только классическая добыча крипты на асиках и видеокартах, но и многие другие активности."}$p59$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kanaly-o-majninge-na-youtube-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 60, 'image',
       $p60${"src":"/images/articles/youtube-mining-channels/cryptoleo.png","alt":"CryptoLeo — YouTube-канал"}$p60$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kanaly-o-majninge-na-youtube-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 61, 'paragraph',
       $p61${"text":"Канал располагает внушительной аудиторией, подписчики отличаются активностью и вовлеченностью – немало полезной информации можно найти не только в видео, но и в комментариях под роликами. Формат подачи информации от CryptoLeo трудно назвать профессиональным, но содержание полностью компенсирует данный недостаток.","html":"Канал располагает внушительной аудиторией, подписчики отличаются активностью и вовлеченностью – немало полезной информации можно найти не только в видео, но и в комментариях под роликами. Формат подачи информации от CryptoLeo трудно назвать профессиональным, но содержание полностью компенсирует данный недостаток."}$p61$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kanaly-o-majninge-na-youtube-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 62, 'stats',
       $p62${"rows":[{"label":"Ссылка на канал","value":"https://www.youtube.com/@CryptoLeo"},{"label":"Год создания канала","value":"2017"},{"label":"Число подписчиков","value":"85 000+"},{"label":"Количество видео","value":"более 650+"},{"label":"Средняя частота публикации видео","value":"7+ в месяц"},{"label":"Просмотров, в среднем","value":"14 000"},{"label":"Лайков, в среднем","value":"650+"},{"label":"Комментариев, в среднем","value":"100+"}]}$p62$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kanaly-o-majninge-na-youtube-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 63, 'pros_cons',
       $p63${"pros":["Отличный пример авторского канала о криптовалютах;","Широкий спектр анализируемых тем – от майнинга до кликеров на телефон;","Активное комьюнити."],"cons":["Своеобразный формат подачи информации;","Отсутствие фокуса на определенную тему, что может не понравиться ценителям профильной информации."]}$p63$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kanaly-o-majninge-na-youtube-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 64, 'heading',
       $p64${"level":2,"text":"3 место: Заметки Майнера"}$p64$::jsonb,
       'zametki-mainera'
FROM articles a WHERE a.slug = 'luchshie-kanaly-o-majninge-na-youtube-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 65, 'paragraph',
       $p65${"text":"Достойный пример авторского канала о криптовалютах, одной из тем которого является майнинг. Ключевая особенность проекта – фокусировка на максимально полезной информации для рядового пользователя. Количество лайфхаков на канале максимально, пользователи активно комментируют материалы, что играет на руку всем без исключения подписчикам – под видео находится не меньше полезной информации, чем в самих роликах.","html":"Достойный пример авторского канала о криптовалютах, одной из тем которого является майнинг. Ключевая особенность проекта – фокусировка на максимально полезной информации для рядового пользователя. Количество лайфхаков на канале максимально, пользователи активно комментируют материалы, что играет на руку всем без исключения подписчикам – под видео находится не меньше полезной информации, чем в самих роликах."}$p65$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kanaly-o-majninge-na-youtube-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 66, 'image',
       $p66${"src":"/images/articles/youtube-mining-channels/zametki-mainera.png","alt":"Заметки Майнера — YouTube-канал"}$p66$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kanaly-o-majninge-na-youtube-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 67, 'paragraph',
       $p67${"text":"Ощутимым недостатком для майнерского сообщества является незначительный объем данных именно о добыче цифровых активов. В последнее время автор уделяет внимание темам, которые интересны новичкам сегмента криптовалют. Поэтому эксклюзивной информации о технике и оборудовании в Заметках Майнера лишь небольшая доля от общей массы контента. Но тематики крайне полезны и интересны, поэтому рекомендуется время от времени заходить на канал, чтобы найти редкие лайфхаки и рекомендации.","html":"Ощутимым недостатком для майнерского сообщества является незначительный объем данных именно о добыче цифровых активов. В последнее время автор уделяет внимание темам, которые интересны новичкам сегмента криптовалют. Поэтому эксклюзивной информации о технике и оборудовании в Заметках Майнера лишь небольшая доля от общей массы контента. Но тематики крайне полезны и интересны, поэтому рекомендуется время от времени заходить на канал, чтобы найти редкие лайфхаки и рекомендации."}$p67$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kanaly-o-majninge-na-youtube-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 68, 'stats',
       $p68${"rows":[{"label":"Ссылка на канал","value":"https://www.youtube.com/@ZametkiMainera"},{"label":"Год создания канала","value":"2015"},{"label":"Число подписчиков","value":"75 000+"},{"label":"Количество видео","value":"более 1 013+"},{"label":"Средняя частота публикации видео","value":"15+ в месяц"},{"label":"Просмотров, в среднем","value":"26 000+"},{"label":"Лайков, в среднем","value":"750+"},{"label":"Комментариев, в среднем","value":"45+"}]}$p68$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kanaly-o-majninge-na-youtube-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 69, 'pros_cons',
       $p69${"pros":["Авторский канал от профессионального майнера;","Большое количество видео (более 1 000 роликов);","Анализ самых актуальных тематик, включая направление майнинга;","Множество полезных рекомендаций и уникальных лайфхаков;","Высокая частота выхода новых видео."],"cons":["В последнее время публикуется много информации, отличающейся от майнерской тематики."]}$p69$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kanaly-o-majninge-na-youtube-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 70, 'heading',
       $p70${"level":2,"text":"2 место: Serega Soleniy miner"}$p70$::jsonb,
       'serega-soleniy'
FROM articles a WHERE a.slug = 'luchshie-kanaly-o-majninge-na-youtube-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 71, 'paragraph',
       $p71${"text":"«Соленый» – самый известный блогер СНГ, рассказывающий о майнинге на видеокартах. Именно этот человек знает про GPU буквально все, осуществляя взаимодействие с картами в промышленных масштабах. На канале рассказывается о сборке ферм, выборе и разгоне карт, их перепрошивке и оптимизации. Кроме того, на ресурсе можно найти немало другой полезной информации, имеющей отношение к криптовалютам.","html":"«Соленый» – самый известный блогер СНГ, рассказывающий о майнинге на видеокартах. Именно этот человек знает про GPU буквально все, осуществляя взаимодействие с картами в промышленных масштабах. На канале рассказывается о сборке ферм, выборе и разгоне карт, их перепрошивке и оптимизации. Кроме того, на ресурсе можно найти немало другой полезной информации, имеющей отношение к криптовалютам."}$p71$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kanaly-o-majninge-na-youtube-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 72, 'image',
       $p72${"src":"/images/articles/youtube-mining-channels/serega-soleniy.png","alt":"Serega Soleniy miner — YouTube-канал"}$p72$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kanaly-o-majninge-na-youtube-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 73, 'paragraph',
       $p73${"text":"Авторский контент канала Serega Soleniy miner отлично узнаваем: «Соленый» не концентрирует внимание на качестве съемки и формате подачи информации. Ключевой фокус – полезность контента, передача личного опыта и неформальный диалог с пользователем. Некоторым подобная концепция может не понравиться, но сложно назвать человека в СНГ, который знает о майнинге на GPU больше автора данного канала.","html":"Авторский контент канала Serega Soleniy miner отлично узнаваем: «Соленый» не концентрирует внимание на качестве съемки и формате подачи информации. Ключевой фокус – полезность контента, передача личного опыта и неформальный диалог с пользователем. Некоторым подобная концепция может не понравиться, но сложно назвать человека в СНГ, который знает о майнинге на GPU больше автора данного канала."}$p73$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kanaly-o-majninge-na-youtube-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 74, 'stats',
       $p74${"rows":[{"label":"Ссылка на канал","value":"https://www.youtube.com/@SeregaSoleniy"},{"label":"Год создания канала","value":"2017"},{"label":"Число подписчиков","value":"190 000+"},{"label":"Количество видео","value":"более 564+"},{"label":"Средняя частота публикации видео","value":"5+ в месяц"},{"label":"Просмотров, в среднем","value":"43 000+"},{"label":"Лайков, в среднем","value":"2 000+"},{"label":"Комментариев, в среднем","value":"220+"}]}$p74$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kanaly-o-majninge-na-youtube-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 75, 'pros_cons',
       $p75${"pros":["Крупнейший канал СНГ по майнингу на видеокартах;","Высокая квалификация и экспертность ведущего;","Дополнение основной тематики смежным контентом;","Активные подписчики, дискутирующие в комментариях."],"cons":["Практически отсутствует повествование о майнинге на асиках;","Неформальная концепция ведения видеоблога."]}$p75$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kanaly-o-majninge-na-youtube-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 76, 'heading',
       $p76${"level":2,"text":"1 место: Miner World"}$p76$::jsonb,
       'miner-world'
FROM articles a WHERE a.slug = 'luchshie-kanaly-o-majninge-na-youtube-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 77, 'paragraph',
       $p77${"text":"Пожалуй, самый органичный канал о майнинге и криптовалютах на русском языке. Здесь есть все для комфортного знакомства с тематикой: многообразие рубрик, качественный контент, несколько ведущих, достаточно активное комьюнити, а также интересный материал как для новичков, так и опытных криптоэнтузиастов. Но несмотря на разные темы, преобладает именно майнинговая направленность – это обзоры техники, эксперименты, советы, рекомендации и лайфхаки.","html":"Пожалуй, самый органичный канал о майнинге и криптовалютах на русском языке. Здесь есть все для комфортного знакомства с тематикой: многообразие рубрик, качественный контент, несколько ведущих, достаточно активное комьюнити, а также интересный материал как для новичков, так и опытных криптоэнтузиастов. Но несмотря на разные темы, преобладает именно майнинговая направленность – это обзоры техники, эксперименты, советы, рекомендации и лайфхаки."}$p77$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kanaly-o-majninge-na-youtube-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 78, 'image',
       $p78${"src":"/images/articles/youtube-mining-channels/miner-world.png","alt":"Miner World — YouTube-канал"}$p78$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kanaly-o-majninge-na-youtube-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 79, 'paragraph',
       $p79${"text":"Помимо канала на YouTube у его авторов есть магазин по продаже техники для майнинга, а также сервисный центр. Однако данные направления работы не обрели той же популярности, что видеоконтент (магазин не на слуху у большинства участников отрасли). С точки зрения продаж – это негативный момент, но для подписчиков подобный факт можно назвать преимуществом: отсутствует агрессивный маркетинг, преобладает фактор полезности материала.","html":"Помимо канала на YouTube у его авторов есть магазин по продаже техники для майнинга, а также сервисный центр. Однако данные направления работы не обрели той же популярности, что видеоконтент (магазин не на слуху у большинства участников отрасли). С точки зрения продаж – это негативный момент, но для подписчиков подобный факт можно назвать преимуществом: отсутствует агрессивный маркетинг, преобладает фактор полезности материала."}$p79$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kanaly-o-majninge-na-youtube-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 80, 'stats',
       $p80${"rows":[{"label":"Ссылка на канал","value":"https://www.youtube.com/@miner-world"},{"label":"Год создания канала","value":"2019"},{"label":"Число подписчиков","value":"114 000+"},{"label":"Количество видео","value":"более 900+"},{"label":"Средняя частота публикации видео","value":"7+ в месяц"},{"label":"Просмотров, в среднем","value":"68 000+"},{"label":"Лайков, в среднем","value":"2 200+"},{"label":"Комментариев, в среднем","value":"55+"}]}$p80$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kanaly-o-majninge-na-youtube-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 81, 'pros_cons',
       $p81${"pros":["Сбалансированный канал о майнинге и криптовалюте;","Разнообразие тем и форматов;","Множество видео в библиотеке и хорошая частота выхода новых материалов;","Несколько ведущих."],"cons":["Ориентация в первую очередь на новичков майнинга."]}$p81$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kanaly-o-majninge-na-youtube-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 82, 'heading',
       $p82${"level":2,"text":"Выводы"}$p82$::jsonb,
       'vyvody'
FROM articles a WHERE a.slug = 'luchshie-kanaly-o-majninge-na-youtube-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 83, 'paragraph',
       $p83${"text":"YouTube остаётся одной из главных платформ для тех, кто хочет узнать больше о майнинге. Видеообзоры позволяют быстро и эффективно разобраться в технических вопросах, найти подходящее оборудование, сравнить прошивки, узнать о новых пулах и понять, как зарабатывать больше.","html":"YouTube остаётся одной из главных платформ для тех, кто хочет узнать больше о майнинге. Видеообзоры позволяют быстро и эффективно разобраться в технических вопросах, найти подходящее оборудование, сравнить прошивки, узнать о новых пулах и понять, как зарабатывать больше."}$p83$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kanaly-o-majninge-na-youtube-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 84, 'paragraph',
       $p84${"text":"Чтобы получить максимум пользы от YouTube:","html":"Чтобы получить максимум пользы от YouTube:"}$p84$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kanaly-o-majninge-na-youtube-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 85, 'list',
       $p85${"ordered":false,"items":["Подписывайтесь на проверенные и честные каналы;","Не гонитесь за громкими заголовками;","Проверяйте информацию из видео другими источниками;","Общайтесь с сообществом – это помогает лучше понимать риски и находить решения."]}$p85$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kanaly-o-majninge-na-youtube-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 86, 'paragraph',
       $p86${"text":"Со временем вы сможете самостоятельно отличать качественные каналы от поверхностных и использовать YouTube как мощный инструмент обучения и развития в сфере майнинга.","html":"Со временем вы сможете самостоятельно отличать качественные каналы от поверхностных и использовать YouTube как мощный инструмент обучения и развития в сфере майнинга."}$p86$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kanaly-o-majninge-na-youtube-top-10';
