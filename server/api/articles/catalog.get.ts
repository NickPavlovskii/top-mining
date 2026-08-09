import { createError } from 'h3'
import type { TopMiningArticlesTopicId } from '~/common/modules/top-mining/layout/articles-section'
import { TOP_MINING_ARTICLES_TOPICS } from '~/common/modules/top-mining/layout/articles-section'
import type { ArticlePreview } from '~/common/modules/articles'
import { ARTICLES_CATALOG_QUERY } from '~/server/graphql/queries'
import { fetchGraphQL } from '~/server/utils/graphql'

function normalizeTopic(raw: string): TopMiningArticlesTopicId {
  if (TOP_MINING_ARTICLES_TOPICS.some((item) => item.id === raw)) {
    return raw as TopMiningArticlesTopicId
  }

  return 'all'
}

export interface ArticlesCatalogResponse {
  source: 'graphql'
  updatedAt: string
  topic: TopMiningArticlesTopicId
  items: ArticlePreview[]
}

export default defineEventHandler(async (event) => {
  const topic = normalizeTopic(String(getQuery(event).topic || 'all'))

  try {
    const data = await fetchGraphQL<{ articlesCatalog: ArticlePreview[] }>(
      ARTICLES_CATALOG_QUERY,
      { topic },
    )

    return {
      source: 'graphql',
      updatedAt: new Date().toISOString(),
      topic,
      items: data.articlesCatalog ?? [],
    } satisfies ArticlesCatalogResponse
  }
  catch (error) {
    throw createError({
      statusCode: 503,
      statusMessage: 'Articles service is unavailable',
      data: {
        message: error instanceof Error ? error.message : 'Articles service is unavailable',
      },
    })
  }
})
