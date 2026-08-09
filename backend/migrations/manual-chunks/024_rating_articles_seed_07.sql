SET client_encoding = 'UTF8';

-- Blocks: rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke
INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 1, 'heading',
       $h805${"level":2,"text":"Введение"}$h805$::jsonb,
       'vvedenie'
FROM articles a WHERE a.slug = 'rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 2, 'paragraph',
       $b806${"text":"Новички и даже опытные майнеры часто рассматривают возможность покупки б/у асиков как способ сэкономить и ускорить возврат инвестиций. Но так ли это безопасно и выгодно, как кажется на первый взгляд? Узнаем, когда подержанные асики лучше новых, как их правильно выбирать, на какие модели обратить внимание и в каких случаях лучше отказаться от такой идеи.","html":"Новички и даже опытные майнеры часто рассматривают возможность покупки б/у асиков как способ сэкономить и ускорить возврат инвестиций. Но так ли это безопасно и выгодно, как кажется на первый взгляд? Узнаем, когда подержанные асики лучше новых, как их правильно выбирать, на какие модели обратить внимание и в каких случаях лучше отказаться от такой идеи."}$b806$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 3, 'image',
       $b807${"src":"/images/articles/used-asics/mining-farm.png","alt":"Майнинг-ферма с ASIC-оборудованием"}$b807$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 4, 'heading',
       $h808${"level":2,"text":"Почему подержанный асик лучше нового?"}$h808$::jsonb,
       'pochemu-bu'
FROM articles a WHERE a.slug = 'rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 5, 'paragraph',
       $b809${"text":"Покупка бывших в употреблении асиков может быть не просто вынужденной мерой, а стратегическим решением. Перечень ситуаций, когда это оправдано:","html":"Покупка бывших в употреблении асиков может быть не просто вынужденной мерой, а стратегическим решением. Перечень ситуаций, когда это оправдано:"}$b809$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 6, 'rich_list',
       $b810${"ordered":false,"items":[{"title":"Ограниченный бюджет","text":"Для тех, кто только входит в сферу, приобретение нового оборудования может быть сложной задачей. Подержанные асики дают шанс протестировать рынок и начать майнинг с минимальными вложениями;"},{"title":"Быстрая окупаемость","text":"Цена подержанного майнера может быть в 2-3 раза ниже, чем нового. А если оборудование работает стабильно, возврат инвестиций произойдет гораздо быстрее;"},{"title":"Снижение риска в нестабильном рынке","text":"Если курс биткоина резко падает, цены на новое оборудование могут остаться высокими, однако «вторичка» дешевеет быстрее. Это делает ее более привлекательной при нестабильности;"},{"title":"Расширение мощностей","text":"Иногда проще и дешевле нарастить мощности с помощью подержанных устройств, чем дожидаться новых поставок с заводов;"},{"title":"Подготовка к будущему росту","text":"Если вы уверены в грядущем росте рынка, разумно купить подержанное оборудование по низкой цене, чтобы быть готовым к новому «бычьему» тренду."}]}$b810$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 7, 'paragraph',
       $b811${"text":"Подержанные асики – это далеко не всегда выбор начинающих майнеров. Многие опытные криптоэнтузиасты отдают предпочтение именно бывшей в употреблении технике, делая ставку на такую стратегию.","html":"Подержанные асики – это далеко не всегда выбор начинающих майнеров. Многие опытные криптоэнтузиасты отдают предпочтение именно бывшей в употреблении технике, делая ставку на такую стратегию."}$b811$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 8, 'image',
       $b812${"src":"/images/articles/used-asics/antminer-s21-pair.png","alt":"Подержанные ASIC Antminer S21"}$b812$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 9, 'heading',
       $h813${"level":2,"text":"Как выбрать подержанный асик?"}$h813$::jsonb,
       'kak-vybrat'
FROM articles a WHERE a.slug = 'rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 10, 'paragraph',
       $b814${"text":"Выбор б/у-устройства – это всегда компромисс между ценой и надежностью. Какие факторы обязательно следует учитывать при покупке:","html":"Выбор б/у-устройства – это всегда компромисс между ценой и надежностью. Какие факторы обязательно следует учитывать при покупке:"}$b814$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 11, 'rich_list',
       $b815${"ordered":false,"items":[{"title":"Проверенный продавец","text":"Не связывайтесь с частниками без прозрачной истории работы: велика вероятность обмана или скрытых дефектов. Покупайте у магазинов или майнинг-компаний, которые предоставляют гарантию. Обращайте внимание на отзывы, репутацию и активность в сообществах;"},{"title":"Проверка на работоспособность","text":"Запросите видео работы устройства с выводом данных в HiveOS или Braiins OS (температура, хешрейт, ошибки). Если есть возможность – тестируйте лично: 10–15 минут реальной работы покажут многое;"},{"title":"Условия эксплуатации","text":"Асик, который стоял в дата-центре с хорошей вентиляцией и стабильным питанием, скорее всего, прослужит дольше. Опасайтесь майнеров из «гаражных» ферм – там плохое охлаждение, скачки напряжения и много пыли;"},{"title":"Время эксплуатации","text":"Если устройство проработало более 2–3 лет в режиме 24/7, износ может быть критичным. Уточните дату покупки и интенсивность работы;"},{"title":"Возможность ремонта","text":"Убедитесь, что для модели доступны запчасти: вентиляторы, платы, блоки питания. Узнайте, есть ли сервисный центр поблизости или онлайн-ресурсы по ремонту;"},{"title":"Остаток гарантии (бонус)","text":"Некоторые продавцы реализуют асики, еще находящиеся на гарантии от Bitmain или MicroBT – это большой плюс;"},{"title":"Оцените экономику","text":"Сравните стоимость устройства, его энергопотребление и хешрейт с текущей доходностью. Помните, что дешевый асик с плохим КПД может в долгосрочной перспективе оказаться убыточным."}]}$b815$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 12, 'heading',
       $h816${"level":2,"text":"Риски при покупке подержанных асиков"}$h816$::jsonb,
       'riski'
FROM articles a WHERE a.slug = 'rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 13, 'paragraph',
       $b817${"text":"Перед тем как принять решение о покупке бывшего в употреблении майнера, детально проанализируйте возможные риски:","html":"Перед тем как принять решение о покупке бывшего в употреблении майнера, детально проанализируйте возможные риски:"}$b817$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 14, 'list',
       $b818${"ordered":false,"items":["Скрытые дефекты: неисправные чипы, прошивка с ошибками, сбои в блоках питания;","Манипуляции с прошивкой: некоторые продавцы разгоняют устройства на пределе, что ведет к перегреву и преждевременному износу;","Отсутствие запчастей: старые модели могут быть просто неремонтопригодны;","Юридические риски: украденные асики тоже бывают на рынке – при обыске утерянное устройство может быть изъято."]}$b818$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 15, 'paragraph',
       $b819${"text":"Покупка подержанных майнеров может быть выгодной, но всегда сопряжена с рядом рисков: это и скрытые технические неисправности, и перегрев компонентов, и отсутствие гарантии или возможности ремонта, и даже вероятность приобретения устройства сомнительного происхождения. Без достаточного опыта и тщательной проверки есть высокий шанс столкнуться с убытками, поэтому такой шаг требует внимательности и подготовки.","html":"Покупка подержанных майнеров может быть выгодной, но всегда сопряжена с рядом рисков: это и скрытые технические неисправности, и перегрев компонентов, и отсутствие гарантии или возможности ремонта, и даже вероятность приобретения устройства сомнительного происхождения. Без достаточного опыта и тщательной проверки есть высокий шанс столкнуться с убытками, поэтому такой шаг требует внимательности и подготовки."}$b819$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 16, 'heading',
       $h820${"level":2,"text":"5 место: Antminer L7"}$h820$::jsonb,
       'antminer-l7'
FROM articles a WHERE a.slug = 'rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 17, 'paragraph',
       $b821${"text":"На подержанной технике можно добывать не только BTC (алгоритм SHA-256), но и альткоины. Один из наиболее удачных вариантов – методика Scrypt. Здесь доступны более двух десятков монет, а наиболее известным активом является пара DOGE+LTC. Преимуществ данных токенов несколько. Во-первых, халвинг в сети LTC состоялся осенью 2023 года, что сделало ресурс еще более дефицитным. Во-вторых, DOGE является самым известным мем-коином, а тренд на популяризацию данных активов в текущем бычьем цикле особенно актуален. В-третьих, Dogecoin является любимой криптовалютой Илона Маска – американский бизнесмен периодически влияет на курс своими твитами и яркими заявлениями.","html":"На подержанной технике можно добывать не только BTC (алгоритм SHA-256), но и альткоины. Один из наиболее удачных вариантов – методика Scrypt. Здесь доступны более двух десятков монет, а наиболее известным активом является пара DOGE+LTC. Преимуществ данных токенов несколько. Во-первых, халвинг в сети LTC состоялся осенью 2023 года, что сделало ресурс еще более дефицитным. Во-вторых, DOGE является самым известным мем-коином, а тренд на популяризацию данных активов в текущем бычьем цикле особенно актуален. В-третьих, Dogecoin является любимой криптовалютой Илона Маска – американский бизнесмен периодически влияет на курс своими твитами и яркими заявлениями."}$b821$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 18, 'paragraph',
       $b822${"text":"Несмотря на появление в 2021 году, Antminer L7 остается самым мощным асиком на алгоритме Scrypt (9 500 МХ/с). Ближайшие конкуренты значительно отстают от данной модели, что делает устройство актуальным и сегодня. L7 является достаточно редким явлением на вторичном рынке, так как формат в целом не является популярным. Но с учетом халвинга Биткоина в 2024 году майнинг альткоинов становится выгодным. И Antminer L7 в этом отношении как никогда актуален.","html":"Несмотря на появление в 2021 году, Antminer L7 остается самым мощным асиком на алгоритме Scrypt (9 500 МХ/с). Ближайшие конкуренты значительно отстают от данной модели, что делает устройство актуальным и сегодня. L7 является достаточно редким явлением на вторичном рынке, так как формат в целом не является популярным. Но с учетом халвинга Биткоина в 2024 году майнинг альткоинов становится выгодным. И Antminer L7 в этом отношении как никогда актуален."}$b822$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 19, 'stats',
       $b823${"rows":[{"label":"Производитель","value":"BITMAIN"},{"label":"Год выпуска","value":"2021"},{"label":"Хешрейт","value":"9 500 МХ/с"},{"label":"Энергопотребление","value":"3 500 Вт"},{"label":"Энергоэффективность","value":"0,36 Вт на МХ"},{"label":"Алгоритм","value":"Scrypt"},{"label":"Количество монет, доступных для майнинга","value":"22"},{"label":"Уровень шума","value":"70 дБ"}]}$b823$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 20, 'pros_cons',
       $b824${"pros":["Модель от известного и проверенного производителя;","Выгодный майнинг активов, являющихся альтернативой BTC;","Халвинг в сети LTC состоялся в 2023 году – объемы наград майнеров не будут меняться еще долгое время;","Актуальность мем-коинов на текущем бычьем рынке;","Поддержка DOGE со стороны Илона Маска."],"cons":["Альткоины – более волатильный актив, чем Биткоин: добыча сопряжена с дополнительными рисками;","Асики на Scrypt менее востребованы на вторичном рынке."]}$b824$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 21, 'heading',
       $h825${"level":2,"text":"4 место: Whatsminer M50"}$h825$::jsonb,
       'whatsminer-m50'
FROM articles a WHERE a.slug = 'rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 22, 'paragraph',
       $b826${"text":"Логичным продолжением 30-й серии от MicroBT стала 50-я линейка Whatsminer, которая отличается более впечатляющей мощностью и энергоэффективностью. Найти M50 на вторичном рынке значительно сложнее, так как данная модель эффективна и после халвинга практически для любой разумной стоимости электричества. Остальные преимущества уже знакомы нам – надежность, наличие запчастей и сервисных центров.","html":"Логичным продолжением 30-й серии от MicroBT стала 50-я линейка Whatsminer, которая отличается более впечатляющей мощностью и энергоэффективностью. Найти M50 на вторичном рынке значительно сложнее, так как данная модель эффективна и после халвинга практически для любой разумной стоимости электричества. Остальные преимущества уже знакомы нам – надежность, наличие запчастей и сервисных центров."}$b826$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 23, 'paragraph',
       $b827${"text":"50-я серия представлена только двумя моделями – классическая «M50» и улучшенная «M50+». Оптимально использовать именно второй вариант, так как при аналогичном объеме энергопотребления он на 8 ТХ/с мощнее, что позитивно влияет на прибыльность.","html":"50-я серия представлена только двумя моделями – классическая «M50» и улучшенная «M50+». Оптимально использовать именно второй вариант, так как при аналогичном объеме энергопотребления он на 8 ТХ/с мощнее, что позитивно влияет на прибыльность."}$b827$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 24, 'image',
       $b828${"src":"/images/articles/used-asics/whatsminer-m50.png","alt":"Whatsminer M50"}$b828$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 25, 'stats',
       $b829${"rows":[{"label":"Производитель","value":"MicroBT"},{"label":"Год выпуска","value":"2022"},{"label":"Хешрейт","value":"от 114 до 126 ТХ/с"},{"label":"Энергопотребление","value":"от 3 276 до 3 306 Вт"},{"label":"Энергоэффективность","value":"от 26 до 29 Вт на ТХ"},{"label":"Алгоритм","value":"SHA-256"},{"label":"Количество монет, доступных для майнинга","value":"36"},{"label":"Уровень шума","value":"75 дБ"}]}$b829$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 26, 'pros_cons',
       $b830${"pros":["Формат майнинга, актуальный после халвинга;","Проверенный производитель с отличной репутацией;","Множество запчастей на вторичном рынке;","Отсутствуют трудности с ремонтом и сервисом;","Популярность на вторичном рынке;","Горизонтальный форм-фактор и всего 2 вентилятора: меньше шума и занимаемого пространства."],"cons":["Необходимость переплаты за известный бренд;","Трудности с разгоном продукции от MicroBT."]}$b830$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 27, 'heading',
       $h831${"level":2,"text":"3 место: Whatsminer M30S"}$h831$::jsonb,
       'whatsminer-m30s'
FROM articles a WHERE a.slug = 'rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 28, 'paragraph',
       $b832${"text":"Прямым конкурентом Antminer S19 от компании MicroBT является 30-я линейка Whatsminer. Существует мнение, что данный производитель является эталоном надежности, но на практике долговечность асиков от двух лидеров рынка примерно одинаковая. Разница кроется в потребительских предпочтениях и маркетинге: ситуацию можно сравнить с любыми другими конкурирующими брендами, например, Apple или Samsung, BMW или Toyota, Nike или Reebok, Coca-Cola или Pepsi. В мире майнинга на асиках аналогичная ситуация – это Antminer или Whatsminer.","html":"Прямым конкурентом Antminer S19 от компании MicroBT является 30-я линейка Whatsminer. Существует мнение, что данный производитель является эталоном надежности, но на практике долговечность асиков от двух лидеров рынка примерно одинаковая. Разница кроется в потребительских предпочтениях и маркетинге: ситуацию можно сравнить с любыми другими конкурирующими брендами, например, Apple или Samsung, BMW или Toyota, Nike или Reebok, Coca-Cola или Pepsi. В мире майнинга на асиках аналогичная ситуация – это Antminer или Whatsminer."}$b832$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 29, 'paragraph',
       $b833${"text":"30-я линейка от MicroBT представлена только тремя моделями, поэтому выбор здесь несколько скромнее – это майнеры «S», «S+» и «S++». Разница заключается в мощности и, соответственно, энергоэффективности – объем энергопотребления схожий. Владельцы Whatsminer не испытывают трудностей с запчастями и сервисом, а фермы с недорогим электричеством продолжают майнить в плюс даже после халвинга.","html":"30-я линейка от MicroBT представлена только тремя моделями, поэтому выбор здесь несколько скромнее – это майнеры «S», «S+» и «S++». Разница заключается в мощности и, соответственно, энергоэффективности – объем энергопотребления схожий. Владельцы Whatsminer не испытывают трудностей с запчастями и сервисом, а фермы с недорогим электричеством продолжают майнить в плюс даже после халвинга."}$b833$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 30, 'image',
       $b834${"src":"/images/articles/used-asics/whatsminer-m30s.png","alt":"Whatsminer M30S"}$b834$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 31, 'stats',
       $b835${"rows":[{"label":"Производитель","value":"MicroBT"},{"label":"Год выпуска","value":"2020"},{"label":"Хешрейт","value":"от 88 до 112 ТХ/с"},{"label":"Энергопотребление","value":"от 3 344 до 3 472 Вт"},{"label":"Энергоэффективность","value":"от 31 до 38 Вт на ТХ"},{"label":"Алгоритм","value":"SHA-256"},{"label":"Количество монет, доступных для майнинга","value":"36"},{"label":"Уровень шума","value":"75 дБ"}]}$b835$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 32, 'pros_cons',
       $b836${"pros":["Проверенный производитель, продукция которого считается многими самой надежной среди конкурентов;","Прибыльный формат майнинга после халвинга, особенно для локаций с недорогим электричеством;","Множество предложений на вторичном рынке, что позволяет сделать оптимальный выбор и получить скидку;","Популярность техники Whatsminer на вторичном рынке;","Горизонтальный форм-фактор, что позволяет экономить место. Преимущество еще более актуально для использования вместе с шумбоксами;","Всего 2 вентилятора (а не 4, как в Antminer) – это положительным образом влияет на уровень шума."],"cons":["Переплата за известный бренд;","Небольшая доходность при высокой стоимости электричества;","Более сложный разгон по сравнению с Antminer: прошивок для Whatsminer значительно меньше."]}$b836$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 33, 'heading',
       $h837${"level":2,"text":"2 место: Antminer S19"}$h837$::jsonb,
       'antminer-s19'
