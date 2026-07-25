import { createError } from 'h3'
import {
  getArticleFallback,
  getArticleFallbackFromRatings,
} from '~/common/modules/articles'
import type { Article, ArticleResponse } from '~/common/modules/articles'
import { ARTICLE_QUERY } from '~/server/graphql/queries'
import { fetchGraphQL } from '~/server/utils/graphql'

function resolveFallbackArticle(slug: string): Article | null {
  return getArticleFallback(slug) ?? getArticleFallbackFromRatings(slug)
}

export default defineEventHandler(async (event) => {
  const slug = String(getRouterParam(event, 'slug') || '')

  try {
    const data = await fetchGraphQL<{ article: Article | null }>(ARTICLE_QUERY, {
      slug,
    })

    if (data.article) {
      return {
        source: 'graphql',
        updatedAt: new Date().toISOString(),
        ...data.article,
      } satisfies ArticleResponse
    }
  } catch {
    // GraphQL недоступен — ниже возьмём fallback.
  }

  const fallback = resolveFallbackArticle(slug)

  if (!fallback) {
    throw createError({ statusCode: 404, statusMessage: 'Article not found' })
  }

  return {
    source: 'fallback',
    updatedAt: new Date().toISOString(),
    ...fallback,
  } satisfies ArticleResponse
})
