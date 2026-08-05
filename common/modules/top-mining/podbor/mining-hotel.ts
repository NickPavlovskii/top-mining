/**
 * Папка podbor — лендинг подбора майнинг-отеля.
 * Весь контент страницы /podbor-majning-otelya/.
 */
export const PODBOR_MINING_HOTEL_PATH = '/podbor-majning-otelya/'

const NBH = '\u2011'

export const PODBOR_MINING_HOTEL_PAGE = {
  breadcrumb: `Подбор майнинг${NBH}отеля`,
  titleLead: 'Нужен',
  titleMid: `майнинг${NBH}`,
  titleEnd: 'отель?',
  description: `Подберем вам майнинг${NBH}отель, где вы сможете разместить асики`,
  descriptionAccent: 'на 15% дешевле рынка',
} as const

export const PODBOR_MINING_HOTEL_OFFER = {
  titleLead: '39 компаний',
  titleRest: ` по размещению майнинг${NBH}оборудования, которые конкурируют за вас, предлагая самый выгодный тариф`,
  benefits: [
    `Мы № 1 по агрегатору майнинг${NBH}отелей`,
    'Сэкономим вам 100+ часов времени на подборе, договорах, поломках',
    'Договоримся о минимальном тарифе на размещение',
    'Разместим от 1 МВт ваших ASIC-майнеров',
    'С нами ваши асики и вложения в безопасности',
  ],
  formTitle: `Оставьте заявку, мы отправим вам тарифы всех майнинг${NBH}отелей`,
  phonePlaceholder: '+7 (9',
  submitLabel: 'Оставить заявку',
  privacyPrefix: 'Продолжая, вы соглашаетесь с ',
  privacyLinkLabel: 'Политикой конфиденциальности',
  privacyHref: '/privacy',
} as const

export type PodborPartnerLogo = {
  src: string
  alt: string
}

const LOGO_DIR = '/images/podbor-majning-otelya/logo-comp-g'

export const PODBOR_MINING_HOTEL_PARTNERS: readonly PodborPartnerLogo[] = [
  { src: `${LOGO_DIR}/1.jpg`, alt: 'BitRiver' },
  { src: `${LOGO_DIR}/2.jpg`, alt: 'Umnus' },
  { src: `${LOGO_DIR}/11.jpg`, alt: 'Uminers' },
  { src: `${LOGO_DIR}/8.jpg`, alt: 'Global Mining' },
  { src: `${LOGO_DIR}/6.jpg`, alt: 'Bit Cluster' },
  { src: `${LOGO_DIR}/21.jpg`, alt: 'Prom Miner' },
  { src: `${LOGO_DIR}/20.jpg`, alt: 'Sibmain' },
  { src: `${LOGO_DIR}/9.jpg`, alt: 'Prostomining' },
  { src: `${LOGO_DIR}/10.jpg`, alt: 'MinerWorld' },
  { src: `${LOGO_DIR}/12.jpg`, alt: 'Цифра Капитал' },
  { src: `${LOGO_DIR}/14.jpg`, alt: 'GetAsic' },
  { src: `${LOGO_DIR}/17.jpg`, alt: 'BeMine' },
  { src: `${LOGO_DIR}/7.jpg`, alt: 'Intelion' },
  { src: `${LOGO_DIR}/13.jpg`, alt: 'Crypto Reactor' },
  { src: `${LOGO_DIR}/22.jpg`, alt: 'MineFactory' },
  { src: `${LOGO_DIR}/3.jpg`, alt: 'GIS' },
  { src: `${LOGO_DIR}/18.jpg`, alt: 'Gold Miner' },
  { src: `${LOGO_DIR}/19.jpg`, alt: 'Chilkoot' },
  { src: `${LOGO_DIR}/15.jpg`, alt: 'Mining Cluster' },
  { src: `${LOGO_DIR}/4.jpg`, alt: 'MineInvest' },
  { src: `${LOGO_DIR}/16.jpg`, alt: 'R7miner' },
  { src: `${LOGO_DIR}/5.jpg`, alt: 'IBMM' },
] as const

const PLACEMENT_DIR = '/images/podbor-majning-otelya/placement'
const SALE_DIR = '/images/podbor-majning-otelya/sale'

