import { createError, isError, readBody } from 'h3'
import type {
  CreateOrganizationReviewBody,
  CreateOrganizationReviewResponse,
} from '~/types/organization-reviews'
import { CREATE_ORGANIZATION_REVIEW_MUTATION } from '~/server/graphql/queries'
import { fetchGraphQL } from '~/server/utils/graphql'

export default defineEventHandler(async (event) => {
  const slug = String(getRouterParam(event, 'slug') || '')
  const body = await readBody<CreateOrganizationReviewBody>(event)

  if (!slug) {
    throw createError({
      statusCode: 400,
      statusMessage: 'Organization slug is required',
    })
  }

  const authorName = String(body?.authorName || '').trim()
  const authorPhone = String(body?.authorPhone || '').trim()
  const content = String(body?.content || '').trim()
  const rating = Number(body?.rating)
  const authorEmail = String(body?.authorEmail || '').trim()

  if (!authorName || !authorPhone || !content) {
    throw createError({
      statusCode: 400,
      statusMessage: 'authorName, authorPhone and content are required',
    })
  }

  if (!Number.isInteger(rating) || rating < 1 || rating > 5) {
    throw createError({
      statusCode: 400,
      statusMessage: 'rating must be an integer between 1 and 5',
    })
  }

  try {
    const data = await fetchGraphQL<{
      createOrganizationReview: {
        review: CreateOrganizationReviewResponse['review']
        stats: CreateOrganizationReviewResponse['stats']
      }
    }>(CREATE_ORGANIZATION_REVIEW_MUTATION, {
      organizationSlug: slug,
      authorName,
      authorEmail: authorEmail || null,
      authorPhone,
      rating,
      content,
    })

    return {
      source: 'graphql',
      review: data.createOrganizationReview.review,
      stats: data.createOrganizationReview.stats,
    } satisfies CreateOrganizationReviewResponse
  } catch (error) {
    if (isError(error)) {
      throw error
    }

    const message = error instanceof Error ? error.message : 'Review service is unavailable'

    if (message.includes('no rows in result set')) {
      throw createError({
        statusCode: 404,
        statusMessage: 'Organization not found in database',
      })
    }

    throw createError({
      statusCode: 503,
      statusMessage: message,
    })
  }
})
