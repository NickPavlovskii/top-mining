import { emptyCatalogResponse } from './empty-catalog'
import { getVisibleCatalogCategories } from './catalog-categories'
import { buildCatalogManufacturersResponse } from './manufacturers-page'
import type { CatalogManufacturersResponse, CatalogResponse } from './types'

export function useVisibleCatalogCategories() {
  const { data: catalogData } = useFetch<CatalogResponse>('/api/catalog', {
    default: () => emptyCatalogResponse(),
  })

  const { data: manufacturersData } = useFetch<CatalogManufacturersResponse>(
    '/api/catalog/manufacturers',
    {
      default: () => buildCatalogManufacturersResponse(),
    },
  )

  const visibleCategories = computed(() =>
    getVisibleCatalogCategories(
      catalogData.value?.categories ?? [],
      manufacturersData.value?.manufacturers.length ?? 0,
    ),
  )

  return {
    visibleCategories,
  }
}
