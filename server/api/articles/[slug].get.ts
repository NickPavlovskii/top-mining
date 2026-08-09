import { createError } from 'h3'
import type { Article, ArticleResponse } from '~/common/modules/articles'
import { ARTICLE_QUERY } from '~/server/graphql/queries'
import { fetchGraphQL } from '~/server/utils/graphql'
import { resolveRequestLocale } from '~/server/utils/locale'

export default defineEventHandler(async (event) => {
  const slug = String(getRouterParam(event, 'slug') || '')
  const locale = resolveRequestLocale(event)

  if (!slug) {
    throw createError({ statusCode: 400, statusMessage: 'Article slug is required' })
  }

  try {
    const data = await fetchGraphQL<{ article: Article | null }>(ARTICLE_QUERY, {
      slug,
      locale,
    })

    if (!data.article) {
      throw createError({ statusCode: 404, statusMessage: 'Article not found' })
    }

    return {
      source: 'graphql',
      updatedAt: new Date().toISOString(),
      ...data.article,
    } satisfies ArticleResponse
  } catch (error) {
    if (error && typeof error === 'object' && 'statusCode' in error) {
      throw error
    }

    throw createError({
      statusCode: 503,
      statusMessage: 'Articles service is unavailable',
      data: {
        message: error instanceof Error ? error.message : 'Articles service is unavailable',
      },
    })
  }
})
