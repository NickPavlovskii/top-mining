/**
 * English copies of the Consulting landing content.
 * Types, identifiers, assets, links, and numeric values are owned by RU modules.
 */
import { CONSULTING_PAGE } from './page'
import { CONSULTING_ENTER_MINING } from './enter-mining'
import { CONSULTING_SOPROVOD } from './soprovod'
import { CONSULTING_MANAGEMENT } from './management'
import { CONSULTING_CONSTRUCTION_FORMS } from './construction-forms'
import { CONSULTING_BEST_SPEAKER } from './best-speaker'
import { CONSULTING_WHY_US } from './why-us'
import { CONSULTING_BLACK_RING } from './black-ring'
import type { TopMiningConsultingDropdownItem } from './dropdown'

export const CONSULTING_PAGE_EN = {
  ...CONSULTING_PAGE,
  breadcrumb: 'Mining Consulting',
  titleLead: 'Consulting',
  titleMid: ' No. 1 in Mining',
  titleRest: 'Investment Support',
  heroLead: 'We increase mining income',
  heroStatLead: 'We have assembled',
  heroStatTail: 'experts',
  intro: {
    paragraphs: [
      {
        before: 'The goal of mining stores and managers is to ',
        bold: 'sell to you and profit from you.',
      },
      {
        before:
          'When you contact mining companies that sell or host ASIC miners, ',
        bold: 'they will not explain how mining actually works.',
      },
    ],
    highlight:
      'We focus first on your risks and financial security. We know which strategies help both you and the mining company earn an income.',
  },
  seoTitle: 'No. 1 Mining Consulting | TOP MINING',
  seoDescription:
    'Mining consulting and investment support. Increase mining income with a team of 20+ experts.',
} as const

export const CONSULTING_ENTER_MINING_EN = {
  ...CONSULTING_ENTER_MINING,
  sectionTitle: 'Consulting',
  leftTitle: 'A profitable entry into mining',
  leftLead: 'Receive a complete overview of mining in Russia.',
  leftText:
    'We answer your mining questions, from equipment delivery to generating profit.',
  summaryLabel: 'In total:',
  summaryText:
    'You will receive guidance to buy, host, and operate ASIC miners safely and profitably in Russia.',
  priceLabel: 'Total cost:',
  priceValue: 'from 50,000 RUB',
  ctaLabel: 'Submit a request',
  warningLead: 'Please note',
  warningMid: 'the',
  warningTag: 'Commercial benefit',
  warningTail:
    'tag next to questions that can immediately recover the consulting fee, even when buying one ASIC miner.',
} as const

export const CONSULTING_SOPROVOD_EN = {
  ...CONSULTING_SOPROVOD,
  sectionTitle: 'Support / Tender',
  cards: [
    {
      ...CONSULTING_SOPROVOD.cards[0],
      titleLines: ['Need', 'ASIC MINERS?'],
      titleMobile: 'NEED ASIC MINERS?',
      subtitle:
        'We will select a mining company where you can buy ASIC miners below market price.',
      benefits: [
        { type: 'lead', text: '46 mining-equipment sellers compete for your business with their lowest prices.' },
        { type: 'item', text: 'We will reduce supplier prices by 7%', layout: 'inline' },
        { type: 'item', text: 'We will negotiate the lowest hosting rate', layout: 'cont' },
        { type: 'item', text: 'Save you 100+ hours on selection, contracts, and repairs', layout: 'cont' },
        { type: 'item', text: 'Protect 5% of your investment by reducing risk', layout: 'cont' },
        { type: 'item', text: 'Your ASIC miners and investments are safe with us', layout: 'cont' },
      ],
      footnote: 'We may even advise against entering mining, depending on the market or your circumstances, saving you millions of rubles.',
      priceLabel: 'Total cost:',
      priceValue: 'from 50,000 RUB',
      ctaLabel: 'Submit a request',
      detailsLabel: 'Learn more',
    },
    {
      ...CONSULTING_SOPROVOD.cards[1],
      titleLines: ['Need a', 'MINING HOTEL?'],
      titleMobile: 'NEED A MINING HOTEL?',
      subtitle:
        'We will select a mining hotel where you can host ASIC miners below market rates.',
      benefits: [
        { type: 'lead', text: '39 mining-equipment hosting companies compete for your business with the best rates.' },
        { type: 'item', text: 'We are No. 1 among mining-hotel aggregators', layout: 'inline' },
        { type: 'item', text: 'Host from 1 MW of your ASIC miners', layout: 'cont' },
        { type: 'item', text: 'Receive the best mining-hotel terms', layout: 'cont' },
      ],
      footnote: 'We may even advise against entering mining, depending on the market or your circumstances, saving you millions of rubles.',
      priceLabel: 'Total cost:',
      priceValue: 'from 50,000 RUB',
      ctaLabel: 'Submit a request',
      detailsLabel: 'Learn more',
    },
  ],
} as const

export const CONSULTING_MANAGEMENT_EN = {
  ...CONSULTING_MANAGEMENT,
  sectionTitle: 'Management',
  cards: CONSULTING_MANAGEMENT.cards.map((card) => ({
    ...card,
    title:
      card.id === 'data-center'
        ? 'Manage your data center'
        : card.id === 'asics'
          ? 'Manage your ASIC miners'
          : 'Data center construction',
    priceLabel: 'Total cost:',
    priceValue: card.id === 'construction' ? 'from 100,000 RUB' : '% of profit',
    ctaLabel: 'Submit a request',
    detailsLabel: card.detailsLabel ? 'Learn more' : undefined,
  })),
} as const

