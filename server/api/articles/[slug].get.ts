import { getArticleFallback } from '~/common/modules/articles'
import type { ArticleResponse } from '~/types/articles'

export default defineEventHandler(async (event) => {
  const config = useRuntimeConfig()
  const slug = String(getRouterParam(event, 'slug') || '')
  const baseUrl = config.articlesApiUrl || 'http://localhost:8080'

  try {
    const article = await $fetch<Omit<ArticleResponse, 'source' | 'updatedAt'>>(
      `${baseUrl}/api/articles/${encodeURIComponent(slug)}`,
    )

    return {
      source: 'api',
      updatedAt: new Date().toISOString(),
      ...article,
    } satisfies ArticleResponse
  } catch {
    const fallback = getArticleFallback(slug)

    if (!fallback) {
      throw createError({ statusCode: 404, statusMessage: 'Article not found' })
    }

    return {
      source: 'fallback',
      updatedAt: new Date().toISOString(),
      ...fallback,
    } satisfies ArticleResponse
  }
})
