import { INCREASE_INCOME_PAGE_PATH } from '../pages/increase-income'
import type {
  BuyAsicHowWeWorkStep,
  BuyAsicValueCard,
} from './value-blocks'

export const BUY_ASIC_HOW_WE_WORK_EN = {
  titleId: 'buy-asic-how-we-work-title',
  titleLead: 'REDUCE THE PRICE OF',
  titleAccent: '7%',
  titleTail: 'WHEN BUYING MINING EQUIPMENT',
  subtitle: 'How we work:',
  steps: [
    { id: 'request', number: 1, parts: [{ text: 'We send every company a ' }, { text: 'request', bold: true }, { text: ' for the ASIC price and hosting rates' }] },
    { id: 'collect', number: 2, parts: [{ text: 'We collect all ' }, { text: 'pricing and rate information', bold: true }] },
    { id: 'negotiate', number: 3, parts: [{ text: 'We ' }, { text: 'negotiate', bold: true }, { text: ' with every company, amend the agreement, bargain, and account for every risk' }] },
    { id: 'offer', number: null, highlighted: true, parts: [{ text: 'We make you the best possible offer' }] },
  ] satisfies BuyAsicHowWeWorkStep[],
} as const

export const BUY_ASIC_SAFETY_EN = {
  titleId: 'buy-asic-safety-title',
  titleLines: ['WE PROVIDE 100%', 'SECURITY'],
  cards: [
    {
      id: 'risks',
      title: 'Eliminate risks at the start and protect 5% of your investment',
      subtitle: 'We take on legal risks that often cost 5–10 million ₽',
      items: [
        'How do you manage risks when buying equipment?',
        'Which risks should be considered when delivering ASIC miners?',
        'Which company documents are required?',
        'How do you avoid tax risks during delivery? What must be in the contract?',
      ],
      moreItems: [
        'How can you close the deal legally so that regulatory authorities cannot seize your ASIC miners?',
        'How do you get equipment insurance?',
        'We solve problems with failed ASIC miners (typically 3% of a batch fails — 3 million ₽ of a 100 million ₽ investment)',
        'Every day of delivery delay is lost mining revenue. We resolve customs issues when they arise',
      ],
    },
    {
      id: 'secure',
      title: 'Your ASIC miners and investment are safe with us',
      subtitle: 'Sometimes security matters more than any savings',
      items: [
        'Your ASIC miners will arrive. TOP MINING guarantees secure delivery: no delays or bankruptcies',
        'You will receive all required documents once the deal is complete',
        'Your ASIC miners will be installed at a mining hotel',
        'Your ASIC miners will not be stolen',
        'We resolve prolonged repair issues, so you do not lose money',
      ],
      footnote: '*we can keep everything confidential',
    },
  ] satisfies BuyAsicValueCard[],
} as const

export const BUY_ASIC_TIME_SAVE_EN = {
  titleId: 'buy-asic-time-save-title',
  titleLines: ['WE SAVE YOU AN AVERAGE OF', '100+ HOURS OF YOUR TIME'],
  cards: [
    {
      id: 'asic-supply',
      title: '1. Selecting, purchasing, and delivering ASIC miners. The lowest market prices',
      subtitle: 'How much do mining companies earn from selling you equipment? We will help you cut that margin in half',
      items: ['What should you consider when choosing ASIC miners?', 'How do you choose equipment with the best price-to-performance ratio?', 'We negotiate supplier prices down', 'Loan / leasing / instalments / investment'],
      moreItems: ['How do you draft a supply agreement correctly, and what should it cover?', 'How do you meet delivery deadlines and receive ASIC miners on time?', 'Which company documents are required?', 'How do you register ASIC miners under the new law?'],
      cta: { href: '#buy-asic-models', label: 'LEARN MORE', labelAccent: 'ABOUT BUYING ASIC MINERS' },
    },
    {
      id: 'hotel',
      title: '2. Selecting a mining hotel. The best possible terms',
      items: ['What should you consider when choosing a mining hotel?', 'Which company documents are required?', 'How do you draft a mining-hotel agreement correctly?', 'How do you approve and lock in placement dates at your rate?', 'What should you consider when terminating the agreement?', 'How do you choose legal hosting?', 'What should you know about the ASIC installation fee? (moving to a new host or placement without a purchase)'],
      moreItems: ['What should you consider when choosing a facility region?', 'How do you reduce electricity costs?', 'Placement security'],
    },
    {
      id: 'income',
      fullWidth: true,
      title: '3. Do your ASIC miners earn from 100,000 ₽ per month?\nWe will increase your net profit by 7%',
      subtitle: 'Want to find out how?',
      items: [],
      cta: { href: INCREASE_INCOME_PAGE_PATH, label: 'LEARN MORE', labelAccent: 'ABOUT INCREASING INCOME' },
    },
  ] satisfies BuyAsicValueCard[],
} as const

export const BUY_ASIC_VALUE_BLOCKS_EN = {
  howWeWork: BUY_ASIC_HOW_WE_WORK_EN,
  safety: BUY_ASIC_SAFETY_EN,
  timeSave: BUY_ASIC_TIME_SAVE_EN,
  seeMoreLabel: 'Show more',
  seeLessLabel: 'Show less',
} as const