export type PodborPlacementOffer = {
  id: string
  title: string
  capacityTitle: string
  priceLabel: string
  priceValue: string
  location: string
  image: string
}

export type PodborAddCardModalCopy = {
  title: string
  subtitle: string
  nameLabel: string
  namePlaceholder: string
  phoneLabel: string
  phonePlaceholder: string
  powerLabel: string
  powerPlaceholder: string
  regionLabel: string
  regionPlaceholder: string
  submitLabel: string
  privacyPrefix: string
  privacyLinkLabel: string
  privacyHref: string
}

export type PodborOfferLeadModalCopy = {
  badge: string
  onlineLabel: string
  description: string
  phoneLabel: string
  phonePlaceholder: string
  submitLabel: string
  privacyPrefix: string
  privacyLinkLabel: string
  privacyHref: string
}

export const PODBOR_MINING_HOTEL_PLACEMENT = {
  title: 'Размещение',
  ctaLabel: 'Узнать тариф',
  addCardLabel: 'Добавить свою карточку',
  modal: {
    title: 'Добавление вашей площадки под размещение',
    subtitle: 'Оставьте заявку и мы перезвоним вам в ближайшее время',
    nameLabel: 'Ваше имя',
    namePlaceholder: 'Имя',
    phoneLabel: 'Ваш номер телефона',
    phonePlaceholder: '+7 (',
    powerLabel: 'Мощность площадки',
    powerPlaceholder: '1',
    regionLabel: 'Ваш регион',
    regionPlaceholder: 'Регион',
    submitLabel: 'Оставить заявку',
    privacyPrefix: 'Продолжая, вы соглашаетесь с ',
    privacyLinkLabel: 'Политикой конфиденциальности',
    privacyHref: '/privacy',
  },
  tariffModal: {
    badge: 'Свободно',
    onlineLabel: 'Мы всегда online',
    description:
      'Оставьте заявку, чтобы узнать тариф и получить информацию о размещении',
    phoneLabel: 'Телефон',
    phonePlaceholder: '+7 (',
    submitLabel: 'Оставить заявку',
    privacyPrefix: 'Продолжая, вы соглашаетесь с ',
    privacyLinkLabel: 'Политикой конфиденциальности',
    privacyHref: '/privacy',
  },
  offers: [
    {
      id: 'moscow-region',
      title: 'Свободно 40 МВт в Московской области',
      capacityTitle: '40 МВт мощности',
      priceLabel: 'Цена за кВт/ч:',
      priceValue: 'опт от 4,7₽',
      location: 'Московская область',
      image: `${PLACEMENT_DIR}/moscow-region.png`,
    },
    {
      id: 'stupino',
      title: 'Свободно 10 МВт в Ступино',
      capacityTitle: '10 МВт мощности',
      priceLabel: 'Цена за кВт/ч:',
      priceValue: 'от 5,2₽',
      location: 'Ступино',
      image: `${PLACEMENT_DIR}/stupino.png`,
    },
    {
      id: 'domodedovo',
      title: 'Свободно 8 МВт в Домодедово',
      capacityTitle: '8 МВт мощности',
      priceLabel: 'Цена за кВт/ч:',
      priceValue: 'опт от 5,0₽',
      location: 'Москва',
      image: `${PLACEMENT_DIR}/domodedovo.png`,
    },
    {
      id: 'udomlya',
      title: 'Свободно 4 МВт в Удомле',
      capacityTitle: '4 МВт мощности',
      priceLabel: 'Цена за кВт/ч:',
      priceValue: 'от 5,5₽',
      location: 'Удомля',
      image: `${PLACEMENT_DIR}/udomlya.png`,
    },
    {
      id: 'irkutsk',
      title: 'Свободно 10 МВт в Иркутске',
      capacityTitle: '10 МВт мощности',
      priceLabel: 'Цена за кВт/ч:',
      priceValue: 'от 5,0₽',
      location: 'Иркутск',
      image: `${PLACEMENT_DIR}/irkutsk.png`,
    },
    {
      id: 'nizhny',
      title: 'Свободно 20 МВт в Нижегородской области',
      capacityTitle: '20 МВт мощности',
      priceLabel: 'Цена за кВт/ч:',
      priceValue: 'от 5,3₽',
      location: 'Нижегородская область',
      image: `${PLACEMENT_DIR}/nizhny.png`,
    },
    {
      id: 'krasnoyarsk',
      title: 'Свободно 7 МВт в Красноярске',
      capacityTitle: '7 МВт мощности',
      priceLabel: 'Цена за кВт/ч:',
      priceValue: 'от 5,0₽',
      location: 'Красноярск',
      image: `${PLACEMENT_DIR}/krasnoyarsk.png`,
    },
    {
      id: 'other-regions',
      title: 'Другие регионы РФ',
      capacityTitle: 'Другие регионы РФ',
      priceLabel: 'Цена за кВт/ч:',
      priceValue: 'от 4,6₽',
      location: 'Другие регионы РФ',
      image: `${PLACEMENT_DIR}/other-regions.png`,
    },
  ] satisfies readonly PodborPlacementOffer[],
} as const

