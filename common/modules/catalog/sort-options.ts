import type { CatalogManufacturersSort } from './types'

export type CatalogSortOption = {
  value: CatalogManufacturersSort
  label: string
  icon?: string
}

export const CATALOG_MANUFACTURERS_SORT_OPTIONS: CatalogSortOption[] = [
  { value: 'rating-desc', label: 'Высокий рейтинг' },
  { value: 'rating-asc', label: 'Низкий рейтинг' },
  {
    value: 'reviews-desc',
    label: 'По кол-ву отзывов',
    icon: 'mdi:arrow-down',
  },
  {
    value: 'reviews-asc',
    label: 'По кол-ву отзывов',
    icon: 'mdi:arrow-up',
  },
  { value: 'name-asc', label: 'По названию (A-Z)' },
  { value: 'name-desc', label: 'По названию (Z-A)' },
]
