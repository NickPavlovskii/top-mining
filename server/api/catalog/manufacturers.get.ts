import {
  applyCatalogReviewStatsToManufacturers,
  buildCatalogManufacturersResponse,
} from '~/common/modules/catalog/manufacturers-page'
import type { CatalogResponse } from '~/common/modules/catalog'
import { CATALOG_QUERY } from '~/server/graphql/queries'
import { fetchGraphQL } from '~/server/utils/graphql'

export default defineEventHandler(async () => {
  const base = buildCatalogManufacturersResponse()

  try {
    const data = await fetchGraphQL<{
      catalog: Omit<CatalogResponse, 'source' | 'updatedAt'>
    }>(CATALOG_QUERY)

    return {
      ...base,
      source: 'api',
      updatedAt: new Date().toISOString(),
      manufacturers: applyCatalogReviewStatsToManufacturers(
        base.manufacturers,
        data.catalog.categories,
      ),
    }
  } catch {
    return base
  }
})