FROM articles a WHERE a.slug = 'rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 34, 'paragraph',
       $b838${"text":"Безоговорочным лидером нашего рейтинга является 19-я серия Antminer от компании BITMAIN: простая и надежная модель, представленная сразу несколькими модификациями. Существенной технической разницы между вариациями не существует, поэтому можно смело выбирать любой асик данного поколения – Pro, Hydro, XP, а также с приставками «s», «j». Отличия заключаются в мощности (от 90 до 255 ТХ/с) и формате охлаждения (классическое воздушное или водяное). Все это – одно поколение, которое постепенно становится легендарным.","html":"Безоговорочным лидером нашего рейтинга является 19-я серия Antminer от компании BITMAIN: простая и надежная модель, представленная сразу несколькими модификациями. Существенной технической разницы между вариациями не существует, поэтому можно смело выбирать любой асик данного поколения – Pro, Hydro, XP, а также с приставками «s», «j». Отличия заключаются в мощности (от 90 до 255 ТХ/с) и формате охлаждения (классическое воздушное или водяное). Все это – одно поколение, которое постепенно становится легендарным."}$b838$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 35, 'paragraph',
       $b839${"text":"Преимущества 19-й серии – это надежность, неприхотливость и узнаваемость бренда. С продукцией BITMAIN знаком каждый сервисный центр, запчасти на Antminer продаются в любом профильном магазине, а долговечность аппаратуры проверена временем – все же Antminer S19 появился на свет в 2020 году. После халвинга многие майнеры активно обновляют свой автопарк, поэтому найти экземпляры в хорошем состоянии сегодня не составит существенного труда. Также имеется пространство для торга, так как предложение на вторичном рынке достаточно ощутимое.","html":"Преимущества 19-й серии – это надежность, неприхотливость и узнаваемость бренда. С продукцией BITMAIN знаком каждый сервисный центр, запчасти на Antminer продаются в любом профильном магазине, а долговечность аппаратуры проверена временем – все же Antminer S19 появился на свет в 2020 году. После халвинга многие майнеры активно обновляют свой автопарк, поэтому найти экземпляры в хорошем состоянии сегодня не составит существенного труда. Также имеется пространство для торга, так как предложение на вторичном рынке достаточно ощутимое."}$b839$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 36, 'stats',
       $b840${"rows":[{"label":"Производитель","value":"BITMAIN"},{"label":"Год выпуска","value":"2020"},{"label":"Хешрейт","value":"от 90 до 255 ТХ/с"},{"label":"Энергопотребление","value":"от 3 250 до 5 360 Вт"},{"label":"Энергоэффективность","value":"от 21 до 36 Вт на ТХ"},{"label":"Алгоритм","value":"SHA-256"},{"label":"Количество монет, доступных для майнинга","value":"36"},{"label":"Уровень шума","value":"82 дБ"}]}$b840$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 37, 'pros_cons',
       $b841${"pros":["Проверенная модель от лидера рынка – компании BITMAIN;","Серия надежного оборудования: всю 19-ю версию можно назвать удачной;","Отсутствие проблем с ремонтом и запчастями;","Сохранение актуальности после халвинга практически на любой розетке;","Некоторые экземпляры Antminer S19 демонстрируют хешрейт, превышающий заявленный;","Ликвидность на вторичном рынке;","Возможность покупки со скидкой из-за большого объема предложений;","Возможность разгона – существует множество оптимизированных прошивок для Antminer."],"cons":["Переплата за бренд;","Незначительная рентабельность младших модификаций на фермах с дорогой розеткой;","Вертикальный форм-фактор: требуется больше свободного пространства (особенно при использовании шумбокса);","4 вентилятора, что делает эту модель достаточно шумной."]}$b841$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 38, 'heading',
       $h842${"level":2,"text":"1 место: Antminer S21"}$h842$::jsonb,
       'antminer-s21'
FROM articles a WHERE a.slug = 'rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 39, 'paragraph',
       $b843${"text":"Antminer S21 от Bitmain уверенно занимает первое место среди подержанных ASIC-майнеров и по праву считается одной из самых актуальных моделей для добычи Bitcoin после халвинга. Эта серия получила широкое распространение благодаря удачному балансу между хешрейтом, энергопотреблением и надежностью, а также за счет масштабного присутствия на вторичном рынке.","html":"Antminer S21 от Bitmain уверенно занимает первое место среди подержанных ASIC-майнеров и по праву считается одной из самых актуальных моделей для добычи Bitcoin после халвинга. Эта серия получила широкое распространение благодаря удачному балансу между хешрейтом, энергопотреблением и надежностью, а также за счет масштабного присутствия на вторичном рынке."}$b843$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 40, 'paragraph',
       $b844${"text":"Линейка Antminer S21 включает сразу несколько модификаций: классические версии с воздушным охлаждением, более производительные Pro, а также Hydro и Immersion-варианты для профессиональных ферм. Такое разнообразие делает серию универсальной — под разные бюджеты, тарифы на электроэнергию и форматы размещения. Именно поэтому S21 часто выбирают как начинающие, так и опытные майнеры.","html":"Линейка Antminer S21 включает сразу несколько модификаций: классические версии с воздушным охлаждением, более производительные Pro, а также Hydro и Immersion-варианты для профессиональных ферм. Такое разнообразие делает серию универсальной — под разные бюджеты, тарифы на электроэнергию и форматы размещения. Именно поэтому S21 часто выбирают как начинающие, так и опытные майнеры."}$b844$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 41, 'paragraph',
       $b845${"text":"Отдельного внимания заслуживает бренд Bitmain. Это один из самых изученных и понятных производителей на рынке ASIC-оборудования. Для Antminer S21 доступны оригинальные и альтернативные прошивки, большое количество сервисных центров и запчастей. Даже при покупке б/у устройства риски ниже среднего: модель хорошо диагностируется и легко обслуживается.","html":"Отдельного внимания заслуживает бренд Bitmain. Это один из самых изученных и понятных производителей на рынке ASIC-оборудования. Для Antminer S21 доступны оригинальные и альтернативные прошивки, большое количество сервисных центров и запчастей. Даже при покупке б/у устройства риски ниже среднего: модель хорошо диагностируется и легко обслуживается."}$b845$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 42, 'paragraph',
       $b846${"text":"Еще один важный фактор популярности — массовое предложение на вторичном рынке. Antminer S21 активно использовался крупными фермами, которые регулярно обновляют парк оборудования. В результате на рынке появляется множество устройств в разном состоянии и ценовом диапазоне, что позволяет торговаться и выбирать оптимальные варианты с хорошим остаточным ресурсом.","html":"Еще один важный фактор популярности — массовое предложение на вторичном рынке. Antminer S21 активно использовался крупными фермами, которые регулярно обновляют парк оборудования. В результате на рынке появляется множество устройств в разном состоянии и ценовом диапазоне, что позволяет торговаться и выбирать оптимальные варианты с хорошим остаточным ресурсом."}$b846$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 43, 'image',
       $b847${"src":"/images/articles/used-asics/antminer-s21-b.png","alt":"Antminer S21"}$b847$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 44, 'stats',
       $b848${"rows":[{"label":"Производитель","value":"Bitmain"},{"label":"Алгоритм","value":"SHA-256"},{"label":"Хешрейт","value":"200–860 TH/s"},{"label":"Энергопотребление","value":"от 3500 Вт"},{"label":"Энергоэффективность","value":"до 13.5 J/TH"},{"label":"Доступные монеты","value":"BTC, BCH, BSV и другие"},{"label":"Охлаждение","value":"Воздушное, водяное, иммерсионное"},{"label":"Уровень шума","value":"75–80 дБ"},{"label":"Год выпуска","value":"2024–2025"}]}$b848$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 45, 'pros_cons',
       $b849${"pros":["Одна из самых популярных моделей на вторичном рынке, легко найти в продаже и сравнить несколько вариантов;","Широкий выбор модификаций: от классических до водяных и иммерсионных;","Известный и проверенный производитель Bitmain с развитой экосистемой;","Отличная ликвидность — S21 легко продать при необходимости;","Оптимальное соотношение мощности и потребления для SHA-256 после халвинга;","Большое количество информации по ремонту, настройке и оптимизации."],"cons":["Высокий уровень шума, не подходит для жилых помещений без шумозащиты;","Воздушные версии уступают Hydro и Immersion по температурному режиму;","Цена на б/у экземпляры может быть выше средней из-за высокого спроса."]}$b849$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 46, 'heading',
       $h850${"level":2,"text":"БОНУС №1: Antminer S9"}$h850$::jsonb,
       'bonus-antminer-s9'
FROM articles a WHERE a.slug = 'rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 47, 'paragraph',
       $b851${"text":"Если криптоэнтузиаст работает с бесплатным электричеством (так называемая «нулевая розетка»), майнинг становится выгодным на любом оборудовании. Но особенного внимания заслуживает легендарная 9-я серия техники Antminer от компании BITMAIN. Это действительно знаковое оборудование, так как многие майнеры начинали свой путь именно с данной аппаратуры.","html":"Если криптоэнтузиаст работает с бесплатным электричеством (так называемая «нулевая розетка»), майнинг становится выгодным на любом оборудовании. Но особенного внимания заслуживает легендарная 9-я серия техники Antminer от компании BITMAIN. Это действительно знаковое оборудование, так как многие майнеры начинали свой путь именно с данной аппаратуры."}$b851$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 48, 'paragraph',
       $b852${"text":"Antminer S9 отличается удивительной надежностью: первый асик серии появился в 2017 году, но многие экземпляры сохраняют работоспособность и по текущий момент. Пользователи называют модель неубиваемой, S9 прост в ремонте, а найти требуемые запчасти не составит существенного труда. Antminer S9 состоит из шести модификаций, есть даже версия с водяным охлаждением.","html":"Antminer S9 отличается удивительной надежностью: первый асик серии появился в 2017 году, но многие экземпляры сохраняют работоспособность и по текущий момент. Пользователи называют модель неубиваемой, S9 прост в ремонте, а найти требуемые запчасти не составит существенного труда. Antminer S9 состоит из шести модификаций, есть даже версия с водяным охлаждением."}$b852$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 49, 'image',
       $b853${"src":"/images/articles/used-asics/antminer-s9.png","alt":"Antminer S9"}$b853$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 50, 'stats',
       $b854${"rows":[{"label":"Производитель","value":"BITMAIN"},{"label":"Год выпуска","value":"2017"},{"label":"Хешрейт","value":"от 13 до 18 ТХ/с"},{"label":"Энергопотребление","value":"от 1 280 до 1 728 Вт"},{"label":"Энергоэффективность","value":"от 96 до 98 Вт на ТХ"},{"label":"Алгоритм","value":"SHA-256"},{"label":"Количество монет, доступных для майнинга","value":"36"},{"label":"Уровень шума","value":"85 дБ"}]}$b854$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 51, 'pros_cons',
       $b855${"pros":["Возможность стать обладателем данной модели практически даром;","Поразительная долговечность и неприхотливость модели;","Удачная покупка для знакомства с процессом майнинга;","Наличие запчастей и сервисных центров;","Множество вариантов на вторичном рынке."],"cons":["Актуальность только при бесплатном электричестве;","Сложно найти экземпляры в хорошем состоянии;","Низкий хешрейт при высоком потреблении – отвратительная энергоэффективность;","Высокий уровень шума."]}$b855$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 52, 'heading',
       $h856${"level":2,"text":"БОНУС №2: Antminer L3++"}$h856$::jsonb,
       'bonus-antminer-l3'
FROM articles a WHERE a.slug = 'rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 53, 'paragraph',
       $b857${"text":"Ситуация с Antminer L3++ аналогична истории с Antminer S9: это устаревшая модель, которую можно использовать только при «нулевой розетке». Разница заключается лишь в том, что S9 работает на алгоритме SHA-256, а L3++ добывает альткоины с использованием формата Scrypt. Наиболее актуальный актив – пара DOGE+LTC.","html":"Ситуация с Antminer L3++ аналогична истории с Antminer S9: это устаревшая модель, которую можно использовать только при «нулевой розетке». Разница заключается лишь в том, что S9 работает на алгоритме SHA-256, а L3++ добывает альткоины с использованием формата Scrypt. Наиболее актуальный актив – пара DOGE+LTC."}$b857$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 54, 'paragraph',
       $b858${"text":"Antminer L3++ имеет в линейке младшую модель L3+, объем добычи которой еще более скромный. Но для знакомства с майнингом и экспериментов вариант подходящий, так как незначительная стоимость такой техники оправдывает ее использование в 2024 году.","html":"Antminer L3++ имеет в линейке младшую модель L3+, объем добычи которой еще более скромный. Но для знакомства с майнингом и экспериментов вариант подходящий, так как незначительная стоимость такой техники оправдывает ее использование в 2024 году."}$b858$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 55, 'image',
       $b859${"src":"/images/articles/used-asics/antminer-l3.png","alt":"Antminer L3+"}$b859$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 56, 'stats',
       $b860${"rows":[{"label":"Производитель","value":"BITMAIN"},{"label":"Год выпуска","value":"2017"},{"label":"Хешрейт","value":"от 504 до 580 МХ/с"},{"label":"Энергопотребление","value":"от 800 до 940 Вт"},{"label":"Энергоэффективность","value":"от 1,5 до 1,6 Вт на МХ"},{"label":"Алгоритм","value":"Scrypt"},{"label":"Количество монет, доступных для майнинга","value":"22"},{"label":"Уровень шума","value":"70 дБ"}]}$b860$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 57, 'pros_cons',
       $b861${"pros":["Предельно низкая стоимость;","Доступность запчастей и сервиса;","Недорогой формат для знакомства с майнингом;","Низкий объем потребления."],"cons":["Морально и технически устаревшая модель;","Сложность поиска достойных вариантов в хорошем состоянии;","Работа с нестабильными альткоинами, отличающимися повышенной волатильностью."]}$b861$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 58, 'heading',
       $h862${"level":2,"text":"Выводы"}$h862$::jsonb,
       'vyvody'
FROM articles a WHERE a.slug = 'rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 59, 'paragraph',
       $b863${"text":"Покупка б/у асика сравнима с приобретением подержанного автомобиля: можно сэкономить и ездить долго, а можно попасть на дорогостоящий ремонт.","html":"Покупка б/у асика сравнима с приобретением подержанного автомобиля: можно сэкономить и ездить долго, а можно попасть на дорогостоящий ремонт."}$b863$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 60, 'paragraph',
       $b864${"text":"Покупать стоит, если:","html":"Покупать стоит, если:"}$b864$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 61, 'list',
       $b865${"ordered":false,"items":["У вас ограниченный бюджет;","Вы понимаете, как устроен майнинг;","Есть доступ к дешевой электроэнергии;","Вы умеете проверять технику или готовы нанять специалиста;","Вы покупаете у проверенного продавца."]}$b865$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 62, 'paragraph',
       $b866${"text":"Не стоит смотреть б/у, если:","html":"Не стоит смотреть б/у, если:"}$b866$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 63, 'list',
       $b867${"ordered":false,"items":["Вы новичок и не разбираетесь в технических деталях;","Нет возможности проверить оборудование;","Нет дешевой электроэнергии – окупаемость станет дольше;","Продавец вызывает сомнения."]}$b867$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 64, 'paragraph',
       $b868${"text":"Главное правило: лучше заплатить немного больше за проверенный и исправный подержанный ASIC, чем купить «дешевый кирпич».","html":"Главное правило: лучше заплатить немного больше за проверенный и исправный подержанный ASIC, чем купить «дешевый кирпич»."}$b868$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke';

