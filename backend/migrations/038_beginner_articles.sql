SET client_encoding = 'UTF8';

-- =====================================================================
-- 038_beginner_articles.sql
-- 4 статьи раздела «Новичкам» 1:1 с production.
-- =====================================================================

INSERT INTO media_assets (path, alt, source)
VALUES
    ('/images/articles/home-mining/cover.jpg', 'Что нужно для майнинга в домашних условиях', 'article_cover'),
    ('/images/articles/home-mining/img-1.jpg', 'Электричество для домашнего майнинга', 'article'),
    ('/images/articles/home-mining/img-2.jpg', 'Борьба с шумом асиков', 'article'),
    ('/images/articles/home-mining/img-3.jpg', 'Программные средства для майнинга', 'article'),
    ('/images/articles/asic-payback/cover.jpg', 'Окупаемость оборудования для майнинга Биткоина', 'article_cover'),
    ('/images/articles/asic-payback/img-1.jpg', 'Факторы окупаемости майнинг оборудования', 'article'),
    ('/images/articles/asic-payback/img-2.jpg', 'Электричество и окупаемость', 'article'),
    ('/images/articles/asic-payback/img-3.jpg', 'ТО и ремонт аппаратуры', 'article'),
    ('/images/articles/asic-payback/img-4.jpg', 'Комплектующие и аксессуары', 'article'),
    ('/images/articles/asic-payback/img-5.jpg', 'Формула окупаемости', 'article'),
    ('/images/articles/how-asics-work/cover.jpg', 'Как работают асики для майнинга', 'article_cover'),
    ('/images/articles/how-asics-work/img-1.jpg', 'Асик — суперкомпьютер', 'article'),
    ('/images/articles/telegram-mining/cover.jpg', 'Майнинг в Телеграмме без вложений', 'article_cover'),
    ('/images/articles/telegram-mining/img-1.jpg', 'Hamster Combat и DOGS', 'article'),
    ('/images/articles/telegram-mining/img-2.jpg', 'BLUM и Catizen', 'article')
ON CONFLICT (path) DO UPDATE SET alt = EXCLUDED.alt;

-- https://top-mining.ru/novichkam/chto-nuzhno-dlya-majninga-kriptovalyuty-v-domashnih-usloviyah/

