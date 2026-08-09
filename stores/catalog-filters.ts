import { defineStore } from 'pinia'
import {
  getCatalogCategoryFromRoute,
  MANUFACTURERS_CATEGORY_ID,
} from '~/common/modules/catalog/nav/links'
import type { CatalogManufacturersSort } from '~/common/modules/catalog'

export const useCatalogFiltersStore = defineStore('catalogFilters', () => {
  const category = ref(MANUFACTURERS_CATEGORY_ID)
  const search = ref('')
  const sort = ref<CatalogManufacturersSort>('name-asc')

  function setCategory(next: string) {
    if (category.value === next) {
      return
    }

    category.value = next
    search.value = ''
    sort.value = 'name-asc'
  }

  function setSearch(next: string) {
    search.value = next
  }

  function setSort(next: CatalogManufacturersSort) {
    sort.value = next
  }

  function hydrateFromRoute(query: Record<string, unknown>) {
    const routeCategory = getCatalogCategoryFromRoute(
      typeof query.category === 'string' ? query.category : undefined,
    )
    const routeSearch = typeof query.search === 'string' ? query.search : ''

    if (routeCategory !== category.value) {
      category.value = routeCategory
      if (!routeSearch) {
        search.value = ''
        sort.value = 'name-asc'
      }
    }

    if (routeSearch) {
      search.value = routeSearch
    }
  }

  function resetFilters() {
    search.value = ''
    sort.value = 'name-asc'
  }

  return {
    category,
    search,
    sort,
    setCategory,
    setSearch,
    setSort,
    hydrateFromRoute,
    resetFilters,
  }
})
