/**
 * English content for the Mining Hotel Selection landing.
 * Identifiers, assets, URLs, and non-copy data are inherited from the RU source.
 */
import {
  PODBOR_MINING_HOTEL_BANNERS,
  PODBOR_MINING_HOTEL_CTA,
  PODBOR_MINING_HOTEL_HOW_WE_WORK,
  PODBOR_MINING_HOTEL_KEY_FACTORS,
  PODBOR_MINING_HOTEL_OFFER,
  PODBOR_MINING_HOTEL_PAGE,
  PODBOR_MINING_HOTEL_PARTNERS,
  PODBOR_MINING_HOTEL_PLACEMENT,
  PODBOR_MINING_HOTEL_SALE,
  PODBOR_MINING_HOTEL_SECURITY,
  PODBOR_MINING_HOTEL_SUMMARY,
  PODBOR_MINING_HOTEL_TIME_SAVE,
  PODBOR_MINING_HOTEL_USEFUL,
} from './mining-hotel'

const privacy = {
  privacyPrefix: 'By continuing, you agree to the ',
  privacyLinkLabel: 'Privacy Policy',
  privacyHref: '/privacy',
} as const

export const PODBOR_MINING_HOTEL_PAGE_EN = {
  ...PODBOR_MINING_HOTEL_PAGE,
  seoTitle: 'Mining Hotel Selection | TOP MINING',
  seoDescription:
    'We will select a mining hotel for your ASIC miners at rates 15% below the market.',
  breadcrumb: 'Mining Hotel Selection',
  titleLead: 'Need a',
  titleMid: 'mining',
  titleEnd: 'hotel?',
  description: 'We will find a mining hotel where you can host your ASIC miners',
  descriptionAccent: '15% below market price',
} as const

export const PODBOR_MINING_HOTEL_OFFER_EN = {
  ...PODBOR_MINING_HOTEL_OFFER,
  titleLead: '39 hosting companies',
  titleRest: ' compete for your business by offering the best available rate',
  benefits: [
    'We are the No. 1 mining-hotel aggregator',
    'Save 100+ hours on selection, contracts, and breakdowns',
    'We negotiate the lowest hosting rate',
    'Host from 1 MW of your ASIC miners',
    'Your ASIC miners and investments are safe with us',
  ],
  formTitle: 'Submit a request and we will send you rates from every mining hotel',
  phonePlaceholder: '+7 (9',
  submitLabel: 'Submit a request',
  ...privacy,
} as const

export const PODBOR_MINING_HOTEL_PARTNERS_EN = PODBOR_MINING_HOTEL_PARTNERS

export const PODBOR_MINING_HOTEL_PLACEMENT_EN = {
  ...PODBOR_MINING_HOTEL_PLACEMENT,
  title: 'Hosting',
  ctaLabel: 'Get the rate',
  addCardLabel: 'Add your listing',
  modal: {
    title: 'Add your hosting facility',
    subtitle: 'Submit a request and we will call you back shortly',
    nameLabel: 'Your name',
    namePlaceholder: 'Name',
    phoneLabel: 'Your phone number',
    phonePlaceholder: '+7 (',
    powerLabel: 'Facility capacity',
    powerPlaceholder: '1',
    regionLabel: 'Your region',
    regionPlaceholder: 'Region',
    submitLabel: 'Submit a request',
    ...privacy,
  },
  tariffModal: {
    badge: 'Available',
    onlineLabel: 'We are always online',
    description: 'Submit a request to learn the rate and receive hosting details',
    phoneLabel: 'Phone',
    phonePlaceholder: '+7 (',
    submitLabel: 'Submit a request',
    ...privacy,
  },
} as const

export const PODBOR_MINING_HOTEL_SALE_EN = {
  ...PODBOR_MINING_HOTEL_SALE,
  title: 'For sale',
  ctaLabel: 'Get the price',
  addCardLabel: 'Add your listing',
  modal: {
    ...PODBOR_MINING_HOTEL_PLACEMENT_EN.modal,
    title: 'Add your facility for sale',
  },
  priceModal: {
    badge: 'For sale',
    onlineLabel: 'We are always online',
    description: 'Submit a request to learn the price and receive facility details',
    phoneLabel: 'Phone',
    phonePlaceholder: '+7 (',
    submitLabel: 'Submit a request',
    ...privacy,
  },
} as const

