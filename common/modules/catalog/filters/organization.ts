import type { CatalogFilterOption } from './types'
import {
  CATALOG_CATEGORY_DEFINITIONS,
  getCatalogCategoryTabLabel,
} from './catalog-categories'
import { MANUFACTURERS_CATEGORY_ID } from './nav-links'
import { getManufacturerMarketAge } from './manufacturers-page'

export const CATALOG_ORGANIZATION_MARKET_AGE_FILTERS: CatalogFilterOption[] = [
  { id: 'over-3y', label: 'Больше 3 лет' },
  { id: 'under-1y', label: 'До 1 года' },
  { id: '1-to-3y', label: 'От 1 до 3 лет' },
]

export const CATALOG_ORGANIZATION_MIN_ASIC_FILTERS: CatalogFilterOption[] = [
  { id: 'from-1', label: 'От 1' },
  { id: 'from-10', label: 'От 10' },
  { id: 'from-5', label: 'От 5' },
]

const SERVICE_FILTER_LABELS: Record<string, string> = {
  'asic-sales': 'Продажа ASIC майнеров',
}

export function getCatalogOrganizationServiceFilters(): CatalogFilterOption[] {
  return CATALOG_CATEGORY_DEFINITIONS
    .filter((category) => category.id !== MANUFACTURERS_CATEGORY_ID)
    .map((category) => ({
      id: category.id,
      label: SERVICE_FILTER_LABELS[category.id]
        ?? getCatalogCategoryTabLabel(category),
    }))
}

export function getOrganizationMarketAge(
  foundedYear: number | null | undefined,
  currentYear = new Date().getFullYear(),
) {
  if (foundedYear == null) {
    return null
  }

  return getManufacturerMarketAge(foundedYear, currentYear)
}

export function getMinAsicFilterThreshold(filterId: string): number | null {
  const match = filterId.match(/^from-(\d+)$/)

  if (!match) {
    return null
  }

  return Number(match[1])
}

export function matchesMinAsicFilter(
  minAsicPlacement: number | null | undefined,
  activeFilterIds: string[],
): boolean {
  if (!activeFilterIds.length) {
    return true
  }

  if (minAsicPlacement == null) {
    return true
  }

  const thresholds = activeFilterIds
    .map(getMinAsicFilterThreshold)
    .filter((value): value is number => value != null)

  if (!thresholds.length) {
    return true
  }

  return thresholds.some((threshold) => minAsicPlacement <= threshold)
}
