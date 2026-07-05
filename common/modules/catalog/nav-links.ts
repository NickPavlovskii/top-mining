export const MANUFACTURERS_CATEGORY_ID = 'equipment-manufacturers'
export const ALL_ORGANIZATIONS_CATEGORY_ID = 'all'

export const CATALOG_PAGE_HREF = `/asic-manufacturers/?category=${ALL_ORGANIZATIONS_CATEGORY_ID}`

export function getCatalogCategoryHref(categoryId: string): string {
  if (categoryId === MANUFACTURERS_CATEGORY_ID) {
    return '/asic-manufacturers/'
  }

  return `/asic-manufacturers/?category=${categoryId}`
}

export function getTopMiningNavItemHref(
  categoryId: string,
  columnSlug: string,
): string {
  if (columnSlug === 'catalog') {
    return getCatalogCategoryHref(categoryId)
  }

  return '#'
}

export function getTopMiningNavHeadingHref(columnSlug: string): string {
  if (columnSlug === 'catalog') {
    return CATALOG_PAGE_HREF
  }

  return '#'
}

export function getCatalogCategoryFromRoute(
  category: string | string[] | undefined,
): string {
  if (typeof category === 'string' && category.length > 0) {
    return category
  }

  return MANUFACTURERS_CATEGORY_ID
}

export function isManufacturersCatalogCategory(categoryId: string): boolean {
  return categoryId === MANUFACTURERS_CATEGORY_ID
}

export function isAllOrganizationsCatalogCategory(categoryId: string): boolean {
  return categoryId === ALL_ORGANIZATIONS_CATEGORY_ID
}
