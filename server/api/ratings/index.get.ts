import { RATINGS_FALLBACK_CARDS } from '~/common/modules/ratings/fallback'
import type { RatingsResponse, TopMiningRatingCard } from '~/types/ratings'
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
      cards: data.ratings,
    } satisfies RatingsResponse
  } catch {
    return {
      source: 'fallback',
      updatedAt: new Date().toISOString(),
      cards: RATINGS_FALLBACK_CARDS,
    } satisfies RatingsResponse
  }
})
