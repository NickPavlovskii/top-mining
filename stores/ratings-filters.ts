import { defineStore } from 'pinia'

export const useRatingsFiltersStore = defineStore('ratingsFilters', () => {
  const category = ref<string | null>(null)

  function setCategory(next: string | null) {
    category.value = next
  }

  return {
    category,
    setCategory,
  }
})