INSERT INTO articles (
    slug, title, title_subtitle, excerpt, content, topic_id,
    reading_time_min, reading_minutes, published_at, view_count,
    display_type, sort_order, is_published, uses_blocks,
    image_url, image_alt
) VALUES (
    'chto-nuzhno-dlya-majninga-kriptovalyuty-v-domashnih-usloviyah',
    'Что нужно для майнинга криптовалюты',
    'В домашних условиях',
    $excerpt$Оборудование, электричество, охлаждение, шум, интернет и ПО — полный чек-лист для запуска домашней майнинг-фермы.$excerpt$,
    $content$Что нужно для майнинга криптовалюты в домашних условиях: оборудование, электричество, охлаждение, борьба с шумом, интернет и программные средства.$content$,
    'beginners',
    10,
    10,
    '2024-11-12',
    409,
    'list',
    40,
    TRUE,
    TRUE,
    '/images/articles/home-mining/cover.jpg',
    'Что нужно для майнинга в домашних условиях'
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
WHERE a.slug = 'chto-nuzhno-dlya-majninga-kriptovalyuty-v-domashnih-usloviyah'
  AND m.path = '/images/articles/home-mining/cover.jpg';

DELETE FROM article_blocks
WHERE article_id = (SELECT id FROM articles WHERE slug = 'chto-nuzhno-dlya-majninga-kriptovalyuty-v-domashnih-usloviyah');

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 1, 'heading',
       $tmj${"level":2,"text":"Введение"}$tmj$::jsonb,
       'intro'
FROM articles a WHERE a.slug = 'chto-nuzhno-dlya-majninga-kriptovalyuty-v-domashnih-usloviyah';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 2, 'paragraph',
       $tmj${"text":"Добыча криптовалют в жилых помещениях – распространенное явление, которое актуально с момента запуска блокчейна BTC и до сегодняшнего дня. Для кого-то – это отличная возможность познакомиться с технологией, чтобы затем инвестировать в промышленный формат. А для некоторых – способ дополнительного или даже основного заработка, который при правильной реализации формата может оказаться весьма существенным. Но какие бы задачи вы не преследовали, знать принципы такой работы необходимо. Поэтому мы подробно расскажем о том, что нужно для майнинга криптовалюты в домашних условиях и как запустить ферму в жилом помещении."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'chto-nuzhno-dlya-majninga-kriptovalyuty-v-domashnih-usloviyah';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 3, 'image',
       $tmj${"src":"/images/articles/home-mining/cover.jpg","alt":"Домашний майнинг криптовалюты"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'chto-nuzhno-dlya-majninga-kriptovalyuty-v-domashnih-usloviyah';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 4, 'heading',
       $tmj${"level":2,"text":"Первое, что нужно для домашнего майнинга – оборудование"}$tmj$::jsonb,
       'hardware'
FROM articles a WHERE a.slug = 'chto-nuzhno-dlya-majninga-kriptovalyuty-v-domashnih-usloviyah';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 5, 'paragraph',
       $tmj${"text":"Классическая добыча криптовалют в рамках принципа Proof of Work (PoW) предполагает запуск физической техники (исключением является облачный формат, который мы проанализируем далее). На текущий момент для работы в жилых помещениях можно использовать четыре типа техники:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'chto-nuzhno-dlya-majninga-kriptovalyuty-v-domashnih-usloviyah';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 6, 'list',
       $tmj${"ordered":false,"items":["Процессоры. Именно с CPU началась история добычи цифровых активов в 2009 году – первый блок BTC был получен с помощью процессоров. Сегодня взаимодействие с сетью Биткоина на CPU невозможно, так как сложность добычи значительно увеличилась и мощности ЦП недостаточно. Однако с помощью такой аппаратуры можно добывать некоторые альткоины, например, Monero (XMR), Veruscoin (VRSC), Zephyr (ZEPH), Yadacoin (YDA), Spectre Network (SPR), Xelis (XEL), Tuske (TSK). Процессоры не потребляют много энергии, они бесшумны в работе и не выделяют большой объем тепла;","Видеокарты. Через несколько лет после запуска криптовалютной индустрии к процессу добычи подключились видеокарты. Легендарным форматом работы на GPU является майнинг Эфириума, однако осенью 2022 года данный актив совершил переезд на технологию PoS (Proof of Stake), что сделало вычисление на картах невозможным. Теперь ETH получают с помощью механизма стейкинга (похожего на банковские вклады), а GPU применяются для взаимодействия с другими токенами – Grin (GRIN), Ravencoin (RVN), Skydog (SKYDOG), Zano (ZANO), Nexa (NEXA), Gram (GRAM), Flux (FLUX), Bitcoin Gold (BTG), Ergo (ERG), Ethereum Classic (ETC) и т.д. Преимущества сравнимы с процессорами, но стоимость видеокарт значительно выше;","Классические асики стандартной конструкции. Речь идет о привычных устройствах, с помощью которых можно добывать как BTC, так и многие другие монеты, например, Litecoin (LTC), Dogecoin (DOGE), Kaspa (KAS), Sedra (SDR), Bugna (BGA), Ethereum Classic (ETC), Kadena (KDA). Это шумные и «горячие» устройства, потребляющие большой объем электричества. Комфортный запуск в жилых помещениях возможен лишь при соблюдении ряда условий – их мы рассмотрим далее;","Домашние асики для майнинга альткоинов. Тренд, зародившийся в 2024 году, был инициирован в качестве замены CPU и GPU. Создатели такой техники предоставили возможность комфортной работы в жилых помещениях, но с большей доходностью при сравнении с процессорами и видеокартами. Такие майнеры можно запускать в квартире без дополнительного оснащения: при этом обеспечивается беспрепятственное соседство жильцов и сохранение тишины в помещении."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'chto-nuzhno-dlya-majninga-kriptovalyuty-v-domashnih-usloviyah';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 7, 'paragraph',
       $tmj${"text":"Существует формат добычи криптовалют без оборудования: это выбор облачных сервисов, в рамках которых инвестор берет в аренду мощности владельца аппаратуры."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'chto-nuzhno-dlya-majninga-kriptovalyuty-v-domashnih-usloviyah';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 8, 'paragraph',
       $tmj${"text":"Такой принцип также отлично подходит для реализации в жилых помещениях, так как приобретения асиков и их запуска не требуется. Однако подобный подход нельзя считать привычным форматом майнинга: правильнее говорить о пассивных инвестициях в цифровые активы."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'chto-nuzhno-dlya-majninga-kriptovalyuty-v-domashnih-usloviyah';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 9, 'heading',
       $tmj${"level":2,"text":"Второй компонент – электричество"}$tmj$::jsonb,
       'power'
FROM articles a WHERE a.slug = 'chto-nuzhno-dlya-majninga-kriptovalyuty-v-domashnih-usloviyah';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 10, 'paragraph',
       $tmj${"text":"Классические асики обладают важной технической особенностью – внушительный объем потребляемого тока. Речь идет о 3,5 кВт для отдельно взятого устройства, что может быть критичным в ряде случаев:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'chto-nuzhno-dlya-majninga-kriptovalyuty-v-domashnih-usloviyah';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 11, 'list',
       $tmj${"ordered":false,"items":["Лимиты некоторых квартир ограничены 5 кВт, что исключает запуск майнеров и одновременное проживание;","Серьезные требования имеются к проводке и автоматическим выключателям: всегда существует угроза пожара, если в квартире устаревшие розетки и тонкий кабель;","Исключен формат запуска фермы в составе трех и более асиков."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'chto-nuzhno-dlya-majninga-kriptovalyuty-v-domashnih-usloviyah';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 12, 'image',
       $tmj${"src":"/images/articles/home-mining/img-1.jpg","alt":"Электричество для домашнего майнинга"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'chto-nuzhno-dlya-majninga-kriptovalyuty-v-domashnih-usloviyah';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 13, 'paragraph',
       $tmj${"text":"Отметим появление в РФ законодательства, регулирующего процесс добычи цифровых активов."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'chto-nuzhno-dlya-majninga-kriptovalyuty-v-domashnih-usloviyah';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 14, 'paragraph',
       $tmj${"text":"С 2024 года частным лицам ограничили лимиты электроэнергии до 6 000 кВт⋅ч в месяц. Это всего 8,3 кВт в час, что эквивалентно только двум асикам с потреблением около 3,5 кВт. Если мощности превышают данные значения, для продолжения легальной работы придется оформить ИП (или юридическое лицо), а также оказаться в профильном реестре, выплачивая налоги. В качестве альтернативы можно выбрать видеокарты, процессоры или асики для использования в жилых помещениях – потребление данного типа техники значительно меньше."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'chto-nuzhno-dlya-majninga-kriptovalyuty-v-domashnih-usloviyah';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 15, 'heading',
       $tmj${"level":2,"text":"Третье, что нужно для майнинга криптовалюты в домашних условиях – охлаждение"}$tmj$::jsonb,
       'cooling'
FROM articles a WHERE a.slug = 'chto-nuzhno-dlya-majninga-kriptovalyuty-v-domashnih-usloviyah';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 16, 'paragraph',
       $tmj${"text":"Еще одна техническая особенность оборудования для работы с криптовалютами – серьезная теплоотдача. При использовании небольшого количества карт и процессоров проблема обладает минимальной актуальностью, но при запуске полноценного рига или классического асика задачу отвода тепла придется решать предельно оперативно."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'chto-nuzhno-dlya-majninga-kriptovalyuty-v-domashnih-usloviyah';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 17, 'paragraph',
       $tmj${"text":"В квартирах и других жилых помещениях можно организовать прямой вывод воздуха на улицу через окно или балконную дверь."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'chto-nuzhno-dlya-majninga-kriptovalyuty-v-domashnih-usloviyah';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 18, 'paragraph',
       $tmj${"text":"Также существует формат с нагревом водопроводной воды или отопления жилой площади: подобный принцип популярен в Сибири, однако требует дополнительных технических изысканий и вложения средств на переоборудование фермы."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'chto-nuzhno-dlya-majninga-kriptovalyuty-v-domashnih-usloviyah';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 19, 'heading',
       $tmj${"level":2,"text":"Элемент номер четыре – борьба с шумом"}$tmj$::jsonb,
       'noise'
FROM articles a WHERE a.slug = 'chto-nuzhno-dlya-majninga-kriptovalyuty-v-domashnih-usloviyah';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 20, 'paragraph',
       $tmj${"text":"Пожалуй, самая серьезная проблема, с которой сталкиваются владельцы классических асиков при работе в квартире – это высокий уровень шума. Сравнить работу майнера можно с запуском мощного промышленного пылесоса. Ощутить подобный недостаток смогут не только жители квартиры, но и все соседи, что является ощутимым препятствием для подобного формата заработка."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'chto-nuzhno-dlya-majninga-kriptovalyuty-v-domashnih-usloviyah';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 21, 'paragraph',
       $tmj${"text":"Существует два способа решения проблемы:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'chto-nuzhno-dlya-majninga-kriptovalyuty-v-domashnih-usloviyah';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 22, 'list',
       $tmj${"ordered":false,"items":["Размещение асика в профильном шумбоксе, способном снизить уровень шума приблизительно в 2 раза;","Погружение майнера в иммерсионные ванны и перенаправление тепла от фермы на отопление помещений. Данный принцип уже назывался нами ранее: его реализация актуальна в том числе и для борьбы с шумом."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'chto-nuzhno-dlya-majninga-kriptovalyuty-v-domashnih-usloviyah';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 23, 'image',
       $tmj${"src":"/images/articles/home-mining/img-2.jpg","alt":"Борьба с шумом асиков"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'chto-nuzhno-dlya-majninga-kriptovalyuty-v-domashnih-usloviyah';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 24, 'paragraph',
       $tmj${"text":"Оба формата связаны с дополнительными тратами, однако вариант с шумбоксом будет стоить значительно меньше водяного охлаждения."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'chto-nuzhno-dlya-majninga-kriptovalyuty-v-domashnih-usloviyah';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 25, 'paragraph',
       $tmj${"text":"При использовании подобного дополнения следует помнить о дополнительных рисках: это сохранение комфортного температурного режима, а также минимизация вероятности возгорания майнера."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'chto-nuzhno-dlya-majninga-kriptovalyuty-v-domashnih-usloviyah';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 26, 'heading',
       $tmj${"level":2,"text":"Пятое, что нужно для домашнего майнинга – Интернет"}$tmj$::jsonb,
       'internet'
FROM articles a WHERE a.slug = 'chto-nuzhno-dlya-majninga-kriptovalyuty-v-domashnih-usloviyah';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 27, 'paragraph',
       $tmj${"text":"Любая техника для добычи криптовалют функционирует онлайн с необходимостью организации устойчивого доступа к сети Интернет. Но в случае с запуском в жилых помещениях задача легко выполнима, так как практически каждый дом или жилой комплекс подключен к одному или нескольким провайдерам."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'chto-nuzhno-dlya-majninga-kriptovalyuty-v-domashnih-usloviyah';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 28, 'paragraph',
       $tmj${"text":"В качестве альтернативы можно выбрать классическое мобильное соединение: 3G или 4G достаточно для качественной работы фермы."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'chto-nuzhno-dlya-majninga-kriptovalyuty-v-domashnih-usloviyah';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 29, 'paragraph',
       $tmj${"text":"А вместо роутера можно задействовать обычный мобильный телефон: достаточно включить режим раздачи. Что касается параметров подключения, здесь требования также минимальны: скорость 10-12 кб/сек на каждое устройство, пинг – до 50-60 миллисекунд, объемы трафика – не более 1 Гб."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'chto-nuzhno-dlya-majninga-kriptovalyuty-v-domashnih-usloviyah';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 30, 'heading',
       $tmj${"level":2,"text":"Пункт №6: Совокупность программных средств"}$tmj$::jsonb,
       'software'
FROM articles a WHERE a.slug = 'chto-nuzhno-dlya-majninga-kriptovalyuty-v-domashnih-usloviyah';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 31, 'paragraph',
       $tmj${"text":"Что еще нужно для майнинга криптовалюты в домашних условиях? Отметим несколько программных решений, позволяющих запустить процесс и обеспечить комфортную работу с полученным активом:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'chto-nuzhno-dlya-majninga-kriptovalyuty-v-domashnih-usloviyah';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 32, 'list',
       $tmj${"ordered":false,"items":["Пул. Менее 1% участников процесса работают с блокчейном в формате «соло», остальные выбирают добычу с помощью профильных сервисов – пулов. На одном из таких ресурсов необходимо создать учетную запись, получить параметры подключения и указать их в панели администратора вашего майнера;","Профиль на бирже или обменном сервисе. Это необходимо для вывода средств с помощью платежных сервисов или системы P2P;","Новые прошивки для майнеров. Благодаря такому ПО достигаются увеличенные объемы производительности, а также снижается энергопотребление. Однако к выбору стороннего обновления необходимо подходить с повышенным вниманием: некачественный софт может стать причиной поломки асика, не говоря уже о вероятности кражи средств;","Программы удаленного контроля. Управление фермой на расстоянии, фиксация рабочих температур, возможность экстренного отключения – все эти задачи могут быть решены с помощью стороннего ПО."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'chto-nuzhno-dlya-majninga-kriptovalyuty-v-domashnih-usloviyah';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 33, 'image',
       $tmj${"src":"/images/articles/home-mining/img-3.jpg","alt":"Программные средства для майнинга"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'chto-nuzhno-dlya-majninga-kriptovalyuty-v-domashnih-usloviyah';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 34, 'heading',
       $tmj${"level":2,"text":"Выводы"}$tmj$::jsonb,
       'conclusion'
FROM articles a WHERE a.slug = 'chto-nuzhno-dlya-majninga-kriptovalyuty-v-domashnih-usloviyah';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 35, 'paragraph',
       $tmj${"text":"Что нужно для майнинга криптовалюты в домашних условиях? Перечень состоит из шести элементов:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'chto-nuzhno-dlya-majninga-kriptovalyuty-v-domashnih-usloviyah';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 36, 'rich_list',
       $tmj${"ordered":true,"items":[{"title":"Оборудование","text":"процессор, видеокарта, классический асик или майнер для дома;"},{"title":"Электричество","text":""},{"title":"Охлаждение","text":""},{"title":"Реализация способа борьбы с шумом","text":""},{"title":"Интернет","text":""},{"title":"Совокупность программных средств","text":""}]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'chto-nuzhno-dlya-majninga-kriptovalyuty-v-domashnih-usloviyah';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 37, 'paragraph',
       $tmj${"text":"Однако важно помнить, что даже самая основательная подготовка не позволит превратить домашнюю ферму в полноценный инструмент инвестирования. Для достижения амбициозных целей потребуется профильное помещение или отправка аппаратуры на профессиональную площадку."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'chto-nuzhno-dlya-majninga-kriptovalyuty-v-domashnih-usloviyah';

-- https://top-mining.ru/novichkam/oborudovanie-dlya-majninga-bitkoina-kak-pravilno-schitat-okupaemost/

INSERT INTO articles (
    slug, title, title_subtitle, excerpt, content, topic_id,
    reading_time_min, reading_minutes, published_at, view_count,
    display_type, sort_order, is_published, uses_blocks,
    image_url, image_alt
) VALUES (
    'oborudovanie-dlya-majninga-bitkoina-kak-pravilno-schitat-okupaemost',
    'Оборудование для майнинга Биткоина',
    'Как правильно считать окупаемость?',
    $excerpt$Формула ROI майнинг-оборудования: стоимость техники, электричество, аренда, ТО, интернет, аксессуары и комиссии.$excerpt$,
    $content$Чистый доход в майнинге – выручка за вычетом всех трат. Разбираем, как правильно считать окупаемость оборудования для майнинга Биткоина.$content$,
    'beginners',
    10,
    10,
    '2024-11-20',
    432,
    'list',
    41,
    TRUE,
    TRUE,
    '/images/articles/asic-payback/cover.jpg',
    'Окупаемость оборудования для майнинга Биткоина'
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
WHERE a.slug = 'oborudovanie-dlya-majninga-bitkoina-kak-pravilno-schitat-okupaemost'
  AND m.path = '/images/articles/asic-payback/cover.jpg';

DELETE FROM article_blocks
WHERE article_id = (SELECT id FROM articles WHERE slug = 'oborudovanie-dlya-majninga-bitkoina-kak-pravilno-schitat-okupaemost');

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 1, 'heading',
       $tmj${"level":2,"text":"Введение"}$tmj$::jsonb,
       'intro'
FROM articles a WHERE a.slug = 'oborudovanie-dlya-majninga-bitkoina-kak-pravilno-schitat-okupaemost';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 2, 'paragraph',
       $tmj${"text":"Чистый доход в майнинге – это размер выручки за вычетом всех трат, включая бюджет на покупку техники, оплату счетов за электричество, приобретение комплектующих и техническое обслуживание юнитов. Именно так считается окупаемость майнинг оборудования при добыче Биткоина и любых других криптовалют. Познакомимся с процессом грамотного подсчета на основе всех параметров данной формулы: узнаем, что такое «точка ноль» и что следует знать при анализе доходности аппаратуры."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'oborudovanie-dlya-majninga-bitkoina-kak-pravilno-schitat-okupaemost';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 3, 'heading',
       $tmj${"level":2,"text":"Какие факторы влияют на окупаемость майнинг оборудования?"}$tmj$::jsonb,
       'factors'
FROM articles a WHERE a.slug = 'oborudovanie-dlya-majninga-bitkoina-kak-pravilno-schitat-okupaemost';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 4, 'paragraph',
       $tmj${"text":"Самая простая формула состоит из двух переменных: выручка (цена актива, полученного в результате работы техники) и расходная часть. И если в случае с первым компонентом метрики понятны (размеры выручки можно найти в панели управления пула), то расходная составляющая объединяет сразу несколько параметров:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'oborudovanie-dlya-majninga-bitkoina-kak-pravilno-schitat-okupaemost';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 5, 'rich_list',
       $tmj${"ordered":true,"items":[{"title":"Стоимость майнеров","text":""},{"title":"Счета за электричество","text":""},{"title":"Аренда площадей для размещения","text":""},{"title":"Обслуживание техники","text":""},{"title":"Абонентская плата за Интернет","text":""},{"title":"Приобретение комплектующих и аксессуаров","text":""},{"title":"Комиссия сервисов","text":""}]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'oborudovanie-dlya-majninga-bitkoina-kak-pravilno-schitat-okupaemost';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 6, 'image',
       $tmj${"src":"/images/articles/asic-payback/img-1.jpg","alt":"Факторы окупаемости майнинг оборудования"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'oborudovanie-dlya-majninga-bitkoina-kak-pravilno-schitat-okupaemost';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 7, 'paragraph',
       $tmj${"text":"Для формирования более детального представления проанализируем каждую статью, чтобы определить заветную «точку ноль», а затем рассчитать окупаемость оборудования для майнинга Биткоина."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'oborudovanie-dlya-majninga-bitkoina-kak-pravilno-schitat-okupaemost';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 8, 'paragraph',
       $tmj${"text":"Ведь именно срок возврата инвестиций (время, необходимое для того, чтобы компенсировать затраты) является одной из ключевых метрик инвестирования. Данное значение получило название ROI – return on investment, что можно перевести с английского как «возврат инвестиций»."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'oborudovanie-dlya-majninga-bitkoina-kak-pravilno-schitat-okupaemost';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 9, 'heading',
       $tmj${"level":2,"text":"Статья расходов №1: стоимость фермы и окупаемость майнинг оборудования"}$tmj$::jsonb,
       'cost-hardware'
FROM articles a WHERE a.slug = 'oborudovanie-dlya-majninga-bitkoina-kak-pravilno-schitat-okupaemost';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 10, 'paragraph',
       $tmj${"text":"Первая статья – это бюджеты на приобретение аппаратуры. Вне зависимости от класса майнеров (процессоры, видеокарты, асики домашнего или классического формата), инвестиции в добычу цифровых активов требуют наличия ощутимых бюджетов."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'oborudovanie-dlya-majninga-bitkoina-kak-pravilno-schitat-okupaemost';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 11, 'paragraph',
       $tmj${"text":"Стоимость одного асика может составлять от 300 000 до 3 000 000 рублей: цена зависит от мощности, энергоэффективности и типа добываемой валюты."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'oborudovanie-dlya-majninga-bitkoina-kak-pravilno-schitat-okupaemost';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 12, 'paragraph',
       $tmj${"text":"Покупка видеокарты или процессора обойдется значительно дешевле, но и доходность такой фермы будет заметно ниже. А если инвестор планирует задействовать не один юнит, а сразу несколько, бюджеты на покупку кратно увеличиваются. Как можно повлиять на цену аппаратуры? Существует несколько доступных форматов:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'oborudovanie-dlya-majninga-bitkoina-kak-pravilno-schitat-okupaemost';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 13, 'list',
       $tmj${"ordered":false,"items":["Покупка у крупного продавца, который напрямую закупает асики или карты у производителя. Цены в таких магазинах могут быть ниже за счет реализуемых объемов;","Приобретение нескольких майнеров обходится дешевле, так как многие поставщики предоставляют оптовые скидки;","Совершение сделки в благоприятный период времени. Когда криптовалютный рынок находится в медвежьем цикле – это лучший вариант покупки, так как стоимость техники значительно ниже (при сравнении с пиковыми значениями бычьего тренда);","Покупка не новой, а подержанной техники. Если удастся найти достойное предложение, это вполне может стать отличным вариантом сделки с ощутимой скидкой. Однако о рисках работы на б/у-майнерах тоже забывать не следует."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'oborudovanie-dlya-majninga-bitkoina-kak-pravilno-schitat-okupaemost';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 14, 'paragraph',
       $tmj${"text":"Выбирая технику, учитывайте циклы халвингов: если покупка совершается незадолго до этого события, доходность станет значительно ниже, как только произойдет сокращение объема наград."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'oborudovanie-dlya-majninga-bitkoina-kak-pravilno-schitat-okupaemost';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 15, 'paragraph',
       $tmj${"text":"Следует проанализировать предложения сразу нескольких продавцов, а также проследить за историческими трендами. Это позволит совершить оптимальный вход в рынок с наибольшей вероятностью успеха."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'oborudovanie-dlya-majninga-bitkoina-kak-pravilno-schitat-okupaemost';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 16, 'heading',
       $tmj${"level":2,"text":"Статья расходов №2: электричество и окупаемость оборудования для майнинга Биткоина"}$tmj$::jsonb,
       'cost-power'
FROM articles a WHERE a.slug = 'oborudovanie-dlya-majninga-bitkoina-kak-pravilno-schitat-okupaemost';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 17, 'paragraph',
       $tmj${"text":"Вторым по величине направлением являются платежи за электроэнергию. Дело в том, что фермы для вычисления цифровых активов отличаются большим объемом потребления тока: от 2 000 до 11 000 Вт. Соответственно, чем дороже розетка, тем менее ощутимой окажется чистая прибыль. Для сравнения можно проанализировать сумму ежемесячных трат на оплату счетов за электричество в разных регионах России. В качестве ориентира используем асик Antminer T21 на 190 TH/s и потребляемой мощностью 3 610 Вт:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'oborudovanie-dlya-majninga-bitkoina-kak-pravilno-schitat-okupaemost';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 18, 'list',
       $tmj${"ordered":false,"items":["Иркутская область: 1,58 ₽ за кВт⋅ч. Платеж в месяц – 4 102,59 ₽.","Москва: 6,43 ₽ за кВт⋅ч. Платеж в месяц – 16 695,99 ₽."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'oborudovanie-dlya-majninga-bitkoina-kak-pravilno-schitat-okupaemost';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 19, 'image',
       $tmj${"src":"/images/articles/asic-payback/img-2.jpg","alt":"Электричество и окупаемость"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'oborudovanie-dlya-majninga-bitkoina-kak-pravilno-schitat-okupaemost';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 20, 'paragraph',
       $tmj${"text":"Стоимость розетки пропорционально сокращает размер выручки, что негативным образом влияет на чистую доходность."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'oborudovanie-dlya-majninga-bitkoina-kak-pravilno-schitat-okupaemost';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 21, 'paragraph',
       $tmj${"text":"Ключевая задача любого инвестора – найти локацию с максимально дешевым электричеством. Ведь от этого во многом зависит скорость достижения «точки ноль» и срок возврата инвестиций."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'oborudovanie-dlya-majninga-bitkoina-kak-pravilno-schitat-okupaemost';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 22, 'heading',
       $tmj${"level":2,"text":"Статья расходов №3: плата за помещение"}$tmj$::jsonb,
       'rent'
FROM articles a WHERE a.slug = 'oborudovanie-dlya-majninga-bitkoina-kak-pravilno-schitat-okupaemost';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 23, 'paragraph',
       $tmj${"text":"Если в собственности майнера нет локации, подходящей для добычи цифровых активов, помещение необходимо арендовать. Это дополнительные траты, размер которых зависит от ряда параметров:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'oborudovanie-dlya-majninga-bitkoina-kak-pravilno-schitat-okupaemost';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 24, 'list',
       $tmj${"ordered":false,"items":["Тарифы на электричество;","Потенциал розетки (лимиты);","Состояние помещения;","Наличие системы охлаждения;","Охрана и комплекс защитных мер;","Удаленность от города."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'oborudovanie-dlya-majninga-bitkoina-kak-pravilno-schitat-okupaemost';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 25, 'paragraph',
       $tmj${"text":"Вне зависимости от формата использования площадей (аренда или полноценная покупка), данные инвестиции также следует учитывать во время подсчета окупаемости майнинг оборудования."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'oborudovanie-dlya-majninga-bitkoina-kak-pravilno-schitat-okupaemost';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 26, 'heading',
       $tmj${"level":2,"text":"Направление №4: ТО и ремонт аппаратуры"}$tmj$::jsonb,
       'service'
FROM articles a WHERE a.slug = 'oborudovanie-dlya-majninga-bitkoina-kak-pravilno-schitat-okupaemost';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 27, 'paragraph',
       $tmj${"text":"Жизненный цикл фермы зависит от качества и периодичности проведения технического обслуживания майнеров. Сравнить концепцию можно с владением автомобиля – своевременная диагностика, слежение за техническим состоянием и замена комплектующих способны в значительной степени продлить период бесперебойной работы. Каким именно процессам следует уделить внимание:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'oborudovanie-dlya-majninga-bitkoina-kak-pravilno-schitat-okupaemost';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 28, 'list',
       $tmj${"ordered":false,"items":["Удаление пыли с вентиляторов и плат;","Проверка состояния чипов;","Диагностика эффективности системы охлаждения;","Замена проводки в случае необходимости."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'oborudovanie-dlya-majninga-bitkoina-kak-pravilno-schitat-okupaemost';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 29, 'image',
       $tmj${"src":"/images/articles/asic-payback/img-3.jpg","alt":"ТО и ремонт аппаратуры"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'oborudovanie-dlya-majninga-bitkoina-kak-pravilno-schitat-okupaemost';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 30, 'paragraph',
       $tmj${"text":"Отдельно следует назвать проведение ремонтных работ, так как заводской брак и неправильные условия эксплуатации устройств могут привести к поломкам."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'oborudovanie-dlya-majninga-bitkoina-kak-pravilno-schitat-okupaemost';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 31, 'paragraph',
       $tmj${"text":"Например, замена блока питания может обойтись в 1/5 от стоимости самого асика – это именно тот компонент, который чаще остальных выходит из строя."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'oborudovanie-dlya-majninga-bitkoina-kak-pravilno-schitat-okupaemost';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 32, 'heading',
       $tmj${"level":2,"text":"Статья расходов №5: оплата услуг Интернет-провайдера"}$tmj$::jsonb,
       'internet'
FROM articles a WHERE a.slug = 'oborudovanie-dlya-majninga-bitkoina-kak-pravilno-schitat-okupaemost';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 33, 'paragraph',
       $tmj${"text":"В общей массе объем платежей незначительный, однако подобные суммы все же следует включить в план окупаемости майнинг оборудования. Финальная стоимость зависит от провайдера и качественных параметров подключения (трафик, скорость, пинг)."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'oborudovanie-dlya-majninga-bitkoina-kak-pravilno-schitat-okupaemost';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 34, 'heading',
       $tmj${"level":2,"text":"Расходы №6: комплектующие и аксессуары"}$tmj$::jsonb,
       'accessories'
FROM articles a WHERE a.slug = 'oborudovanie-dlya-majninga-bitkoina-kak-pravilno-schitat-okupaemost';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 35, 'paragraph',
       $tmj${"text":"Индивидуальная статья расходов, состав которой зависит от условий запуска фермы, целей инвестора и типа используемой аппаратуры. Рассмотрим основные варианты:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'oborudovanie-dlya-majninga-bitkoina-kak-pravilno-schitat-okupaemost';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 36, 'list',
       $tmj${"ordered":false,"items":["Техника для организации устойчивого Интернет-соединения: модемы, роутеры, усилители сигнала, кабель, разветвители и т.д.;","Стабилизатор напряжения для локаций с неустойчивым питанием. Чтобы сохранить БП майнера, необходимо обеспечить стабильное напряжение в сети. Подобная задача решается при помощи покупки стабилизатора – стоимость некоторых моделей сравнима с ценой одного или даже нескольких майнеров;","Шумбокс. Если асики располагаются в жилом помещении, необходимо снизить уровень шума до приемлемых значений. Именно для этих целей используются специальные боксы, способные заглушить гул и сделать соседство с фермой более комфортным;","Комплектующие для организации системы удаленного контроля и управления. Это могут быть умные розетки, датчики, ноутбуки и прочие аксессуары;","Охранный комплекс и система защиты. Среди факторов угрозы – действия злоумышленников (кражи), а также вероятность возгорания устройств. Здесь используются охранные сигнализации, камеры видеонаблюдения, а также системы автоматического пожаротушения."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'oborudovanie-dlya-majninga-bitkoina-kak-pravilno-schitat-okupaemost';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 37, 'image',
       $tmj${"src":"/images/articles/asic-payback/img-4.jpg","alt":"Комплектующие и аксессуары"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'oborudovanie-dlya-majninga-bitkoina-kak-pravilno-schitat-okupaemost';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 38, 'paragraph',
       $tmj${"text":"Каждый из приведенных элементов требует дополнительных бюджетов на запуск фермы. При этом необходимость в покупке комплектующих может возникнуть уже после начала работы."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'oborudovanie-dlya-majninga-bitkoina-kak-pravilno-schitat-okupaemost';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 39, 'paragraph',
       $tmj${"text":"Например, после нескольких дней или недель с момента старта майнер может обнаружить нестабильную работу фермы из-за скачков напряжения. Решение – покупка стабилизатора."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'oborudovanie-dlya-majninga-bitkoina-kak-pravilno-schitat-okupaemost';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 40, 'heading',
       $tmj${"level":2,"text":"Статья расходов №7: комиссии сервисов и окупаемость майнинг оборудования"}$tmj$::jsonb,
       'fees'
FROM articles a WHERE a.slug = 'oborudovanie-dlya-majninga-bitkoina-kak-pravilno-schitat-okupaemost';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 41, 'paragraph',
       $tmj${"text":"Финальная совокупность затрат основывается на комиссионных отчислениях сервисам, которые задействованы в процессе. Об этом часто забывают многие инвесторы, однако размеры платежей могут оказаться существенными. Среди возможных примеров:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'oborudovanie-dlya-majninga-bitkoina-kak-pravilno-schitat-okupaemost';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 42, 'list',
       $tmj${"ordered":false,"items":["Комиссия пула за использование сервиса совместной добычи (от 0% до 4%, в зависимости от формата распределения наград и особенностей сервиса);","Комиссии за вывод средств с пула;","Торговые комиссии при совершении обмена на платформе (например, конвертация BTC в USDT);","Вознаграждение площадки за предоставление механизмов вывода (например, система P2P)."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'oborudovanie-dlya-majninga-bitkoina-kak-pravilno-schitat-okupaemost';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 43, 'paragraph',
       $tmj${"text":"В конечном итоге импортируемая с пула сумма может стать меньше, так как по маршруту следования актива каждый участник процесса требует свое вознаграждение."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'oborudovanie-dlya-majninga-bitkoina-kak-pravilno-schitat-okupaemost';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 44, 'heading',
       $tmj${"level":2,"text":"Формула окупаемости майнинг оборудования"}$tmj$::jsonb,
       'formula'
FROM articles a WHERE a.slug = 'oborudovanie-dlya-majninga-bitkoina-kak-pravilno-schitat-okupaemost';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 45, 'paragraph',
       $tmj${"text":"После анализа всех факторов, рассмотренных выше, можно представить универсальную формулу расчета чистой доходности в сегменте добычи цифровых активов:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'oborudovanie-dlya-majninga-bitkoina-kak-pravilno-schitat-okupaemost';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 46, 'paragraph',
       $tmj${"text":"S = P – (H + E + R + T + I + A + C)"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'oborudovanie-dlya-majninga-bitkoina-kak-pravilno-schitat-okupaemost';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 47, 'list',
       $tmj${"ordered":false,"items":["S – чистая прибыль;","P – выручка;","H – стоимость техники;","E – электричество;","R – арендная плата за помещение;","T – стоимость ремонта и технического обслуживания;","I – оплата Интернета;","A – стоимость аксессуаров и комплектующих;","C – комиссии."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'oborudovanie-dlya-majninga-bitkoina-kak-pravilno-schitat-okupaemost';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 48, 'image',
       $tmj${"src":"/images/articles/asic-payback/img-5.jpg","alt":"Формула окупаемости"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'oborudovanie-dlya-majninga-bitkoina-kak-pravilno-schitat-okupaemost';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 49, 'paragraph',
       $tmj${"text":"Как только совокупное значение «P» сравняется с суммой «H + E + R + T + I + A + C», можно говорить о полном возврате вложенных инвестиций."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'oborudovanie-dlya-majninga-bitkoina-kak-pravilno-schitat-okupaemost';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 50, 'paragraph',
       $tmj${"text":"Это ROI или желанная «точка ноль», которая свидетельствует о том, что с текущего момента бизнес будет приносить чистый доход."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'oborudovanie-dlya-majninga-bitkoina-kak-pravilno-schitat-okupaemost';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 51, 'heading',
       $tmj${"level":2,"text":"Выводы"}$tmj$::jsonb,
       'conclusion'
FROM articles a WHERE a.slug = 'oborudovanie-dlya-majninga-bitkoina-kak-pravilno-schitat-okupaemost';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 52, 'paragraph',
       $tmj${"text":"Окупаемость оборудования для майнинга Биткоина считается с привлечением сразу нескольких расходных параметров и значений выручки. Существует два варианта точного анализа – ручной расчет по формуле выше или использование профессионального калькулятора майнинга. Этот инструмент позволяет сократить время и получить искомое значение всего за несколько кликов."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'oborudovanie-dlya-majninga-bitkoina-kak-pravilno-schitat-okupaemost';

-- https://top-mining.ru/novichkam/kak-rabotayut-asiki-dlya-majninga/

INSERT INTO articles (
    slug, title, title_subtitle, excerpt, content, topic_id,
    reading_time_min, reading_minutes, published_at, view_count,
    display_type, sort_order, is_published, uses_blocks,
    image_url, image_alt
) VALUES (
    'kak-rabotayut-asiki-dlya-majninga',
    'Как работают асики для майнинга?',
    '',
    $excerpt$Разбираем устройство асика, алгоритмы SHA-256/Scrypt/kHeavyHash и технический процесс: БП, платы, вентиляторы, блок управления.$excerpt$,
    $content$Как работают асики для майнинга: суперкомпьютер из чипов, алгоритмы блокчейна и внутреннее строение майнера.$content$,
    'beginners',
    5,
    5,
    '2024-08-30',
    401,
    'list',
    42,
    TRUE,
    TRUE,
    '/images/articles/how-asics-work/cover.jpg',
    'Как работают асики для майнинга'
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
WHERE a.slug = 'kak-rabotayut-asiki-dlya-majninga'
  AND m.path = '/images/articles/how-asics-work/cover.jpg';

DELETE FROM article_blocks
WHERE article_id = (SELECT id FROM articles WHERE slug = 'kak-rabotayut-asiki-dlya-majninga');

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 1, 'heading',
       $tmj${"level":2,"text":"Введение"}$tmj$::jsonb,
       'intro'
FROM articles a WHERE a.slug = 'kak-rabotayut-asiki-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 2, 'paragraph',
       $tmj${"text":"Первый технический вопрос начинающего инвестора в сегменте добычи цифровых активов – как работают асики для майнинга? Но особенность заработка на вычислении BTC и альткоинов заключается в том, что знать профильные особенности процесса вовсе необязательно – далеко не каждый владелец ферм способен ответить на этот вопрос. Тем не менее, обладать подобной информацией все же необходимо, чтобы иметь базовое представление о процедуре."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kak-rabotayut-asiki-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 3, 'heading',
       $tmj${"level":2,"text":"Асик – это суперкомпьютер"}$tmj$::jsonb,
       'supercomputer'
FROM articles a WHERE a.slug = 'kak-rabotayut-asiki-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 4, 'paragraph',
       $tmj${"text":"Базовое понимание основы функционирования майнера строится на концепции устройства: это самый что ни есть настоящий суперкомпьютер, которому под силу проводить тысячи и даже миллионы вычислений за короткий промежуток времени."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kak-rabotayut-asiki-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 5, 'paragraph',
       $tmj${"text":"Если разобрать устройство, внутри можно найти несколько плат, целиком и полностью состоящих из компьютерных чипов."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kak-rabotayut-asiki-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 6, 'image',
       $tmj${"src":"/images/articles/how-asics-work/img-1.jpg","alt":"Асик — суперкомпьютер"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kak-rabotayut-asiki-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 7, 'paragraph',
       $tmj${"text":"Если в классическом ПК всего один процессор, то в асике данные компоненты исчисляются десятками. Подобный потенциал необходим для решения математической задачи по вычислению блока в сети. Как только данная цель достигается, нашедший ее майнер получает награду – Биткоины. На текущий момент – это 3,125 BTC за каждый блок. Процедура циклична: успешный ответ находится приблизительно раз в 10 минут, что заложено в алгоритмы блокчейна Bitcoin."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kak-rabotayut-asiki-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 8, 'paragraph',
       $tmj${"text":"Соответственно, чем большей производительностью обладает асик, тем внушительнее является сумма заработка."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kak-rabotayut-asiki-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 9, 'paragraph',
       $tmj${"text":"Правда, нахождение этого блока отдельно взятым устройством маловероятно ввиду внушительного количества асиков, работающих в сети. Именно поэтому владельцы ферм используют сервисы совместной добычи (пулы), где награда распределяется пропорционально предоставленной мощности."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kak-rabotayut-asiki-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 10, 'heading',
       $tmj${"level":2,"text":"Как работает асик для майнинга: разные алгоритмы"}$tmj$::jsonb,
       'algorithms'
FROM articles a WHERE a.slug = 'kak-rabotayut-asiki-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 11, 'paragraph',
       $tmj${"text":"Для вычисления задач внутри блокчейна используются своды правил – алгоритмы. Например, для добычи BTC – это SHA-256, в сети Litecoin и Dogecoin применим Scrypt, а для майнинга Kaspa используется логика kHeavyHash."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kak-rabotayut-asiki-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 12, 'paragraph',
       $tmj${"text":"Это правила игры или порядок вычислительного процесса: асики, разработанные для одного алгоритма, невозможно использовать для работы в другой логике."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kak-rabotayut-asiki-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 13, 'paragraph',
       $tmj${"text":"Однако это вовсе не означает, что каждый майнер способен добывать лишь один токен. Например, в рамках уже знакомого нам алгоритма SHA-256 к работе доступны более трех десятков активов. И самым известным среди них является Bitcoin."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kak-rabotayut-asiki-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 14, 'heading',
       $tmj${"level":2,"text":"Технический процесс функционирования асика"}$tmj$::jsonb,
       'internals'
FROM articles a WHERE a.slug = 'kak-rabotayut-asiki-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 15, 'paragraph',
       $tmj${"text":"При включении аппаратуры юнит начинает работу по вычислению – данный процесс мы уже проанализировали. А из каких компонентов состоит сам асик, на основании чего возможна его работа? Здесь можно назвать четыре составные части:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kak-rabotayut-asiki-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 16, 'list',
       $tmj${"ordered":false,"items":["Блок питания: оснащается разъемом для кабеля и кнопкой включения. Компонент отвечает за преобразование тока и передачу электроэнергии на платы;","Платы – два или три основания, на которых располагаются чипы (процессоры). Здесь же устанавливаются радиаторы, необходимые для эффективной работы системы охлаждения;","Вентиляторы (2 или 4 единицы, в зависимости от модели). Задача кулеров – снятие и выведение нагретых воздушных масс;","Блок управления – «мозговой» центр системы, отвечающий за согласованную работу всех компонентов асика. Данный модуль функционирует на основе профильной прошивки, которую при необходимости можно заменить."]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kak-rabotayut-asiki-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 17, 'image',
       $tmj${"src":"/images/articles/how-asics-work/cover.jpg","alt":"Технический процесс функционирования асика"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kak-rabotayut-asiki-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 18, 'paragraph',
       $tmj${"text":"Именно так работают асики для майнинга при рассмотрении устройства в его классическом исполнении."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kak-rabotayut-asiki-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 19, 'paragraph',
       $tmj${"text":"Существуют и альтернативные форматы, например, майнеры с водяным охлаждением: отличие заключается в использовании жидкости, радиатора и помпы для удаления тепла, а не вентиляторов, как это реализовано в рамках стандартных конструкций."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kak-rabotayut-asiki-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 20, 'heading',
       $tmj${"level":2,"text":"Выводы"}$tmj$::jsonb,
       'conclusion'
FROM articles a WHERE a.slug = 'kak-rabotayut-asiki-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 21, 'paragraph',
       $tmj${"text":"Логика функционирования майнера основывается на вычислительных процессах в рамках отдельно взятого блокчейна и используемого алгоритма. Производителями создаются компактные устройства с набором чипов на платах: высокая производительность асиков позволяет называть такие системы полноценными суперкомпьютерами без каких-либо ограничений."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kak-rabotayut-asiki-dlya-majninga';

-- https://top-mining.ru/novichkam/majning-v-telegramme-bez-vlozhenij-s-vyvodom/

INSERT INTO articles (
    slug, title, title_subtitle, excerpt, content, topic_id,
    reading_time_min, reading_minutes, published_at, view_count,
    display_type, sort_order, is_published, uses_blocks,
    image_url, image_alt
) VALUES (
    'majning-v-telegramme-bez-vlozhenij-s-vyvodom',
    'Майнинг в Телеграмме',
    'Без вложений с выводом',
    $excerpt$ТОП-5 проектов 2024: NotCoin, Hamster Combat, DOGS, BLUM и Catizen — дропы, листинги и перспективы тапалок.$excerpt$,
    $content$Майнинг в Телеграмме без вложений с выводом: обзор NotCoin, Hamster Combat, DOGS, BLUM и Catizen.$content$,
    'beginners',
    7,
    7,
    '2024-09-25',
    1098,
    'list',
    43,
    TRUE,
    TRUE,
    '/images/articles/telegram-mining/cover.jpg',
    'Майнинг в Телеграмме без вложений'
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
WHERE a.slug = 'majning-v-telegramme-bez-vlozhenij-s-vyvodom'
  AND m.path = '/images/articles/telegram-mining/cover.jpg';

DELETE FROM article_blocks
WHERE article_id = (SELECT id FROM articles WHERE slug = 'majning-v-telegramme-bez-vlozhenij-s-vyvodom');

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 1, 'heading',
       $tmj${"level":2,"text":"Введение"}$tmj$::jsonb,
       'intro'
FROM articles a WHERE a.slug = 'majning-v-telegramme-bez-vlozhenij-s-vyvodom';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 2, 'paragraph',
       $tmj${"text":"2024 год стал настоящим открытием для сегмента Play-to-Earn в мессенджере Telegram. Тапалки, кликеры, боты – все это разные названия одного и того же явления, позволяющего осуществлять майнинг в Телеграмме без вложений с выводом. Знакомимся с пятью самыми нашумевшими проектами данной индустрии, изучаем объемы потенциального заработка и анализируем перспективы направления."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-v-telegramme-bez-vlozhenij-s-vyvodom';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 3, 'heading',
       $tmj${"level":2,"text":"NotCoin"}$tmj$::jsonb,
       'notcoin'
FROM articles a WHERE a.slug = 'majning-v-telegramme-bez-vlozhenij-s-vyvodom';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 4, 'paragraph',
       $tmj${"text":"Именно с этого приложения стартовала громкая история кликеров в Telegram. Пользователи начали добывать токены NOT с 1 января 2024 года, активная фаза процесса длилась три месяца. Геймплей оказался максимально простым: необходимо кликать по виртуальной монете на экране и получать за эти действия внутриигровую валюту. Дополнительные активности (например, подписка на спонсорские каналы) позволили заработать больше, а специальные множители и бонусы увеличивали фарминг."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-v-telegramme-bez-vlozhenij-s-vyvodom';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 5, 'paragraph',
       $tmj${"text":"16 мая 2024 года состоялся листинг на ведущих биржах мира: в этот день пользователи узнали реальные объемы своего заработка."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-v-telegramme-bez-vlozhenij-s-vyvodom';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 6, 'paragraph',
       $tmj${"text":"Майнинг в Телеграме без вложений с выводом пережил волну взрывной популярности, так как рядовой пользователь Notcoin сумел заработать от 30 000 до 70 000 рублей за простые действия. Минимум до середины года мир захлестнула волна подобных реализаций, которые стали появляться с завидной регулярностью. После Notcoin аналогичные продукты начали выходить сотнями, однако ни одному из них не удалось повторить успех своего предшественника."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-v-telegramme-bez-vlozhenij-s-vyvodom';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 7, 'paragraph',
       $tmj${"text":"NotCoin: запуск январь 24, кликер, токен $NOT, листинг и дроп май 24.","html":"<table><tbody><tr><td>Запуск</td><td>Январь 24</td></tr><tr><td>Тип продукта</td><td>Кликер</td></tr><tr><td>Собственный токен</td><td>$NOT</td></tr><tr><td>Листинг</td><td>Есть</td></tr><tr><td>Дроп</td><td>Май 24</td></tr></tbody></table>"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-v-telegramme-bez-vlozhenij-s-vyvodom';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 8, 'heading',
       $tmj${"level":2,"text":"Hamster Combat"}$tmj$::jsonb,
       'hamster'
FROM articles a WHERE a.slug = 'majning-v-telegramme-bez-vlozhenij-s-vyvodom';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 9, 'paragraph',
       $tmj${"text":"В какой-то степени резонансный проект, собравший максимальную аудиторию пользователей – более 100 000 000 участников по всему миру. Симулятор в шутливой форме предлагает почувствовать себя в роли владельца криптовалютной биржи, занимаясь маркетингом, построением своей команды, запуском в разных странах и развитием рынка."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-v-telegramme-bez-vlozhenij-s-vyvodom';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 10, 'paragraph',
       $tmj${"text":"К сожалению, объемы наград не оправдали ожиданий пользователей: во время листинга на биржах 26 сентября многие были разочарованы."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-v-telegramme-bez-vlozhenij-s-vyvodom';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 11, 'image',
       $tmj${"src":"/images/articles/telegram-mining/img-1.jpg","alt":"Hamster Combat и DOGS"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-v-telegramme-bez-vlozhenij-s-vyvodom';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 12, 'paragraph',
       $tmj${"text":"Hamster Combat стал заложником своей же популярности: инвестиции в продукт были распределены среди гигантского количества игроков, в результате чего каждый отдельно взятый человек заработал немного. Но это действительно настоящий майнинг в Телеграмме без вложений с выводом: никаких инвестиций кроме собственного времени от участников не потребовалось."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-v-telegramme-bez-vlozhenij-s-vyvodom';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 13, 'paragraph',
       $tmj${"text":"Hamster Combat: запуск март 24, кликер, токен HMSTR, листинг и дроп сентябрь 24.","html":"<table><tbody><tr><td>Запуск</td><td>Март 24</td></tr><tr><td>Тип продукта</td><td>Кликер</td></tr><tr><td>Собственный токен</td><td>HMSTR</td></tr><tr><td>Листинг</td><td>Есть</td></tr><tr><td>Дроп</td><td>Сентябрь 24</td></tr></tbody></table>"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-v-telegramme-bez-vlozhenij-s-vyvodom';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 14, 'heading',
       $tmj${"level":2,"text":"DOGS"}$tmj$::jsonb,
       'dogs'
FROM articles a WHERE a.slug = 'majning-v-telegramme-bez-vlozhenij-s-vyvodom';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 15, 'paragraph',
       $tmj${"text":"Отличный пример быстрого и ощутимого дропа в Telegram. Привязка баланса основана на возрасте аккаунта пользователя в мессенджере: таким образом, накрутить игровой баланс у нечестных юзеров не получилось. Всего за пару месяцев произошла трансформация от анонса проекта до выхода на биржи: токен успешно торгуется на большинстве крупнейших платформ."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-v-telegramme-bez-vlozhenij-s-vyvodom';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 16, 'paragraph',
       $tmj${"text":"Идею DOGS быстро подхватили конкуренты: на свет появились CATS, DUCKS и прочие приложения со схожими механиками заработка."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-v-telegramme-bez-vlozhenij-s-vyvodom';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 17, 'paragraph',
       $tmj${"text":"Однако ни одной игре не удалось повторить успех открывателя формата: повторяется ситуация с Notcoin, когда максимальный объем инвестиций получают именно первые продукты в своем сегменте. DOGS подтвердили это, собрав максимальный объем внимания и число участников."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-v-telegramme-bez-vlozhenij-s-vyvodom';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 18, 'paragraph',
       $tmj${"text":"DOGS: запуск июль 24, кликер, токен DOGS, листинг есть, дроп август 24.","html":"<table><tbody><tr><td>Запуск</td><td>Июль 24</td></tr><tr><td>Тип продукта</td><td>Кликер</td></tr><tr><td>Собственный токен</td><td>DOGS</td></tr><tr><td>Листинг</td><td>Есть</td></tr><tr><td>Дроп</td><td>Август 24</td></tr></tbody></table>"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-v-telegramme-bez-vlozhenij-s-vyvodom';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 19, 'heading',
       $tmj${"level":2,"text":"BLUM"}$tmj$::jsonb,
       'blum'
FROM articles a WHERE a.slug = 'majning-v-telegramme-bez-vlozhenij-s-vyvodom';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 20, 'paragraph',
       $tmj${"text":"Приложение завоевало популярность благодаря именам своих создателей: Глеб Костарев и Владимир Смеркис – бывшие менеджеры биржи Binance, что по достоинству оценили пользователи. Механика игры лишена оригинальных сюжетных линий – необходимо периодически заходить в приложение и забирать очки. Дополнительные баллы можно зарабатывать с помощью ловли снежинок и выполнения сопутствующих заданий."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-v-telegramme-bez-vlozhenij-s-vyvodom';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 21, 'paragraph',
       $tmj${"text":"Решение привлекает своей простотой и минимальным расходом времени пользователя: формат, который привлек внимание более 50 000 000 юзеров."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-v-telegramme-bez-vlozhenij-s-vyvodom';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 22, 'image',
       $tmj${"src":"/images/articles/telegram-mining/img-2.jpg","alt":"BLUM и Catizen"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-v-telegramme-bez-vlozhenij-s-vyvodom';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 23, 'paragraph',
       $tmj${"text":"BLUM, в отличие от конкурирующих приложений, рассчитан на продолжительный процесс заработка внутриигровых токенов. Выход на биржи ожидается только в конце 2024 года, что негативным образом повлияло на некоторых участников. Получить быстрый дроп не удалось, что является недостатком для многих: такой майнинг в телеграмме без вложений подходит не всем."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-v-telegramme-bez-vlozhenij-s-vyvodom';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 24, 'paragraph',
       $tmj${"text":"BLUM: запуск апрель 24, кликер, собственного токена и листинга нет.","html":"<table><tbody><tr><td>Запуск</td><td>Апрель 24</td></tr><tr><td>Тип продукта</td><td>Кликер</td></tr><tr><td>Собственный токен</td><td>Нет</td></tr><tr><td>Листинг</td><td>Нет</td></tr><tr><td>Дроп</td><td>Нет</td></tr></tbody></table>"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-v-telegramme-bez-vlozhenij-s-vyvodom';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 25, 'heading',
       $tmj${"level":2,"text":"Catizen"}$tmj$::jsonb,
       'catizen'
FROM articles a WHERE a.slug = 'majning-v-telegramme-bez-vlozhenij-s-vyvodom';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 26, 'paragraph',
       $tmj${"text":"Реализация для любителей братьев наших меньших и простых логических стратегий. Игровую валюту можно получать путем скрещивания котов, а также выполнения различных заданий. Также можно отметить варианты платной прокачки аккаунта: такой майнинг в телеграмме уже нельзя называть форматом без инвестиций, что отпугнуло ряд игроков."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-v-telegramme-bez-vlozhenij-s-vyvodom';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 27, 'paragraph',
       $tmj${"text":"Более того, при распределении дропа в больших масштабах учитывался именно размер доната, что вызвало волну негатива и разочарования."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-v-telegramme-bez-vlozhenij-s-vyvodom';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 28, 'paragraph',
       $tmj${"text":"Репутация Catizen скорее отрицательная, так как основной массе игроков не удалось заработать. Многим участникам достались скромные дропы, но тем, кто инвестировал ощутимые средства, удалось преумножить капитал."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-v-telegramme-bez-vlozhenij-s-vyvodom';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 29, 'paragraph',
       $tmj${"text":"Catizen: запуск март 24, кликер, токен CATI, листинг есть, дроп сентябрь 24.","html":"<table><tbody><tr><td>Запуск</td><td>Март 24</td></tr><tr><td>Тип продукта</td><td>Кликер</td></tr><tr><td>Собственный токен</td><td>CATI</td></tr><tr><td>Листинг</td><td>Есть</td></tr><tr><td>Дроп</td><td>Сентябрь 24</td></tr></tbody></table>"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-v-telegramme-bez-vlozhenij-s-vyvodom';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 30, 'heading',
       $tmj${"level":2,"text":"Какие еще проекты?"}$tmj$::jsonb,
       'others'
FROM articles a WHERE a.slug = 'majning-v-telegramme-bez-vlozhenij-s-vyvodom';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 31, 'paragraph',
       $tmj${"text":"Помимо пяти проанализированных приложений, существуют десятки и даже сотни разнообразных проектов, которые также основаны на простой игровой механике и возможности заработка. Это популярный в 2024 году майнинг в телеграмме без вложений с выводом, однако судьба данных сервисов весьма разнообразна:"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-v-telegramme-bez-vlozhenij-s-vyvodom';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 32, 'list',
       $tmj${"ordered":false,"items":["NEAR Wallet – сложная игровая механика с различными форматами заработка токенов;","Iceberg – максимально простой кликер с элементарными действиями;","WatPoints – игра, которая неоднократно меняла механики и взаимодействие с аудиторией;","TapSwap – похожий на NotCoin принцип. Дата дропа несколько раз переносилась;","PocketFi – кликер от кошелька и обменника, имеется система халвинга наград;","TimeFarm – фарминг времени с максимально простыми интерфейсами;","Moonbix – тематический запуск от биржи Binance;","Not Pixel – дополнение от разработчиков NotCoin с элементами графики и творчества;","Cubes? – пиксельный кликер, основанный на концепции Minecraft;"]}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-v-telegramme-bez-vlozhenij-s-vyvodom';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 33, 'image',
       $tmj${"src":"/images/articles/telegram-mining/cover.jpg","alt":"Другие Telegram-проекты"}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-v-telegramme-bez-vlozhenij-s-vyvodom';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 34, 'paragraph',
       $tmj${"text":"А также многие другие игры, начиная с приложений от бирж и заканчивая тапалками от букмекерских контор."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-v-telegramme-bez-vlozhenij-s-vyvodom';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 35, 'heading',
       $tmj${"level":2,"text":"Выводы"}$tmj$::jsonb,
       'conclusion'
FROM articles a WHERE a.slug = 'majning-v-telegramme-bez-vlozhenij-s-vyvodom';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 36, 'paragraph',
       $tmj${"text":"Майнинг в Телеграмме без вложений с выводом сегодня вполне возможен, что подтверждается примерами успешных игр. Среди них – Notcoin и DOGS. Остальные проекты могут разочаровать скромным дропом, что превращает участие в пустую трату времени. Однако на начальном этапе выхода продукта сложно понять, насколько перспективным он является, поэтому всегда есть большая вероятность совершения неправильного выбора."}$tmj$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'majning-v-telegramme-bez-vlozhenij-s-vyvodom';
