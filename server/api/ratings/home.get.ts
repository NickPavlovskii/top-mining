import { createError } from 'h3'
import type { RatingsResponse, TopMiningRatingCard } from '~/common/modules/ratings'
import { RATINGS_HOME_QUERY } from '~/server/graphql/queries'
import { fetchGraphQL } from '~/server/utils/graphql'

export default defineEventHandler(async () => {
  try {
    const data = await fetchGraphQL<{ ratingsHome: TopMiningRatingCard[] }>(
      RATINGS_HOME_QUERY,
    )

    return {
      source: 'graphql',
      updatedAt: new Date().toISOString(),
      cards: data.ratingsHome ?? [],
    } satisfies RatingsResponse
  } catch (error) {
    const detail = error instanceof Error ? error.message : String(error)
    throw createError({
      statusCode: 503,
      statusMessage: 'Home ratings unavailable',
      message: `Home ratings unavailable: ${detail}`,
      cause: error,
    })
  }
})
