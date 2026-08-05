export const TOP_MINING_CONTACT_PHONE = {
  label: '+7 495 492-78-99',
  href: 'tel:+74954927899',
} as const

export const TOP_MINING_CONTACT_TELEGRAM = {
  label: 'Написать в Telegram',
  handle: '@TOP_MINING_CONSULTING',
  href: 'https://t.me/TOP_MINING_CONSULTING',
  buttonColor: 'var(--jet-color)',
} as const

/** Linear gradient из Figma: #EC5100 → #FF741F */
export const TOP_MINING_CONTACT_BUTTON_GRADIENT =
  'var(--tm-orange-accent-gradient-horizontal)' as const

export const TOP_MINING_CONTACT_QUESTION = {
  title: 'Задайте вопрос',
  lead: 'Оставьте контакт и мы перезвоним',
  placeholder: '+7 (9',
  telegramDivider: 'ИЛИ ПИШИТЕ В TELEGRAM',
} as const

export const TOP_MINING_CONTACT_SUBSCRIBE = {
  title: 'Подпишитесь',
  lead: 'на нашу рассылку',
  placeholder: 'E-mail',
} as const

export type TopMiningContactBlockKey = 'question' | 'subscribe'

type CssSize = number | string

export type TopMiningContactBlockLayout = {
  contentMaxWidth: CssSize
  titleFontSize: number
  titleLineHeight: number
  leadFontSize: number
  leadLineHeight: number
  titleLeadGap: number
  leadFormGap: number
  leadMaxWidth: CssSize
  inputWidth: CssSize
  inputRowMaxWidth: CssSize
  formDividerGap: number
  dividerButtonGap: number
  dividerMaxWidth: CssSize
  controlHeight: number
  submitButtonSize: number
  inputGap: number
  telegramButtonWidth: CssSize
  telegramButtonFontSize: number
  telegramButtonLineHeight: number
}

/** Figma desktop — круг шире 720px */
export const TOP_MINING_CONTACT_LAYOUT = {
  question: {
    contentMaxWidth: 667,
    titleFontSize: 56,
    titleLineHeight: 64,
    leadFontSize: 28,
    leadLineHeight: 34,
    titleLeadGap: 61,
    leadFormGap: 35,
    leadMaxWidth: 609,
    inputWidth: 357,
    inputRowMaxWidth: 430,
    formDividerGap: 51,
    dividerButtonGap: 31,
    dividerMaxWidth: 434,
    controlHeight: 56,
    submitButtonSize: 56,
    inputGap: 17,
    telegramButtonWidth: 346,
    telegramButtonFontSize: 16,
    telegramButtonLineHeight: 22,
  },
  subscribe: {
    contentMaxWidth: 579,
    titleFontSize: 56,
    titleLineHeight: 64,
    leadFontSize: 28,
    leadLineHeight: 34,
    titleLeadGap: 8,
    leadFormGap: 43,
    leadMaxWidth: 579,
    inputWidth: 357,
    inputRowMaxWidth: 430,
    formDividerGap: 0,
    dividerButtonGap: 0,
    dividerMaxWidth: 579,
    controlHeight: 56,
    submitButtonSize: 56,
    inputGap: 17,
    telegramButtonWidth: 579,
    telegramButtonFontSize: 16,
    telegramButtonLineHeight: 22,
  },
} as const satisfies Record<TopMiningContactBlockKey, TopMiningContactBlockLayout>

const COMPACT_SHARED_720 = {
  contentMaxWidth: '88%',
  titleFontSize: 34,
  titleLineHeight: 38,
  leadFontSize: 16,
  leadLineHeight: 20,
  leadFormGap: 14,
  formDividerGap: 18,
  dividerButtonGap: 12,
  leadMaxWidth: '100%',
  inputWidth: '100%',
  inputRowMaxWidth: '100%',
  dividerMaxWidth: '100%',
  controlHeight: 48,
  submitButtonSize: 48,
  inputGap: 12,
  telegramButtonWidth: '90%',
  telegramButtonFontSize: 12,
  telegramButtonLineHeight: 16,
} as const satisfies Partial<TopMiningContactBlockLayout>

const COMPACT_SHARED_480 = {
  contentMaxWidth: '86%',
  titleFontSize: 28,
  titleLineHeight: 32,
  leadFontSize: 14,
  leadLineHeight: 18,
  leadFormGap: 12,
  formDividerGap: 16,
  dividerButtonGap: 12,
  leadMaxWidth: '100%',
  inputWidth: '100%',
  inputRowMaxWidth: '100%',
  dividerMaxWidth: '100%',
  controlHeight: 44,
  submitButtonSize: 44,
  inputGap: 10,
  telegramButtonWidth: '82%',
  telegramButtonFontSize: 11,
  telegramButtonLineHeight: 14,
} as const satisfies Partial<TopMiningContactBlockLayout>

