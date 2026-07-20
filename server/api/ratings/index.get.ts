import { RATINGS_FALLBACK_CARDS } from '~/common/modules/ratings/fallback'
import { mergeRatingsWithFallback } from '~/common/modules/ratings/merge-ratings-fallback'
import type { RatingsResponse, TopMiningRatingCard } from '~/common/modules/ratings'
import { RATINGS_QUERY } from '~/server/graphql/queries'
import { fetchGraphQL } from '~/server/utils/graphql'

export default defineEventHandler(async () => {
  try {
    const data = await fetchGraphQL<{ ratings: TopMiningRatingCard[] }>(
      RATINGS_QUERY,
    )

    return {
      source: 'graphql',
      updatedAt: new Date().toISOString(),
      cards: mergeRatingsWithFallback(data.ratings, RATINGS_FALLBACK_CARDS),
    } satisfies RatingsResponse
  } catch {
    return {
      source: 'fallback',
      updatedAt: new Date().toISOString(),
      cards: RATINGS_FALLBACK_CARDS,
    } satisfies RatingsResponse
  }
})