export const CONSULTING_CONSTRUCTION_FORMS_EN = {
  ...CONSULTING_CONSTRUCTION_FORMS,
  privacyPrefix: 'By continuing, you agree to the',
  privacyLinkLabel: 'Privacy Policy',
  submitLabel: 'Send',
  honeypotLabel: 'Leave this field empty.',
  forms: [
    {
      ...CONSULTING_CONSTRUCTION_FORMS.forms[0],
      titleLines: ['Sell a data center', 'Sell capacity (MW)', 'Sell land (for MW)', 'Lease out'],
      fields: [
        { name: 'your-name', placeholder: 'Your name', required: true, autocomplete: 'name' },
        { name: 'region', placeholder: 'Region' },
        { name: 'power', placeholder: 'Capacity' },
        { name: 'price', placeholder: 'Estimated electricity price' },
        { name: 'your-telegram', placeholder: 'Your Telegram', required: true },
      ],
    },
    {
      ...CONSULTING_CONSTRUCTION_FORMS.forms[1],
      titleLines: ['Buy a data center', 'Build a data center', 'Lease'],
      fields: [
        { name: 'your-name', placeholder: 'Your name', required: true, autocomplete: 'name' },
        { name: 'invesr_value', placeholder: 'Investment amount' },
        { name: 'your-telegram', placeholder: 'Your Telegram', required: true },
      ],
    },
  ],
} as const

export const CONSULTING_BEST_SPEAKER_EN = {
  ...CONSULTING_BEST_SPEAKER,
  title: 'WE BRING TOGETHER THE BEST EXPERTS IN MINING!',
  subtitle:
    'Are you an outstanding mining specialist who wants to become a TOP MINING partner and expert?',
  telegramLead: 'Message us on',
  telegramTail: 'or send your CV, tell us about yourself, or leave your contact details',
  anonymityNote: 'All applications are completely anonymous!',
  fields: [
    { name: 'your-name', placeholder: 'Your name', required: true, autocomplete: 'name', width: 'half' as const },
    { name: 'your-telegram', placeholder: 'Your Telegram', required: true, width: 'half' as const },
  ],
  textarea: { name: 'textarea-best', placeholder: 'What are you best at in mining?', required: true },
  fileUpload: {
    ...CONSULTING_BEST_SPEAKER.fileUpload,
    chooseLabel: 'Choose a file',
    counterTemplate: 'of',
    invalidFormatError: 'Invalid file format. PDF and DOC are allowed.',
    invalidSizeError: 'File size must not exceed 10 MB.',
    removeFileLabel: 'Remove file',
  },
  submitLabel: 'SEND',
  honeypotLabel: 'Leave this field empty.',
  privacyPrefix: 'By continuing, you agree to the',
  privacyLinkLabel: 'Privacy Policy',
} as const

export const CONSULTING_WHY_US_EN = {
  ...CONSULTING_WHY_US,
  title: 'Why is it profitable to work with us?',
  segments: [
    { text: 'We are mining' }, { text: 'industry' }, { text: 'experts.' }, { type: 'spacer' },
    { text: 'We do not sell' }, { text: 'equipment or' }, { text: 'hosting services.' }, { type: 'br' },
    { text: 'Our primary task' }, { text: 'is to help you find' }, { text: 'the right mining company.' }, { type: 'spacer' },
    { text: 'We know the market' }, { text: 'well and maintain a list' }, { text: 'of trusted companies' },
    { text: 'that meet our' }, { text: 'high standards' }, { text: '(integrity, security,' }, { text: 'reputation, price).' }, { type: 'br' },
    { text: 'These companies compete' }, { text: 'with each other to offer' }, { text: 'you the best' }, { text: 'prices.' }, { type: 'spacer' },
    { text: 'By working with us,' }, { text: 'they reduce their' }, { text: 'marketing and sales' }, { text: 'costs, enabling' },
    { text: 'better terms that' }, { text: 'we then offer' }, { text: 'through our services.' },
  ],
} as const

export const CONSULTING_BLACK_RING_EN = {
  ...CONSULTING_BLACK_RING,
  title: 'List your organization on the portal',
  fields: [
    { name: 'your-name', placeholder: 'Your name', required: true, autocomplete: 'name', width: 'half' as const },
    { name: 'your-telegram', placeholder: 'Your Telegram', required: true, width: 'half' as const },
    { name: 'company', placeholder: 'Company', width: 'full' as const },
  ],
  submitLabel: 'Send',
  honeypotLabel: 'Leave this field empty.',
  privacyPrefix: 'By continuing, you agree to the',
  privacyLinkLabel: 'Privacy Policy',
  telegramLead: 'Or message us on',
  priceLabel: 'Total cost:',
  priceValue: 'Free',
} as const

export const TOP_MINING_CONSULTING_DROPDOWN_ITEMS_EN: readonly TopMiningConsultingDropdownItem[] = [
  { label: 'Mining consulting', href: '/consulting/' },
  { label: 'We help you buy ASIC miners profitably', href: '/asic-majnery-po-czenam-nizhe-rynka/' },
  { label: 'Increase your income', href: '/uvelichim-vash-dohod/' },
  { label: 'We select a mining hotel', href: '/podbor-majning-otelya/' },
  { label: 'Data center construction', href: '/data-center-construction/' },
]

const consultingHrefByLabelEn = new Map(
  TOP_MINING_CONSULTING_DROPDOWN_ITEMS_EN.map((item) => [item.label, item.href]),
)

export function getConsultingServiceHrefEn(label: string): string {
  return consultingHrefByLabelEn.get(label) ?? '#'
}
