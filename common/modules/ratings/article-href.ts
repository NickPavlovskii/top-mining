/** Преобразует URL top-mining.ru/rating/... в путь статьи на нашем сайте. */
export function toRatingArticleHref(href: string): string {
  if (href.startsWith('/')) {
    return href
  }

  try {
    const { pathname } = new URL(href)
    const slug = pathname
      .replace(/^\/rating\//, '')
      .replace(/\/$/, '')
      .split('/')
      .filter(Boolean)
      .at(-1)

    return slug ? `/articles/${slug}` : href
  } catch {
    return href
  }
}

export function isInternalHref(href: string): boolean {
  return href.startsWith('/')
}
