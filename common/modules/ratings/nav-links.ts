export const RATINGS_PAGE_HREF = '/rating/'

const RATINGS_CATEGORY_SLUGS: Record<string, string> = {
  'Техника и оборудование': 'equipment',
  'Продажи и услуги': 'sales',
  'Инструменты и сервисы': 'tools',
  'Криптовалюты и токены': 'crypto',
}

export function getRatingsCategoryIdByLabel(label: string): string {
  return RATINGS_CATEGORY_SLUGS[label] ?? ''
}

export function getRatingsPageHref(categoryId?: string): string {
  if (!categoryId) {
    return RATINGS_PAGE_HREF
  }

  return `${RATINGS_PAGE_HREF}?category=${encodeURIComponent(categoryId)}`
}

export function getRatingsCategoryFromRoute(
  category: string | string[] | undefined,
): string | null {
  if (typeof category !== 'string' || !category.length) {
    return null
  }

  return category
}
