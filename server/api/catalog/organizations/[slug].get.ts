import { createError, isError } from 'h3'
import { getOrganizationDetailFallback } from '~/common/modules/catalog/organization-detail'
import type {
  CatalogOrganizationDetail,
  CatalogOrganizationDetailResponse,
} from '~/types/catalog-organization-detail'
import { ORGANIZATION_QUERY } from '~/server/graphql/queries'
import { fetchGraphQL } from '~/server/utils/graphql'

function mergeOrganization(
  organization: CatalogOrganizationDetail,
  fallback: CatalogOrganizationDetail | null,
): CatalogOrganizationDetail {
  return {
    ...organization,
    articleHref: organization.articleHref ?? fallback?.articleHref ?? null,
    gallery:
      organization.gallery?.length
        ? organization.gallery
        : fallback?.gallery ?? [],
    showGallery:
      fallback?.showGallery ?? organization.showGallery ?? true,
    showArticleBlock:
      fallback?.showArticleBlock ?? organization.showArticleBlock ?? true,
    detailLogoUrl:
      fallback?.detailLogoUrl ?? organization.detailLogoUrl ?? null,
    phone: fallback?.phone ?? organization.phone ?? '',
  }
}

export default defineEventHandler(async (event) => {
  const slug = String(getRouterParam(event, 'slug') || '')
  const fallback = getOrganizationDetailFallback(slug)

  if (!slug) {
    throw createError({
      statusCode: 400,
      statusMessage: 'Organization slug is required',
    })
  }

  try {
    const data = await fetchGraphQL<{
      organization: CatalogOrganizationDetail | null
    }>(ORGANIZATION_QUERY, { slug })

    if (data.organization) {
      return {
        source: 'graphql',
        updatedAt: new Date().toISOString(),
        organization: mergeOrganization(data.organization, fallback),
      } satisfies CatalogOrganizationDetailResponse
    }
  } catch (error) {
    if (isError(error)) {
      // GraphQL вернул явную ошибку приложения — пробрасываем дальше.
      if (error.statusCode && error.statusCode < 500) {
        throw error
      }
    }
    // Сеть / 5xx — падаем на fallback ниже.
  }

  if (fallback) {
    return {
      source: 'fallback',
      updatedAt: new Date().toISOString(),
      organization: fallback,
    } satisfies CatalogOrganizationDetailResponse
  }

  throw createError({
    statusCode: 404,
    statusMessage: 'Organization not found',
  })
})