export const PODBOR_MINING_HOTEL_SALE = {
  title: 'Продажа',
  ctaLabel: 'Узнать цену',
  addCardLabel: 'Добавить свою карточку',
  modal: {
    title: 'Добавление вашей площадки на продажу',
    subtitle: 'Оставьте заявку и мы перезвоним вам в ближайшее время',
    nameLabel: 'Ваше имя',
    namePlaceholder: 'Имя',
    phoneLabel: 'Ваш номер телефона',
    phonePlaceholder: '+7 (',
    powerLabel: 'Мощность площадки',
    powerPlaceholder: '1',
    regionLabel: 'Ваш регион',
    regionPlaceholder: 'Регион',
    submitLabel: 'Оставить заявку',
    privacyPrefix: 'Продолжая, вы соглашаетесь с ',
    privacyLinkLabel: 'Политикой конфиденциальности',
    privacyHref: '/privacy',
  },
  priceModal: {
    badge: 'В продаже',
    onlineLabel: 'Мы всегда online',
    description:
      'Оставьте заявку, чтобы узнать цену и получить информацию о площадке',
    phoneLabel: 'Телефон',
    phonePlaceholder: '+7 (',
    submitLabel: 'Оставить заявку',
    privacyPrefix: 'Продолжая, вы соглашаетесь с ',
    privacyLinkLabel: 'Политикой конфиденциальности',
    privacyHref: '/privacy',
  },
  offers: [
    {
      id: 'sale-moscow-50',
      title: 'Продается площадка 50 МВт в Мск области',
      capacityTitle: '50 МВт мощности',
      priceLabel: 'Мощность площадки:',
      priceValue: '50 МВт',
      location: 'Московская область',
      image: `${SALE_DIR}/moscow.png`,
    },
    {
      id: 'sale-moscow-15',
      title: 'Продается площадка 15 МВт в Мск области',
      capacityTitle: '15 МВт мощности',
      priceLabel: 'Мощность площадки:',
      priceValue: '15 МВт',
      location: 'Московская область',
      image: `${SALE_DIR}/moscow.png`,
    },
    {
      id: 'sale-tula-10',
      title: 'Продается площадка 10 МВт в Туле',
      capacityTitle: '10 МВт мощности',
      priceLabel: 'Мощность площадки:',
      priceValue: '10 МВт',
      location: 'Тула',
      image: `${SALE_DIR}/tula.png`,
    },
    {
      id: 'sale-other-regions',
      title: 'Продается площадка 5+ МВт в регионах',
      capacityTitle: '5+ МВт мощности',
      priceLabel: 'Мощность площадки:',
      priceValue: '5+ МВт',
      location: 'Другие регионы РФ',
      image: `${SALE_DIR}/other-regions.png`,
    },
  ] satisfies readonly PodborPlacementOffer[],
} as const

export type PodborCtaTitlePart = {
  text: string
  accent?: boolean
}

export type PodborCtaCard = {
  id: string
  titleParts: readonly PodborCtaTitlePart[]
  description?: string
  buttonLabel: string
  buttonIcon: 'arrow' | 'plus'
  image?: string
  imageAlt?: string
}

