SET client_encoding = 'UTF8';

CREATE TABLE IF NOT EXISTS rating_categories (
    id SERIAL PRIMARY KEY,
    slug TEXT NOT NULL UNIQUE,
    title TEXT NOT NULL,
    columns SMALLINT NOT NULL DEFAULT 1 CHECK (columns IN (1, 2)),
    home_columns SMALLINT CHECK (home_columns IS NULL OR home_columns IN (1, 2)),
    sort_order INT NOT NULL DEFAULT 0,
    is_published BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE IF NOT EXISTS rating_items (
    id SERIAL PRIMARY KEY,
    category_id INT NOT NULL REFERENCES rating_categories (id) ON DELETE CASCADE,
    display_number TEXT NOT NULL,
    label TEXT NOT NULL,
    href TEXT NOT NULL,
    sort_order INT NOT NULL DEFAULT 0,
    is_published BOOLEAN NOT NULL DEFAULT TRUE,
    show_on_home BOOLEAN NOT NULL DEFAULT FALSE,
    home_sort_order INT,
    home_display_number TEXT,
    UNIQUE (category_id, display_number)
);

CREATE INDEX IF NOT EXISTS rating_items_category_sort_idx
    ON rating_items (category_id, sort_order);

CREATE INDEX IF NOT EXISTS rating_items_home_idx
    ON rating_items (category_id, home_sort_order)
    WHERE show_on_home = TRUE;

-- Seed
INSERT INTO rating_categories (slug, title, columns, sort_order) VALUES
  ('equipment', 'ТОП: Техника и оборудование', 1, 1),
  ('tools', 'ТОП: Инструменты и сервисы', 1, 2),
  ('sales', 'ТОП: Продажи и услуги', 1, 3),
  ('crypto', 'ТОП: Криптовалюты и токены', 1, 4)
ON CONFLICT (slug) DO UPDATE SET title = EXCLUDED.title, columns = EXCLUDED.columns, sort_order = EXCLUDED.sort_order;

-- equipment
INSERT INTO rating_items (category_id, display_number, label, href, sort_order)
SELECT c.id, v.display_number, v.label, v.href, v.sort_order
FROM rating_categories c
JOIN (VALUES
  ('01', 'Лучшие асики Antminer: ТОП-10 майнеров от Bitmain в 2026 году', '/articles/luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu', 1),
  ('02', 'Рейтинг майнеров с Wi-Fi: ТОП-3 асика без проводов', '/articles/rejting-majnerov-s-wi-fi-top-3-asika-bez-provodov', 2),
  ('03', 'Рейтинг асиков на Scrypt: ТОП-10 лучших майнеров DOGE', '/articles/rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge', 3),
  ('04', 'Лучшие асики для майнинга альткоинов 2026: ТОП-10 майнеров не для BTC', '/articles/luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc', 4),
  ('05', 'Рейтинг асиков с водяным охлаждением: ТОП-10 майнеров', '/articles/rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov', 5),
  ('06', 'Рейтинг устройств для майнинга: ТОП-6 форматов оборудования по добыче криптовалют', '/articles/rejting-ustrojstv-dlya-majninga-top-6-formatov-oborudovaniya-po-dobyche-kriptovalyut', 6),
  ('07', 'Какие асики выбрать: ТОП-10 производителей оборудования для майнинга', '/articles/kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga', 7),
  ('08', 'Лучшие асики для майнинга в 2026 году: ТОП-10', '/articles/luchshie-asiki-dlya-majninga-v-2024-godu-top-10', 8),
  ('09', 'Рейтинг видеокарт для майнинга в 2026 году: ТОП-10', '/articles/rejting-videokart-dlya-majninga-v-2024-godu-top-10-2', 9),
  ('10', 'Лучшие производители видеокарт: ТОП-10 брендов', '/articles/luchshie-proizvoditeli-videokart-top-10-brendov', 10),
  ('11', 'Рейтинг CPU для майнинга: ТОП-10 процессоров в 2026 году', '/articles/rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu', 11),
  ('12', 'Рейтинг подержанных асиков 2026: ТОП-7 б/у майнеров', '/articles/rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke', 12),
  ('13', 'Самые популярные асики для майнинга: ТОП-8', '/articles/samye-populyarnye-asiki-dlya-majninga-top-5', 13),
  ('14', 'Самый дорогой асик для майнинга в 2026 году: ТОП-5', '/articles/samyj-dorogoj-asik-dlya-majninga-v-2024-godu-top-3', 14),
  ('15', 'Самые мощные асики для майнинга Биткоинов: ТОП-10', '/articles/samye-moshhnye-asiki-dlya-majninga-bitkoinov-v-2024-godu-top-5', 15),
  ('16', 'Самые тихие асики для майнинга в квартире: ТОП-8', '/articles/samyj-tihij-asik-dlya-majninga-v-kvartire-top-5', 16),
  ('17', 'ТОП-5: самые дешевые видеокарты для майнинга в 2026 году', '/articles/top-5-samye-deshevye-videokarty-dlya-majninga-v-2024-godu-rejting-i-czeny', 17),
  ('18', 'ТОП-8 лучших асиков для домашнего майнинга в 2026 году', '/articles/luchshij-asik-dlya-domashnego-majninga-v-2024-godu', 18),
  ('19', 'Рейтинг контейнеров для майнинга в 2026 году: ТОП-9 производителей', '/articles/rejting-kontejnerov-dlya-majninga-top-10', 19),
  ('20', 'Лучшие асики для майнинга Каспы: ТОП-5', '/articles/luchshie-asiki-dlya-majninga-kaspy-top-5', 20),
  ('21', 'Рейтинг шумбоксов: ТОП-5 производителей', '/articles/rejting-shumboksov-top-10-proizvoditelej', 21)
) AS v(display_number, label, href, sort_order) ON c.slug = 'equipment'
ON CONFLICT DO NOTHING;

-- tools
INSERT INTO rating_items (category_id, display_number, label, href, sort_order)
SELECT c.id, v.display_number, v.label, v.href, v.sort_order
FROM rating_categories c
JOIN (VALUES
  ('01', 'Секреты и лайфхаки майнинга на асиках: как выжать максимум из майнеров в 2026 году', '/articles/sekrety-i-lajfhaki-majninga-na-asikah-kak-vyzhat-maksimum-iz-majnerov-v-2025-godu', 1),
  ('02', 'ТОП-10 популярных калькуляторов для майнинга: преимущества и недостатки', '/articles/top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki', 2),
  ('03', 'Лучший холодный кошелек для криптовалюты: ТОП-10', '/articles/luchshij-holodnyj-koshelek-dlya-kriptovalyuty-top-10', 3),
  ('04', 'Лучшие криптобиржи: ТОП-10', '/articles/luchshie-kriptobirzhi-top-10', 4),
  ('05', 'Лучший майнинг отель: ТОП-10 хостингов для майнинга', '/articles/luchshij-majning-otel-top-10-hostingov-dlya-majninga', 5),
  ('06', 'Какой кошелек для криптовалюты выбрать: 10 лучших &#8220;горячих&#8221; хранилищ', '/articles/kakoj-koshelek-dlya-kriptovalyuty-vybrat-10-luchshih-goryachih-hranilishh', 6),
  ('07', 'Лучший пул для майнинга Биткоина в 2026 году для России: ТОП-3', '/articles/luchshij-pul-dlya-majninga-bitkoina-v-2024-godu-dlya-rossii-top-3-3', 7),
  ('08', 'Лучшие пулы для майнинга: ТОП-10', '/articles/luchshie-puly-dlya-majninga-top-10', 8),
  ('09', 'Рейтинг прошивок для асиков: ТОП-5', '/articles/rejting-proshivok-dlya-asikov-top-5', 9),
  ('10', 'ТОП-8 лучших обменников криптовалют в 2026 году', '/articles/rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu', 10),
  ('11', 'Книги про майнинг: ТОП-5 изданий', '/articles/knigi-pro-majning-top-5-izdanij', 11),
  ('12', 'Лучшие каналы о майнинге на youtube: ТОП-10', '/articles/luchshie-kanaly-o-majninge-na-youtube-top-10', 12),
  ('13', 'Лучшие каналы о майнинге в Telegram: ТОП-10', '/articles/luchshie-kanaly-o-majninge-v-telegram-top-10', 13)
) AS v(display_number, label, href, sort_order) ON c.slug = 'tools'
ON CONFLICT DO NOTHING;

-- sales
INSERT INTO rating_items (category_id, display_number, label, href, sort_order)
SELECT c.id, v.display_number, v.label, v.href, v.sort_order
FROM rating_categories c
JOIN (VALUES
  ('01', 'Лучшие майнинговые компании России: ТОП-10 лидеров в сфере продажи и размещения асиков', '/articles/luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov', 1),
  ('02', 'Рейтинг стран по майнингу: ТОП-8 государств-лидеров', '/articles/rejting-stran-po-majningu-top-8-gosudarstv-liderov', 2),
  ('03', 'Где купить асик для майнинга: ТОП-10 магазинов', '/articles/gde-kupit-asik-dlya-majninga-top-10-magazinov', 3),
  ('04', 'ТОП-9 платформ для облачного майнинга: рейтинг 2026 года', '/articles/top-10-platform-dlya-oblachnogo-majninga-rejting-2024-goda-2', 4)
) AS v(display_number, label, href, sort_order) ON c.slug = 'sales'
ON CONFLICT DO NOTHING;

-- crypto
INSERT INTO rating_items (category_id, display_number, label, href, sort_order)
SELECT c.id, v.display_number, v.label, v.href, v.sort_order
FROM rating_categories c
JOIN (VALUES
  ('01', 'Рейтинг алгоритмов майнинга на асиках: ТОП-10', '/articles/rejting-algoritmov-majninga-na-asikah-top-10', 1),
  ('02', 'Майнинг криптовалюты: ТОП-7 лучших монет для добычи в 2026 году', '/articles/majning-kriptovalyuty-rejting-luchshih-monet-dlya-dobychi', 2),
  ('03', 'Лучшая криптовалюта в 2026 году: рейтинг монет для инвестирования', '/articles/luchshaya-kriptovalyuta-v-2024-godu-rejting-monet-dlya-investirovaniya', 3)
) AS v(display_number, label, href, sort_order) ON c.slug = 'crypto'
ON CONFLICT DO NOTHING;

UPDATE rating_categories SET home_columns = 2 WHERE slug IN ('equipment', 'tools');
UPDATE rating_categories SET home_columns = 1 WHERE slug IN ('sales', 'crypto');

UPDATE rating_items i SET show_on_home = TRUE, home_sort_order = v.ord, home_display_number = v.home_num
FROM rating_categories c
JOIN (VALUES
  ('equipment', '07', 1, '01'), ('equipment', '08', 2, '02'), ('equipment', '09', 3, '03'),
  ('equipment', '10', 4, '04'), ('equipment', '11', 5, '05'), ('equipment', '12', 6, '06'),
  ('equipment', '13', 7, '07'), ('equipment', '14', 8, '08'), ('equipment', '15', 9, '09'),
  ('tools', '02', 1, '01'), ('tools', '03', 2, '02'), ('tools', '08', 3, '03'),
  ('tools', '04', 4, '04'), ('tools', '05', 5, '05'), ('tools', '06', 6, '06'),
  ('sales', '03', 1, '01'),
  ('equipment', '17', 10, '02'),
  ('crypto', '02', 1, '01'), ('crypto', '03', 2, '02')
) AS v(cat, disp, ord, home_num) ON c.slug = v.cat
WHERE i.category_id = c.id AND i.display_number = v.disp;
