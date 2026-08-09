SET client_encoding = 'UTF8';

-- Blocks: samye-populyarnye-asiki-dlya-majninga-top-5
INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 1, 'heading',
       $h1067${"level":2,"text":"Введение"}$h1067$::jsonb,
       'vvedenie'
FROM articles a WHERE a.slug = 'samye-populyarnye-asiki-dlya-majninga-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 2, 'paragraph',
       $b1068${"text":"Криптовалютный рынок продолжает активно развиваться, и майнинг остается одним из ключевых способов получения цифровых активов. Среди оборудования для майнинга особое место занимают асики – специализированные устройства, созданные исключительно для добычи конкретных криптовалют. В отличие от видеокарт (GPU) и центральных процессоров (CPU), ASIC предоставляют невероятную вычислительную мощность и энергоэффективность. Их высокая производительность сделала их фаворитами в индустрии. Но какие из них действительно заслуживают внимания сегодня, и как сделать грамотный выбор среди множества моделей?","html":"Криптовалютный рынок продолжает активно развиваться, и майнинг остается одним из ключевых способов получения цифровых активов. Среди оборудования для майнинга особое место занимают асики – специализированные устройства, созданные исключительно для добычи конкретных криптовалют. В отличие от видеокарт (GPU) и центральных процессоров (CPU), ASIC предоставляют невероятную вычислительную мощность и энергоэффективность. Их высокая производительность сделала их фаворитами в индустрии. Но какие из них действительно заслуживают внимания сегодня, и как сделать грамотный выбор среди множества моделей?"}$b1068$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samye-populyarnye-asiki-dlya-majninga-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 3, 'image',
       $b1069${"src":"/images/articles/popular-asics/mining-farm.png","alt":"Майнинг-ферма с ASIC-оборудованием"}$b1069$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samye-populyarnye-asiki-dlya-majninga-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 4, 'heading',
       $h1070${"level":2,"text":"Как те или иные асики становятся популярными?"}$h1070$::jsonb,
       'kak-stali-populyarnymi'
FROM articles a WHERE a.slug = 'samye-populyarnye-asiki-dlya-majninga-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 5, 'paragraph',
       $b1071${"text":"Не все асики становятся популярными – рынок изобилует как успешными моделями, так и откровенно неудачными. Те устройства, которые попадают в ТОП по популярности, объединяет ряд ключевых характеристик, делающих их выгодными и надежными в эксплуатации.","html":"Не все асики становятся популярными – рынок изобилует как успешными моделями, так и откровенно неудачными. Те устройства, которые попадают в ТОП по популярности, объединяет ряд ключевых характеристик, делающих их выгодными и надежными в эксплуатации."}$b1071$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samye-populyarnye-asiki-dlya-majninga-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 6, 'rich_list',
       $b1072${"ordered":false,"items":[{"title":"Оптимальное соотношение хэшрейта и энергоэффективности","text":"Лидеры среди асиков выдают высокий хэшрейт при умеренном или низком энергопотреблении. Это критично: даже при высокой производительности устройство, потребляющее слишком много электричества, быстро становится убыточным;"},{"title":"Актуальность алгоритма и монеты","text":"Популярность майнера напрямую связана с монетой, которую он добывает. Например, Antminer S21 популярен, потому что работает на алгоритме SHA-256, который используется для майнинга Bitcoin – самой капитализированной и стабильной криптовалюты. Аналогично, Antminer L9 популярен благодаря росту интереса к Dogecoin и Litecoin;"},{"title":"Устойчивость к устареванию","text":"Асики из ТОПа имеют «запас по мощности» и часто актуальны в течение нескольких лет. Пользователи предпочитают такие модели, потому что они долго остаются прибыльными даже с учетом роста сложности сети;"},{"title":"Широкая доступность и поддержка от производителя","text":"Большинство популярных моделей выпускаются крупными брендами – Bitmain, MicroBT, Goldshell (бренды с надежной логистикой, технической поддержкой, регулярными обновлениями прошивок). Это дает уверенность покупателю в стабильной работе оборудования;"},{"title":"Хорошее сообщество и наличие прошивок/модификаций","text":"Хитовые асики имеют большое комьюнити. Это означает наличие оптимизированных прошивок (например, Hiveon, Braiins OS), гайдов по разгону, лайфхаков по охлаждению и ремонту. Это особенно важно новичкам;"},{"title":"Простота установки и настройки","text":"Модели из ТОПа часто имеют удобный веб-интерфейс, автоподключение к пулам и быструю интеграцию. Пользователи, особенно новички, выбирают оборудование, которое можно запустить буквально «из коробки»;"},{"title":"Цена и окупаемость","text":"Популярные асики показывают средний или быстрый срок окупаемости даже при текущих ценах на криптовалюту и электроэнергию. Это делает их привлекательными как для майнеров-одиночек, так и для крупных ферм."}]}$b1072$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samye-populyarnye-asiki-dlya-majninga-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 7, 'paragraph',
       $b1073${"text":"Так выглядит список из семи ключевых параметров, которые становятся причиной популярности той или иной модели устройства.","html":"Так выглядит список из семи ключевых параметров, которые становятся причиной популярности той или иной модели устройства."}$b1073$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samye-populyarnye-asiki-dlya-majninga-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 8, 'heading',
       $h1074${"level":2,"text":"Как грамотно выбрать ASIC-майнер?"}$h1074$::jsonb,
       'kak-vybrat'
FROM articles a WHERE a.slug = 'samye-populyarnye-asiki-dlya-majninga-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 9, 'paragraph',
       $b1075${"text":"Краткий список требований для приобретения действительно актуальной и долговечной модели майнерской техники:","html":"Краткий список требований для приобретения действительно актуальной и долговечной модели майнерской техники:"}$b1075$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samye-populyarnye-asiki-dlya-majninga-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 10, 'rich_list',
       $b1076${"ordered":false,"items":[{"title":"Алгоритм майнинга","text":"Выбор зависит от того, какую криптовалюту вы хотите добывать: SHA-256 для Bitcoin и Bitcoin Cash, Scrypt для Litecoin и Dogecoin, Ethash / Etchash для Ethereum Classic и т.д.;"},{"title":"Хэшрейт (Hashrate)","text":"Это мощность майнера, измеряемая в TH/s или GH/s. Чем выше, тем быстрее устройство решает блоки. Но большее значение не всегда лучше, если оно сопровождается огромным энергопотреблением;"},{"title":"Энергоэффективность","text":"Измеряется в J/TH (джоулей на терахэш). Энергозатраты – один из ключевых факторов прибыли. Лучше выбирать устройство с максимально низким значением при достойном хэшрейте;"},{"title":"Стоимость и окупаемость","text":"Сравните цену устройства, текущую сложность сети и доходность. Используйте ROI-калькуляторы и учитывайте цену на электроэнергию в вашем регионе;"},{"title":"Поддержка и производитель","text":"Надежные бренды с хорошим сервисом – Bitmain (Antminer), MicroBT (Whatsminer), iPollo, Goldshell. Лучше избегать малоизвестных производителей без репутации и отзывов."}]}$b1076$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samye-populyarnye-asiki-dlya-majninga-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 11, 'paragraph',
       $b1077${"text":"В любой без исключения сфере есть свои бестселлеры – автомобилестроение, литература и даже майнинг.","html":"В любой без исключения сфере есть свои бестселлеры – автомобилестроение, литература и даже майнинг."}$b1077$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samye-populyarnye-asiki-dlya-majninga-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 12, 'paragraph',
       $b1078${"text":"Направление добычи криптовалют при помощи майнеров обладает своим рейтингом: познакомимся с самыми популярными асиками для майнинга – подготовили ТОП-8 устройств, которые чаще остальных выбираются криптоэнтузиастами. Это абсолютно разные устройства, которые обладают общим признаком – именно эти модели значительно популярнее конкурирующих разработок.","html":"Направление добычи криптовалют при помощи майнеров обладает своим рейтингом: познакомимся с самыми популярными асиками для майнинга – подготовили ТОП-8 устройств, которые чаще остальных выбираются криптоэнтузиастами. Это абсолютно разные устройства, которые обладают общим признаком – именно эти модели значительно популярнее конкурирующих разработок."}$b1078$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samye-populyarnye-asiki-dlya-majninga-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 13, 'heading',
       $h1079${"level":2,"text":"8 место: iPollo V1"}$h1079$::jsonb,
       'ipollo-v1'
FROM articles a WHERE a.slug = 'samye-populyarnye-asiki-dlya-majninga-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 14, 'paragraph',
       $b1080${"text":"Данный бренд появился недавно – модель увидела свет в 2022 году и сразу же завоевала сердца множества домашних майнеров. Причина кроется в концепции устройства: это компактный и практически бесшумный асик, идеально подходящий для добычи криптовалют в домашних условиях. Также во время работы iPollo V1 не подвержен серьезному нагреву, что добавляет преимуществ в формате эксплуатации данной фермы в жилых помещениях.","html":"Данный бренд появился недавно – модель увидела свет в 2022 году и сразу же завоевала сердца множества домашних майнеров. Причина кроется в концепции устройства: это компактный и практически бесшумный асик, идеально подходящий для добычи криптовалют в домашних условиях. Также во время работы iPollo V1 не подвержен серьезному нагреву, что добавляет преимуществ в формате эксплуатации данной фермы в жилых помещениях."}$b1080$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samye-populyarnye-asiki-dlya-majninga-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 15, 'paragraph',
       $b1081${"text":"К сожалению, линейка iPollo V1 не предназначена для добычи Биткоина. Асик работает на алгоритме EtHash, ориентированном на альткоины, например, Ethereum Classic (ETC). И в этом нет ничего удивительного, так как первая криптовалюта мира требовательна к технической начинке майнеров, что и является причиной нагрева, серьезного энергопотребления и высокого уровня шума. iPollo V1 лишен данных недостатков за счет майнинга альтов. Это оптимальный формат для домашней добычи, а также знакомства с направлением.","html":"К сожалению, линейка iPollo V1 не предназначена для добычи Биткоина. Асик работает на алгоритме EtHash, ориентированном на альткоины, например, Ethereum Classic (ETC). И в этом нет ничего удивительного, так как первая криптовалюта мира требовательна к технической начинке майнеров, что и является причиной нагрева, серьезного энергопотребления и высокого уровня шума. iPollo V1 лишен данных недостатков за счет майнинга альтов. Это оптимальный формат для домашней добычи, а также знакомства с направлением."}$b1081$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samye-populyarnye-asiki-dlya-majninga-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 16, 'image',
       $b1082${"src":"/images/articles/popular-asics/ipollo-v1.png","alt":"iPollo V1"}$b1082$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samye-populyarnye-asiki-dlya-majninga-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 17, 'stats',
       $b1083${"rows":[{"label":"Производитель","value":"IPollo Miner"},{"label":"Год выпуска","value":"2022"},{"label":"Базовый хешрейт","value":"130-3 600 МХ/с"},{"label":"Энергопотребление","value":"104-3 100 Вт"},{"label":"Энергоэффективность","value":"0,58-0,96 Вт на МХ"},{"label":"Алгоритм","value":"EtHash и EtcHash"},{"label":"Количество монет, доступных для майнинга","value":"36"},{"label":"Размеры","value":"от 17,9 x 14,3 x 9 до 31,4 x 19,4 x 29 см"},{"label":"Масса","value":"от 2,1 до 13 кг"},{"label":"Уровень шума","value":"от 55 до 70 дБ"}]}$b1083$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samye-populyarnye-asiki-dlya-majninga-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 18, 'pros_cons',
       $b1084${"pros":["Компактность – майнер не занимает много места;","Низкий уровень шума во время работы;","Небольшой объем энергопотребления;","Незначительная теплоотдача;","Идеальный вариант для первого майнера, а также домашнего использования."],"cons":["Скромный уровень дохода;","Не самый известный и достаточно молодой производитель."]}$b1084$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samye-populyarnye-asiki-dlya-majninga-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 19, 'heading',
       $h1085${"level":2,"text":"7 место: Whatsminer M50"}$h1085$::jsonb,
       'whatsminer-m50'