-- Blocks: kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga
INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 1, 'heading',
       $h869${"level":2,"text":"Введение"}$h869$::jsonb,
       'vvedenie'
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 2, 'paragraph',
       $b870${"text":"Покупка асика – это серьезная инвестиция, требующая продуманного подхода. И один из ключевых факторов, который напрямую влияет на успех майнингового проекта – выбор бренда-производителя устройства. Сегодня мы познакомимся с тематикой выбора бренда майнера, а также изучим ключевых участников рынка майнингового оборудования.","html":"Покупка асика – это серьезная инвестиция, требующая продуманного подхода. И один из ключевых факторов, который напрямую влияет на успех майнингового проекта – выбор бренда-производителя устройства. Сегодня мы познакомимся с тематикой выбора бренда майнера, а также изучим ключевых участников рынка майнингового оборудования."}$b870$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 3, 'image',
       $b871${"src":"/images/articles/asic-manufacturers/circuit-board.png","alt":"Чип и платы ASIC-майнера"}$b871$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 4, 'heading',
       $h872${"level":2,"text":"Как выбрать производителя асиков и на что это влияет?"}$h872$::jsonb,
       'kak-vybrat-proizvoditelya'
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 5, 'paragraph',
       $b873${"text":"На первый взгляд все ASIC-и похожи: корпус, шумные вентиляторы, цифры в характеристиках. Но на практике именно бренд определяет:","html":"На первый взгляд все ASIC-и похожи: корпус, шумные вентиляторы, цифры в характеристиках. Но на практике именно бренд определяет:"}$b873$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 6, 'list',
       $b874${"ordered":false,"items":["Как долго устройство проработает;","Насколько быстро решится гарантийный вопрос;","Как легко будет найти запчасти;","Какая общая доходность вас ждет."]}$b874$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 7, 'paragraph',
       $b875${"text":"Разберем подробно, что именно зависит от правильного выбора производителя.","html":"Разберем подробно, что именно зависит от правильного выбора производителя."}$b875$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 8, 'rich_list',
       $b876${"ordered":false,"items":[{"title":"Надежность оборудования","text":"Что это значит: качественные бренды используют лучшие комплектующие, проверенные технологии охлаждения и сборки. Почему это важно: асик работает 24/7 в условиях высокой нагрузки и температуры. Надежное оборудование снижает риск поломок, простоя, потери дохода. Примеры: Bitmain славится высокой стабильностью моделей Antminer. WhatsMiner от MicroBT показывает отличную выносливость на длительных дистанциях;"},{"title":"Репутация производителя","text":"Что это значит: бренды с хорошей репутацией ценят своих клиентов и стремятся производить действительно качественные устройства. Почему это важно: надежная репутация снижает риск столкнуться с бракованным товаром, недобросовестной гарантией или несоответствием характеристик. Примеры: Bitmain и MicroBT — лидеры рынка с многолетним опытом. Молодые бренды без репутации могут привлекать ценой, но часто вызывают вопросы по качеству;"},{"title":"Условия гарантии и поддержки","text":"Что это значит: уважающие себя производители дают официальную гарантию и быстро обрабатывают гарантийные случаи. Почему это важно: при выходе асика из строя в первые месяцы гарантия – ваша защита от убытков. Примеры: Bitmain предлагает стандартную гарантию на 6 месяцев. MicroBT предлагает расширенную поддержку для некоторых моделей;"},{"title":"Наличие сервисных центров","text":"Что это значит: официальные или партнерские сервисные центры позволяют быстро и качественно ремонтировать оборудование. Почему это важно: отправка майнера в Китай или отсутствие ремонта в вашем регионе могут сделать обслуживание нерентабельным. Примеры: Bitmain имеет авторизованные сервисные центры в Азии, Европе и США. Некоторые производители работают через локальных партнеров, ускоряя процесс ремонта;"},{"title":"Доступность запчастей","text":"Что это значит: наличие в продаже вентиляторов, контроллеров, чипов, блоков питания для майнера. Почему это важно: мелкие ремонты без замены всего устройства могут существенно продлить срок службы ASIC. Примеры: для Antminer можно легко найти любые комплектующие. Редкие модели от малоизвестных брендов часто «умирают» без возможности восстановления;"},{"title":"Отзывы пользователей и сообществ","text":"Что это значит: реальные мнения майнеров, обсуждения на форумах, ютуб-обзоры дают реальное понимание плюсов и минусов моделей. Почему это важно: бренд с реальными отзывами – это меньше риск купить «кота в мешке»;"},{"title":"Возможность перепрошивки и настройки","text":"Что это значит: возможность безопасно обновить ПО устройства, разгонять, оптимизировать энергопотребление. Почему это важно: прошивки могут существенно повысить доходность или стабильность работы майнера. Примеры: Antminer имеет множество прошивок от сторонних разработчиков (например, Braiins OS). Некоторые ASIC-и не поддерживают сторонние обновления, что ограничивает возможности пользователя."}]}$b876$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 9, 'paragraph',
       $b877${"text":"Выбор правильного производителя асика – это инвестиция в долгосрочную надежность, стабильность дохода и спокойствие. Познакомимся с перечнем доступных брендов, чтобы совершить грамотное приобретение.","html":"Выбор правильного производителя асика – это инвестиция в долгосрочную надежность, стабильность дохода и спокойствие. Познакомимся с перечнем доступных брендов, чтобы совершить грамотное приобретение."}$b877$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 10, 'heading',
       $h878${"level":2,"text":"10 место: Goldshell"}$h878$::jsonb,
       'goldshell'
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 11, 'paragraph',
       $b879${"text":"В 2017 году появилась на свет компания Goldshell, специализирующаяся на производстве оборудования для майнинга. Бренд хорошо известен на рынке добычи криптовалют, однако навязать конкурентную борьбу лидерам майнинга на SHA-256 ему не удалось. Это заставило руководство Goldshell искать альтернативные пути развития: именно так китайский производитель начал разработку оборудования для получения специфических монет на разнообразных блокчейнах. Сегодня техника Goldshell успешно добывает токены на алгоритмах Blake2s, Scrypt, Eaglesong, Blake2B-Sia, Lbry, CryptoNightR и Eaglesong.","html":"В 2017 году появилась на свет компания Goldshell, специализирующаяся на производстве оборудования для майнинга. Бренд хорошо известен на рынке добычи криптовалют, однако навязать конкурентную борьбу лидерам майнинга на SHA-256 ему не удалось. Это заставило руководство Goldshell искать альтернативные пути развития: именно так китайский производитель начал разработку оборудования для получения специфических монет на разнообразных блокчейнах. Сегодня техника Goldshell успешно добывает токены на алгоритмах Blake2s, Scrypt, Eaglesong, Blake2B-Sia, Lbry, CryptoNightR и Eaglesong."}$b879$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 12, 'paragraph',
       $b880${"text":"Наибольшую популярность компания Goldshell обрела на рынке Азии, но и в России данного производителя отлично знают. Тем не менее, технику данного бренда сложно назвать популярной в СНГ, так как добыча альтов всегда сопряжена с рисками. Но заказать асики все же можно, и в первую очередь это актуально для моделей, добывающих Kadena на алгоритме Blake2s. Потенциал этой валюты изведан не до конца, поэтому перспективы ее добычи остаются весьма ощутимыми.","html":"Наибольшую популярность компания Goldshell обрела на рынке Азии, но и в России данного производителя отлично знают. Тем не менее, технику данного бренда сложно назвать популярной в СНГ, так как добыча альтов всегда сопряжена с рисками. Но заказать асики все же можно, и в первую очередь это актуально для моделей, добывающих Kadena на алгоритме Blake2s. Потенциал этой валюты изведан не до конца, поэтому перспективы ее добычи остаются весьма ощутимыми."}$b880$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 13, 'image',
       $b881${"src":"/images/articles/asic-manufacturers/goldshell.png","alt":"Goldshell BOX Series"}$b881$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 14, 'stats',
       $b882${"rows":[{"label":"Страна производителя","value":"Китай"},{"label":"Дата основания","value":"2017"},{"label":"Бренд","value":"Goldshell"},{"label":"Устройств в модельном ряде","value":"более 20"},{"label":"Какой асик купить","value":"Goldshell KD5 (майнинг KDA с оптимальной энергоэффективностью)"},{"label":"Какой асик лучше (ТОПовая модель)","value":"Goldshell KD6 на 26,3 ТХ/с"},{"label":"Алгоритмы асиков","value":"Blake2s, Scrypt, Eaglesong, Blake2B-Sia, Lbry, CryptoNightR и Eaglesong"}]}$b882$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 15, 'heading',
       $h883${"level":2,"text":"9 место: SealMiner"}$h883$::jsonb,
       'sealminer'
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 16, 'paragraph',
       $b884${"text":"SealMiner — это молодой бренд (основан в 2024 году), но за ним стоит инфраструктура, опыт и репутация Bitdeer, что делает его одним из самых обсуждаемых и многообещающих участников рынка ASIC-оборудования. SealMiner сосредоточен на производстве асиков под алгоритм SHA-256, а значит его предназначение – майнинг Bitcoin. Но если многие компании стремятся просто нарастить хешрейт, SealMiner делает ставку на энергоэффективность и технологии охлаждения.","html":"SealMiner — это молодой бренд (основан в 2024 году), но за ним стоит инфраструктура, опыт и репутация Bitdeer, что делает его одним из самых обсуждаемых и многообещающих участников рынка ASIC-оборудования. SealMiner сосредоточен на производстве асиков под алгоритм SHA-256, а значит его предназначение – майнинг Bitcoin. Но если многие компании стремятся просто нарастить хешрейт, SealMiner делает ставку на энергоэффективность и технологии охлаждения."}$b884$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 17, 'paragraph',
       $b885${"text":"SealMiner — это производитель, который пришел не просто продавать майнеры, а внедрять инженерные решения, способные менять экономику добычи BTC. Комбинация энергоэффективности, продуманной системы охлаждения и поддержки от Bitdeer делает бренд особенно привлекательным для тех, кто рассматривает долгосрочное инвестирование в майнинг.","html":"SealMiner — это производитель, который пришел не просто продавать майнеры, а внедрять инженерные решения, способные менять экономику добычи BTC. Комбинация энергоэффективности, продуманной системы охлаждения и поддержки от Bitdeer делает бренд особенно привлекательным для тех, кто рассматривает долгосрочное инвестирование в майнинг."}$b885$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 18, 'image',
       $b886${"src":"/images/articles/asic-manufacturers/sealminer.png","alt":"SealMiner / Bitdeer"}$b886$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 19, 'stats',
       $b887${"rows":[{"label":"Страна производителя","value":"США"},{"label":"Дата основания","value":"2024 год"},{"label":"Бренд","value":"SealMiner"},{"label":"Количество устройств в линейке","value":"около 10"},{"label":"Какой ASIC купить","value":"SealMiner A3 (оптимален по эффективности и уровню хешрейта)"},{"label":"Какой ASIC лучше (ТОП-модель)","value":"Sealminer A3 Pro Hydro на 660 Th/s"},{"label":"Алгоритмы ASIC","value":"SHA-256"}]}$b887$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 20, 'pros_cons',
       $b888${"pros":["Один из лучших показателей энергоэффективности на рынке;","Поддержка воздушного и водяного охлаждения – выбор под инфраструктуру;","Подходит как для крупных ферм, так и профессиональных майнеров;","Низкий уровень шума относительно мощности;","Прямая поддержка и технологическая база Bitdeer."],"cons":["Молодой бренд, который еще только формирует репутацию на практике;","Высокая стоимость оборудования, характерная для премиум-сегмента;","Ограниченная доступность в продаже и возможные очереди на поставку."]}$b888$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 21, 'heading',
       $h889${"level":2,"text":"8 место: IceRiver"}$h889$::jsonb,
       'iceriver'
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 22, 'paragraph',
       $b890${"text":"Китайская компания IceRiver уникальна в своем роде: модельный ряд производителя состоит из шести устройств, которые были разработаны для добычи одной единственной монеты – KASPA на алгоритме kHeavyHash. Молодой производитель решил не конкурировать с именитыми брендами, а просто пошел своей дорогой, избрав бесконкурентную сферу KASPA. Таким образом, если майнер принимает решение добывать этот токен, ему не придется выбирать среди многочисленных производителей, так как вариант на рынке только один.","html":"Китайская компания IceRiver уникальна в своем роде: модельный ряд производителя состоит из шести устройств, которые были разработаны для добычи одной единственной монеты – KASPA на алгоритме kHeavyHash. Молодой производитель решил не конкурировать с именитыми брендами, а просто пошел своей дорогой, избрав бесконкурентную сферу KASPA. Таким образом, если майнер принимает решение добывать этот токен, ему не придется выбирать среди многочисленных производителей, так как вариант на рынке только один."}$b890$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 23, 'paragraph',
       $b891${"text":"С одной стороны небольшая конкуренция в нише интересна не только производителю IceRiver, но и майнерам, так как небольшая сложность сети позволяет зарабатывать больше. Но с другой – появляются дополнительные риски в виде скама монеты или серьезного падения курса: в этом случае оборудование для получения KASPA превратится в груду металла. Причем, весьма дорогостоящую.","html":"С одной стороны небольшая конкуренция в нише интересна не только производителю IceRiver, но и майнерам, так как небольшая сложность сети позволяет зарабатывать больше. Но с другой – появляются дополнительные риски в виде скама монеты или серьезного падения курса: в этом случае оборудование для получения KASPA превратится в груду металла. Причем, весьма дорогостоящую."}$b891$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 24, 'image',
       $b892${"src":"/images/articles/asic-manufacturers/iceriver.png","alt":"IceRiver"}$b892$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 25, 'stats',
       $b893${"rows":[{"label":"Страна производителя","value":"Китай"},{"label":"Дата основания","value":"Нет данных"},{"label":"Бренд","value":"IceRiver"},{"label":"Устройств в модельном ряде","value":"6"},{"label":"Какой асик купить","value":"IceRiver KAS KS2 (оптимально по соотношению стоимости оборудования к производительности)"},{"label":"Какой асик лучше (ТОПовая модель)","value":"IceRiver KAS KS2 на 8 ТХ/с"},{"label":"Алгоритмы асиков","value":"kHeavyHash"}]}$b893$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 26, 'pros_cons',
       $b894${"pros":["Малоконкурентная сфера – возможность зарабатывать больше, чем на других алгоритмах;","Отсутствие проблемы выбора производителя: майнинг KASPA возможен только на асиках от IceRiver."],"cons":["Молодой и непроверенный производитель;","Риски майнинга не самых популярных монет;","Возможность добычи лишь одного токена;","Высокая стоимость ТОПовых моделей."]}$b894$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 27, 'heading',
       $h895${"level":2,"text":"7 место: Sunlune Technology"}$h895$::jsonb,
       'sunlune'
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 28, 'paragraph',
       $b896${"text":"Название Sunlune Technology практически ни о чем не говорит отечественным майнерам, так как компания лишь недавно вышла на рынок майнинга. Более узнаваемо звучит бренд асиков, под которым китайский производитель выпускает технику – Jasminer. Речь идет про линейку аппаратуры для добычи альткоинов: Jasminer работают на алгоритмах EtHash и EtcHash, что позволяет добывать около четырех десятков монет.","html":"Название Sunlune Technology практически ни о чем не говорит отечественным майнерам, так как компания лишь недавно вышла на рынок майнинга. Более узнаваемо звучит бренд асиков, под которым китайский производитель выпускает технику – Jasminer. Речь идет про линейку аппаратуры для добычи альткоинов: Jasminer работают на алгоритмах EtHash и EtcHash, что позволяет добывать около четырех десятков монет."}$b896$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 29, 'paragraph',
       $b897${"text":"Продукция Jasminer обращает на себя внимание отличными показателями энергоэффективности – это одно из лучших значений на рынке. Кроме того, есть модели и для домашней эксплуатации с небольшим объемом потребления и низким уровнем шума. И это уже не компактные iPollo, а производительные асики мощностью около 2 000 МХ/с. Данный фактор является причиной ощутимой популярности Jasminer среди майнеров даже несмотря на небольшую известность бренда.","html":"Продукция Jasminer обращает на себя внимание отличными показателями энергоэффективности – это одно из лучших значений на рынке. Кроме того, есть модели и для домашней эксплуатации с небольшим объемом потребления и низким уровнем шума. И это уже не компактные iPollo, а производительные асики мощностью около 2 000 МХ/с. Данный фактор является причиной ощутимой популярности Jasminer среди майнеров даже несмотря на небольшую известность бренда."}$b897$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 30, 'image',
       $b898${"src":"/images/articles/asic-manufacturers/jasminer.png","alt":"Jasminer X16-Q Pro"}$b898$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 31, 'stats',
       $b899${"rows":[{"label":"Страна производителя","value":"Китай"},{"label":"Дата основания","value":"Нет данных"},{"label":"Бренд","value":"Jasminer"},{"label":"Устройств в модельном ряде","value":"до 10"},{"label":"Какой асик купить","value":"Jasminer X16-Q (комфортный домашний майнинг – 1 950 МХ/с, 620 Ватт потребления и всего 40 дБ шума)"},{"label":"Какой асик лучше (ТОПовая модель)","value":"Jasminer X16-P на 5 800 МХ/с"},{"label":"Алгоритмы асиков","value":"EtHash, EtcHash"}]}$b899$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 32, 'pros_cons',
       $b900${"pros":["Формат полноценного домашнего майнинга;","Один из лучших параметров энергоэффективности на рынке."],"cons":["Малоизвестный производитель;","Высокая стоимость оборудования;","Сложности с ремонтом и обслуживанием."]}$b900$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 33, 'heading',
       $h901${"level":2,"text":"6 место: iPollo"}$h901$::jsonb,
       'ipollo'
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 34, 'paragraph',
       $b902${"text":"Сингапурская компания iPollo – одна из наиболее молодых в нашем рейтинге: бренд был основан в 2022 году и за небольшой промежуток времени громко заявил о себе мировой общественности. Несмотря на полноценную линейку оборудования, особое внимание обращает на себя модель V1 Mini, созданная специально для домашнего майнинга. Пять устройств серии отличаются низким объемом потребления и практически бесшумной работой, что возможно в том числе благодаря ориентации на алгоритм Ethash.","html":"Сингапурская компания iPollo – одна из наиболее молодых в нашем рейтинге: бренд был основан в 2022 году и за небольшой промежуток времени громко заявил о себе мировой общественности. Несмотря на полноценную линейку оборудования, особое внимание обращает на себя модель V1 Mini, созданная специально для домашнего майнинга. Пять устройств серии отличаются низким объемом потребления и практически бесшумной работой, что возможно в том числе благодаря ориентации на алгоритм Ethash."}$b902$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 35, 'paragraph',
       $b903${"text":"В целом, фокус продукции iPollo сделан именно на этот алгоритм, в то время как другие стандарты представлены больше в экспериментальном формате. Например, есть один асик для добычи BTC, а также модель для работы с Cuckatoo32 (монета GRIN). Можно обратить внимание на классические асики под Ethash – здесь iPollo выглядят конкурентоспособными, но молодость бренда может отпугнуть многих покупателей.","html":"В целом, фокус продукции iPollo сделан именно на этот алгоритм, в то время как другие стандарты представлены больше в экспериментальном формате. Например, есть один асик для добычи BTC, а также модель для работы с Cuckatoo32 (монета GRIN). Можно обратить внимание на классические асики под Ethash – здесь iPollo выглядят конкурентоспособными, но молодость бренда может отпугнуть многих покупателей."}$b903$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 36, 'image',
       $b904${"src":"/images/articles/asic-manufacturers/ipollo.png","alt":"iPollo"}$b904$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 37, 'stats',
       $b905${"rows":[{"label":"Страна производителя","value":"Сингапур"},{"label":"Дата основания","value":"2022 год"},{"label":"Бренд","value":"iPollo"},{"label":"Устройств в модельном ряде","value":"до 20"},{"label":"Какой асик купить","value":"iPollo V1 Mini (компактный, бесшумный и не прожорливый асик для домашнего майнинга)"},{"label":"Какой асик лучше (ТОПовая модель)","value":"Ipollo G1 на алгоритме Cuckatoo32 для добычи монеты Grin"},{"label":"Алгоритмы асиков","value":"SHA-256, Ethash, Cuckatoo32"}]}$b905$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 38, 'pros_cons',
       $b906${"pros":["Интересная линейка V1 Mini для домашнего майнинга;","Цены ниже, чем у конкурентов;","Стремительно развивающаяся компания, которой удалось громко заявить о себе за небольшой промежуток времени;","Работа с экспериментальными форматами, например, наличие асика на Cuckatoo32."],"cons":["Техника от молодого бренда, не проверенная временем;","Трудности с ремонтом и приобретением комплектующих."]}$b906$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 39, 'heading',
       $h907${"level":2,"text":"5 место: Innosilicon"}$h907$::jsonb,
       'innosilicon'
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 40, 'paragraph',
       $b908${"text":"Начало существования компании Innosilicon было положено в 2006 году – тогда китайский бренд занимался производством полупроводников для компьютерной и ИТ-отраслей. Позже с появлением института майнинга бренд переключил свое внимание на выпуск техники для добычи криптовалют, чем Innosilicon зарабатывает и сегодня. Но несмотря на впечатляющий опыт, традиции и знание ниши, модельный ряд бренда в последние годы начал проигрывать борьбу конкурентам, уступая позиции более современным производителям.","html":"Начало существования компании Innosilicon было положено в 2006 году – тогда китайский бренд занимался производством полупроводников для компьютерной и ИТ-отраслей. Позже с появлением института майнинга бренд переключил свое внимание на выпуск техники для добычи криптовалют, чем Innosilicon зарабатывает и сегодня. Но несмотря на впечатляющий опыт, традиции и знание ниши, модельный ряд бренда в последние годы начал проигрывать борьбу конкурентам, уступая позиции более современным производителям."}$b908$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 41, 'paragraph',
       $b909${"text":"Причиной падающей популярности Innosilicon являются проблемы с энергоэффективностью устройств, что негативным образом сказывается на сроках окупаемости оборудования. Вероятно, именно по этой причине компания практически отказалась от работы с алгоритмом SHA-256, обратив свое внимание на аппаратуру для майнинга альткоинов. Сегодня Innosilicon предлагает устройства не только для BTC, но и асики на алгоритмах Equihash, Ethash и Scrypt.","html":"Причиной падающей популярности Innosilicon являются проблемы с энергоэффективностью устройств, что негативным образом сказывается на сроках окупаемости оборудования. Вероятно, именно по этой причине компания практически отказалась от работы с алгоритмом SHA-256, обратив свое внимание на аппаратуру для майнинга альткоинов. Сегодня Innosilicon предлагает устройства не только для BTC, но и асики на алгоритмах Equihash, Ethash и Scrypt."}$b909$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 42, 'image',
       $b910${"src":"/images/articles/asic-manufacturers/innosilicon.png","alt":"Innosilicon"}$b910$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 43, 'stats',
       $b911${"rows":[{"label":"Страна производителя","value":"Китай"},{"label":"Дата основания","value":"2006 год"},{"label":"Бренд","value":"Innosilicon"},{"label":"Устройств в модельном ряде","value":"до 15"},{"label":"Какой асик купить","value":"Innosilicon A11 Pro (один из немногих асиков компании, работающий с ощутимой выгодой на рынке)"},{"label":"Какой асик лучше (ТОПовая модель)","value":"Innosilicon A11 Pro мощностью 1 500 МХ/с"},{"label":"Алгоритмы асиков","value":"SHA-256, Equihash, Ethash и Scrypt"}]}$b911$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 44, 'pros_cons',
       $b912${"pros":["Старейший бренд с богатой историей;","Недорогая продукция;","Хороший уровень надежности;","Множество алгоритмов работы."],"cons":["Скромная энергоэффективность оборудования;","Отсутствие действительно выгодных моделей (особенно для BTC);","Стратегические ошибки и как результат – утрата позиций в конкурентной борьбе."]}$b912$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 45, 'heading',
       $h913${"level":2,"text":"4 место: Canaan"}$h913$::jsonb,
       'canaan'
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 46, 'paragraph',
       $b914${"text":"По неофициальным данным первый в мире асик был разработан в 2013 году именно китайской компанией Canaan в год своего основания. Несмотря на инновационный подход к добыче и постоянному развитию, этот изготовитель находится в тени своих более популярных соперников, хотя техника AvalonMiner (собственный бренд Canaan) является вполне конкурентоспособной. Продукция компании никогда не находилась на первых строчках рейтингов по совокупному объему продаж, но это не мешает фирме выпускать современные и энергоэффективные асики.","html":"По неофициальным данным первый в мире асик был разработан в 2013 году именно китайской компанией Canaan в год своего основания. Несмотря на инновационный подход к добыче и постоянному развитию, этот изготовитель находится в тени своих более популярных соперников, хотя техника AvalonMiner (собственный бренд Canaan) является вполне конкурентоспособной. Продукция компании никогда не находилась на первых строчках рейтингов по совокупному объему продаж, но это не мешает фирме выпускать современные и энергоэффективные асики."}$b914$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 47, 'paragraph',
       $b915${"text":"Canaan специализируется на технике с алгоритмом SHA-256: модельный ряд AvalonMiner состоит почти из 20 устройств, а их стоимость несколько ниже аналогов у конкурентов. Наиболее производительной сегодня является 14-я серия от Canaan: например, модель A1466 демонстрирует мощность 150 TХ/с. Производитель не стремится ставить рекорды хешрейта, так как выиграть конкурентную борьбу у именитых брендов в этом сегменте крайне сложно. Поэтому ключевой рынок для Canaan – это асики начального уровня и продукция среднего класса.","html":"Canaan специализируется на технике с алгоритмом SHA-256: модельный ряд AvalonMiner состоит почти из 20 устройств, а их стоимость несколько ниже аналогов у конкурентов. Наиболее производительной сегодня является 14-я серия от Canaan: например, модель A1466 демонстрирует мощность 150 TХ/с. Производитель не стремится ставить рекорды хешрейта, так как выиграть конкурентную борьбу у именитых брендов в этом сегменте крайне сложно. Поэтому ключевой рынок для Canaan – это асики начального уровня и продукция среднего класса."}$b915$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 48, 'image',
       $b916${"src":"/images/articles/asic-manufacturers/canaan.png","alt":"Canaan AvalonMiner"}$b916$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 49, 'stats',
       $b917${"rows":[{"label":"Страна производителя","value":"Китай"},{"label":"Дата основания","value":"2013 год"},{"label":"Бренд","value":"AvalonMiner"},{"label":"Устройств в модельном ряде","value":"до 20"},{"label":"Какой асик купить","value":"Avalon A1346 (мощный и относительно недорогой майнер для добычи BTC)"},{"label":"Какой асик лучше (ТОПовая модель)","value":"Avalon A16XP на 300 TH/s"},{"label":"Алгоритмы асиков","value":"SHA-256"}]}$b917$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 50, 'pros_cons',
       $b918${"pros":["Один из старейших производителей асиков с богатыми традициями;","Неофициальное звание первопроходца, выпустившего первый в мире асик;","Хорошая надежность техники;","Стоимость оборудования ниже, чем у конкурентов."],"cons":["Пользователи жалуются на снижение заявленной производительности чипов со временем;","Дорогостоящий ремонт и возможные проблемы с комплектующими."]}$b918$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 51, 'heading',
       $h919${"level":2,"text":"3 место: ElphaPex"}$h919$::jsonb,
       'elphapex'
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 52, 'paragraph',
       $b920${"text":"ElphaPex — это не громогласный лидер рынка, но уверенный игрок, который постепенно собирает вокруг себя сообщество майнеров, ценящих практичность, энергоэффективность и стабильную работу оборудования. Особенно бренд интересен тем, кто видит перспективу в долгосрочной добыче Litecoin и Dogecoin, где узкая специализация иногда важнее многофункциональности. Этот производитель специализируется исключительно на ASIC-устройствах под алгоритм Scrypt, а значит, его техника предназначена для добычи самых популярных монет семейства: Litecoin и Dogecoin.","html":"ElphaPex — это не громогласный лидер рынка, но уверенный игрок, который постепенно собирает вокруг себя сообщество майнеров, ценящих практичность, энергоэффективность и стабильную работу оборудования. Особенно бренд интересен тем, кто видит перспективу в долгосрочной добыче Litecoin и Dogecoin, где узкая специализация иногда важнее многофункциональности. Этот производитель специализируется исключительно на ASIC-устройствах под алгоритм Scrypt, а значит, его техника предназначена для добычи самых популярных монет семейства: Litecoin и Dogecoin."}$b920$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 53, 'paragraph',
       $b921${"text":"Сосредоточенность на узкой нише позволяет компании тщательно отточить параметры оборудования: баланс мощности, энергоэффективность и стабильная работа стали ключевой философией разработчиков. ElphaPex активно поддерживает пользователей: фирменная гарантия, доступность сервисов и техническая поддержка — это не маркетинговая надпись, а рабочий инструмент бренда в борьбе за доверие комьюнити.","html":"Сосредоточенность на узкой нише позволяет компании тщательно отточить параметры оборудования: баланс мощности, энергоэффективность и стабильная работа стали ключевой философией разработчиков. ElphaPex активно поддерживает пользователей: фирменная гарантия, доступность сервисов и техническая поддержка — это не маркетинговая надпись, а рабочий инструмент бренда в борьбе за доверие комьюнити."}$b921$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 54, 'image',
       $b922${"src":"/images/articles/asic-manufacturers/elphapex.png","alt":"ElphaPex Miner"}$b922$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 55, 'stats',
       $b923${"rows":[{"label":"Страна производителя","value":"Китай"},{"label":"Дата основания","value":"2005"},{"label":"Бренд","value":"ElphaPex"},{"label":"Количество устройств в линейке","value":"около 10"},{"label":"Какой ASIC купить","value":"ElphaPex DG Home 1 (эффективный майнер Scrypt для дома и фермы)"},{"label":"Какой ASIC лучше (ТОП-модель)","value":"ElphaPex DG2 на 20 000 Mh/s"},{"label":"Алгоритмы ASIC","value":"Scrypt"}]}$b923$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 56, 'pros_cons',
       $b924${"pros":["Сосредоточенность на алгоритме Scrypt и оптимизация оборудования под LTC и DOGE;","Высокая энергоэффективность по сравнению с аналогами;","Полноценная гарантия и техническая поддержка;","Есть асики как на водяном, так и воздушном охлаждении."],"cons":["Узкая специализация: оборудование подходит только для майнинга на Scrypt;","Молодой бренд, который пока не доказал надежность временем;","Ограниченный выбор моделей в сравнении с гигантами индустрии."]}$b924$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 57, 'heading',
       $h925${"level":2,"text":"2 место: MicroBT"}$h925$::jsonb,
       'microbt'
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 58, 'paragraph',
       $b926${"text":"Основателем компании MicroBT является инженер Ян Цзосин, который до 2016 года работал в BITMAIN, а затем принял решение создать собственное предприятие по производству техники для майнинга. Примечательно, что Ян Цзосин является непосредственным участником разработки модели Antminer S9, поэтому его личность можно назвать культовой для мира майнинга. Тем не менее, дороги BITMAIN и специалиста разошлись – так на свет появился новый участник рынка.","html":"Основателем компании MicroBT является инженер Ян Цзосин, который до 2016 года работал в BITMAIN, а затем принял решение создать собственное предприятие по производству техники для майнинга. Примечательно, что Ян Цзосин является непосредственным участником разработки модели Antminer S9, поэтому его личность можно назвать культовой для мира майнинга. Тем не менее, дороги BITMAIN и специалиста разошлись – так на свет появился новый участник рынка."}$b926$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 59, 'paragraph',
       $b927${"text":"Продукция MicroBT выпускается под брендом Whatsminer – марка, которая не только хорошо знакома майнерам, но и является эталоном надежности. Продукция Whatsminer уверенно занимает почетное второе место в сегменте техники для майнинга, а легендарную линейку моделей Whatsminer M21S знает каждый. Самым производительным асиком компании сегодня является Whatsminer M53S++ на 320 TХ/с. Стоит отметить, что MicroBT по сей день является прямым конкурентом BITMAIN, поэтому ассортимент обоих брендов схож.","html":"Продукция MicroBT выпускается под брендом Whatsminer – марка, которая не только хорошо знакома майнерам, но и является эталоном надежности. Продукция Whatsminer уверенно занимает почетное второе место в сегменте техники для майнинга, а легендарную линейку моделей Whatsminer M21S знает каждый. Самым производительным асиком компании сегодня является Whatsminer M53S++ на 320 TХ/с. Стоит отметить, что MicroBT по сей день является прямым конкурентом BITMAIN, поэтому ассортимент обоих брендов схож."}$b927$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 60, 'image',
       $b928${"src":"/images/articles/asic-manufacturers/microbt-whatsminer.png","alt":"MicroBT WhatsMiner"}$b928$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 61, 'stats',
       $b929${"rows":[{"label":"Страна производителя","value":"Китай"},{"label":"Дата основания","value":"2016 год"},{"label":"Бренд","value":"Whatsminer"},{"label":"Устройств в модельном ряде","value":"более 20"},{"label":"Какой асик купить","value":"Whatsminer M50 (бестселлер бренда на сегодняшний день)"},{"label":"Какой асик лучше (ТОПовая модель)","value":"WhatsMiner M63S++ 464 Тх/с"},{"label":"Алгоритмы асиков","value":"SHA-256"}]}$b929$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 62, 'pros_cons',
       $b930${"pros":["Второй по популярности мировой бренд;","Репутация производителя качественной и надежной техники;","Достойный модельный ряд;","Доступность запчастей и сервисных центров."],"cons":["Переплата за бренд;","По отзывам пользователей, асики Whatsminer отличаются повышенным уровнем шума по сравнению с конкурентами."]}$b930$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 63, 'heading',
       $h931${"level":2,"text":"1 место: BITMAIN"}$h931$::jsonb,
       'bitmain'
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 64, 'paragraph',
       $b932${"text":"Китайская компания BITMAIN была основана в 2013 году, а сегодня производитель удерживает 75-процентную долю рынка по продаже и обслуживанию техники для майнинга. Головное предприятие располагается в Пекине, а представительства бренда ведут свою деятельность в Сингапуре, Гонконге и США. Продукция BITMAIN известна майнерам под названием Antminer – это более двух десятков моделей, используемых для добычи BTC, ETC, LTC, DOGE, KDA и других монет на алгоритмах SHA-256, Scrypt, Kadena и EtHash.","html":"Китайская компания BITMAIN была основана в 2013 году, а сегодня производитель удерживает 75-процентную долю рынка по продаже и обслуживанию техники для майнинга. Головное предприятие располагается в Пекине, а представительства бренда ведут свою деятельность в Сингапуре, Гонконге и США. Продукция BITMAIN известна майнерам под названием Antminer – это более двух десятков моделей, используемых для добычи BTC, ETC, LTC, DOGE, KDA и других монет на алгоритмах SHA-256, Scrypt, Kadena и EtHash."}$b932$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 65, 'paragraph',
       $b933${"text":"Первой моделью асика от компании BITMAIN является Antminer S1, выпущенный в 2013 году. Сегодня совокупный модельный ряд производителя насчитывает более двух десятков вариантов техники, включая современные Antminer T21, Antminer S21 и даже Antminer S21 Hyd с водяным охлаждением. А легендарными моделями BITMAIN являются «неубиваемые» Antminer S9, а также 19-я серия, появившаяся в 2020 году и актуальная до сих пор.","html":"Первой моделью асика от компании BITMAIN является Antminer S1, выпущенный в 2013 году. Сегодня совокупный модельный ряд производителя насчитывает более двух десятков вариантов техники, включая современные Antminer T21, Antminer S21 и даже Antminer S21 Hyd с водяным охлаждением. А легендарными моделями BITMAIN являются «неубиваемые» Antminer S9, а также 19-я серия, появившаяся в 2020 году и актуальная до сих пор."}$b933$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 66, 'image',
       $b934${"src":"/images/articles/asic-manufacturers/bitmain.png","alt":"BITMAIN Antminer"}$b934$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 67, 'stats',
       $b935${"rows":[{"label":"Страна производителя","value":"Китай"},{"label":"Дата основания","value":"2013 год"},{"label":"Бренд","value":"Antminer"},{"label":"Устройств в модельном ряде","value":"более 20"},{"label":"Какой асик купить","value":"Antminer S21 (оптимальное соотношение цены и эффективности)"},{"label":"Какой асик лучше (ТОПовая модель)","value":"Antminer S23 Hydro 3U на 1.16 PH/s"},{"label":"Алгоритмы асиков","value":"SHA-256, Scrypt, Kadena и EtHash"}]}$b935$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 68, 'pros_cons',
       $b936${"pros":["Один из старейших производителей асиков и лидер рынка;","Внушительный модельный ряд, включая разные алгоритмы майнинга;","Высокая конкуренция среди магазинов, продающих Antminer – это положительным образом влияет на цены;","Доступность запчастей и сервисных центров;","Хорошая репутация бренда и высокое качество продукции."],"cons":["Встречались случаи выпуска неудачных моделей, например, 17-я линейка Antminer;","Переплата за бренд."]}$b936$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 69, 'heading',
       $h937${"level":2,"text":"Выводы"}$h937$::jsonb,
       'vyvody'
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 70, 'paragraph',
       $b938${"text":"При покупке нужно учитывать не только цену устройства, но и множество других важных параметров. Среди них:","html":"При покупке нужно учитывать не только цену устройства, но и множество других важных параметров. Среди них:"}$b938$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 71, 'list',
       $b939${"ordered":false,"items":["Проверенная репутация бренда;","Условия гарантии и поддержка;","Наличие сервисных центров и запчастей;","Реальный опыт пользователей;","Возможности оптимизации через прошивки."]}$b939$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 72, 'paragraph',
       $b940${"text":"Рекомендуемые бренды для покупки сегодня: Bitmain (Antminer) – золотой стандарт индустрии, MicroBT (WhatsMiner) – мощные и надежные устройства, iPollo и Goldshell – хорошие решения для специфичных алгоритмов и домашних условий.","html":"Рекомендуемые бренды для покупки сегодня: Bitmain (Antminer) – золотой стандарт индустрии, MicroBT (WhatsMiner) – мощные и надежные устройства, iPollo и Goldshell – хорошие решения для специфичных алгоритмов и домашних условий."}$b940$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga';

