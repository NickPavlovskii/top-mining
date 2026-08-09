import { defineStore } from 'pinia'
import {
  CALCULATOR_DEFAULT_USDT_RUB,
  type CalculatorCoin,
  type CalculatorDeviceKind,
  type CalculatorFiat,
  type CalculatorHashrateUnit,
  type CalculatorHardwareModel,
  type CalculatorProfitResult,
} from '~/common/modules/top-mining'
import type { ResultsCurrencyTab } from '~/components/calculator/form/CalculatorResults.types'

export const useCalculatorFormStore = defineStore('calculatorForm', () => {
  const activeKind = ref<CalculatorDeviceKind>('asic')
  const selectedModel = ref<CalculatorHardwareModel | null>(null)
  const selectedCoin = ref<CalculatorCoin | null>(null)
  const selectedAlgorithm = ref<string | null>(null)

  const price = ref(120_000)
  const priceCurrency = ref<CalculatorFiat>('₽')
  const quantity = ref(1)
  const hashrate = ref(0)
  const hashrateUnit = ref<CalculatorHashrateUnit>('Th/s')
  const power = ref(0)
  const electricityPrice = ref(5.5)
  const electricityCurrency = ref<CalculatorFiat>('₽')

  const uptime = ref(99)
  const coinUsdtRate = ref(0)
  const btcUsdtRate = ref(0)
  const dogeUsdtRate = ref(0)
  const usdtRubRate = ref(CALCULATOR_DEFAULT_USDT_RUB)
  const poolFee = ref(4)
  const blockReward = ref(0)
  const networkDifficulty = ref(0)

  const showAdvanced = ref(false)
  const manualUnlock = ref(false)
  const profitResult = ref<CalculatorProfitResult | null>(null)
  const resultsCurrency = ref<ResultsCurrencyTab>('RUB')

  return {
    activeKind,
    selectedModel,
    selectedCoin,
    selectedAlgorithm,
    price,
    priceCurrency,
    quantity,
    hashrate,
    hashrateUnit,
    power,
    electricityPrice,
    electricityCurrency,
    uptime,
    coinUsdtRate,
    btcUsdtRate,
    dogeUsdtRate,
    usdtRubRate,
    poolFee,
    blockReward,
    networkDifficulty,
    showAdvanced,
    manualUnlock,
    profitResult,
    resultsCurrency,
  }
})