FROM articles a WHERE a.slug = 'samye-populyarnye-asiki-dlya-majninga-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 20, 'paragraph',
       $b1086${"text":"Асик Whatsminer M50 от компании MicroBT является прямым конкурентом Antminer S19: модели обладают схожими техническими характеристиками и аналогичной стоимостью. Вопрос выбора между двумя этими производителями концептуальный: сравнить ситуацию можно с конкуренцией в других отраслях, например, Apple или Samsung, Toyota или BMW, Pepsi или Coca-Cola.","html":"Асик Whatsminer M50 от компании MicroBT является прямым конкурентом Antminer S19: модели обладают схожими техническими характеристиками и аналогичной стоимостью. Вопрос выбора между двумя этими производителями концептуальный: сравнить ситуацию можно с конкуренцией в других отраслях, например, Apple или Samsung, Toyota или BMW, Pepsi или Coca-Cola."}$b1086$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samye-populyarnye-asiki-dlya-majninga-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 21, 'paragraph',
       $b1087${"text":"Но если проанализировать характеристики более детально, незначительные отличия все же имеются. Например, Whatsminer выпускается в горизонтальном одноэтажном форм-факторе всего с двумя вентиляторами. Устройства Antminer – это двухэтажные майнеры, в конструкции которых задействовано сразу 4 кулера. Существенной роли это не играет, поэтому выбор между MicroBT и Antminer не принципиальный.","html":"Но если проанализировать характеристики более детально, незначительные отличия все же имеются. Например, Whatsminer выпускается в горизонтальном одноэтажном форм-факторе всего с двумя вентиляторами. Устройства Antminer – это двухэтажные майнеры, в конструкции которых задействовано сразу 4 кулера. Существенной роли это не играет, поэтому выбор между MicroBT и Antminer не принципиальный."}$b1087$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samye-populyarnye-asiki-dlya-majninga-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 22, 'image',
       $b1088${"src":"/images/articles/popular-asics/whatsminer-m50.png","alt":"Whatsminer M50"}$b1088$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samye-populyarnye-asiki-dlya-majninga-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 23, 'stats',
       $b1089${"rows":[{"label":"Производитель","value":"MicroBT"},{"label":"Год выпуска","value":"2022"},{"label":"Базовый хешрейт","value":"114-126 ТХ/с"},{"label":"Энергопотребление","value":"3 276-3 306 Вт"},{"label":"Энергоэффективность","value":"26-29 Вт на ТХ"},{"label":"Алгоритм","value":"SHA-256"},{"label":"Количество монет, доступных для майнинга","value":"36"},{"label":"Размеры","value":"43 x 22 x 15,5 см"},{"label":"Масса","value":"11,7 кг"},{"label":"Уровень шума","value":"75 дБ"}]}$b1089$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samye-populyarnye-asiki-dlya-majninga-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 24, 'pros_cons',
       $b1090${"pros":["Линейка, не утратившая актуальность даже после халвинга (для площадок с недорогим электричеством);","Существует мнение, что продукция Whatsminer является эталоном качества и надежности;","Популярность производителя и модели – нет трудностей с ремонтом;","Актуальность для вторичного рынка."],"cons":["После халвинга доходность майнинга на Whatsminer M50 значительно снизилась;","Неясные перспективы: если сложность продолжит увеличиваться серьезными темпами, уже совсем скоро Whatsminer M50 утратит актуальность."]}$b1090$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samye-populyarnye-asiki-dlya-majninga-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 25, 'heading',
       $h1091${"level":2,"text":"6 место: Antminer L9"}$h1091$::jsonb,
       'antminer-l9'
FROM articles a WHERE a.slug = 'samye-populyarnye-asiki-dlya-majninga-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 26, 'paragraph',
       $b1092${"text":"Если предыдущие поколения майнеров на алгоритме Scrypt можно было назвать стандартными рабочими машинами, то Antminer L9 — это уже тяжелая промышленная система для добычи криптовалют. Превосходя популярную модель L7, данный ASIC стал новым эталоном для майнинга Litecoin и Dogecoin.","html":"Если предыдущие поколения майнеров на алгоритме Scrypt можно было назвать стандартными рабочими машинами, то Antminer L9 — это уже тяжелая промышленная система для добычи криптовалют. Превосходя популярную модель L7, данный ASIC стал новым эталоном для майнинга Litecoin и Dogecoin."}$b1092$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samye-populyarnye-asiki-dlya-majninga-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 27, 'paragraph',
       $b1093${"text":"Antminer L9 показывает внушительную производительность при стандартном энергопотреблении, оставаясь одним из самых мощных Scrypt-ASIC устройств на рынке. Его энергоэффективность обеспечивает оптимальный баланс вычислительной мощности и затрат на электричество — важный фактор как для домашних энтузиастов, так и для промышленных майнинговых ферм.","html":"Antminer L9 показывает внушительную производительность при стандартном энергопотреблении, оставаясь одним из самых мощных Scrypt-ASIC устройств на рынке. Его энергоэффективность обеспечивает оптимальный баланс вычислительной мощности и затрат на электричество — важный фактор как для домашних энтузиастов, так и для промышленных майнинговых ферм."}$b1093$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samye-populyarnye-asiki-dlya-majninga-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 28, 'stats',
       $b1094${"rows":[{"label":"Производитель","value":"Bitmain"},{"label":"Алгоритм","value":"Scrypt"},{"label":"Хешрейт","value":"До 17 600 Mh/s"},{"label":"Потребление энергии","value":"3360 Вт"},{"label":"Монеты","value":"LTC, DOGE"},{"label":"Уровень шума","value":"75 дБ"},{"label":"Размеры","value":"400 × 195 × 290 мм"},{"label":"Вес","value":"14.1 кг"},{"label":"Год выпуска","value":"2024"}]}$b1094$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samye-populyarnye-asiki-dlya-majninga-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 29, 'pros_cons',
       $b1095${"pros":["Максимальная производительность среди ASIC-майнеров на алгоритме Scrypt;","Мощнее предыдущей модели L7;","Высокая энергоэффективность;","Классическое воздушное охлаждение;","Подходит для объединенного майнинга нескольких монет."],"cons":["Высокий уровень шума;","Высокая стартовая стоимость по сравнению с менее мощными аналогами."]}$b1095$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samye-populyarnye-asiki-dlya-majninga-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 30, 'heading',
       $h1096${"level":2,"text":"5 место: Antminer L7"}$h1096$::jsonb,
       'antminer-l7'
FROM articles a WHERE a.slug = 'samye-populyarnye-asiki-dlya-majninga-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 31, 'paragraph',
       $b1097${"text":"Даже с появлением новых и более мощных моделей, Antminer L7 остается одним из самых популярных ASIC-майнеров на алгоритме Scrypt. Его ценят за проверенную надежность, эффективность и оптимальный баланс мощности, шума и энергопотребления. Именно эта модель долгое время оставалась эталоном для добычи Litecoin и Dogecoin и до сих пор активно используется как на крупных фермах, так и в небольших частных установках.","html":"Даже с появлением новых и более мощных моделей, Antminer L7 остается одним из самых популярных ASIC-майнеров на алгоритме Scrypt. Его ценят за проверенную надежность, эффективность и оптимальный баланс мощности, шума и энергопотребления. Именно эта модель долгое время оставалась эталоном для добычи Litecoin и Dogecoin и до сих пор активно используется как на крупных фермах, так и в небольших частных установках."}$b1097$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samye-populyarnye-asiki-dlya-majninga-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 32, 'paragraph',
       $b1098${"text":"Antminer L7 выдает до 9500 Mh/s при потреблении 3425 Вт, что делает его эффективным инструментом для стабильного и долгосрочного майнинга. Это устройство сочетает в себе рабочую мощь и энергоэффективность, оставаясь рентабельным майнером даже после 2025 года.","html":"Antminer L7 выдает до 9500 Mh/s при потреблении 3425 Вт, что делает его эффективным инструментом для стабильного и долгосрочного майнинга. Это устройство сочетает в себе рабочую мощь и энергоэффективность, оставаясь рентабельным майнером даже после 2025 года."}$b1098$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samye-populyarnye-asiki-dlya-majninga-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 33, 'stats',
       $b1099${"rows":[{"label":"Производитель","value":"Bitmain"},{"label":"Алгоритм","value":"Scrypt"},{"label":"Хешрейт","value":"До 9500 Mh/s"},{"label":"Потребление энергии","value":"3425 Вт"},{"label":"Монеты","value":"LTC, DOGE"},{"label":"Уровень шума","value":"75 дБ"},{"label":"Размеры","value":"180 × 225 × 320 мм"},{"label":"Вес","value":"15 кг"},{"label":"Год выпуска","value":"2021"}]}$b1099$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samye-populyarnye-asiki-dlya-majninga-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 34, 'pros_cons',
       $b1100${"pros":["Один из самых популярных ASIC-майнеров на Scrypt;","Проверенная эксплуатацией стабильность и надежность;","Неплохая производительность при умеренном энергопотреблении;","Поддержка майнинга выгодных монет: LTC и DOGE;","Остается актуальным даже в условиях появления новых мощных моделей."],"cons":["Уровень шума около 75 дБ — не подходит для жилых помещений без шумоизоляции;","Конкуренция с новыми ASIC-устройствами делает срок окупаемости длиннее."]}$b1100$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samye-populyarnye-asiki-dlya-majninga-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 35, 'heading',
       $h1101${"level":2,"text":"4 место: Antminer S9"}$h1101$::jsonb,
       'antminer-s9'
FROM articles a WHERE a.slug = 'samye-populyarnye-asiki-dlya-majninga-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 36, 'paragraph',
       $b1102${"text":"Устаревшее и актуальное только для «бесплатной» розетки устройство оказалось в нашем рейтинге благодаря статусу легенды. Причина проста – именно эта модель считается настоящей легендой майнинга с самого начала его появления. За все время было выпущено несколько сотен тысяч Antminer S9, многие экземпляры видели нескольких владельцев. Майнеры разгонялись, ремонтировались, усовершенствовались, дополнялись водяным охлаждением (модель S9 Hydro). Именно при помощи этой модели начинали свое знакомство с добычей цифровых активов многие криптоэнтузиасты.","html":"Устаревшее и актуальное только для «бесплатной» розетки устройство оказалось в нашем рейтинге благодаря статусу легенды. Причина проста – именно эта модель считается настоящей легендой майнинга с самого начала его появления. За все время было выпущено несколько сотен тысяч Antminer S9, многие экземпляры видели нескольких владельцев. Майнеры разгонялись, ремонтировались, усовершенствовались, дополнялись водяным охлаждением (модель S9 Hydro). Именно при помощи этой модели начинали свое знакомство с добычей цифровых активов многие криптоэнтузиасты."}$b1102$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samye-populyarnye-asiki-dlya-majninga-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 37, 'paragraph',
       $b1103${"text":"Сегодня использование легенды уже не совсем оправдано, даже если майнер является обладателем так называемой «бесплатной» розетки. Любая альтернатива, выпущенная после 2018 года, будет зарабатывать больше, поэтому Antminer S9 можно смело назвать прошлым. Но это не отменяет того факта, что 9-я линейка является самым популярным асиком для майнинга за все время существования отрасли добычи криптовалют.","html":"Сегодня использование легенды уже не совсем оправдано, даже если майнер является обладателем так называемой «бесплатной» розетки. Любая альтернатива, выпущенная после 2018 года, будет зарабатывать больше, поэтому Antminer S9 можно смело назвать прошлым. Но это не отменяет того факта, что 9-я линейка является самым популярным асиком для майнинга за все время существования отрасли добычи криптовалют."}$b1103$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samye-populyarnye-asiki-dlya-majninga-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 38, 'image',
       $b1104${"src":"/images/articles/popular-asics/antminer-s9.png","alt":"Antminer S9"}$b1104$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samye-populyarnye-asiki-dlya-majninga-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 39, 'stats',
       $b1105${"rows":[{"label":"Производитель","value":"Bitmain"},{"label":"Год выпуска","value":"2017"},{"label":"Хешрейт","value":"от 13 до 18 ТХ/с"},{"label":"Энергопотребление","value":"от 1 280 до 1 728 Вт"},{"label":"Энергоэффективность","value":"от 96 до 98 Вт на ТХ"},{"label":"Алгоритм","value":"SHA-256"},{"label":"Количество монет, доступных для майнинга","value":"36"},{"label":"Уровень шума","value":"85 дБ"}]}$b1105$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samye-populyarnye-asiki-dlya-majninga-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 40, 'pros_cons',
       $b1106${"pros":["Невероятная живучесть и образцовая надежность;","Неприхотливость модели;","Ремонтопригодность;","В прошлом – оптимальный формат для знакомства с майнингом;","Множество запчастей на вторичном рынке."],"cons":["Утрата актуальности после 2024 года."]}$b1106$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samye-populyarnye-asiki-dlya-majninga-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 41, 'heading',
       $h1107${"level":2,"text":"3 место: Antminer S19"}$h1107$::jsonb,
       'antminer-s19'
FROM articles a WHERE a.slug = 'samye-populyarnye-asiki-dlya-majninga-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 42, 'paragraph',
       $b1108${"text":"19-ю серию Antminer от компании Bitmain уже по праву можно считать легендарной. Именно эта модель пользовалась наибольшей популярностью до халвинга 2024 года, однако многие майнеры продолжают добычу с использованием именно этих устройств. Если стоимость электричества ниже средних значений, эксплуатация Antminer S19 по-прежнему рентабельна.","html":"19-ю серию Antminer от компании Bitmain уже по праву можно считать легендарной. Именно эта модель пользовалась наибольшей популярностью до халвинга 2024 года, однако многие майнеры продолжают добычу с использованием именно этих устройств. Если стоимость электричества ниже средних значений, эксплуатация Antminer S19 по-прежнему рентабельна."}$b1108$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samye-populyarnye-asiki-dlya-majninga-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 43, 'paragraph',
       $b1109${"text":"С технической точки зрения техника от Bitmain может похвастаться надежностью и неприхотливостью. Если не пренебрегать правилами регламентированного обслуживания, Antminer способен успешно работать годами. Именно этот факт и позволил продукции Bitmain оказаться в ТОПе самых популярных асиков. Согласно статистике на начало 2025 года, каждый 4-й асик в мире — это именно Antminer S19.","html":"С технической точки зрения техника от Bitmain может похвастаться надежностью и неприхотливостью. Если не пренебрегать правилами регламентированного обслуживания, Antminer способен успешно работать годами. Именно этот факт и позволил продукции Bitmain оказаться в ТОПе самых популярных асиков. Согласно статистике на начало 2025 года, каждый 4-й асик в мире — это именно Antminer S19."}$b1109$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samye-populyarnye-asiki-dlya-majninga-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 44, 'image',
       $b1110${"src":"/images/articles/popular-asics/antminer-s19-a.png","alt":"Antminer S19"}$b1110$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samye-populyarnye-asiki-dlya-majninga-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 45, 'stats',
       $b1111${"rows":[{"label":"Производитель","value":"Bitmain"},{"label":"Год выпуска","value":"2020"},{"label":"Базовый хешрейт","value":"90-110 ТХ/с"},{"label":"Энергопотребление","value":"3 250 Вт"},{"label":"Энергоэффективность","value":"29-36 Вт на ТХ"},{"label":"Алгоритм","value":"SHA-256"},{"label":"Количество монет, доступных для майнинга","value":"36"},{"label":"Размеры","value":"40 x 19,5 x 29 см"},{"label":"Масса","value":"14,4 кг"},{"label":"Уровень шума","value":"82 дБ"}]}$b1111$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samye-populyarnye-asiki-dlya-majninga-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 46, 'pros_cons',
       $b1112${"pros":["Надежные и неприхотливые устройства от проверенного производителя;","Сохранение выгодной добычи даже после халвинга (при условии наличия недорогой розетки);","Актуальность на вторичном рынке;","Быстрый и недорогой ремонт в любом профильном центре."],"cons":["В случае дальнейшего роста хэшрейта сети выгода майнинга на Antminer S19 будет стремительно снижаться;","Низкий доход при дорогом электричестве."]}$b1112$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samye-populyarnye-asiki-dlya-majninga-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 47, 'heading',
       $h1113${"level":2,"text":"2 место: Antminer T21"}$h1113$::jsonb,
       'antminer-t21'