-- Blocks: samyj-dorogoj-asik-dlya-majninga-v-2024-godu-top-3
INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 1, 'heading',
       $h941${"level":2,"text":"Введение"}$h941$::jsonb,
       'vvedenie'
FROM articles a WHERE a.slug = 'samyj-dorogoj-asik-dlya-majninga-v-2024-godu-top-3';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 2, 'paragraph',
       $b942${"text":"2024 год стал судьбоносным для мира майнинга и криптовалют: халвинг, состоявшийся весной, существенно изменил расклад сил, повлиял на рынок техники и заставил некоторых майнеров закончить добычу. В этой связи интересно познакомиться с рейтингом самых дорогих асиков для майнинга в 2026 году – подготовили ТОП-5 наиболее дорогих позиций. И забегая вперед, сделаем небольшой анонс – не все модели ориентированы только на добычу Биткоина.","html":"2024 год стал судьбоносным для мира майнинга и криптовалют: халвинг, состоявшийся весной, существенно изменил расклад сил, повлиял на рынок техники и заставил некоторых майнеров закончить добычу. В этой связи интересно познакомиться с рейтингом самых дорогих асиков для майнинга в 2026 году – подготовили ТОП-5 наиболее дорогих позиций. И забегая вперед, сделаем небольшой анонс – не все модели ориентированы только на добычу Биткоина."}$b942$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samyj-dorogoj-asik-dlya-majninga-v-2024-godu-top-3';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 3, 'image',
       $b943${"src":"/images/articles/expensive-asics/mining-farm.png","alt":"Промышленная майнинг-ферма"}$b943$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samyj-dorogoj-asik-dlya-majninga-v-2024-godu-top-3';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 4, 'heading',
       $h944${"level":2,"text":"Почему асики стоят так дорого?"}$h944$::jsonb,
       'pochemu-dorogo'
