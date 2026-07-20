import type { CatalogCategoryTab } from './types'
import {
  getCatalogCategoryTabLabel,
  type CatalogCategoryDefinition,
} from './catalog-categories'
import { getCatalogCategoryHref } from './nav-links'

export function getCatalogCategoryTabs(
  activeId: string,
  categories: CatalogCategoryDefinition[],
): CatalogCategoryTab[] {
  return categories.map((tab) => ({
    id: tab.id,
    label: getCatalogCategoryTabLabel(tab),
    href: getCatalogCategoryHref(tab.id),
    active: tab.id === activeId,
  }))
}
