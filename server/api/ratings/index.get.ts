import { createError } from 'h3'
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
      cards: data.ratings ?? [],
    } satisfies RatingsResponse
  } catch (error) {
    const detail = error instanceof Error ? error.message : String(error)
    throw createError({
      statusCode: 503,
      statusMessage: 'Ratings unavailable',
      message: `Ratings unavailable: ${detail}`,
      cause: error,
    })
  }
})