FROM articles a WHERE a.slug = 'samyj-dorogoj-asik-dlya-majninga-v-2024-godu-top-3';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 5, 'paragraph',
       $b945${"text":"Можно назвать несколько причин подобной политики ценообразования в майнинговой отрасли:","html":"Можно назвать несколько причин подобной политики ценообразования в майнинговой отрасли:"}$b945$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samyj-dorogoj-asik-dlya-majninga-v-2024-godu-top-3';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 6, 'rich_list',
       $b946${"ordered":false,"items":[{"title":"Узкая специализация и сложность производства","text":"Асик – это устройство, спроектированное исключительно под выполнение одной задачи: добычу криптовалюты (например, Биткоина с алгоритмом SHA-256). Разработка чипов требует значительных инвестиций: от проектирования до тестирования и запуска в массовое производство. Производственные линии на фабриках стоят миллионы долларов, и не каждая компания может позволить себе подобное;"},{"title":"Ограниченное количество производителей","text":"Основными игроками являются Bitmain, MicroBT, Canaan и несколько других. Такая ограниченность создает низкую конкуренцию, что позволяет производителям держать высокие цены, особенно на топовые модели;"},{"title":"Высокий спрос при ограниченном предложении","text":"Когда курс криптовалюты растет, увеличивается интерес к майнингу. Это вызывает всплеск спроса на оборудование, а предложение не всегда успевает за ним. Итог – рост цен, особенно на популярные модели;"},{"title":"Сложности с логистикой и пошлинами","text":"Большинство ASIC-устройств производятся в Китае. При международной доставке добавляются таможенные пошлины, налоги, комиссии – все это включается в конечную цену."}]}$b946$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samyj-dorogoj-asik-dlya-majninga-v-2024-godu-top-3';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 7, 'heading',
       $h947${"level":2,"text":"Почему новые ASIC-майнеры всегда дороже?"}$h947$::jsonb,
       'pochemu-novye-dorozhe'
FROM articles a WHERE a.slug = 'samyj-dorogoj-asik-dlya-majninga-v-2024-godu-top-3';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 8, 'paragraph',
       $b948${"text":"Наверняка вы успели заметить, что как только новинка появляется на рынке, ее стоимость значительно выше, чем у конкурирующих предложений. Постараемся объяснить природу данного явления:","html":"Наверняка вы успели заметить, что как только новинка появляется на рынке, ее стоимость значительно выше, чем у конкурирующих предложений. Постараемся объяснить природу данного явления:"}$b948$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samyj-dorogoj-asik-dlya-majninga-v-2024-godu-top-3';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 9, 'rich_list',
       $b949${"ordered":false,"items":[{"title":"Улучшенные характеристики","text":"Новые модели отличаются большей энергоэффективностью и хешрейтом. К примеру, если старый майнер выдает 190 TH/s при 3,5 кВт, то новый может давать 240 TH/s при том же или меньшем энергопотреблении. Это позволяет быстрее окупить вложения, отсюда и высокий ценник;"},{"title":"«Эффект первого»","text":"Владельцы первых партий новых асиков получают конкурентное преимущество: они начинают добычу с более высокой эффективностью, пока сложность сети не адаптировалась. Производители используют это, выставляя премиальную цену за доступ к новейшему оборудованию;"},{"title":"Ограниченные тиражи на старте","text":"На первых порах производитель выпускает ограниченное количество устройств, и часто их выкупают оптовики или крупные пулы. Чем меньше предложение, тем выше цена."}]}$b949$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samyj-dorogoj-asik-dlya-majninga-v-2024-godu-top-3';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 10, 'heading',
       $h950${"level":2,"text":"Как купить ASIC дешевле?"}$h950$::jsonb,
       'kak-kupit-deshevle'
FROM articles a WHERE a.slug = 'samyj-dorogoj-asik-dlya-majninga-v-2024-godu-top-3';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 11, 'paragraph',
       $b951${"text":"Однако все это вовсе не значит, что купить майнер дешевле – невыполнимая задача. Вот несколько рекомендаций, как можно снизить цену:","html":"Однако все это вовсе не значит, что купить майнер дешевле – невыполнимая задача. Вот несколько рекомендаций, как можно снизить цену:"}$b951$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samyj-dorogoj-asik-dlya-majninga-v-2024-godu-top-3';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 12, 'rich_list',
       $b952${"ordered":false,"items":[{"title":"Покупка на вторичном рынке","text":"Многие майнеры обновляют оборудование и продают старые, еще рабочие модели. На платформах вроде Avito, eBay или специализированных форумах можно найти выгодные предложения. Главное – проверяйте работоспособность и честность продавца;"},{"title":"Оптовые закупки","text":"Всегда есть возможность заказывать оборудование напрямую у производителя или крупного дистрибьютора по сниженной цене;"},{"title":"Покупка у локальных поставщиков с рассрочкой или скидками","text":"Некоторые компании предлагают покупку в рассрочку, скидки при покупке нескольких единиц или сезонные акции. Такие предложения чаще появляются в периоды снижения крипторынка;"},{"title":"Ждать просадок рынка","text":"Когда цена криптовалют падает, интерес к майнингу снижается. Это идеальное время для покупки оборудования: продавцы готовы уступать, лишь бы избавиться от своей техники."}]}$b952$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samyj-dorogoj-asik-dlya-majninga-v-2024-godu-top-3';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 13, 'paragraph',
       $b953${"text":"А теперь рассмотрим ТОП-5 самых дорогих асиков в мире: это лидеры, которые отличаются не только высокой производительностью, но и ценой.","html":"А теперь рассмотрим ТОП-5 самых дорогих асиков в мире: это лидеры, которые отличаются не только высокой производительностью, но и ценой."}$b953$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samyj-dorogoj-asik-dlya-majninga-v-2024-godu-top-3';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 14, 'image',
       $b954${"src":"/images/articles/expensive-asics/antminer-hydro-tubes.png","alt":"ASIC с жидкостным охлаждением"}$b954$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samyj-dorogoj-asik-dlya-majninga-v-2024-godu-top-3';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 15, 'heading',
       $h955${"level":2,"text":"5 место: VolcMiner D1 Hydro"}$h955$::jsonb,
       'volcminer-d1-hydro'
FROM articles a WHERE a.slug = 'samyj-dorogoj-asik-dlya-majninga-v-2024-godu-top-3';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 16, 'paragraph',
       $b956${"text":"VolcMiner D1 Hydro 30GH — промышленный ASIC-майнер на алгоритме Scrypt, ориентированный на добычу Litecoin и Dogecoin. Стоимость устройства превышает 1 000 000 рублей, что сразу относит модель к сегменту профессиональных решений для крупных ферм и дата-центров.","html":"VolcMiner D1 Hydro 30GH — промышленный ASIC-майнер на алгоритме Scrypt, ориентированный на добычу Litecoin и Dogecoin. Стоимость устройства превышает 1 000 000 рублей, что сразу относит модель к сегменту профессиональных решений для крупных ферм и дата-центров."}$b956$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samyj-dorogoj-asik-dlya-majninga-v-2024-godu-top-3';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 17, 'paragraph',
       $b957${"text":"Майнер обеспечивает хешрейт 30 GH/s при энергопотреблении 7 600 Вт. Использование водяного охлаждения позволяет удерживать стабильные температуры и снизить уровень шума до 50 дБ, что важно при плотной установке оборудования. Устройство рассчитано на подключение к трехфазной сети 380 В и не предназначено для домашнего использования.","html":"Майнер обеспечивает хешрейт 30 GH/s при энергопотреблении 7 600 Вт. Использование водяного охлаждения позволяет удерживать стабильные температуры и снизить уровень шума до 50 дБ, что важно при плотной установке оборудования. Устройство рассчитано на подключение к трехфазной сети 380 В и не предназначено для домашнего использования."}$b957$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samyj-dorogoj-asik-dlya-majninga-v-2024-godu-top-3';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 18, 'image',
       $b958${"src":"/images/articles/expensive-asics/volcminer-d1-hydro.png","alt":"VolcMiner D1 Hydro"}$b958$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samyj-dorogoj-asik-dlya-majninga-v-2024-godu-top-3';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 19, 'stats',
       $b959${"rows":[{"label":"Стартовая стоимость","value":"от 1 000 000 рублей"},{"label":"Производитель","value":"VolcMiner"},{"label":"Год выпуска","value":"2024"},{"label":"Алгоритм","value":"Scrypt"},{"label":"Хешрейт","value":"30 GH/s"},{"label":"Энергопотребление","value":"7 600 Вт"},{"label":"Энергоэффективность","value":"0,253 J/MH"},{"label":"Монеты для майнинга","value":"LTC, DOGE, BEL"},{"label":"Охлаждение","value":"Водяное"},{"label":"Уровень шума","value":"50 дБ"},{"label":"Размеры","value":"657 × 482 × 87 мм"},{"label":"Вес","value":"25,8 кг"},{"label":"Рабочая температура","value":"от -20 до +45 °C"}]}$b959$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samyj-dorogoj-asik-dlya-majninga-v-2024-godu-top-3';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 20, 'pros_cons',
       $b960${"pros":["Один из самых мощных асиков на алгоритме Scrypt;","Высокая энергоэффективность для своего класса;","Водяное охлаждение снижает нагрев и уровень шума;","Подходит для круглосуточной промышленной эксплуатации;","Ориентирован на стабильную добычу LTC и DOGE."],"cons":["Требуется трехфазное питание 380 В;","Не подходит для домашнего майнинга;","Более сложное обслуживание по сравнению с воздушным охлаждением."]}$b960$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samyj-dorogoj-asik-dlya-majninga-v-2024-godu-top-3';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 21, 'heading',
       $h961${"level":2,"text":"4 место: Antminer S23 HYDRO 580 TH"}$h961$::jsonb,
       'antminer-s23-hydro'