export const PODBOR_MINING_HOTEL_CTA = {
  getOffersModal: {
    title: 'Актуальные предложения по размещению',
    subtitle: 'Оставьте заявку и мы перезвоним вам в ближайшее время',
    nameLabel: 'Ваше имя',
    namePlaceholder: 'Имя',
    phoneLabel: 'Ваш номер телефона',
    phonePlaceholder: '+7 (',
    powerLabel: 'Мощность площадки',
    powerPlaceholder: '1',
    regionLabel: 'Ваш регион',
    regionPlaceholder: 'Регион',
    submitLabel: 'Оставить заявку',
    privacyPrefix: 'Продолжая, вы соглашаетесь с ',
    privacyLinkLabel: 'Политикой конфиденциальности',
    privacyHref: '/privacy',
  } satisfies PodborAddCardModalCopy,
  addCardModal: {
    title: 'Добавление вашей площадки под размещение',
    subtitle: 'Оставьте заявку и мы перезвоним вам в ближайшее время',
    nameLabel: 'Ваше имя',
    namePlaceholder: 'Имя',
    phoneLabel: 'Ваш номер телефона',
    phonePlaceholder: '+7 (',
    powerLabel: 'Мощность площадки',
    powerPlaceholder: '1',
    regionLabel: 'Ваш регион',
    regionPlaceholder: 'Регион',
    submitLabel: 'Оставить заявку',
    privacyPrefix: 'Продолжая, вы соглашаетесь с ',
    privacyLinkLabel: 'Политикой конфиденциальности',
    privacyHref: '/privacy',
  } satisfies PodborAddCardModalCopy,
  cards: [
    {
      id: 'get-offers',
      titleParts: [
        { text: 'Получить все ' },
        { text: 'актуальные предложения по размещению', accent: true },
        { text: ' ваших ASIC-майнеров' },
      ],
      description:
        'Получите список площадок и условия размещения ваших ASIC-майнеров',
      buttonLabel: 'Получить предложение',
      buttonIcon: 'arrow',
    },
    {
      id: 'add-card',
      titleParts: [
        { text: 'Добавить ' },
        { text: 'карточку вашей площадки', accent: true },
        { text: ' под размещение' },
      ],
      description:
        'Разместить свои площадки на сайте TOP MINING, чтобы быстрее найти клиентов',
      buttonLabel: 'Добавить карточку',
      buttonIcon: 'plus',
      image: '/images/podbor-majning-otelya/cta/add-cards.png',
      imageAlt: 'Добавьте свою карточку',
    },
  ] satisfies readonly PodborCtaCard[],
} as const

export const PODBOR_MINING_HOTEL_USEFUL = {
  titleLead: 'Чем полезен',
  titleAccent: 'ТОП МАЙНИНГ',
  segments: [
    { text: 'Мы являемся экспертами' },
    { text: 'в области' },
    { text: 'майнинга.' },
    { type: 'spacer' },
    { text: 'Мы' },
    { text: 'не занимаемся продажей' },
    { text: 'оборудования или хостингом.' },
    { type: 'br' },
    { text: 'Наша' },
    { text: 'основная' },
    { text: 'задача - помочь' },
    { text: 'вам найти' },
    { text: 'подходящую майнинг-компанию.' },
    { type: 'spacer' },
    { text: 'Мы' },
    { text: 'хорошо знаем' },
    { text: 'рынок' },
    { text: 'и располагаем' },
    { text: 'списком' },
    { text: 'проверенных компаний,' },
    { text: 'которые' },
    { text: 'соответствуют нашим' },
    { text: 'высоким стандартам' },
    { text: '(честность, безопасность,' },
    { text: 'репутация, цена).' },
    { type: 'br' },
    { text: 'Эти компании конкурируют друг' },
    { text: 'с другом, предлагая' },
    { text: 'вам лучшие' },
    { text: 'цены.' },
    { type: 'spacer' },
    { text: 'Сотрудничая' },
    { text: 'с нами,' },
    { text: 'эти компании' },
    { text: 'снижают' },
    { text: 'затраты' },
    { text: 'на маркетинг' },
    { text: 'и продажи, что' },
    { text: 'позволяет им предлагать нам' },
    { text: 'более выгодные' },
    { text: 'условия, которые мы затем' },
    { text: 'предлагаем' },
    { text: 'вам в рамках наших услуг.' },
  ],
} as const

export type PodborHowWeWorkPart = {
  text: string
  strong?: boolean
}

export type PodborHowWeWorkStep = {
  id: string
  number?: number
  highlight?: boolean
  parts: readonly PodborHowWeWorkPart[]
}

