import { getOrganizationDetailFallback } from '~/common/modules/catalog/organization-detail'
import type {
  CatalogOrganizationDetail,
  CatalogOrganizationDetailResponse,
} from '~/types/catalog-organization-detail'

export default defineEventHandler(async (event) => {
  const config = useRuntimeConfig()
  const slug = String(getRouterParam(event, 'slug') || '')
  const baseUrl = config.catalogApiUrl || config.articlesApiUrl || 'http://localhost:8080'

  try {
    const organization = await $fetch<
      CatalogOrganizationDetailResponse['organization']
    >(`${baseUrl}/api/catalog/organizations/${encodeURIComponent(slug)}`)

    return {
      source: 'api',
      updatedAt: new Date().toISOString(),
      organization,
    } satisfies CatalogOrganizationDetailResponse
  } catch {
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
