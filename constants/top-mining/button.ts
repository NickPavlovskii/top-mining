export type TopMiningButtonVariant = 'primary' | 'secondary' | 'tertiary'

export type TopMiningButtonSize = 'big' | 'small'

export type TopMiningButtonSurface = 'light' | 'dark'

export const TOP_MINING_BUTTON_COLORS = {
  orange: '#ff6418',
  orangeDark: '#f25b12',
  white: '#ffffff',
  text: '#303030',
  textDark: '#151515',
  icon: '#c8c8c8',
} as const

export const TOP_MINING_BUTTON_WIDTH = {
  contact: '220px',
  catalog: '280px',
  card: '170px',
  telegram: '220px',
} as const

export const TOP_MINING_BUTTON_BG = `linear-gradient(180deg, ${TOP_MINING_BUTTON_COLORS.orange}, ${TOP_MINING_BUTTON_COLORS.orangeDark})`

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
} as const