export const PODBOR_MINING_HOTEL_HOW_WE_WORK = {
  titleLead: 'Снизим цену на 15%',
  titleSub: 'на размещение ASIC-майнеров',
  panelTitle: 'Как мы работаем:',
  steps: [
    {
      id: 'request',
      number: 1,
      parts: [
        { text: 'Скидываем всем компаниям ' },
        { text: 'запрос на размещение асиков', strong: true },
      ],
    },
    {
      id: 'tariffs',
      number: 2,
      parts: [
        { text: 'Собираем всю ' },
        { text: 'информацию по тарифам, ценам', strong: true },
      ],
    },
    {
      id: 'negotiate',
      number: 3,
      parts: [
        { text: 'Ведем ' },
        { text: 'переговоры', strong: true },
        {
          text: ' со всеми компаниями. Вносим правки в договор. Торгуемся. Учитываем все риски',
        },
      ],
    },
    {
      id: 'offer',
      highlight: true,
      parts: [{ text: 'Делаем вам наиболее выгодное предложение' }],
    },
    {
      id: 'place',
      number: 4,
      parts: [
        { text: 'Размещаем ваши ASIC-майнеры', strong: true },
        { text: ' в майнинг-отеле' },
      ],
    },
  ] satisfies readonly PodborHowWeWorkStep[],
} as const

export type PodborKeyFactor = {
  id: string
  number: string
  title: string
}

export type PodborKeyFactorCaseLine = {
  text: string
  muted?: string
}

export type PodborKeyFactorCase = {
  badge: string
  title: string
  description: string
  calculatorHref: string
  lines: readonly PodborKeyFactorCaseLine[]
  footnote: string
}

export type PodborKeyFactorColumn = {
  title: string
  text: string
}

export type PodborKeyFactorDetail = {
  id: string
  number: string
  title: string
  lead?: string
  items?: readonly string[]
  note?: string
  infoBanner?: string
  caseStudy?: PodborKeyFactorCase
  columns?: readonly PodborKeyFactorColumn[]
  withForm?: boolean
}

export const PODBOR_MINING_HOTEL_KEY_FACTORS = {
  titleLead: 'Ключевые факторы',
  titleRest: 'для увеличения прибыли',
  phonePlaceholder: 'Телефон',
  submitLabel: 'Оставить заявку',
  privacyPrefix: 'Продолжая, вы соглашаетесь с ',
  privacyLinkLabel: 'Политикой конфиденциальности',
  privacyHref: '/privacy',
  factors: [
    {
      id: 'energy',
      number: '01',
      title: 'Снижение затрат на электроэнергию',
    },
    {
      id: 'tariff',
      number: '02',
      title: 'Правильный расчет тарифа',
    },
    {
      id: 'uptime',
      number: '03',
      title: 'Экономически выгодный UP-TIME',
    },
    {
      id: 'location',
      number: '04',
      title: 'Расположение майнинг-отеля',
    },
  ] satisfies readonly PodborKeyFactor[],
  details: [
    {
      id: 'energy',
      number: '01',
      title: 'Сбиваем цену на электроэнергию на 5% и закрепляем цену',
      items: [
        'Тариф всегда повышается. Как утвердить и зафиксировать сроки размещения по вашему тарифу?',
        'Как учесть тариф на хостинг при покупке асиков?',
        'Есть ли смысл оплачивать хостинг на годы вперёд?',
        'Как правильно составить договор на майнинг-отель, что нужно учитывать?',
      ],
    },
    {
      id: 'tariff',
      number: '02',
      title: '95% майнинг-отелей неправильно считают тариф',
      lead: 'На консультации ответим на эти вопросы:',
      items: [
        'Как правильно считать тариф, чтобы вас не обманули?',
        'Как правильно в договоре прописать тариф, чтобы вам его необоснованно не подняли?',
        'Как оплачивать: по счетчикам или по тарифу? Плюсы и минусы',
        'Как утвердить и зафиксировать сроки размещения по вашему тарифу?',
      ],
      caseStudy: {
        badge: 'КЕЙС',
        title: 'Вы теряете в доходе больше 10%',
        description:
          'Чаще всего заявленная стоимость ЭЭ отличается с реальной на 10%. Расскажем почему, оставьте заявку на консультацию',
        calculatorHref: '/calculator/',
        lines: [
          { text: 'Обещанный тариф - 5,5 ₽ за 1кВт.' },
          { text: 'Реальный тариф, который вы заплатите - 6,1 ₽ за 1кВт от майнинг-отеля.' },
          {
            text: 'На 1 асике вы теряете 9,8% в месяц ',
            muted:
              '(это 1 671 ₽, а если у вас 100 асиков - сумма потери - 167 100 ₽ в месяц).',
          },
        ],
        footnote: '*Расчет на примере ASIC-майнера T21 190 Th/s',
      },
      withForm: true,
    },
    {
      id: 'uptime',
      number: '03',
      title: 'Фиксируем аптайм в договоре',
      infoBanner: 'UP-TIME — время безостановочной работы устройства',
      items: [
        'У каких дата-центров экономически выгодный аптайм?',
        'Как закрепить up-time в договоре?',
      ],
      note: '*Также решаем вопросы затяжных ремонтов: вы не потеряете деньги при поломке асиков. В случае долгого ремонта - ускоряем или предлагаем подмену устройства.',
    },
    {
      id: 'location',
      number: '04',
      title: 'Расположение',
      columns: [
        {
          title: 'Территориальное расположение',
          text: 'Какой регион выбрать для размещения оборудования для майнинга?',
        },
        {
          title: 'Реестр',
          text: 'Находится ли майнинг-отель в реестре майнинга?',
        },
      ],
    },
  ] satisfies readonly PodborKeyFactorDetail[],
} as const