FROM articles a WHERE a.slug = 'samyj-dorogoj-asik-dlya-majninga-v-2024-godu-top-3';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 22, 'paragraph',
       $b962${"text":"Antminer S23 Hydro 580 TH — высокопроизводительный ASIC-майнер от Bitmain для добычи Bitcoin на алгоритме SHA-256. Модель относится к водяной линейке и ориентирована на фермы, где важны высокая плотность размещения, стабильная работа и минимальный уровень шума.","html":"Antminer S23 Hydro 580 TH — высокопроизводительный ASIC-майнер от Bitmain для добычи Bitcoin на алгоритме SHA-256. Модель относится к водяной линейке и ориентирована на фермы, где важны высокая плотность размещения, стабильная работа и минимальный уровень шума."}$b962$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samyj-dorogoj-asik-dlya-majninga-v-2024-godu-top-3';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 23, 'paragraph',
       $b963${"text":"Хешрейт 580 TH/s при энергопотреблении 5 510 Вт обеспечивает отличную производительность и энергоэффективность 9,5 J/TH. Водяное охлаждение снижает тепловую нагрузку и удерживает уровень шума на отметке около 45 дБ, что особенно важно для круглосуточной эксплуатации.","html":"Хешрейт 580 TH/s при энергопотреблении 5 510 Вт обеспечивает отличную производительность и энергоэффективность 9,5 J/TH. Водяное охлаждение снижает тепловую нагрузку и удерживает уровень шума на отметке около 45 дБ, что особенно важно для круглосуточной эксплуатации."}$b963$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samyj-dorogoj-asik-dlya-majninga-v-2024-godu-top-3';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 24, 'image',
       $b964${"src":"/images/articles/expensive-asics/antminer-hydro-black.png","alt":"Antminer S23 Hydro"}$b964$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samyj-dorogoj-asik-dlya-majninga-v-2024-godu-top-3';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 25, 'stats',
       $b965${"rows":[{"label":"Цена","value":"от 1 200 000 рублей"},{"label":"Производитель","value":"Bitmain"},{"label":"Год выпуска","value":"2026"},{"label":"Алгоритм","value":"SHA-256"},{"label":"Хешрейт","value":"580 ±3% TH/s"},{"label":"Энергопотребление","value":"5 510 ±5% Вт"},{"label":"Энергоэффективность","value":"9,5 ±5% J/TH"},{"label":"Монеты для майнинга","value":"BTC, BCH"},{"label":"Охлаждение","value":"Водяное"},{"label":"Уровень шума","value":"45 дБ"},{"label":"Размеры","value":"410 × 170 × 209 мм"},{"label":"Вес","value":"13,5 кг"},{"label":"Рабочая температура","value":"0–40 °C"}]}$b965$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samyj-dorogoj-asik-dlya-majninga-v-2024-godu-top-3';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 26, 'pros_cons',
       $b966${"pros":["Высокий хешрейт для алгоритма SHA-256;","Низкий уровень шума благодаря водяному охлаждению;","Отличная энергоэффективность для своего класса;","Подходит для плотного размещения в фермах и дата-центрах;","Более высокая производительность по сравнению с предыдущими моделями."],"cons":["Требуется водяная система охлаждения;","Не подходит для домашнего майнинга;","Высокие требования к электропитанию."]}$b966$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samyj-dorogoj-asik-dlya-majninga-v-2024-godu-top-3';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 27, 'heading',
       $h967${"level":2,"text":"3 место: Antminer S21e XP Hydro 3U"}$h967$::jsonb,
       'antminer-s21e-xp-hydro'
FROM articles a WHERE a.slug = 'samyj-dorogoj-asik-dlya-majninga-v-2024-godu-top-3';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 28, 'paragraph',
       $b968${"text":"Antminer S21e XP Hydro 3U — один из самых мощных ASIC-майнеров на алгоритме SHA-256, ориентированный на промышленную добычу Bitcoin. Модель выполнена в серверном форм-факторе 3U и предназначена для размещения в дата-центрах, майнинг-отелях и на крупных фермах с подготовленной инженерной инфраструктурой.","html":"Antminer S21e XP Hydro 3U — один из самых мощных ASIC-майнеров на алгоритме SHA-256, ориентированный на промышленную добычу Bitcoin. Модель выполнена в серверном форм-факторе 3U и предназначена для размещения в дата-центрах, майнинг-отелях и на крупных фермах с подготовленной инженерной инфраструктурой."}$b968$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samyj-dorogoj-asik-dlya-majninga-v-2024-godu-top-3';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 29, 'paragraph',
       $b969${"text":"Хешрейт 860 TH/s при энергопотреблении 11 180 Вт делает Antminer S21e XP Hydro 3U инструментом для профессионального майнинга с расчетом на долгосрочную эксплуатацию. Система водяного охлаждения обеспечивает стабильную работу под высокой нагрузкой, снижает шум и тепловую нагрузку, а также положительно влияет на ресурс оборудования.","html":"Хешрейт 860 TH/s при энергопотреблении 11 180 Вт делает Antminer S21e XP Hydro 3U инструментом для профессионального майнинга с расчетом на долгосрочную эксплуатацию. Система водяного охлаждения обеспечивает стабильную работу под высокой нагрузкой, снижает шум и тепловую нагрузку, а также положительно влияет на ресурс оборудования."}$b969$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samyj-dorogoj-asik-dlya-majninga-v-2024-godu-top-3';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 30, 'image',
       $b970${"src":"/images/articles/expensive-asics/antminer-3u-rack.png","alt":"Antminer S21e XP Hydro 3U"}$b970$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samyj-dorogoj-asik-dlya-majninga-v-2024-godu-top-3';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 31, 'stats',
       $b971${"rows":[{"label":"Цена","value":"от 1 200 000 рублей"},{"label":"Производитель","value":"Bitmain"},{"label":"Год выпуска","value":"2025"},{"label":"Алгоритм","value":"SHA-256"},{"label":"Хешрейт","value":"860 ±3% TH/s"},{"label":"Энергопотребление","value":"11 180 ±5% Вт"},{"label":"Энергоэффективность","value":"13 J/TH"},{"label":"Монеты для майнинга","value":"BTC, BCH"},{"label":"Охлаждение","value":"Водяное"},{"label":"Размеры","value":"900 × 482,6 × 130 мм"},{"label":"Вес","value":"42,7 кг"},{"label":"Рабочая температура","value":"0–40 °C"}]}$b971$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samyj-dorogoj-asik-dlya-majninga-v-2024-godu-top-3';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 32, 'pros_cons',
       $b972${"pros":["Рекордная производительность для алгоритма SHA-256;","Ориентация на промышленный и дата-центровый майнинг;","Стабильная работа за счет системы гидроохлаждения;","Удобный стойковый форм-фактор 3U;","Высокий запас актуальности на несколько лет вперед."],"cons":["Высокая стоимость входа;","Существенное энергопотребление;","Повышенные требования к электросети и охлаждению;","Не предназначен для домашнего майнинга."]}$b972$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samyj-dorogoj-asik-dlya-majninga-v-2024-godu-top-3';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 33, 'heading',
       $h973${"level":2,"text":"2 место: Antminer L11 Hydro"}$h973$::jsonb,
       'antminer-l11-hydro'
FROM articles a WHERE a.slug = 'samyj-dorogoj-asik-dlya-majninga-v-2024-godu-top-3';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 34, 'paragraph',
       $b974${"text":"Antminer L11 Hydro — флагманский ASIC-майнер на алгоритме Scrypt, ориентированный на промышленную добычу Litecoin и Dogecoin. Устройство развивает хешрейт 33 GH/s при энергопотреблении 5676 Вт, обеспечивая заметно улучшенную энергоэффективность по сравнению с предыдущим поколением L9. Стартовая стоимость подчеркивает принадлежность модели к премиальному сегменту.","html":"Antminer L11 Hydro — флагманский ASIC-майнер на алгоритме Scrypt, ориентированный на промышленную добычу Litecoin и Dogecoin. Устройство развивает хешрейт 33 GH/s при энергопотреблении 5676 Вт, обеспечивая заметно улучшенную энергоэффективность по сравнению с предыдущим поколением L9. Стартовая стоимость подчеркивает принадлежность модели к премиальному сегменту."}$b974$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samyj-dorogoj-asik-dlya-majninga-v-2024-godu-top-3';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 35, 'paragraph',
       $b975${"text":"Майнер оснащен системой жидкостного охлаждения, которая позволяет удерживать стабильные температуры при высокой нагрузке и снижает уровень шума до 45 дБ. Antminer L11 Hyd рассчитан на размещение в дата-центрах и профессиональных майнинг-фермах с подготовленной инфраструктурой и надежным электроснабжением.","html":"Майнер оснащен системой жидкостного охлаждения, которая позволяет удерживать стабильные температуры при высокой нагрузке и снижает уровень шума до 45 дБ. Antminer L11 Hyd рассчитан на размещение в дата-центрах и профессиональных майнинг-фермах с подготовленной инфраструктурой и надежным электроснабжением."}$b975$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samyj-dorogoj-asik-dlya-majninga-v-2024-godu-top-3';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 36, 'image',
       $b976${"src":"/images/articles/expensive-asics/antminer-hydro-tubes.png","alt":"Antminer L11 Hydro"}$b976$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samyj-dorogoj-asik-dlya-majninga-v-2024-godu-top-3';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 37, 'stats',
       $b977${"rows":[{"label":"Цена","value":"от 1 400 000 рублей"},{"label":"Производитель","value":"Bitmain"},{"label":"Год выпуска","value":"2025"},{"label":"Алгоритм","value":"Scrypt"},{"label":"Хешрейт","value":"33 GH/s"},{"label":"Энергопотребление","value":"5676 Вт"},{"label":"Энергоэффективность","value":"172 J/GH"},{"label":"Монеты для майнинга","value":"LTC, DOGE, BEL"},{"label":"Охлаждение","value":"Жидкостное"},{"label":"Уровень шума","value":"45 дБ"},{"label":"Вес","value":"60,3 кг"},{"label":"Рабочая температура","value":"0–40 °C"}]}$b977$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samyj-dorogoj-asik-dlya-majninga-v-2024-godu-top-3';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 38, 'pros_cons',
       $b978${"pros":["Высокая производительность на алгоритме Scrypt;","Одновременная добыча Litecoin и Dogecoin;","Улучшенная энергоэффективность по сравнению с предыдущими моделями;","Жидкостное охлаждение и пониженный уровень шума;","Ориентация на долгосрочную промышленную эксплуатацию."],"cons":["Высокая стоимость входа;","Существенное энергопотребление;","Требования к инфраструктуре и охлаждению;","Не подходит для домашнего майнинга."]}$b978$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samyj-dorogoj-asik-dlya-majninga-v-2024-godu-top-3';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 39, 'heading',
       $h979${"level":2,"text":"1 место: Antminer U3S23H"}$h979$::jsonb,
       'antminer-u3s23h'
FROM articles a WHERE a.slug = 'samyj-dorogoj-asik-dlya-majninga-v-2024-godu-top-3';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 40, 'paragraph',
       $b980${"text":"Antminer U3S23H — один из самых дорогих и производительных ASIC-майнеров на рынке. Модель ориентирована на промышленную добычу Bitcoin и других монет алгоритма SHA-256, предлагая рекордный хешрейт 1160 TH/s (1.16 PH/s). Стоимость устройства относит его к премиальному сегменту для крупных майнинг-ферм и дата-центров.","html":"Antminer U3S23H — один из самых дорогих и производительных ASIC-майнеров на рынке. Модель ориентирована на промышленную добычу Bitcoin и других монет алгоритма SHA-256, предлагая рекордный хешрейт 1160 TH/s (1.16 PH/s). Стоимость устройства относит его к премиальному сегменту для крупных майнинг-ферм и дата-центров."}$b980$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samyj-dorogoj-asik-dlya-majninga-v-2024-godu-top-3';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 41, 'paragraph',
       $b981${"text":"Высокая мощность сочетается с водяной системой охлаждения, которая обеспечивает стабильную работу при круглосуточной нагрузке. Несмотря на высокий уровень шума, Antminer U3S23H рассчитан на размещение в специализированных майнинг-отелях и промышленных помещениях с подготовленной инфраструктурой и мощным электропитанием.","html":"Высокая мощность сочетается с водяной системой охлаждения, которая обеспечивает стабильную работу при круглосуточной нагрузке. Несмотря на высокий уровень шума, Antminer U3S23H рассчитан на размещение в специализированных майнинг-отелях и промышленных помещениях с подготовленной инфраструктурой и мощным электропитанием."}$b981$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samyj-dorogoj-asik-dlya-majninga-v-2024-godu-top-3';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 42, 'image',
       $b982${"src":"/images/articles/expensive-asics/antminer-hydro-fans.png","alt":"Antminer U3S23H"}$b982$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samyj-dorogoj-asik-dlya-majninga-v-2024-godu-top-3';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 43, 'stats',
       $b983${"rows":[{"label":"Цена","value":"от 2 500 000 рублей"},{"label":"Производитель","value":"Bitmain"},{"label":"Алгоритм","value":"SHA-256"},{"label":"Хешрейт","value":"1160 TH/s"},{"label":"Энергопотребление","value":"11020 ±10% Вт"},{"label":"Монеты для майнинга","value":"BTC, BCH, BSV, FB"},{"label":"Охлаждение","value":"Водяное"},{"label":"Уровень шума","value":"75 дБ"},{"label":"Размеры","value":"900 × 482.6 × 130 мм"},{"label":"Вес","value":"48 кг"}]}$b983$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samyj-dorogoj-asik-dlya-majninga-v-2024-godu-top-3';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 44, 'pros_cons',
       $b984${"pros":["Рекордный хешрейт 1.16 PH/s;","Подходит для промышленного майнинга Bitcoin;","Стабильная работа 24/7 под высокой нагрузкой;","Водяное охлаждение и защита от перегрева;","Современные функции мониторинга и управления."],"cons":["Очень высокая стоимость;","Существенное энергопотребление;","Высокий уровень шума;","Требует профессиональной инфраструктуры и мощной электросети."]}$b984$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samyj-dorogoj-asik-dlya-majninga-v-2024-godu-top-3';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 45, 'heading',
       $h985${"level":2,"text":"Выводы"}$h985$::jsonb,
       'vyvody'
FROM articles a WHERE a.slug = 'samyj-dorogoj-asik-dlya-majninga-v-2024-godu-top-3';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 46, 'paragraph',
       $b986${"text":"Асики – это мощный, но недешевый инструмент добычи криптовалют. Их высокая цена обусловлена технической сложностью, ограниченностью рынка и постоянным спросом. Новые модели всегда стоят дороже, поскольку приносят максимальную прибыль на старте. Однако даже в таком сегменте можно сэкономить: разумный подход к выбору оборудования и времени покупки может сократить вложения в майнинг на десятки процентов.","html":"Асики – это мощный, но недешевый инструмент добычи криптовалют. Их высокая цена обусловлена технической сложностью, ограниченностью рынка и постоянным спросом. Новые модели всегда стоят дороже, поскольку приносят максимальную прибыль на старте. Однако даже в таком сегменте можно сэкономить: разумный подход к выбору оборудования и времени покупки может сократить вложения в майнинг на десятки процентов."}$b986$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'samyj-dorogoj-asik-dlya-majninga-v-2024-godu-top-3';

-- Blocks: rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu
INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 1, 'heading',
       $h987${"level":2,"text":"Введение"}$h987$::jsonb,
       'vvedenie'
FROM articles a WHERE a.slug = 'rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 2, 'paragraph',
       $b988${"text":"Майнинг на процессоре (CPU mining) – это способ добычи криптовалют, при котором вычислительные задачи блокчейна обрабатываются с помощью центрального процессора компьютера. Это самый первый способ майнинга, использовавшийся еще в эпоху появления Биткойна. С тех пор многое изменилось, но CPU-майнинг все еще сохраняет определенную нишу на рынке.","html":"Майнинг на процессоре (CPU mining) – это способ добычи криптовалют, при котором вычислительные задачи блокчейна обрабатываются с помощью центрального процессора компьютера. Это самый первый способ майнинга, использовавшийся еще в эпоху появления Биткойна. С тех пор многое изменилось, но CPU-майнинг все еще сохраняет определенную нишу на рынке."}$b988$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 3, 'image',
       $b989${"src":"/images/articles/cpu-mining/bitcoin-pcb.png","alt":"Bitcoin и процессорные платы"}$b989$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 4, 'heading',
       $h990${"level":2,"text":"Все, что полезно знать о майнинге на процессорах"}$h990$::jsonb,
       'vse-o-cpu-majninge'