FROM articles a WHERE a.slug = 'samye-populyarnye-asiki-dlya-majninga-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 48, 'paragraph',
       $b1114${"text":"Antminer T21 — это представитель профессиональных майнеров SHA-256, созданный для добычи Биткоина. Он выдает до 190 TH/s при потреблении 3610 Вт, что делает его одним из самых популярных ASIC-устройств своего класса.","html":"Antminer T21 — это представитель профессиональных майнеров SHA-256, созданный для добычи Биткоина. Он выдает до 190 TH/s при потреблении 3610 Вт, что делает его одним из самых популярных ASIC-устройств своего класса."}$b1114$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samye-populyarnye-asiki-dlya-majninga-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 49, 'paragraph',
       $b1115${"text":"Одной из особенностей модели стало трехфазное питание. Такой формат подключения часто используется на крупных майнинг-фермах и дата-центрах, однако менее удобен для частных майнеров. Именно эта особенность делает стоимость Antminer T21 ниже, чем у большинства аналогов с сопоставимым хешрейтом — модель ориентирована на профессиональный рынок, что снижает спрос со стороны домашних пользователей.","html":"Одной из особенностей модели стало трехфазное питание. Такой формат подключения часто используется на крупных майнинг-фермах и дата-центрах, однако менее удобен для частных майнеров. Именно эта особенность делает стоимость Antminer T21 ниже, чем у большинства аналогов с сопоставимым хешрейтом — модель ориентирована на профессиональный рынок, что снижает спрос со стороны домашних пользователей."}$b1115$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samye-populyarnye-asiki-dlya-majninga-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 50, 'image',
       $b1116${"src":"/images/articles/popular-asics/antminer-t21.png","alt":"Antminer T21"}$b1116$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samye-populyarnye-asiki-dlya-majninga-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 51, 'stats',
       $b1117${"rows":[{"label":"Алгоритм","value":"SHA-256"},{"label":"Хешрейт","value":"190 TH/s"},{"label":"Потребление энергии","value":"3610 Вт"},{"label":"Монеты","value":"BTC"},{"label":"Уровень шума","value":"80 дБ"},{"label":"Размеры","value":"570 × 316 × 430 мм"},{"label":"Вес","value":"20 кг"},{"label":"Год выпуска","value":"2023"}]}$b1117$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samye-populyarnye-asiki-dlya-majninga-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 52, 'pros_cons',
       $b1118${"pros":["Один из лидеров по доступности в своей категории;","Подходит для крупных ферм и промышленных майнинг-кластеров;","Хорошая стабильность и надежность."],"cons":["Требуется трехфазное электропитание, что усложняет подключение в домашних условиях;","Уровень шума до 80 дБ — установка возможна только в изолированных помещениях или на майнинг-площадках."]}$b1118$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samye-populyarnye-asiki-dlya-majninga-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 53, 'heading',
       $h1119${"level":2,"text":"1 место: Bitmain Antminer S21"}$h1119$::jsonb,
       'antminer-s21'
FROM articles a WHERE a.slug = 'samye-populyarnye-asiki-dlya-majninga-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 54, 'paragraph',
       $b1120${"text":"Линейка одних из наиболее современных и энергоэффективных на сегодняшний день асиков возглавляет наш рейтинг популярности. Именно такие майнеры наиболее выгодны и эффективны после 2024 года, так как рентабельность младших моделей сомнительна, особенно для локаций с дорогим электричеством.","html":"Линейка одних из наиболее современных и энергоэффективных на сегодняшний день асиков возглавляет наш рейтинг популярности. Именно такие майнеры наиболее выгодны и эффективны после 2024 года, так как рентабельность младших моделей сомнительна, особенно для локаций с дорогим электричеством."}$b1120$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samye-populyarnye-asiki-dlya-majninga-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 55, 'paragraph',
       $b1121${"text":"Линейка Antminer S21 принадлежит китайской компании Bitmain, которая является мировым лидером в сфере производства техники для майнинга. Это является преимуществом для владельцев подобных асиков, так как в России работают многочисленные сервисные центры, запчасти представлены внушительным ассортиментом, бренд популярен на вторичном рынке. Кроме того, устройства от Bitmain зарекомендовали себя в качестве надежных и неприхотливых майнеров, которые при должном уходе могут успешно работать годами.","html":"Линейка Antminer S21 принадлежит китайской компании Bitmain, которая является мировым лидером в сфере производства техники для майнинга. Это является преимуществом для владельцев подобных асиков, так как в России работают многочисленные сервисные центры, запчасти представлены внушительным ассортиментом, бренд популярен на вторичном рынке. Кроме того, устройства от Bitmain зарекомендовали себя в качестве надежных и неприхотливых майнеров, которые при должном уходе могут успешно работать годами."}$b1121$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samye-populyarnye-asiki-dlya-majninga-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 56, 'image',
       $b1122${"src":"/images/articles/popular-asics/antminer-s21-b.png","alt":"Bitmain Antminer S21"}$b1122$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samye-populyarnye-asiki-dlya-majninga-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 57, 'stats',
       $b1123${"rows":[{"label":"Производитель","value":"Bitmain"},{"label":"Год выпуска","value":"2023"},{"label":"Базовый хешрейт","value":"200-335 ТХ/с"},{"label":"Энергопотребление","value":"3 250-5 360 Вт"},{"label":"Энергоэффективность","value":"16-17,5 Вт на ТХ"},{"label":"Алгоритм","value":"SHA-256"},{"label":"Количество монет, доступных для майнинга","value":"36"},{"label":"Размеры","value":"11,7 x 30,4 x 33,8 см (19,5 х 29 х 40 см для версии Hyd)"},{"label":"Масса","value":"17,5 кг (13,1 для версии Hyd)"},{"label":"Уровень шума","value":"70 дБ (50 дБ для версии Hyd)"}]}$b1123$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samye-populyarnye-asiki-dlya-majninga-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 58, 'pros_cons',
       $b1124${"pros":["Образцовая энергоэффективность линейки по состоянию на 2024 год;","Добыча в рамках ключевого и популярного алгоритма – SHA-256;","Известный и проверенный производитель;","Наличие в серии устройства с водяным охлаждением;","Отсутствие проблем с запчастями и сервисными центрами."],"cons":["Высокая стоимость;","Отсутствие адаптации для домашнего майнинга (высокий уровень шума, серьезное энергопотребление, большой объем выделяемого тепла)."]}$b1124$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samye-populyarnye-asiki-dlya-majninga-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 59, 'heading',
       $h1125${"level":2,"text":"Выводы"}$h1125$::jsonb,
       'vyvody'
FROM articles a WHERE a.slug = 'samye-populyarnye-asiki-dlya-majninga-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 60, 'paragraph',
       $b1126${"text":"Асики становятся стандартом в индустрии благодаря своей эффективности, мощности и простоте эксплуатации. Но чтобы инвестиции были оправданными, важно:","html":"Асики становятся стандартом в индустрии благодаря своей эффективности, мощности и простоте эксплуатации. Но чтобы инвестиции были оправданными, важно:"}$b1126$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samye-populyarnye-asiki-dlya-majninga-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 61, 'list',
       $b1127${"ordered":false,"items":["Подобрать модель под нужную криптовалюту и алгоритм;","Оценить потребление энергии и возможную доходность;","Учитывать надежность бренда и актуальность оборудования на фоне постоянно растущей сложности майнинга."]}$b1127$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samye-populyarnye-asiki-dlya-majninga-top-5';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 62, 'paragraph',
       $b1128${"text":"Выбор ASIC должен быть основан не только на технических характеристиках, но и на вашем бюджете, стоимости электроэнергии и стратегии майнинга (долгосрочная добыча, перепродажа, соло-майнинг или через пулы).","html":"Выбор ASIC должен быть основан не только на технических характеристиках, но и на вашем бюджете, стоимости электроэнергии и стратегии майнинга (долгосрочная добыча, перепродажа, соло-майнинг или через пулы)."}$b1128$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samye-populyarnye-asiki-dlya-majninga-top-5';

-- Blocks: top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki
INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 1, 'heading',
       $h1129${"level":2,"text":"Введение"}$h1129$::jsonb,
       'vvedenie'
FROM articles a WHERE a.slug = 'top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 2, 'paragraph',
       $b1130${"text":"Выбор калькулятора майнинга – это не только вопрос поиска удобного инструмента, но и возможность зарабатывать на добыче криптовалют больше. Дело в том, что функционал, казалось бы, одинаковых по своему назначению инструментов может серьезно отличаться друг от друга. В этой статье мы познакомимся с возможностями самых популярных mining-калькуляторов, а также выявим их преимущества и недостатки. Whattomine, Minerstat, Coinwarz, Cryptobot, Cryptocompare, Nicehash, BTC.com, Asicminervalue, 2cryptocalc, Mining Calculator – наш список инструментов для анализа.","html":"Выбор калькулятора майнинга – это не только вопрос поиска удобного инструмента, но и возможность зарабатывать на добыче криптовалют больше. Дело в том, что функционал, казалось бы, одинаковых по своему назначению инструментов может серьезно отличаться друг от друга. В этой статье мы познакомимся с возможностями самых популярных mining-калькуляторов, а также выявим их преимущества и недостатки. Whattomine, Minerstat, Coinwarz, Cryptobot, Cryptocompare, Nicehash, BTC.com, Asicminervalue, 2cryptocalc, Mining Calculator – наш список инструментов для анализа."}$b1130$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 3, 'image',
       $b1131${"src":"/images/articles/mining-calculators/calculator-bitcoin.png","alt":"Калькулятор и Bitcoin"}$b1131$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 4, 'heading',
       $h1132${"level":2,"text":"Что такое калькулятор майнинга и для чего он необходим?"}$h1132$::jsonb,
       'chto-takoe'
FROM articles a WHERE a.slug = 'top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 5, 'paragraph',
       $b1133${"text":"Калькулятор майнинга – это онлайн-сервис или приложение, которое позволяет рассчитать потенциальную доходность майнинга криптовалют с учетом множества факторов: хешрейта, потребления энергии, текущей сложности сети, курса монет и тарифов на электричество.","html":"Калькулятор майнинга – это онлайн-сервис или приложение, которое позволяет рассчитать потенциальную доходность майнинга криптовалют с учетом множества факторов: хешрейта, потребления энергии, текущей сложности сети, курса монет и тарифов на электричество."}$b1133$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 6, 'paragraph',
       $b1134${"text":"Говоря проще, это ваш персональный финансовый аналитик в мире крипто-добычи.","html":"Говоря проще, это ваш персональный финансовый аналитик в мире крипто-добычи."}$b1134$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 7, 'paragraph',
       $b1135${"text":"Цель калькулятора проста – оценка экономической целесообразности. Он позволяет понять:","html":"Цель калькулятора проста – оценка экономической целесообразности. Он позволяет понять:"}$b1135$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 8, 'list',
       $b1136${"ordered":false,"items":["Стоит ли запускать тот или иной майнер;","Какая криптовалюта сейчас выгоднее для добычи;","Сколько денег уйдет на электроэнергию;","Когда окупятся вложения в оборудование."]}$b1136$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 9, 'paragraph',
       $b1137${"text":"Также калькулятор помогает избежать типичных ошибок: переоценки доходности, выбора неактуального алгоритма или игнорирования стоимости энергии.","html":"Также калькулятор помогает избежать типичных ошибок: переоценки доходности, выбора неактуального алгоритма или игнорирования стоимости энергии."}$b1137$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 10, 'heading',
       $h1138${"level":2,"text":"Как пользоваться калькулятором майнинга?"}$h1138$::jsonb,
       'kak-polzovatsya'
