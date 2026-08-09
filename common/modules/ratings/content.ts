/**
 * Пакет ratings — рейтинги.
 * Ассеты и константы UI (данные карточек — в БД /api/ratings).
 */
export type {
  TopMiningRatingCard,
  TopMiningRatingItem,
} from './types'
export { DEFAULT_RATING_CARD_COLUMNS } from './types'

export const TOP_MINING_RATING_SURFACE = 'var(--tm-rating-surface)'

export const TOP_MINING_RATING_VIDEO =
  'https://top-mining.ru/wp-content/themes/top-mining/img/home-h2-rating.mp4'
