import { createError } from 'h3'
import { getCatalogCategoryHref } from '~/common/modules/catalog/nav-links'
import type { CatalogCategory, CatalogResponse } from '~/common/modules/catalog'
import { CATALOG_QUERY } from '~/server/graphql/queries'
import { fetchGraphQL } from '~/server/utils/graphql'

const CATEGORY_HREFS: Record<string, string> = {
  'asic-sales': getCatalogCategoryHref('asic-sales'),
  'mining-hotels': getCatalogCategoryHref('mining-hotels'),
  'equipment-manufacturers': getCatalogCategoryHref('equipment-manufacturers'),
  'mining-pools': getCatalogCategoryHref('mining-pools'),
  'asic-repair': getCatalogCategoryHref('asic-repair'),
  'crypto-exchanges': getCatalogCategoryHref('crypto-exchanges'),
  'crypto-wallets': getCatalogCategoryHref('crypto-wallets'),
}

interface GraphQLCatalogData {
  catalog: Omit<CatalogResponse, 'source' | 'updatedAt'>
}

function normalizeCatalog(
  catalog: Omit<CatalogResponse, 'source' | 'updatedAt'>,
): Omit<CatalogResponse, 'source' | 'updatedAt'> {
  return {
    ...catalog,
    categories: catalog.categories.map((category) => ({
      ...category,
      href:
        (category as CatalogCategory).href
        || CATEGORY_HREFS[category.slug]
        || '#',
      organizations: category.organizations.map((organization) => ({
        ...organization,
        href: organization.href || '#',
      })),
    })),
  }
}

export default defineEventHandler(async () => {
  try {
    const data = await fetchGraphQL<GraphQLCatalogData>(CATALOG_QUERY)

    return {
      source: 'graphql',
      updatedAt: new Date().toISOString(),
      ...normalizeCatalog(data.catalog),
    } satisfies CatalogResponse
  } catch (error) {
    throw createError({
      statusCode: 503,
      statusMessage: 'Catalog unavailable',
      cause: error,
    })
  }
})
