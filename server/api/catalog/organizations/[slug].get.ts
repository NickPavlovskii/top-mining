import { setResponseStatus } from 'h3'
import type { CatalogOrganizationDetailResponse } from '~/common/modules/catalog'
import type { CatalogOrganizationDetail } from '~/common/modules/catalog'
import { ORGANIZATION_QUERY } from '~/server/graphql/queries'
import { fetchGraphQL } from '~/server/utils/graphql'

export default defineEventHandler(async (event) => {
  const slug = String(getRouterParam(event, 'slug') || '')

  if (!slug) {
    setResponseStatus(event, 400)
    return {
      source: 'graphql',
      updatedAt: new Date().toISOString(),
      organization: null,
    } satisfies CatalogOrganizationDetailResponse & {
      organization: CatalogOrganizationDetail | null
    }
  }

  try {
    const data = await fetchGraphQL<{
      organization: CatalogOrganizationDetail | null
    }>(ORGANIZATION_QUERY, { slug })

    if (data.organization) {
      return {
        source: 'graphql',
        updatedAt: new Date().toISOString(),
        organization: data.organization,
      } satisfies CatalogOrganizationDetailResponse
    }
  } catch {
    setResponseStatus(event, 503)
    return {
      source: 'graphql',
      updatedAt: new Date().toISOString(),
      organization: null,
    }
  }

  // Не бросаем createError — иначе useFetch/Suspense падает вместо 404-страницы.
  setResponseStatus(event, 404)
  return {
    source: 'graphql',
    updatedAt: new Date().toISOString(),
    organization: null,
  }
})
