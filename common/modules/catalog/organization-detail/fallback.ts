import type { CatalogOrganizationDetail } from '~/types/catalog-organization-detail'

export const GEOMETRIA_ORGANIZATION: CatalogOrganizationDetail = {
  id: 2,
  slug: 'geometria',
  name: 'Geometria',
  categorySlug: 'asic-sales',
  categoryName: 'Продажа ASIC',
  tagline: 'Продажа ASIC, хостинг, сервисный центр',
  pageTitle:
    'GEOMETRIA (ГЕОМЕТРИЯ): продажа асиков, хостинг, сервисный центр, услуги, отзывы',
  logoUrl: '/images/catalog/geometria.png',
  detailLogoUrl: null,
  aboutHtml: `
<p>Компания Geometria – технологическая компания белого майнинга в РФ, а также ведущий эксперт в области промышленного майнинга криптовалют с фокусом на аналитику, точные данные и глубокое понимание рынка.</p>
<p>Geometria предоставляет полный цикл майнинг-услуг: оборудование, финансовые модели, строительство дата-центров, доставка, консультации по налогам и юридическим вопросам. Мы знаем, какие изменения ждут майнинговую отрасль, и подстраиваем майнинг-бизнес клиентов до их официальных изменений.</p>
<p>Оборудование только с НДС, площадки и контейнеры на балансе компании, продажа криптовалюты по безналу, приведение клиентского бизнеса в соответствие с законами РФ.</p>
<p><strong>Особенности хостинга Geometria</strong></p>
<p>Аккредитованный дата-центр, мониторинг оборудования 24/7, срок реагирования 15 мин, усиленная охрана Росгвардии, возможность работать на полном аптайме и с управлением спроса, полностью легальная площадка с прозрачным оформлением не только для клиентов, но и для проверяющих органов.</p>
`.trim(),
  rating: 4.5,
  reviewCount: 2,
  hasPublicRating: true,
  foundedYear: 2024,
  website: 'https://geometria.io/',
  phone: '',
  email: 'info@geometria.io',
  workHours: 'пн-вс с 9:00 до 20:00 по Мск',
  verification: {
    contracts: true,
    legalEntity: true,
  },
  addresses: [
    {
      city: 'Москва',
      addressLine:
        'г. Москва, вн. тер. г. муниципальный округ Пресненский, Пресненская набережная, д. 12, этаж 64, пом/офис 204/1',
    },
  ],
  gallery: [
    {
      imageUrl: '/images/catalog/geometria/gallery-01.png',
      imageAlt: 'Майнинг-оборудование Geometria',
    },
    {
      imageUrl: '/images/catalog/geometria/gallery-02.png',
      imageAlt: 'Сервисное обслуживание оборудования Geometria',
    },
    {
      imageUrl: '/images/catalog/geometria/gallery-03.png',
      imageAlt: 'Майнинг-контейнер Geometria',
    },
    {
      imageUrl: '/images/catalog/geometria/gallery-04.png',
      imageAlt: 'Энергетическая инфраструктура Geometria',
    },
    {
      imageUrl: '/images/catalog/geometria/gallery-05.png',
      imageAlt: 'Электрощитовое оборудование Geometria',
    },
    {
      imageUrl: '/images/catalog/geometria/gallery-06.png',
      imageAlt: 'Размещение ASIC-майнеров Geometria',
    },
  ],
  equipmentSales: {
    equipmentType: 'ASIC-майнеры',
    equipmentCondition: 'Новое',
    salesVolume: 'ОПТ; Розница от 5 шт.',
    availability: 'В наличии и под заказ',
    extras: [
      'Напрямую от производителей',
      'Официальный импорт с НДС',
      'При покупке у нас — 0 ₽ за размещение',
      'с НДС и ГТД',
      'Бесплатная установка',
    ],
  },
  miningHotel: {
    pricePerKwhFrom: 6.2,
    pricePerKwhLabel: 'от 6.2р',
    sitesCount: 1,
    totalCapacityMw: 10,
    siteCities:
      'Нижегородская область, г. Дзержинск, 20 км от аэропорта Нижнего Новгорода',
    minDevicesLabel: '5',
    energyType: 'Электросети',
  },
  paymentTerms: {
    paymentMethods: ['Безналичная'],
    paymentFormats: ['В кредит'],
    extraTerms: ['В кредит'],
    contractForms: ['Безналичная'],
  },
  legalProfile: {
    legalName: 'Общество с ограниченной ответственностью "ВЭБ3.0" (ООО "ВЭБ3.0")',
    primaryActivity:
      'Разработка компьютерного программного обеспечения (62.01)',
    ogrn: '1227700376760',
    inn: '9703094672',
    registeredAt: '2022-06-28',
    legalAddress:
      '123112, город Москва, Пресненская наб, д. 12, этаж 64 пом/офис 204/1',
    authorizedCapital: '10000',
    reliability: 'ВЫСОКАЯ',
    defendantCases: 'Нет данных',
    revenue: 'За 2024 год: 76 млн руб.',
    profit: 'За 2024 год: 45 тыс. руб.',
    taxDebt: 'Нет данных',
    inSanctionsLists: 'Нет данных',
    sanctionsRestrictions: 'Нет данных',
  },
  articleHref: null,
  showGallery: true,
  showArticleBlock: true,
  cardTags: [
    'Счет на оплату: С НДС',
    'Состояние: Новое',
    'Объем продаж: ОПТ; Розница от 5 шт.',
    'Наличие: В наличии и под заказ',
  ],
  cardFeatures: [
    'Напрямую от производителей',
    'Официальный импорт с НДС',
    'При покупке у нас — 0 ₽ за размещение',
  ],
}

