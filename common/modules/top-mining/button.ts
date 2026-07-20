export type TopMiningButtonVariant = 'primary' | 'secondary' | 'tertiary'

export type TopMiningButtonSize = 'big' | 'small'

export type TopMiningButtonSurface = 'light' | 'dark'

export const TOP_MINING_BUTTON_COLORS = {
  orange: 'var(--orange-color)',
  orangeDark: 'var(--orange-dark-color)',
  white: 'var(--white-color)',
  text: 'var(--text-secondary-color)',
  textDark: 'var(--jet-color)',
  icon: 'var(--icon-color)',
} as const

export const TOP_MINING_BUTTON_WIDTH = {
  contact: '220px',
  catalog: '280px',
  card: '170px',
  ratingCard: '198px',
  telegramCard: '220px',
  telegram: '220px',
} as const

export const TOP_MINING_BUTTON_BG = 'var(--orange-gradient)'

export const TOP_MINING_BUTTON_PROPS = {
  bgColor: TOP_MINING_BUTTON_BG,
  color: TOP_MINING_BUTTON_COLORS.white,
  variant: 'primary',
  size: 'big',
  surface: 'dark',
} as const satisfies {
  bgColor: string
  color: string
  variant: TopMiningButtonVariant
  size: TopMiningButtonSize
  surface: TopMiningButtonSurface
}

export const TOP_MINING_BUTTON_LABELS = {
  writeInTelegram: 'Написать в Telegram',
  viewRatings: 'Смотреть рейтинги',
  inTelegram: 'В Telegram',
} as const