FROM articles a WHERE a.slug = 'top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 11, 'paragraph',
       $b1139${"text":"Большинство калькуляторов имеют простую форму с несколькими полями. Типичный алгоритм работы:","html":"Большинство калькуляторов имеют простую форму с несколькими полями. Типичный алгоритм работы:"}$b1139$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 12, 'list',
       $b1140${"ordered":false,"items":["Выбор монеты или алгоритма – например, Bitcoin (SHA-256), Ethereum Classic (Etchash), Kaspa (kHeavyHash);","Ввод хешрейта – указывается мощность оборудования;","Ввод энергопотребления – в ваттах (W), обычно берется из технических характеристик устройства;","Указание стоимости электроэнергии – в рублях или долларах за кВт⋅ч."]}$b1140$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 13, 'paragraph',
       $b1141${"text":"Дополнительные параметры – комиссия пула, цена монеты, сложность сети (часто подставляется автоматически).","html":"Дополнительные параметры – комиссия пула, цена монеты, сложность сети (часто подставляется автоматически)."}$b1141$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 14, 'paragraph',
       $b1142${"text":"После нажатия кнопки расчета калькулятор предложит следующую информацию:","html":"После нажатия кнопки расчета калькулятор предложит следующую информацию:"}$b1142$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 15, 'list',
       $b1143${"ordered":false,"items":["Ежедневный/ежемесячный доход;","Стоимость электроэнергии;","Чистая прибыль;","Окупаемость в днях или месяцах."]}$b1143$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 16, 'image',
       $b1144${"src":"/images/articles/mining-calculators/mining-calculator-ru.png","alt":"Форма калькулятора майнинга"}$b1144$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 17, 'heading',
       $h1145${"level":2,"text":"Какие сценарии использования калькуляторов доходности существуют?"}$h1145$::jsonb,
       'scenarii'
FROM articles a WHERE a.slug = 'top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 18, 'paragraph',
       $b1146${"text":"Калькуляторы применяются в самых разных ситуациях:","html":"Калькуляторы применяются в самых разных ситуациях:"}$b1146$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 19, 'list',
       $b1147${"ordered":false,"items":["Перед покупкой оборудования – оценка доходности модели;","Сравнение алгоритмов/монет – выбор самой выгодной монеты на текущий момент;","Планирование расширения фермы – расчет общей мощности и энергозатрат;","Учет сезонных тарифов на электричество – особенно актуально при домашнем майнинге;","Анализ «что если» – например, «что будет, если курс монеты упадёт на 20%»."]}$b1147$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 20, 'heading',
       $h1148${"level":2,"text":"Какие задачи решают калькуляторы майнинга?"}$h1148$::jsonb,
       'zadachi'
FROM articles a WHERE a.slug = 'top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 21, 'rich_list',
       $b1149${"ordered":false,"items":[{"title":"Финансовый расчет","text":"Помогает не вслепую тратить деньги, а принимать решения на основе данных;"},{"title":"Оптимизация оборудования","text":"Понять, какое оборудование работает эффективнее на определенных монетах;"},{"title":"Оценка рисков","text":"Учитывая динамику сложности и колебания цен, можно подготовиться к падению доходности;"},{"title":"Стратегическое планирование","text":"Для того, чтобы выстроить долгосрочную стратегию майнинга."}]}$b1149$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 22, 'heading',
       $h1150${"level":2,"text":"Какие отличия между калькуляторами существуют?"}$h1150$::jsonb,
       'otlichiya'
FROM articles a WHERE a.slug = 'top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 23, 'paragraph',
       $b1151${"text":"Есть множество калькуляторов, и у каждого – свои особенности. Вот основные различия:","html":"Есть множество калькуляторов, и у каждого – свои особенности. Вот основные различия:"}$b1151$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 24, 'list',
       $b1152${"ordered":false,"items":["По поддерживаемым монетам – одни калькуляторы универсальные (например, WhatToMine), другие рассчитаны под конкретные монеты;","По точности данных – более продвинутые сервисы регулярно обновляют курсы, сложность сети и блок-реворды;","По интерфейсу – от минималистичных таблиц до детальных панелей с графиками и прогнозами;","По возможности учета комиссии, пула и затрат на охлаждение."]}$b1152$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 25, 'heading',
       $h1153${"level":2,"text":"10 место: калькулятор майнинга Mining Calculator"}$h1153$::jsonb,
       'mining-calculator'
FROM articles a WHERE a.slug = 'top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 26, 'paragraph',
       $b1154${"text":"Сервис российских разработчиков, который будет доступен вне зависимости от блокировок и санкций – этого нельзя сказать про остальные калькуляторы, которые принадлежат западным компаниям. Для работы не требуется VPN, а простота эксплуатации приятно удивляет.","html":"Сервис российских разработчиков, который будет доступен вне зависимости от блокировок и санкций – этого нельзя сказать про остальные калькуляторы, которые принадлежат западным компаниям. Для работы не требуется VPN, а простота эксплуатации приятно удивляет."}$b1154$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 27, 'paragraph',
       $b1155${"text":"Разработчикам Mining Calculator удалось объединить простоту и богатый набор характеристик как для ввода, так и вывода.","html":"Разработчикам Mining Calculator удалось объединить простоту и богатый набор характеристик как для ввода, так и вывода."}$b1155$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 28, 'paragraph',
       $b1156${"text":"На сегодняшний день калькулятор майнинга Mining Calculator обладает одним из наиболее впечатляющих функционалов среди конкурентов.","html":"На сегодняшний день калькулятор майнинга Mining Calculator обладает одним из наиболее впечатляющих функционалов среди конкурентов."}$b1156$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 29, 'paragraph',
       $b1157${"text":"И не может не радовать тот факт, что это российская разработка, которая учла весь опыт использования западных аналогов.","html":"И не может не радовать тот факт, что это российская разработка, которая учла весь опыт использования западных аналогов."}$b1157$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 30, 'image',
       $b1158${"src":"/images/articles/mining-calculators/mining-calculator-result.png","alt":"Mining Calculator"}$b1158$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 31, 'pros_cons',
       $b1159${"pros":["Базовые и расширенные параметры – это не только монета/алгоритм, модель асика, стоимость электричества, но и комиссия пула, награда за блок, хэшрейт сети, электропотребление оборудования и даже увеличение сложности;","Возможность расчета по текущему курсу BTC, а также работа с прогнозируемыми значениями (включая курс рубля к доллару);","Вывод результата в различных валютах за разные периоды времени;","Простой и интуитивно понятный интерфейс."],"cons":["Отсутствие расчета по популярным пулам (эта функция есть лишь в некоторых калькуляторах, а точность расчета подвергается сомнениям)."]}$b1159$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 32, 'heading',
       $h1160${"level":2,"text":"9 место: калькулятор майнинга 2cryptocalc"}$h1160$::jsonb,
       '2cryptocalc'
FROM articles a WHERE a.slug = 'top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 33, 'paragraph',
       $b1161${"text":"Интерфейсы калькулятора 2cryptocalc несколько напоминают визуал Whattomine. Возможно, разработчики руководствовались логикой создателей самого известного сервиса, однако рассматривать оба продукта следует по отдельности.","html":"Интерфейсы калькулятора 2cryptocalc несколько напоминают визуал Whattomine. Возможно, разработчики руководствовались логикой создателей самого известного сервиса, однако рассматривать оба продукта следует по отдельности."}$b1161$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 34, 'paragraph',
       $b1162${"text":"Сервис для майнинга 2cryptocalc работает с ограниченным количеством монет, зато автоматизация процессов явно на высоте.","html":"Сервис для майнинга 2cryptocalc работает с ограниченным количеством монет, зато автоматизация процессов явно на высоте."}$b1162$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 35, 'paragraph',
       $b1163${"text":"Кроме того, пользователям доступны сразу два режима работы: выбор модели оборудования (характеристики выводятся автоматически) или ввод хэшрейта вручную. Майнер самостоятельно выбирает способ применения в зависимости от личных предпочтений – это важная опция, которая есть далеко не во всех калькуляторах. 2cryptocalc является приятным исключением.","html":"Кроме того, пользователям доступны сразу два режима работы: выбор модели оборудования (характеристики выводятся автоматически) или ввод хэшрейта вручную. Майнер самостоятельно выбирает способ применения в зависимости от личных предпочтений – это важная опция, которая есть далеко не во всех калькуляторах. 2cryptocalc является приятным исключением."}$b1163$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 36, 'paragraph',
       $b1164${"text":"Сервис 2cryptocalc можно назвать удачным решением для большинства майнеров. Однако если вы планируете работать с расширенной статистикой, следует обратить внимание на альтернативы.","html":"Сервис 2cryptocalc можно назвать удачным решением для большинства майнеров. Однако если вы планируете работать с расширенной статистикой, следует обратить внимание на альтернативы."}$b1164$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 37, 'image',
       $b1165${"src":"/images/articles/mining-calculators/profit-coins.png","alt":"2cryptocalc — сравнение монет"}$b1165$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 38, 'pros_cons',
       $b1166${"pros":["Автоматизация процесса за счет наличия двух интерфейсных режимов;","Небольшой набор монет, что упрощает поиск необходимой (из перечня наиболее популярных);","Библиотека с указанием наиболее доходных асиков и карт."],"cons":["Ограниченный набор монет;","Меньше расширенной статистики по сравнению с лидерами рейтинга."]}$b1166$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 39, 'heading',
       $h1167${"level":2,"text":"8 место: калькулятор майнинга Asicminervalue"}$h1167$::jsonb,
       'asicminervalue'
FROM articles a WHERE a.slug = 'top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 40, 'paragraph',
       $b1168${"text":"Разработкой с хорошими возможностями при минимальном наборе недостатков является калькулятор Asicminervalue. Прежде всего, он прост и понятен даже новичку ввиду простого интерфейса, не перегруженного функционалом и отвлекающими элементами. А еще здесь есть два режима работы – это «Доходность» и «Эффективность», что позволяет рассмотреть подход к майнингу с двух разных сторон. Первая – список асиков, приносящих максимальный доход (когда стоимость электроэнергии минимальна). Вторая – выбор вариантов с возможностью не переплачивать за «розетку». Это отличительная черта сервиса Asicminervalue, которая выделяет инструмент на фоне конкурентов.","html":"Разработкой с хорошими возможностями при минимальном наборе недостатков является калькулятор Asicminervalue. Прежде всего, он прост и понятен даже новичку ввиду простого интерфейса, не перегруженного функционалом и отвлекающими элементами. А еще здесь есть два режима работы – это «Доходность» и «Эффективность», что позволяет рассмотреть подход к майнингу с двух разных сторон. Первая – список асиков, приносящих максимальный доход (когда стоимость электроэнергии минимальна). Вторая – выбор вариантов с возможностью не переплачивать за «розетку». Это отличительная черта сервиса Asicminervalue, которая выделяет инструмент на фоне конкурентов."}$b1168$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 41, 'paragraph',
       $b1169${"text":"Можно сделать вывод, что калькулятор Asicminervalue – несколько необычный инструмент майнера. Вряд ли следует использовать сервис в качестве основного: скорее всего, это отличное дополнение к одному из любых других сайтов, которые мы рассмотрели выше.","html":"Можно сделать вывод, что калькулятор Asicminervalue – несколько необычный инструмент майнера. Вряд ли следует использовать сервис в качестве основного: скорее всего, это отличное дополнение к одному из любых других сайтов, которые мы рассмотрели выше."}$b1169$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 42, 'image',
       $b1170${"src":"/images/articles/mining-calculators/asicminervalue.png","alt":"Asicminervalue"}$b1170$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 43, 'pros_cons',
       $b1171${"pros":["Простой интерфейс – ничего лишнего, только информационная таблица со списком асиков;","Два наглядных режима, что особенно полезно для осуществления грамотного выбора асика;","В списках представлены самые популярные модели майнеров на текущий момент;","Возможность подойти к расчету майнинга не только с точки зрения выручки, но и со стороны энергоэффективности;","Представлена информация об уровне шума оборудования – приятный бонус."],"cons":["Небольшое число вводных данных;","Отсутствие списка монет: расчет производится только с точки зрения алгоритма."]}$b1171$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 44, 'heading',
       $h1172${"level":2,"text":"7 место: калькулятор майнинга BTC.com"}$h1172$::jsonb,
       'btc-com'
FROM articles a WHERE a.slug = 'top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 45, 'paragraph',
       $b1173${"text":"Еще один пул, который обладает собственным калькулятором – достаточно известный многим BTC.com. Назвать эту разработку масштабной сложно, так как функционал инструмента ограничен лишь несколькими монетами и простейшими функциями. Тем не менее, для ощутимой доли майнеров этого будет вполне достаточно.","html":"Еще один пул, который обладает собственным калькулятором – достаточно известный многим BTC.com. Назвать эту разработку масштабной сложно, так как функционал инструмента ограничен лишь несколькими монетами и простейшими функциями. Тем не менее, для ощутимой доли майнеров этого будет вполне достаточно."}$b1173$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 46, 'paragraph',
       $b1174${"text":"Калькулятор BTC.com – это своего рода баланс между простотой и доступностью. Продвинутым майнерам возможностей окажется явно недостаточно, но владельцам небольших ферм – вполне.","html":"Калькулятор BTC.com – это своего рода баланс между простотой и доступностью. Продвинутым майнерам возможностей окажется явно недостаточно, но владельцам небольших ферм – вполне."}$b1174$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 47, 'paragraph',
       $b1175${"text":"В целом, сервис BTC.com достаточно простой, однако в некоторых случаях имеющегося функционала будет явно недостаточно.","html":"В целом, сервис BTC.com достаточно простой, однако в некоторых случаях имеющегося функционала будет явно недостаточно."}$b1175$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 48, 'image',
       $b1176${"src":"/images/articles/mining-calculators/btc-calculator.png","alt":"BTC.com Mining Calculator"}$b1176$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 49, 'pros_cons',
       $b1177${"pros":["Простота использования во многом благодаря простому интерфейсу и оптимизации для мобильных устройств;","Детальная статистика по майнингу, что открывает неплохие возможности для аналитики."],"cons":["Ограниченное количество моделей оборудования в библиотеке, что усложняет расчет доходности ряда устройств;","Работа только с 7 монетами, что также сковывает работу майнера с данным калькулятором;","Среди вводимых настроек – только стоимость электричества."]}$b1177$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 50, 'heading',
       $h1178${"level":2,"text":"6 место: калькулятор майнинга Nicehash"}$h1178$::jsonb,
       'nicehash'
