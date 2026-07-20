export type TopMiningChipPreset =
  | 'blue'
  | 'green'
  | 'orange'
  | 'red'
  | 'purple'
  | 'gray'
  | 'teal'
  | 'pink'
  | 'yellow'
  | 'indigo'
  | 'dark'
  | 'dark-success'
  | 'dark-danger'

export type TopMiningChipSize = 'xs' | 'sm' | 'md' | 'lg'

export type TopMiningChipShape = 'pill' | 'rounded' | 'square'

export type TopMiningChipIconPosition = 'left' | 'right' | 'none'

export type TopMiningChipIconVariant = 'badge' | 'plain'

export type TopMiningChipLayout = 'inline' | 'info'

export const TOP_MINING_CHIP_SHAPE_RADIUS: Record<TopMiningChipShape, string> = {
  pill: '999px',
  rounded: '12px',
  square: '2px',
}

export const TOP_MINING_CHIP_SIZE = {
  xs: { icon: 10, close: 10, badge: 16 },
  sm: { icon: 13, close: 12, badge: 18 },
  md: { icon: 16, close: 14, badge: 20 },
  lg: { icon: 18, close: 16, badge: 24 },
} satisfies Record<
  TopMiningChipSize,
  { icon: number; close: number; badge: number }
>

export const TOP_MINING_CHIP_DEFAULTS = {
  label: '',
  icon: '',
  iconPosition: 'left' as TopMiningChipIconPosition,
  prependIcon: '',
  appendIcon: '',
  iconVariant: 'badge' as TopMiningChipIconVariant,
  size: 'sm' as TopMiningChipSize,
  shape: 'rounded' as TopMiningChipShape,
  preset: '' as TopMiningChipPreset | '',
  closable: false,
  disabled: false,
  clickable: false,
  dot: false,
  outlined: false,
  layout: 'inline' as TopMiningChipLayout,
  subtitle: '',
  appendImageUrl: '',
  appendImageAlt: '',
  minWidth: 'auto',
  borderWidth: '1px',
}

/** Цвета иконки статуса проверки (badge / реестр). */
export const TOP_MINING_VERIFICATION_STATUS_COLORS = {
  icon: '#fff',
  success: '#4caf50',
  danger: '#ef4444',
} as const
