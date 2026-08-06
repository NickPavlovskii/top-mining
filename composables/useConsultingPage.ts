import {
  CONSULTING_BEST_SPEAKER,
  CONSULTING_BLACK_RING,
  CONSULTING_CONSTRUCTION_FORMS,
  CONSULTING_ENTER_MINING,
  CONSULTING_MANAGEMENT,
  CONSULTING_PAGE,
  CONSULTING_SOPROVOD,
  CONSULTING_WHY_US,
} from '~/common/modules/top-mining/consulting'
import {
  CONSULTING_BEST_SPEAKER_EN,
  CONSULTING_BLACK_RING_EN,
  CONSULTING_CONSTRUCTION_FORMS_EN,
  CONSULTING_ENTER_MINING_EN,
  CONSULTING_MANAGEMENT_EN,
  CONSULTING_PAGE_EN,
  CONSULTING_SOPROVOD_EN,
  CONSULTING_WHY_US_EN,
  TOP_MINING_CONSULTING_DROPDOWN_ITEMS_EN,
} from '~/common/modules/top-mining/consulting/consulting-en'
import { TOP_MINING_CONSULTING_DROPDOWN_ITEMS } from '~/common/modules/top-mining/consulting/dropdown'

/**
 * Localized copies of every content export used by the Consulting landing.
 */
export function useConsultingPage() {
  const { locale } = useTopMiningLocale()
  const isEnglish = computed(() => locale.value === 'en')

  return {
    page: computed(() =>
      isEnglish.value ? (CONSULTING_PAGE_EN as unknown as typeof CONSULTING_PAGE) : CONSULTING_PAGE,
    ),
    enterMining: computed(() =>
      isEnglish.value
        ? (CONSULTING_ENTER_MINING_EN as unknown as typeof CONSULTING_ENTER_MINING)
        : CONSULTING_ENTER_MINING,
    ),
    soprovod: computed(() =>
      isEnglish.value
        ? (CONSULTING_SOPROVOD_EN as unknown as typeof CONSULTING_SOPROVOD)
        : CONSULTING_SOPROVOD,
    ),
    management: computed(() =>
      isEnglish.value
        ? (CONSULTING_MANAGEMENT_EN as unknown as typeof CONSULTING_MANAGEMENT)
        : CONSULTING_MANAGEMENT,
    ),
    constructionForms: computed(() =>
      isEnglish.value
        ? (CONSULTING_CONSTRUCTION_FORMS_EN as unknown as typeof CONSULTING_CONSTRUCTION_FORMS)
        : CONSULTING_CONSTRUCTION_FORMS,
    ),
    bestSpeaker: computed(() =>
      isEnglish.value
        ? (CONSULTING_BEST_SPEAKER_EN as unknown as typeof CONSULTING_BEST_SPEAKER)
        : CONSULTING_BEST_SPEAKER,
    ),
    whyUs: computed(() =>
      isEnglish.value ? (CONSULTING_WHY_US_EN as unknown as typeof CONSULTING_WHY_US) : CONSULTING_WHY_US,
    ),
    blackRing: computed(() =>
      isEnglish.value
        ? (CONSULTING_BLACK_RING_EN as unknown as typeof CONSULTING_BLACK_RING)
        : CONSULTING_BLACK_RING,
    ),
    dropdownItems: computed(() =>
      isEnglish.value ? TOP_MINING_CONSULTING_DROPDOWN_ITEMS_EN : TOP_MINING_CONSULTING_DROPDOWN_ITEMS,
    ),
  }
}