FROM articles a WHERE a.slug = 'rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 5, 'paragraph',
       $b991${"text":"Краткая история CPU-майнинга:","html":"Краткая история CPU-майнинга:"}$b991$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 6, 'list',
       $b992${"ordered":false,"items":["2009–2011: первые годы биткойна – майнинг осуществляется только на CPU;","2011–2013: появились GPU-майнеры (видеокарты), вытеснив CPU из биткойн-майнинга;","С 2013: ASIC-устройства (специализированное оборудование) стали доминировать в добыче большинства монет;","2018–2024: рост популярности альтернативных криптовалют, устойчивых к ASIC, возродил интерес к CPU-майнингу (например, Monero, VerusCoin, Raptoreum)."]}$b992$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 7, 'paragraph',
       $b993${"text":"Несмотря на существенный рост сложности добычи и параллельное сокращение доходности, майнинг на процессорах сегодня все еще существует. Подобное возможно благодаря наличию преимуществ работы в таком формате:","html":"Несмотря на существенный рост сложности добычи и параллельное сокращение доходности, майнинг на процессорах сегодня все еще существует. Подобное возможно благодаря наличию преимуществ работы в таком формате:"}$b993$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 8, 'rich_list',
       $b994${"ordered":false,"items":[{"title":"Низкий порог входа","text":"Можно начать майнинг даже с обычного домашнего ПК или ноутбука (хотя эффективность будет низкой);"},{"title":"Устойчивость к асикам","text":"Некоторые криптовалюты (например, Yadacoin и VerusCoin) используют алгоритмы, которые специально спроектированы так, чтобы быть неэффективными на асиках и GPU, защищая CPU-майнеров;"},{"title":"Тихая работа и низкое энергопотребление","text":"Процессоры потребляют меньше энергии и не требуют шумных систем охлаждения, как видеокарты. Поэтому запустить ферму можно в домашних условиях;"},{"title":"Гибкость","text":"Легко переключиться между монетами. Также CPU всегда может использоваться для других задач."}]}$b994$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 9, 'paragraph',
       $b995${"text":"Правда, не обходится и без недостатков, некоторые из которых могут оказаться весьма существенными:","html":"Правда, не обходится и без недостатков, некоторые из которых могут оказаться весьма существенными:"}$b995$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 10, 'rich_list',
       $b996${"ordered":false,"items":[{"title":"Низкая доходность","text":"CPU-майнинг крайне неэффективен для большинства популярных монет. Заработок зачастую едва покрывает расходы на электричество;"},{"title":"Износ оборудования","text":"Постоянная нагрузка 24/7 увеличивает износ процессора и материнской платы;"},{"title":"Ограниченный выбор монет","text":"Только небольшое количество криптовалют (например, Haven и Raptoreum) выгодно майнить на CPU."}]}$b996$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 11, 'paragraph',
       $b997${"text":"А какие технические особенности важно учитывать при намерении начать добычу криптовалют с помощью процессоров? Список основных характеристик выглядит следующим образом:","html":"А какие технические особенности важно учитывать при намерении начать добычу криптовалют с помощью процессоров? Список основных характеристик выглядит следующим образом:"}$b997$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 12, 'list',
       $b998${"ordered":false,"items":["Количество ядер и потоков (чем больше, тем лучше) – многие алгоритмы, как правило, многопоточные;","L3-кэш. Особенно важен для алгоритмов вроде RandomX и GhostRider. Чем больше кэш – тем выше доходность;","Энергопотребление. Важно учитывать эффективность: сколько хэшей в секунду на каждый ватт;","Разгон и охлаждение. Майнинг нагружает CPU на 100%: требуется надежное охлаждение, желательно башенный кулер или система жидкостного охлаждения."]}$b998$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 13, 'paragraph',
       $b999${"text":"Познакомимся с лучшими процессорами для майнинга, детально проанализировав каждый вариант, доступный на рынке сегодня.","html":"Познакомимся с лучшими процессорами для майнинга, детально проанализировав каждый вариант, доступный на рынке сегодня."}$b999$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 14, 'image',
       $b1000${"src":"/images/articles/cpu-mining/circuit-board.png","alt":"Процессор на материнской плате"}$b1000$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 15, 'heading',
       $h1001${"level":2,"text":"10 место: Intel Core i9-10900K"}$h1001$::jsonb,
       'intel-i9-10900k'
FROM articles a WHERE a.slug = 'rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 16, 'paragraph',
       $b1002${"text":"Практически каждое появление процессоров от Intel в нашем рейтинге CPU для майнинга – это настоящий компромисс. Core i9-10900K не является исключением, так как оптимальным устройством для добычи криптовалют данный ЦП назвать сложно. Причина появления модели в ТОПе – принадлежность к флагманской серии от известнейшего производителя. Для дизайнерских и игровых целей Intel Core i9-10900K действительно успешен. Но в сегменте майнинга можно найти гораздо более эффективные устройства значительно дешевле. Например, уже знакомый нам Xeon E5-2699V3 в ряде случаев более предпочтителен, хотя стоимость обоих CPU несоизмерима.","html":"Практически каждое появление процессоров от Intel в нашем рейтинге CPU для майнинга – это настоящий компромисс. Core i9-10900K не является исключением, так как оптимальным устройством для добычи криптовалют данный ЦП назвать сложно. Причина появления модели в ТОПе – принадлежность к флагманской серии от известнейшего производителя. Для дизайнерских и игровых целей Intel Core i9-10900K действительно успешен. Но в сегменте майнинга можно найти гораздо более эффективные устройства значительно дешевле. Например, уже знакомый нам Xeon E5-2699V3 в ряде случаев более предпочтителен, хотя стоимость обоих CPU несоизмерима."}$b1002$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 17, 'paragraph',
       $b1003${"text":"Приобретать Core i9 именно для майнинга нецелесообразно. Но если ваш игровой или рабочий компьютер собран на основе этого процессора, можно задействовать его для получения пассивного дохода. В данном случае CPU от Intel поможет компенсировать часть вложенных средств в его покупку.","html":"Приобретать Core i9 именно для майнинга нецелесообразно. Но если ваш игровой или рабочий компьютер собран на основе этого процессора, можно задействовать его для получения пассивного дохода. В данном случае CPU от Intel поможет компенсировать часть вложенных средств в его покупку."}$b1003$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 18, 'image',
       $b1004${"src":"/images/articles/cpu-mining/intel-i9-10900k.png","alt":"Intel Core i9-10900K"}$b1004$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 19, 'stats',
       $b1005${"rows":[{"label":"Сокет","value":"LGA 1200"},{"label":"Число ядер","value":"10"},{"label":"Базовая частота","value":"3 700 МГц"},{"label":"Потенциал разгона","value":"5 300 МГц"},{"label":"Потребление","value":"125 Вт"}]}$b1005$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 20, 'pros_cons',
       $b1006${"pros":["Мощное решение для компьютерных игр, дизайна и офисных задач;","Образцовая однопоточная эффективность."],"cons":["Скромная эффективность в майнинге;","Более высокая стоимость по сравнению с аналогами, обладающими похожими характеристиками."]}$b1006$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 21, 'heading',
       $h1007${"level":2,"text":"9 место: AMD Threadripper 1950X"}$h1007$::jsonb,
       'threadripper-1950x'
FROM articles a WHERE a.slug = 'rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 22, 'paragraph',
       $b1008${"text":"Необычный тип процессора в HEDT-формате – узкопрофильный вариант, который также может использоваться для майнинга. Производительность CPU достойная, что вполне объяснимо. Дело в том, что HEDT расшифровывается как High-End Desktop – высокопроизводительные компьютеры для тяжелых задач. Добыча криптовалют отлично подходит под это понятие, поэтому владельцы AMD Threadripper 1950X часто используют архитектуру для майнинга.","html":"Необычный тип процессора в HEDT-формате – узкопрофильный вариант, который также может использоваться для майнинга. Производительность CPU достойная, что вполне объяснимо. Дело в том, что HEDT расшифровывается как High-End Desktop – высокопроизводительные компьютеры для тяжелых задач. Добыча криптовалют отлично подходит под это понятие, поэтому владельцы AMD Threadripper 1950X часто используют архитектуру для майнинга."}$b1008$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 23, 'paragraph',
       $b1009${"text":"Сложность реализации такого подхода заключается в доступности компонентов. Данный CPU продается далеко не во всех магазинах, а поиск остальных комплектующих ПК требует временных и финансовых трат. Однако именно HEDT-формат оптимален для создания полноценных ферм с вовлечением в процесс не одной, а сразу нескольких рабочих станций.","html":"Сложность реализации такого подхода заключается в доступности компонентов. Данный CPU продается далеко не во всех магазинах, а поиск остальных комплектующих ПК требует временных и финансовых трат. Однако именно HEDT-формат оптимален для создания полноценных ферм с вовлечением в процесс не одной, а сразу нескольких рабочих станций."}$b1009$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 24, 'image',
       $b1010${"src":"/images/articles/cpu-mining/threadripper-1950x.png","alt":"AMD Threadripper 1950X"}$b1010$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 25, 'stats',
       $b1011${"rows":[{"label":"Сокет","value":"TR4"},{"label":"Число ядер","value":"16"},{"label":"Базовая частота","value":"3 400 МГц"},{"label":"Потенциал разгона","value":"4 000 МГц"},{"label":"Потребление","value":"180 Вт"}]}$b1011$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 26, 'pros_cons',
       $b1012${"pros":["Ощутимая производительность устройства;","Достойная многопоточность;","Оптимальный вариант для создания полноценной фермы."],"cons":["Редкий и не пользующийся большой популярностью формат;","Возможные сложности с продажей на вторичном рынке;","Необходимость использования в паре только с соответствующей материнской платой;","Внушительные габаритные размеры;","Дешевле конкурирующих моделей от других производителей."]}$b1012$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 27, 'heading',
       $h1013${"level":2,"text":"8 место: Intel Core i7-7700"}$h1013$::jsonb,
       'intel-i7-7700'
FROM articles a WHERE a.slug = 'rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 28, 'paragraph',
       $b1014${"text":"Один из немногочисленных представителей компании Intel в нашем рейтинге, процессор Core i7-7700, оказался здесь по причине своей универсальности и популярности среди классических пользователей. Модель часто применяют для сборки офисных рабочих станций, дизайнерских систем и недорогих игровых компьютеров. А вместе с этим можно получить источник пассивного заработка, задействовав CPU для добычи криптовалют.","html":"Один из немногочисленных представителей компании Intel в нашем рейтинге, процессор Core i7-7700, оказался здесь по причине своей универсальности и популярности среди классических пользователей. Модель часто применяют для сборки офисных рабочих станций, дизайнерских систем и недорогих игровых компьютеров. А вместе с этим можно получить источник пассивного заработка, задействовав CPU для добычи криптовалют."}$b1014$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 29, 'paragraph',
       $b1015${"text":"Процессор отлично подходит для знакомства с майнингом: испортить устройство серьезными нагрузками затруднительно. Производитель уверен в надежности линейки – покупатель может рассчитывать на 3-летнюю гарантию. Однако есть и существенный недостаток – это трудности при разгоне, что актуально для любой продукции Intel. Кроме того, Core i7 считаются достаточно «горячими» процессорами, поэтому следует быть предельно внимательным и аккуратным.","html":"Процессор отлично подходит для знакомства с майнингом: испортить устройство серьезными нагрузками затруднительно. Производитель уверен в надежности линейки – покупатель может рассчитывать на 3-летнюю гарантию. Однако есть и существенный недостаток – это трудности при разгоне, что актуально для любой продукции Intel. Кроме того, Core i7 считаются достаточно «горячими» процессорами, поэтому следует быть предельно внимательным и аккуратным."}$b1015$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 30, 'image',
       $b1016${"src":"/images/articles/cpu-mining/intel-i7-7th.png","alt":"Intel Core i7-7700"}$b1016$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 31, 'stats',
       $b1017${"rows":[{"label":"Сокет","value":"LGA 1151"},{"label":"Число ядер","value":"4"},{"label":"Базовая частота","value":"3 600 МГц"},{"label":"Потенциал разгона","value":"4 200 МГц"},{"label":"Потребление","value":"65 Вт"}]}$b1017$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 32, 'pros_cons',
       $b1018${"pros":["Популярная модель среди любых пользователей;","Надежность – гарантия 3 года;","Актуальность на вторичном рынке."],"cons":["Небольшой доход от майнинга;","Сложности с разгоном;","Необходимость контроля температур из-за вероятности перегрева."]}$b1018$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 33, 'heading',
       $h1019${"level":2,"text":"7 место: AMD Ryzen 9 3900X"}$h1019$::jsonb,
       'ryzen-9-3900x'
FROM articles a WHERE a.slug = 'rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 34, 'paragraph',
       $b1020${"text":"Процессор среднего уровня AMD Ryzen 9 3900X чаще всего используется для добычи монеты Monero (XMR) – именно здесь данный CPU максимально эффективен. В целом, эту модель можно назвать универсальной как для майнинга, так и любых других задач, например, работы с офисными приложениями, сборки мощных решений для дизайнеров. Этот один из тех процессоров, которые отличаются наибольшей долей положительных отзывов, поэтому модель можно смело назвать легендарной.","html":"Процессор среднего уровня AMD Ryzen 9 3900X чаще всего используется для добычи монеты Monero (XMR) – именно здесь данный CPU максимально эффективен. В целом, эту модель можно назвать универсальной как для майнинга, так и любых других задач, например, работы с офисными приложениями, сборки мощных решений для дизайнеров. Этот один из тех процессоров, которые отличаются наибольшей долей положительных отзывов, поэтому модель можно смело назвать легендарной."}$b1020$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 35, 'paragraph',
       $b1021${"text":"Для достижения оптимальных объемов заработка в майнинге CPU придется разогнать. При этом повышенное внимание уделяется системе охлаждения, которая даже в заводской конфигурации процессора далеко не всегда эффективно справляется с возложенной на нее задачей. Если грамотно подойти к решению проблемы, в итоге создается надежная ферма среднего уровня для устойчивой и эффективной добычи альткоинов.","html":"Для достижения оптимальных объемов заработка в майнинге CPU придется разогнать. При этом повышенное внимание уделяется системе охлаждения, которая даже в заводской конфигурации процессора далеко не всегда эффективно справляется с возложенной на нее задачей. Если грамотно подойти к решению проблемы, в итоге создается надежная ферма среднего уровня для устойчивой и эффективной добычи альткоинов."}$b1021$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 36, 'image',
       $b1022${"src":"/images/articles/cpu-mining/ryzen-9-box-a.png","alt":"AMD Ryzen 9 3900X"}$b1022$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 37, 'stats',
       $b1023${"rows":[{"label":"Сокет","value":"AM4"},{"label":"Число ядер","value":"12"},{"label":"Базовая частота","value":"3 800 МГц"},{"label":"Потенциал разгона","value":"4 600 МГц"},{"label":"Потребление","value":"105 Вт"}]}$b1023$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 38, 'pros_cons',
       $b1024${"pros":["Один из лучших вариантов для майнинга Monero (XMR);","Универсальная модель, пользующаяся спросом;","Относительно невысокая стоимость;","Неплохая эффективность добычи при небольших вложениях."],"cons":["Скромный хэшрейт;","Неудачная система охлаждения, требующая замены при разгоне."]}$b1024$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 39, 'heading',
       $h1025${"level":2,"text":"6 место: AMD Ryzen 7 3700X"}$h1025$::jsonb,
       'ryzen-7-3700x'
FROM articles a WHERE a.slug = 'rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 40, 'paragraph',
       $b1026${"text":"Не только 9-е поколение от AMD активно используется в майнинге. Некоторые модели 7-й генерации также применимы для выгодной добычи, например, модель AMD Ryzen 7 3700X. Несмотря на достаточно скромные технические характеристики, этот процессор пользуется популярностью у начинающих криптоэнтузиастов. Одна из главных причин – приемлемая цена, простота и неприхотливость.","html":"Не только 9-е поколение от AMD активно используется в майнинге. Некоторые модели 7-й генерации также применимы для выгодной добычи, например, модель AMD Ryzen 7 3700X. Несмотря на достаточно скромные технические характеристики, этот процессор пользуется популярностью у начинающих криптоэнтузиастов. Одна из главных причин – приемлемая цена, простота и неприхотливость."}$b1026$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 41, 'paragraph',
       $b1027${"text":"Указанная CPU оптимальна для проведения тестов и экспериментов, а скромное энергопотребление позволяет заниматься майнингом без внушительной затратной части. Кроме того, Ryzen 7 3700X ценится на вторичном рынке, так как часто используется для офисных задач и сборки игровых компьютеров среднего уровня.","html":"Указанная CPU оптимальна для проведения тестов и экспериментов, а скромное энергопотребление позволяет заниматься майнингом без внушительной затратной части. Кроме того, Ryzen 7 3700X ценится на вторичном рынке, так как часто используется для офисных задач и сборки игровых компьютеров среднего уровня."}$b1027$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 42, 'image',
       $b1028${"src":"/images/articles/cpu-mining/ryzen-7-3700x.png","alt":"AMD Ryzen 7 3700X"}$b1028$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 43, 'stats',
       $b1029${"rows":[{"label":"Сокет","value":"AM4"},{"label":"Число ядер","value":"8"},{"label":"Базовая частота","value":"3 600 МГц"},{"label":"Потенциал разгона","value":"4 400 МГц"},{"label":"Потребление","value":"65 Вт"}]}$b1029$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 44, 'pros_cons',
       $b1030${"pros":["Невысокая стоимость;","Скромное энергопотребление;","Достойный разгонный потенциал;","Универсальность;","Возможность быстрой продажи на вторичном рынке."],"cons":["Небольшая доходность в майнинге;","Посредственная однопоточная производительность."]}$b1030$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 45, 'heading',
       $h1031${"level":2,"text":"5 место: AMD Ryzen 9 3960X"}$h1031$::jsonb,
       'ryzen-9-3960x'
