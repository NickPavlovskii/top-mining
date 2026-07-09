export interface TopMiningRatingItem {
  number: string
  label: string
  href: string
}

export interface TopMiningRatingCard {
  id: string
  title: string
  items: TopMiningRatingItem[]
  /** 1 — один столбец, 2 — два столбца (задаётся в данных карточки). */
  columns?: 1 | 2
}

export const DEFAULT_RATING_CARD_COLUMNS = 1 as const

function pickHomeItems(
  card: TopMiningRatingCard,
  itemNumbers: string[],
  columns?: 1 | 2,
): TopMiningRatingCard {
  const items = itemNumbers.map((itemNumber, index) => {
    const item = card.items.find((entry) => entry.number === itemNumber)

    if (!item) {
      throw new Error(
        `Rating item ${itemNumber} not found in card "${card.id}"`,
      )
    }

    return {
      ...item,
      number: String(index + 1).padStart(2, '0'),
    }
  })

  return {
    id: card.id,
    title: card.title,
    items,
    columns,
  }
}

function createHomeCard(
  id: string,
  title: string,
  sources: Array<{ cardId: string; itemNumber: string }>,
  columns?: 1 | 2,
): TopMiningRatingCard {
  const items = sources.map(({ cardId, itemNumber }, index) => {
    const card = findCard(cardId)
    const item = card.items.find((entry) => entry.number === itemNumber)

    if (!item) {
      throw new Error(
        `Rating item ${itemNumber} not found in card "${cardId}"`,
      )
    }

    return {
      ...item,
      number: String(index + 1).padStart(2, '0'),
    }
  })

  return {
    id,
    title,
    items,
    columns,
  }
}

function findCard(id: string) {
  const card = TOP_MINING_RATING_CARDS.find((entry) => entry.id === id)

  if (!card) {
    throw new Error(`Rating card "${id}" not found`)
  }

  return card
}

export const TOP_MINING_RATING_SURFACE = 'var(--tm-rating-surface)'

export const TOP_MINING_RATING_VIDEO =
  'https://top-mining.ru/wp-content/themes/top-mining/img/home-h2-rating.mp4'