export const PODBOR_MINING_HOTEL_CTA_EN = {
  ...PODBOR_MINING_HOTEL_CTA,
  getOffersModal: {
    ...PODBOR_MINING_HOTEL_PLACEMENT_EN.modal,
    title: 'Current hosting offers',
  },
  addCardModal: PODBOR_MINING_HOTEL_PLACEMENT_EN.modal,
  cards: [
    {
      id: 'get-offers',
      titleParts: [
        { text: 'Get all ' },
        { text: 'current hosting offers', accent: true },
        { text: ' for your ASIC miners' },
      ],
      description: 'Receive a list of facilities and hosting terms for your ASIC miners',
      buttonLabel: 'Get an offer',
      buttonIcon: 'arrow',
    },
    {
      id: 'add-card',
      titleParts: [
        { text: 'Add ' },
        { text: 'your facility listing', accent: true },
        { text: ' for hosting' },
      ],
      description: 'List your facilities on TOP MINING to find clients faster',
      buttonLabel: 'Add a listing',
      buttonIcon: 'plus',
      image: '/images/podbor-majning-otelya/cta/add-cards.png',
      imageAlt: 'Add your listing',
    },
  ],
} as const

export const PODBOR_MINING_HOTEL_USEFUL_EN = {
  ...PODBOR_MINING_HOTEL_USEFUL,
  titleLead: 'Why',
  titleAccent: 'TOP MINING',
} as const

export const PODBOR_MINING_HOTEL_HOW_WE_WORK_EN = {
  ...PODBOR_MINING_HOTEL_HOW_WE_WORK,
  titleLead: 'Reduce the price by 15%',
  titleSub: 'for ASIC miner hosting',
  panelTitle: 'How we work:',
} as const

export const PODBOR_MINING_HOTEL_KEY_FACTORS_EN = {
  ...PODBOR_MINING_HOTEL_KEY_FACTORS,
  titleLead: 'Key factors',
  titleRest: 'for increasing profit',
  phonePlaceholder: 'Phone',
  submitLabel: 'Submit a request',
  ...privacy,
} as const

export const PODBOR_MINING_HOTEL_SECURITY_EN = {
  ...PODBOR_MINING_HOTEL_SECURITY,
  title: 'We provide 100% security',
  note: '*We can keep everything confidential',
} as const

export const PODBOR_MINING_HOTEL_TIME_SAVE_EN = {
  ...PODBOR_MINING_HOTEL_TIME_SAVE,
  titleLead: 'We save an average of',
  titleRest: '100+ hours',
  showMoreLabel: 'Show more',
  hideLabel: 'Hide',
} as const

export const PODBOR_MINING_HOTEL_SUMMARY_EN = {
  ...PODBOR_MINING_HOTEL_SUMMARY,
  title: 'In summary',
  phonePlaceholder: '+7 (9',
  submitLabel: 'Submit a request',
  ...privacy,
} as const

export const PODBOR_MINING_HOTEL_BANNERS_EN = {
  ...PODBOR_MINING_HOTEL_BANNERS,
  items: [
    {
      ...PODBOR_MINING_HOTEL_BANNERS.items[0],
      title: 'Need ASIC miners?',
      subtitle:
        'We will find a mining company where you can buy ASIC miners 10% below market price',
      buttonLabel: 'Learn more',
      imageAlt: 'Whatsminer ASIC miners with TOP MINING branding',
    },
    {
      ...PODBOR_MINING_HOTEL_BANNERS.items[1],
      title: 'Are you a miner?',
      subtitle: 'We will increase your income by 10%',
      buttonLabel: 'Learn more',
      imageAlt: 'Miner at monitors with charts and data',
    },
  ],
} as const
