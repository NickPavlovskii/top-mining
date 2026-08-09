SET client_encoding = 'UTF8';

-- Replace blocks for seeded rating articles
DELETE FROM article_blocks
WHERE article_id IN (
    SELECT id FROM articles WHERE slug IN ('rejting-stran-po-majningu-top-8-gosudarstv-liderov', 'gde-kupit-asik-dlya-majninga-top-10-magazinov', 'luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov', 'top-10-platform-dlya-oblachnogo-majninga-rejting-2024-goda-2', 'rejting-algoritmov-majninga-na-asikah-top-10', 'luchshie-asiki-dlya-majninga-v-2024-godu-top-10', 'majning-kriptovalyuty-rejting-luchshih-monet-dlya-dobychi', 'samye-moshhnye-asiki-dlya-majninga-bitkoinov-v-2024-godu-top-5', 'top-5-samye-deshevye-videokarty-dlya-majninga-v-2024-godu-rejting-i-czeny', 'luchshaya-kriptovalyuta-v-2024-godu-rejting-monet-dlya-investirovaniya', 'luchshie-kanaly-o-majninge-v-telegram-top-10', 'rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke', 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga', 'samyj-dorogoj-asik-dlya-majninga-v-2024-godu-top-3', 'rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu', 'samye-populyarnye-asiki-dlya-majninga-top-5', 'top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki', 'luchshie-kriptobirzhi-top-10', 'luchshij-majning-otel-top-10-hostingov-dlya-majninga', 'kakoj-koshelek-dlya-kriptovalyuty-vybrat-10-luchshih-goryachih-hranilishh', 'luchshij-holodnyj-koshelek-dlya-kriptovalyuty-top-10', 'luchshie-puly-dlya-majninga-top-10')
);

-- Blocks: rejting-stran-po-majningu-top-8-gosudarstv-liderov
INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 1, 'heading',
       $h1${"level":2,"text":"Введение"}$h1$::jsonb,
       'vvedenie'
FROM articles a WHERE a.slug = 'rejting-stran-po-majningu-top-8-gosudarstv-liderov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 2, 'paragraph',
       $b2${"text":"Добыча криптовалют – крайне динамичная отрасль, которая постоянно подвержена изменениям, нововведениям, а также влиянию разнообразных факторов. Еще буквально вчера власти той или иной страны могли лояльно относиться к сегменту майнинга, но уже сегодня начинают действовать запреты. И наоборот – в мире неожиданно появляются новые центры притяжения инвесторов благодаря тому, что государство неожиданно пересматривает свое отношение к нише.","html":"Добыча криптовалют – крайне динамичная отрасль, которая постоянно подвержена изменениям, нововведениям, а также влиянию разнообразных факторов. Еще буквально вчера власти той или иной страны могли лояльно относиться к сегменту майнинга, но уже сегодня начинают действовать запреты. И наоборот – в мире неожиданно появляются новые центры притяжения инвесторов благодаря тому, что государство неожиданно пересматривает свое отношение к нише."}$b2$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-stran-po-majningu-top-8-gosudarstv-liderov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 3, 'paragraph',
       $b3${"text":"Узнаем, как выглядит ТОП-8 стран по объемам майнинга: составим рейтинг согласно данным из открытых источников. Точные значения хешрейта назвать затруднительно, так как цифры постоянно меняются, да и не все владельцы ферм работают открыто. Но, несмотря на это, перечень лидеров остается неизменным уже долгое время – с этими частями земного шара мы и познакомимся в статье. Не будем приводить точные значения хешрейта и мощности (так как эти цифры волатильны). Отметим лишь ориентировочные доли в мировом майнинге, что позволит сформировать общее представление.","html":"Узнаем, как выглядит ТОП-8 стран по объемам майнинга: составим рейтинг согласно данным из открытых источников. Точные значения хешрейта назвать затруднительно, так как цифры постоянно меняются, да и не все владельцы ферм работают открыто. Но, несмотря на это, перечень лидеров остается неизменным уже долгое время – с этими частями земного шара мы и познакомимся в статье. Не будем приводить точные значения хешрейта и мощности (так как эти цифры волатильны). Отметим лишь ориентировочные доли в мировом майнинге, что позволит сформировать общее представление."}$b3$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-stran-po-majningu-top-8-gosudarstv-liderov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 4, 'heading',
       $h4${"level":2,"text":"Особенности майнинга в разных странах"}$h4$::jsonb,
       'osobennosti-majninga'
FROM articles a WHERE a.slug = 'rejting-stran-po-majningu-top-8-gosudarstv-liderov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 5, 'paragraph',
       $b5${"text":"Майнинг как бизнес зависит сразу от нескольких факторов:","html":"Майнинг как бизнес зависит сразу от нескольких факторов:"}$b5$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-stran-po-majningu-top-8-gosudarstv-liderov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 6, 'list',
       $b6${"ordered":false,"items":["Стоимости электроэнергии;","Климата (температура и влажность);","Правовой среды (легальность и уровень регулирования);","Доступности оборудования и инфраструктуры;","Стабильности энергосетей."]}$b6$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-stran-po-majningu-top-8-gosudarstv-liderov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 7, 'paragraph',
       $b7${"text":"На основе этих критериев страны можно условно разделить на три группы:","html":"На основе этих критериев страны можно условно разделить на три группы:"}$b7$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-stran-po-majningu-top-8-gosudarstv-liderov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 8, 'rich_list',
       $b8${"ordered":true,"items":[{"title":"Государства с благоприятным режимом и дешевой энергией","text":"Это регионы с низкой стоимостью электроэнергии, устойчивой электросетью и нейтральным или даже позитивным отношением к майнингу. В таких странах добыча криптовалюты является конкурентоспособным бизнесом даже в периоды падения курса. Примеры: Казахстан, Россия, Иран (с оговорками), Эфиопия, Парагвай;"},{"title":"Юрисдикции с умеренной лояльностью и средними затратами","text":"В этих странах майнинг не запрещен, но регулируется: часто требуются лицензии, внедрены отчетные процедуры, а цены на электричество находятся в умеренном диапазоне. Как правило, это развитые экономики с высоким уровнем правового контроля. Примеры: Канада, Германия, Норвегия, ОАЭ;"},{"title":"Регионы с высоким уровнем запретов или недружественной политикой","text":"Здесь майнинг либо прямо запрещен (например, как в Китае с 2021 года), либо ограничен через высокие тарифы, жесткое налогообложение или конфискационные меры. Примеры: Китай, Алжир, Бангладеш, Непал, Ирак."}]}$b8$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-stran-po-majningu-top-8-gosudarstv-liderov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 9, 'image',
       $b9${"src":"/images/articles/rating-countries/map-bitcoin-wide.png","alt":"Карта мира и символ Bitcoin"}$b9$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-stran-po-majningu-top-8-gosudarstv-liderov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 10, 'heading',
       $h10${"level":2,"text":"Почему сложно точно оценить хешрейт по странам?"}$h10$::jsonb,
       'pochemu-slozhno-ocenit'
FROM articles a WHERE a.slug = 'rejting-stran-po-majningu-top-8-gosudarstv-liderov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 11, 'paragraph',
       $b11${"text":"На первый взгляд, кажется простой задачей составить рейтинг стран по объему майнинга, опираясь на данные с пулов и энергетических компаний.","html":"На первый взгляд, кажется простой задачей составить рейтинг стран по объему майнинга, опираясь на данные с пулов и энергетических компаний."}$b11$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-stran-po-majningu-top-8-gosudarstv-liderov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 12, 'paragraph',
       $b12${"text":"Однако есть серьезные сложности, мешающие точной аналитике:","html":"Однако есть серьезные сложности, мешающие точной аналитике:"}$b12$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-stran-po-majningu-top-8-gosudarstv-liderov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 13, 'rich_list',
       $b13${"ordered":true,"items":[{"title":"Облачные и мультигеографические пулы","text":"Большинство майнеров подключаются к международным пулам, которые распределяют мощность между дата-центрами по всему миру. Поэтому реальное географическое расположение оборудования часто не раскрывается;"},{"title":"Анонимность участников","text":"Майнеры в странах с полулегальным, молодым законодательством или серым статусом (например, Россия или Иран) не афишируют свое присутствие. Использование прокси и VPN также затрудняет отслеживание;"},{"title":"Перемещение оборудования","text":"Многие компании могут переносить майнинг-фермы из одной страны в другую в зависимости от тарифов, регулирования или технических сбоев. Таким образом, данные по хешрейту быстро устаревают;"},{"title":"Домашний майнинг","text":"Домашние майнеры, особенно в странах с субсидированными тарифами, в статистику чаще всего не попадают вовсе."}]}$b13$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-stran-po-majningu-top-8-gosudarstv-liderov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 14, 'heading',
       $h14${"level":2,"text":"8 место: Сальвадор"}$h14$::jsonb,
       'salvador'
FROM articles a WHERE a.slug = 'rejting-stran-po-majningu-top-8-gosudarstv-liderov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 15, 'paragraph',
       $b15${"text":"Это государство, расположенное в Центральной Америке, известно своим лояльным отношением ко всему сегменту криптовалют, в целом. Происходит подобное во многом благодаря их президенту, Найибу Букеле, который видит в BTC внушительные перспективы: именно цифровым активам уделяется повышенное внимание в экономике Сальвадора. Например, вот уже долгое время власти покупают по 1 BTC ежедневно (иногда и больше), а местные Биткоин-фермы работают на энергии от вулканов. Благо, данных природных источников зеленой энергетики здесь предостаточно – более полутора сотен.","html":"Это государство, расположенное в Центральной Америке, известно своим лояльным отношением ко всему сегменту криптовалют, в целом. Происходит подобное во многом благодаря их президенту, Найибу Букеле, который видит в BTC внушительные перспективы: именно цифровым активам уделяется повышенное внимание в экономике Сальвадора. Например, вот уже долгое время власти покупают по 1 BTC ежедневно (иногда и больше), а местные Биткоин-фермы работают на энергии от вулканов. Благо, данных природных источников зеленой энергетики здесь предостаточно – более полутора сотен."}$b15$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-stran-po-majningu-top-8-gosudarstv-liderov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 16, 'paragraph',
       $b16${"text":"Сальвадор открыт для внешних инвестиций, привлекает иностранных майнеров и предоставляет особые экономические условия для тех, кто работает с блокчейном. Конечно, доля хешрейта этого Центральноамериканского государства в общем объеме невелика, но само желание властей организовать плотную работу с нишей обращает на себя внимание.","html":"Сальвадор открыт для внешних инвестиций, привлекает иностранных майнеров и предоставляет особые экономические условия для тех, кто работает с блокчейном. Конечно, доля хешрейта этого Центральноамериканского государства в общем объеме невелика, но само желание властей организовать плотную работу с нишей обращает на себя внимание."}$b16$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-stran-po-majningu-top-8-gosudarstv-liderov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 17, 'image',
       $b17${"src":"/images/articles/rating-countries/globe-coins.png","alt":"Глобус и монеты — Сальвадор"}$b17$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-stran-po-majningu-top-8-gosudarstv-liderov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 18, 'stats',
       $b18${"rows":[{"label":"Доля в мировом хешрейте","value":"менее 1%"},{"label":"Энергетика","value":"вулканы"},{"label":"Крупнейшие инвесторы и фермы","value":"Tether, Luxor Technologies"}]}$b18$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-stran-po-majningu-top-8-gosudarstv-liderov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 19, 'pros_cons',
       $b19${"pros":["Лояльное правительство;","Льготы для инвесторов;","Использование зеленой энергетики."],"cons":["Криминальная страна;","Ограниченные объемы и потенциал."]}$b19$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-stran-po-majningu-top-8-gosudarstv-liderov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 20, 'heading',
       $h20${"level":2,"text":"7 место: Эфиопия"}$h20$::jsonb,
       'efiopiya'
FROM articles a WHERE a.slug = 'rejting-stran-po-majningu-top-8-gosudarstv-liderov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 21, 'paragraph',
       $b21${"text":"В 2024 году на арене мирового майнинга оказался неожиданный игрок – Эфиопия. Достаточно бедное африканское государство стремительно ворвалось в десятку крупнейших стран по объему добычи цифровых активов. История с майнингом здесь выглядит парадоксальной: несмотря на внушительные объемы работы с блокчейном, внушительная доля населения Эфиопии все еще не имеют доступа к электричеству и фактически живет за чертой бедности. Здесь процветает коррупция, а основная масса выручки от BTC сосредоточена в руках иностранных инвесторов.","html":"В 2024 году на арене мирового майнинга оказался неожиданный игрок – Эфиопия. Достаточно бедное африканское государство стремительно ворвалось в десятку крупнейших стран по объему добычи цифровых активов. История с майнингом здесь выглядит парадоксальной: несмотря на внушительные объемы работы с блокчейном, внушительная доля населения Эфиопии все еще не имеют доступа к электричеству и фактически живет за чертой бедности. Здесь процветает коррупция, а основная масса выручки от BTC сосредоточена в руках иностранных инвесторов."}$b21$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-stran-po-majningu-top-8-gosudarstv-liderov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 22, 'paragraph',
       $b22${"text":"Несмотря на все трудности, власти Эфиопии умело используют потенциал гидроэнергетики для запуска и сопровождения ферм. Около 10% всей выработки электричества приходится именно на майнинг, что свидетельствует о высокой степени влияния сектора на экономику африканской страны.","html":"Несмотря на все трудности, власти Эфиопии умело используют потенциал гидроэнергетики для запуска и сопровождения ферм. Около 10% всей выработки электричества приходится именно на майнинг, что свидетельствует о высокой степени влияния сектора на экономику африканской страны."}$b22$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-stran-po-majningu-top-8-gosudarstv-liderov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 23, 'image',
       $b23${"src":"/images/articles/rating-countries/map-bitcoin-coins.png","alt":"Карта мира с Bitcoin — Эфиопия"}$b23$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-stran-po-majningu-top-8-gosudarstv-liderov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 24, 'stats',
       $b24${"rows":[{"label":"Доля в мировом хешрейте","value":"от 1% до 5%"},{"label":"Энергетика","value":"гидроэлектростанции"},{"label":"Крупнейшие инвесторы и фермы","value":"BitFuFu, EEP"}]}$b24$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-stran-po-majningu-top-8-gosudarstv-liderov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 25, 'pros_cons',
       $b25${"pros":["Возобновляемые источники энергии;","Недорогая рабочая сила."],"cons":["Коррупция;","Низкая степень безопасности."]}$b25$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-stran-po-majningu-top-8-gosudarstv-liderov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 26, 'heading',
       $h26${"level":2,"text":"6 место: Канада"}$h26$::jsonb,
       'kanada'
FROM articles a WHERE a.slug = 'rejting-stran-po-majningu-top-8-gosudarstv-liderov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 27, 'paragraph',
       $b27${"text":"Ситуация с майнингом в Канаде неоднозначная. С одной стороны, климатические условия в Северной Америке оптимальны для запуска крупных ферм, но с другой – серьезное электропотребление отрасли вынудило властей установить ограничения, осложнив деятельность майнеров. В итоге, доля канадского хешрейта серьезно снизилась по сравнению со своими прежними ТОПовыми значениями, так как в дело вступила жесткая регуляция.","html":"Ситуация с майнингом в Канаде неоднозначная. С одной стороны, климатические условия в Северной Америке оптимальны для запуска крупных ферм, но с другой – серьезное электропотребление отрасли вынудило властей установить ограничения, осложнив деятельность майнеров. В итоге, доля канадского хешрейта серьезно снизилась по сравнению со своими прежними ТОПовыми значениями, так как в дело вступила жесткая регуляция."}$b27$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-stran-po-majningu-top-8-gosudarstv-liderov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 28, 'paragraph',
       $b28${"text":"Схожая ситуация произошла в Казахстане, поэтому майнерская судьба этих двух государств схожа друг с другом. Теперь добывать Биткоин в Канаде стало значительно сложнее и дороже, но власти не планируют менять свое решение, причиной чего также являются экологические мотивы. Добыча цифровых активов требует увеличения потенциала местных электростанций, что вынуждает увеличивать объемы вредных выбросов в атмосферу.","html":"Схожая ситуация произошла в Казахстане, поэтому майнерская судьба этих двух государств схожа друг с другом. Теперь добывать Биткоин в Канаде стало значительно сложнее и дороже, но власти не планируют менять свое решение, причиной чего также являются экологические мотивы. Добыча цифровых активов требует увеличения потенциала местных электростанций, что вынуждает увеличивать объемы вредных выбросов в атмосферу."}$b28$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-stran-po-majningu-top-8-gosudarstv-liderov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 29, 'image',
       $b29${"src":"/images/articles/rating-countries/datacenter-fans.png","alt":"Дата-центр — Канада"}$b29$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-stran-po-majningu-top-8-gosudarstv-liderov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 30, 'stats',
       $b30${"rows":[{"label":"Доля в мировом хешрейте","value":"около 5%"},{"label":"Энергетика","value":"классические электростанции"},{"label":"Крупнейшие инвесторы и фермы","value":"BitFury и Hut 8"}]}$b30$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-stran-po-majningu-top-8-gosudarstv-liderov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 31, 'pros_cons',
       $b31${"pros":["Подходящий климат;","Соседство с США;","Стремление к использованию зеленой энергетики."],"cons":["Серьезные ограничения;","Высокие налоги."]}$b31$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-stran-po-majningu-top-8-gosudarstv-liderov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 32, 'heading',
       $h32${"level":2,"text":"5 место: Казахстан"}$h32$::jsonb,
       'kazahstan'
FROM articles a WHERE a.slug = 'rejting-stran-po-majningu-top-8-gosudarstv-liderov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 33, 'paragraph',
       $b33${"text":"Несколько лет назад Казахстан находился в тройке государств по совокупным объемам майнинга. Дело в том, что после официального запрета криптовалют в Китае многие фермы начали переезжать не только в Россию, но и другие СНГ-государства. Одним из них является Казахстан, который переживал стремительное развитие ниши в 2021-2022 годах. Однако через некоторое время власти столкнулись с серьезной нехваткой электрических мощностей, что стало причиной появления ограничительного и регулирующего законодательства.","html":"Несколько лет назад Казахстан находился в тройке государств по совокупным объемам майнинга. Дело в том, что после официального запрета криптовалют в Китае многие фермы начали переезжать не только в Россию, но и другие СНГ-государства. Одним из них является Казахстан, который переживал стремительное развитие ниши в 2021-2022 годах. Однако через некоторое время власти столкнулись с серьезной нехваткой электрических мощностей, что стало причиной появления ограничительного и регулирующего законодательства."}$b33$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-stran-po-majningu-top-8-gosudarstv-liderov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 34, 'paragraph',
       $b34${"text":"В конечном итоге число майнеров Казахстана значительно сократилось, однако, объемы налоговых отчислений в казну наоборот – растут. Объяснить происходящее несложно: этот вид деятельности обложили серьезными налогами, в результате чего в стране осталась лишь часть тех ферм, которые работали ранее. Подобная ситуация целиком устраивает власти: нагрузка на электросети сократилась, а налоговые поступления выросли.","html":"В конечном итоге число майнеров Казахстана значительно сократилось, однако, объемы налоговых отчислений в казну наоборот – растут. Объяснить происходящее несложно: этот вид деятельности обложили серьезными налогами, в результате чего в стране осталась лишь часть тех ферм, которые работали ранее. Подобная ситуация целиком устраивает власти: нагрузка на электросети сократилась, а налоговые поступления выросли."}$b34$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-stran-po-majningu-top-8-gosudarstv-liderov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 35, 'image',
       $b35${"src":"/images/articles/rating-countries/datacenter-orange.png","alt":"Майнинг-ферма — Казахстан"}$b35$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-stran-po-majningu-top-8-gosudarstv-liderov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 36, 'stats',
       $b36${"rows":[{"label":"Доля в мировом хешрейте","value":"от 2% до 5%"},{"label":"Энергетика","value":"классические электростанции"},{"label":"Крупнейшие инвесторы и фермы","value":"Energix, Genesis Digital Assets и BTC.kz"}]}$b36$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-stran-po-majningu-top-8-gosudarstv-liderov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 37, 'pros_cons',
       $b37${"pros":["Соседство с Китаем;","Недорогое электричество;","Умеренный климат."],"cons":["Высокие налоговые ставки для майнеров;","Запреты и ограничения."]}$b37$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-stran-po-majningu-top-8-gosudarstv-liderov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 38, 'heading',
       $h38${"level":2,"text":"4 место: Объединенные Арабские Эмираты"}$h38$::jsonb,
       'oae'
FROM articles a WHERE a.slug = 'rejting-stran-po-majningu-top-8-gosudarstv-liderov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 39, 'paragraph',
       $b39${"text":"ОАЭ известны на весь мир своим лояльным отношением к криптовалютному сегменту, и майнинг не является исключением. Однако причиной популярности добычи является не только преданность технологиям блокчейна, но и доступ к недорогому электричеству. В странах персидского залива много нефти, которая используется для генерации дешевых ресурсов: оптимальные условия для запуска ферм. Также здесь распространены солнечные электростанции, что благоприятным образом влияет на тарифы. Единственным недостатком направления считается жаркий климат, что увеличивает расходы инвесторов на организацию систем охлаждения.","html":"ОАЭ известны на весь мир своим лояльным отношением к криптовалютному сегменту, и майнинг не является исключением. Однако причиной популярности добычи является не только преданность технологиям блокчейна, но и доступ к недорогому электричеству. В странах персидского залива много нефти, которая используется для генерации дешевых ресурсов: оптимальные условия для запуска ферм. Также здесь распространены солнечные электростанции, что благоприятным образом влияет на тарифы. Единственным недостатком направления считается жаркий климат, что увеличивает расходы инвесторов на организацию систем охлаждения."}$b39$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-stran-po-majningu-top-8-gosudarstv-liderov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 40, 'paragraph',
       $b40${"text":"Стремительное принятие сегмента цифровых активов в Объединенных Арабских Эмиратах позволяет инвесторам не бояться смены отношения властей к вопросу майнинга. В фермы ОАЭ активно инвестируют крупные участники рынка, так как страна отличается привлекательными экономическими условиями для работы иностранного капитала.","html":"Стремительное принятие сегмента цифровых активов в Объединенных Арабских Эмиратах позволяет инвесторам не бояться смены отношения властей к вопросу майнинга. В фермы ОАЭ активно инвестируют крупные участники рынка, так как страна отличается привлекательными экономическими условиями для работы иностранного капитала."}$b40$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-stran-po-majningu-top-8-gosudarstv-liderov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 41, 'image',
       $b41${"src":"/images/articles/rating-countries/map-bitcoin-coins.png","alt":"Глобальный майнинг — ОАЭ"}$b41$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-stran-po-majningu-top-8-gosudarstv-liderov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 42, 'stats',
       $b42${"rows":[{"label":"Доля в мировом хешрейте","value":"от 5% до 10%"},{"label":"Энергетика","value":"классические электростанции, солнечные панели"},{"label":"Крупнейшие инвесторы и фермы","value":"Marathon Digital, Zero Two, Hearst"}]}$b42$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-stran-po-majningu-top-8-gosudarstv-liderov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 43, 'pros_cons',
       $b43${"pros":["Поддержка сферы со стороны властей;","Благоприятная и инвестиционная среда;","Высокая степень внедрения криптовалют;","Недорогое электричество за счет крупных нефтяных месторождений;","Солнечная энергетика."],"cons":["Жаркий климат."]}$b43$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-stran-po-majningu-top-8-gosudarstv-liderov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 44, 'heading',
       $h44${"level":2,"text":"3 место: Китай"}$h44$::jsonb,
       'kitaj'
FROM articles a WHERE a.slug = 'rejting-stran-po-majningu-top-8-gosudarstv-liderov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 45, 'paragraph',
       $b45${"text":"Известно, что в 2021 году китайские власти выпустили официальный запрет на криптовалюты, включая майнинг цифровых активов. Это послужило причиной глобальной миграции ферм в разные страны мира, включая Казахстан и Россию. До этого громкого события Китай оставался безоговорочным лидером в структуре мирового хешрейта, однако, запретительные меры серьезно повлияли на расстановку сил.","html":"Известно, что в 2021 году китайские власти выпустили официальный запрет на криптовалюты, включая майнинг цифровых активов. Это послужило причиной глобальной миграции ферм в разные страны мира, включая Казахстан и Россию. До этого громкого события Китай оставался безоговорочным лидером в структуре мирового хешрейта, однако, запретительные меры серьезно повлияли на расстановку сил."}$b45$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-stran-po-majningu-top-8-gosudarstv-liderov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 46, 'paragraph',
       $b46${"text":"Парадоксом китайского майнинга сегодня является тот факт, что несмотря на официальный запрет, фермы из поднебесной все еще генерируют ощутимую долю мировой мощности. Более того, Китай находится на уверенном третьем месте по объемам хешрейта: настолько велико участие «серых» участников отрасли. Также не исключено наличие масштабных правительственных ферм, хотя сами власти страны никак не комментируют такую вероятность.","html":"Парадоксом китайского майнинга сегодня является тот факт, что несмотря на официальный запрет, фермы из поднебесной все еще генерируют ощутимую долю мировой мощности. Более того, Китай находится на уверенном третьем месте по объемам хешрейта: настолько велико участие «серых» участников отрасли. Также не исключено наличие масштабных правительственных ферм, хотя сами власти страны никак не комментируют такую вероятность."}$b46$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-stran-po-majningu-top-8-gosudarstv-liderov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 47, 'image',
       $b47${"src":"/images/articles/rating-countries/map-bitcoin-wide.png","alt":"Bitcoin и карта мира — Китай"}$b47$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-stran-po-majningu-top-8-gosudarstv-liderov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 48, 'stats',
       $b48${"rows":[{"label":"Доля в мировом хешрейте","value":"около 10%"},{"label":"Энергетика","value":"классические электростанции"},{"label":"Крупнейшие инвесторы и фермы","value":"нет данных"}]}$b48$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-stran-po-majningu-top-8-gosudarstv-liderov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 49, 'pros_cons',
       $b49${"pros":["Китай – родина всей майнинговой инфраструктуры;","Сосредоточение крупнейших производителей техники."],"cons":["Официальный запрет и суровые наказания за нарушение законов."]}$b49$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-stran-po-majningu-top-8-gosudarstv-liderov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 50, 'heading',
       $h50${"level":2,"text":"2 место: Россия"}$h50$::jsonb,
       'rossiya'
FROM articles a WHERE a.slug = 'rejting-stran-po-majningu-top-8-gosudarstv-liderov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 51, 'paragraph',
       $b51${"text":"Стремительный толчок в развитии российского майнинга был дан в 2021 году, когда Китай запретил криптовалюты. В страны СНГ хлынул поток асиков, а на долю РФ пришлись наиболее ощутимые поставки. Недорогое электричество (особенно в регионах Сибири), прохладный климат и полное отсутствие запретов сделали Россию одним из центров мирового майнинга. В 2024 году появилось профильное законодательство, призванное легализовать отрасль и направить ее в правовое русло – теперь добывать криптовалюты в нашей стране можно полностью официально.","html":"Стремительный толчок в развитии российского майнинга был дан в 2021 году, когда Китай запретил криптовалюты. В страны СНГ хлынул поток асиков, а на долю РФ пришлись наиболее ощутимые поставки. Недорогое электричество (особенно в регионах Сибири), прохладный климат и полное отсутствие запретов сделали Россию одним из центров мирового майнинга. В 2024 году появилось профильное законодательство, призванное легализовать отрасль и направить ее в правовое русло – теперь добывать криптовалюты в нашей стране можно полностью официально."}$b51$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-stran-po-majningu-top-8-gosudarstv-liderov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 52, 'paragraph',
       $b52${"text":"Правда, без «ложки дегтя» не обошлось: в 13 регионах страны введены ограничения или полный запрет на добычу криптовалют, что запустило процесс миграции ферм. Родина российского майнинга, Иркутская область, также попала под ограничения – теперь здесь нельзя запускать асики во время отопительного сезона. Результатом подобных действий властей может стать утрата РФ позиций в доле мирового хешрейта. Несмотря на это, некоторые эксперты не исключают обратной ситуации, когда Россия сможет на равных конкурировать с США за звание мировой столицы майнинга.","html":"Правда, без «ложки дегтя» не обошлось: в 13 регионах страны введены ограничения или полный запрет на добычу криптовалют, что запустило процесс миграции ферм. Родина российского майнинга, Иркутская область, также попала под ограничения – теперь здесь нельзя запускать асики во время отопительного сезона. Результатом подобных действий властей может стать утрата РФ позиций в доле мирового хешрейта. Несмотря на это, некоторые эксперты не исключают обратной ситуации, когда Россия сможет на равных конкурировать с США за звание мировой столицы майнинга."}$b52$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-stran-po-majningu-top-8-gosudarstv-liderov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 53, 'image',
       $b53${"src":"/images/articles/rating-countries/datacenter-orange.png","alt":"Майнинг-ферма — Россия"}$b53$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-stran-po-majningu-top-8-gosudarstv-liderov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 54, 'stats',
       $b54${"rows":[{"label":"Доля в мировом хешрейте","value":"до 15%"},{"label":"Энергетика","value":"классические электростанции"},{"label":"Крупнейшие инвесторы и фермы","value":"BitRiver, Intelion Data Systems, Promminer, Sibmain, BitCluster"}]}$b54$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-stran-po-majningu-top-8-gosudarstv-liderov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 55, 'pros_cons',
       $b55${"pros":["Недорогое электричество;","Прохладный климат;","Появление законодательства, легализующего добычу."],"cons":["Запреты и ограничения для некоторых регионов."]}$b55$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-stran-po-majningu-top-8-gosudarstv-liderov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 56, 'heading',
       $h56${"level":2,"text":"1 место: США"}$h56$::jsonb,
       'ssha'
FROM articles a WHERE a.slug = 'rejting-stran-po-majningu-top-8-gosudarstv-liderov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 57, 'paragraph',
       $b57${"text":"Безоговорочным лидером мирового рейтинга после 2021 года являются Соединенные Штаты Америки: страна контролирует до 40% общего хешрейта. С приходом к власти Дональда Трампа укрепление позиций продолжается: новый президент стремится сделать США мировым центром криптовалютной индустрии, а майнинг должен стать неотъемлемой частью этой инфраструктуры.","html":"Безоговорочным лидером мирового рейтинга после 2021 года являются Соединенные Штаты Америки: страна контролирует до 40% общего хешрейта. С приходом к власти Дональда Трампа укрепление позиций продолжается: новый президент стремится сделать США мировым центром криптовалютной индустрии, а майнинг должен стать неотъемлемой частью этой инфраструктуры."}$b57$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-stran-po-majningu-top-8-gosudarstv-liderov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 58, 'paragraph',
       $b58${"text":"В США есть профильное законодательство, которое регулирует деятельность майнеров. В свою очередь, основная доля всего хешрейта сосредоточена в руках фундаментальных участников рынка – это крупные компании, аналогов которым в мире не существует. Масштабные фермы часто используют возобновляемые источники энергии, а также недорогое электричество некоторых штатов, что формирует благоприятную среду для запуска оборудования.","html":"В США есть профильное законодательство, которое регулирует деятельность майнеров. В свою очередь, основная доля всего хешрейта сосредоточена в руках фундаментальных участников рынка – это крупные компании, аналогов которым в мире не существует. Масштабные фермы часто используют возобновляемые источники энергии, а также недорогое электричество некоторых штатов, что формирует благоприятную среду для запуска оборудования."}$b58$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-stran-po-majningu-top-8-gosudarstv-liderov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 59, 'image',
       $b59${"src":"/images/articles/rating-countries/datacenter-orange.png","alt":"Крупная майнинг-ферма — США"}$b59$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-stran-po-majningu-top-8-gosudarstv-liderov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 60, 'stats',
       $b60${"rows":[{"label":"Доля в мировом хешрейте","value":"до 40%"},{"label":"Энергетика","value":"классические электростанции, солнечные батареи"},{"label":"Крупнейшие инвесторы и фермы","value":"Marathon Digital Holdings, Hut 8 Mining, Bitdeer"}]}$b60$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-stran-po-majningu-top-8-gosudarstv-liderov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 61, 'pros_cons',
       $b61${"pros":["Наличие богатой инфраструктуры;","Подходящая законодательная база;","Стремление новых властей развивать нишу;","Ориентация на возобновляемые источники электрификации ферм."],"cons":["Суровые законы и юридические ограничения."]}$b61$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-stran-po-majningu-top-8-gosudarstv-liderov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 62, 'heading',
       $h62${"level":2,"text":"Выводы"}$h62$::jsonb,
       'vyvody'
FROM articles a WHERE a.slug = 'rejting-stran-po-majningu-top-8-gosudarstv-liderov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 63, 'paragraph',
       $b63${"text":"Рейтинг ТОП-8 мировых государств по объемам добычи криптовалют выглядит следующим образом:","html":"Рейтинг ТОП-8 мировых государств по объемам добычи криптовалют выглядит следующим образом:"}$b63$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-stran-po-majningu-top-8-gosudarstv-liderov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 64, 'list',
       $b64${"ordered":false,"items":["США;","Россия;","Китай;","ОАЭ;","Казахстан;","Канада;","Эфиопия;","Сальвадор."]}$b64$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-stran-po-majningu-top-8-gosudarstv-liderov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 65, 'paragraph',
       $b65${"text":"Есть и другие участники процесса (например, Норвегия, Швеция, Германия, Ирландия, Иран и т.д.), однако, наиболее ярко и перспективно смотрятся именно те страны, которые оказались в нашем анализе.","html":"Есть и другие участники процесса (например, Норвегия, Швеция, Германия, Ирландия, Иран и т.д.), однако, наиболее ярко и перспективно смотрятся именно те страны, которые оказались в нашем анализе."}$b65$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-stran-po-majningu-top-8-gosudarstv-liderov';

-- Blocks: gde-kupit-asik-dlya-majninga-top-10-magazinov
INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 1, 'heading',
       $h66${"level":2,"text":"Введение"}$h66$::jsonb,
       'vvedenie'
FROM articles a WHERE a.slug = 'gde-kupit-asik-dlya-majninga-top-10-magazinov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 2, 'paragraph',
       $b67${"text":"Где купить асик? Самый популярный вопрос, который чаще всего задают не только начинающие, но и опытные майнеры. Качество выбора магазина при покупке ASIC-майнера – это не только «где подешевле», а также вопрос надежности, безопасности и выгоды. Вот почему это важно:","html":"Где купить асик? Самый популярный вопрос, который чаще всего задают не только начинающие, но и опытные майнеры. Качество выбора магазина при покупке ASIC-майнера – это не только «где подешевле», а также вопрос надежности, безопасности и выгоды. Вот почему это важно:"}$b67$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'gde-kupit-asik-dlya-majninga-top-10-magazinov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 3, 'list',
       $b68${"ordered":false,"items":["Деньги на ветер – если оказаться в руках мошенников, можно остаться без асика и без денег;","Брак и поломки – в ненадежном магазине могут продать подержанный или неисправный майнер без гарантии;","Нет поддержки – без помощи инвестор потратит много времени и нервов на настройку и обслуживание техники;","Неоправданные затраты – скрытые платежи, растаможка, доставка и переплаты могут «съесть» всю выгоду от майнинга;","Проблемы с законом – если оборудование ввезено «в серую», могут быть сложности с таможней или налоговой. Особенно актуально в последнее время, так как наличие грузовой таможенной декларации является обязательным требованием для легальной добычи."]}$b68$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'gde-kupit-asik-dlya-majninga-top-10-magazinov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 4, 'paragraph',
       $b69${"text":"Хороший магазин – это надежная страховка от проблем, потерь и нервотрепки. Поэтому отвечая на вопрос, где купить асик, следует проанализировать множество факторов.","html":"Хороший магазин – это надежная страховка от проблем, потерь и нервотрепки. Поэтому отвечая на вопрос, где купить асик, следует проанализировать множество факторов."}$b69$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'gde-kupit-asik-dlya-majninga-top-10-magazinov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 5, 'heading',
       $h70${"level":2,"text":"Где купить асик: критерии грамотного выбора"}$h70$::jsonb,
       'kriterii-vybora'
FROM articles a WHERE a.slug = 'gde-kupit-asik-dlya-majninga-top-10-magazinov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 6, 'paragraph',
       $b71${"text":"Экспресс-анализ магазина для потенциальной покупки майнера можно провести при помощи простой таблицы. В ней мы рассмотрели ключевые требования к продавцам оборудования для майнинга.","html":"Экспресс-анализ магазина для потенциальной покупки майнера можно провести при помощи простой таблицы. В ней мы рассмотрели ключевые требования к продавцам оборудования для майнинга."}$b71$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'gde-kupit-asik-dlya-majninga-top-10-magazinov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 7, 'stats',
       $b72${"rows":[{"label":"Критерий","value":"Описание"},{"label":"Репутация и опыт работы","value":"Изучите историю компании, отзывы клиентов на независимых площадках и форумах. Убедитесь, что компания участвует в профильных выставках и конференциях."},{"label":"Ассортимент и актуальность моделей","value":"Убедитесь, что компания предлагает современные модели ASIC-майнеров для различных алгоритмов (SHA-256, Scrypt, Ethash и др.). Обратите внимание на наличие информации о хешрейте, энергопотреблении и эффективности для каждой модели."},{"label":"Прозрачность ценообразования","value":"Сравните цены с другими поставщиками. Уточните, включены ли в стоимость доставка, таможенные пошлины и НДС."},{"label":"Гарантия и сервисное обслуживание","value":"Проверьте условия гарантии и наличие сертифицированных сервисных центров. Уточните процедуру возврата и обмена оборудования."},{"label":"Техническая поддержка","value":"Оцените качество и оперативность технической поддержки, задав несколько вопросов. Узнайте, предоставляет ли компания помощь в настройке и оптимизации оборудования."},{"label":"Легальность деятельности","value":"Проверьте наличие юридической информации на сайте компании (ИНН, ОГРН). Убедитесь, что компания имеет необходимые лицензии и сертификаты."},{"label":"Условия доставки и оплаты","value":"Уточните сроки и способы доставки. Изучите доступные методы оплаты и их безопасность."},{"label":"Дополнительные услуги","value":"Узнайте, предлагает ли компания услуги хостинга или помощь в размещении оборудования в дата-центрах."}]}$b72$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'gde-kupit-asik-dlya-majninga-top-10-magazinov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 8, 'paragraph',
       $b73${"text":"Рассмотрим каждый элемент списка более детальным образом:","html":"Рассмотрим каждый элемент списка более детальным образом:"}$b73$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'gde-kupit-asik-dlya-majninga-top-10-magazinov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 9, 'rich_list',
       $b74${"ordered":false,"items":[{"title":"Репутация и опыт работы","text":"Почему важно: на рынке майнинга много посредников и сомнительных продавцов, а хорошая репутация снижает риск нарваться на мошенников. На что смотреть: отзывы на форумах и Telegram-чаты майнеров, время работы на рынке (чем дольше, тем лучше), соцсети, участие в выставках, упоминания в СМИ, наличие публичных кейсов и отзывов от крупных клиентов;"},{"title":"Ассортимент и актуальность моделей","text":"Почему важно: разные устройства работают на разных алгоритмах и дают разную доходность. На что смотреть: есть ли популярные модели, например, Antminer S21 или Antminer L9, актуальна ли информация на сайте о хешрейте, энергопотреблении, температурных режимах, есть ли фильтр по алгоритмам (SHA-256, EtHash), могут ли помочь подобрать модель под ваши цели (дата-центр/домашний майнинг и т.п.);"},{"title":"Прозрачность ценообразования","text":"Почему важно: некоторые магазины привлекают низкой ценой, а потом добавляют скрытые платежи. На что смотреть: цена «под ключ» (включена ли доставка, НДС, растаможка), есть ли онлайн-калькулятор или коммерческое предложение, возможность зафиксировать курс при бронировании или авансовых платежах;"},{"title":"Гарантия и сервисное обслуживание","text":"Почему важно: асик может выйти из строя, особенно при доставке или неправильной настройке. На что смотреть: срок гарантии (обычно 6–12 месяцев), что входит в гарантию (например, ремонт платы, замена вентилятора), есть ли сервисный центр в России, условия возврата или обмена (в течение 14 дней);"},{"title":"Техническая поддержка","text":"Почему важно: настройка аппаратуры может быть непростой задачей для новичков. На что смотреть: насколько быстро и подробно отвечают на вопросы до покупки, есть ли поддержка после продажи (телеграм, e-mail, звонки), готовы ли помочь с настройкой, прошивкой, подключением к пулу, проводят ли обучение или выдают инструкции;"},{"title":"Легальность деятельности","text":"Почему важно: работа с зарегистрированным юр. лицом – это надежность и защита прав покупателей. На что смотреть: есть ли ИНН/ОГРН на сайте, работа по договору, предоставление чеков, официальная поставка с ГТД, а не «серый импорт», готовность заключить договор купли-продажи с юрлицом/ИП;"},{"title":"Условия доставки и оплаты","text":"Почему важно: некачественная логистика = риск получить поврежденный товар. На что смотреть: есть ли доставка в ваш город, по РФ или за границу, работа с транспортными компаниями (СДЭК, Деловые Линии), можно ли оплатить криптой, банковским переводом, через расчетный счет, возможна ли оплата частями или рассрочка;"},{"title":"Дополнительные услуги","text":"Почему важно: майнинг – это не только покупка, но и эксплуатация. На что смотреть: услуги хостинга (размещение в дата-центре), установка, настройка под ключ, обслуживание и ремонт, предоставление API или удаленного мониторинга;"},{"title":"Соответствие законодательству","text":"Почему важно: в России теперь есть четкие правила по регулированию майнинга. На что смотреть: продавец ориентируется в текущем законодательстве, не нарушает закон о ввозе/использовании оборудования (наличие грузовой таможенной декларации), может оформить покупку официально с учетом НДС;"},{"title":"Отзывы и рекомендации","text":"Почему важно: реальный опыт других пользователей может сказать больше, чем реклама. На что смотреть: есть ли положительные и отрицательные отзывы, отвечает ли магазин на критику, есть ли кейсы на сайтах или в Telegram от клиентов."}]}$b74$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'gde-kupit-asik-dlya-majninga-top-10-magazinov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 10, 'paragraph',
       $b75${"text":"Как купить асик? Выбор надежного и проверенного поставщика оборудования – ключевой фактор для минимизации рисков, обеспечения бесперебойной работы устройств и достижения планируемой доходности. Ответственный подход к выбору партнера позволяет избежать финансовых потерь, технических проблем и правовых сложностей.","html":"Как купить асик? Выбор надежного и проверенного поставщика оборудования – ключевой фактор для минимизации рисков, обеспечения бесперебойной работы устройств и достижения планируемой доходности. Ответственный подход к выбору партнера позволяет избежать финансовых потерь, технических проблем и правовых сложностей."}$b75$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'gde-kupit-asik-dlya-majninga-top-10-magazinov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 11, 'heading',
       $h76${"level":2,"text":"10 место: R7miner (Эрсемьмайнер)"}$h76$::jsonb,
       'r7miner'
FROM articles a WHERE a.slug = 'gde-kupit-asik-dlya-majninga-top-10-magazinov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 12, 'paragraph',
       $b77${"text":"Компания R7miner с 2017 года осуществляет продажи оборудования для майнинга, а в 2023 году был открыт собственный дата-центр в городе Троицке. Магазин акцентирует внимание на полностью легальном ввозе техники из Китая со всеми сопроводительными и подтверждающими документами. Продавец работает с продукцией Bitmain и Whatsminer, что несколько ограничивает возможности майнеров. Зато для юридических лиц есть лизинг, а доставка заказа осуществляется «под ключ» с минимальным участием клиента. Головной офис располагается в Санкт-Петербурге, есть представительство и склад в Москве.","html":"Компания R7miner с 2017 года осуществляет продажи оборудования для майнинга, а в 2023 году был открыт собственный дата-центр в городе Троицке. Магазин акцентирует внимание на полностью легальном ввозе техники из Китая со всеми сопроводительными и подтверждающими документами. Продавец работает с продукцией Bitmain и Whatsminer, что несколько ограничивает возможности майнеров. Зато для юридических лиц есть лизинг, а доставка заказа осуществляется «под ключ» с минимальным участием клиента. Головной офис располагается в Санкт-Петербурге, есть представительство и склад в Москве."}$b77$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'gde-kupit-asik-dlya-majninga-top-10-magazinov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 13, 'image',
       $b78${"src":"/images/articles/rating-countries/datacenter-fans.png","alt":"R7miner — оборудование для майнинга"}$b78$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'gde-kupit-asik-dlya-majninga-top-10-magazinov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 14, 'stats',
       $b79${"rows":[{"label":"Юридическое лицо","value":"ООО «РАЙТ ГРУПП»"},{"label":"Выручка","value":"305.1 млн ₽"},{"label":"Суды","value":"Нет"},{"label":"Лет на рынке","value":"более 2,5"},{"label":"Уставной капитал","value":"10 тыс ₽"},{"label":"Сайт","value":"r7miner.com"},{"label":"Собственный хостинг","value":"да"},{"label":"Официальные продажи оборудования","value":"да"},{"label":"Неофициальные продажи оборудования","value":"нет данных"},{"label":"Дата регистрации домена","value":"2022 год"},{"label":"Рейтинг магазина, Яндекс","value":"4,4"},{"label":"Количество отзывов, Яндекс","value":"13"},{"label":"Адрес офиса","value":"Санкт-Петербург, 10-я линия В.О., 15, Лит. А, пом. 1Н"},{"label":"Бренды оборудования","value":"Bitmain, Whatsminer"}]}$b79$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'gde-kupit-asik-dlya-majninga-top-10-magazinov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 15, 'pros_cons',
       $b80${"pros":["Абсолютно «белый» способ продажи техники и оборудования;","Собственный хостинг;","Лизинг для юридических лиц;","Акцент на оперативной доставке;"],"cons":["Скромный рейтинг компании в Яндексе;","Небольшое количество отзывов."]}$b80$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'gde-kupit-asik-dlya-majninga-top-10-magazinov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 16, 'heading',
       $h81${"level":2,"text":"9 место: Sibmain (Сибмайн)"}$h81$::jsonb,
       'sibmain'
FROM articles a WHERE a.slug = 'gde-kupit-asik-dlya-majninga-top-10-magazinov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 17, 'paragraph',
       $b82${"text":"Еще одной компанией, реализующей комплексный подход к майнингу, является Sibmain. Здесь можно купить оборудование для добычи криптовалют и разместить его в сибирском дата-центре с выгодными тарифами на электроэнергию. Магазин предлагает базовый ассортимент – представлены основные модели именитых производителей, среди которых Bitmain, Whatsminer, Canaan, Innisilicon, Jasminer, iPollo и Goldshell.","html":"Еще одной компанией, реализующей комплексный подход к майнингу, является Sibmain. Здесь можно купить оборудование для добычи криптовалют и разместить его в сибирском дата-центре с выгодными тарифами на электроэнергию. Магазин предлагает базовый ассортимент – представлены основные модели именитых производителей, среди которых Bitmain, Whatsminer, Canaan, Innisilicon, Jasminer, iPollo и Goldshell."}$b82$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'gde-kupit-asik-dlya-majninga-top-10-magazinov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 18, 'paragraph',
       $b83${"text":"Покупателей может отпугнуть отсутствие большого числа отзывов на профильных площадках – и это несмотря на то, что Сибмайн оказывает профильные услуги уже более пяти лет. Зато клиентам доступен формат лизинга, а также инвестирование в майнинг с окупаемостью от 10 месяцев.","html":"Покупателей может отпугнуть отсутствие большого числа отзывов на профильных площадках – и это несмотря на то, что Сибмайн оказывает профильные услуги уже более пяти лет. Зато клиентам доступен формат лизинга, а также инвестирование в майнинг с окупаемостью от 10 месяцев."}$b83$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'gde-kupit-asik-dlya-majninga-top-10-magazinov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 19, 'image',
       $b84${"src":"/images/articles/rating-countries/datacenter-orange.png","alt":"Sibmain — майнинг в Сибири"}$b84$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'gde-kupit-asik-dlya-majninga-top-10-magazinov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 20, 'stats',
       $b85${"rows":[{"label":"Юридическое лицо","value":"нет данных"},{"label":"Выручка","value":"нет данных"},{"label":"Суды","value":"нет данных"},{"label":"Лет на рынке","value":"нет данных"},{"label":"Уставной капитал","value":"нет данных"},{"label":"Сайт","value":"sibmain.ru"},{"label":"Собственный хостинг","value":"да"},{"label":"Официальные продажи оборудования","value":"нет данных"},{"label":"Неофициальные продажи оборудования","value":"нет данных"},{"label":"Дата регистрации домена","value":"2021 год"},{"label":"Рейтинг магазина, Яндекс","value":"4,9"},{"label":"Количество отзывов, Яндекс","value":"17"},{"label":"Адрес офиса","value":"Москва, Калужская площадь, 1/1"},{"label":"Бренды оборудования","value":"Bitmain, Whatsminer, Canaan, Innisilicon, Jasminer, iPollo, Goldshell"}]}$b85$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'gde-kupit-asik-dlya-majninga-top-10-magazinov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 21, 'pros_cons',
       $b86${"pros":["Собственный хостинг в Сибири;","Цены на некоторые позиции выглядят привлекательно;","Наличие базового ассортимента популярных моделей;","Сопровождение клиента «под ключ»;","Формат инвестиционного сотрудничества."],"cons":["Небольшое количество отзывов о компании."]}$b86$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'gde-kupit-asik-dlya-majninga-top-10-magazinov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 22, 'heading',
       $h87${"level":2,"text":"8 место: Getasic (Гетасик)"}$h87$::jsonb,
       'getasic'
FROM articles a WHERE a.slug = 'gde-kupit-asik-dlya-majninga-top-10-magazinov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 23, 'paragraph',
       $b88${"text":"Компания Getasic оказывает услуги в сфере продажи и размещения оборудования для майнинга с 2017 года. За время работы продавец зарекомендовал себя в качестве проверенного контрагента, предоставляющего впечатляющий ассортимент техники для добычи криптовалют. В магазине Getasic можно найти даже редкие модели асиков, которые отсутствуют на товарных полках конкурентов. Также покупателям предлагается рассрочка и лизинг для юридических лиц. Часть оборудования находится на складах в РФ, доставку остальных позиций придется ждать из Китая.","html":"Компания Getasic оказывает услуги в сфере продажи и размещения оборудования для майнинга с 2017 года. За время работы продавец зарекомендовал себя в качестве проверенного контрагента, предоставляющего впечатляющий ассортимент техники для добычи криптовалют. В магазине Getasic можно найти даже редкие модели асиков, которые отсутствуют на товарных полках конкурентов. Также покупателям предлагается рассрочка и лизинг для юридических лиц. Часть оборудования находится на складах в РФ, доставку остальных позиций придется ждать из Китая."}$b88$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'gde-kupit-asik-dlya-majninga-top-10-magazinov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 24, 'paragraph',
       $b89${"text":"Помимо продажи аппаратуры Getasic предлагает услуги майнинг-отеля и сервисного центра. Для начинающих майнеров есть бесплатный обучающий курс, а для продвинутых пользователей – прошивки для оптимизации работы техники. До 2022 года был отмечен определенный объем негативных отзывов, однако, проведенная работа над ошибками позволила исправить ситуацию – с тех пор отзывы о компании Гетасик только положительные.","html":"Помимо продажи аппаратуры Getasic предлагает услуги майнинг-отеля и сервисного центра. Для начинающих майнеров есть бесплатный обучающий курс, а для продвинутых пользователей – прошивки для оптимизации работы техники. До 2022 года был отмечен определенный объем негативных отзывов, однако, проведенная работа над ошибками позволила исправить ситуацию – с тех пор отзывы о компании Гетасик только положительные."}$b89$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'gde-kupit-asik-dlya-majninga-top-10-magazinov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 25, 'image',
       $b90${"src":"/images/articles/rating-countries/globe-coins.png","alt":"Getasic — магазин асиков"}$b90$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'gde-kupit-asik-dlya-majninga-top-10-magazinov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 26, 'stats',
       $b91${"rows":[{"label":"Юридическое лицо","value":"нет данных"},{"label":"Выручка","value":"нет данных"},{"label":"Суды","value":"нет данных"},{"label":"Лет на рынке","value":"нет данных"},{"label":"Уставной капитал","value":"нет данных"},{"label":"Сайт","value":"miningmoon.ru"},{"label":"Собственный хостинг","value":"нет данных"},{"label":"Официальные продажи оборудования","value":"да"},{"label":"Неофициальные продажи оборудования","value":"да"},{"label":"Дата регистрации домена","value":"2017 год"},{"label":"Рейтинг магазина, Яндекс","value":"4,9"},{"label":"Количество отзывов, Яндекс","value":"83"},{"label":"Адрес офиса","value":"Москва, Остаповский проезд, 3, стр. 29"},{"label":"Бренды оборудования","value":"Aixin, Baikal, Bitfly, Bitmain, Canaan, Cheetah, Dayun, Dragonmint, Ebang, Goldshell, Hummer, iBeLink, Innosilicon, Jasminer, MicroBT, StrongU, Toddminer, Iceriver"}]}$b91$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'gde-kupit-asik-dlya-majninga-top-10-magazinov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 27, 'pros_cons',
       $b92${"pros":["Старый проверенный поставщик;","Большой ассортимент производителей и доступных к покупке моделей;","Собственный хостинг и сервисный центр;","Лизинг и рассрочка;","Официальный формат работы со всеми необходимыми документами;","Представлены авторские прошивки для оборудования;","Безупречная репутация с 2022 года;","Продажа как со склада в Москве, так и оптовый формат работы с Китаем;","Несколько офисов в России."],"cons":["Негативные отзывы до 2022 года."]}$b92$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'gde-kupit-asik-dlya-majninga-top-10-magazinov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 28, 'heading',
       $h93${"level":2,"text":"7 место: Asgard (Асгард)"}$h93$::jsonb,
       'asgard'
FROM articles a WHERE a.slug = 'gde-kupit-asik-dlya-majninga-top-10-magazinov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 29, 'paragraph',
       $b94${"text":"Компания Asgard ведет деятельность по продаже техники для майнинга с 2017 года. Помимо магазина Асгард предоставляет услуги сервисного центра, хостинга, а также инвестирования в добычу криптовалют. Неплохой ассортимент техники дополняется заверениями продавца о том, что более 90% позиций находятся на складах в России – нет необходимости ждать долгой доставки из Китая. Помимо техники для майнинга компания Асгард предлагает готовые контейнеры, комплекты иммерсионного охлаждения и комплектующие.","html":"Компания Asgard ведет деятельность по продаже техники для майнинга с 2017 года. Помимо магазина Асгард предоставляет услуги сервисного центра, хостинга, а также инвестирования в добычу криптовалют. Неплохой ассортимент техники дополняется заверениями продавца о том, что более 90% позиций находятся на складах в России – нет необходимости ждать долгой доставки из Китая. Помимо техники для майнинга компания Асгард предлагает готовые контейнеры, комплекты иммерсионного охлаждения и комплектующие."}$b94$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'gde-kupit-asik-dlya-majninga-top-10-magazinov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 30, 'paragraph',
       $b95${"text":"У компании хорошая репутация надежного контрагента, а конкурентные цены позволяют совершать приобретение техники на рыночных условиях. Для юридических лиц возможен лизинг, а для оптовых покупателей действуют специальные цены.","html":"У компании хорошая репутация надежного контрагента, а конкурентные цены позволяют совершать приобретение техники на рыночных условиях. Для юридических лиц возможен лизинг, а для оптовых покупателей действуют специальные цены."}$b95$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'gde-kupit-asik-dlya-majninga-top-10-magazinov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 31, 'image',
       $b96${"src":"/images/articles/rating-countries/datacenter-orange.png","alt":"Asgard — магазин и хостинг"}$b96$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'gde-kupit-asik-dlya-majninga-top-10-magazinov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 32, 'stats',
       $b97${"rows":[{"label":"Юридическое лицо","value":"ООО «АСГАРД»"},{"label":"Выручка","value":"175.5 млн ₽"},{"label":"Суды","value":"Нет"},{"label":"Лет на рынке","value":"более 3"},{"label":"Уставной капитал","value":"50 тыс ₽"},{"label":"Сайт","value":"asg-ard.ru"},{"label":"Собственный хостинг","value":"да"},{"label":"Официальные продажи оборудования","value":"нет данных"},{"label":"Неофициальные продажи оборудования","value":"нет данных"},{"label":"Дата регистрации домена","value":"2021 год"},{"label":"Рейтинг магазина, Яндекс","value":"4,8"},{"label":"Количество отзывов, Яндекс","value":"42"},{"label":"Адрес офиса","value":"Москва, 2й Кабельный проезд 2А"},{"label":"Бренды оборудования","value":"Bitmain, Whatsminer, Canaan, Innisilicon"}]}$b97$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'gde-kupit-asik-dlya-majninga-top-10-magazinov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 33, 'pros_cons',
       $b98${"pros":["Достойный ассортимент популярного оборудования;","Собственный хостинг и сервисный центр;","Инвестиционный формат сотрудничества;","Лизинг для юридических лиц;","Основная часть оборудования находится на складах в России;","Ассортимент дополнен комплектами водяного охлаждения;","Несколько офисов в России."],"cons":["Встречаются негативные отзывы о медленной работе и некачественном ремонте."]}$b98$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'gde-kupit-asik-dlya-majninga-top-10-magazinov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 34, 'heading',
       $h99${"level":2,"text":"6 место: Umnus (Умнус)"}$h99$::jsonb,
       'umnus'
FROM articles a WHERE a.slug = 'gde-kupit-asik-dlya-majninga-top-10-magazinov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 35, 'paragraph',
       $b100${"text":"Оператор промышленного майнинга Umnus позиционируется как компания с комплексным подходом к добыче криптовалют. Это не только магазин оборудования, но и хостинг с двумя площадками, сервисный центр, а также бизнес-партнер, предлагающий разнообразные форматы инвестиций в криптовалюты. Можно выбрать пакетные варианты взаимодействия с разной доходностью, если не планируется самостоятельная добыча цифровых активов и знакомство с техническими нюансами этого бизнеса.","html":"Оператор промышленного майнинга Umnus позиционируется как компания с комплексным подходом к добыче криптовалют. Это не только магазин оборудования, но и хостинг с двумя площадками, сервисный центр, а также бизнес-партнер, предлагающий разнообразные форматы инвестиций в криптовалюты. Можно выбрать пакетные варианты взаимодействия с разной доходностью, если не планируется самостоятельная добыча цифровых активов и знакомство с техническими нюансами этого бизнеса."}$b100$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'gde-kupit-asik-dlya-majninga-top-10-magazinov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 36, 'paragraph',
       $b101${"text":"Ассортимент компании Umnus ограничен лишь некоторыми производителями техники, а навигация на сайте не отличается удобством и качеством. Модель работы Умнуса в большей степени ориентирована именно на инвесторов и бизнес-партнеров, в то время как частные майнеры и простые покупатели могут испытывать некоторые трудности.","html":"Ассортимент компании Umnus ограничен лишь некоторыми производителями техники, а навигация на сайте не отличается удобством и качеством. Модель работы Умнуса в большей степени ориентирована именно на инвесторов и бизнес-партнеров, в то время как частные майнеры и простые покупатели могут испытывать некоторые трудности."}$b101$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'gde-kupit-asik-dlya-majninga-top-10-magazinov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 37, 'image',
       $b102${"src":"/images/articles/rating-countries/map-bitcoin-coins.png","alt":"Umnus — промышленный майнинг"}$b102$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'gde-kupit-asik-dlya-majninga-top-10-magazinov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 38, 'stats',
       $b103${"rows":[{"label":"Юридическое лицо","value":"ООО «УМНЫЕ УСТРОЙСТВА»"},{"label":"Выручка","value":"246 млн ₽"},{"label":"Суды","value":"Истец: выиграл - 0%, проиграл - 100%"},{"label":"Лет на рынке","value":"более 4"},{"label":"Уставной капитал","value":"8.5 млн ₽"},{"label":"Сайт","value":"umnus.ru"},{"label":"Собственный хостинг","value":"да"},{"label":"Официальные продажи оборудования","value":"нет данных"},{"label":"Неофициальные продажи оборудования","value":"нет данных"},{"label":"Дата регистрации домена","value":"2019 год"},{"label":"Рейтинг магазина, Яндекс","value":"4,7"},{"label":"Количество отзывов, Яндекс","value":"35"},{"label":"Адрес офиса","value":"Москва, Нагорный проезд, дом 10, корпус 2, строение 3"},{"label":"Бренды оборудования","value":"Bitmain, Whatsminer, Canaan"}]}$b103$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'gde-kupit-asik-dlya-majninga-top-10-magazinov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 39, 'pros_cons',
       $b104${"pros":["Комплексный подход к работе с криптовалютами;","Ориентация на инвестиции и бизнес-партнерство (готовые пакеты);","Два дата-центра (Электрогорск и Сосновоборск);","Собственный сервисный центр;","Авторское мобильное приложение для Google Play и App Store."],"cons":["Ограниченный ассортимент оборудования;","Не всегда корректная работа сайта;","Небольшое количество отзывов о компании."]}$b104$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'gde-kupit-asik-dlya-majninga-top-10-magazinov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 40, 'heading',
       $h105${"level":2,"text":"5 место: Uminers (Юмайнерс)"}$h105$::jsonb,
       'uminers'
FROM articles a WHERE a.slug = 'gde-kupit-asik-dlya-majninga-top-10-magazinov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 41, 'paragraph',
       $b106${"text":"Компания Uminers является частью международной цифровой платформы, объединяющей маркетплейс, систему логистики и хостинг для размещения оборудования. Головной офис начал свою работу в Китае в 2014 году, в то время как российское представительство значительно моложе. В каталоге магазина представлены асики компаний Whatsminer, Bitmain, Innosilicon и некоторые модели видеокарт. Часть ассортимента находится на складе в Москве, остальные товарные запасы отправляются из Китая.","html":"Компания Uminers является частью международной цифровой платформы, объединяющей маркетплейс, систему логистики и хостинг для размещения оборудования. Головной офис начал свою работу в Китае в 2014 году, в то время как российское представительство значительно моложе. В каталоге магазина представлены асики компаний Whatsminer, Bitmain, Innosilicon и некоторые модели видеокарт. Часть ассортимента находится на складе в Москве, остальные товарные запасы отправляются из Китая."}$b106$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'gde-kupit-asik-dlya-majninga-top-10-magazinov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 42, 'paragraph',
       $b107${"text":"Компания небольшая, ассортимент основывается на базовых моделях, однако, стоимость техники вполне конкурентная. Негатив практически отсутствует, а при желании покупатель может разместить собственное оборудование в дата-центре компании Юмайнерс в Красноярске. Кроме того, Uminers оказывает логистические услуги по всему миру, так как это направление является одним из ключевых для бренда.","html":"Компания небольшая, ассортимент основывается на базовых моделях, однако, стоимость техники вполне конкурентная. Негатив практически отсутствует, а при желании покупатель может разместить собственное оборудование в дата-центре компании Юмайнерс в Красноярске. Кроме того, Uminers оказывает логистические услуги по всему миру, так как это направление является одним из ключевых для бренда."}$b107$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'gde-kupit-asik-dlya-majninga-top-10-magazinov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 43, 'image',
       $b108${"src":"/images/articles/rating-countries/datacenter-fans.png","alt":"Uminers — маркетплейс и логистика"}$b108$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'gde-kupit-asik-dlya-majninga-top-10-magazinov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 44, 'stats',
       $b109${"rows":[{"label":"Юридическое лицо","value":"нет данных"},{"label":"Выручка","value":"нет данных"},{"label":"Суды","value":"нет данных"},{"label":"Лет на рынке","value":"нет данных"},{"label":"Уставной капитал","value":"нет данных"},{"label":"Сайт","value":"uminers.com"},{"label":"Собственный хостинг","value":"да"},{"label":"Официальные продажи оборудования","value":"нет данных"},{"label":"Неофициальные продажи оборудования","value":"нет данных"},{"label":"Дата регистрации домена","value":"2017 год"},{"label":"Рейтинг магазина, Яндекс","value":"4,9"},{"label":"Количество отзывов, Яндекс","value":"29"},{"label":"Адрес офиса","value":"Москва, Ходынский бульвар, д. 11"},{"label":"Бренды оборудования","value":"Bitmain, Whatsminer, Innosilicon"}]}$b109$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'gde-kupit-asik-dlya-majninga-top-10-magazinov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 45, 'pros_cons',
       $b110${"pros":["Часть международной платформы с офисом в Китае;","Конкурентные цены;","В каталоге представлены не только асики, но и видеокарты;","Собственный дата-центр в Красноярске."],"cons":["Скромный ассортимент;","Не самый подробный сайт компании;","Небольшое количество отзывов, что не позволяет в полной мере сформировать представление о компании."]}$b110$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'gde-kupit-asik-dlya-majninga-top-10-magazinov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 46, 'heading',
       $h111${"level":2,"text":"4 место: Gis mining (Гис Майнинг)"}$h111$::jsonb,
       'gis-mining'
FROM articles a WHERE a.slug = 'gde-kupit-asik-dlya-majninga-top-10-magazinov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 47, 'paragraph',
       $b112${"text":"Группа компаний Gis mining – это магазин по продаже оборудования для добычи цифровых активов, а также майнинг-отель, сервисный офис, застройщик дата-центров, провайдер систем мониторинга и продавец контейнеров для майнинга. Продажа оборудования осуществляется официально с предоставлением всех необходимых документов. Отзывы о магазине исключительно положительные, репутация не испорчена инцидентами и случаями обмана.","html":"Группа компаний Gis mining – это магазин по продаже оборудования для добычи цифровых активов, а также майнинг-отель, сервисный офис, застройщик дата-центров, провайдер систем мониторинга и продавец контейнеров для майнинга. Продажа оборудования осуществляется официально с предоставлением всех необходимых документов. Отзывы о магазине исключительно положительные, репутация не испорчена инцидентами и случаями обмана."}$b112$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'gde-kupit-asik-dlya-majninga-top-10-magazinov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 48, 'paragraph',
       $b113${"text":"Gis mining является официальным дилером Bitmain и Whatsminer на территории России, предоставляя гарантию продолжительностью 1 год. Магазин сотрудничает с сервисами доставки Деловые Линии, СДЭК, ОЗОН и Яндекс Маркет. Среди партнеров заявлены Росатом, Альфа Банк, Страховой Дом ВСК, а также BTC.com и AllBTC.","html":"Gis mining является официальным дилером Bitmain и Whatsminer на территории России, предоставляя гарантию продолжительностью 1 год. Магазин сотрудничает с сервисами доставки Деловые Линии, СДЭК, ОЗОН и Яндекс Маркет. Среди партнеров заявлены Росатом, Альфа Банк, Страховой Дом ВСК, а также BTC.com и AllBTC."}$b113$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'gde-kupit-asik-dlya-majninga-top-10-magazinov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 49, 'image',
       $b114${"src":"/images/articles/rating-countries/map-bitcoin-wide.png","alt":"Gis mining — официальный дилер"}$b114$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'gde-kupit-asik-dlya-majninga-top-10-magazinov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 50, 'stats',
       $b115${"rows":[{"label":"Юридическое лицо","value":"ООО «ГЛОБАЛЬНЫЕ ИНФОРМАЦИОННЫЕ СИСТЕМЫ»"},{"label":"Выручка","value":"406.3 млн ₽"},{"label":"Суды","value":"Нет"},{"label":"Лет на рынке","value":"более 3"},{"label":"Уставной капитал","value":"1.9 млн ₽"},{"label":"Сайт","value":"gis-mining.ru"},{"label":"Собственный хостинг","value":"да"},{"label":"Официальные продажи оборудования","value":"да"},{"label":"Неофициальные продажи оборудования","value":"нет данных"},{"label":"Дата регистрации домена","value":"2021 год"},{"label":"Рейтинг магазина, Яндекс","value":"5"},{"label":"Количество отзывов, Яндекс","value":"68"},{"label":"Адрес офиса","value":"Москва, Варшавское шоссе, 1с1-2"},{"label":"Бренды оборудования","value":"Bitmain, Whatsminer"}]}$b115$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'gde-kupit-asik-dlya-majninga-top-10-magazinov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 51, 'pros_cons',
       $b116${"pros":["Часть целой группы компаний (магазин, дата-центр, сервис, сопутствующие услуги);","Официальный формат продажи оборудования;","Продолжительная гарантия: 1 год;","Собственный сервисный центр (не нужно отправлять технику в Китай);","Офис в Москве;","Безупречная репутация и высокий рейтинг;","Сопровождение майнинга «под ключ»;","Возможна покупка в лизинг для ИП и юридических лиц."],"cons":["Молодая компания – работает с 2021 года;","Небольшое количество производителей техники в каталоге."]}$b116$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'gde-kupit-asik-dlya-majninga-top-10-magazinov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 52, 'heading',
       $h117${"level":2,"text":"3 место: Intelion Data Systems (Интелион Дата Системз)"}$h117$::jsonb,
       'intelion'
FROM articles a WHERE a.slug = 'gde-kupit-asik-dlya-majninga-top-10-magazinov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 53, 'paragraph',
       $b118${"text":"Компания Intelion Data Systems или Интелион Майн основана в 2017 году. Специализируется как на продаже оборудования для добычи криптовалюты, так и предоставлении услуг хостинга на двух собственных площадках в России. Покупка техники доступна за наличные, в онлайн-формате, с помощью лизинга или безналичного расчета для юридических лиц, а также на маркетплейсах. Доставка осуществляется ведущими транспортными компаниями – СДЭК, Деловые линии, DPD и DHL.","html":"Компания Intelion Data Systems или Интелион Майн основана в 2017 году. Специализируется как на продаже оборудования для добычи криптовалюты, так и предоставлении услуг хостинга на двух собственных площадках в России. Покупка техники доступна за наличные, в онлайн-формате, с помощью лизинга или безналичного расчета для юридических лиц, а также на маркетплейсах. Доставка осуществляется ведущими транспортными компаниями – СДЭК, Деловые линии, DPD и DHL."}$b118$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'gde-kupit-asik-dlya-majninga-top-10-magazinov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 54, 'paragraph',
       $b119${"text":"Несмотря на то, что Intelion Data Systems существует на рынке майнинга долгое время, ассортимент базируется на моделях Bitmain и Whatsminer, чего для некоторых покупателей явно недостаточно. Тем не менее, продавец зарекомендовал себя надежным контрагентом: негативные отзывы о работе с Интелион Майн практически отсутствуют.","html":"Несмотря на то, что Intelion Data Systems существует на рынке майнинга долгое время, ассортимент базируется на моделях Bitmain и Whatsminer, чего для некоторых покупателей явно недостаточно. Тем не менее, продавец зарекомендовал себя надежным контрагентом: негативные отзывы о работе с Интелион Майн практически отсутствуют."}$b119$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'gde-kupit-asik-dlya-majninga-top-10-magazinov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 55, 'image',
       $b120${"src":"/images/articles/rating-countries/datacenter-orange.png","alt":"Intelion Data Systems"}$b120$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'gde-kupit-asik-dlya-majninga-top-10-magazinov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 56, 'stats',
       $b121${"rows":[{"label":"Юридическое лицо","value":"ООО «ИНТЕЛИОН МАЙН»"},{"label":"Выручка","value":"1 млрд ₽"},{"label":"Суды","value":"Истец: выиграл - 28%, проиграл - 29%, прочие - 43%. Ответчик: проиграл - 33%, прочие - 67%"},{"label":"Лет на рынке","value":"более 6"},{"label":"Уставной капитал","value":"2 млн ₽"},{"label":"Сайт","value":"intelionmine.ru"},{"label":"Собственный хостинг","value":"да"},{"label":"Официальные продажи оборудования","value":"нет данных"},{"label":"Неофициальные продажи оборудования","value":"нет данных"},{"label":"Дата регистрации домена","value":"2018 год"},{"label":"Рейтинг магазина, Яндекс","value":"4,8"},{"label":"Количество отзывов, Яндекс","value":"25"},{"label":"Адрес офиса","value":"Москва, Верхний Михайловский 2-й проезд, дом 9"},{"label":"Бренды оборудования","value":"Bitmain, Whatsminer"}]}$b121$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'gde-kupit-asik-dlya-majninga-top-10-magazinov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 57, 'pros_cons',
       $b122${"pros":["Старая проверенная компания по продаже техники;","Два собственных дата-центра (Калининская АЭС и г. Тула);","Услуги строительства инфраструктурных площадок для майнинга;","Покупка техники в рассрочку и лизинг;","Множество вариантов оплаты заказа;"],"cons":["Ограниченный ассортимент;","Цены на некоторые позиции выше, чем у конкурентов;","Ремонт техники по гарантии осуществляется у производителя."]}$b122$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'gde-kupit-asik-dlya-majninga-top-10-magazinov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 58, 'heading',
       $h123${"level":2,"text":"2 место: Promminer (Проммайнер)"}$h123$::jsonb,
       'promminer'
FROM articles a WHERE a.slug = 'gde-kupit-asik-dlya-majninga-top-10-magazinov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 59, 'paragraph',
       $b124${"text":"Promminer – старая и известная компания по продаже оборудования для майнинга в России: работает на рынке с 2017 года, являясь одним из основоположников сегмента. Есть собственный дата-центр в Сибири, а также сопутствующие форматы сотрудничества – готовый бизнес «под ключ», лизинг, инвестиции. Отдельно предложены пакеты по разгону оборудования. Ключевое преимущество покупки здесь – один из наиболее впечатляющих ассортиментов оборудования как с точки зрения ассортимента производителей, так и со стороны модельного ряда.","html":"Promminer – старая и известная компания по продаже оборудования для майнинга в России: работает на рынке с 2017 года, являясь одним из основоположников сегмента. Есть собственный дата-центр в Сибири, а также сопутствующие форматы сотрудничества – готовый бизнес «под ключ», лизинг, инвестиции. Отдельно предложены пакеты по разгону оборудования. Ключевое преимущество покупки здесь – один из наиболее впечатляющих ассортиментов оборудования как с точки зрения ассортимента производителей, так и со стороны модельного ряда."}$b124$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'gde-kupit-asik-dlya-majninga-top-10-magazinov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 60, 'paragraph',
       $b125${"text":"Основной негатив сотрудничества с компанией Promminer в отзывах клиентов основывается на случаях задержки заказов и передачи техники в отели. Возможной причиной является масштаб фирмы: внушительный поток заказов и большое число клиентов зачастую приводит к сбою в отлаженной механике взаимодействия.","html":"Основной негатив сотрудничества с компанией Promminer в отзывах клиентов основывается на случаях задержки заказов и передачи техники в отели. Возможной причиной является масштаб фирмы: внушительный поток заказов и большое число клиентов зачастую приводит к сбою в отлаженной механике взаимодействия."}$b125$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'gde-kupit-asik-dlya-majninga-top-10-magazinov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 61, 'image',
       $b126${"src":"/images/articles/rating-countries/datacenter-fans.png","alt":"Promminer — ассортимент асиков"}$b126$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'gde-kupit-asik-dlya-majninga-top-10-magazinov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 62, 'stats',
       $b127${"rows":[{"label":"Юридическое лицо","value":"ООО «ПРОММАЙНЕР»"},{"label":"Выручка","value":"121.2 млн ₽"},{"label":"Суды","value":"нет"},{"label":"Лет на рынке","value":"более полутора лет; (вероятно, новая ООО)"},{"label":"Уставной капитал","value":"500 тыс ₽"},{"label":"Сайт","value":"promminer.ru"},{"label":"Собственный хостинг","value":"да"},{"label":"Официальные продажи оборудования","value":"нет данных"},{"label":"Неофициальные продажи оборудования","value":"нет данных"},{"label":"Дата регистрации домена","value":"2019 год"},{"label":"Рейтинг магазина, Яндекс","value":"4,9"},{"label":"Количество отзывов, Яндекс","value":"90"},{"label":"Адрес офиса","value":"Москва, ул. Летная, 99 ст3, офис 4"},{"label":"Бренды оборудования","value":"Bitmain, Whatsminer, Canaan, Innosilicon, AnexMiner, Goldshell, Hummer, iBeLink, IceRiver, iPollo, Jasminer, YAMI"}]}$b127$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'gde-kupit-asik-dlya-majninga-top-10-magazinov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 63, 'pros_cons',
       $b128${"pros":["Один из старейших и крупнейших магазинов по продаже техники для майнинга в России;","Впечатляющий ассортимент брендов, включая редкие модели;","Собственный хостинг в Сибири;","Разнообразные форматы сотрудничества, включая инвестиции и покупку готового бизнеса;","Плотное взаимодействие со СМИ, что позволяет добиваться узнаваемости бренда Promminer;","Офис не только в Москве, но и других регионах России;","Возможность покупки пакетов для разгона устройств;","Формат сотрудничества «под ключ»;","Собственный сервисный центр."],"cons":["Встречаются случаи задержки доставки заказов, ремонта техники и запуска оборудования в дата-центре;","Утеря гарантии для некоторой техники после ремонта в сервисном центре магазина;","Случаи указания неполной стоимости оборудования на сайте."]}$b128$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'gde-kupit-asik-dlya-majninga-top-10-magazinov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 64, 'heading',
       $h129${"level":2,"text":"1 место: IBMM Technology (АйБиЭмЭм Технолоджи)"}$h129$::jsonb,
       'ibmm'
FROM articles a WHERE a.slug = 'gde-kupit-asik-dlya-majninga-top-10-magazinov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 65, 'paragraph',
       $b130${"text":"Одна из старейших компаний по продаже оборудования для майнинга в России, имеющая собственное представительство в Китае. Начало работы датируется 2017 годом: за это время фирма IBMM Technology успела выполнить заказы более 10 000 клиентов, а в дата-центрах добывают криптовалюту более 7 000 майнеров. Организация сотрудничает с большим количеством производителей оборудования для майнинга и рядом крупнейших транспортных компаний.","html":"Одна из старейших компаний по продаже оборудования для майнинга в России, имеющая собственное представительство в Китае. Начало работы датируется 2017 годом: за это время фирма IBMM Technology успела выполнить заказы более 10 000 клиентов, а в дата-центрах добывают криптовалюту более 7 000 майнеров. Организация сотрудничает с большим количеством производителей оборудования для майнинга и рядом крупнейших транспортных компаний."}$b130$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'gde-kupit-asik-dlya-majninga-top-10-magazinov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 66, 'paragraph',
       $b131${"text":"IBMM Technology регулярно принимает активное участие в профильных выставках как в России, так и за рубежом. У компании есть пять хостингов в разных регионах России, продавец заявляет быструю доставку заказа и круглосуточную поддержку клиентов. Недостатки заключаются в особенностях сотрудничества с большой компанией – иногда клиенты жалуются на долгое решение проблем и слишком продолжительный срок ремонта.","html":"IBMM Technology регулярно принимает активное участие в профильных выставках как в России, так и за рубежом. У компании есть пять хостингов в разных регионах России, продавец заявляет быструю доставку заказа и круглосуточную поддержку клиентов. Недостатки заключаются в особенностях сотрудничества с большой компанией – иногда клиенты жалуются на долгое решение проблем и слишком продолжительный срок ремонта."}$b131$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'gde-kupit-asik-dlya-majninga-top-10-magazinov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 67, 'image',
       $b132${"src":"/images/articles/rating-countries/globe-coins.png","alt":"IBMM Technology — лидер рейтинга"}$b132$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'gde-kupit-asik-dlya-majninga-top-10-magazinov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 68, 'stats',
       $b133${"rows":[{"label":"Юридическое лицо","value":"нет данных"},{"label":"Выручка","value":"нет данных"},{"label":"Суды","value":"нет данных"},{"label":"Лет на рынке","value":"нет данных"},{"label":"Уставной капитал","value":"нет данных"},{"label":"Сайт","value":"ibmm.ru"},{"label":"Собственный хостинг","value":"да"},{"label":"Официальные продажи оборудования","value":"нет данных"},{"label":"Неофициальные продажи оборудования","value":"нет данных"},{"label":"Дата регистрации домена","value":"2017 год"},{"label":"Рейтинг магазина, Яндекс","value":"5"},{"label":"Количество отзывов, Яндекс","value":"225"},{"label":"Адрес офиса","value":"Москва, МКАД, 44 км., дом 1"},{"label":"Бренды оборудования","value":"Bitmain, Whatsminer, Canaan, Innosilicon, Goldshell, Jasminer"}]}$b133$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'gde-kupit-asik-dlya-majninga-top-10-magazinov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 69, 'pros_cons',
       $b134${"pros":["Одна из крупнейших компаний на рынке в России в сфере продажи асиков;","Пять собственных отелей для майнинга в разных частях страны;","Внушительный ассортимент предлагаемой техники;","Высокий рейтинг и хорошая репутация;","Круглосуточная поддержка;","Большой штат сотрудников;","Возможность покупки готового контейнера для майнинга;","Возможность покупки газопоршневой электростанции;","Собственное представительство в Китае."],"cons":["Цены на некоторые позиции техники выше, чем у конкурентов;","Не всегда оперативное решение вопросов клиентов из-за масштабов организации."]}$b134$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'gde-kupit-asik-dlya-majninga-top-10-magazinov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 70, 'heading',
       $h135${"level":2,"text":"Выводы"}$h135$::jsonb,
       'vyvody'
FROM articles a WHERE a.slug = 'gde-kupit-asik-dlya-majninga-top-10-magazinov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 71, 'paragraph',
       $b136${"text":"Прежде чем купить асик вспомните, что это серьезное вложение, требующее взвешенного подхода. Используйте приведенные критерии как ориентир для выбора надежного магазина и партнера, который не только продаст оборудование, но и обеспечит сопровождение на всех этапах. Помните: грамотное начало – залог успешной и стабильной работы в сфере майнинга.","html":"Прежде чем купить асик вспомните, что это серьезное вложение, требующее взвешенного подхода. Используйте приведенные критерии как ориентир для выбора надежного магазина и партнера, который не только продаст оборудование, но и обеспечит сопровождение на всех этапах. Помните: грамотное начало – залог успешной и стабильной работы в сфере майнинга."}$b136$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'gde-kupit-asik-dlya-majninga-top-10-magazinov';

-- Blocks: luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov
INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 1, 'heading',
       $h137${"level":2,"text":"Введение"}$h137$::jsonb,
       'vvedenie'
FROM articles a WHERE a.slug = 'luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 2, 'paragraph',
       $b138${"text":"Майнинговая компания в России – это полноценный бизнес, профессионально работающий в сфере добычи криптовалют с использованием специализированного оборудования. Такие компании предоставляют полный цикл услуг, от продажи техники до инвестиций «под ключ». В условиях высокой конкуренции и технической сложности майнинга они играют ключевую роль, помогая частным и корпоративным клиентам заходить в индустрию с минимальными рисками и затратами времени.","html":"Майнинговая компания в России – это полноценный бизнес, профессионально работающий в сфере добычи криптовалют с использованием специализированного оборудования. Такие компании предоставляют полный цикл услуг, от продажи техники до инвестиций «под ключ». В условиях высокой конкуренции и технической сложности майнинга они играют ключевую роль, помогая частным и корпоративным клиентам заходить в индустрию с минимальными рисками и затратами времени."}$b138$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 3, 'heading',
       $h139${"level":2,"text":"Чем занимаются майнинговые компании России?"}$h139$::jsonb,
       'chem-zanimayutsya'
FROM articles a WHERE a.slug = 'luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 4, 'paragraph',
       $b140${"text":"Майнинговая компания в России – это не просто продавец оборудования, а полноценный партнер, который помогает клиенту войти в мир криптодобычи с минимальными рисками. Если же рассматривать полный перечень возможных услуг таких участников рынка, можно говорить о следующих направлениях:","html":"Майнинговая компания в России – это не просто продавец оборудования, а полноценный партнер, который помогает клиенту войти в мир криптодобычи с минимальными рисками. Если же рассматривать полный перечень возможных услуг таких участников рынка, можно говорить о следующих направлениях:"}$b140$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 5, 'rich_list',
       $b141${"ordered":false,"items":[{"title":"Продажа оборудования для добычи криптовалют","text":"Майнинговые компании сотрудничают с крупными поставщиками и производителями (Bitmain, MicroBT и др.) и предлагают клиентам актуальные модели асиков с гарантией. Это упрощает закупку и снижает риск покупки подделки у сомнительных участников рынка;"},{"title":"Размещение клиентских асиков (хостинг)","text":"Клиент может купить устройство и разместить его в дата-центре компании – это выгодно, если нет условий для домашнего майнинга. В услугу входит подключение, обслуживание, контроль температуры и стабильной работы;"},{"title":"Ремонт и технический сервис","text":"Надежные компании предоставляют ремонтные услуги и профилактическое обслуживание. Наличие специалистов и запчастей позволяет быстро устранять неполадки без длительного простоя;"},{"title":"Продажа контейнеров для размещения аппаратуры","text":"Контейнеры – это полноценные фермы, оснащенные вентиляцией, электрикой и стойками под майнеры. Их можно установить в регионах с дешевой электроэнергией: многие майнинговые компании проектируют, собирают и продают такие решения «под ключ»;"},{"title":"Инвестиции в майнинг","text":"Некоторые компании предлагают пассивный доход – вы инвестируете средства, а компания сама закупает оборудование, размещает и управляет им. Прибыль распределяется по заранее установленной схеме: это решение для тех, кто хочет участвовать в майнинге, не вникая в технические детали."}]}$b141$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 6, 'image',
       $b142${"src":"/images/articles/mining-companies/intro-datacenter.png","alt":"Дата-центр для майнинга"}$b142$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 7, 'paragraph',
       $b143${"text":"Узнаем, какие майнинговые компании в России существуют, чем они занимаются и какие услуги предоставляют инвесторам: познакомимся с рейтингом лучших компаний, рассмотрев ТОП-10 крупнейших и известнейших участников рынка.","html":"Узнаем, какие майнинговые компании в России существуют, чем они занимаются и какие услуги предоставляют инвесторам: познакомимся с рейтингом лучших компаний, рассмотрев ТОП-10 крупнейших и известнейших участников рынка."}$b143$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 8, 'heading',
       $h144${"level":2,"text":"10 место: Uminers (Юмайнерс)"}$h144$::jsonb,
       'uminers'
FROM articles a WHERE a.slug = 'luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 9, 'paragraph',
       $b145${"text":"Компания Uminers – один из крупнейших участников рынка майнинга (продажа оборудования и размещение) в международном масштабе. Проект имеет отдельное подразделение для работы с российскими пользователями: площадка находится в Красноярске и обладает внушительным потенциалом мощности. Минимальные условия для сотрудничества – от 5 устройств, каждое из которых потребляет не менее 5 кВт.","html":"Компания Uminers – один из крупнейших участников рынка майнинга (продажа оборудования и размещение) в международном масштабе. Проект имеет отдельное подразделение для работы с российскими пользователями: площадка находится в Красноярске и обладает внушительным потенциалом мощности. Минимальные условия для сотрудничества – от 5 устройств, каждое из которых потребляет не менее 5 кВт."}$b145$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 10, 'paragraph',
       $b146${"text":"Магазин и хостинг Uminers имеют устойчивую репутацию и немало отзывов, позволяющих сформировать общее представление о качестве товаров и уровне сервиса. Компания успешна не только в РФ, но и за рубежом, что делает ее значимым игроком на рынке майнинговой мощности и мирового хешрейта.","html":"Магазин и хостинг Uminers имеют устойчивую репутацию и немало отзывов, позволяющих сформировать общее представление о качестве товаров и уровне сервиса. Компания успешна не только в РФ, но и за рубежом, что делает ее значимым игроком на рынке майнинговой мощности и мирового хешрейта."}$b146$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 11, 'image',
       $b147${"src":"/images/articles/mining-companies/uminers.png","alt":"Uminers — майнинговая компания"}$b147$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 12, 'stats',
       $b148${"rows":[{"label":"Юридическое лицо","value":"нет данных"},{"label":"Выручка","value":"нет данных"},{"label":"Суды","value":"нет данных"},{"label":"Лет на рынке","value":"нет данных"},{"label":"Уставной капитал","value":"нет данных"},{"label":"Расположение хостинга","value":"Красноярский край"},{"label":"Количество размещенных устройств","value":"нет данных"},{"label":"Обслуживаемая мощность","value":"20 МВт/ч"},{"label":"Свободные мощности","value":"нет данных"},{"label":"Стоимость размещения","value":"нет данных"},{"label":"Сайт","value":"uminers.com"},{"label":"Дата регистрации домена","value":"2017 год"},{"label":"Собственный магазин по продаже оборудования","value":"да"},{"label":"Собственный сервисный центр","value":"нет данных"},{"label":"Рейтинг площадки, Яндекс","value":"4,9"},{"label":"Количество отзывов, Яндекс","value":"29"},{"label":"Адрес офиса","value":"Москва, Ходынский бульвар, д. 11"}]}$b148$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 13, 'pros_cons',
       $b149${"pros":["Проект международного формата, хорошо известный как в России, так и за рубежом;","Размещение асиков от бренда с хорошей репутацией в сфере продаж;","Поддержка международной структуры, в состав которой входит Uminers;","Отдельное подразделение для РФ."],"cons":["Недостаток подробной информации о хостинге на сайте."]}$b149$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 14, 'heading',
       $h150${"level":2,"text":"9 место: Umnus (Умнус)"}$h150$::jsonb,
       'umnus'
FROM articles a WHERE a.slug = 'luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 15, 'paragraph',
       $b151${"text":"Компания Umnus предлагает не просто продажу майнингового оборудования, а полный спектр услуг, включая его профессиональное размещение. В распоряжении клиентов несколько дата-центров, расположенных в Москве, Красноярске и Каспийске. Общая мощность инфраструктуры достигает 46 МВт, что делает компанию одной из заметных на российском рынке. Все объекты оснащены системами безопасности с видеонаблюдением, а техническое обслуживание проводится собственным сервисным центром.","html":"Компания Umnus предлагает не просто продажу майнингового оборудования, а полный спектр услуг, включая его профессиональное размещение. В распоряжении клиентов несколько дата-центров, расположенных в Москве, Красноярске и Каспийске. Общая мощность инфраструктуры достигает 46 МВт, что делает компанию одной из заметных на российском рынке. Все объекты оснащены системами безопасности с видеонаблюдением, а техническое обслуживание проводится собственным сервисным центром."}$b151$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 16, 'paragraph',
       $b152${"text":"Umnus заявляет до 97,5% времени без простоев (up-time) – показатель, который кажется ниже, чем у некоторых конкурентов, но, по мнению клиентов, соответствует реальности, что повышает доверие. Пользователям доступны два способа оплаты: фиксированная ставка за устройство или тариф по счетчику. В первом случае уже включено техническое обслуживание, что делает тариф особенно удобным. Также обращает на себя внимание возможный формат сотрудничества «под ключ», что упрощает инвестиционные задачи пользователей.","html":"Umnus заявляет до 97,5% времени без простоев (up-time) – показатель, который кажется ниже, чем у некоторых конкурентов, но, по мнению клиентов, соответствует реальности, что повышает доверие. Пользователям доступны два способа оплаты: фиксированная ставка за устройство или тариф по счетчику. В первом случае уже включено техническое обслуживание, что делает тариф особенно удобным. Также обращает на себя внимание возможный формат сотрудничества «под ключ», что упрощает инвестиционные задачи пользователей."}$b152$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 17, 'image',
       $b153${"src":"/images/articles/mining-companies/umnus.png","alt":"Umnus — оператор промышленного майнинга"}$b153$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 18, 'stats',
       $b154${"rows":[{"label":"Юридическое лицо","value":"ООО «УМНЫЕ УСТРОЙСТВА»"},{"label":"Выручка","value":"246 млн ₽"},{"label":"Суды","value":"Истец: выиграл - 0%, проиграл - 100%"},{"label":"Лет на рынке","value":"более 4"},{"label":"Уставной капитал","value":"8.5 млн ₽"},{"label":"Расположение хостинга","value":"Москва, Красноярск, Каспийск"},{"label":"Количество размещенных устройств","value":"более 1 500"},{"label":"Обслуживаемая мощность","value":"46 МВт/ч"},{"label":"Свободные мощности","value":"нет данных"},{"label":"Стоимость размещения","value":"от 11 000 ₽ в месяц за устройство"},{"label":"Сайт","value":"umnus.ru"},{"label":"Дата регистрации домена","value":"2019 год"},{"label":"Собственный магазин по продаже оборудования","value":"да"},{"label":"Собственный сервисный центр","value":"да"},{"label":"Рейтинг площадки, Яндекс","value":"4,7"},{"label":"Количество отзывов, Яндекс","value":"35"},{"label":"Адрес офиса","value":"Москва, Нагорный проезд, дом 10, корпус 2, строение 3"}]}$b154$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 19, 'pros_cons',
       $b155${"pros":["Комплексный сервис: оборудование, размещение, обслуживание – в одном месте;","География хостингов: четыре площадки по всей России;","Собственный ремонтный центр, не зависящий от подрядчиков;","Гибкая тарификация: фикс или по фактическому потреблению;","Честный up-time, подтвержденный пользователями;","Обслуживание включено в один из тарифов;","Размещение в собственных контейнерах возможно;","Льготные условия размещения при выборе сниженого уровня надежности."],"cons":["Компания не несет материальную ответственность при использовании любых пулов, кроме EMCD."]}$b155$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 20, 'heading',
       $h156${"level":2,"text":"8 место: Getasic (Гетасик)"}$h156$::jsonb,
       'getasic'
FROM articles a WHERE a.slug = 'luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 21, 'paragraph',
       $b157${"text":"Getasic – один из заметных игроков на рынке майнингового оборудования, предлагающий не только продажу, но и размещение техники в собственном дата-центре. Однако, как и у ряда конкурентов, на официальном сайте бренда наблюдается дефицит подробной информации о хостинге. Потенциальным клиентам приходится довольствоваться общими описаниями – без указания конкретных условий сотрудничества.","html":"Getasic – один из заметных игроков на рынке майнингового оборудования, предлагающий не только продажу, но и размещение техники в собственном дата-центре. Однако, как и у ряда конкурентов, на официальном сайте бренда наблюдается дефицит подробной информации о хостинге. Потенциальным клиентам приходится довольствоваться общими описаниями – без указания конкретных условий сотрудничества."}$b157$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 22, 'paragraph',
       $b158${"text":"Из опубликованного на сайте известно лишь, что мощность дата-центра составляет 40 МВт, а среди преимуществ упоминаются: официальный статус размещения, наличие основного и резервного каналов связи, удаленный мониторинг, а также наличие собственного сервисного центра.","html":"Из опубликованного на сайте известно лишь, что мощность дата-центра составляет 40 МВт, а среди преимуществ упоминаются: официальный статус размещения, наличие основного и резервного каналов связи, удаленный мониторинг, а также наличие собственного сервисного центра."}$b158$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 23, 'paragraph',
       $b159${"text":"Тем не менее, не раскрываются ключевые параметры, такие как географическое расположение площадки, уровень up-time, структура цен. Эти детали можно получить только при личной консультации с менеджером, что может отпугнуть часть аудитории, особенно тех, кто ищет быструю и прозрачную информацию.","html":"Тем не менее, не раскрываются ключевые параметры, такие как географическое расположение площадки, уровень up-time, структура цен. Эти детали можно получить только при личной консультации с менеджером, что может отпугнуть часть аудитории, особенно тех, кто ищет быструю и прозрачную информацию."}$b159$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 24, 'image',
       $b160${"src":"/images/articles/mining-companies/getasic.png","alt":"Getasic — продажа и хостинг асиков"}$b160$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 25, 'stats',
       $b161${"rows":[{"label":"Юридическое лицо","value":"нет данных"},{"label":"Выручка","value":"нет данных"},{"label":"Суды","value":"нет данных"},{"label":"Лет на рынке","value":"нет данных"},{"label":"Уставной капитал","value":"нет данных"},{"label":"Расположение хостинга","value":"нет данных"},{"label":"Количество размещенных устройств","value":"нет данных"},{"label":"Обслуживаемая мощность","value":"нет данных"},{"label":"Свободные мощности","value":"40 МВт/ч"},{"label":"Стоимость размещения","value":"нет данных"},{"label":"Сайт","value":"miningmoon.ru"},{"label":"Дата регистрации домена","value":"2017 год"},{"label":"Собственный магазин по продаже оборудования","value":"да"},{"label":"Собственный сервисный центр","value":"да"},{"label":"Рейтинг площадки, Яндекс","value":"4,9"},{"label":"Количество отзывов, Яндекс","value":"83"},{"label":"Адрес офиса","value":"Москва, Остаповский проезд, 3, стр. 29"}]}$b161$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 26, 'pros_cons',
       $b162${"pros":["Хостинг от проверенного продавца оборудования – удобно и надежно;","Наличие собственного сервисного центра;","Усиленная система охраны - видеонаблюдение и тревожная кнопка;","Возможность страхования техники."],"cons":["На сайте отсутствуют ключевые характеристики хостинга – нет данных о регионе, уровне доступности, тарифах и прочих метриках."]}$b162$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 27, 'heading',
       $h163${"level":2,"text":"7 место: Mining Cluster (Майнинг Кластер)"}$h163$::jsonb,
       'mining-cluster'
FROM articles a WHERE a.slug = 'luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 28, 'paragraph',
       $b164${"text":"Компания Mining Cluster работает с 2016 года и предлагает полный спектр услуг в сфере майнинга: от продажи оборудования до размещения и сопровождения. У компании имеются собственные дата-центры, а также интернет-магазин. Несмотря на положительные отзывы от клиентов, их количество невелико, что затрудняет объективную оценку качества услуг.","html":"Компания Mining Cluster работает с 2016 года и предлагает полный спектр услуг в сфере майнинга: от продажи оборудования до размещения и сопровождения. У компании имеются собственные дата-центры, а также интернет-магазин. Несмотря на положительные отзывы от клиентов, их количество невелико, что затрудняет объективную оценку качества услуг."}$b164$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 29, 'paragraph',
       $b165${"text":"На официальных площадках Mining Cluster представлено не так много конкретики. Не раскрываются точные тарифы на хостинг, нет точной геолокации дата-центров (по инфографике можно предположить – это Кириши, Тула, Мурманск и Удомля), отсутствует информация о масштабах – числе клиентов или размещенных устройств. Все детали раскрываются индивидуально – в процессе консультации, исходя из бюджета и задач клиента.","html":"На официальных площадках Mining Cluster представлено не так много конкретики. Не раскрываются точные тарифы на хостинг, нет точной геолокации дата-центров (по инфографике можно предположить – это Кириши, Тула, Мурманск и Удомля), отсутствует информация о масштабах – числе клиентов или размещенных устройств. Все детали раскрываются индивидуально – в процессе консультации, исходя из бюджета и задач клиента."}$b165$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 30, 'paragraph',
       $b166${"text":"Кроме хостинга, компания предлагает лизинг для юридических лиц, продажу майнинговых контейнеров, услуги ремонта и мониторинга, а также решение «майнинг под ключ». Заявленный up-time – 99,8%, а техническая поддержка реагирует на отключение оборудования в течение не более 5 минут.","html":"Кроме хостинга, компания предлагает лизинг для юридических лиц, продажу майнинговых контейнеров, услуги ремонта и мониторинга, а также решение «майнинг под ключ». Заявленный up-time – 99,8%, а техническая поддержка реагирует на отключение оборудования в течение не более 5 минут."}$b166$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 31, 'image',
       $b167${"src":"/images/articles/mining-companies/mining-cluster.png","alt":"Mining Cluster — дата-центры для майнинга"}$b167$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 32, 'stats',
       $b168${"rows":[{"label":"Юридическое лицо","value":"нет данных"},{"label":"Выручка","value":"нет данных"},{"label":"Суды","value":"нет данных"},{"label":"Лет на рынке","value":"нет данных"},{"label":"Уставной капитал","value":"нет данных"},{"label":"Расположение хостинга","value":"Кириши, Тула, Мурманск, Удомля"},{"label":"Количество размещенных устройств","value":"нет данных"},{"label":"Обслуживаемая мощность","value":"нет данных"},{"label":"Свободные мощности","value":"нет данных"},{"label":"Стоимость размещения","value":"нет данных"},{"label":"Сайт","value":"cluster-mining.com"},{"label":"Дата регистрации домена","value":"2021 год"},{"label":"Собственный магазин по продаже оборудования","value":"да"},{"label":"Собственный сервисный центр","value":"да"},{"label":"Рейтинг магазина, Яндекс","value":"4,8"},{"label":"Количество отзывов, Яндекс","value":"16"},{"label":"Адрес офиса","value":"Москва, Пресненская набережная, д. 10, стр. 2 помещение № 181"}]}$b168$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 33, 'pros_cons',
       $b169${"pros":["Широкий набор услуг: оборудование, хостинг, контейнеры, строительство дата-центров и инвестиционные решения;","Несколько собственных дата-центров;","Возможность лизинга для бизнеса;","Быстрая техническая поддержка и высокий up-time."],"cons":["Недостаточная прозрачность на сайте: отсутствуют тарифы, расположение площадок и данные о масштабах;","Небольшое количество отзывов затрудняет объективную оценку репутации."]}$b169$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 34, 'heading',
       $h170${"level":2,"text":"6 место: Gis mining (Гис Майнинг)"}$h170$::jsonb,
       'gis-mining'
FROM articles a WHERE a.slug = 'luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 35, 'paragraph',
       $b171${"text":"Компания Gis Mining предоставляет услуги по размещению майнингового оборудования в непосредственной близости от Калининской АЭС (Тверская область, северный регион). Все установки размещаются в изолированных контейнерах, соответствующих стандартам безопасности Росэнергоатома. Система противопожарной защиты представлена современными датчиками, а время реакции специализированной пожарной службы составляет всего 2 минуты. На всей территории действует строгий доступ по пропускам и ведется наблюдение с помощью более 700 видеокамер.","html":"Компания Gis Mining предоставляет услуги по размещению майнингового оборудования в непосредственной близости от Калининской АЭС (Тверская область, северный регион). Все установки размещаются в изолированных контейнерах, соответствующих стандартам безопасности Росэнергоатома. Система противопожарной защиты представлена современными датчиками, а время реакции специализированной пожарной службы составляет всего 2 минуты. На всей территории действует строгий доступ по пропускам и ведется наблюдение с помощью более 700 видеокамер."}$b171$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 36, 'paragraph',
       $b172${"text":"Компания заявляет up-time на уровне 99,9%, а также предоставляет удобную систему мониторинга и выгодные условия сервисного обслуживания. Каждый клиент получает 1 год бесплатного ремонта, причем время устранения неисправности не превышает 10 рабочих дней. В случае задержек предоставляется временная замена оборудования. Для желающих доступны экскурсии по площадке – можно лично ознакомиться с условиями хранения и эксплуатации.","html":"Компания заявляет up-time на уровне 99,9%, а также предоставляет удобную систему мониторинга и выгодные условия сервисного обслуживания. Каждый клиент получает 1 год бесплатного ремонта, причем время устранения неисправности не превышает 10 рабочих дней. В случае задержек предоставляется временная замена оборудования. Для желающих доступны экскурсии по площадке – можно лично ознакомиться с условиями хранения и эксплуатации."}$b172$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 37, 'image',
       $b173${"src":"/images/articles/mining-companies/gis-mining.png","alt":"Gis Mining — хостинг у Калининской АЭС"}$b173$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 38, 'stats',
       $b174${"rows":[{"label":"Юридическое лицо","value":"ООО «ГЛОБАЛЬНЫЕ ИНФОРМАЦИОННЫЕ СИСТЕМЫ»"},{"label":"Выручка","value":"406.3 млн ₽"},{"label":"Суды","value":"Нет"},{"label":"Лет на рынке","value":"более 3"},{"label":"Уставной капитал","value":"1.9 млн ₽"},{"label":"Расположение хостинга","value":"Калининская АЭС (Тверская область)"},{"label":"Количество размещенных устройств","value":"более 19 000"},{"label":"Обслуживаемая мощность","value":"70 МВт/ч"},{"label":"Свободные мощности","value":"нет данных"},{"label":"Стоимость размещения","value":"от 3,99 ₽ за кВт"},{"label":"Сайт","value":"gis-mining.ru"},{"label":"Дата регистрации домена","value":"2021 год"},{"label":"Собственный магазин по продаже оборудования","value":"да"},{"label":"Собственный сервисный центр","value":"да"},{"label":"Рейтинг площадки, Яндекс","value":"5"},{"label":"Количество отзывов, Яндекс","value":"68"},{"label":"Адрес офиса","value":"Москва, Варшавское шоссе, 1с1-2"}]}$b174$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 39, 'pros_cons',
       $b175${"pros":["Дешевое электричество от атомной электростанции;","Наличие собственного магазина и сервисного центра;","Год гарантии с быстрым ремонтом или заменой оборудования;","Возможность посетить площадку лично;","Круглосуточная поддержка клиентов;","Налаженная логистика – сотрудничество с надежными транспортными компаниями;","Отсутствие негативных отзывов и устойчивая репутация;","Предлагается формат «готового бизнеса» для инвесторов."],"cons":["Молодая компания – существует с 2021 года;","Скромное количество производителей техники в каталоге."]}$b175$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 40, 'heading',
       $h176${"level":2,"text":"5 место: Intelion Data Systems (Интелион Дата Системз)"}$h176$::jsonb,
       'intelion'
FROM articles a WHERE a.slug = 'luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 41, 'paragraph',
       $b177${"text":"Intelion Data Systems – один из узнаваемых игроков на рынке продаж майнинговой техники, предлагающий не только оборудование, но и услуги по его размещению. В распоряжении компании находятся две хостинговые площадки: одна расположена в Тверской области рядом с Калининской АЭС (мощность – 32 МВт), другая – на территории дата-центра АО «Тулачермет». Точные характеристики второй площадки, как и количество клиентов и размещенных устройств, не раскрываются.","html":"Intelion Data Systems – один из узнаваемых игроков на рынке продаж майнинговой техники, предлагающий не только оборудование, но и услуги по его размещению. В распоряжении компании находятся две хостинговые площадки: одна расположена в Тверской области рядом с Калининской АЭС (мощность – 32 МВт), другая – на территории дата-центра АО «Тулачермет». Точные характеристики второй площадки, как и количество клиентов и размещенных устройств, не раскрываются."}$b177$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 42, 'paragraph',
       $b178${"text":"Несмотря на ограниченность информации, Intelion заявляет о надежной охранной системе, up-time до 99,4%, круглосуточной поддержке и возможности страховать оборудование. Дополнительно компания предоставляет возможность лично осмотреть площадку перед размещением – для этого можно записаться на экскурсию.","html":"Несмотря на ограниченность информации, Intelion заявляет о надежной охранной системе, up-time до 99,4%, круглосуточной поддержке и возможности страховать оборудование. Дополнительно компания предоставляет возможность лично осмотреть площадку перед размещением – для этого можно записаться на экскурсию."}$b178$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 43, 'image',
       $b179${"src":"/images/articles/mining-companies/intelion.png","alt":"Intelion Data Systems — оборудование и хостинг"}$b179$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 44, 'stats',
       $b180${"rows":[{"label":"Юридическое лицо","value":"ООО «ИНТЕЛИОН МАЙН»"},{"label":"Выручка","value":"1 млрд ₽"},{"label":"Суды","value":"Истец: выиграл - 28%, проиграл - 29%, прочие - 43%. Ответчик: проиграл - 33%, прочие - 67%"},{"label":"Лет на рынке","value":"более 6"},{"label":"Уставной капитал","value":"2 млн ₽"},{"label":"Расположение хостинга","value":"Тверская и Тульская область"},{"label":"Количество размещенных устройств","value":"нет данных"},{"label":"Обслуживаемая мощность","value":"32 МВт/ч (данные только по площадке в Тверской области)"},{"label":"Свободные мощности","value":"нет данных"},{"label":"Стоимость размещения","value":"нет данных"},{"label":"Сайт","value":"intelionmine.ru"},{"label":"Дата регистрации домена","value":"2018 год"},{"label":"Собственный магазин по продаже оборудования","value":"да"},{"label":"Собственный сервисный центр","value":"да"},{"label":"Рейтинг площадки, Яндекс","value":"4,8"},{"label":"Количество отзывов, Яндекс","value":"25"},{"label":"Адрес офиса","value":"Москва, Верхний Михайловский 2-й проезд, дом 9"}]}$b180$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 45, 'pros_cons',
       $b181${"pros":["Хостинг от известного продавца оборудования с устойчивой репутацией;","Две независимые площадки для размещения асиков в разных регионах;","Материальная ответственность и страхование оборудования;","Возможность посещения дата-центров перед заключением договора;","Поддержка 24/7 и охрана с системой контроля доступа."],"cons":["Недостаточная прозрачность на сайте: нет данных о стоимости услуг, параметрах второй площадки и общем объеме размещения."]}$b181$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 46, 'heading',
       $h182${"level":2,"text":"4 место: Sibmain (Сибмайн)"}$h182$::jsonb,
       'sibmain'
FROM articles a WHERE a.slug = 'luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 47, 'paragraph',
       $b183${"text":"Компания Sibmain совмещает в себе функции интернет-магазина оборудования и хостинг-провайдера, предлагая услуги на базе одного из самых мощных дата-центров страны. Площадка расположена в Красноярске и обладает внушительным потенциалом – до 80 МВт мощности. Это делает объект одним из крупнейших в сфере промышленного майнинга.","html":"Компания Sibmain совмещает в себе функции интернет-магазина оборудования и хостинг-провайдера, предлагая услуги на базе одного из самых мощных дата-центров страны. Площадка расположена в Красноярске и обладает внушительным потенциалом – до 80 МВт мощности. Это делает объект одним из крупнейших в сфере промышленного майнинга."}$b183$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 48, 'paragraph',
       $b184${"text":"Дата-центр предоставляет полный спектр сервисов: от технической поддержки и ремонта в собственном сервисном центре до организации экскурсий по объекту. Заявленный up-time – 99%, а на устранение неполадок уходит не более 7 минут. Инфраструктура включает систему удаленного контроля, воздушные фильтры, а также круглосуточную охрану.","html":"Дата-центр предоставляет полный спектр сервисов: от технической поддержки и ремонта в собственном сервисном центре до организации экскурсий по объекту. Заявленный up-time – 99%, а на устранение неполадок уходит не более 7 минут. Инфраструктура включает систему удаленного контроля, воздушные фильтры, а также круглосуточную охрану."}$b184$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 49, 'paragraph',
       $b185${"text":"Тарификация гибкая и зависит от времени суток: дневной и ночной тариф. Компания также заявляет о финансовой ответственности за технику в случае ущерба по вине сотрудников.","html":"Тарификация гибкая и зависит от времени суток: дневной и ночной тариф. Компания также заявляет о финансовой ответственности за технику в случае ущерба по вине сотрудников."}$b185$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 50, 'image',
       $b186${"src":"/images/articles/rating-countries/datacenter-orange.png","alt":"Sibmain — дата-центр в Красноярске"}$b186$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 51, 'stats',
       $b187${"rows":[{"label":"Юридическое лицо","value":"нет данных"},{"label":"Выручка","value":"нет данных"},{"label":"Суды","value":"нет данных"},{"label":"Лет на рынке","value":"нет данных"},{"label":"Уставной капитал","value":"нет данных"},{"label":"Расположение хостинга","value":"Красноярск"},{"label":"Количество размещенных устройств","value":"нет данных"},{"label":"Обслуживаемая мощность","value":"80 МВт/ч"},{"label":"Свободные мощности","value":"нет данных"},{"label":"Стоимость размещения","value":"от 4 ₽ за КВт"},{"label":"Сайт","value":"sibmain.ru"},{"label":"Дата регистрации домена","value":"2021 год"},{"label":"Собственный магазин по продаже оборудования","value":"да"},{"label":"Собственный сервисный центр","value":"да"},{"label":"Рейтинг магазина, Яндекс","value":"4,9"},{"label":"Количество отзывов, Яндекс","value":"17"},{"label":"Адрес офиса","value":"Москва, Калужская площадь, 1/1"}]}$b187$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 52, 'pros_cons',
       $b188${"pros":["Комплексная модель: продажа оборудования + хостинг;","Одна из самых мощных площадок в России (80 МВт);","Гибкие тарифы на электроэнергию;","Возможность личного визита на объект;","Финансовые гарантии при утрате оборудования по вине хостинга."],"cons":["Отсутствует информация о числе клиентов и установленных асиков;","Единственная локация в Сибири может вызвать сложности с логистикой для удаленных регионов."]}$b188$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 53, 'heading',
       $h189${"level":2,"text":"3 место: IBMM Technology (АйБиЭмЭм Технолоджи)"}$h189$::jsonb,
       'ibmm'
FROM articles a WHERE a.slug = 'luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 54, 'paragraph',
       $b190${"text":"IBMM Technology – это крупная экосистема, объединяющая продажу оборудования и услуги хостинга для майнинговых ферм. Компания предлагает сразу несколько локаций для размещения техники: в Минеральных Водах, Перми, Пензе и Сибири. Такой географический разброс позволяет клиентам выбирать наиболее подходящий регион с учетом логистики и тарифов.","html":"IBMM Technology – это крупная экосистема, объединяющая продажу оборудования и услуги хостинга для майнинговых ферм. Компания предлагает сразу несколько локаций для размещения техники: в Минеральных Водах, Перми, Пензе и Сибири. Такой географический разброс позволяет клиентам выбирать наиболее подходящий регион с учетом логистики и тарифов."}$b190$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 55, 'paragraph',
       $b191${"text":"Начальная стоимость размещения начинается с одних из самых низких по РФ значений, но такая цена доступна для крупных клиентов с фермами от 50 асиков. Минимальный порог для начала сотрудничества – от 5 единиц оборудования. Хостинг предполагает официальное оформление услуг, размещение в помещениях с системой охраны и базовыми мерами безопасности.","html":"Начальная стоимость размещения начинается с одних из самых низких по РФ значений, но такая цена доступна для крупных клиентов с фермами от 50 асиков. Минимальный порог для начала сотрудничества – от 5 единиц оборудования. Хостинг предполагает официальное оформление услуг, размещение в помещениях с системой охраны и базовыми мерами безопасности."}$b191$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 56, 'paragraph',
       $b192${"text":"На официальном сайте IBMM Technology информация о хостинге представлена довольно сжато – подробности предоставляются в личном диалоге с менеджерами. Известно, что общий объем размещенного оборудования составляет около 4 000 единиц, а сами клиенты часто отмечают хорошую организацию и сервис.","html":"На официальном сайте IBMM Technology информация о хостинге представлена довольно сжато – подробности предоставляются в личном диалоге с менеджерами. Известно, что общий объем размещенного оборудования составляет около 4 000 единиц, а сами клиенты часто отмечают хорошую организацию и сервис."}$b192$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 57, 'image',
       $b193${"src":"/images/articles/mining-companies/ibmm.png","alt":"IBMM Technology — продажа и хостинг"}$b193$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 58, 'stats',
       $b194${"rows":[{"label":"Юридическое лицо","value":"нет данных"},{"label":"Выручка","value":"нет данных"},{"label":"Суды","value":"нет данных"},{"label":"Лет на рынке","value":"нет данных"},{"label":"Уставной капитал","value":"нет данных"},{"label":"Расположение хостинга","value":"Минеральные Воды, Пермь, Пенза, Сибирь"},{"label":"Количество размещенных устройств","value":"более 4 000"},{"label":"Обслуживаемая мощность","value":"100 МВт/ч"},{"label":"Свободные мощности","value":"нет данных"},{"label":"Стоимость размещения","value":"от 4,2 ₽ за КВт"},{"label":"Сайт","value":"ibmm.ru"},{"label":"Дата регистрации домена","value":"2017 год"},{"label":"Собственный магазин по продаже оборудования","value":"да"},{"label":"Собственный сервисный центр","value":"да"},{"label":"Рейтинг площадки, Яндекс","value":"5"},{"label":"Количество отзывов, Яндекс","value":"225"},{"label":"Адрес офиса","value":"Москва, МКАД, 44 км., дом 1"}]}$b194$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 59, 'pros_cons',
       $b195${"pros":["Один из ведущих поставщиков техники для майнинга в России;","Пять площадок в разных регионах страны;","Привлекательные тарифы для крупных майнеров;","Положительные отзывы и высокий уровень доверия;","Официальное оформление и размещение в помещениях."],"cons":["Входной порог – от 5 асиков, что может быть неудобно для новичков;","Ограниченная информация на сайте – многие детали доступны только при личном общении."]}$b195$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 60, 'heading',
       $h196${"level":2,"text":"2 место: Promminer (Проммайнер)"}$h196$::jsonb,
       'promminer'
FROM articles a WHERE a.slug = 'luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 61, 'paragraph',
       $b197${"text":"Компания Promminer, широко известная как один из лидеров по продаже техники для майнинга в России, также предлагает услуги по размещению оборудования в собственном дата-центре. Однако на официальном сайте бренда представлено ограниченное количество информации о точных условиях сотрудничества, что может вызывать вопросы у потенциальных клиентов.","html":"Компания Promminer, широко известная как один из лидеров по продаже техники для майнинга в России, также предлагает услуги по размещению оборудования в собственном дата-центре. Однако на официальном сайте бренда представлено ограниченное количество информации о точных условиях сотрудничества, что может вызывать вопросы у потенциальных клиентов."}$b197$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 62, 'paragraph',
       $b198${"text":"Promminer заявляет, что предлагает одни из наименьших цен на размещение, однако в рамках обзора на видеоролике, размещенном на том же сайте, фигурирует другая стоимость. Это несоответствие между заявленной информацией и фактическими данными может вызвать недоверие у потенциальных партнеров.","html":"Promminer заявляет, что предлагает одни из наименьших цен на размещение, однако в рамках обзора на видеоролике, размещенном на том же сайте, фигурирует другая стоимость. Это несоответствие между заявленной информацией и фактическими данными может вызвать недоверие у потенциальных партнеров."}$b198$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 63, 'paragraph',
       $b199${"text":"Среди заявленных параметров – стабильный up-time в 99%, круглосуточное техническое обслуживание, онлайн-мониторинг оборудования, а также страхование размещенной техники. Дополнительный плюс – охрана объекта обеспечивается силами Росгвардии, что добавляет уверенности в сохранности имущества.","html":"Среди заявленных параметров – стабильный up-time в 99%, круглосуточное техническое обслуживание, онлайн-мониторинг оборудования, а также страхование размещенной техники. Дополнительный плюс – охрана объекта обеспечивается силами Росгвардии, что добавляет уверенности в сохранности имущества."}$b199$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 64, 'image',
       $b200${"src":"/images/articles/rating-countries/datacenter-fans.png","alt":"Promminer — продажа и хостинг асиков"}$b200$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 65, 'stats',
       $b201${"rows":[{"label":"Юридическое лицо","value":"ООО «ПРОММАЙНЕР»"},{"label":"Выручка","value":"121.2 млн ₽"},{"label":"Суды","value":"нет"},{"label":"Лет на рынке","value":"более полутора лет; (вероятно, новая ООО)"},{"label":"Уставной капитал","value":"500 тыс ₽"},{"label":"Расположение хостинга","value":"Кемеровская область"},{"label":"Количество размещенных устройств","value":"нет данных"},{"label":"Обслуживаемая мощность","value":"40 МВт/ч"},{"label":"Свободные мощности","value":"нет данных"},{"label":"Стоимость размещения","value":"от 4,3 ₽ за КВт"},{"label":"Сайт","value":"promminer.ru"},{"label":"Дата регистрации домена","value":"2019 год"},{"label":"Собственный магазин по продаже оборудования","value":"да"},{"label":"Собственный сервисный центр","value":"да"},{"label":"Рейтинг площадки, Яндекс","value":"4,9"},{"label":"Количество отзывов, Яндекс","value":"90"},{"label":"Адрес офиса","value":"Москва, ул. Летная, 99 ст3, офис 4"}]}$b201$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 66, 'pros_cons',
       $b202${"pros":["Размещение оборудования у одного из топовых дистрибьюторов майнинговой техники в РФ;","Страхование техники клиента от рисков;","Круглосуточная охрана от Росгвардии;","Положительная репутация и множество хороших отзывов."],"cons":["Недостаток прозрачной информации на официальном ресурсе;","Разночтения в ценах и условиях между сайтом и видеоматериалами;","Не указаны точные параметры дата-центра и география на главной странице."]}$b202$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 67, 'heading',
       $h203${"level":2,"text":"1 место: BitRiver (БитРивер)"}$h203$::jsonb,
       'bitriver'
FROM articles a WHERE a.slug = 'luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 68, 'paragraph',
       $b204${"text":"Компания BitRiver по праву считается лидером в российской индустрии майнинга. С совокупной мощностью, превышающей 300 МВт, она занимает первое место среди всех игроков на рынке. Масштабы деятельности настолько внушительны, что компания оказалась под санкциями США – причиной стало участие в технологическом секторе экономики РФ.","html":"Компания BitRiver по праву считается лидером в российской индустрии майнинга. С совокупной мощностью, превышающей 300 МВт, она занимает первое место среди всех игроков на рынке. Масштабы деятельности настолько внушительны, что компания оказалась под санкциями США – причиной стало участие в технологическом секторе экономики РФ."}$b204$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 69, 'paragraph',
       $b205${"text":"На сегодняшний день BitRiver управляет девятью дата-центрами, расположенными в разных регионах страны. В инфраструктуре компании размещено более 100 000 единиц оборудования, а в штате трудится более 500 сотрудников.","html":"На сегодняшний день BitRiver управляет девятью дата-центрами, расположенными в разных регионах страны. В инфраструктуре компании размещено более 100 000 единиц оборудования, а в штате трудится более 500 сотрудников."}$b205$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 70, 'paragraph',
       $b206${"text":"Однако следует отметить, что BitRiver не ориентирована на розничных клиентов. Условия сотрудничества предполагают входной порог от 5 млн рублей, поэтому услуги доступны исключительно крупным инвесторам и майнерам с большим парком устройств. Все детали обсуждаются персонально – стандартных тарифов и условий на сайте не указано.","html":"Однако следует отметить, что BitRiver не ориентирована на розничных клиентов. Условия сотрудничества предполагают входной порог от 5 млн рублей, поэтому услуги доступны исключительно крупным инвесторам и майнерам с большим парком устройств. Все детали обсуждаются персонально – стандартных тарифов и условий на сайте не указано."}$b206$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 71, 'image',
       $b207${"src":"/images/articles/mining-companies/bitriver.png","alt":"BitRiver — крупнейший оператор дата-центров"}$b207$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 72, 'stats',
       $b208${"rows":[{"label":"Юридическое лицо","value":"нет данных"},{"label":"Выручка","value":"нет данных"},{"label":"Суды","value":"нет данных"},{"label":"Лет на рынке","value":"нет данных"},{"label":"Уставной капитал","value":"нет данных"},{"label":"Расположение хостинга","value":"9 дата-центров"},{"label":"Количество размещенных устройств","value":"более 100 000"},{"label":"Обслуживаемая мощность","value":"300 МВт/ч"},{"label":"Свободные мощности","value":"нет данных"},{"label":"Стоимость размещения","value":"нет данных"},{"label":"Сайт","value":"lp-bitriver.ru"},{"label":"Дата регистрации домена","value":"2023 год"},{"label":"Собственный магазин по продаже оборудования","value":"да"},{"label":"Собственный сервисный центр","value":"да"},{"label":"Рейтинг магазина, Яндекс","value":"4,2"},{"label":"Количество отзывов, Яндекс","value":"23"},{"label":"Адрес офиса","value":"Москва, ул. Анненская, д.17"}]}$b208$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 73, 'pros_cons',
       $b209${"pros":["Лидер по объему хостинга в РФ – более 300 МВт суммарной мощности;","Широкая география - 9 дата-центров в разных регионах;","Продуманный подход к инвесторам – формат «бизнес под ключ»;","Сервисный центр в каждом из хостингов;","Возможность инвестирования в майнинг с пассивным доходом;","Международное признание – компания на слуху за пределами России."],"cons":["Ориентированность только на оптовых клиентов и крупных инвесторов;","Отсутствие детальных условий и тарифов в открытом доступе;","Наличие противоречивых отзывов и обсуждение репутации в медиасреде."]}$b209$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 74, 'heading',
       $h210${"level":2,"text":"Как выбрать майнинговую компанию в России?"}$h210$::jsonb,
       'kak-vybrat'
FROM articles a WHERE a.slug = 'luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 75, 'paragraph',
       $b211${"text":"Развитие майнинга в России набирает обороты, и вместе с этим растет количество компаний, предлагающих оборудование, услуги хостинга и инвестиционные решения. Но чтобы сделать правильный выбор, нужно учитывать свои цели: покупка техники, размещение оборудования или инвестирование в майнинг.","html":"Развитие майнинга в России набирает обороты, и вместе с этим растет количество компаний, предлагающих оборудование, услуги хостинга и инвестиционные решения. Но чтобы сделать правильный выбор, нужно учитывать свои цели: покупка техники, размещение оборудования или инвестирование в майнинг."}$b211$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 76, 'rich_list',
       $b212${"ordered":false,"items":[{"title":"Покупка оборудования","text":"Если ваша цель – покупка оборудования, выбирайте компанию с проверенной репутацией и прозрачной схемой поставок. Обратите внимание на наличие ассортимента (разные модели асиков), гарантии и условия возврата, отзывы покупателей, наличие сервисного центра, юридическое оформление сделки. Для этих целей отлично подходят такие компании, как Promminer, Getasic, Intelion, IBMM;"},{"title":"Размещение (хостинг)","text":"Если вы ищете место для размещения (хостинг), здесь важно понимать условия работы дата-центра: тарифы на электроэнергию (день/ночь), up-time и скорость реагирования, местоположение (логистика), охрана и система мониторинга, наличие страхования и технического обслуживания. Рассмотрите Sibmain, Gis Mining, BitRiver (для крупных объемов), Umnus;"},{"title":"Инвестиции в майнинг","text":"Если вы хотите инвестировать в майнинг, некоторые компании предлагают инвестиционные продукты: покупка доли в дата-центре, участие в прибыли или готовый бизнес. Проверьте прозрачность схемы инвестирования, наличие договоров, риски и сроки окупаемости, отзывы и кейсы других инвесторов, минимальный входной порог. Инвесторам подойдут: BitRiver, Intelion, Mining Cluster."}]}$b212$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 77, 'heading',
       $h213${"level":2,"text":"Выводы"}$h213$::jsonb,
       'vyvody'
FROM articles a WHERE a.slug = 'luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 78, 'paragraph',
       $b214${"text":"Выбор майнинговой компании напрямую зависит от ваших целей и бюджета. Для покупки техники подойдут магазины с хорошей репутацией и поддержкой. Для хостинга – дата-центры с прозрачными условиями и надежной инфраструктурой. А для инвестиций – только крупные игроки, работающие официально и с доказанным опытом. Важно анализировать не только стоимость услуг, но и безопасность, техническую поддержку и отзывы сообщества.","html":"Выбор майнинговой компании напрямую зависит от ваших целей и бюджета. Для покупки техники подойдут магазины с хорошей репутацией и поддержкой. Для хостинга – дата-центры с прозрачными условиями и надежной инфраструктурой. А для инвестиций – только крупные игроки, работающие официально и с доказанным опытом. Важно анализировать не только стоимость услуг, но и безопасность, техническую поддержку и отзывы сообщества."}$b214$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 79, 'heading',
       $h215${"level":2,"text":"Выбор хостинга с ТОП МАЙНИНГ: просто, быстро и выгодно"}$h215$::jsonb,
       'vybor-hostinga'
FROM articles a WHERE a.slug = 'luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 80, 'paragraph',
       $b216${"text":"Планируете масштабировать ферму или только начинаете путь в майнинге? Первый шаг – это инфраструктура.","html":"Планируете масштабировать ферму или только начинаете путь в майнинге? Первый шаг – это инфраструктура."}$b216$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 81, 'paragraph',
       $b217${"text":"ТОП МАЙНИНГ: первая в России платформа, объединяющая проверенные площадки для майнинга. Мы крупнейший агрегатор майнинг-хостингов в России и СНГ.","html":"ТОП МАЙНИНГ: первая в России платформа, объединяющая проверенные площадки для майнинга. Мы крупнейший агрегатор майнинг-хостингов в России и СНГ."}$b217$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 82, 'paragraph',
       $b218${"text":"ТОП МАЙНИНГ – первый в России агрегатор площадок для майнинга, где можно:","html":"ТОП МАЙНИНГ – первый в России агрегатор площадок для майнинга, где можно:"}$b218$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 83, 'list',
       $b219${"ordered":false,"items":["Купить площадку для майнинга любого масштаба;","Продать площадку для майнинга быстро и по рыночной цене;","Арендовать площадку для майнинга на гибких условиях;","Совокупная мощность площадок в нашей базе – свыше 150 МВт;","Проверенные предложения, юридическая чистота и профессиональное сопровождение;","Удобный поиск, фильтрация по параметрам, прямой контакт с собственниками."]}$b219$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 84, 'paragraph',
       $b220${"text":"Свяжитесь с нашим менеджером, чтобы узнать подробности.","html":"Свяжитесь с нашим менеджером, чтобы узнать подробности."}$b220$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 85, 'paragraph',
       $b221${"text":"Еще больше полезной и актуальной информации можно найти в нашем Телеграм-канале. Подписывайтесь, чтобы оставаться в курсе свежих новостей.","html":"Еще больше полезной и актуальной информации можно найти в нашем Телеграм-канале. Подписывайтесь, чтобы оставаться в курсе свежих новостей."}$b221$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov';