export type PodborSecurityCard = {
  id: string
  title: string
  accent: string
  items: readonly string[]
}

export const PODBOR_MINING_HOTEL_SECURITY = {
  title: 'Обеспечиваем 100% безопасность',
  note: '*можем сделать все конфиденциально',
  cards: [
    {
      id: 'risks',
      title: 'Уберем риски на старте, сбережем 5% от вложений',
      accent:
        'Снимем с вас юридические риски, которые часто забирают 5-10 млн ₽',
      items: [
        'Как управлять рисками при покупке оборудования?',
        'Какие риски стоит учитывать при поставке асиков?',
        'Какие нужны документы от компании?',
        'Как избежать налоговых рисков при поставке? Что должно быть в договоре?',
      ],
    },
    {
      id: 'safety',
      title: 'С нами ваши асики и вложения в безопасности',
      accent: 'Ваша безопасность иногда важнее любых экономий',
      items: [
        'Ваши асики доедут. ТОП МАЙНИНГ - гарант безопасности доставки. Не будет переносов, не будет банкротств',
        'Будут все документы на выходе после завершения сделки',
        'Ваши асики встанут в майнинг-отель',
        'Ваши асики не украдут',
        'Решаем вопросы затяжных ремонтов, вы не потеряете деньги',
      ],
    },
  ] satisfies readonly PodborSecurityCard[],
} as const

export type PodborTimeSaveCard = {
  id: string
  title: string
  accent?: string
  previewItems: readonly string[]
  moreItems: readonly string[]
  buttonLabel?: string
  buttonHref?: string
}