FROM articles a WHERE a.slug = 'rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 46, 'paragraph',
       $b1032${"text":"Еще один представитель 9-го поколения от AMD в нашем рейтинге – Ryzen 3960X. Это промежуточный вариант между дорогой моделью 3970X и эффективным, но не самым выдающимся по доходности 3950X. Данный CPU оснащен 24 ядрами, а при разгоне процессор может похвастаться рабочей частотой до 4 300 МГц (однако многие отмечают, что устройство неохотно поддается оверклокингу).","html":"Еще один представитель 9-го поколения от AMD в нашем рейтинге – Ryzen 3960X. Это промежуточный вариант между дорогой моделью 3970X и эффективным, но не самым выдающимся по доходности 3950X. Данный CPU оснащен 24 ядрами, а при разгоне процессор может похвастаться рабочей частотой до 4 300 МГц (однако многие отмечают, что устройство неохотно поддается оверклокингу)."}$b1032$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 47, 'paragraph',
       $b1033${"text":"Главная отличительная черта AMD Ryzen 9 3960X – это оптимальное соотношение стоимости и производительности. Добавить к этому можно скромный объем энергопотребления, что позволяет успешно майнить даже на локациях с дорогим электричеством. Но для более убедительных результатов добычи следует дополнить ферму быстрой и современной памятью формата DDR4.","html":"Главная отличительная черта AMD Ryzen 9 3960X – это оптимальное соотношение стоимости и производительности. Добавить к этому можно скромный объем энергопотребления, что позволяет успешно майнить даже на локациях с дорогим электричеством. Но для более убедительных результатов добычи следует дополнить ферму быстрой и современной памятью формата DDR4."}$b1033$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 48, 'image',
       $b1034${"src":"/images/articles/cpu-mining/ryzen-9-box-b.png","alt":"AMD Ryzen 9 3960X"}$b1034$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 49, 'stats',
       $b1035${"rows":[{"label":"Сокет","value":"sTRX4"},{"label":"Число ядер","value":"24"},{"label":"Базовая частота","value":"3 800 МГц"},{"label":"Потенциал разгона","value":"4 500 МГц"},{"label":"Потребление","value":"280 Вт"}]}$b1035$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 50, 'pros_cons',
       $b1036${"pros":["Любимая модель у многих майнеров из-за оптимального соотношения цены и характеристик;","Универсальный процессор для майнинга, офиса и игр;","Отличные результаты при разгоне;","Репутация качественной и проверенной модели."],"cons":["Сложный процесс разгона;","Необходимость использования вместе с современной памятью DDR4 (иначе объемы добычи криптовалют снижаются)."]}$b1036$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 51, 'heading',
       $h1037${"level":2,"text":"4 место: AMD Threadripper 3990X"}$h1037$::jsonb,
       'threadripper-3990x'
FROM articles a WHERE a.slug = 'rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 52, 'paragraph',
       $b1038${"text":"Флагман мира процессоров расположился в нашем рейтинге лишь на 4 месте. Данный CPU приносит рекордный объем заработка в майнинге, но при добыче цифровых активов всегда учитываются еще и первоначальные затраты. В случае с 3990X ложкой дегтя является цена – она тоже рекордная, как и параметры производительности данного процессора. Следовательно, срок окупаемости здесь значительно больше, что и оставило этот Threadripper за бортом тройки лидеров.","html":"Флагман мира процессоров расположился в нашем рейтинге лишь на 4 месте. Данный CPU приносит рекордный объем заработка в майнинге, но при добыче цифровых активов всегда учитываются еще и первоначальные затраты. В случае с 3990X ложкой дегтя является цена – она тоже рекордная, как и параметры производительности данного процессора. Следовательно, срок окупаемости здесь значительно больше, что и оставило этот Threadripper за бортом тройки лидеров."}$b1038$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 53, 'paragraph',
       $b1039${"text":"Максимальные параметры производительности 3990X достижимы только в паре с памятью DDR4 с частотой от 3 200 МГц – это еще одно требование эффективного майнинга. Иначе данная модель AMD не сможет продемонстрировать свои предельные возможности. Кроме того, разгон процессора непрост, что усложняет работу с данным CPU начинающими майнерами. Но если подойти к решению задачи предельно грамотно, устройство приятно порадует своего владельца высоким уровнем дохода.","html":"Максимальные параметры производительности 3990X достижимы только в паре с памятью DDR4 с частотой от 3 200 МГц – это еще одно требование эффективного майнинга. Иначе данная модель AMD не сможет продемонстрировать свои предельные возможности. Кроме того, разгон процессора непрост, что усложняет работу с данным CPU начинающими майнерами. Но если подойти к решению задачи предельно грамотно, устройство приятно порадует своего владельца высоким уровнем дохода."}$b1039$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 54, 'image',
       $b1040${"src":"/images/articles/cpu-mining/threadripper-box-a.png","alt":"AMD Threadripper 3990X"}$b1040$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 55, 'stats',
       $b1041${"rows":[{"label":"Сокет","value":"sTRX4"},{"label":"Число ядер","value":"64"},{"label":"Базовая частота","value":"2 900 МГц"},{"label":"Потенциал разгона","value":"4 300 МГц"},{"label":"Потребление","value":"280 Вт"}]}$b1041$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 56, 'pros_cons',
       $b1042${"pros":["Один из самых мощных процессоров, доступных сегодня;","При грамотной настройке возможен рекордный доход в майнинге;","Максимальная скорость не только в майнинге, но и других направлениях (гейминг, дизайн, офисные задачи);","Относительно небольшой объем энергопотребления при впечатляющих параметрах мощности."],"cons":["Высокая стоимость;","Трудоемкий процесс настройки и разгона;","Дополнительные требования для достижения максимальной эффективности;","Невысокий спрос на вторичном рынке (премиум-сегмент неохотно выбирается покупателями)."]}$b1042$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 57, 'heading',
       $h1043${"level":2,"text":"3 место: Intel Xeon E5-2699V3"}$h1043$::jsonb,
       'xeon-e5-2699v3'
FROM articles a WHERE a.slug = 'rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 58, 'paragraph',
       $b1044${"text":"Процессоры Intel не пользуются повышенной популярностью у майнеров, так как они уступают по эффективности своему прямому конкуренту – продукции от AMD. Но если вы являетесь поклонником техники Intel, модель Xeon E5-2699V3 является одним из лучших вариантов для криптовалют даже несмотря на появление в далеком 2014 году и наличие сегодня значительно более производительных устройств. Ключевая причина – низкая стоимость, что позволяет создавать полноценные фермы.","html":"Процессоры Intel не пользуются повышенной популярностью у майнеров, так как они уступают по эффективности своему прямому конкуренту – продукции от AMD. Но если вы являетесь поклонником техники Intel, модель Xeon E5-2699V3 является одним из лучших вариантов для криптовалют даже несмотря на появление в далеком 2014 году и наличие сегодня значительно более производительных устройств. Ключевая причина – низкая стоимость, что позволяет создавать полноценные фермы."}$b1044$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 59, 'paragraph',
       $b1045${"text":"С помощью данного CPU выгодно добывать лишь ограниченное число монет (например, майнить Monero экономически нецелесообразно). Разгон также может оказаться источником лишних проблем, так как производитель постарался заблокировать эту возможность. Но несмотря на все эти недостатки, Intel Xeon E5-2699V3 уже стал такой же легендарной моделью майнинга на CPU, как и 9-я линейка Antminer в сегменте асиков.","html":"С помощью данного CPU выгодно добывать лишь ограниченное число монет (например, майнить Monero экономически нецелесообразно). Разгон также может оказаться источником лишних проблем, так как производитель постарался заблокировать эту возможность. Но несмотря на все эти недостатки, Intel Xeon E5-2699V3 уже стал такой же легендарной моделью майнинга на CPU, как и 9-я линейка Antminer в сегменте асиков."}$b1045$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 60, 'image',
       $b1046${"src":"/images/articles/cpu-mining/xeon-e5.png","alt":"Intel Xeon E5-2699V3"}$b1046$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 61, 'stats',
       $b1047${"rows":[{"label":"Сокет","value":"LGA 2011-v3"},{"label":"Число ядер","value":"18"},{"label":"Базовая частота","value":"2 300 МГц"},{"label":"Потенциал разгона","value":"3 600 МГц"},{"label":"Потребление","value":"145 Вт"}]}$b1047$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 62, 'pros_cons',
       $b1048${"pros":["Низкая стоимость – одно из наиболее доступных решений для майнинга в 2024 году;","Малый объем энергопотребления;","Возможность создавать полноценные фермы из-за доступности и относительной эффективности;","Популярность на вторичном рынке."],"cons":["Скромный объем доходов;","Преклонный возраст модели: данный CPU появился в 2014 году;","Трудности с разгоном;","Не самый популярный формат сокета."]}$b1048$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 63, 'heading',
       $h1049${"level":2,"text":"2 место: AMD Ryzen Threadripper 3970X"}$h1049$::jsonb,
       'threadripper-3970x'
FROM articles a WHERE a.slug = 'rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 64, 'paragraph',
       $b1050${"text":"Один из наиболее производительных процессоров массового сегмента сегодня – эталонная модель, отличающаяся высокой мощностью и не менее впечатляющей стоимостью. Если майнер располагает внушительным бюджетом и планирует заниматься добычей криптовалют продолжительное время, модель AMD Ryzen Threadripper 3970X может стать долгосрочным вложением. Но бестселлером данный CPU пока не стал, причиной чего является цена – многие майнеры на процессорах предпочитают использовать более доступные альтернативы.","html":"Один из наиболее производительных процессоров массового сегмента сегодня – эталонная модель, отличающаяся высокой мощностью и не менее впечатляющей стоимостью. Если майнер располагает внушительным бюджетом и планирует заниматься добычей криптовалют продолжительное время, модель AMD Ryzen Threadripper 3970X может стать долгосрочным вложением. Но бестселлером данный CPU пока не стал, причиной чего является цена – многие майнеры на процессорах предпочитают использовать более доступные альтернативы."}$b1050$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 65, 'paragraph',
       $b1051${"text":"Модель оснащена 32 ядрами, что обеспечивает работу в 64 потока. Базовая частота составляет 3 700 МГц, а при разгоне можно увеличить данное значение до 4 500 МГц. Внушительная производительность требует хорошего охлаждения: данный CPU можно с легкостью «сжечь», если пренебречь выбором качественного кулера.","html":"Модель оснащена 32 ядрами, что обеспечивает работу в 64 потока. Базовая частота составляет 3 700 МГц, а при разгоне можно увеличить данное значение до 4 500 МГц. Внушительная производительность требует хорошего охлаждения: данный CPU можно с легкостью «сжечь», если пренебречь выбором качественного кулера."}$b1051$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 66, 'image',
       $b1052${"src":"/images/articles/cpu-mining/threadripper-box-b.png","alt":"AMD Ryzen Threadripper 3970X"}$b1052$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 67, 'stats',
       $b1053${"rows":[{"label":"Сокет","value":"sTRX4"},{"label":"Число ядер","value":"32"},{"label":"Базовая частота","value":"3 700 МГц"},{"label":"Потенциал разгона","value":"4 500 МГц"},{"label":"Потребление","value":"280 Вт"}]}$b1053$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 68, 'pros_cons',
       $b1054${"pros":["Отличные метрики производительности;","Внушительный заработок на майнинге с процессорами;","Возможность разгона для достижения еще более впечатляющей производительности."],"cons":["Высокая стоимость;","Серьезный объем энергопотребления;","Серьезные требования к системе охлаждения;","Возможные трудности с перепродажей из-за узкой специфики (премиум-класс процессоров)."]}$b1054$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 69, 'heading',
       $h1055${"level":2,"text":"1 место: AMD Ryzen 9 3950X"}$h1055$::jsonb,
       'ryzen-9-3950x'
FROM articles a WHERE a.slug = 'rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 70, 'paragraph',
       $b1056${"text":"Это не самый мощный процессор для майнинга, но по соотношению стоимости и хэшрейта данная модель может считаться оптимальной. Обладая разумной стоимостью, CPU отличается набором впечатляющих характеристик – это три чиплета, 16 ядер, 32 потока, базовая частота 3 500 МГц, а также возможность разгона до 4 700 МГц. Процессор создан на архитектуре AM4, что значительно упрощает выбор подходящей материнской платы.","html":"Это не самый мощный процессор для майнинга, но по соотношению стоимости и хэшрейта данная модель может считаться оптимальной. Обладая разумной стоимостью, CPU отличается набором впечатляющих характеристик – это три чиплета, 16 ядер, 32 потока, базовая частота 3 500 МГц, а также возможность разгона до 4 700 МГц. Процессор создан на архитектуре AM4, что значительно упрощает выбор подходящей материнской платы."}$b1056$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 71, 'paragraph',
       $b1057${"text":"Наиболее активно AMD Ryzen 9 3950X используется майнерами для добычи трех подходящих монет – это Monero (XMR), Raptoreum (RTM) и Bitoreum (BTRM). Энергопотребление CPU относительно скромное – 105 Вт, а заявленных характеристик более чем достаточно не только для майнинга, но и игровых, а тем более офисных задач.","html":"Наиболее активно AMD Ryzen 9 3950X используется майнерами для добычи трех подходящих монет – это Monero (XMR), Raptoreum (RTM) и Bitoreum (BTRM). Энергопотребление CPU относительно скромное – 105 Вт, а заявленных характеристик более чем достаточно не только для майнинга, но и игровых, а тем более офисных задач."}$b1057$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 72, 'image',
       $b1058${"src":"/images/articles/cpu-mining/ryzen-9-chip.png","alt":"AMD Ryzen 9 3950X"}$b1058$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 73, 'stats',
       $b1059${"rows":[{"label":"Сокет","value":"AM4"},{"label":"Число ядер","value":"16"},{"label":"Базовая частота","value":"3 500 МГц"},{"label":"Потенциал разгона","value":"4 700 МГц"},{"label":"Потребление","value":"105 Вт"}]}$b1059$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 74, 'pros_cons',
       $b1060${"pros":["Одно из лучших соотношений стоимости и производительности на рынке;","Небольшое энергопотребление;","Относительно невысокая стоимость;","Отличные технические характеристики;","Незначительный нагрев при оптимизации системы охлаждения;","Популярность на вторичном рынке: модель принадлежит к категории масс-маркета."],"cons":["Необходимо производить разгон для значительного увеличения производительности;","Стандартная система охлаждения не всегда справляется с поставленной задачей;","Меньший доход по сравнению с более эффективными конкурентами."]}$b1060$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 75, 'heading',
       $h1061${"level":2,"text":"Майнинг на процессорах: выводы"}$h1061$::jsonb,
       'vyvody'
FROM articles a WHERE a.slug = 'rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 76, 'paragraph',
       $b1062${"text":"Нюансы и требования CPU-майнинга в 2026 году:","html":"Нюансы и требования CPU-майнинга в 2026 году:"}$b1062$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 77, 'list',
       $b1063${"ordered":false,"items":["Электричество – ключевой фактор. Если у вас высокие тарифы, майнинг будет осуществляться в минус;","Локация – страны с дешевой электроэнергией (Россия, Казахстан, Иран) более выгодны;","Регулирование — важно учитывать местные законы. CPU-майнинг менее заметен, но формально может иметь запреты и ограничения (в некоторых регионах);","Комбинированный майнинг: можно использовать CPU + GPU одновременно (например, CPU майнит Monero, а GPU — Ethereum Classic)."]}$b1063$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 78, 'paragraph',
       $b1064${"text":"Майнинг на процессоре в 2026 году – нишевый, но все еще актуальный способ добычи криптовалют.","html":"Майнинг на процессоре в 2026 году – нишевый, но все еще актуальный способ добычи криптовалют."}$b1064$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 79, 'paragraph',
       $b1065${"text":"Он подойдет новичкам без большого стартового бюджета, владельцам мощных процессоров, а также энтузиастам, майнящим устойчивые к асикам монеты.","html":"Он подойдет новичкам без большого стартового бюджета, владельцам мощных процессоров, а также энтузиастам, майнящим устойчивые к асикам монеты."}$b1065$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 80, 'paragraph',
       $b1066${"text":"Тем не менее, для массового майнинга CPU уже давно не конкурент видеокартам, а тем более асикам. Доходы невелики, а окупаемость сомнительна, особенно без грамотного подхода. Если вы готовы экспериментировать, следить за новыми монетами и оптимизировать расходы, CPU-майнинг может стать интересной нишей.","html":"Тем не менее, для массового майнинга CPU уже давно не конкурент видеокартам, а тем более асикам. Доходы невелики, а окупаемость сомнительна, особенно без грамотного подхода. Если вы готовы экспериментировать, следить за новыми монетами и оптимизировать расходы, CPU-майнинг может стать интересной нишей."}$b1066$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu';
