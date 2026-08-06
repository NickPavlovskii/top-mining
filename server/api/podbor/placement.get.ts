import { createError } from 'h3'
import type { PodborPlacementOffer } from '~/common/modules/top-mining/podbor/mining-hotel'
import { PODBOR_PLACEMENT_OFFERS_QUERY } from '~/server/graphql/queries'
import { fetchGraphQL } from '~/server/utils/graphql'

type GraphQLPlacementData = {
  podborPlacementOffers: PodborPlacementOffer[]
}

export default defineEventHandler(async () => {
  try {
    const data = await fetchGraphQL<GraphQLPlacementData>(
      PODBOR_PLACEMENT_OFFERS_QUERY,
    )

    return {
      source: 'graphql',
      offers: data.podborPlacementOffers ?? [],
    }
  } catch (error) {
    const detail = error instanceof Error ? error.message : String(error)
    throw createError({
      statusCode: 503,
      statusMessage: 'Placement offers unavailable',
      message: `Placement offers unavailable: ${detail}`,
      cause: error,
    })
  }
})
