import type { CatalogCategory } from './types'

import { MANUFACTURERS_CATEGORY_ID } from './nav-links'

export interface CatalogCategoryDefinition {
  id: string
  label: string
  tabLabel?: string
}

export const CATALOG_CATEGORY_DEFINITIONS: CatalogCategoryDefinition[] = [
  {
    id: 'asic-sales',
    label: 'Продажа оборудования',
    tabLabel: 'Продажа ASIC'
  },
  { 
    id: 'mining-hotels',
    label: 'Майнинг-отели'
  },
  { 
    id: 'asic-repair', 
    label: 'Сервисные центры', 
    tabLabel: 'Ремонт ASIC' 
  },
  { 
    id: 'mining-pools', 
    label: 'Майнинг-пулы' 
  },
  { 
    id: 'crypto-exchanges', 
    label: 'Криптобиржи' 
  },
  { 
    id: 'crypto-wallets', 
    label: 'Криптокошельки' 
  },
  {
    id: MANUFACTURERS_CATEGORY_ID,
    label: 'Производители асиков',
    tabLabel: 'Производители ASIC',
  },
  { 
    id: 'asic-firmware', 
    label: 'Прошивки для асиков' 
  },
  { 
    id: 'events', 
    label: 'Мероприятия' 
  },
]

export function getCatalogCategoryTabLabel(
  definition: CatalogCategoryDefinition,
): string {
  return definition.tabLabel ?? definition.label
}

export function getCatalogCategoryCount(
  categoryId: string,
  categories: CatalogCategory[],
  manufacturersCount: number,
): number {
  if (categoryId === MANUFACTURERS_CATEGORY_ID) {
    return manufacturersCount
  }

  return categories.find((category) => category.slug === categoryId)
    ?.organizations.length ?? 0
}

export function getVisibleCatalogCategories(
  categories: CatalogCategory[],
  manufacturersCount: number,
): CatalogCategoryDefinition[] {
  return CATALOG_CATEGORY_DEFINITIONS.filter((definition) =>
    getCatalogCategoryCount(definition.id, categories, manufacturersCount) > 0,
  )
}

export function findCatalogCategoryLabel(
  categoryId: string | null,
  categories: CatalogCategory[] = [],
  variant: 'menu' | 'tab' = 'menu',
): string | null {
  if (!categoryId) {
    return null
  }

  const definition = CATALOG_CATEGORY_DEFINITIONS.find(
    (item) => item.id === categoryId,
  )

  if (definition) {
    return variant === 'tab'
      ? getCatalogCategoryTabLabel(definition)
      : definition.label
  }

  return categories.find((category) => category.slug === categoryId)?.name
    ?? null
}