export const PODBOR_MINING_HOTEL_TIME_SAVE = {
  titleLead: 'Экономим в среднем',
  titleRest: '100+ часов времени',
  showMoreLabel: 'Показать еще',
  hideLabel: 'Скрыть',
  cards: [
    {
      id: 'asic-purchase',
      title:
        '1. Подбор, закупка и поставка ASIC-майнеров. Самые низкие цены на рынке',
      accent:
        'Сколько зарабатывают майнинговые компании на продаже вам оборудования? Поможем вам скинуть этот процент в 2 раза',
      previewItems: [
        'Что стоит учитывать при выборе асиков?',
        'Как выбрать оборудование с оптимальным соотношением цены и производительности?',
        'Собьем цены поставщиков',
        'Кредит / лизинг / рассрочка / инвестиции',
      ],
      moreItems: [
        'Как правильно составить договор поставки, что нужно учитывать?',
        'Как соблюсти сроки поставки и получить асики вовремя?',
        'Какие нужны документы от компании?',
        'Как зарегистрировать свои асики в соответствии с новым законом?',
      ],
      buttonLabel: 'Подробнее о покупке ASIC-майнеров',
      buttonHref: 'https://top-mining.ru/asic-majnery-po-czenam-nizhe-rynka/',
    },
    {
      id: 'mining-hotel',
      title: '2. Подбор майнинг-отеля. Максимально выгодные условия',
      previewItems: [
        'Что стоит учитывать при выборе майнинг-отеля?',
        'Как правильно составить договор на майнинг-отель, что нужно учитывать?',
        'Как утвердить и зафиксировать сроки размещения по вашему тарифу?',
        'На что стоит обратить внимание при расторжении договора?',
        'Как подобрать легальный хостинг?',
        'Что нужно знать о платеже за установку асика? (переезд на новый хостинг или размещение без покупки)',
      ],
      moreItems: [
        'Какие документы нужны от компании?',
        'На что стоит обратить внимание при выборе региона площадки?',
        'Как снизить затраты на электроэнергию?',
        'Безопасность размещения',
      ],
    },
  ] satisfies readonly PodborTimeSaveCard[],
  incomeTips: {
    id: 'income-tips',
    title: 'Как увеличить свой доход?',
    accent: 'Секретные фишки',
    previewItems: [
      'Какие финансовые модели при росте курса и при падении?',
      'Как правильно рассчитать доходность и окупаемость?',
      'О ликвидности асиков или что стоит учитывать в перспективе 5-6 лет после покупки?',
      'Как учесть тариф на хостинг при покупке асиков?',
      'Есть ли смысл оплачивать хостинг на годы вперёд?',
    ],
    moreItems: [
      'Как оплачивать по счетчикам или по тарифу? Плюсы и минусы',
      'Какую стратегию выбрать для максимальной прибыли?',
      'Как учитывать авансы, депозиты?',
      'Как правильно считать тариф, чтобы вас не обманули?',
      'Как правильно в договоре прописать тариф, чтобы вам его необоснованно не подняли?',
      'Как закрепить up-time в договоре?',
      'Как оптимизировать майнинг-отель?',
      'Как контролировать свои асики? (камеры, мониторинг)',
      'Стоит ли прошивать асики?',
      'Актуальны ли видеокарты в майнинге?',
    ],
  } satisfies PodborTimeSaveCard,
} as const

export const PODBOR_MINING_HOTEL_SUMMARY = {
  title: 'Итого',
  benefits: [
    'Сэкономим ваше время',
    'Собьем цены поставщиков',
    'Снизим сроки поставки (время, в которое вы могли бы майнить и зарабатывать, пока асики в пути)',
    'Расскажем, как получить максимальную прибыль в моменте и в долгосроке и уберем финансовые риски',
  ],
  note: 'А, возможно, даже отговорим вас входить в сферу майнинга, в зависимости от рынка или ваших личных обстоятельств, сэкономив вам миллионы рублей',
  phonePlaceholder: '+7 (9',
  submitLabel: 'Оставить заявку',
  privacyPrefix: 'Продолжая, вы соглашаетесь с ',
  privacyLinkLabel: 'Политикой конфиденциальности',
  privacyHref: '/privacy',
} as const

export type PodborPromoBannerVariant = 'asic' | 'you-miner' | 'hotel'

export type PodborPromoBanner = {
  id: string
  variant: PodborPromoBannerVariant
  title: string
  subtitle: string
  buttonLabel: string
  href: string
  imageAlt: string
  image?: string
  imageMobile?: string
  external?: boolean
}

export const PODBOR_MINING_HOTEL_BANNERS = {
  items: [
    {
      id: 'need-asic',
      variant: 'asic',
      title: 'Нужны ASIC-майнеры?',
      subtitle:
        'Подберем вам майнинг-компанию, где вы сможете купить асики на 10% дешевле рынка',
      buttonLabel: 'Подробнее',
      href: 'https://top-mining.ru/asic-majnery-po-czenam-nizhe-rynka/',
      imageAlt: 'ASIC-майнеры Whatsminer с брендингом ТОП МАЙНИНГ',
      external: true,
    },
    {
      id: 'you-miner',
      variant: 'you-miner',
      title: 'Вы майнер?',
      subtitle: 'Увеличим ваш доход на 10%',
      buttonLabel: 'Подробнее',
      href: '/uvelichim-vash-dohod/',
      imageAlt: 'Майнер за мониторами с графиками и данными',
    },
  ] satisfies readonly PodborPromoBanner[],
} as const