FROM articles a WHERE a.slug = 'top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 51, 'paragraph',
       $b1179${"text":"Сервис Nicehash (он же одноименный пул майнинга Найсхеш) – еще один достаточно простой в освоении продукт, обладающий базовым набором опций. Интерфейс интуитивно понятный, однако в погоне за простотой создатели упустили ряд важных деталей.","html":"Сервис Nicehash (он же одноименный пул майнинга Найсхеш) – еще один достаточно простой в освоении продукт, обладающий базовым набором опций. Интерфейс интуитивно понятный, однако в погоне за простотой создатели упустили ряд важных деталей."}$b1179$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 52, 'paragraph',
       $b1180${"text":"Важнейшим недостатком является отсутствие выбора монеты для майнинга – пользователь Nicehash может указать лишь оборудование и/или алгоритм добычи.","html":"Важнейшим недостатком является отсутствие выбора монеты для майнинга – пользователь Nicehash может указать лишь оборудование и/или алгоритм добычи."}$b1180$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 53, 'paragraph',
       $b1181${"text":"В целом, сервис Nicehash похож на многие конкурирующие разработки: он не обладает яркими особенностями и сильными козырями. Если, конечно, не брать в расчет автоматическое определение конфигурации, что на практике требуется достаточно редко.","html":"В целом, сервис Nicehash похож на многие конкурирующие разработки: он не обладает яркими особенностями и сильными козырями. Если, конечно, не брать в расчет автоматическое определение конфигурации, что на практике требуется достаточно редко."}$b1181$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 54, 'pros_cons',
       $b1182${"pros":["Простой и понятный интерфейс, удобный в освоении;","Расчет доходности майнинга на трех основных типах устройств – асики, видеокарты и CPU;","Функция автоматического определения майнинговой конфигурации – это выгодно отличает Найсхеш от большинства конкурентов;","Достойный объем предоставляемой информации – доходность в национальных валютах, средние значения за день и исторические метрики."],"cons":["Нельзя рассчитать доходность по определенной монете;","Ограниченный функционал из-за скромного числа базовых настроек."]}$b1182$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 55, 'heading',
       $h1183${"level":2,"text":"5 место: калькулятор майнинга Cryptocompare"}$h1183$::jsonb,
       'cryptocompare'
FROM articles a WHERE a.slug = 'top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 56, 'paragraph',
       $b1184${"text":"Простой инструмент с базовым функционалом, который больше подойдет новичкам или владельцам небольших ферм (либо единичных экземпляров оборудования для майнинга).","html":"Простой инструмент с базовым функционалом, который больше подойдет новичкам или владельцам небольших ферм (либо единичных экземпляров оборудования для майнинга)."}$b1184$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 57, 'paragraph',
       $b1185${"text":"Сервис Cryptocompare предлагает расчет доходности лишь шести наиболее популярных монет, но именно поэтому его и выбирают те, для кого более внушительный функционал не требуется.","html":"Сервис Cryptocompare предлагает расчет доходности лишь шести наиболее популярных монет, но именно поэтому его и выбирают те, для кого более внушительный функционал не требуется."}$b1185$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 58, 'paragraph',
       $b1186${"text":"Простота – главная отличительная особенность калькулятора Cryptocompare. Если же вы ищете мощный инструмент с широкими возможностями, придется искать что-то другое.","html":"Простота – главная отличительная особенность калькулятора Cryptocompare. Если же вы ищете мощный инструмент с широкими возможностями, придется искать что-то другое."}$b1186$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 59, 'paragraph',
       $b1187${"text":"Cryptocompare – это, пожалуй, самый противоречивый сервис по расчету доходности. Исходить следует из имеющихся задач и опыта майнера: если вы только знакомитесь с миром BTC, продукт покажется интересным. В других ситуациях функционала данного калькулятора будет явно недостаточно.","html":"Cryptocompare – это, пожалуй, самый противоречивый сервис по расчету доходности. Исходить следует из имеющихся задач и опыта майнера: если вы только знакомитесь с миром BTC, продукт покажется интересным. В других ситуациях функционала данного калькулятора будет явно недостаточно."}$b1187$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 60, 'image',
       $b1188${"src":"/images/articles/mining-calculators/cryptocompare.png","alt":"Cryptocompare"}$b1188$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 61, 'pros_cons',
       $b1189${"pros":["Быстрый расчет благодаря минимальному набору настроек и опций;","Легкий и понятный интерфейс ввиду простоты сервиса."],"cons":["Нет библиотеки асиков: вводить хэшрейт оборудования придется вручную;","Ограниченный набор монет: BTC, ETC, XMR, ZEC, LTC, DASH. Отсутствует расчет доходности ETH;","Скромный набор настроек и опций, что сковывает действия пользователя."]}$b1189$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 62, 'heading',
       $h1190${"level":2,"text":"4 место: калькулятор майнинга, бот Cryptobot"}$h1190$::jsonb,
       'cryptobot'
FROM articles a WHERE a.slug = 'top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 63, 'paragraph',
       $b1191${"text":"Телеграм-бот Cryptobot – это набор сервисов широкого профиля, который часто реализуется на платформе известнейшего мессенджера. Может объединять функционал калькулятора, кошелька, биржи и других инструментов по работе с майнингом и криптовалютами в целом.","html":"Телеграм-бот Cryptobot – это набор сервисов широкого профиля, который часто реализуется на платформе известнейшего мессенджера. Может объединять функционал калькулятора, кошелька, биржи и других инструментов по работе с майнингом и криптовалютами в целом."}$b1191$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 64, 'paragraph',
       $b1192${"text":"Главное, что следует понимать: криптоботы на неспециализированных платформах – это далеко не самый надежный способ работы с BTC.","html":"Главное, что следует понимать: криптоботы на неспециализированных платформах – это далеко не самый надежный способ работы с BTC."}$b1192$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 65, 'paragraph',
       $b1193${"text":"Cryptobot безопасно использовать для произведения расчетов, но покупать, продавать и тем более хранить криптоактивы здесь крайне не рекомендуется. Нет никаких гарантий надежности и безопасности: каналы в Телеграме создаются десятками (или даже сотнями), и с такой же интенсивностью прекращают свою работу.","html":"Cryptobot безопасно использовать для произведения расчетов, но покупать, продавать и тем более хранить криптоактивы здесь крайне не рекомендуется. Нет никаких гарантий надежности и безопасности: каналы в Телеграме создаются десятками (или даже сотнями), и с такой же интенсивностью прекращают свою работу."}$b1193$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 66, 'paragraph',
       $b1194${"text":"Использовать криптоботы для расчета прибыли и доходности вполне разумно (но с осознанием возможной неактуальности данных). Однако применять расширенный функционал Cryptobot – это неоправданные риски, которые могут вполне привести к потере ваших активов.","html":"Использовать криптоботы для расчета прибыли и доходности вполне разумно (но с осознанием возможной неактуальности данных). Однако применять расширенный функционал Cryptobot – это неоправданные риски, которые могут вполне привести к потере ваших активов."}$b1194$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 67, 'pros_cons',
       $b1195${"pros":["Реализация на популярной платформе, которой удобно пользоваться: Telegram-бот всегда под рукой на вашем ПК или мобильном телефоне;","Быстрый запуск и оперативный расчет: как правило, bot хранит выбранные вами настройки – модель асика и стоимость электроэнергии."],"cons":["Отсутствие гарантий достоверности данных: расчет может производиться по некорректному курсу BTC;","Если Cryptobot предлагает смежные функции (например, покупку BTC, продажу монет, обмен и хранение) – это повод задуматься о безопасности ваших активов;","Ограниченный набор монет для расчета: как правило, это BTC, ETH и еще несколько вариантов."]}$b1195$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 68, 'heading',
       $h1196${"level":2,"text":"3 место: калькулятор майнинга Coinwarz"}$h1196$::jsonb,
       'coinwarz'
FROM articles a WHERE a.slug = 'top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 69, 'paragraph',
       $b1197${"text":"Следующим в нашем списке значится менее известный в мире crypto продукт – Coinwarz. Главная отличительная особенность этого сервиса – рекордный для продуктов такого рода набор монет: их насчитывается более двух сотен. Если вы планируете получать расчет майнинга на не самых популярных вариантах крипты, Coinwarz окажется как никогда кстати.","html":"Следующим в нашем списке значится менее известный в мире crypto продукт – Coinwarz. Главная отличительная особенность этого сервиса – рекордный для продуктов такого рода набор монет: их насчитывается более двух сотен. Если вы планируете получать расчет майнинга на не самых популярных вариантах крипты, Coinwarz окажется как никогда кстати."}$b1197$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 70, 'paragraph',
       $b1198${"text":"Вполне вероятно, что та или иная монета для майнинга есть только в этом калькуляторе, что выгодно отличает его от конкурентов.","html":"Вполне вероятно, что та или иная монета для майнинга есть только в этом калькуляторе, что выгодно отличает его от конкурентов."}$b1198$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 71, 'paragraph',
       $b1199${"text":"Существенный недостаток у калькулятора майнинга Coinwarz только один – отсутствие библиотеки оборудования. То есть быстро рассчитать доходность добычи BTC для того или иного асика не получится: хэшрейт потребуется вводить вручную. Однако некоторые не сочтут это недостатком Coinwarz. Ведь подобный факт открывает возможность экспериментировать с любыми значениями, а не довольствоваться предустановленными вариантами.","html":"Существенный недостаток у калькулятора майнинга Coinwarz только один – отсутствие библиотеки оборудования. То есть быстро рассчитать доходность добычи BTC для того или иного асика не получится: хэшрейт потребуется вводить вручную. Однако некоторые не сочтут это недостатком Coinwarz. Ведь подобный факт открывает возможность экспериментировать с любыми значениями, а не довольствоваться предустановленными вариантами."}$b1199$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 72, 'pros_cons',
       $b1200${"pros":["Более 200 монет для майнинга на ASIC и видеокартах;","Наличие графиков сложности и хэшрейта сети, что предоставляет расширенные возможности для сравнения, аналитики и составления прогнозов;","Простой и понятный интерфейс, адаптированный в том числе и для мобильных устройств."],"cons":["Отсутствие библиотеки оборудования: хэшрейт придется вводить вручную."]}$b1200$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 73, 'heading',
       $h1201${"level":2,"text":"2 место: калькулятор майнинга Minerstat"}$h1201$::jsonb,
       'minerstat'
FROM articles a WHERE a.slug = 'top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 74, 'paragraph',
       $b1202${"text":"Еще один известный инструмент в кругу опытных майнеров: калькулятор Minerstat с достойным функционалом и дружелюбным интерфейсом. Алгоритм работы достаточно простой, а сайт неплохо адаптирован для работы на мобильных устройствах.","html":"Еще один известный инструмент в кругу опытных майнеров: калькулятор Minerstat с достойным функционалом и дружелюбным интерфейсом. Алгоритм работы достаточно простой, а сайт неплохо адаптирован для работы на мобильных устройствах."}$b1202$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 75, 'paragraph',
       $b1203${"text":"Этот сайт подходит для расчета майнинга как на асиках, так и с использованием видеокарт: функциональные возможности учитывают оба типа алгоритмов.","html":"Этот сайт подходит для расчета майнинга как на асиках, так и с использованием видеокарт: функциональные возможности учитывают оба типа алгоритмов."}$b1203$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 76, 'paragraph',
       $b1204${"text":"Калькулятор Minerstat нашел свою аудиторию не только среди западных владельцев ферм, но и у российских майнеров, что также добавляет определенный вес в копилку преимуществ.","html":"Калькулятор Minerstat нашел свою аудиторию не только среди западных владельцев ферм, но и у российских майнеров, что также добавляет определенный вес в копилку преимуществ."}$b1204$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 77, 'image',
       $b1205${"src":"/images/articles/mining-calculators/minerstat.png","alt":"Minerstat"}$b1205$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 78, 'pros_cons',
       $b1206${"pros":["Сервис позволяет выбирать более чем из 120 монет, чем способны похвастаться далеко не все калькуляторы;","Minerstat предоставляет возможность работы с кастомными устройствами (помимо майнинга на асиках и GPU). Реализуется это посредством указания хэшрейта устройства;","Функционал конструирования сборок. Правда, для этого придется зарегистрироваться на Minerstat – функция доступна только авторизованным пользователям;","Удобный интерфейс Minerstat как на ПК, так и мобильных устройствах."],"cons":["Скромный набор настроек, что несколько ограничивает данные и возможности пользователя."]}$b1206$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 79, 'heading',
       $h1207${"level":2,"text":"1 место: калькулятор майнинга Whattomine"}$h1207$::jsonb,
       'whattomine'
