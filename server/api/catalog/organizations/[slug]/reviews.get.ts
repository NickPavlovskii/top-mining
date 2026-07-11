import { createError, getQuery } from 'h3'
import type {
  OrganizationReview,
  OrganizationReviewsResponse,
  OrganizationReviewSort,
  OrganizationReviewStats,
} from '~/types/organization-reviews'
import { ORGANIZATION_REVIEWS_QUERY } from '~/server/graphql/queries'
import { fetchGraphQL } from '~/server/utils/graphql'

const SORT_VALUES: OrganizationReviewSort[] = [
  'newest',
  'oldest',
  'rating-desc',
  'rating-asc',
]

const EMPTY_STATS: OrganizationReviewStats = {
  rating: 0,
  reviewCount: 0,
  hasPublicRating: false,
}

function parseSort(value: unknown): OrganizationReviewSort {
  if (typeof value === 'string' && SORT_VALUES.includes(value as OrganizationReviewSort)) {
    return value as OrganizationReviewSort
  }

  return 'newest'
}

function emptyReviewsResponse(): OrganizationReviewsResponse {
  return {
    source: 'fallback',
    updatedAt: new Date().toISOString(),
    reviews: [],
    stats: { ...EMPTY_STATS },
  }
}

export default defineEventHandler(async (event) => {
  const slug = String(getRouterParam(event, 'slug') || '')
  const query = getQuery(event)
  const sort = parseSort(query.sort)

  if (!slug) {
    throw createError({
      statusCode: 400,
      statusMessage: 'Organization slug is required',
    })
  }

  try {
    const data = await fetchGraphQL<{
      organizationReviews: {
        reviews: OrganizationReview[]
        stats: OrganizationReviewStats
      } | null
    }>(ORGANIZATION_REVIEWS_QUERY, { slug, sort })

    if (data.organizationReviews) {
      return {
        source: 'graphql',
        updatedAt: new Date().toISOString(),
        reviews: data.organizationReviews.reviews,
        stats: data.organizationReviews.stats,
      } satisfies OrganizationReviewsResponse
    }
  } catch {
    // GraphQL недоступен или организация не в БД — отдаём пустой список.
  }

  return emptyReviewsResponse()
})
