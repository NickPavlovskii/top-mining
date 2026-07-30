export const BUY_ASIC_PAGE_PATH = '/asic-majnery-po-czenam-nizhe-rynka/'

export type BuyAsicCompany = {
  id: string
  name: string
  slug: string
  rating: string
  reviews: number
  priceLabel: string
  logo: string
}

export const BUY_ASIC_PAGE = {
  breadcrumb: 'ASIC-майнеры по ценам ниже рынка',
  title: 'ХОТИТЕ КУПИТЬ ASIC-МАЙНЕРЫ?',
  subtitleLead: 'Подберем вам майнинг-компанию, где вы сможете купить асики',
  subtitleAccent: 'на 10% дешевле рынка',
  companiesIntro:
    '46 компаний по продаже майнинг-оборудования, которые конкурируют за вас, предлагая самую низкую цену',
  companiesIntroMobile: '46 компаний по продаже майнинг-оборудования',
  benefits: [
    'Собьем цены поставщиков на 7%',
    'Договоримся о минимальном тарифе на размещение',
    'Сэкономим вам 100+ часов времени на подборе, договорах, поломках',
    'Сбережем 5% от вложений, обезопасив вас от рисков',
    'С нами ваши асики и вложения в безопасности',
  ],
  formTitle: 'Оставьте заявку, мы отправим вам цены всех компаний',
  phonePlaceholder: 'Телефон',
  submitLabel: 'ОСТАВИТЬ ЗАЯВКУ',
  honeypotLabel: 'Оставьте это поле пустым.',
  privacyPrefix: 'Продолжая, вы соглашаетесь с',
  privacyLinkLabel: 'Политикой конфиденциальности',
  privacyHref: '/privacy',
  companies: [
    {
      id: 'sibmain',
      name: 'Sibmain',
      slug: 'sibmain',
      rating: '4.7',
      reviews: 21,
      priceLabel: '',
      logo: 'https://top-mining.ru/wp-content/uploads/2024/08/image-6345307.png',
    },
    {
      id: 'umnus',
      name: 'Umnus',
      slug: 'umnus',
      rating: '3.1',
      reviews: 53,
      priceLabel: '',
      logo: 'https://top-mining.ru/wp-content/uploads/2024/08/umnus-1.png',
    },
    {
      id: 'gis-mining',
      name: 'GIS Mining',
      slug: 'gis-mining',
      rating: '4.8',
      reviews: 145,
      priceLabel: 'от 4.70₽',
      logo: 'https://top-mining.ru/wp-content/uploads/2024/07/gis-mining-90x90-1.png',
    },
    {
      id: 'uminers',
      name: 'Uminers',
      slug: 'uminers',
      rating: '4.7',
      reviews: 35,
      priceLabel: 'от 5₽',
      logo: 'https://top-mining.ru/wp-content/uploads/2024/08/uminers-2.png',
    },
    {
      id: 'bitriver',
      name: 'Bitriver',
      slug: 'bitriver',
      rating: '3.8',
      reviews: 80,
      priceLabel: 'от 5₽',
      logo: 'https://top-mining.ru/wp-content/uploads/2024/08/bitriver-1-1.png',
    },
    {
      id: 'promminer',
      name: 'Promminer',
      slug: 'promminer',
      rating: '4',
      reviews: 136,
      priceLabel: 'от 5.50₽',
      logo: 'https://top-mining.ru/wp-content/uploads/2024/08/frame-2043682646.png',
    },
    {
      id: 'ibmm',
      name: 'IBMM',
      slug: 'ibmm',
      rating: '4.8',
      reviews: 485,
      priceLabel: 'от 5.50₽',
      logo: 'https://top-mining.ru/wp-content/uploads/2024/08/ibmm-90x90-1.png',
    },
    {
      id: 'intelion',
      name: 'Intelion Data Systems',
      slug: 'corporation-intelion-data-systems-2',
      rating: '4.2',
      reviews: 70,
      priceLabel: 'от 5.50₽',
      logo: 'https://top-mining.ru/wp-content/uploads/2024/05/intelion-data-systems-1.png',
    },
  ] satisfies readonly BuyAsicCompany[],
} as const

export type BuyAsicModel = {
  id: string
  name: string
  slug: string
  coins: string
  image: string
  badgeImage: string
}

export const BUY_ASIC_MODEL_VENDORS = [
  'IBMM',
  'Promminer',
  'Intelion',
  'Umnus',
  'Sibmain',
  'Bitriver',
  'R7',
  'ТКС',
  'Global',
  'Mining',
  'Get Asic',
  'Aximine',
  'Pushminer',
  'GOLD Miner',
] as const