FROM articles a WHERE a.slug = 'top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 80, 'paragraph',
       $b1208${"text":"Один из наиболее старых и, пожалуй, известных сервисов, позволяющий майнеру выбрать оборудование и узнать доходность. Whattomine (известный также как Ваттумайн) отличается богатым функционалом для майнинга криптовалюты как на асиках, так и видеокартах. Находит отклик у криптоэнтузиастов во время выбора аппаратуры и уже на этапе добычи с целью оптимизации процесса.","html":"Один из наиболее старых и, пожалуй, известных сервисов, позволяющий майнеру выбрать оборудование и узнать доходность. Whattomine (известный также как Ваттумайн) отличается богатым функционалом для майнинга криптовалюты как на асиках, так и видеокартах. Находит отклик у криптоэнтузиастов во время выбора аппаратуры и уже на этапе добычи с целью оптимизации процесса."}$b1208$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 81, 'paragraph',
       $b1209${"text":"В целом, сайт Whattomine является ориентиром для тех, кто ищет мощного помощника в мире Bitcoin и его майнинга. Но полностью удобным сервис назвать сложно, даже несмотря на наличие дополнительных инструментов, например, перечень наиболее выгодных и мощных асиков на текущий момент.","html":"В целом, сайт Whattomine является ориентиром для тех, кто ищет мощного помощника в мире Bitcoin и его майнинга. Но полностью удобным сервис назвать сложно, даже несмотря на наличие дополнительных инструментов, например, перечень наиболее выгодных и мощных асиков на текущий момент."}$b1209$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 82, 'image',
       $b1210${"src":"/images/articles/mining-calculators/whattomine.png","alt":"WhatToMine"}$b1210$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 83, 'pros_cons',
       $b1211${"pros":["Детализированная настройка вводных данных;","Работа более чем с 130 монетами, начиная от классического BTC и заканчивая весьма экзотическими вариантами;","Впечатляющая библиотека карт и асиков для предварительного выбора;","Функционал для расчета параллельного (дуал) майнинга. Например, добыча ETC + Kaspa, ETHW + ALPH, Ergo + Radiant на видеокартах или LTC+DOGE на асиках."],"cons":["Сложный и перегруженный интерфейс, что не подходит для пользователей с небольшим количеством оборудования для майнинга. Whattomine можно считать удобным для владельца крупных ферм;","Неудобство использования на мобильных устройствах – проблема, вытекающая из первого недостатка;","Расчет майнинга исключительно на асиках и видеокартах."]}$b1211$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 84, 'heading',
       $h1212${"level":2,"text":"Выводы"}$h1212$::jsonb,
       'vyvody'
FROM articles a WHERE a.slug = 'top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 85, 'paragraph',
       $b1213${"text":"Калькуляторы майнинга – это не просто удобный инструмент, а важнейший элемент грамотного подхода к криптодобыче. Они позволяют просчитывать доходность, избегать убыточных решений, сравнивать варианты и адаптироваться к изменяющимся условиям рынка.","html":"Калькуляторы майнинга – это не просто удобный инструмент, а важнейший элемент грамотного подхода к криптодобыче. Они позволяют просчитывать доходность, избегать убыточных решений, сравнивать варианты и адаптироваться к изменяющимся условиям рынка."}$b1213$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 86, 'paragraph',
       $b1214${"text":"Используйте калькуляторы до покупки оборудования, а не после. Считайте, сравнивайте и принимайте решения с цифрами на руках – это и есть путь к устойчивому и прибыльному майнингу.","html":"Используйте калькуляторы до покупки оборудования, а не после. Считайте, сравнивайте и принимайте решения с цифрами на руках – это и есть путь к устойчивому и прибыльному майнингу."}$b1214$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki';

-- Blocks: luchshie-kriptobirzhi-top-10
INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 1, 'heading',
       $h1215${"level":2,"text":"Введение"}$h1215$::jsonb,
       'vvedenie'
FROM articles a WHERE a.slug = 'luchshie-kriptobirzhi-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 2, 'paragraph',
       $b1216${"text":"Рынок криптовалют растет и развивается, несмотря на волатильность и регуляторные вызовы. В центре этого цифрового пространства находятся криптовалютные биржи – платформы, через которые проходят миллиарды долларов ежедневно. Это именно то место, где крипта «становится живой»: здесь ее покупают, продают, обменивают и хранят.","html":"Рынок криптовалют растет и развивается, несмотря на волатильность и регуляторные вызовы. В центре этого цифрового пространства находятся криптовалютные биржи – платформы, через которые проходят миллиарды долларов ежедневно. Это именно то место, где крипта «становится живой»: здесь ее покупают, продают, обменивают и хранят."}$b1216$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kriptobirzhi-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 3, 'paragraph',
       $b1217${"text":"Разберемся, что такое криптобиржи, зачем они нужны, как выбрать подходящую, какие подводные камни могут поджидать пользователя (особенно в странах СНГ), а также познакомимся с ТОП-10 лучших криптовалютных бирж мира.","html":"Разберемся, что такое криптобиржи, зачем они нужны, как выбрать подходящую, какие подводные камни могут поджидать пользователя (особенно в странах СНГ), а также познакомимся с ТОП-10 лучших криптовалютных бирж мира."}$b1217$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kriptobirzhi-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 4, 'image',
       $b1218${"src":"/images/articles/crypto-exchanges/chart.png","alt":"График криптовалютного рынка"}$b1218$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kriptobirzhi-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 5, 'heading',
       $h1219${"level":2,"text":"Что такое криптовалютная биржа и зачем она нужна?"}$h1219$::jsonb,
       'chto-takoe'
FROM articles a WHERE a.slug = 'luchshie-kriptobirzhi-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 6, 'paragraph',
       $b1220${"text":"Криптовалютная биржа – это онлайн-платформа для торговли цифровыми активами: биткоином, эфиром, стейблкоинами и тысячами других токенов.","html":"Криптовалютная биржа – это онлайн-платформа для торговли цифровыми активами: биткоином, эфиром, стейблкоинами и тысячами других токенов."}$b1220$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kriptobirzhi-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 7, 'paragraph',
       $b1221${"text":"Основные функции биржи:","html":"Основные функции биржи:"}$b1221$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kriptobirzhi-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 8, 'list',
       $b1222${"ordered":false,"items":["Обмен одной криптовалюты на другую (например, BTC на ETH);","Покупка крипты за фиатные деньги (рубли, доллары, тенге и т.д.);","Вывод средств в фиат;","Хранение активов (кастодиально или некастодиально);","Дополнительные сервисы: стейкинг, P2P, фьючерсы, маржинальная торговля."]}$b1222$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kriptobirzhi-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 9, 'paragraph',
       $b1223${"text":"Проще говоря, криптобиржа – это «банк», «обменник» и «инвестиционная платформа» в одном лице.","html":"Проще говоря, криптобиржа – это «банк», «обменник» и «инвестиционная платформа» в одном лице."}$b1223$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kriptobirzhi-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 10, 'heading',
       $h1224${"level":2,"text":"Как выбрать криптовалютную биржу?"}$h1224$::jsonb,
       'kak-vybrat'
FROM articles a WHERE a.slug = 'luchshie-kriptobirzhi-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 11, 'paragraph',
       $b1225${"text":"Перед регистрацией важно понять, что именно вы планируете делать: покупать крипту и держать ее в долгосрок, обменивать и торговать ежедневно, пользоваться стейблкоинами как способом сохранения капитала?","html":"Перед регистрацией важно понять, что именно вы планируете делать: покупать крипту и держать ее в долгосрок, обменивать и торговать ежедневно, пользоваться стейблкоинами как способом сохранения капитала?"}$b1225$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kriptobirzhi-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 12, 'paragraph',
       $b1226${"text":"Исходя из этого можно сформировать основные критерии выбора:","html":"Исходя из этого можно сформировать основные критерии выбора:"}$b1226$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kriptobirzhi-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 13, 'rich_list',
       $b1227${"ordered":false,"items":[{"title":"Репутация и надежность","text":"Изучите отзывы, срок существования платформы, объемы торгов. Биржи вроде Binance, Bybit, OKX, Kraken, KuCoin заслужили доверие за годы работы;"},{"title":"Наличие нужных валютных пар","text":"Проверьте, можно ли купить интересующую вас монету напрямую за фиат или USDT;"},{"title":"Удобство ввода и вывода средств","text":"Важно для пользователей СНГ: есть ли поддержка банковских карт, P2P-платформ, переводов в локальной валюте;"},{"title":"Комиссии","text":"Обратите внимание на комиссии за трейдинг, ввод/вывод и скрытые сборы. Часто P2P выглядит без комиссии, но реальный курс уже «заложен»;"},{"title":"Интерфейс и поддержка","text":"Платформа должна быть удобной, а поддержка – быстрой. Желательно наличие русскоязычного интерфейса и службы поддержки;"},{"title":"Безопасность","text":"Двухфакторная аутентификация, история входов, «холодные» кошельки и защита аккаунта – обязательны для серьезной биржи."}]}$b1227$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kriptobirzhi-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 14, 'heading',
       $h1228${"level":2,"text":"Тонкости и нюансы работы с биржами для пользователей из СНГ"}$h1228$::jsonb,
       'nyuansy-sng'
FROM articles a WHERE a.slug = 'luchshie-kriptobirzhi-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 15, 'paragraph',
       $b1229${"text":"Для жителей СНГ существует ряд особенностей при работе с криптовалютными биржами:","html":"Для жителей СНГ существует ряд особенностей при работе с криптовалютными биржами:"}$b1229$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kriptobirzhi-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 16, 'rich_list',
       $b1230${"ordered":false,"items":[{"title":"Ограничения и блокировки","text":"Некоторые биржи (например, Kraken и Coinbase) ограничили или закрыли регистрацию для пользователей из РФ. При этом биржи из Азии (OKX, Bybit, KuCoin) продолжают работать, но требуют осторожности при выводе и прохождении KYC;"},{"title":"Верификация личности (KYC)","text":"Для полноценного доступа к функциям часто требуется прохождение KYC. Пользователи должны быть готовы предоставить паспорт, селфи, документы о месте проживания;"},{"title":"P2P-платформы как способ обхода ограничений","text":"Для покупки USDT/USDC за национальную валюту многие пользуются P2P-платформами, где сделки происходят между людьми напрямую. Это позволяет обходить санкции и ограничения на банковские переводы;"},{"title":"Валютные риски и курсы","text":"Курс на бирже может сильно отличаться от официального курса ЦБ или банковского. Это важно учитывать при расчете реальной стоимости покупки или вывода."}]}$b1230$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kriptobirzhi-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 17, 'heading',
       $h1231${"level":2,"text":"Преимущества и недостатки криптобирж"}$h1231$::jsonb,
       'preimushhestva-i-nedostatki'
FROM articles a WHERE a.slug = 'luchshie-kriptobirzhi-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 18, 'paragraph',
       $b1232${"text":"Преимущества:","html":"Преимущества:"}$b1232$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kriptobirzhi-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 19, 'list',
       $b1233${"ordered":false,"items":["Быстрый доступ к мировому крипторынку;","Высокая ликвидность и множество торговых пар;","Возможность использовать дополнительные инструменты: стейкинг, фьючерсы, P2P;","Удобные мобильные приложения и API;","Возможность зарабатывать даже без вложений через реферальные программы и награды."]}$b1233$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kriptobirzhi-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 20, 'paragraph',
       $b1234${"text":"Недостатки:","html":"Недостатки:"}$b1234$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kriptobirzhi-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 21, 'list',
       $b1235${"ordered":false,"items":["Централизованный контроль (биржа может заморозить или заблокировать счет);","Необходимость доверять третьей стороне;","Риск утраты средств при взломе платформы;","Юрисдикционные риски – особенно в СНГ и при отсутствии регулирования;","Возможные сложности с выводом средств (особенно при нарушении правил или без верификации)."]}$b1235$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kriptobirzhi-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 22, 'paragraph',
       $b1236${"text":"А теперь перейдем к знакомству с ТОП-10 лучших криптовалютных бирж мира.","html":"А теперь перейдем к знакомству с ТОП-10 лучших криптовалютных бирж мира."}$b1236$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kriptobirzhi-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 23, 'heading',
       $h1237${"level":2,"text":"10 место: Coinbase (Коинбейс)"}$h1237$::jsonb,
       'coinbase'
