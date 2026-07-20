import type { TopMiningArticlesTopicId } from '~/common/modules/top-mining'

export type ArticleDisplayType = 'hero' | 'featured' | 'list'

export interface ArticlePreview {
  id: number
  slug: string
  title: string
  excerpt: string
  imageUrl: string
  imageAlt: string
  topicId: TopMiningArticlesTopicId
  readingTimeMin: number | null
  publishedAt: string
  displayType: ArticleDisplayType
}

export interface Article extends ArticlePreview {
  content: string
}

export interface ArticlesFeed {
  hero: ArticlePreview | null
  featured: ArticlePreview[]
  list: ArticlePreview[]
  hasMore: boolean
}

export interface ArticlesFeedResponse extends ArticlesFeed {
  source: 'graphql' | 'fallback'
  updatedAt: string
}

export interface ArticleResponse extends Article {
  source: 'graphql' | 'fallback'
  updatedAt: string
}
