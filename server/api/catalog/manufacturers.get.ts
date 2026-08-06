import { createError } from 'h3'
import {
  buildCatalogManufacturersResponse,
  manufacturersFromCatalogCategories,
} from '~/common/modules/catalog/pages/manufacturers'
import type { CatalogResponse } from '~/common/modules/catalog'
import { CATALOG_QUERY } from '~/server/graphql/queries'
import { fetchGraphQL } from '~/server/utils/graphql'

export default defineEventHandler(async () => {
  try {
    const data = await fetchGraphQL<{
      catalog: Omit<CatalogResponse, 'source' | 'updatedAt'>
    }>(CATALOG_QUERY)

    const manufacturers = manufacturersFromCatalogCategories(
      data.catalog.categories ?? [],
    )

    return buildCatalogManufacturersResponse(manufacturers, 'api')
  } catch (error) {
    const detail = error instanceof Error ? error.message : String(error)
    throw createError({
      statusCode: 503,
      statusMessage: 'Manufacturers unavailable',
      message: `Manufacturers unavailable: ${detail}`,
      cause: error,
    })
  }
})
