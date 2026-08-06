import { INCREASE_INCOME_PAGE } from '~/common/modules/top-mining/pages/increase-income'
import { INCREASE_INCOME_PAGE_EN } from '~/common/modules/top-mining/pages/increase-income-en'

/**
 * Localized content for the Increase Your Income landing.
 */
export function useIncreaseIncomePage() {
  const { locale } = useTopMiningLocale()

  return computed(() =>
    locale.value === 'en'
      ? (INCREASE_INCOME_PAGE_EN as unknown as typeof INCREASE_INCOME_PAGE)
      : INCREASE_INCOME_PAGE,
  )
}
