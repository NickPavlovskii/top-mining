import type { CatalogCategory, CatalogOrganization } from './types'
import type { CatalogManufacturersSort } from './types'
import { findCatalogCategoryLabel } from './catalog-categories'

export const CATALOG_ORGANIZATIONS_PAGE_META = {
  title: 'Каталог организаций',
  subtitle:
    'Помогаем найти подходящую вам компанию и проанализировать конкурентов',
}

export interface CatalogOrganizationListItem extends CatalogOrganization {
  categorySlug: string
  categoryName: string
  slug?: string
}

export function flattenCatalogOrganizations(
  categories: CatalogCategory[],
): CatalogOrganizationListItem[] {
  return categories.flatMap((category) =>
    category.organizations.map((organization) => ({
      ...organization,
      categorySlug: category.slug,
      categoryName: category.name,
    })),
  )
}

export function findCatalogCategoryName(
  categories: CatalogCategory[],
  categorySlug: string | null,
  variant: 'menu' | 'tab' = 'tab',
): string | null {
  return findCatalogCategoryLabel(categorySlug, categories, variant)
}

export function compareCatalogOrganizations(
  left: CatalogOrganizationListItem,
  right: CatalogOrganizationListItem,
  sort: CatalogManufacturersSort,
): number {
  switch (sort) {
    case 'rating-desc':
      return right.rating - left.rating
        || right.reviewCount - left.reviewCount
    case 'rating-asc':
      return left.rating - right.rating
        || left.reviewCount - right.reviewCount
    case 'reviews-desc':
      return right.reviewCount - left.reviewCount
        || right.rating - left.rating
    case 'reviews-asc':
      return left.reviewCount - right.reviewCount
        || left.rating - right.rating
    case 'name-desc':
      return right.name.localeCompare(left.name, 'ru')
    case 'name-asc':
    default:
      return left.name.localeCompare(right.name, 'ru')
  }
}