FROM articles a WHERE a.slug = 'luchshie-kriptobirzhi-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 24, 'paragraph',
       $b1238${"text":"Американская криптобиржа, существующая с 2012 года. Главная особенность площадки – ориентация на отдельные рынки и страны, среди которых нет России и государств СНГ. Это значит, что создать новый РУ-аккаунт на Coinbase не получится, как и пользоваться уже зарегистрированными ранее профилями. Биржа официально покинула рынок РФ, а средства некоторых пользователей были заблокированы в 2022 году.","html":"Американская криптобиржа, существующая с 2012 года. Главная особенность площадки – ориентация на отдельные рынки и страны, среди которых нет России и государств СНГ. Это значит, что создать новый РУ-аккаунт на Coinbase не получится, как и пользоваться уже зарегистрированными ранее профилями. Биржа официально покинула рынок РФ, а средства некоторых пользователей были заблокированы в 2022 году."}$b1238$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kriptobirzhi-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 25, 'paragraph',
       $b1239${"text":"Тем не менее, это не мешает Coinbase оставаться в ТОП-10 мировых криптобирж по объему торгов. Площадка предлагает большой набор монет и пар, ликвидность находится на должном уровне, а интерфейс инструмента будет понятен даже новичку (именно по этой причине Coinbase долгое время рекомендовали начинающим трейдерам).","html":"Тем не менее, это не мешает Coinbase оставаться в ТОП-10 мировых криптобирж по объему торгов. Площадка предлагает большой набор монет и пар, ликвидность находится на должном уровне, а интерфейс инструмента будет понятен даже новичку (именно по этой причине Coinbase долгое время рекомендовали начинающим трейдерам)."}$b1239$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kriptobirzhi-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 26, 'image',
       $b1240${"src":"/images/articles/crypto-exchanges/coinbase.png","alt":"Coinbase"}$b1240$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kriptobirzhi-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 27, 'stats',
       $b1241${"rows":[{"label":"Год основания","value":"2012"},{"label":"Юрисдикция","value":"США"},{"label":"Количество монет","value":"более 200"},{"label":"Число торговых пар","value":"более 500"}]}$b1241$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kriptobirzhi-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 28, 'pros_cons',
       $b1242${"pros":["Биржа, подходящая для новичков;","Большое количество монет и торговых пар;","Защищенность аккаунта;","Множество инструментов для заработка (в том числе пассивного);","Статус официальной биржи в США, Европе, Великобритании и Японии, что позволяет работать в этих странах в строгом соответствии с действующим законодательством."],"cons":["Запрет работы в СНГ;","Долгая и сложная проверка аккаунтов;","Высокие комиссии на пополнение и торговлю."]}$b1242$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kriptobirzhi-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 29, 'heading',
       $h1243${"level":2,"text":"9 место: BingX (Бингэкс)"}$h1243$::jsonb,
       'bingx'
FROM articles a WHERE a.slug = 'luchshie-kriptobirzhi-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 30, 'paragraph',
       $b1244${"text":"Проверенная биржа с отсутствием обязательной необходимости верификации аккаунта. На этой платформе возможна работа РУ-аккаунтов, однако процедура пополнения счета далека от оптимальной. Платформа качественно переведена на русский язык, техническая поддержка работает круглосуточно.","html":"Проверенная биржа с отсутствием обязательной необходимости верификации аккаунта. На этой платформе возможна работа РУ-аккаунтов, однако процедура пополнения счета далека от оптимальной. Платформа качественно переведена на русский язык, техническая поддержка работает круглосуточно."}$b1244$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kriptobirzhi-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 31, 'paragraph',
       $b1245${"text":"Впечатляет многообразие бонусов для новых аккаунтов, а также реферальная система – награды за приведение новых клиентов могут стать отличным дополнением к заработку на торговле. Учебная зона позволит научиться трейдингу, однако высокие комиссии могут отпугнуть активных инвесторов в криптовалюты.","html":"Впечатляет многообразие бонусов для новых аккаунтов, а также реферальная система – награды за приведение новых клиентов могут стать отличным дополнением к заработку на торговле. Учебная зона позволит научиться трейдингу, однако высокие комиссии могут отпугнуть активных инвесторов в криптовалюты."}$b1245$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kriptobirzhi-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 32, 'image',
       $b1246${"src":"/images/articles/crypto-exchanges/bingx.png","alt":"BingX"}$b1246$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kriptobirzhi-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 33, 'stats',
       $b1247${"rows":[{"label":"Год основания","value":"2018"},{"label":"Юрисдикция","value":"Сингапур"},{"label":"Количество монет","value":"более 600"},{"label":"Число торговых пар","value":"более 500"}]}$b1247$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kriptobirzhi-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 34, 'pros_cons',
       $b1248${"pros":["Нет обязательной верификации для работы с небольшими объемами;","Перевод на русский язык;","Качественная поддержка;","Наличие дополнительных инструментов по работе с криптой."],"cons":["Сложное пополнение и ограниченный функционал P2P;","Мало данных о владельце и команде разработки;","Отсутствие фиатных депозитов."]}$b1248$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kriptobirzhi-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 35, 'heading',
       $h1249${"level":2,"text":"8 место: Bitget (Бидгет)"}$h1249$::jsonb,
       'bitget'
FROM articles a WHERE a.slug = 'luchshie-kriptobirzhi-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 36, 'paragraph',
       $b1250${"text":"Биржа, которая активно применяет инструмент копитрейдинга – механизм повторения действий успешных трейдеров, что открывает для пользователей возможность пассивного заработка. Неплохой набор валют для торговли дополняется отсутствием обязательной верификации (расширенная версия KYC необходима для увеличения лимитов).","html":"Биржа, которая активно применяет инструмент копитрейдинга – механизм повторения действий успешных трейдеров, что открывает для пользователей возможность пассивного заработка. Неплохой набор валют для торговли дополняется отсутствием обязательной верификации (расширенная версия KYC необходима для увеличения лимитов)."}$b1250$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kriptobirzhi-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 37, 'paragraph',
       $b1251${"text":"Биржа Bitget лояльна к российским криптоэнтузиастам: нет ограничений по работе с РУ-аккаунтами. Платформа качественно переведена на русский язык, есть фиатные торговые пары. Комиссии ниже среднего значения в рамках всего рынка, а наличие дополнительных инструментов расширяет возможности пользователей.","html":"Биржа Bitget лояльна к российским криптоэнтузиастам: нет ограничений по работе с РУ-аккаунтами. Платформа качественно переведена на русский язык, есть фиатные торговые пары. Комиссии ниже среднего значения в рамках всего рынка, а наличие дополнительных инструментов расширяет возможности пользователей."}$b1251$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kriptobirzhi-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 38, 'image',
       $b1252${"src":"/images/articles/crypto-exchanges/bitget.png","alt":"Bitget"}$b1252$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kriptobirzhi-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 39, 'stats',
       $b1253${"rows":[{"label":"Год основания","value":"2018"},{"label":"Юрисдикция","value":"Сингапур"},{"label":"Количество монет","value":"более 400"},{"label":"Число торговых пар","value":"более 500"}]}$b1253$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kriptobirzhi-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 40, 'pros_cons',
       $b1254${"pros":["Возможность работы без верификации;","Низкие комиссии;","Достойный набор монет и торговых пар;","Развитая система копитрейдинга;","Наличие дополнительных сервисов."],"cons":["Подтвержденные случаи взлома;","Не самая лучшая техподдержка."]}$b1254$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kriptobirzhi-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 41, 'heading',
       $h1255${"level":2,"text":"7 место: KuCoin (Кукоин)"}$h1255$::jsonb,
       'kucoin'
FROM articles a WHERE a.slug = 'luchshie-kriptobirzhi-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 42, 'paragraph',
       $b1256${"text":"Известная биржа, которая отличается низкими торговыми комиссиями. В 2020 году KuCoin подвергся взлому, однако владельцам удалось вернуть около 85% всех украденных активов. После данного инцидента были проведены масштабные операции в сфере повышения безопасности площадки, что позволило создать действительно надежный и удобный для пользователей продукт.","html":"Известная биржа, которая отличается низкими торговыми комиссиями. В 2020 году KuCoin подвергся взлому, однако владельцам удалось вернуть около 85% всех украденных активов. После данного инцидента были проведены масштабные операции в сфере повышения безопасности площадки, что позволило создать действительно надежный и удобный для пользователей продукт."}$b1256$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kriptobirzhi-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 43, 'paragraph',
       $b1257${"text":"Биржа KuCoin частично исполняет санкции, введенные против российских граждан: жители стран СНГ могут пользоваться платформой, но с некоторыми ограничениями из области P2P. В частности, под запрет попали крупнейшие банки, что несколько усложняет работу с биржей.","html":"Биржа KuCoin частично исполняет санкции, введенные против российских граждан: жители стран СНГ могут пользоваться платформой, но с некоторыми ограничениями из области P2P. В частности, под запрет попали крупнейшие банки, что несколько усложняет работу с биржей."}$b1257$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kriptobirzhi-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 44, 'image',
       $b1258${"src":"/images/articles/crypto-exchanges/kucoin.png","alt":"KuCoin"}$b1258$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kriptobirzhi-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 45, 'stats',
       $b1259${"rows":[{"label":"Год основания","value":"2017"},{"label":"Юрисдикция","value":"Сейшельские острова"},{"label":"Количество монет","value":"более 600"},{"label":"Число торговых пар","value":"более 1 000"}]}$b1259$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kriptobirzhi-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 46, 'pros_cons',
       $b1260${"pros":["Большое количество монет и торговых пар;","Минимальные комиссии;","Наличие инструментов пассивного заработка."],"cons":["Непонятные перспективы работы на российском рынке;","Отсутствие поддержки ряда языков;","Неполная лицензионная прозрачность."]}$b1260$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kriptobirzhi-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 47, 'heading',
       $h1261${"level":2,"text":"6 место: Gate (Гейт)"}$h1261$::jsonb,
       'gate'
FROM articles a WHERE a.slug = 'luchshie-kriptobirzhi-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 48, 'paragraph',
       $b1262${"text":"Одна из старейших бирж, отличительной особенностью которой является впечатляющее количество монет для торговли и валютных пар. Площадка отличается простотой и отсутствием лишних элементов, что отлично подходит новичкам. В то же время опытные трейдеры также активно пользуются Gate, так как именно здесь торгуются редкие монеты и в том числе высокорискованные активы.","html":"Одна из старейших бирж, отличительной особенностью которой является впечатляющее количество монет для торговли и валютных пар. Площадка отличается простотой и отсутствием лишних элементов, что отлично подходит новичкам. В то же время опытные трейдеры также активно пользуются Gate, так как именно здесь торгуются редкие монеты и в том числе высокорискованные активы."}$b1262$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kriptobirzhi-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 49, 'paragraph',
       $b1263${"text":"Биржа принадлежит американской компании, которая выкупила площадку у китайских основателей – имеется риск санкций и блокировки счетов для россиян. Однако на текущий момент о таких планах владельцев информации нет, поэтому многие пользователи из СНГ-сегмента активно задействуют Gate при работе с криптовалютами.","html":"Биржа принадлежит американской компании, которая выкупила площадку у китайских основателей – имеется риск санкций и блокировки счетов для россиян. Однако на текущий момент о таких планах владельцев информации нет, поэтому многие пользователи из СНГ-сегмента активно задействуют Gate при работе с криптовалютами."}$b1263$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kriptobirzhi-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 50, 'image',
       $b1264${"src":"/images/articles/crypto-exchanges/gate.png","alt":"Gate.io"}$b1264$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kriptobirzhi-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 51, 'stats',
       $b1265${"rows":[{"label":"Год основания","value":"2013"},{"label":"Юрисдикция","value":"Каймановы острова"},{"label":"Количество монет","value":"более 1 400"},{"label":"Число торговых пар","value":"более 2 300"}]}$b1265$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kriptobirzhi-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 52, 'pros_cons',
       $b1266${"pros":["Лидирующие позиции по числу предлагаемых монет и торговых пар;","Простой и понятный интерфейс;","Небольшая комиссия за совершаемые сделки;","Легкая процедура регистрации;","Отсутствие явных намерений отказа от российских пользователей."],"cons":["Отсутствует перевод интерфейсов на русский язык;","Расширенная верификация для полноценной работы;","Ограниченный инструментарий по выставлению рыночных заявок."]}$b1266$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kriptobirzhi-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 53, 'heading',
       $h1267${"level":2,"text":"5 место: MEXC (Мекс)"}$h1267$::jsonb,
       'mexc'
FROM articles a WHERE a.slug = 'luchshie-kriptobirzhi-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 54, 'paragraph',
       $b1268${"text":"Еще одна биржа, продолжающая работу с российскими пользователями без существенных ограничений. Более того, после бана некоторыми площадками РУ-пользователей, MEXC приняли решение поощрить переезд криптоэнтузиастов на свою площадку. Например, появились нулевые комиссии для торговли, а также выгодные бонусные программы и реферальные системы.","html":"Еще одна биржа, продолжающая работу с российскими пользователями без существенных ограничений. Более того, после бана некоторыми площадками РУ-пользователей, MEXC приняли решение поощрить переезд криптоэнтузиастов на свою площадку. Например, появились нулевые комиссии для торговли, а также выгодные бонусные программы и реферальные системы."}$b1268$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kriptobirzhi-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 55, 'paragraph',
       $b1269${"text":"Одна из ключевых особенностей MEXC – большое количество токенов для торговли и валютных пар. Вероятно, этим создатели биржи решили компенсировать минимальное количество инструментов пассивного заработка.","html":"Одна из ключевых особенностей MEXC – большое количество токенов для торговли и валютных пар. Вероятно, этим создатели биржи решили компенсировать минимальное количество инструментов пассивного заработка."}$b1269$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kriptobirzhi-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 56, 'image',
       $b1270${"src":"/images/articles/crypto-exchanges/mexc.png","alt":"MEXC"}$b1270$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kriptobirzhi-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 57, 'stats',
       $b1271${"rows":[{"label":"Год основания","value":"2018"},{"label":"Юрисдикция","value":"Сингапур"},{"label":"Количество монет","value":"более 400"},{"label":"Число торговых пар","value":"более 500"}]}$b1271$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kriptobirzhi-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 58, 'pros_cons',
       $b1272${"pros":["Полноценная работа в России и СНГ;","Возможность пополнения через P2P без комиссии;","Внушительный набор токенов и торговых пар;","Нулевые комиссии при торговле;","Большое кредитное плечо (до x200)."],"cons":["Невозможность пополнения с российских банковских карт;","Отсутствие опционов и бивалютных инвестиций;","Некачественный перевод некоторых разделов на русский язык;","Необходимость верификации для проведения некоторых торговых операций."]}$b1272$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kriptobirzhi-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 59, 'heading',
       $h1273${"level":2,"text":"4 место: Huobi или HTX (Хуоби или Аштиикс)"}$h1273$::jsonb,
       'htx'
