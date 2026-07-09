export type {
  TopMiningRatingCard,
  TopMiningRatingItem,
} from '~/types/ratings'
export { DEFAULT_RATING_CARD_COLUMNS } from '~/types/ratings'

export {
  RATINGS_FALLBACK_CARDS,
  RATINGS_FALLBACK_HOME_CARDS,
} from './fallback'

/** @deprecated используйте RATINGS_FALLBACK_CARDS или /api/ratings */
export { RATINGS_FALLBACK_CARDS as TOP_MINING_RATING_CARDS } from './fallback'

/** @deprecated используйте RATINGS_FALLBACK_HOME_CARDS или /api/ratings/home */
export { RATINGS_FALLBACK_HOME_CARDS as TOP_MINING_RATING_HOME_CARDS } from './fallback'

export const TOP_MINING_RATING_SURFACE = 'var(--tm-rating-surface)'

export const TOP_MINING_RATING_VIDEO =
  'https://top-mining.ru/wp-content/themes/top-mining/img/home-h2-rating.mp4'
