export type TopMiningSelectMode = 'flat' | 'tree'
export type TopMiningSelectSize = 'lg' | 'md' | 'sm'

export interface TopMiningSelectOption {
  id: string
  label: string
  image?: string
  meta?: string
  data?: unknown
}

export interface TopMiningSelectGroup {
  id: string
  label: string
  children: TopMiningSelectOption[]
}
