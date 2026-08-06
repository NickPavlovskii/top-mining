import { createError } from 'h3'
import type { PodborPlacementOffer } from '~/common/modules/top-mining/podbor/mining-hotel'
import { PODBOR_SALE_OFFERS_QUERY } from '~/server/graphql/queries'
import { fetchGraphQL } from '~/server/utils/graphql'

type GraphQLSaleData = {
  podborSaleOffers: PodborPlacementOffer[]
}

export default defineEventHandler(async () => {
  try {
    const data = await fetchGraphQL<GraphQLSaleData>(PODBOR_SALE_OFFERS_QUERY)

    return {
      source: 'graphql',
      offers: data.podborSaleOffers ?? [],
    }
  } catch (error) {
    const detail = error instanceof Error ? error.message : String(error)
    throw createError({
      statusCode: 503,
      statusMessage: 'Sale offers unavailable',
      message: `Sale offers unavailable: ${detail}`,
      cause: error,
    })
  }
})