export const BUY_ASIC_MODELS = {
  pricePrefix: 'Получить цену у',
  coinLabel: 'Монета:',
  ctaLabel: 'Узнать цену',
  mountainBg: '/images/buy-asic/models/mountain-bg.png',
  items: [
    {
      id: 'antminer-l9',
      name: 'Bitmain Antminer L9',
      slug: 'antminer-l9',
      coins: 'DOGE, LTC',
      image: '/images/buy-asic/models/models-top-list-img-1.png',
      badgeImage:
        '/images/buy-asic/models/badges/models-top-list-item-img-before-bg-1.png',
    },
    {
      id: 'antminer-t21',
      name: 'Bitmain Antminer T21',
      slug: 'antminer-t21',
      coins: 'BTC',
      image: '/images/buy-asic/models/models-top-list-img-2.png',
      badgeImage:
        '/images/buy-asic/models/badges/models-top-list-item-img-before-bg-2.png',
    },
    {
      id: 'whatsminer-m61',
      name: 'MicroBT Whatsminer M61',
      slug: 'whatsminer-m61',
      coins: 'BTC, BCH, BSV',
      image: '/images/buy-asic/models/models-top-list-img-3.png',
      badgeImage:
        '/images/buy-asic/models/badges/models-top-list-item-img-before-bg-3.png',
    },
    {
      id: 'antminer-s21',
      name: 'Bitmain Antminer S21+',
      slug: 'antminer-s21',
      coins: 'BTC, BCH',
      image: '/images/buy-asic/models/models-top-list-img-4.png',
      badgeImage:
        '/images/buy-asic/models/badges/models-top-list-item-img-before-bg-4.png',
    },
    {
      id: 'antminer-e11',
      name: 'Bitmain Antminer E11',
      slug: 'antminer-e11',
      coins: 'ETC',
      image: '/images/buy-asic/models/models-top-list-img-5.png',
      badgeImage:
        '/images/buy-asic/models/badges/models-top-list-item-img-before-bg-5.png',
    },
    {
      id: 'elphapex-dg1',
      name: 'Elphapex DG1',
      slug: 'elphapex-dg1',
      coins: 'LTC, DOGE',
      image: '/images/buy-asic/models/models-top-list-img-6.png',
      badgeImage:
        '/images/buy-asic/models/badges/models-top-list-item-img-before-bg-6.png',
    },
  ] satisfies readonly BuyAsicModel[],
  priceModal: {
    onlineLabel: 'Мы всегда online',
    descriptionPrefix: 'Оставьте заявку, чтобы узнать цены на',
    descriptionSuffix: 'лидирующих компаний на рынке',
    phoneLabel: 'Телефон',
    phonePlaceholder: 'Телефон',
    submitLabel: 'Оставить заявку',
    privacyPrefix: 'Продолжая, вы соглашаетесь с',
    privacyLinkLabel: 'Политикой конфиденциальности',
    privacyHref: '/privacy',
  },
} as const

export function getBuyAsicModelBySlug(
  slug: string,
): BuyAsicModel | undefined {
  return BUY_ASIC_MODELS.items.find((item) => item.slug === slug)
}

export function getBuyAsicModelShortName(model: BuyAsicModel): string {
  return model.name.replace(/^(Bitmain|MicroBT)\s+/i, '')
}

export function getBuyAsicModelHref(model: BuyAsicModel): string {
  return `${BUY_ASIC_PAGE_PATH}${model.slug}/`
}

export const BUY_ASIC_MODEL_OFFER = {
  titlePrefix: 'ХОТИТЕ КУПИТЬ',
  subtitleLead: 'Подберем вам майнинг-компанию, где вы сможете купить ASIC',
  subtitleAccent: 'на 10% дешевле рынка',
  companiesIntro: BUY_ASIC_PAGE.companiesIntro,
  companiesIntroMobile: BUY_ASIC_PAGE.companiesIntroMobile,
  benefits: BUY_ASIC_PAGE.benefits,
  formTitle: BUY_ASIC_PAGE.formTitle,
  phonePlaceholder: BUY_ASIC_PAGE.phonePlaceholder,
  submitLabel: BUY_ASIC_PAGE.submitLabel,
  honeypotLabel: BUY_ASIC_PAGE.honeypotLabel,
  privacyPrefix: BUY_ASIC_PAGE.privacyPrefix,
  privacyLinkLabel: BUY_ASIC_PAGE.privacyLinkLabel,
  privacyHref: BUY_ASIC_PAGE.privacyHref,
} as const