FROM articles a WHERE a.slug = 'luchshie-kriptobirzhi-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 60, 'paragraph',
       $b1274${"text":"Одна из старейших криптобирж мира, которая недавно была переименована с Huobi на HTX (Huobi Tron X). На текущий момент данная площадка является одной из самых дружественных российскому пользователю бирж – никаких ограничений в адрес РУ-сегмента не вводилось. Пополнить счет можно как с карты, так и через систему P2P-платежей, что очень удобно в условиях санкций и ограничений.","html":"Одна из старейших криптобирж мира, которая недавно была переименована с Huobi на HTX (Huobi Tron X). На текущий момент данная площадка является одной из самых дружественных российскому пользователю бирж – никаких ограничений в адрес РУ-сегмента не вводилось. Пополнить счет можно как с карты, так и через систему P2P-платежей, что очень удобно в условиях санкций и ограничений."}$b1274$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kriptobirzhi-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 61, 'paragraph',
       $b1275${"text":"Сама по себе платформа достаточно удобна и богата на различного рода инструменты торговли, пассивного заработка и инвестиций. HTX предлагает большое количество торговых пар и монет, все разделы переведены на русский язык. Интерфейс прост и понятен, однако дизайн площадки понравится далеко не всем.","html":"Сама по себе платформа достаточно удобна и богата на различного рода инструменты торговли, пассивного заработка и инвестиций. HTX предлагает большое количество торговых пар и монет, все разделы переведены на русский язык. Интерфейс прост и понятен, однако дизайн площадки понравится далеко не всем."}$b1275$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kriptobirzhi-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 62, 'image',
       $b1276${"src":"/images/articles/crypto-exchanges/htx.png","alt":"HTX (Huobi)"}$b1276$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kriptobirzhi-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 63, 'stats',
       $b1277${"rows":[{"label":"Год основания","value":"2013"},{"label":"Юрисдикция","value":"Сингапур"},{"label":"Количество монет","value":"более 500"},{"label":"Число торговых пар","value":"более 600"}]}$b1277$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kriptobirzhi-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 64, 'pros_cons',
       $b1278${"pros":["Отсутствие ограничений работы в России и странах СНГ;","Хорошая репутация;","Наличие всех необходимых инструментов для работы с криптовалютой;","Предельно простой интерфейс;","Быстрая верификация аккаунта;","Наличие собственного токена HT."],"cons":["Спорная ситуация относительно перспективы продажи биржи и прав владения платформой;","Комиссии выше средних рыночных значений;","Спорные решения в интерфейсе сайта и мобильного приложения."]}$b1278$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kriptobirzhi-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 65, 'heading',
       $h1279${"level":2,"text":"3 место: OKX (Окейикс)"}$h1279$::jsonb,
       'okx'
FROM articles a WHERE a.slug = 'luchshie-kriptobirzhi-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 66, 'paragraph',
       $b1280${"text":"Одна из старейших бирж, сменившая вектор развития в 2022 году. У площадки появилась своя блокчейн-сеть, токен и кошелек, а перечень инновационных решений стремительно пополняется. По своему функционалу и репутации биржа OKX сопоставима с платформой Bybit, что делает выбор между двумя этими инструментами затруднительным.","html":"Одна из старейших бирж, сменившая вектор развития в 2022 году. У площадки появилась своя блокчейн-сеть, токен и кошелек, а перечень инновационных решений стремительно пополняется. По своему функционалу и репутации биржа OKX сопоставима с платформой Bybit, что делает выбор между двумя этими инструментами затруднительным."}$b1280$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kriptobirzhi-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 67, 'paragraph',
       $b1281${"text":"По объему торгов биржа OKX стабильно входит в первую пятерку, предлагая хороший набор монет и торговых пар. Комиссии на площадке небольшие, интерфейс прост и понятен, включая наличие демо-режима. OKX не планирует покидать российский рынок, однако появились некоторые ограничения для RU-аккаунтов по работе с высокодоходными пассивными инструментами. Ключевой недостаток – необходимость верификации для совершения транзакций.","html":"По объему торгов биржа OKX стабильно входит в первую пятерку, предлагая хороший набор монет и торговых пар. Комиссии на площадке небольшие, интерфейс прост и понятен, включая наличие демо-режима. OKX не планирует покидать российский рынок, однако появились некоторые ограничения для RU-аккаунтов по работе с высокодоходными пассивными инструментами. Ключевой недостаток – необходимость верификации для совершения транзакций."}$b1281$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kriptobirzhi-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 68, 'image',
       $b1282${"src":"/images/articles/crypto-exchanges/okx.png","alt":"OKX"}$b1282$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kriptobirzhi-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 69, 'stats',
       $b1283${"rows":[{"label":"Год основания","value":"2014"},{"label":"Юрисдикция","value":"Сейшельские острова"},{"label":"Количество монет","value":"более 300"},{"label":"Число торговых пар","value":"более 600"}]}$b1283$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kriptobirzhi-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 70, 'pros_cons',
       $b1284${"pros":["Надежность и репутация за счет впечатляющего возраста платформы;","Большое число токенов и валютных пар;","Простой интерфейс, понятный даже начинающим инвесторам и трейдерам;","Небольшие комиссии;","Богатая инфраструктура и наличие инновационных инструментов;","Большое кредитное плечо;","Доступность для СНГ."],"cons":["Обязательная верификация аккаунтов;","Ограничение некоторых инструментов для россиян;","Сложность пополнения счетов фиатом с карты."]}$b1284$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kriptobirzhi-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 71, 'heading',
       $h1285${"level":2,"text":"2 место: Bybit (Байбит)"}$h1285$::jsonb,
       'bybit'
FROM articles a WHERE a.slug = 'luchshie-kriptobirzhi-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 72, 'paragraph',
       $b1286${"text":"Активно развивающаяся биржа, являющаяся альтернативой Бинанса для российских пользователей. Количества токенов и валютных пар достаточно для комфортной торговли, а высокая ликвидность позволяет не переживать за возможные задержки в процессе покупки и продажи активов. Платформа предлагает выгодную реферальную программу, а также многочисленные бонусы новым пользователям, например, нулевые комиссии для спотовой торговли.","html":"Активно развивающаяся биржа, являющаяся альтернативой Бинанса для российских пользователей. Количества токенов и валютных пар достаточно для комфортной торговли, а высокая ликвидность позволяет не переживать за возможные задержки в процессе покупки и продажи активов. Платформа предлагает выгодную реферальную программу, а также многочисленные бонусы новым пользователям, например, нулевые комиссии для спотовой торговли."}$b1286$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kriptobirzhi-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 73, 'paragraph',
       $b1287${"text":"Поскольку многие пользователи СНГ ввиду геополитических факторов совершили переезд с Binance именно на Bybit, финансовые регуляторы стремятся усложнить торговлю россиянам на бирже Байбит. Тем не менее, явных поводов для беспокойства сегодня нет, так как владельцы платформы не планируют отказываться от десятков тысяч СНГ-аккаунтов.","html":"Поскольку многие пользователи СНГ ввиду геополитических факторов совершили переезд с Binance именно на Bybit, финансовые регуляторы стремятся усложнить торговлю россиянам на бирже Байбит. Тем не менее, явных поводов для беспокойства сегодня нет, так как владельцы платформы не планируют отказываться от десятков тысяч СНГ-аккаунтов."}$b1287$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kriptobirzhi-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 74, 'image',
       $b1288${"src":"/images/articles/crypto-exchanges/bybit.png","alt":"Bybit"}$b1288$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kriptobirzhi-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 75, 'stats',
       $b1289${"rows":[{"label":"Год основания","value":"2018"},{"label":"Юрисдикция","value":"Виргинские острова"},{"label":"Количество монет","value":"более 200"},{"label":"Число торговых пар","value":"более 200"}]}$b1289$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kriptobirzhi-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 76, 'pros_cons',
       $b1290${"pros":["Защищенность аккаунтов пользователей;","Хорошая репутация на мировом крипторынке;","Возможность комфортной работы пользователей из СНГ;","Достаточное количество валют и торговых пар;","Высокая ликвидность активов;","Быстрая и эффективная поддержка;","Достойная бонусная программа и реферальная система;","Простой и понятный интерфейс."],"cons":["Обязательная верификация KYC для некоторых операций;","Отсутствие некоторых монет и валютных пар на спотовой платформе;","Высокая вероятность регулирования в обозримом будущем."]}$b1290$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kriptobirzhi-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 77, 'heading',
       $h1291${"level":2,"text":"1 место: Binance (Бинанс)"}$h1291$::jsonb,
       'binance'
FROM articles a WHERE a.slug = 'luchshie-kriptobirzhi-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 78, 'paragraph',
       $b1292${"text":"Наиболее известная и крупнейшая по торговому объему криптобиржа мира, которая на слуху у каждого владельца цифровых активов. Большое количество предлагаемых монет, множество валютных пар, высокая ликвидность, собственная NFT-платформа, десятки способов пополнения и вывода. Binance занимает уверенное первое место в мире по популярности и количеству пользователей, поэтому биржу можно назвать безоговорочным лидером.","html":"Наиболее известная и крупнейшая по торговому объему криптобиржа мира, которая на слуху у каждого владельца цифровых активов. Большое количество предлагаемых монет, множество валютных пар, высокая ликвидность, собственная NFT-платформа, десятки способов пополнения и вывода. Binance занимает уверенное первое место в мире по популярности и количеству пользователей, поэтому биржу можно назвать безоговорочным лидером."}$b1292$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kriptobirzhi-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 79, 'paragraph',
       $b1293${"text":"Однако позиции Бинанса серьезно пошатнулись после уголовного дела в адрес CEO Чанпэн Чжао. Биржа попала под пристальное внимание регуляторов, что ставит под угрозу анонимность и конфиденциальность пользователей. Отдельно следует отметить политику Binance в адрес российских пользователей – фактически, биржа прекратила работу в России, предложив пользоваться платформой CommEX. Именно этой компании проданы активы СНГ-подразделения Бинанс.","html":"Однако позиции Бинанса серьезно пошатнулись после уголовного дела в адрес CEO Чанпэн Чжао. Биржа попала под пристальное внимание регуляторов, что ставит под угрозу анонимность и конфиденциальность пользователей. Отдельно следует отметить политику Binance в адрес российских пользователей – фактически, биржа прекратила работу в России, предложив пользоваться платформой CommEX. Именно этой компании проданы активы СНГ-подразделения Бинанс."}$b1293$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kriptobirzhi-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 80, 'image',
       $b1294${"src":"/images/articles/crypto-exchanges/binance.png","alt":"Binance"}$b1294$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kriptobirzhi-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 81, 'stats',
       $b1295${"rows":[{"label":"Год основания","value":"2017"},{"label":"Юрисдикция","value":"Гонконг"},{"label":"Количество монет","value":"более 300"},{"label":"Число торговых пар","value":"более 1 000"}]}$b1295$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kriptobirzhi-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 82, 'pros_cons',
       $b1296${"pros":["Большое число монет и торговых пар;","Высокая ликвидность, что позволяет проводить мгновенные сделки по большинству токенов;","Минимальные комиссии;","Высокая степень защиты аккаунтов пользователей от взлома;","Поддержка API, что открывает внушительные возможности для интеграции."],"cons":["Вмешательство регуляторов США в рабочие процессы биржи;","Отказ от работы на российском рынке;","Сложный и перегруженный интерфейс;","Медленная работа службы поддержки."]}$b1296$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kriptobirzhi-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 83, 'heading',
       $h1297${"level":2,"text":"Выводы"}$h1297$::jsonb,
       'vyvody'
FROM articles a WHERE a.slug = 'luchshie-kriptobirzhi-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 84, 'paragraph',
       $b1298${"text":"Криптовалютные биржи – это главный шлюз в мир цифровых активов. Они обеспечивают ликвидность, удобство и широкий функционал, но требуют внимательности и осознанности от пользователя.","html":"Криптовалютные биржи – это главный шлюз в мир цифровых активов. Они обеспечивают ликвидность, удобство и широкий функционал, но требуют внимательности и осознанности от пользователя."}$b1298$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kriptobirzhi-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 85, 'paragraph',
       $b1299${"text":"Что важно запомнить:","html":"Что важно запомнить:"}$b1299$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kriptobirzhi-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 86, 'list',
       $b1300${"ordered":false,"items":["Всегда изучайте биржу перед регистрацией;","Никогда не храните крупные суммы на бирже – для хранения используйте холодные кошельки;","Проходите KYC только на надежных платформах;","Учитывайте локальные риски, особенно если вы из СНГ;","Не забывайте про безопасность – двухфакторная аутентификация и сложные пароли обязательны."]}$b1300$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kriptobirzhi-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 87, 'paragraph',
       $b1301${"text":"Биржа – не просто сайт с графиками, это ваш крипто-мост в глобальную цифровую экономику. И чем надежнее мост, тем безопаснее путь.","html":"Биржа – не просто сайт с графиками, это ваш крипто-мост в глобальную цифровую экономику. И чем надежнее мост, тем безопаснее путь."}$b1301$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-kriptobirzhi-top-10';
