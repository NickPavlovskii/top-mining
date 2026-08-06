import type { BuyAsicCompany, BuyAsicModel } from './page'
export {
  BUY_ASIC_MODEL_VENDORS,
  getBuyAsicModelBySlug,
  getBuyAsicModelShortName,
  getBuyAsicModelHref,
} from './page'

export const BUY_ASIC_PAGE_EN = {
  breadcrumb: 'ASIC miners below market price',
  title: 'LOOKING TO BUY ASIC MINERS?',
  subtitleLead: 'We will find a mining company where you can buy ASIC miners',
  subtitleAccent: '10% below market price',
  companiesIntro:
    '46 mining-equipment suppliers competing for your order with the lowest price',
  companiesIntroMobile: '46 mining-equipment suppliers',
  benefits: [
    'Negotiate supplier prices down by 7%',
    'Secure the lowest hosting rate',
    'Save you 100+ hours on selection, contracts, and breakdowns',
    'Protect 5% of your investment by mitigating risks',
    'Your ASIC miners and investment are safe with us',
  ],
  formTitle: 'Leave a request and we will send you prices from every company',
  phonePlaceholder: 'Phone number',
  submitLabel: 'SUBMIT A REQUEST',
  honeypotLabel: 'Leave this field blank.',
  privacyPrefix: 'By continuing, you agree to the',
  privacyLinkLabel: 'Privacy Policy',
  privacyHref: '/privacy',
  companies: [
    { id: 'sibmain', name: 'Sibmain', slug: 'sibmain', rating: '4.7', reviews: 21, priceLabel: '', logo: 'https://top-mining.ru/wp-content/uploads/2024/08/image-6345307.png' },
    { id: 'umnus', name: 'Umnus', slug: 'umnus', rating: '3.1', reviews: 53, priceLabel: '', logo: 'https://top-mining.ru/wp-content/uploads/2024/08/umnus-1.png' },
    { id: 'gis-mining', name: 'GIS Mining', slug: 'gis-mining', rating: '4.8', reviews: 145, priceLabel: 'from 4.70₽', logo: 'https://top-mining.ru/wp-content/uploads/2024/07/gis-mining-90x90-1.png' },
    { id: 'uminers', name: 'Uminers', slug: 'uminers', rating: '4.7', reviews: 35, priceLabel: 'from 5₽', logo: 'https://top-mining.ru/wp-content/uploads/2024/08/uminers-2.png' },
    { id: 'bitriver', name: 'Bitriver', slug: 'bitriver', rating: '3.8', reviews: 80, priceLabel: 'from 5₽', logo: 'https://top-mining.ru/wp-content/uploads/2024/08/bitriver-1-1.png' },
    { id: 'promminer', name: 'Promminer', slug: 'promminer', rating: '4', reviews: 136, priceLabel: 'from 5.50₽', logo: 'https://top-mining.ru/wp-content/uploads/2024/08/frame-2043682646.png' },
    { id: 'ibmm', name: 'IBMM', slug: 'ibmm', rating: '4.8', reviews: 485, priceLabel: 'from 5.50₽', logo: 'https://top-mining.ru/wp-content/uploads/2024/08/ibmm-90x90-1.png' },
    { id: 'intelion', name: 'Intelion Data Systems', slug: 'corporation-intelion-data-systems-2', rating: '4.2', reviews: 70, priceLabel: 'from 5.50₽', logo: 'https://top-mining.ru/wp-content/uploads/2024/05/intelion-data-systems-1.png' },
  ] satisfies readonly BuyAsicCompany[],
} as const

export const BUY_ASIC_MODELS_EN = {
  pricePrefix: 'Get a quote from',
  coinLabel: 'Coin:',
  ctaLabel: 'Get a quote',
  mountainBg: '/images/buy-asic/models/mountain-bg.png',
  items: [
    { id: 'antminer-l9', name: 'Bitmain Antminer L9', slug: 'antminer-l9', coins: 'DOGE, LTC', image: '/images/buy-asic/models/models-top-list-img-1.png', badgeImage: '/images/buy-asic/models/badges/models-top-list-item-img-before-bg-1.png' },
    { id: 'antminer-t21', name: 'Bitmain Antminer T21', slug: 'antminer-t21', coins: 'BTC', image: '/images/buy-asic/models/models-top-list-img-2.png', badgeImage: '/images/buy-asic/models/badges/models-top-list-item-img-before-bg-2.png' },
    { id: 'whatsminer-m61', name: 'MicroBT Whatsminer M61', slug: 'whatsminer-m61', coins: 'BTC, BCH, BSV', image: '/images/buy-asic/models/models-top-list-img-3.png', badgeImage: '/images/buy-asic/models/badges/models-top-list-item-img-before-bg-3.png' },
    { id: 'antminer-s21', name: 'Bitmain Antminer S21+', slug: 'antminer-s21', coins: 'BTC, BCH', image: '/images/buy-asic/models/models-top-list-img-4.png', badgeImage: '/images/buy-asic/models/badges/models-top-list-item-img-before-bg-4.png' },
    { id: 'antminer-e11', name: 'Bitmain Antminer E11', slug: 'antminer-e11', coins: 'ETC', image: '/images/buy-asic/models/models-top-list-img-5.png', badgeImage: '/images/buy-asic/models/badges/models-top-list-item-img-before-bg-5.png' },
    { id: 'elphapex-dg1', name: 'Elphapex DG1', slug: 'elphapex-dg1', coins: 'LTC, DOGE', image: '/images/buy-asic/models/models-top-list-img-6.png', badgeImage: '/images/buy-asic/models/badges/models-top-list-item-img-before-bg-6.png' },
  ] satisfies readonly BuyAsicModel[],
  priceModal: {
    onlineLabel: 'We are always online',
    descriptionPrefix: 'Submit a request to get quotes from',
    descriptionSuffix: 'leading companies in the market',
    phoneLabel: 'Phone number',
    phonePlaceholder: 'Phone number',
    submitLabel: 'Submit a request',
    privacyPrefix: 'By continuing, you agree to the',
    privacyLinkLabel: 'Privacy Policy',
    privacyHref: '/privacy',
  },
} as const

export const BUY_ASIC_MODEL_OFFER_EN = {
  titlePrefix: 'LOOKING TO BUY',
  subtitleLead: 'We will find a mining company where you can buy an ASIC miner',
  subtitleAccent: '10% below market price',
  companiesIntro: BUY_ASIC_PAGE_EN.companiesIntro,
  companiesIntroMobile: BUY_ASIC_PAGE_EN.companiesIntroMobile,
  benefits: BUY_ASIC_PAGE_EN.benefits,
  formTitle: BUY_ASIC_PAGE_EN.formTitle,
  phonePlaceholder: BUY_ASIC_PAGE_EN.phonePlaceholder,
  submitLabel: BUY_ASIC_PAGE_EN.submitLabel,
  honeypotLabel: BUY_ASIC_PAGE_EN.honeypotLabel,
  privacyPrefix: BUY_ASIC_PAGE_EN.privacyPrefix,
  privacyLinkLabel: BUY_ASIC_PAGE_EN.privacyLinkLabel,
  privacyHref: BUY_ASIC_PAGE_EN.privacyHref,
} as const
