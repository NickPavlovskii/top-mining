/**
 * Пакет articles — статьи.
 * Типы preview / full article и ответа ленты.
 */
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
  viewCount?: number | null
}

export interface Article extends ArticlePreview {
  content: string
  usesBlocks?: boolean
  blocks?: ArticleDbBlock[]
  related?: ArticlePreview[]
}

export interface ArticleDbBlock {
  id?: number
  position?: number
  type: string
  payload: unknown
  anchor?: string | null
}

export interface ArticlesFeed {
  hero: ArticlePreview | null
  featured: ArticlePreview[]
  list: ArticlePreview[]
  hasMore: boolean
}

export interface ArticlesFeedResponse extends ArticlesFeed {
  source: 'graphql'
  updatedAt: string
}

export interface ArticlesCatalogResponse {
  source: 'graphql'
  updatedAt: string
  topic: TopMiningArticlesTopicId
  items: ArticlePreview[]
}

export interface ArticleResponse extends Article {
  source: 'graphql'
  updatedAt: string
}
