import { createError, isError } from 'h3'
import { getOrganizationDetailFallback } from '~/common/modules/catalog/organization-detail'
import type {
  CatalogOrganizationDetail,
  CatalogOrganizationDetailResponse,
} from '~/types/catalog-organization-detail'
import { ORGANIZATION_QUERY } from '~/server/graphql/queries'
import { fetchGraphQL } from '~/server/utils/graphql'

export default defineEventHandler(async (event) => {
  const slug = String(getRouterParam(event, 'slug') || '')

  try {
    const data = await fetchGraphQL<{
      organization: CatalogOrganizationDetail | null
    }>(ORGANIZATION_QUERY, { slug })

    if (!data.organization) {
      throw createError({
        statusCode: 404,
        statusMessage: 'Organization not found',
      })
    }

    return {
      source: 'graphql',
      updatedAt: new Date().toISOString(),
      organization: data.organization,
    } satisfies CatalogOrganizationDetailResponse
  } catch (error) {
    if (isError(error)) {
      throw error
    }

    const fallback = getOrganizationDetailFallback(slug)

    if (!fallback) {
      throw createError({
        statusCode: 404,
        statusMessage: 'Organization not found',
      })
    }

    return {
      source: 'fallback',
      updatedAt: new Date().toISOString(),
      organization: fallback,
    } satisfies CatalogOrganizationDetailResponse
  }
})