export const TTM_MINING_ORGANIZATION: CatalogOrganizationDetail = {
  id: 1,
  slug: 'ttm-mining',
  name: 'TTM Mining',
  categorySlug: 'asic-sales',
  categoryName: 'Продажа ASIC майнеров',
  tagline: 'Продажа ASIC, размещение и сервис',
  pageTitle:
    'TTM MINING COMPANY (TTM): продажа ASIC-майнеров, майнинг-отель, сервис, доставка, отзывы',
  logoUrl:
    'https://top-mining.ru/wp-content/uploads/2026/05/firmennyj-znak-czvetnoj.png',
  detailLogoUrl: '/images/catalog/ttm-mining-detail.png',
  aboutHtml: `
<p>TTM MINING COMPANY – российская компания, работающая в сфере поставок, размещения и сервисного обслуживания ASIC-майнеров. Компания помогает клиентам закрывать задачи майнинга под ключ: от подбора оборудования и организации доставки до размещения устройств в дата-центрах, технического сопровождения и настройки условий под масштаб бизнеса.</p>
<p>TTM MINING COMPANY поставляет ASIC-майнеры по России и за рубеж, работает с популярными моделями Bitmain, Whatsminer, IceRiver, Jasminer и других производителей. Для клиентов, которым важно снизить операционные хлопоты, компания предлагает размещение оборудования на майнинг-площадках с охраной, видеонаблюдением, технической поддержкой и обслуживанием.</p>
<p>Компания ориентируется на персональный подход: условия сотрудничества подбираются под задачи клиента, количество устройств, формат оплаты и требования к размещению. Такой формат подходит как для частных майнеров, так и для компаний, которые развивают промышленный майнинг.</p>
<p><strong>Особенности хостинга TTM MINING COMPANY</strong></p>
<p>TTM MINING COMPANY предоставляет размещение ASIC-майнеров в майнинг-отелях в Москве, Казани и Санкт-Петербурге. Доступно размещение от 5 устройств, тариф за электроэнергию – от 3 до 5,5 руб. за кВт/ч, стоимость размещения – от 4 до 6 руб. Компания работает с воздушным, водяным и иммерсионным охлаждением, а техническое обслуживание включено в тариф.</p>
`.trim(),
  rating: 0,
  reviewCount: 0,
  hasPublicRating: false,
  foundedYear: 2024,
  website: 'https://www.avito.ru/brands/65714c2f1e8e18cdd3296d902515deb1',
  phone: '',
  email: 'to_the_moon@internet.ru',
  workHours: 'Пн-Пт с 10 до 19',
  verification: {
    contracts: false,
    legalEntity: false,
  },
  addresses: [
    {
      city: 'Москва',
      addressLine:
        '109004, город Москва, ул. Александра Солженицына, д. 27, помещ. 1/2',
    },
  ],
  gallery: [],
  equipmentSales: {
    equipmentType: 'ASIC-майнеры',
    equipmentCondition: 'Новое и БУ',
    salesVolume: 'Розница; ОПТ',
    availability: 'В наличии и под заказ',
    extras: [
      'Доставка по России и миру',
      'Подбор ASIC под задачи',
      'Гибкие условия сотрудничества',
    ],
  },
  miningHotel: {
    pricePerKwhFrom: 6.2,
    pricePerKwhLabel: 'от 6,2 ₽',
    sitesCount: 3,
    totalCapacityMw: null,
    siteCities: '',
    minDevicesLabel: '',
    energyType: '',
  },
  paymentTerms: {
    paymentMethods: ['Без НДС', 'С НДС'],
    paymentFormats: ['Оплата криптовалютой', 'Наличными', 'Безналичная'],
    extraTerms: ['Постоплата', 'Частичная предоплата', 'Предоплата', 'Лизинг'],
    contractForms: ['Договор с ИП', 'Договор с ООО'],
  },
  legalProfile: {
    legalName: 'Общество с ограниченной ответственностью "ТТМ" (ООО "ТТМ")',
    primaryActivity:
      'Торговля оптовая компьютерами, периферийными устройствами к компьютерам и программным обеспечением (46.51)',
    ogrn: '1247700565530',
    inn: '9709114854',
    registeredAt: '2024-08-21',
    legalAddress:
      '109004, город Москва, ул. Александра Солженицына, д. 27, помещ. 1/2',
    authorizedCapital: '10000',
    reliability: 'НИЗКАЯ',
    defendantCases: 'Нет данных',
    revenue: 'нет данных',
    profit: 'нет данных',
    taxDebt: 'нет данных',
    inSanctionsLists: 'нет данных',
    sanctionsRestrictions: 'нет данных',
  },
  articleHref: null,
  showGallery: false,
  showArticleBlock: false,
  cardTags: [
    'Счет на оплату: Без НДС; С НДС',
    'Состояние: Новое и БУ',
    'Объем продаж: Розница; ОПТ',
    'Наличие: В наличии и под заказ',
  ],
  cardFeatures: [
    'Доставка по России и миру',
    'Подбор ASIC под задачи',
    'Гибкие условия сотрудничества',
  ],
}

