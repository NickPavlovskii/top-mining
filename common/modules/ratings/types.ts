export interface TopMiningRatingItem {
  number: string
  label: string
  href: string
}

export interface TopMiningRatingCard {
  id: string
  title: string
  items: TopMiningRatingItem[]
  columns?: 1 | 2
}

export const DEFAULT_RATING_CARD_COLUMNS = 1 as const

export interface RatingsResponse {
  source: 'graphql' | 'fallback'
  updatedAt: string
  cards: TopMiningRatingCard[]
}
