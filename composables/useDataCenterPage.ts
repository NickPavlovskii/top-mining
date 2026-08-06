import type { DataCenterConstructionPage } from '~/common/modules/top-mining/pages/data-center-construction'
import { DATA_CENTER_CONSTRUCTION_PAGE } from '~/common/modules/top-mining/pages/data-center-construction'
import { DATA_CENTER_CONSTRUCTION_PAGE_EN } from '~/common/modules/top-mining/pages/data-center-construction-en'

/**
 * Локализованный контент лендинга строительства дата-центров.
 */
export function useDataCenterPage() {
  const { locale } = useTopMiningLocale()

  const page = computed(() =>
    locale.value === 'en'
      ? (DATA_CENTER_CONSTRUCTION_PAGE_EN as unknown as DataCenterConstructionPage)
      : DATA_CENTER_CONSTRUCTION_PAGE,
  )

  return page
}