export const ALGORITM_ORGANIZATION: CatalogOrganizationDetail = {
  id: 4,
  slug: 'algoritm',
  name: 'Algoritm',
  categorySlug: 'asic-sales',
  categoryName: 'Продажа ASIC майнеров',
  tagline: 'продажа асик-майнеров',
  pageTitle: 'ALGORITM (АЛГОРИТМ): продажа асик-майнеров',
  logoUrl:
    'https://top-mining.ru/wp-content/uploads/2025/07/algoritm-1.png',
  detailLogoUrl: '/images/catalog/algoritm-detail.png',
  aboutHtml: `
<p>Лучшая майнинговая компания 2024 года по версии Crypto Awards. Компания обладает практическим опытом в освоении ПНГ и оптимизации сетевых тарифов. Кроме того, Algoritm обеспечивает самые короткие сроки поставки оборудования — всего 6 рабочих дней.</p>
`.trim(),
  rating: 0,
  reviewCount: 0,
  hasPublicRating: false,
  foundedYear: 2007,
  website: 'https://algoritm.mn/',
  phone: '+7 (966) 999-31-82',
  email: 'ceo@algoritm.mn',
  workHours: '',
  verification: {
    contracts: false,
    legalEntity: true,
  },
  addresses: [
    {
      city: 'Москва',
      addressLine: 'Москва, Каширское ш, д. 3 к. 2 стр. 12',
    },
  ],
  gallery: [],
  equipmentSales: {
    equipmentType: 'Любое',
    equipmentCondition: 'Новые',
    salesVolume: 'Оптом',
    availability: 'Под заказ',
    extras: [],
  },
  miningHotel: {
    pricePerKwhFrom: 6.1,
    pricePerKwhLabel: 'от 6.1 руб',
    sitesCount: 4,
    totalCapacityMw: 55,
    siteCities: 'Москва, Абакан, Кемерово, Саратов',
    minDevicesLabel: '20',
    energyType: 'сетевая энергетика, собственная генерация',
  },
  paymentTerms: null,
  legalProfile: {
    legalName: 'ОБЩЕСТВО С ОГРАНИЧЕННОЙ ОТВЕТСТВЕННОСТЬЮ "АЛГОРИТМ"',
    primaryActivity:
      'Деятельность по обработке данных, предоставление услуг по размещению информации и связанная с этим деятельность (63.11)',
    ogrn: '1227700052557',
    inn: '9724070369',
    registeredAt: '2022-02-07',
    legalAddress:
      '115230, город Москва, Каширское ш, д. 3 к. 2 стр. 12',
    authorizedCapital: '500 000 руб.',
    reliability: 'ВЫСОКАЯ',
    defendantCases: 'Нет данных',
    revenue: 'за 2024 2,2 млрд руб.',
    profit: 'за 2024 22 млн руб.',
    taxDebt: 'Нет данных',
    inSanctionsLists: 'Нет данных',
    sanctionsRestrictions: 'Нет данных',
  },
  articleHref: null,
  showGallery: false,
  showArticleBlock: false,
  cardTags: [
    'Счет на оплату: С НДС',
    'Состояние: Новые',
    'Объем продаж: Оптом',
    'Наличие: Под заказ',
  ],
  cardFeatures: [
    'Доступна поставка без аванса',
    'Рассрочка под залог BTC',
  ],
}

const ORGANIZATION_FALLBACKS: Record<string, CatalogOrganizationDetail> = {
  geometria: GEOMETRIA_ORGANIZATION,
  'ttm-mining': TTM_MINING_ORGANIZATION,
  algoritm: ALGORITM_ORGANIZATION,
}

export function getOrganizationDetailFallback(
  slug: string,
): CatalogOrganizationDetail | null {
  return ORGANIZATION_FALLBACKS[slug] ?? null
}
