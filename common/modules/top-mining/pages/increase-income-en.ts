/**
 * English content for the Increase Your Income landing.
 */
import bannerAsic from '~/assets/images/increase-income/banner-asic.png'
import bannerHotel from '~/assets/images/increase-income/banner-hotel.png'

export const INCREASE_INCOME_PAGE_EN = {
  breadcrumb: 'Increase Your Income',
  seoTitle: 'Increase Your Income | TOP MINING',
  seoDescription:
    'Do your ASIC miners earn from 100,000 RUB per month? We will increase your net profit by 7%.',
  titleLead: 'ARE YOU A MINER?',
  titleMain: 'INCREASE YOUR INCOME',
  cardLead:
    'Do your ASIC miners earn from 100,000 RUB per month? We will increase your net profit by 7%.',
  cardCta: 'Want to know how? Submit a request.',
  phonePlaceholder: 'Phone',
  submitLabel: 'LEARN MORE',
  honeypotLabel: 'Leave this field empty.',
  privacyPrefix: 'By continuing, you agree to the',
  privacyLinkLabel: 'Privacy Policy',
  privacyHref: '/privacy',
  promoCards: [
    {
      id: 'asic',
      title: 'We will find the best-value and most affordable ASIC miners for you',
      href: '/asic-majnery-po-czenam-nizhe-rynka/',
      buttonLabel: 'GO TO PAGE',
      image: bannerAsic,
      imageAlt: 'Whatsminer ASIC miners with TOP MINING branding',
    },
    {
      id: 'hotel',
      title: 'We will improve your mining-hotel electricity rate',
      href: '/podbor-majning-otelya/',
      buttonLabel: 'GO TO PAGE',
      image: bannerHotel,
      imageAlt: 'Light bulb with a Bitcoin symbol and coins',
    },
  ],
} as const

export type IncreaseIncomePageEn = typeof INCREASE_INCOME_PAGE_EN
