import type { ArticlePreview, ArticlesFeed } from './types'

export const ARTICLES_FEED_FEATURED_COUNT = 4

export function fillArticlesFeedFeatured(
  feed: ArticlesFeed,
  featuredCount = ARTICLES_FEED_FEATURED_COUNT,
): ArticlesFeed {
  const featured: ArticlePreview[] = [...(feed.featured ?? [])]
  const list: ArticlePreview[] = [...(feed.list ?? [])]

  while (featured.length < featuredCount && list.length > 0) {
    featured.push(list.shift()!)
  }

  return {
    ...feed,
    featured,
    list,
  }
}
