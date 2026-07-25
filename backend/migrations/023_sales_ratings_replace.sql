-- Продажи и услуги: полный список из 4 рейтингов + флаги главной
SET client_encoding = 'UTF8';

UPDATE rating_items i
SET
    label = v.label,
    href = v.href,
    sort_order = v.sort_order,
    is_published = TRUE,
    show_on_home = TRUE,
    home_sort_order = v.home_ord,
    home_display_number = v.home_num
FROM rating_categories c
JOIN (VALUES
  (
    '01',
    'Лучшие майнинговые компании России: ТОП-10 лидеров в сфере продажи и размещения асиков',
    '/articles/luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov',
    1, 1, '01'
  ),
  (
    '02',
    'Рейтинг стран по майнингу: ТОП-8 государств-лидеров',
    '/articles/rejting-stran-po-majningu-top-8-gosudarstv-liderov',
    2, 2, '02'
  ),
  (
    '03',
    'Где купить асик для майнинга: ТОП-10 магазинов',
    '/articles/gde-kupit-asik-dlya-majninga-top-10-magazinov',
    3, 3, '03'
  ),
  (
    '04',
    'ТОП-9 платформ для облачного майнинга: рейтинг 2026 года',
    '/articles/top-10-platform-dlya-oblachnogo-majninga-rejting-2024-goda-2',
    4, 4, '04'
  )
) AS v(disp, label, href, sort_order, home_ord, home_num) ON c.slug = 'sales'
WHERE i.category_id = c.id
  AND i.display_number = v.disp;

INSERT INTO rating_items (
    category_id, display_number, label, href, sort_order,
    is_published, show_on_home, home_sort_order, home_display_number
)
SELECT
    c.id, v.disp, v.label, v.href, v.sort_order,
    TRUE, TRUE, v.home_ord, v.home_num
FROM rating_categories c
JOIN (VALUES
  (
    '01',
    'Лучшие майнинговые компании России: ТОП-10 лидеров в сфере продажи и размещения асиков',
    '/articles/luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov',
    1, 1, '01'
  ),
  (
    '02',
    'Рейтинг стран по майнингу: ТОП-8 государств-лидеров',
    '/articles/rejting-stran-po-majningu-top-8-gosudarstv-liderov',
    2, 2, '02'
  ),
  (
    '03',
    'Где купить асик для майнинга: ТОП-10 магазинов',
    '/articles/gde-kupit-asik-dlya-majninga-top-10-magazinov',
    3, 3, '03'
  ),
  (
    '04',
    'ТОП-9 платформ для облачного майнинга: рейтинг 2026 года',
    '/articles/top-10-platform-dlya-oblachnogo-majninga-rejting-2024-goda-2',
    4, 4, '04'
  )
) AS v(disp, label, href, sort_order, home_ord, home_num) ON c.slug = 'sales'
WHERE NOT EXISTS (
    SELECT 1
    FROM rating_items i
    WHERE i.category_id = c.id
      AND i.display_number = v.disp
);

-- Убрать с главной старый пункт equipment/17, если он был в блоке продаж
UPDATE rating_items i
SET
    show_on_home = FALSE,
    home_sort_order = NULL,
    home_display_number = NULL
FROM rating_categories c
WHERE i.category_id = c.id
  AND c.slug = 'equipment'
  AND i.display_number = '17'
  AND i.show_on_home = TRUE
  AND i.home_display_number = '02';