const COMPACT_SHARED_400 = {
  contentMaxWidth: '88%',
  titleFontSize: 24,
  titleLineHeight: 28,
  leadFontSize: 13,
  leadLineHeight: 17,
  leadFormGap: 10,
  formDividerGap: 14,
  dividerButtonGap: 10,
  leadMaxWidth: '100%',
  inputWidth: '100%',
  inputRowMaxWidth: '100%',
  dividerMaxWidth: '100%',
  controlHeight: 40,
  submitButtonSize: 40,
  inputGap: 8,
  telegramButtonWidth: '84%',
  telegramButtonFontSize: 10,
  telegramButtonLineHeight: 13,
} as const satisfies Partial<TopMiningContactBlockLayout>

export const TOP_MINING_CONTACT_CIRCLE_TIERS = [
  {
    maxCircleWidth: 400,
    layout: {
      question: {
        ...COMPACT_SHARED_400,
        titleLeadGap: 12,
        leadFormGap: 10,
      },
      subscribe: {
        ...COMPACT_SHARED_400,
        titleLeadGap: 6,
        leadFormGap: 12,
      },
    },
  },
  {
    maxCircleWidth: 480,
    layout: {
      question: {
        ...COMPACT_SHARED_480,
        titleLeadGap: 14,
        leadFormGap: 12,
      },
      subscribe: {
        ...COMPACT_SHARED_480,
        titleLeadGap: 8,
        leadFormGap: 14,
      },
    },
  },
  {
    maxCircleWidth: 720,
    layout: {
      question: {
        ...COMPACT_SHARED_720,
        titleLeadGap: 20,
        leadFormGap: 14,
      },
      subscribe: {
        ...COMPACT_SHARED_720,
        titleLeadGap: 6,
        leadFormGap: 30,
      },
    },
  },
] as const satisfies ReadonlyArray<{
  maxCircleWidth: number
  layout: Record<TopMiningContactBlockKey, TopMiningContactBlockLayout>
}>

function toCssSize(value: CssSize): string {
  return typeof value === 'number' ? `${value}px` : value
}

export function topMiningContactLayoutToCssVars(
  layout: TopMiningContactBlockLayout,
): Record<string, string> {
  return {
    '--cc-width': toCssSize(layout.contentMaxWidth),
    '--cc-title-size': `${layout.titleFontSize}px`,
    '--cc-title-lh': `${layout.titleLineHeight}px`,
    '--cc-lead-size': `${layout.leadFontSize}px`,
    '--cc-lead-lh': `${layout.leadLineHeight}px`,
    '--cc-title-lead-gap': `${layout.titleLeadGap}px`,
    '--cc-lead-form-gap': `${layout.leadFormGap}px`,
    '--cc-lead-max-w': toCssSize(layout.leadMaxWidth),
    '--cc-input-w': toCssSize(layout.inputWidth),
    '--cc-input-row-w': toCssSize(layout.inputRowMaxWidth),
    '--cc-form-divider-gap': `${layout.formDividerGap}px`,
    '--cc-divider-btn-gap': `${layout.dividerButtonGap}px`,
    '--cc-divider-max-w': toCssSize(layout.dividerMaxWidth),
    '--cc-control-h': `${layout.controlHeight}px`,
    '--cc-btn-size': `${layout.submitButtonSize}px`,
    '--cc-input-gap': `${layout.inputGap}px`,
    '--cc-tg-btn-w': toCssSize(layout.telegramButtonWidth),
    '--cc-tg-btn-size': `${layout.telegramButtonFontSize}px`,
    '--cc-tg-btn-lh': `${layout.telegramButtonLineHeight}px`,
  }
}

export function getTopMiningContactBlockStyle(block: TopMiningContactBlockKey) {
  return topMiningContactLayoutToCssVars(TOP_MINING_CONTACT_LAYOUT[block])
}

export function getTopMiningContactBlockStyleForCircleWidth(
  block: TopMiningContactBlockKey,
  circleWidth: number,
) {
  const tier = TOP_MINING_CONTACT_CIRCLE_TIERS.find(
    ({ maxCircleWidth }) => circleWidth <= maxCircleWidth,
  )

  const layout = tier?.layout[block] ?? TOP_MINING_CONTACT_LAYOUT[block]
  return topMiningContactLayoutToCssVars(layout)
}

export function isTopMiningContactCompactCircle(circleWidth: number) {
  return circleWidth <= 720
}
