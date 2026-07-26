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

/** Порядок и файлы как на top-mining.ru (logo-comp-g) */
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
