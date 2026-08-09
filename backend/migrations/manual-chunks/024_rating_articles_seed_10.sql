SET client_encoding = 'UTF8';

-- Blocks: luchshie-puly-dlya-majninga-top-10
INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 1, 'heading',
       $h1547${"level":2,"text":"Введение"}$h1547$::jsonb,
       'vvedenie'
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 2, 'paragraph',
       $b1548${"text":"Майнинг криптовалют – это не просто подключение оборудования и ожидание прибыли. Современные реалии индустрии требуют оптимизации каждого элемента: от выбора оборудования до стратегий распределения вычислительных мощностей. Один из ключевых компонентов в цепочке добычи криптовалют – пулы для майнинга. Особенно это актуально для тех, кто не владеет огромными фермами, а майнит с несколькими ASIC-устройствами или на GPU. Участие в пуле может повысить шансы на регулярный доход и упростить техническое сопровождение процесса.","html":"Майнинг криптовалют – это не просто подключение оборудования и ожидание прибыли. Современные реалии индустрии требуют оптимизации каждого элемента: от выбора оборудования до стратегий распределения вычислительных мощностей. Один из ключевых компонентов в цепочке добычи криптовалют – пулы для майнинга. Особенно это актуально для тех, кто не владеет огромными фермами, а майнит с несколькими ASIC-устройствами или на GPU. Участие в пуле может повысить шансы на регулярный доход и упростить техническое сопровождение процесса."}$b1548$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 3, 'image',
       $b1549${"src":"/images/articles/mining-pools/asic-farm.png","alt":"ASIC-ферма для майнинга"}$b1549$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 4, 'heading',
       $h1550${"level":2,"text":"Что такое пул и какие функции он выполняет?"}$h1550$::jsonb,
       'chto-takoe'
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 5, 'paragraph',
       $b1551${"text":"Майнинговый пул – это объединение майнеров, работающих над добычей одного и того же блока совместно. Если пулу удается найти блок, награда распределяется между всеми участниками пропорционально их вкладу (вычислительной мощности).","html":"Майнинговый пул – это объединение майнеров, работающих над добычей одного и того же блока совместно. Если пулу удается найти блок, награда распределяется между всеми участниками пропорционально их вкладу (вычислительной мощности)."}$b1551$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 6, 'paragraph',
       $b1552${"text":"Функции пула:","html":"Функции пула:"}$b1552$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 7, 'list',
       $b1553${"ordered":false,"items":["Распределение заданий. Сервер пула отправляет каждому участнику задачу по хешированию;","Прием и проверка решений. Пул определяет, какие шары (решения) приняты, а какие нет;","Начисление вознаграждения. На основе принятых решений рассчитывается доля участия и доход;","Выплата средств. Пользователь получает доход на указанный кошелёк или аккаунт;","Аналитика и отчётность. Участники могут отслеживать эффективность устройств, статистику доходов и активность."]}$b1553$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 8, 'paragraph',
       $b1554${"text":"Сами пулы обычно представляют собой серверное программное обеспечение с интерфейсом для управления, мониторинга и поддержки пользователей.","html":"Сами пулы обычно представляют собой серверное программное обеспечение с интерфейсом для управления, мониторинга и поддержки пользователей."}$b1554$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 9, 'image',
       $b1555${"src":"/images/articles/mining-pools/what-is-pool.png","alt":"Что такое майнинг-пул"}$b1555$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 10, 'heading',
       $h1556${"level":2,"text":"Преимущества и недостатки пулов"}$h1556$::jsonb,
       'preimushhestva-nedostatki'
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 11, 'pros_cons',
       $b1557${"pros":["Регулярные выплаты. Даже при небольшом хешрейте можно получать доход ежедневно;","Надежность. Современные пулы имеют резервные сервера и защиту от DDoS-атак;","Удобство. Не нужно самостоятельно искать блоки и обслуживать собственный узел блокчейна;","Мониторинг. Подробные дашборды позволяют отслеживать статус работы оборудования в реальном времени;","Гибкие схемы выплат. Некоторые пулы предлагают выбор алгоритма вознаграждения – в зависимости от ваших предпочтений по стабильности и доходности."],"cons":["Комиссия. За обслуживание и инфраструктуру пул удерживает небольшой процент (обычно 1–3%);","Централизация. Участие большого количества майнеров в одном пуле снижает децентрализацию сети (вредно для идеологии блокчейна);","Зависимость от пула. При технических сбоях доход может быть временно приостановлен;","Меньшая потенциальная награда. В теории, одиночный майнер, нашедший блок, получает всё вознаграждение, но это маловероятно без крупных мощностей."]}$b1557$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 12, 'heading',
       $h1558${"level":2,"text":"Как выбрать пул для майнинга?"}$h1558$::jsonb,
       'kak-vybrat'
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 13, 'paragraph',
       $b1559${"text":"Выбор пула – важнейший шаг. От него напрямую зависит стабильность доходов и надежность всей майнинговой схемы.","html":"Выбор пула – важнейший шаг. От него напрямую зависит стабильность доходов и надежность всей майнинговой схемы."}$b1559$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 14, 'paragraph',
       $b1560${"text":"Основные критерии:","html":"Основные критерии:"}$b1560$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 15, 'rich_list',
       $b1561${"ordered":false,"items":[{"title":"Хешрейт пула","text":"Чем выше общий хешрейт, тем чаще пул находит блоки;"},{"title":"Метод распределения прибыли","text":"PPS (Pay Per Share) – стабильные выплаты за каждый принятый шар, PPLNS (Pay Per Last N Shares) – зависит от нахождения блока, FPPS – гибридная модель, включающая комиссию и доход от транзакций;"},{"title":"Комиссия пула","text":"Влияет на итоговую доходность;"},{"title":"Геолокация серверов","text":"Чем ближе сервер пула к вашей ферме, тем меньше пинг и лучше стабильность;"},{"title":"Прозрачность","text":"Надежные пулы публикуют статистику блоков, выплат, онлайн-поддержку;"},{"title":"Поддержка монет","text":"Одни пулы ориентированы на BTC, другие – под ETH, LTC, Kaspa и т.д.;"},{"title":"Порог выплат и способы вывода","text":"Некоторые пулы позволяют автоматически выводить доход на кошелёк, другие требуют ручного вывода."}]}$b1561$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 16, 'heading',
       $h1562${"level":2,"text":"Особенности пулов для пользователей из СНГ"}$h1562$::jsonb,
       'osobennosti-sng'
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 17, 'paragraph',
       $b1563${"text":"Майнерам из стран СНГ и других государств региона стоит учитывать следующие факторы, которые могут повлиять на возможность работы, безопасный запуск и стабильность дохода:","html":"Майнерам из стран СНГ и других государств региона стоит учитывать следующие факторы, которые могут повлиять на возможность работы, безопасный запуск и стабильность дохода:"}$b1563$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 18, 'list',
       $b1564${"ordered":false,"items":["Русскоязычный интерфейс. Удобство в настройке и мониторинге;","Сервера ближе к региону. Это снижает задержки и потери шар;","Юридические риски. Некоторые пулы (например, работающие через американские банки) могут ограничить доступ гражданам РФ;","Выплаты в USDT или напрямую в рублях через обменники. Это особенно важно при регулярных обналичиваниях;","Техническая поддержка. Желательно иметь возможность связи с техподдержкой на русском языке и через популярные каналы (Telegram, WhatsApp)."]}$b1564$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 19, 'paragraph',
       $b1565${"text":"А теперь познакомимся с ТОП-10 лучших пулов для майнинга в России и мире.","html":"А теперь познакомимся с ТОП-10 лучших пулов для майнинга в России и мире."}$b1565$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 20, 'heading',
       $h1566${"level":2,"text":"10 место: BTC.com (Битиси дот ком)"}$h1566$::jsonb,
       'btc-com'
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 21, 'paragraph',
       $b1567${"text":"Еще один пул, связанный с Bitmain Tech Ltd – платформа создана в 2016 году, хотя изначально компания основывалась как обозреватель блокчейна. Ключевая концепция BTC.com – максимально простой в использовании продукт для добычи основных криптоактивов. Авторам удалось реализовать идею на практике, так как популярность площадки достаточно высока.","html":"Еще один пул, связанный с Bitmain Tech Ltd – платформа создана в 2016 году, хотя изначально компания основывалась как обозреватель блокчейна. Ключевая концепция BTC.com – максимально простой в использовании продукт для добычи основных криптоактивов. Авторам удалось реализовать идею на практике, так как популярность площадки достаточно высока."}$b1567$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 22, 'paragraph',
       $b1568${"text":"К сожалению, российские пользователи больше не могут оценить простоту и удобство BTC.com, так как сервис заблокирован для майнеров РУ-сегмента. Причина, как и в случае с другими площадками – исполнение санкций. Кстати, несмотря на восточное происхождение, сервис также недоступен для пользователей из Китая.","html":"К сожалению, российские пользователи больше не могут оценить простоту и удобство BTC.com, так как сервис заблокирован для майнеров РУ-сегмента. Причина, как и в случае с другими площадками – исполнение санкций. Кстати, несмотря на восточное происхождение, сервис также недоступен для пользователей из Китая."}$b1568$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 23, 'image',
       $b1569${"src":"/images/articles/mining-pools/btc-com.png","alt":"BTC.com"}$b1569$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 24, 'stats',
       $b1570${"rows":[{"label":"Способ распределения награды","value":"FPPS"},{"label":"Лимиты выплат","value":"0,005 BTC"},{"label":"Периодичность начисления","value":"ежедневно"},{"label":"Комиссия","value":"4%"}]}$b1570$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 25, 'pros_cons',
       $b1571${"pros":["Простой и понятный интерфейс;","Высокая степень защиты;","Открытый исходный код;","Квалифицированная служба поддержки;","Добыча ключевых криптоактивов;","Множество языков поддержки."],"cons":["Отказ от работы с российскими майнерами;","Высокие комиссионные сборы;","Внушительная минимальная сумма для вывода – 0,005 BTC."]}$b1571$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 26, 'heading',
       $h1572${"level":2,"text":"9 место: Binance Pool (Бинанс Пул)"}$h1572$::jsonb,
       'binance-pool'
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 27, 'paragraph',
       $b1573${"text":"Сервис для майнинга от крупнейшей в мире биржи начал свою работу в 2020 году, поэтому данную площадку можно назвать относительно молодой. Являясь частью инфраструктуры Binance, платформа уделяет повышенное внимание алгоритму SHA-256 (добыча BTC и BCH), однако возможно «копать» и другие монеты. Пошлины за использование сервиса стандартные – 2,5%. Также существует формат работы с VIP-статусом для клиентов с высоким хэшрейтом. Таким майнерам предлагаются разнообразные бонусы и дополнительные преимущества.","html":"Сервис для майнинга от крупнейшей в мире биржи начал свою работу в 2020 году, поэтому данную площадку можно назвать относительно молодой. Являясь частью инфраструктуры Binance, платформа уделяет повышенное внимание алгоритму SHA-256 (добыча BTC и BCH), однако возможно «копать» и другие монеты. Пошлины за использование сервиса стандартные – 2,5%. Также существует формат работы с VIP-статусом для клиентов с высоким хэшрейтом. Таким майнерам предлагаются разнообразные бонусы и дополнительные преимущества."}$b1573$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 28, 'paragraph',
       $b1574${"text":"Для того чтобы начать пользоваться Binance Pool, необходимо зарегистрироваться на платформе и осуществить верификацию личности. Это может стать препятствием для работы РУ-сегмента, так как Бинанс постепенно ограничивает работу российских пользователей со своими инструментами.","html":"Для того чтобы начать пользоваться Binance Pool, необходимо зарегистрироваться на платформе и осуществить верификацию личности. Это может стать препятствием для работы РУ-сегмента, так как Бинанс постепенно ограничивает работу российских пользователей со своими инструментами."}$b1574$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 29, 'image',
       $b1575${"src":"/images/articles/mining-pools/binance-pool.png","alt":"Binance Pool"}$b1575$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 30, 'stats',
       $b1576${"rows":[{"label":"Способ распределения награды","value":"FPPS"},{"label":"Лимиты выплат","value":"ограничений нет"},{"label":"Периодичность начисления","value":"ежедневно"},{"label":"Комиссия","value":"2,5%"}]}$b1576$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 31, 'pros_cons',
       $b1577${"pros":["Надежность благодаря принадлежности к инфраструктуре Binance;","Ежедневное начисление заработка;","Хэшрейт отображается в онлайн-формате;","Дополнительные инструменты для увеличения доходов майнера;","Возможность получить VIP-статус и пользоваться преимуществами;","Поддержка большинства алгоритмов и монет;","Круглосуточная тех. поддержка."],"cons":["Необходимость прохождения обязательной верификации;","Трудности работы для РУ-сегмента."]}$b1577$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 32, 'heading',
       $h1578${"level":2,"text":"8 место: KuCoin (Кукоин)"}$h1578$::jsonb,
       'kucoin'
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 33, 'paragraph',
       $b1579${"text":"«Карманный» майнинговый пул известной криптобиржи с одноименным названием. Это очень молодая платформа, запуск которой состоялся в 2021 году, однако, работая в связке с биржей, инструмент прост и удобен. Именно легкость интерфейса и предельная производительность является основой сервиса, который позволяет добывать всего две монеты – это BTC и BCH. Зачисление средств производится на следующий день – активы поступают на связанный с пулом аккаунт пользователя на бирже KuCoin.","html":"«Карманный» майнинговый пул известной криптобиржи с одноименным названием. Это очень молодая платформа, запуск которой состоялся в 2021 году, однако, работая в связке с биржей, инструмент прост и удобен. Именно легкость интерфейса и предельная производительность является основой сервиса, который позволяет добывать всего две монеты – это BTC и BCH. Зачисление средств производится на следующий день – активы поступают на связанный с пулом аккаунт пользователя на бирже KuCoin."}$b1579$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 34, 'paragraph',
       $b1580${"text":"Затраты майнера составляют 2%, что ниже среднего значения в масштабах всего сегмента. Площадка отличается простотой регистрации, настройки и запуска. Поддержка своевременно обрабатывает запросы и оперативно помогает майнерам, интерфейсы сайта качественно переведены на русский язык.","html":"Затраты майнера составляют 2%, что ниже среднего значения в масштабах всего сегмента. Площадка отличается простотой регистрации, настройки и запуска. Поддержка своевременно обрабатывает запросы и оперативно помогает майнерам, интерфейсы сайта качественно переведены на русский язык."}$b1580$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 35, 'stats',
       $b1581${"rows":[{"label":"Способ распределения награды","value":"FPPS"},{"label":"Лимиты выплат","value":"ограничений нет"},{"label":"Периодичность начисления","value":"ежедневно"},{"label":"Комиссия","value":"2%"}]}$b1581$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 36, 'pros_cons',
       $b1582${"pros":["Привязка к известной бирже;","Доступность и простота;","Качественная поддержка;","Удобный интерфейс."],"cons":["Всего две монеты для майнинга;","Осенью 2023 года была зафиксирована приостановка сервиса для переезда на обновленную платформу. Данное явление понизило репутацию KuCoin у опытных пользователей."]}$b1582$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 37, 'heading',
       $h1583${"level":2,"text":"7 место: 2miners (Тумайнерс)"}$h1583$::jsonb,
       '2miners'
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 38, 'paragraph',
       $b1584${"text":"В противовес Braiins Pool, где можно «копать» только Биток, существует 2miners, с помощью которого добывается множество монет, среди которых Биткоина нет. Мультивалютная платформа с 20+ вариантами майнинга ориентирована на международное сообщество. Пользователь самостоятельно выбирает формат добычи, от которого зависит в том числе и пошлина (1% для PPLNS и 1,5% для Solo).","html":"В противовес Braiins Pool, где можно «копать» только Биток, существует 2miners, с помощью которого добывается множество монет, среди которых Биткоина нет. Мультивалютная платформа с 20+ вариантами майнинга ориентирована на международное сообщество. Пользователь самостоятельно выбирает формат добычи, от которого зависит в том числе и пошлина (1% для PPLNS и 1,5% для Solo)."}$b1584$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 39, 'paragraph',
       $b1585${"text":"Отзывы о 2miners противоречивые. С одной стороны, это современный инструмент с множеством монет для заработка. Но с другой – поддержка не отличается эффективностью работы, в процессе добычи встречаются сбои и доходы не всегда оправдывают ожиданий. Но несмотря на такие данные, продукт обладает своими поклонниками по всему миру.","html":"Отзывы о 2miners противоречивые. С одной стороны, это современный инструмент с множеством монет для заработка. Но с другой – поддержка не отличается эффективностью работы, в процессе добычи встречаются сбои и доходы не всегда оправдывают ожиданий. Но несмотря на такие данные, продукт обладает своими поклонниками по всему миру."}$b1585$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 40, 'image',
       $b1586${"src":"/images/articles/mining-pools/2miners.png","alt":"2miners"}$b1586$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 41, 'stats',
       $b1587${"rows":[{"label":"Способ распределения награды","value":"PPLNS, Solo"},{"label":"Лимиты выплат","value":"0,1 ETC"},{"label":"Периодичность начисления","value":"ежедневно"},{"label":"Комиссия","value":"1% (PPLNS), 1,5% (Solo)"}]}$b1587$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 42, 'pros_cons',
       $b1588${"pros":["Множество монет для майнинга;","Простая регистрация и быстрый старт;","Два формата работы;","Серьезная защита от взлома;","Система ботов и уведомлений для оповещения о важных событиях;","Встроенный калькулятор;","Детальная статистика;","Низкие комиссионные сборы;","Поддержка множества языков."],"cons":["Работа платформы не отличается стабильностью;","Среди добываемых монет нет BTC;","Претензии пользователей к работе поддержки."]}$b1588$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 43, 'heading',
       $h1589${"level":2,"text":"6 место: Braiins Pool (Брэйнз Пул)"}$h1589$::jsonb,
       'braiins-pool'
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 44, 'paragraph',
       $b1590${"text":"Старейший пул для майнинга, основанный в далеком 2010 году (ранее проект назывался Slush Pool, его авторами являются разработчики кошелька Trezor). Принято считать, что Braiins Pool является лучшим продуктом для начинающих майнеров, так как процесс подключения прост и понятен. Инструмент обладает удобным мобильным приложением, интерфейсы качественно переведены на различные языки мира, включая русский. Еще одна отличительная черта – максимальная прозрачность работы Braiins Pool за счет детальной статистики и точности данных.","html":"Старейший пул для майнинга, основанный в далеком 2010 году (ранее проект назывался Slush Pool, его авторами являются разработчики кошелька Trezor). Принято считать, что Braiins Pool является лучшим продуктом для начинающих майнеров, так как процесс подключения прост и понятен. Инструмент обладает удобным мобильным приложением, интерфейсы качественно переведены на различные языки мира, включая русский. Еще одна отличительная черта – максимальная прозрачность работы Braiins Pool за счет детальной статистики и точности данных."}$b1590$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 45, 'paragraph',
       $b1591${"text":"Интересно, что на этом сервисе можно добывать только Биткоин, так как авторы разработки признают лишь первую криптовалюту. Именно по этой причине многие майнеры после получения базового опыта на Braiins Pool переезжают на альтернативные площадки, где перечень монет значительно больше.","html":"Интересно, что на этом сервисе можно добывать только Биткоин, так как авторы разработки признают лишь первую криптовалюту. Именно по этой причине многие майнеры после получения базового опыта на Braiins Pool переезжают на альтернативные площадки, где перечень монет значительно больше."}$b1591$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 46, 'image',
       $b1592${"src":"/images/articles/mining-pools/braiins.png","alt":"Braiins Pool"}$b1592$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 47, 'stats',
       $b1593${"rows":[{"label":"Способ распределения награды","value":"Score"},{"label":"Лимиты выплат","value":"0,001 BTC"},{"label":"Периодичность начисления","value":"ежедневно"},{"label":"Комиссия","value":"2%"}]}$b1593$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 48, 'pros_cons',
       $b1594${"pros":["Хорошая репутация за счет возраста;","Простота для новичков;","Детальная статистика в режиме реального времени;","Качественная поддержка 24/7;","Ежедневные выплаты."],"cons":["Всего одна валюта для майнинга;","Особая система начисления награды Score, которая зависит в том числе от возраста аккаунта;","Минимальная сумма вывода – 0,001 Биткоина (можно вывести и меньше, но с дополнительными расходами)."]}$b1594$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 49, 'heading',
       $h1595${"level":2,"text":"5 место: OKX Pool (Окейикс Пул)"}$h1595$::jsonb,
       'okx-pool'
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 50, 'paragraph',
       $b1596${"text":"Собственный пул еще одной крупной биржи. Позволяет добывать основные криптовалюты, однако наибольшую популярность OKX Pool обрел именно у добытчиков ETC. Работа платформы стабильна, механизмы защиты находятся на высоком уровне, что позволяет не беспокоиться за сохранность активов. Ежедневное начисление награды удобно пользователю, как и отсутствие минимальной суммы для вывода.","html":"Собственный пул еще одной крупной биржи. Позволяет добывать основные криптовалюты, однако наибольшую популярность OKX Pool обрел именно у добытчиков ETC. Работа платформы стабильна, механизмы защиты находятся на высоком уровне, что позволяет не беспокоиться за сохранность активов. Ежедневное начисление награды удобно пользователю, как и отсутствие минимальной суммы для вывода."}$b1596$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 51, 'paragraph',
       $b1597${"text":"Главной ложкой дегтя является наличие обязательной верификации, да еще и в фото-формате: многие майнеры стараются сохранить анонимность, следовательно, подобный фактор может оказаться неприемлемым. Кроме того, OKX Pool отличается высокими пошлинами – 4%. Это значение несколько выше среднего по отрасли.","html":"Главной ложкой дегтя является наличие обязательной верификации, да еще и в фото-формате: многие майнеры стараются сохранить анонимность, следовательно, подобный фактор может оказаться неприемлемым. Кроме того, OKX Pool отличается высокими пошлинами – 4%. Это значение несколько выше среднего по отрасли."}$b1597$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 52, 'stats',
       $b1598${"rows":[{"label":"Способ распределения награды","value":"PPLNS"},{"label":"Лимиты выплат","value":"ограничений нет"},{"label":"Периодичность начисления","value":"ежедневно"},{"label":"Комиссия","value":"4%"}]}$b1598$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 53, 'pros_cons',
       $b1599${"pros":["Доход майнера отображается в режиме реального времени и начисляется автоматически;","Отсутствуют ограничения по минимальной сумме вывода;","Поддержка основных монет и алгоритмов добычи;","Достойная поддержка пользователей 24/7;","Ежедневные выплаты."],"cons":["Обязательная фото-верификация;","Высокие комиссионные сборы."]}$b1599$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 54, 'heading',
       $h1600${"level":2,"text":"4 место: F2Pool (Эфтупул)"}$h1600$::jsonb,
       'f2pool'
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 55, 'paragraph',
       $b1601${"text":"Один из крупнейших пулов для майнинга, который существует с 2013 года (на момент основания он назывался Discus Fish). Старая и проверенная платформа, которой доверяют миллионы майнеров со всего мира – площадка успешно работает по всему миру, предлагая множество языков интерфейса и поддержки, включая русский.","html":"Один из крупнейших пулов для майнинга, который существует с 2013 года (на момент основания он назывался Discus Fish). Старая и проверенная платформа, которой доверяют миллионы майнеров со всего мира – площадка успешно работает по всему миру, предлагая множество языков интерфейса и поддержки, включая русский."}$b1601$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 56, 'paragraph',
       $b1602${"text":"F2Pool предлагает функции дополнительного заработка, например, объединенный майнинг – участие в добыче бонусных монет, получаемых вместе с основными. Это позволяет зарабатывать больше, не увеличивая хэшрейт оборудования. Но есть и недостаток – это необычный формат работы с пассивными аккаунтами. Если вовремя не выводить средства и не проявлять активность в учетной записи, профиль могут заморозить, а имеющиеся средства направить в формате доната на развитие F2Pool.","html":"F2Pool предлагает функции дополнительного заработка, например, объединенный майнинг – участие в добыче бонусных монет, получаемых вместе с основными. Это позволяет зарабатывать больше, не увеличивая хэшрейт оборудования. Но есть и недостаток – это необычный формат работы с пассивными аккаунтами. Если вовремя не выводить средства и не проявлять активность в учетной записи, профиль могут заморозить, а имеющиеся средства направить в формате доната на развитие F2Pool."}$b1602$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 57, 'image',
       $b1603${"src":"/images/articles/mining-pools/f2pool.png","alt":"F2Pool"}$b1603$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 58, 'stats',
       $b1604${"rows":[{"label":"Способ распределения награды","value":"PPS+"},{"label":"Лимиты выплат","value":"0,005 BTC"},{"label":"Периодичность начисления","value":"ежедневно"},{"label":"Комиссия","value":"2,5%"}]}$b1604$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 59, 'pros_cons',
       $b1605${"pros":["Возраст и репутация;","Высокая степень защиты аккаунтов;","Множество монет для добычи;","Функция объединенного майнинга;","Мировая известность и популярность;","Хорошая поддержка."],"cons":["Необходимость своевременного вывода монет;","Важность активности в аккаунте для защиты от блокировки;","Существенные минимальные лимиты выплат."]}$b1605$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 60, 'heading',
       $h1606${"level":2,"text":"3 место: Poolin (Пулин)"}$h1606$::jsonb,
       'poolin'
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 61, 'paragraph',
       $b1607${"text":"Относительно молодая платформа для добычи криптовалют, которая быстро завоевала популярность в мире майнинга. Подобное стало возможным благодаря совокупности преимуществ, главным из которых является формат объединенного майнинга. В зависимости от курса криптовалют, система позволяет добывать сразу несколько монет, задействовав одни и те же вычислительные мощности. Данная функция работает автоматически, исключая вмешательство майнера.","html":"Относительно молодая платформа для добычи криптовалют, которая быстро завоевала популярность в мире майнинга. Подобное стало возможным благодаря совокупности преимуществ, главным из которых является формат объединенного майнинга. В зависимости от курса криптовалют, система позволяет добывать сразу несколько монет, задействовав одни и те же вычислительные мощности. Данная функция работает автоматически, исключая вмешательство майнера."}$b1607$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 62, 'paragraph',
       $b1608${"text":"Пользователи отмечают простой интерфейс системы, быструю регистрацию и ежедневные выплаты. Среди недостатков называется высокий лимит на экспорт – 0,005 Биткоина. Также с именем Poolin связано громкое судебное разбирательство – поскольку создателями являются разработчики компании Bitmain, ей пришлось подать иск с обвинением в нарушении трудового договора. Сумма выплат составила почти 200 000$.","html":"Пользователи отмечают простой интерфейс системы, быструю регистрацию и ежедневные выплаты. Среди недостатков называется высокий лимит на экспорт – 0,005 Биткоина. Также с именем Poolin связано громкое судебное разбирательство – поскольку создателями являются разработчики компании Bitmain, ей пришлось подать иск с обвинением в нарушении трудового договора. Сумма выплат составила почти 200 000$."}$b1608$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 63, 'image',
       $b1609${"src":"/images/articles/mining-pools/poolin.png","alt":"Poolin"}$b1609$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 64, 'stats',
       $b1610${"rows":[{"label":"Способ распределения награды","value":"FPPS"},{"label":"Лимиты выплат","value":"0,005 BTC"},{"label":"Периодичность начисления","value":"ежедневно"},{"label":"Комиссия","value":"2,5%"}]}$b1610$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 65, 'pros_cons',
       $b1611${"pros":["Простая регистрация аккаунта, легкое подключение и быстрый старт;","Анонимность майнинга;","Функция объединенной добычи нескольких монет;","Качественная поддержка пользователей, в том числе в Telegram;","Внутренний рейтинг майнеров;","Собственный калькулятор доходности;","Оперативное оповещение об изменениях хэшрейта."],"cons":["Высокая сумма экспорта актива – 0,005 BTC;","Не все разделы сайта качественно переведены на русский язык."]}$b1611$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 66, 'heading',
       $h1612${"level":2,"text":"2 место: AntPool (ЭнтПул)"}$h1612$::jsonb,
       'antpool'
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 67, 'paragraph',
       $b1613${"text":"Один из старейших пулов по добыче криптовалют, основанный в 2014 году. Принадлежит известнейшему производителю оборудования для майнинга, компании Bitmain Tech Ltd. AntPool долгое время удерживал лидерство в сегменте по числу пользователей и суммарному хэшрейту, а сегодня площадка продолжает входить в ТОП-10 наиболее популярных сервисов совместной добычи цифровых активов.","html":"Один из старейших пулов по добыче криптовалют, основанный в 2014 году. Принадлежит известнейшему производителю оборудования для майнинга, компании Bitmain Tech Ltd. AntPool долгое время удерживал лидерство в сегменте по числу пользователей и суммарному хэшрейту, а сегодня площадка продолжает входить в ТОП-10 наиболее популярных сервисов совместной добычи цифровых активов."}$b1613$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 68, 'paragraph',
       $b1614${"text":"Пользователям предлагается два формата распределения награды – это FPPS (комиссия 4%) и PPLNS (0%). Кроме того, допустима возможность Solo-майнинга для пользователей с большими объемами вычислительных мощностей. Выплаты осуществляются ежедневно, однако есть ограничение минимальной суммы экспорта – 0,005 BTC.","html":"Пользователям предлагается два формата распределения награды – это FPPS (комиссия 4%) и PPLNS (0%). Кроме того, допустима возможность Solo-майнинга для пользователей с большими объемами вычислительных мощностей. Выплаты осуществляются ежедневно, однако есть ограничение минимальной суммы экспорта – 0,005 BTC."}$b1614$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 69, 'image',
       $b1615${"src":"/images/articles/mining-pools/antpool.png","alt":"AntPool"}$b1615$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 70, 'stats',
       $b1616${"rows":[{"label":"Способ распределения награды","value":"FPPS и PPLNS"},{"label":"Лимиты выплат","value":"0,005 BTC"},{"label":"Периодичность начисления","value":"ежедневно"},{"label":"Комиссия","value":"4% (FPPS), 0% (PPLNS)"}]}$b1616$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 71, 'pros_cons',
       $b1617${"pros":["Статус старейшего и надежного;","Быстрая регистрация;","Отсутствие необходимости верификации личности;","Ежедневные выплаты;","Возможность выбора одного из нескольких форматов работы;","Множество настроек;","Поддержка 24/7;","Наличие базовых монет для майнинга;","Отсутствие комиссии для PPLNS;","Множество языков интерфейса;","Общение между пользователями в чате и на форуме."],"cons":["Высокие комиссии для FPPS (4%);","Сложность настройки для новичков;","Высокая стартовая сумма вывода – 0,005 BTC."]}$b1617$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 72, 'heading',
       $h1618${"level":2,"text":"1 место: ViaBTC (Виабитиси)"}$h1618$::jsonb,
       'viabtc'
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 73, 'paragraph',
       $b1619${"text":"Китайская платформа, начавшая свою работу в 2016 году. Площадка ViaBTC полюбилась пользователям за простоту интерфейса, высокую степень надежности и функцию смарт-майнинга (инструмент автоматического переключения добычи на более выгодную монету). Пул является частью экосистемы, объединяющей кошелек и биржу CoinEx, что удобно с инфраструктурной точки зрения.","html":"Китайская платформа, начавшая свою работу в 2016 году. Площадка ViaBTC полюбилась пользователям за простоту интерфейса, высокую степень надежности и функцию смарт-майнинга (инструмент автоматического переключения добычи на более выгодную монету). Пул является частью экосистемы, объединяющей кошелек и биржу CoinEx, что удобно с инфраструктурной точки зрения."}$b1619$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 74, 'paragraph',
       $b1620${"text":"Платформа позволяет выводить минимум 0,001 Биткоина, а процесс экспорта без комиссии может потребовать дополнительных действий. Например, сначала вывести имеющийся актив на биржу CoinEx (сборы 0%), а уже затем отправлять на сторонние сервисы (биржи или криптокошельки). Кроме того, ViaBTC предлагает пользователям сразу три формата добычи – это PPLNS, PPS+ и Solo (комиссии на добычу зависят от сделанного выбора).","html":"Платформа позволяет выводить минимум 0,001 Биткоина, а процесс экспорта без комиссии может потребовать дополнительных действий. Например, сначала вывести имеющийся актив на биржу CoinEx (сборы 0%), а уже затем отправлять на сторонние сервисы (биржи или криптокошельки). Кроме того, ViaBTC предлагает пользователям сразу три формата добычи – это PPLNS, PPS+ и Solo (комиссии на добычу зависят от сделанного выбора)."}$b1620$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 75, 'image',
       $b1621${"src":"/images/articles/mining-pools/viabtc.png","alt":"ViaBTC"}$b1621$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 76, 'stats',
       $b1622${"rows":[{"label":"Способ распределения награды","value":"PPLNS, PPS+, Solo"},{"label":"Лимиты выплат","value":"0,001 BTC"},{"label":"Периодичность начисления","value":"ежедневно"},{"label":"Комиссия","value":"4% (PPS+), 2% (PPLNS), 1% (Solo)"}]}$b1622$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 77, 'pros_cons',
       $b1623${"pros":["Простой и понятный интерфейс (один из лучших вариантов для новичков);","Возраст и трастовость;","Три формата добычи;","Функция смарт-майнинга;","Добыча популярных форматов и криптовалют;","Является частью целой экосистемы;","Удобное приложение для мобильных устройств."],"cons":["Наличие минимальной суммы для вывода – 0,001 BTC;","Высокие сборы для PPS+ майнинга;","Необходимость совершения «лишних» транзакций для вывода средств без дополнительных расходов."]}$b1623$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 78, 'heading',
       $h1624${"level":2,"text":"Выводы"}$h1624$::jsonb,
       'vyvody'
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 79, 'paragraph',
       $b1625${"text":"Майнинговые пулы – необходимый инструмент для большинства участников рынка. Они повышают шансы на стабильный доход, упрощают процесс добычи и снижают технические риски.","html":"Майнинговые пулы – необходимый инструмент для большинства участников рынка. Они повышают шансы на стабильный доход, упрощают процесс добычи и снижают технические риски."}$b1625$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 80, 'paragraph',
       $b1626${"text":"При выборе пула важно учитывать:","html":"При выборе пула важно учитывать:"}$b1626$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 81, 'list',
       $b1627${"ordered":false,"items":["Комиссии;","Репутацию;","Географическую близость серверов;","Методы выплат;","Поддерживаемые монеты;","Наличие русскоязычной поддержки и прозрачных правил."]}$b1627$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';

INSERT INTO article_blocks (article_id, position, type, payload, anchor)
SELECT a.id, 82, 'paragraph',
       $b1628${"text":"Для майнеров из СНГ стоит выбирать платформы с понятными условиями, быстрым доступом, поддержкой локальной валюты и удобным выводом средств. Участие в качественном пуле позволяет сосредоточиться на главном – повышении эффективности и окупаемости оборудования.","html":"Для майнеров из СНГ стоит выбирать платформы с понятными условиями, быстрым доступом, поддержкой локальной валюты и удобным выводом средств. Участие в качественном пуле позволяет сосредоточиться на главном – повышении эффективности и окупаемости оборудования."}$b1628$::jsonb,
       NULL
FROM articles a WHERE a.slug = 'luchshie-puly-dlya-majninga-top-10';
