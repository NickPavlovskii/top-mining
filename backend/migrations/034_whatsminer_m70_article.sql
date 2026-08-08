SET client_encoding = 'UTF8';

-- =====================================================================
-- 034_whatsminer_m70_article.sql
-- Полный текст обзора Whatsminer M70 + блоки секций (раньше были только heading).
-- =====================================================================

INSERT INTO articles (
    slug, title, title_subtitle, excerpt, content, topic_id,
    reading_time_min, reading_minutes, published_at, view_count,
    display_type, sort_order, is_published, uses_blocks,
    image_url, image_alt
) VALUES (
    'whatsminer-m70-line-review',
    'Новое поколение Whatsminer M70',
    'Полный обзор линейки',
    $excerpt$Whatsminer M70 — одно из самых ожидаемых обновлений линейки MicroBT. В обзоре сравниваем модели по хешрейту, потреблению и стабильности работы в разных условиях размещения. Отдельно рассматриваем сервисную поддержку, доступность прошивок и реальную доходность при текущей сложности сети Bitcoin.$excerpt$,
    $content$Введение

Премьера серии Whatsminer M70 стала одним из самых ожидаемых событий индустрии оборудования для добычи Bitcoin. MicroBT впервые за два года представила крупное обновление, которое не просто расширяет модельный ряд, а меняет сам подход производителя к позиционированию устройств.

Линейка M70 демонстрирует стратегический переход компании от универсальных решений к четкому разделению по энергоэффективности и инфраструктурным потребностям.

Если предыдущие поколения Whatsminer отличались главным образом увеличением хешрейта, то серия M70 концентрируется на энергоэффективности, снижении эксплуатационных расходов и повышении плотности размещения. Ниже — подробный разбор всей линейки с учетом особенностей охлаждения, технических показателей, целевых сценариев и рыночных последствий.

Whatsminer M70: что интересного?

Майнинг в 2026 году находится в точке, где технологическое развитие оборудования напрямую влияет на рентабельность. После халвинга нагрузка на инфраструктуру резко возросла, а доля дохода, зависящая от комиссий, остается переменной. Это значит, что выигрывают не те, кто наращивает мощности, а те, кто снижает стоимость вычислений.

Именно в этот момент MicroBT выпускает поколение M70, делая ставку на:

энергоэффективность как главный параметр конкурентоспособности;
разделение оборудования по классам, чтобы покупатели могли выбирать устройства под стоимость электроэнергии, режимы охлаждения и плотность размещения;
снижение расходов на инфраструктуру, благодаря увеличенному хешрейту на одно устройство;
универсальность — разные форматы охлаждения без потери стабильности.

Этот подход нацелен на то, чтобы сделать парк оборудования более устойчивым и экономически привлекательным в долгосрочной перспективе.

Линейка Whatsminer M70: три класса энергоэффективности

В отличие от предыдущих поколений, серия M70 делится не просто по номерам моделей, а по классам энергоэффективности. Это ключевое отличие, формирующее удобную логику выбора.

Класс 14,5 J/T — стабильность, прогнозируемость, низкая цена входа. Эта группа включает: Whatsminer M70, Whatsminer M72, Whatsminer M73, Whatsminer M76, Whatsminer M78, Whatsminer M79.

Характер модели:

оптимальный вариант для крупных парков с умеренной стоимостью электроэнергии;
высокая надежность при стабильных показателях производительности;
отсутствие требований к сложной инфраструктуре;
идеальный выбор для тех, кто работает не первый год и ищет баланс в цене и мощности.

Этот класс можно назвать «рабочей лошадкой» серии — он масштабируется лучше всего и подходит для больших ферм.

Класс 13,5 J/T — золотая середина и оптимизация под дата-центры. В эту группу входят: Whatsminer M70S, Whatsminer M72S, Whatsminer M73S, Whatsminer M76S, Whatsminer M78S, Whatsminer M79S.

Преимущества этого класса:

энергоэффективность выше;
часто используется майнинг-отелями и операторами ЦОД благодаря выгодному соотношению стоимости электроэнергии и производительности;
подходит под любые схемы охлаждения.

Этот класс станет самым массовым благодаря тому, что сочетает высокую экономичность и умеренную цену.

Класс 12,5 J/T — максимальная эффективность на рынке. Топовые модели серии: Whatsminer M70S+, Whatsminer M73S+, Whatsminer M76S+.

Задача — обеспечить минимальное потребление на 1 TH при высокой плотности хешрейта. Это прямые конкуренты флагманов Bitmain.

Кому подходит:

регионам с высокой стоимостью электроэнергии;
дата-центрам, работающим с плотным размещением;
инвесторам, где важен длительный жизненный цикл оборудования и низкий OPEX.

Эти устройства показательно демонстрируют технологический скачок MicroBT — впервые Whatsminer достигает показателей, которые ранее были доступны только в моделях Antminer.

Охлаждение: три формата для разных задач

Одним из ключевых преимуществ серии M70 стало расширение вариантов размещения. Теперь каждый класс энергоэффективности имеет модели в различных форматах охлаждения.

Воздушное охлаждение, преимущества:

низкая стоимость внедрения,
простота обслуживания,
минимальные требования к инфраструктуре.
диапазон мощности: 214–300 TH/s.

Иммерсионное охлаждение, преимущества:

возможность разгона,
снижение уровня шума,
высокая плотность размещения.
диапазон мощности: 336–522 TH/s.

Гидроохлаждение, преимущества:

стабильная работа даже под максимальной нагрузкой,
рекордная производительность — до 930–1040 TH/s для M79S,
удобство установки в стоечных ЦОД.
Одна из самых мощных моделей в мире.

Технологические особенности серии M70

Помимо энергоэффективности и вариантов охлаждения, устройства получили:

обновленную архитектуру платы, которая лучше отводит тепло и обеспечивает стабильность работы;
улучшенную систему питания с защитой от скачков напряжения;
модульную конструкцию, упрощающую ремонт;
увеличенную плотность чипов нового поколения.

MicroBT делает ставку на минимизацию потерь и повышение технологической надежности — именно это определяет срок службы асика после халвинга.

Как обновление M70 повлияет на индустрию?

Новая линейка изменит рынок сразу по нескольким направлениям:

Усилится конкуренция с Bitmain. Показатели 12,5 J/T позволят MicroBT вернуть позиции на премиальном сегменте, который Bitmain доминировал последние два года.
Растет хешрейт сети Bitcoin. Модели типа M79S фактически заменяют кластеры из 2–3 устройств предыдущих поколений.
Операторы будут ускоренно обновлять парк оборудования. Особенно после роста стоимости электроэнергии в ряде регионов.
Стоимость инфраструктуры снизится. Благодаря высокой мощности на один корпус.
Изменится структура дата-центров. Ставка на плотность заставит площадки переходить на иммерсию или гидру.

Выводы

Новая линейка MicroBT — это не просто очередное обновление, а разворот всей продуктовой стратегии компании.

Серия M70:

впервые делится по энергоэффективности (14,5 / 13,5 / 12,5 J/T);
предлагает полный набор форматов охлаждения (воздух, иммерсия, гидра);
позволяет операторам выбирать устройства под стоимость электроэнергии;
делает упор на минимизацию OPEX;
выводит MicroBT на уровень конкуренции с флагманами Bitmain;
формирует новую планку плотности хешрейта — до 1 PH/s.

Это поколение станет фундаментом для майнинговой инфраструктуры на ближайшие 2–3 года и задаст новый вектор развития ASIC-рынка.
$content$,
    'mining',
    10,
    10,
    '2025-12-12',
    324,
    'hero',
    1,
    TRUE,
    TRUE,
    '/images/articles/whatsminer-m70.jpg',
    'Whatsminer M70'
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
    display_type = EXCLUDED.display_type,
    sort_order = EXCLUDED.sort_order,
    uses_blocks = TRUE,
    image_url = EXCLUDED.image_url,
    image_alt = EXCLUDED.image_alt,
    is_published = TRUE;

INSERT INTO media_assets (path, alt, source)
VALUES (
    '/images/articles/whatsminer-m70.jpg',
    'Whatsminer M70',
    'article_cover'
)
ON CONFLICT (path) DO UPDATE SET alt = EXCLUDED.alt;

UPDATE articles a
SET cover_media_id = m.id
FROM media_assets m
WHERE a.slug = 'whatsminer-m70-line-review'
  AND m.path = a.image_url;

DELETE FROM article_blocks
WHERE article_id = (SELECT id FROM articles WHERE slug = 'whatsminer-m70-line-review');

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 1, 'heading', '{"level":2,"text":"Введение"}'::jsonb, 'intro'
FROM articles a WHERE a.slug = 'whatsminer-m70-line-review';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 2, 'paragraph',
       $p${"text":"Премьера серии Whatsminer M70 стала одним из самых ожидаемых событий индустрии оборудования для добычи Bitcoin. MicroBT впервые за два года представила крупное обновление, которое не просто расширяет модельный ряд, а меняет сам подход производителя к позиционированию устройств."}$p$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'whatsminer-m70-line-review';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 3, 'paragraph',
       $p${"text":"Линейка M70 демонстрирует стратегический переход компании от универсальных решений к четкому разделению по энергоэффективности и инфраструктурным потребностям."}$p$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'whatsminer-m70-line-review';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 4, 'paragraph',
       $p${"text":"Если предыдущие поколения Whatsminer отличались главным образом увеличением хешрейта, то серия M70 концентрируется на энергоэффективности, снижении эксплуатационных расходов и повышении плотности размещения. Ниже — подробный разбор всей линейки с учетом особенностей охлаждения, технических показателей, целевых сценариев и рыночных последствий."}$p$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'whatsminer-m70-line-review';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 5, 'heading',
       '{"level":2,"text":"Whatsminer M70: что интересного?"}'::jsonb,
       'whats-interesting'
FROM articles a WHERE a.slug = 'whatsminer-m70-line-review';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 6, 'paragraph',
       $p${"text":"Майнинг в 2026 году находится в точке, где технологическое развитие оборудования напрямую влияет на рентабельность. После халвинга нагрузка на инфраструктуру резко возросла, а доля дохода, зависящая от комиссий, остается переменной. Это значит, что выигрывают не те, кто наращивает мощности, а те, кто снижает стоимость вычислений."}$p$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'whatsminer-m70-line-review';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 7, 'paragraph',
       $p${"text":"Именно в этот момент MicroBT выпускает поколение M70, делая ставку на:"}$p$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'whatsminer-m70-line-review';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 8, 'list',
       $p${"ordered":false,"items":["энергоэффективность как главный параметр конкурентоспособности","разделение оборудования по классам, чтобы покупатели могли выбирать устройства под стоимость электроэнергии, режимы охлаждения и плотность размещения","снижение расходов на инфраструктуру, благодаря увеличенному хешрейту на одно устройство","универсальность — разные форматы охлаждения без потери стабильности"]}$p$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'whatsminer-m70-line-review';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 9, 'paragraph',
       $p${"text":"Этот подход нацелен на то, чтобы сделать парк оборудования более устойчивым и экономически привлекательным в долгосрочной перспективе."}$p$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'whatsminer-m70-line-review';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 10, 'heading',
       '{"level":2,"text":"Линейка Whatsminer M70: три класса энергоэффективности"}'::jsonb,
       'efficiency-classes'
FROM articles a WHERE a.slug = 'whatsminer-m70-line-review';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 11, 'paragraph',
       $p${"text":"В отличие от предыдущих поколений, серия M70 делится не просто по номерам моделей, а по классам энергоэффективности. Это ключевое отличие, формирующее удобную логику выбора."}$p$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'whatsminer-m70-line-review';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 12, 'paragraph',
       $p${"text":"Класс 14,5 J/T — стабильность, прогнозируемость, низкая цена входа. Эта группа включает: Whatsminer M70, Whatsminer M72, Whatsminer M73, Whatsminer M76, Whatsminer M78, Whatsminer M79."}$p$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'whatsminer-m70-line-review';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 13, 'paragraph',
       $p${"text":"Характер модели:"}'::jsonb,
       NULL
FROM articles a WHERE a.slug = 'whatsminer-m70-line-review';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 14, 'list',
       $p${"ordered":false,"items":["оптимальный вариант для крупных парков с умеренной стоимостью электроэнергии","высокая надежность при стабильных показателях производительности","отсутствие требований к сложной инфраструктуре","идеальный выбор для тех, кто работает не первый год и ищет баланс в цене и мощности"]}$p$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'whatsminer-m70-line-review';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 15, 'paragraph',
       $p${"text":"Этот класс можно назвать «рабочей лошадкой» серии — он масштабируется лучше всего и подходит для больших ферм."}$p$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'whatsminer-m70-line-review';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 16, 'paragraph',
       $p${"text":"Класс 13,5 J/T — золотая середина и оптимизация под дата-центры. В эту группу входят: Whatsminer M70S, Whatsminer M72S, Whatsminer M73S, Whatsminer M76S, Whatsminer M78S, Whatsminer M79S."}$p$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'whatsminer-m70-line-review';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 17, 'paragraph',
       $p${"text":"Преимущества этого класса:"}'::jsonb,
       NULL
FROM articles a WHERE a.slug = 'whatsminer-m70-line-review';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 18, 'list',
       $p${"ordered":false,"items":["энергоэффективность выше","часто используется майнинг-отелями и операторами ЦОД благодаря выгодному соотношению стоимости электроэнергии и производительности","подходит под любые схемы охлаждения"]}$p$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'whatsminer-m70-line-review';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 19, 'paragraph',
       $p${"text":"Этот класс станет самым массовым благодаря тому, что сочетает высокую экономичность и умеренную цену."}$p$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'whatsminer-m70-line-review';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 20, 'paragraph',
       $p${"text":"Класс 12,5 J/T — максимальная эффективность на рынке. Топовые модели серии: Whatsminer M70S+, Whatsminer M73S+, Whatsminer M76S+."}$p$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'whatsminer-m70-line-review';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 21, 'paragraph',
       $p${"text":"Задача — обеспечить минимальное потребление на 1 TH при высокой плотности хешрейта. Это прямые конкуренты флагманов Bitmain."}$p$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'whatsminer-m70-line-review';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 22, 'paragraph',
       $p${"text":"Кому подходит:"}'::jsonb,
       NULL
FROM articles a WHERE a.slug = 'whatsminer-m70-line-review';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 23, 'list',
       $p${"ordered":false,"items":["регионам с высокой стоимостью электроэнергии","дата-центрам, работающим с плотным размещением","инвесторам, где важен длительный жизненный цикл оборудования и низкий OPEX"]}$p$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'whatsminer-m70-line-review';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 24, 'paragraph',
       $p${"text":"Эти устройства показательно демонстрируют технологический скачок MicroBT — впервые Whatsminer достигает показателей, которые ранее были доступны только в моделях Antminer."}$p$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'whatsminer-m70-line-review';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 25, 'heading',
       '{"level":2,"text":"Охлаждение: три формата для разных задач"}'::jsonb,
       'cooling'
FROM articles a WHERE a.slug = 'whatsminer-m70-line-review';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 26, 'paragraph',
       $p${"text":"Одним из ключевых преимуществ серии M70 стало расширение вариантов размещения. Теперь каждый класс энергоэффективности имеет модели в различных форматах охлаждения."}$p$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'whatsminer-m70-line-review';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 27, 'paragraph',
       $p${"text":"Воздушное охлаждение, преимущества:"}'::jsonb,
       NULL
FROM articles a WHERE a.slug = 'whatsminer-m70-line-review';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 28, 'list',
       $p${"ordered":false,"items":["низкая стоимость внедрения","простота обслуживания","минимальные требования к инфраструктуре","диапазон мощности: 214–300 TH/s"]}$p$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'whatsminer-m70-line-review';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 29, 'paragraph',
       $p${"text":"Иммерсионное охлаждение, преимущества:"}'::jsonb,
       NULL
FROM articles a WHERE a.slug = 'whatsminer-m70-line-review';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 30, 'list',
       $p${"ordered":false,"items":["возможность разгона","снижение уровня шума","высокая плотность размещения","диапазон мощности: 336–522 TH/s"]}$p$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'whatsminer-m70-line-review';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 31, 'paragraph',
       $p${"text":"Гидроохлаждение, преимущества:"}'::jsonb,
       NULL
FROM articles a WHERE a.slug = 'whatsminer-m70-line-review';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 32, 'list',
       $p${"ordered":false,"items":["стабильная работа даже под максимальной нагрузкой","рекордная производительность — до 930–1040 TH/s для M79S","удобство установки в стоечных ЦОД","одна из самых мощных моделей в мире"]}$p$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'whatsminer-m70-line-review';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 33, 'heading',
       '{"level":2,"text":"Технологические особенности серии M70"}'::jsonb,
       'tech-features'
FROM articles a WHERE a.slug = 'whatsminer-m70-line-review';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 34, 'paragraph',
       $p${"text":"Помимо энергоэффективности и вариантов охлаждения, устройства получили:"}'::jsonb,
       NULL
FROM articles a WHERE a.slug = 'whatsminer-m70-line-review';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 35, 'list',
       $p${"ordered":false,"items":["обновленную архитектуру платы, которая лучше отводит тепло и обеспечивает стабильность работы","улучшенную систему питания с защитой от скачков напряжения","модульную конструкцию, упрощающую ремонт","увеличенную плотность чипов нового поколения"]}$p$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'whatsminer-m70-line-review';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 36, 'paragraph',
       $p${"text":"MicroBT делает ставку на минимизацию потерь и повышение технологической надежности — именно это определяет срок службы асика после халвинга."}$p$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'whatsminer-m70-line-review';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 37, 'heading',
       '{"level":2,"text":"Как обновление M70 повлияет на индустрию?"}'::jsonb,
       'industry-impact'
FROM articles a WHERE a.slug = 'whatsminer-m70-line-review';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 38, 'paragraph',
       $p${"text":"Новая линейка изменит рынок сразу по нескольким направлениям:"}'::jsonb,
       NULL
FROM articles a WHERE a.slug = 'whatsminer-m70-line-review';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 39, 'list',
       $p${"ordered":false,"items":["Усилится конкуренция с Bitmain. Показатели 12,5 J/T позволят MicroBT вернуть позиции на премиальном сегменте, который Bitmain доминировал последние два года.","Растет хешрейт сети Bitcoin. Модели типа M79S фактически заменяют кластеры из 2–3 устройств предыдущих поколений.","Операторы будут ускоренно обновлять парк оборудования. Особенно после роста стоимости электроэнергии в ряде регионов.","Стоимость инфраструктуры снизится. Благодаря высокой мощности на один корпус.","Изменится структура дата-центров. Ставка на плотность заставит площадки переходить на иммерсию или гидру."]}$p$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'whatsminer-m70-line-review';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 40, 'heading',
       '{"level":2,"text":"Выводы"}'::jsonb,
       'conclusion'
FROM articles a WHERE a.slug = 'whatsminer-m70-line-review';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 41, 'paragraph',
       $p${"text":"Новая линейка MicroBT — это не просто очередное обновление, а разворот всей продуктовой стратегии компании."}$p$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'whatsminer-m70-line-review';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 42, 'paragraph',
       $p${"text":"Серия M70:"}'::jsonb,
       NULL
FROM articles a WHERE a.slug = 'whatsminer-m70-line-review';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 43, 'list',
       $p${"ordered":false,"items":["впервые делится по энергоэффективности (14,5 / 13,5 / 12,5 J/T)","предлагает полный набор форматов охлаждения (воздух, иммерсия, гидра)","позволяет операторам выбирать устройства под стоимость электроэнергии","делает упор на минимизацию OPEX","выводит MicroBT на уровень конкуренции с флагманами Bitmain","формирует новую планку плотности хешрейта — до 1 PH/s"]}$p$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'whatsminer-m70-line-review';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 44, 'paragraph',
       $p${"text":"Это поколение станет фундаментом для майнинговой инфраструктуры на ближайшие 2–3 года и задаст новый вектор развития ASIC-рынка."}$p$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'whatsminer-m70-line-review';
