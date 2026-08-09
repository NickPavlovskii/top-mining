import { createPinia, setActivePinia } from 'pinia'
import { beforeEach, describe, expect, it } from 'vitest'

import { useCalculatorFormStore } from '~/stores/calculator-form'
import { useCatalogFiltersStore } from '~/stores/catalog-filters'
import { useRatingsFiltersStore } from '~/stores/ratings-filters'

describe('catalog and ratings Pinia filters', () => {
  beforeEach(() => {
    setActivePinia(createPinia())
  })

  it('keeps catalog search and sort when category stays the same', () => {
    const store = useCatalogFiltersStore()

    store.hydrateFromRoute({ category: 'all', search: 'gis' })
    store.setSort('rating-desc')

    store.hydrateFromRoute({ category: 'all' })

    expect(store.search).toBe('gis')
    expect(store.sort).toBe('rating-desc')
  })

  it('resets catalog search when category changes via route', () => {
    const store = useCatalogFiltersStore()
    store.hydrateFromRoute({ category: 'all', search: 'gis' })
    store.setSort('rating-desc')

    store.hydrateFromRoute({ category: 'mining-hotels' })

    expect(store.category).toBe('mining-hotels')
    expect(store.search).toBe('')
    expect(store.sort).toBe('name-asc')
  })

  it('remembers ratings category between visits', () => {
    const store = useRatingsFiltersStore()
    store.setCategory('equipment')
    expect(useRatingsFiltersStore().category).toBe('equipment')
  })

  it('keeps calculator model and result after remounting the store accessor', () => {
    const store = useCalculatorFormStore()
    store.activeKind = 'gpu'
    store.selectedModel = {
      id: 'rtx-4090',
      slug: 'rtx-4090',
      name: 'RTX 4090',
      brand: 'NVIDIA',
      algorithm: 'Ethash',
      hashrate: 120,
      hashrateUnit: 'Mh/s',
      powerW: 450,
    }
    store.price = 180_000
    store.profitResult = {
      coinsHour: 1,
      coinsDay: 24,
      coinsMonth: 732,
      coinsYear: 8760,
      incomeHourRub: 1,
      incomeDayRub: 24,
      incomeMonthRub: 732,
      incomeYearRub: 8760,
      placingMonthRub: 100,
      cleanProfitMonthRub: 42,
      paybackMonths: 12,
      incomeHourUsdt: 0.01,
      incomeDayUsdt: 0.24,
      incomeMonthUsdt: 7.32,
      incomeYearUsdt: 87.6,
      placingMonthUsdt: 1,
      cleanProfitMonthUsdt: 0.5,
    }

    const again = useCalculatorFormStore()
    expect(again.activeKind).toBe('gpu')
    expect(again.selectedModel?.slug).toBe('rtx-4090')
    expect(again.price).toBe(180_000)
    expect(again.profitResult?.cleanProfitMonthRub).toBe(42)
  })
})
