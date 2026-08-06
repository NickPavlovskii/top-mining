export type TopMiningFormStatusKind = 'idle' | 'loading' | 'success' | 'error'

export type TopMiningFormStatusProps = {
  status: TopMiningFormStatusKind
  message?: string
  align?: 'start' | 'center'
  tone?: 'light' | 'dark'
  compact?: boolean
}
