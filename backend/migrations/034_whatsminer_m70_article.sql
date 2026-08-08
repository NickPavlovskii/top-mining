SET client_encoding = 'UTF8';

-- =====================================================================
-- 034_whatsminer_m70_article.sql
-- Полный текст обзора Whatsminer M70 + блоки секций (раньше были только heading).
-- Картинки и ссылки на калькулятор: см. 035_whatsminer_m70_article_media.sql
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
    '/images/articles/whatsminer-m70.png',
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
    '/images/articles/whatsminer-m70.png',
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
       $tmj${"text":"Премьера серии Whatsminer M70 стала одним из самых ожидаемых событий индустрии оборудования для добычи Bitcoin. MicroBT впервые за два года представила крупное обновление, которое не просто расширяет модельный ряд, а меняет сам подход производителя к позиционированию устройств."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'whatsminer-m70-line-review';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 3, 'paragraph',
       $tmj${"text":"Линейка M70 демонстрирует стратегический переход компании от универсальных решений к четкому разделению по энергоэффективности и инфраструктурным потребностям."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'whatsminer-m70-line-review';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 4, 'paragraph',
       $tmj${"text":"Если предыдущие поколения Whatsminer отличались главным образом увеличением хешрейта, то серия M70 концентрируется на энергоэффективности, снижении эксплуатационных расходов и повышении плотности размещения. Ниже — подробный разбор всей линейки с учетом особенностей охлаждения, технических показателей, целевых сценариев и рыночных последствий."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'whatsminer-m70-line-review';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 5, 'heading',
       '{"level":2,"text":"Whatsminer M70: что интересного?"}'::jsonb,
       'whats-interesting'
FROM articles a WHERE a.slug = 'whatsminer-m70-line-review';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 6, 'paragraph',
       $tmj${"text":"Майнинг в 2026 году находится в точке, где технологическое развитие оборудования напрямую влияет на рентабельность. После халвинга нагрузка на инфраструктуру резко возросла, а доля дохода, зависящая от комиссий, остается переменной. Это значит, что выигрывают не те, кто наращивает мощности, а те, кто снижает стоимость вычислений."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'whatsminer-m70-line-review';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 7, 'paragraph',
       $tmj${"text":"Именно в этот момент MicroBT выпускает поколение M70, делая ставку на:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'whatsminer-m70-line-review';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 8, 'list',
       $tmj${"ordered":false,"items":["энергоэффективность как главный параметр конкурентоспособности","разделение оборудования по классам, чтобы покупатели могли выбирать устройства под стоимость электроэнергии, режимы охлаждения и плотность размещения","снижение расходов на инфраструктуру, благодаря увеличенному хешрейту на одно устройство","универсальность — разные форматы охлаждения без потери стабильности"]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'whatsminer-m70-line-review';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 9, 'paragraph',
       $tmj${"text":"Этот подход нацелен на то, чтобы сделать парк оборудования более устойчивым и экономически привлекательным в долгосрочной перспективе."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'whatsminer-m70-line-review';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 10, 'heading',
       '{"level":2,"text":"Линейка Whatsminer M70: три класса энергоэффективности"}'::jsonb,
       'efficiency-classes'
FROM articles a WHERE a.slug = 'whatsminer-m70-line-review';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 11, 'paragraph',
       $tmj${"text":"В отличие от предыдущих поколений, серия M70 делится не просто по номерам моделей, а по классам энергоэффективности. Это ключевое отличие, формирующее удобную логику выбора."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'whatsminer-m70-line-review';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 12, 'paragraph',
       $tmj${"text":"Класс 14,5 J/T — стабильность, прогнозируемость, низкая цена входа. Эта группа включает: Whatsminer M70, Whatsminer M72, Whatsminer M73, Whatsminer M76, Whatsminer M78, Whatsminer M79.","html":"Класс 14,5 J/T — стабильность, прогнозируемость, низкая цена входа. Эта группа включает: <a href=\"/calculator/?model=microbt-whatsminer-m70-236-th-s\">Whatsminer M70</a>, <a href=\"/calculator/?model=microbt-whatsminer-m72-246-th-s\">Whatsminer M72</a>, <a href=\"/calculator/?hashrate=260&amp;power=3770\">Whatsminer M73</a>, <a href=\"/calculator/?hashrate=275&amp;power=3988\">Whatsminer M76</a>, <a href=\"/calculator/?hashrate=290&amp;power=4205\">Whatsminer M78</a>, <a href=\"/calculator/?hashrate=300&amp;power=4350\">Whatsminer M79</a>."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'whatsminer-m70-line-review';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 13, 'paragraph',
       $tmj${"text":"Характер модели:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'whatsminer-m70-line-review';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 14, 'list',
       $tmj${"ordered":false,"items":["оптимальный вариант для крупных парков с умеренной стоимостью электроэнергии","высокая надежность при стабильных показателях производительности","отсутствие требований к сложной инфраструктуре","идеальный выбор для тех, кто работает не первый год и ищет баланс в цене и мощности"]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'whatsminer-m70-line-review';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 15, 'paragraph',
       $tmj${"text":"Этот класс можно назвать «рабочей лошадкой» серии — он масштабируется лучше всего и подходит для больших ферм."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'whatsminer-m70-line-review';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 16, 'paragraph',
       $tmj${"text":"Класс 13,5 J/T — золотая середина и оптимизация под дата-центры. В эту группу входят: Whatsminer M70S, Whatsminer M72S, Whatsminer M73S, Whatsminer M76S, Whatsminer M78S, Whatsminer M79S.","html":"Класс 13,5 J/T — золотая середина и оптимизация под дата-центры. В эту группу входят: <a href=\"/calculator/?hashrate=250&amp;power=3375\">Whatsminer M70S</a>, <a href=\"/calculator/?hashrate=260&amp;power=3510\">Whatsminer M72S</a>, <a href=\"/calculator/?hashrate=270&amp;power=3645\">Whatsminer M73S</a>, <a href=\"/calculator/?hashrate=280&amp;power=3780\">Whatsminer M76S</a>, <a href=\"/calculator/?hashrate=290&amp;power=3915\">Whatsminer M78S</a>, <a href=\"/calculator/?hashrate=300&amp;power=4050\">Whatsminer M79S</a>."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'whatsminer-m70-line-review';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 17, 'paragraph',
       $tmj${"text":"Преимущества этого класса:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'whatsminer-m70-line-review';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 18, 'list',
       $tmj${"ordered":false,"items":["энергоэффективность выше","часто используется майнинг-отелями и операторами ЦОД благодаря выгодному соотношению стоимости электроэнергии и производительности","подходит под любые схемы охлаждения"]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'whatsminer-m70-line-review';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 19, 'paragraph',
       $tmj${"text":"Этот класс станет самым массовым благодаря тому, что сочетает высокую экономичность и умеренную цену."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'whatsminer-m70-line-review';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 20, 'paragraph',
       $tmj${"text":"Класс 12,5 J/T — максимальная эффективность на рынке. Топовые модели серии: Whatsminer M70S+, Whatsminer M73S+, Whatsminer M76S+.","html":"Класс 12,5 J/T — максимальная эффективность на рынке. Топовые модели серии: <a href=\"/calculator/?hashrate=250&amp;power=3125\">Whatsminer M70S+</a>, <a href=\"/calculator/?hashrate=270&amp;power=3375\">Whatsminer M73S+</a>, <a href=\"/calculator/?hashrate=290&amp;power=3625\">Whatsminer M76S+</a>."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'whatsminer-m70-line-review';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 21, 'paragraph',
       $tmj${"text":"Задача — обеспечить минимальное потребление на 1 TH при высокой плотности хешрейта. Это прямые конкуренты флагманов Bitmain."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'whatsminer-m70-line-review';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 22, 'paragraph',
       $tmj${"text":"Кому подходит:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'whatsminer-m70-line-review';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 23, 'list',
       $tmj${"ordered":false,"items":["регионам с высокой стоимостью электроэнергии","дата-центрам, работающим с плотным размещением","инвесторам, где важен длительный жизненный цикл оборудования и низкий OPEX"]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'whatsminer-m70-line-review';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 24, 'paragraph',
       $tmj${"text":"Эти устройства показательно демонстрируют технологический скачок MicroBT — впервые Whatsminer достигает показателей, которые ранее были доступны только в моделях Antminer."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'whatsminer-m70-line-review';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 25, 'heading',
       '{"level":2,"text":"Охлаждение: три формата для разных задач"}'::jsonb,
       'cooling'
FROM articles a WHERE a.slug = 'whatsminer-m70-line-review';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 26, 'paragraph',
       $tmj${"text":"Одним из ключевых преимуществ серии M70 стало расширение вариантов размещения. Теперь каждый класс энергоэффективности имеет модели в различных форматах охлаждения."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'whatsminer-m70-line-review';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 27, 'paragraph',
       $tmj${"text":"Воздушное охлаждение, преимущества:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'whatsminer-m70-line-review';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 28, 'list',
       $tmj${"ordered":false,"items":["низкая стоимость внедрения","простота обслуживания","минимальные требования к инфраструктуре","диапазон мощности: 214–300 TH/s"]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'whatsminer-m70-line-review';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 29, 'paragraph',
       $tmj${"text":"Иммерсионное охлаждение, преимущества:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'whatsminer-m70-line-review';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 30, 'list',
       $tmj${"ordered":false,"items":["возможность разгона","снижение уровня шума","высокая плотность размещения","диапазон мощности: 336–522 TH/s"]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'whatsminer-m70-line-review';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 31, 'paragraph',
       $tmj${"text":"Гидроохлаждение, преимущества:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'whatsminer-m70-line-review';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 32, 'list',
       $tmj${"ordered":false,"items":["стабильная работа даже под максимальной нагрузкой","рекордная производительность — до 930–1040 TH/s для M79S","удобство установки в стоечных ЦОД","одна из самых мощных моделей в мире"]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'whatsminer-m70-line-review';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 33, 'heading',
       '{"level":2,"text":"Технологические особенности серии M70"}'::jsonb,
       'tech-features'
FROM articles a WHERE a.slug = 'whatsminer-m70-line-review';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 34, 'paragraph',
       $tmj${"text":"Помимо энергоэффективности и вариантов охлаждения, устройства получили:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'whatsminer-m70-line-review';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 35, 'list',
       $tmj${"ordered":false,"items":["обновленную архитектуру платы, которая лучше отводит тепло и обеспечивает стабильность работы","улучшенную систему питания с защитой от скачков напряжения","модульную конструкцию, упрощающую ремонт","увеличенную плотность чипов нового поколения"]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'whatsminer-m70-line-review';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 36, 'paragraph',
       $tmj${"text":"MicroBT делает ставку на минимизацию потерь и повышение технологической надежности — именно это определяет срок службы асика после халвинга."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'whatsminer-m70-line-review';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 37, 'heading',
       '{"level":2,"text":"Как обновление M70 повлияет на индустрию?"}'::jsonb,
       'industry-impact'
FROM articles a WHERE a.slug = 'whatsminer-m70-line-review';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 38, 'paragraph',
       $tmj${"text":"Новая линейка изменит рынок сразу по нескольким направлениям:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'whatsminer-m70-line-review';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 39, 'list',
       $tmj${"ordered":false,"items":["Усилится конкуренция с Bitmain. Показатели 12,5 J/T позволят MicroBT вернуть позиции на премиальном сегменте, который Bitmain доминировал последние два года.","Растет хешрейт сети Bitcoin. Модели типа M79S фактически заменяют кластеры из 2–3 устройств предыдущих поколений.","Операторы будут ускоренно обновлять парк оборудования. Особенно после роста стоимости электроэнергии в ряде регионов.","Стоимость инфраструктуры снизится. Благодаря высокой мощности на один корпус.","Изменится структура дата-центров. Ставка на плотность заставит площадки переходить на иммерсию или гидру."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'whatsminer-m70-line-review';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 40, 'heading',
       '{"level":2,"text":"Выводы"}'::jsonb,
       'conclusion'
FROM articles a WHERE a.slug = 'whatsminer-m70-line-review';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 41, 'paragraph',
       $tmj${"text":"Новая линейка MicroBT — это не просто очередное обновление, а разворот всей продуктовой стратегии компании."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'whatsminer-m70-line-review';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 42, 'paragraph',
       $tmj${"text":"Серия M70:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'whatsminer-m70-line-review';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 43, 'list',
       $tmj${"ordered":false,"items":["впервые делится по энергоэффективности (14,5 / 13,5 / 12,5 J/T)","предлагает полный набор форматов охлаждения (воздух, иммерсия, гидра)","позволяет операторам выбирать устройства под стоимость электроэнергии","делает упор на минимизацию OPEX","выводит MicroBT на уровень конкуренции с флагманами Bitmain","формирует новую планку плотности хешрейта — до 1 PH/s"]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'whatsminer-m70-line-review';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 44, 'paragraph',
       $tmj${"text":"Это поколение станет фундаментом для майнинговой инфраструктуры на ближайшие 2–3 года и задаст новый вектор развития ASIC-рынка."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'whatsminer-m70-line-review';
