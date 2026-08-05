/**
 * Пакет articles — статьи.
 * Сборка статей из карточек рейтингов.
 */
import { RATINGS_FALLBACK_CARDS } from '~/common/modules/ratings/fallback'
import { toRatingArticleHref } from '~/common/modules/ratings/article-href'
import type { Article } from './types'

export const ARTICLE_CONTENT_NOT_READY =
  'Информация о статье ещё не добавлена'

export function isArticleContentPending(
  content: string | null | undefined,
): boolean {
  const trimmed = content?.trim() ?? ''
  return !trimmed || trimmed === ARTICLE_CONTENT_NOT_READY
}

function hashSeed(input: string): number {
  let hash = 0
  for (let i = 0; i < input.length; i += 1) {
    hash = (hash * 31 + input.charCodeAt(i)) >>> 0
  }
  return hash
}

function slugFromArticleHref(href: string): string | null {
  const path = toRatingArticleHref(href)
  if (!path.startsWith('/articles/')) {
    return null
  }
  const slug = path.slice('/articles/'.length).replace(/\/+$/, '')
  return slug || null
}

const RATING_ARTICLE_BY_SLUG = new Map<string, Article>()

for (const card of RATINGS_FALLBACK_CARDS) {
  for (const item of card.items) {
    const slug = slugFromArticleHref(item.href)
    if (!slug || RATING_ARTICLE_BY_SLUG.has(slug)) {
      continue
    }

    const seed = hashSeed(slug)

    RATING_ARTICLE_BY_SLUG.set(slug, {
      id: 10_000 + (seed % 90_000),
      slug,
      title: item.label.replace(/&#\d+;/g, '').trim(),
      excerpt: '',
      imageUrl: '',
      imageAlt: '',
      topicId: 'mining',
      readingTimeMin: 10 + (seed % 12),
      publishedAt: `2024-${String(1 + (seed % 12)).padStart(2, '0')}-${String(1 + (seed % 28)).padStart(2, '0')}`,
      displayType: 'list',
      viewCount: 500 + (seed % 4000),
      content: ARTICLE_CONTENT_NOT_READY,
    })
  }
}

export function isRatingArticleSlug(slug: string): boolean {
  return RATING_ARTICLE_BY_SLUG.has(slug)
}

export function getArticleFallbackFromRatings(slug: string): Article | null {
  return RATING_ARTICLE_BY_SLUG.get(slug) ?? null
}
