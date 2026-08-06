import {
  BUY_ASIC_CLIENT_PROBLEMS,
  BUY_ASIC_HOW_WE_WORK,
  BUY_ASIC_MODEL_OFFER,
  BUY_ASIC_MODELS,
  BUY_ASIC_PAGE,
  BUY_ASIC_PROMO_BANNERS,
  BUY_ASIC_SAFETY,
  BUY_ASIC_SUMMARY,
  BUY_ASIC_TIME_SAVE,
  BUY_ASIC_VALUE_BLOCKS,
} from '~/common/modules/top-mining/buy-asic'
import { BUY_ASIC_CLIENT_PROBLEMS_EN } from '~/common/modules/top-mining/buy-asic/client-problems-en'
import {
  BUY_ASIC_HOW_WE_WORK_EN,
  BUY_ASIC_SAFETY_EN,
  BUY_ASIC_TIME_SAVE_EN,
  BUY_ASIC_VALUE_BLOCKS_EN,
} from '~/common/modules/top-mining/buy-asic/value-blocks-en'
import {
  BUY_ASIC_MODEL_OFFER_EN,
  BUY_ASIC_MODELS_EN,
  BUY_ASIC_PAGE_EN,
} from '~/common/modules/top-mining/buy-asic/page-en'
import { BUY_ASIC_SUMMARY_EN } from '~/common/modules/top-mining/buy-asic/summary-en'
import { BUY_ASIC_PROMO_BANNERS_EN } from '~/common/modules/top-mining/buy-asic/promo-banners-en'

/**
 * Localized content for the ASIC purchase landing page.
 */
export function useBuyAsicPage() {
  const { locale } = useTopMiningLocale()
  const isEnglish = computed(() => locale.value === 'en')

  const page = computed(() =>
    isEnglish.value ? (BUY_ASIC_PAGE_EN as unknown as typeof BUY_ASIC_PAGE) : BUY_ASIC_PAGE,
  )
  const models = computed(() =>
    isEnglish.value ? (BUY_ASIC_MODELS_EN as unknown as typeof BUY_ASIC_MODELS) : BUY_ASIC_MODELS,
  )
  const clientProblems = computed(() =>
    isEnglish.value
      ? (BUY_ASIC_CLIENT_PROBLEMS_EN as unknown as typeof BUY_ASIC_CLIENT_PROBLEMS)
      : BUY_ASIC_CLIENT_PROBLEMS,
  )
  const howWeWork = computed(() =>
    isEnglish.value ? (BUY_ASIC_HOW_WE_WORK_EN as unknown as typeof BUY_ASIC_HOW_WE_WORK) : BUY_ASIC_HOW_WE_WORK,
  )
  const safety = computed(() =>
    isEnglish.value ? (BUY_ASIC_SAFETY_EN as unknown as typeof BUY_ASIC_SAFETY) : BUY_ASIC_SAFETY,
  )
  const timeSave = computed(() =>
    isEnglish.value ? (BUY_ASIC_TIME_SAVE_EN as unknown as typeof BUY_ASIC_TIME_SAVE) : BUY_ASIC_TIME_SAVE,
  )
  const valueBlocks = computed(() =>
    isEnglish.value ? (BUY_ASIC_VALUE_BLOCKS_EN as unknown as typeof BUY_ASIC_VALUE_BLOCKS) : BUY_ASIC_VALUE_BLOCKS,
  )
  const summary = computed(() =>
    isEnglish.value ? (BUY_ASIC_SUMMARY_EN as unknown as typeof BUY_ASIC_SUMMARY) : BUY_ASIC_SUMMARY,
  )
  const promoBanners = computed(() =>
    isEnglish.value ? (BUY_ASIC_PROMO_BANNERS_EN as unknown as typeof BUY_ASIC_PROMO_BANNERS) : BUY_ASIC_PROMO_BANNERS,
  )
  const modelOffer = computed(() =>
    isEnglish.value ? (BUY_ASIC_MODEL_OFFER_EN as unknown as typeof BUY_ASIC_MODEL_OFFER) : BUY_ASIC_MODEL_OFFER,
  )

  return {
    page,
    models,
    clientProblems,
    howWeWork,
    safety,
    timeSave,
    valueBlocks,
    summary,
    promoBanners,
    modelOffer,
  }
}