export const TOP_MINING_RATING_CARDS: TopMiningRatingCard[] = [
  {
    "id": "equipment",
    "title": "ТОП: Техника и оборудование",
    "items": [
      {
        "href": "https://top-mining.ru/rating/luchshie-asiki-antminer-top-5-majnerov-ot-bitmain-v-2025-godu/",
        "number": "01",
        "label": "Лучшие асики Antminer: ТОП-10 майнеров от Bitmain в 2026 году"
      },
      {
        "href": "https://top-mining.ru/rating/rejting-majnerov-s-wi-fi-top-3-asika-bez-provodov/",
        "number": "02",
        "label": "Рейтинг майнеров с Wi-Fi: ТОП-3 асика без проводов"
      },
      {
        "href": "https://top-mining.ru/rating/rejting-asikov-na-scrypt-top-5-luchshih-majnerov-doge/",
        "number": "03",
        "label": "Рейтинг асиков на Scrypt: ТОП-10 лучших майнеров DOGE"
      },
      {
        "href": "https://top-mining.ru/rating/luchshie-asiki-dlya-majninga-altkoinov-top-10-majnerov-ne-dlya-btc/",
        "number": "04",
        "label": "Лучшие асики для майнинга альткоинов 2026: ТОП-10 майнеров не для BTC"
      },
      {
        "href": "https://top-mining.ru/rating/rejting-asikov-s-vodyanym-ohlazhdeniem-top-10-majnerov/",
        "number": "05",
        "label": "Рейтинг асиков с водяным охлаждением: ТОП-10 майнеров"
      },
      {
        "href": "https://top-mining.ru/rating/rejting-ustrojstv-dlya-majninga-top-6-formatov-oborudovaniya-po-dobyche-kriptovalyut/",
        "number": "06",
        "label": "Рейтинг устройств для майнинга: ТОП-6 форматов оборудования по добыче криптовалют"
      },
      {
        "href": "https://top-mining.ru/rating/kakie-asiki-vybrat-top-8-proizvoditelej-oborudovaniya-dlya-majninga/",
        "number": "07",
        "label": "Какие асики выбрать: ТОП-10 производителей оборудования для майнинга"
      },
      {
        "href": "https://top-mining.ru/rating/luchshie-asiki-dlya-majninga-v-2024-godu-top-10/",
        "number": "08",
        "label": "Лучшие асики для майнинга в 2026 году: ТОП-10"
      },
      {
        "href": "https://top-mining.ru/rating/rejting-videokart-dlya-majninga-v-2024-godu-top-10-2/",
        "number": "09",
        "label": "Рейтинг видеокарт для майнинга в 2026 году: ТОП-10"
      },
      {
        "href": "https://top-mining.ru/rating/luchshie-proizvoditeli-videokart-top-10-brendov/",
        "number": "10",
        "label": "Лучшие производители видеокарт: ТОП-10 брендов"
      },
      {
        "href": "https://top-mining.ru/rating/rejting-cpu-dlya-majninga-top-10-proczessorov-v-2024-godu/",
        "number": "11",
        "label": "Рейтинг CPU для майнинга: ТОП-10 процессоров в 2026 году"
      },
      {
        "href": "https://top-mining.ru/rating/rejting-poderzhannyh-asikov-top-7-b-u-majnerov-na-vtorichnom-rynke/",
        "number": "12",
        "label": "Рейтинг подержанных асиков 2026: ТОП-7 б/у майнеров"
      },
      {
        "href": "https://top-mining.ru/rating/samye-populyarnye-asiki-dlya-majninga-top-5/",
        "number": "13",
        "label": "Самые популярные асики для майнинга: ТОП-8"
      },
      {
        "href": "https://top-mining.ru/rating/samyj-dorogoj-asik-dlya-majninga-v-2024-godu-top-3/",
        "number": "14",
        "label": "Самый дорогой асик для майнинга в 2026 году: ТОП-5"
      },
      {
        "href": "https://top-mining.ru/rating/toptehnika-i-oborudovanie/samye-moshhnye-asiki-dlya-majninga-bitkoinov-v-2024-godu-top-5/",
        "number": "15",
        "label": "Самые мощные асики для майнинга Биткоинов: ТОП-10"
      },
      {
        "href": "https://top-mining.ru/rating/samyj-tihij-asik-dlya-majninga-v-kvartire-top-5/",
        "number": "16",
        "label": "Самые тихие асики для майнинга в квартире: ТОП-8"
      },
      {
        "href": "https://top-mining.ru/rating/top-5-samye-deshevye-videokarty-dlya-majninga-v-2024-godu-rejting-i-czeny/",
        "number": "17",
        "label": "ТОП-5: самые дешевые видеокарты для майнинга в 2026 году"
      },
      {
        "href": "https://top-mining.ru/rating/luchshij-asik-dlya-domashnego-majninga-v-2024-godu/",
        "number": "18",
        "label": "ТОП-8 лучших асиков для домашнего майнинга в 2026 году"
      },
      {
        "href": "https://top-mining.ru/rating/rejting-kontejnerov-dlya-majninga-top-10/",
        "number": "19",
        "label": "Рейтинг контейнеров для майнинга в 2026 году: ТОП-9 производителей"
      },
      {
        "href": "https://top-mining.ru/rating/luchshie-asiki-dlya-majninga-kaspy-top-5/",
        "number": "20",
        "label": "Лучшие асики для майнинга Каспы: ТОП-5"
      },
      {
        "href": "https://top-mining.ru/rating/rejting-shumboksov-top-10-proizvoditelej/",
        "number": "21",
        "label": "Рейтинг шумбоксов: ТОП-5 производителей"
      }
    ]
  },
  {
    "id": "tools",
    "title": "ТОП: Инструменты и сервисы",
    "items": [
      {
        "href": "https://top-mining.ru/rating/sekrety-i-lajfhaki-majninga-na-asikah-kak-vyzhat-maksimum-iz-majnerov-v-2025-godu/",
        "number": "01",
        "label": "Секреты и лайфхаки майнинга на асиках: как выжать максимум из майнеров в 2026 году"
      },
      {
        "href": "https://top-mining.ru/rating/top-10-populyarnyh-kalkulyatorov-dlya-majninga-preimushhestva-i-nedostatki/",
        "number": "02",
        "label": "ТОП-10 популярных калькуляторов для майнинга: преимущества и недостатки"
      },
      {
        "href": "https://top-mining.ru/rating/luchshij-holodnyj-koshelek-dlya-kriptovalyuty-top-10/",
        "number": "03",
        "label": "Лучший холодный кошелек для криптовалюты: ТОП-10"
      },
      {
        "href": "https://top-mining.ru/rating/luchshie-kriptobirzhi-top-10/",
        "number": "04",
        "label": "Лучшие криптобиржи: ТОП-10"
      },
      {
        "href": "https://top-mining.ru/rating/luchshij-majning-otel-top-10-hostingov-dlya-majninga/",
        "number": "05",
        "label": "Лучший майнинг отель: ТОП-10 хостингов для майнинга"
      },
      {
        "href": "https://top-mining.ru/rating/kakoj-koshelek-dlya-kriptovalyuty-vybrat-10-luchshih-goryachih-hranilishh/",
        "number": "06",
        "label": "Какой кошелек для криптовалюты выбрать: 10 лучших &#8220;горячих&#8221; хранилищ"
      },
      {
        "href": "https://top-mining.ru/rating/luchshij-pul-dlya-majninga-bitkoina-v-2024-godu-dlya-rossii-top-3-3/",
        "number": "07",
        "label": "Лучший пул для майнинга Биткоина в 2026 году для России: ТОП-3"
      },
      {
        "href": "https://top-mining.ru/rating/luchshie-puly-dlya-majninga-top-10/",
        "number": "08",
        "label": "Лучшие пулы для майнинга: ТОП-10"
      },
      {
        "href": "https://top-mining.ru/rating/rejting-proshivok-dlya-asikov-top-5/",
        "number": "09",
        "label": "Рейтинг прошивок для асиков: ТОП-5"
      },
      {
        "href": "https://top-mining.ru/rating/rejting-kriptoobmennikov-top-10-luchshih-obmennikov-kriptovalyut-v-2024-godu/",
        "number": "10",
        "label": "ТОП-8 лучших обменников криптовалют в 2026 году"
      },
      {
        "href": "https://top-mining.ru/rating/knigi-pro-majning-top-5-izdanij/",
        "number": "11",
        "label": "Книги про майнинг: ТОП-5 изданий"
      },
      {
        "href": "https://top-mining.ru/rating/luchshie-kanaly-o-majninge-na-youtube-top-10/",
        "number": "12",
        "label": "Лучшие каналы о майнинге на youtube: ТОП-10"
      },
      {
        "href": "https://top-mining.ru/rating/luchshie-kanaly-o-majninge-v-telegram-top-10/",
        "number": "13",
        "label": "Лучшие каналы о майнинге в Telegram: ТОП-10"
      }
    ]
  },
  {
    "id": "sales",
    "title": "ТОП: Продажи и услуги",
    "items": [
      {
        "href": "https://top-mining.ru/rating/luchshie-majningovye-kompanii-rossii-top-10-liderov-v-sfere-prodazhi-i-razmeshheniya-asikov/",
        "number": "01",
        "label": "Лучшие майнинговые компании России: ТОП-10 лидеров в сфере продажи и размещения асиков"
      },
      {
        "href": "https://top-mining.ru/rating/rejting-stran-po-majningu-top-8-gosudarstv-liderov/",
        "number": "02",
        "label": "Рейтинг стран по майнингу: ТОП-8 государств-лидеров"
      },
      {
        "href": "https://top-mining.ru/rating/gde-kupit-asik-dlya-majninga-top-10-magazinov/",
        "number": "03",
        "label": "Где купить асик для майнинга: ТОП-10 магазинов"
      },
      {
        "href": "https://top-mining.ru/rating/top-10-platform-dlya-oblachnogo-majninga-rejting-2024-goda-2/",
        "number": "04",
        "label": "ТОП-9 платформ для облачного майнинга: рейтинг 2026 года"
      }
    ]
  },
  {
    "id": "crypto",
    "title": "ТОП: Криптовалюты и токены",
    "items": [
      {
        "href": "https://top-mining.ru/rating/rejting-algoritmov-majninga-na-asikah-top-10/",
        "number": "01",
        "label": "Рейтинг алгоритмов майнинга на асиках: ТОП-10"
      },
      {
        "href": "https://top-mining.ru/rating/majning-kriptovalyuty-rejting-luchshih-monet-dlya-dobychi/",
        "number": "02",
        "label": "Майнинг криптовалюты: ТОП-7 лучших монет для добычи в 2026 году"
      },
      {
        "href": "https://top-mining.ru/rating/luchshaya-kriptovalyuta-v-2024-godu-rejting-monet-dlya-investirovaniya/",
        "number": "03",
        "label": "Лучшая криптовалюта в 2026 году: рейтинг монет для инвестирования"
      }
    ]
  }
]

export const TOP_MINING_RATING_HOME_CARDS: TopMiningRatingCard[] = [
  pickHomeItems(
    findCard('equipment'),
    ['07', '08', '09', '10', '11', '12', '13', '14', '15'],
    2,
  ),
  pickHomeItems(
    findCard('tools'),
    ['02', '03', '08', '04', '05', '06'],
    2,
  ),
  createHomeCard(
    'sales',
    'ТОП: Продажи и услуги',
    [
      { cardId: 'sales', itemNumber: '03' },
      { cardId: 'equipment', itemNumber: '17' },
    ],
    1,
  ),
  pickHomeItems(findCard('crypto'), ['02', '03'], 1),
]
