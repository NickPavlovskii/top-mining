import { createError } from 'h3'
import type { TopMiningArticlesTopicId } from '~/common/modules/top-mining/layout/articles-section'
import { TOP_MINING_ARTICLES_TOPICS } from '~/common/modules/top-mining/layout/articles-section'
import type { ArticlesFeed, ArticlesFeedResponse } from '~/common/modules/articles'
import { fillArticlesFeedFeatured } from '~/common/modules/articles'
import { ARTICLES_FEED_QUERY } from '~/server/graphql/queries'
import { fetchGraphQL } from '~/server/utils/graphql'

function normalizeTopic(raw: string): TopMiningArticlesTopicId {
  if (TOP_MINING_ARTICLES_TOPICS.some((item) => item.id === raw)) {
    return raw as TopMiningArticlesTopicId
  }

  return 'all'
}

export default defineEventHandler(async (event) => {
  const topic = normalizeTopic(String(getQuery(event).topic || 'all'))

  try {
    const data = await fetchGraphQL<{ articlesFeed: ArticlesFeed }>(
      ARTICLES_FEED_QUERY,
      { topic },
    )

    const feed = fillArticlesFeedFeatured(data.articlesFeed)

    return {
      source: 'graphql',
      updatedAt: new Date().toISOString(),
      ...feed,
    } satisfies ArticlesFeedResponse
  } catch (error) {
    throw createError({
      statusCode: 503,
      statusMessage: 'Articles service is unavailable',
      data: {
        message:
          error instanceof Error
            ? error.message
            : 'Articles service is unavailable',
      },
    })
  }
})
