import { buildArticlesFeedFallback } from '~/common/modules/articles'
import type { TopMiningArticlesTopicId } from '~/common/modules/top-mining/articles-section'
import { TOP_MINING_ARTICLES_TOPICS } from '~/common/modules/top-mining/articles-section'
import type { ArticlesFeedResponse } from '~/types/articles'

function normalizeTopic(raw: string): TopMiningArticlesTopicId {
  if (TOP_MINING_ARTICLES_TOPICS.some((item) => item.id === raw)) {
    return raw as TopMiningArticlesTopicId
  }

  return 'all'
}

export default defineEventHandler(async (event) => {
  const config = useRuntimeConfig()
  const topic = normalizeTopic(String(getQuery(event).topic || 'all'))
  const baseUrl = config.articlesApiUrl || 'http://localhost:8080'

  try {
    const feed = await $fetch<Omit<ArticlesFeedResponse, 'source' | 'updatedAt'>>(
      `${baseUrl}/api/articles`,
      { query: { topic } },
    )

    return {
      source: 'api',
      updatedAt: new Date().toISOString(),
      ...feed,
    } satisfies ArticlesFeedResponse
  } catch {
    return buildArticlesFeedFallback(topic)
  }
})
