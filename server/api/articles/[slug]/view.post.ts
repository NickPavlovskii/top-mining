import { createError, isError } from 'h3'
import { INCREMENT_ARTICLE_VIEW_MUTATION } from '~/server/graphql/queries'
import { fetchGraphQL } from '~/server/utils/graphql'

export default defineEventHandler(async (event) => {
  const slug = String(getRouterParam(event, 'slug') || '').trim()

  if (!slug) {
    throw createError({
      statusCode: 400,
      statusMessage: 'Article slug is required',
    })
  }

  try {
    const data = await fetchGraphQL<{
      incrementArticleView: { viewCount: number } | null
    }>(INCREMENT_ARTICLE_VIEW_MUTATION, { slug })

    if (!data.incrementArticleView) {
      throw createError({
        statusCode: 404,
        statusMessage: 'Article not found',
      })
    }

    return {
      source: 'graphql' as const,
      viewCount: data.incrementArticleView.viewCount,
    }
  } catch (error) {
    if (isError(error)) {
      throw error
    }

    const message =
      error instanceof Error ? error.message : 'Article view service is unavailable'

    if (message.includes('no rows in result set')) {
      throw createError({
        statusCode: 404,
        statusMessage: 'Article not found',
      })
    }

    throw createError({
      statusCode: 503,
      statusMessage: message,
    })
  }
})
