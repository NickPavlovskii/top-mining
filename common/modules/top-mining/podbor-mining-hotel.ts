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
