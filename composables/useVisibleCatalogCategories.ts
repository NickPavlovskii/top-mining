import { CATALOG_FALLBACK } from '~/common/modules/catalog/fallback'
import {
  getVisibleCatalogCategories,
} from '~/common/modules/catalog/catalog-categories'
import { buildCatalogManufacturersResponse } from '~/common/modules/catalog/manufacturers-page'
import type { CatalogResponse } from '~/types/catalog'
import type { CatalogManufacturersResponse } from '~/types/catalog-manufacturers'

export function useVisibleCatalogCategories() {
  const { data: catalogData } = useFetch<CatalogResponse>('/api/catalog', {
    default: () => ({
      ...CATALOG_FALLBACK,
      updatedAt: new Date().toISOString(),
    }),
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
