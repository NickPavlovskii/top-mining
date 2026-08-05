/**
 * Пакет ratings — рейтинги.
 * Нормализация ссылок из рейтинга в статьи.
 */

function articleSlugFromPathname(pathname: string): string | null {
  const cleaned = pathname.replace(/\/$/, '')
  const parts = cleaned.split('/').filter(Boolean)
  const root = parts[0]
  const slug = parts.at(-1)

  if (!slug) {
    return null
  }

  if (root === 'articles' || root === 'rating') {
    return slug
  }

  return null
}
export function toRatingArticleHref(href: string): string {
  if (href.startsWith('/articles/')) {
    return href.replace(/\/$/, '')
  }

  if (href.startsWith('/rating/')) {
    const slug = articleSlugFromPathname(href)
    return slug ? `/articles/${slug}` : href
  }

  if (href.startsWith('/')) {
    return href
  }

  try {
    const { pathname } = new URL(href)
    const slug = articleSlugFromPathname(pathname)

    return slug ? `/articles/${slug}` : href
  } catch {
    return href
  }
}

export function isInternalHref(href: string): boolean {
  return href.startsWith('/')
}
