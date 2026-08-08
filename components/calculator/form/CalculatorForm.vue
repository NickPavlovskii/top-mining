<script setup lang="ts">
import {
  CALCULATOR_DEFAULT_USDT_RUB,
  CALCULATOR_DEVICE_OPTIONS,
  CALCULATOR_FIAT_OPTIONS,
  CALCULATOR_HASHRATE_UNITS,
  DEFAULT_DEVICE_PRICE_RUB,
  calculateMiningProfit,
  emptyCalculatorCoinsCatalog,
  emptyCalculatorHardwareByKind,
  filterGpuCoinsByAlgorithm,
  findHardwareModelBySlug,
  formatMoneyAmount,
  getDefaultCalculatorCoin,
  isDefaultDevicePrice,
  parseCalculatorPrefillQuery,
  type CalculatorCoin,
  type CalculatorCoinsCatalog,
  type CalculatorDeviceKind,
  type CalculatorFiat,
  type CalculatorHashrateUnit,
  type CalculatorHardwareByKind,
  type CalculatorHardwareModel,
  type CalculatorProfitCoinLeg,
  type CalculatorProfitResult,
} from '~/common/modules/top-mining'
import CalculatorAlgorithmDropdown from '~/components/calculator/form/CalculatorAlgorithmDropdown.vue'
import CalculatorAlertModal from '~/components/calculator/form/CalculatorAlertModal.vue'
import CalculatorCoinDropdown from '~/components/calculator/form/CalculatorCoinDropdown.vue'
import CalculatorDefaultPriceModal from '~/components/calculator/form/CalculatorDefaultPriceModal.vue'
import CalculatorModelDropdown from '~/components/calculator/form/CalculatorModelDropdown.vue'
import CalculatorResults from '~/components/calculator/form/CalculatorResults.vue'
import type { ResultsCurrencyTab } from '~/components/calculator/form/CalculatorResults.types'
import { useCalculatorDeviceRoute } from '~/composables/useCalculatorDeviceRoute'
import { onClickOutside } from '@vueuse/core'
import asicTab from '~/assets/images/calculator/tabs/ASIC-tab.png'
import gpuTab from '~/assets/images/calculator/tabs/GPU-tab.png'
import cpuTab from '~/assets/images/calculator/tabs/CPU-tab.png'
import asicDefault from '~/assets/images/calculator/tabs/asic-default.png'
import gpuDefault from '~/assets/images/calculator/tabs/gpu-default.png'
import cpuDefault from '~/assets/images/calculator/tabs/cpu-default.png'
import dropdownArrow from '~/assets/images/calculator/tabs/dropdown-arrow.svg'

const { t } = useT()

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
const openUnitMenu = ref<'price' | 'hashrate' | 'electricity' | null>(null)
const formParamsRef = ref<HTMLElement | null>(null)
const showDefaultPriceModal = ref(false)
const alertMessage = ref('')
const showAlertModal = ref(false)
const profitResult = ref<CalculatorProfitResult | null>(null)
const resultsCurrency = ref<ResultsCurrencyTab>('RUB')
const resultsRef = ref<HTMLElement | null>(null)

const { data: hardwareByKind, pending: hardwarePending } = useFetch<CalculatorHardwareByKind>(
  '/api/calculator/hardware',
  {
    key: 'calculator-hardware',
    default: () => emptyCalculatorHardwareByKind(),
  },
)

const { data: coinsCatalog, pending: coinsPending } = useFetch<CalculatorCoinsCatalog>(
  '/api/calculator/coins',
  {
    key: 'calculator-coins',
    default: () => emptyCalculatorCoinsCatalog(),
  },
)

const asicCoins = computed(() => coinsCatalog.value?.asic ?? [])
const gpuCoinsAll = computed(() => coinsCatalog.value?.gpu ?? [])
const gpuAlgorithms = computed(() => coinsCatalog.value?.gpuAlgorithms ?? [])

onClickOutside(formParamsRef, () => {
  openUnitMenu.value = null
})

const brands = computed(
  () => hardwareByKind.value?.[activeKind.value] ?? [],
)
const isAsic = computed(() => activeKind.value === 'asic')
const coinsLoading = computed(
  () =>
    Boolean(coinsPending.value) ||
    (isAsic.value
      ? asicCoins.value.length === 0
      : gpuAlgorithms.value.length === 0 && gpuCoinsAll.value.length === 0),
)
const isLocked = computed(() => {
  if (selectedModel.value !== null) {
    return false
  }

  if (isAsic.value) {
    return !manualUnlock.value
  }

  return true
})

const showManualUnlock = computed(() => isAsic.value && isLocked.value)

const totalCost = computed(() => price.value * quantity.value)

const gpuCoins = computed(() =>
  filterGpuCoinsByAlgorithm(gpuCoinsAll.value, selectedAlgorithm.value),
)

watch(
  coinsCatalog,
  (catalog) => {
    if (!catalog) {
      return
    }

    usdtRubRate.value = catalog.defaultUsdtRub || CALCULATOR_DEFAULT_USDT_RUB

    const doge = catalog.asic.find((c) => c.id === 'DOGE')
    if (doge) {
      dogeUsdtRate.value = doge.exchangeRateUsdt
    }

    if (activeKind.value === 'asic' && !selectedCoin.value) {
      const defaultCoin = getDefaultCalculatorCoin(catalog.asic)
      if (defaultCoin) {
        selectedCoin.value = defaultCoin
        applyCoinDefaults(defaultCoin)
        btcUsdtRate.value = defaultCoin.exchangeRateUsdt
      }
    }
  },
  { immediate: true },
)

const coinRateLabel = computed(() => {
  if (!isAsic.value) {
    return t('calculator.coinUsdtBtc')
  }

  if (selectedCoin.value?.dualCoin) {
    return t('calculator.coinUsdtLtc')
  }

  return t('calculator.coinUsdt', undefined, {
    symbol: selectedCoin.value?.symbol || 'BTC',
  })
})

const rewardUnit = computed(() => {
  if (selectedCoin.value?.dualCoin) {
    return 'LTC'
  }

  return selectedCoin.value?.symbol || 'BTC'
})

const kindUi = computed(() => ({
  asic: {
    buttonIcon: asicDefault,
    placeholder: t('calculator.asicPlaceholder'),
    priceLabel: t('calculator.asicPriceLabel'),
    defaultPriceDeviceLabel: t('calculator.asicDeviceLabel'),
    lockMessage: t('calculator.asicLock'),
  },
  gpu: {
    buttonIcon: gpuDefault,
    placeholder: t('calculator.gpuPlaceholder'),
    priceLabel: t('calculator.gpuPriceLabel'),
    defaultPriceDeviceLabel: 'GPU',
    lockMessage: t('calculator.gpuLock'),
  },
  cpu: {
    buttonIcon: cpuDefault,
    placeholder: t('calculator.cpuPlaceholder'),
    priceLabel: t('calculator.cpuPriceLabel'),
    defaultPriceDeviceLabel: 'CPU',
    lockMessage: t('calculator.cpuLock'),
  },
}))

const buttonIcon = computed(() => kindUi.value[activeKind.value].buttonIcon)

const placeholder = computed(() => kindUi.value[activeKind.value].placeholder)

const priceLabel = computed(() => kindUi.value[activeKind.value].priceLabel)

const defaultPriceDeviceLabel = computed(
  () => kindUi.value[activeKind.value].defaultPriceDeviceLabel,
)

const lockMessage = computed(() => kindUi.value[activeKind.value].lockMessage)

const defaultPriceLabel = computed(
  () => `${DEFAULT_DEVICE_PRICE_RUB.toLocaleString('ru-RU')} ₽`,
)

const resultCoinSymbol = computed(() => {
  if (selectedCoin.value?.dualCoin) {
    return 'COIN'
  }

  return selectedCoin.value?.symbol || 'BTC'
})

const quantityLabel = computed(() => {
  switch (activeKind.value) {
    case 'gpu':
      return t('calculator.qtyGpu')
    case 'cpu':
      return t('calculator.qtyCpu')
    default:
      return t('calculator.qtyAsic')
  }
})

watch(activeKind, (kind) => {
  selectedModel.value = null
  hashrate.value = 0
  power.value = 0
  selectedAlgorithm.value = null
  openUnitMenu.value = null
  manualUnlock.value = false

  if (kind === 'asic') {
    selectedCoin.value = getDefaultCalculatorCoin(asicCoins.value)
    hashrateUnit.value = 'Th/s'
    if (selectedCoin.value) {
      applyCoinDefaults(selectedCoin.value)
    }
  } else {
    selectedCoin.value = null
    hashrateUnit.value = 'Mh/s'
    blockReward.value = 0
    networkDifficulty.value = 0
    coinUsdtRate.value = 0
  }
})

watch(selectedCoin, (coin) => {
  if (coin) {
    applyCoinDefaults(coin)
  }
})

function applyCoinDefaults(coin: CalculatorCoin) {
  coinUsdtRate.value = coin.exchangeRateUsdt
  blockReward.value = coin.blockReward
  networkDifficulty.value = coin.difficulty
}

function tabIcon(kind: CalculatorDeviceKind) {
  switch (kind) {
    case 'gpu':
      return gpuTab
    case 'cpu':
      return cpuTab
    default:
      return asicTab
  }
}

function selectDevice(kind: CalculatorDeviceKind) {
  activeKind.value = kind
}

const { formRef } = useCalculatorDeviceRoute(activeKind, {
  scrollToForm: true,
  syncHash: true,
})

const route = useRoute()
const appliedPrefillQuery = ref(false)

watch(
  [hardwareByKind, hardwarePending, () => route.query],
  () => {
    if (appliedPrefillQuery.value || hardwarePending.value) {
      return
    }

    const prefill = parseCalculatorPrefillQuery(
      route.query as Record<string, unknown>,
    )
    const hasPrefill =
      Boolean(prefill.model) ||
      Boolean(prefill.hashrate) ||
      Boolean(prefill.power)

    if (!hasPrefill) {
      return
    }

    if (prefill.model) {
      const found = findHardwareModelBySlug(hardwareByKind.value, prefill.model)
      if (found) {
        const applyModel = () => {
          onModelSelect(found.model)
          appliedPrefillQuery.value = true
          nextTick(() => {
            formRef.value?.scrollIntoView({ behavior: 'smooth', block: 'start' })
          })
        }

        if (activeKind.value !== found.kind) {
          activeKind.value = found.kind
          nextTick(applyModel)
        } else {
          applyModel()
        }
        return
      }
    }

    if (prefill.kind && activeKind.value !== prefill.kind) {
      activeKind.value = prefill.kind
      nextTick(() => applyManualPrefill(prefill))
      return
    }

    applyManualPrefill(prefill)
  },
  { immediate: true },
)

function applyManualPrefill(
  prefill: ReturnType<typeof parseCalculatorPrefillQuery>,
) {
  if (prefill.hashrate || prefill.power) {
    if (isAsic.value) {
      manualUnlock.value = true
    }
    if (prefill.hashrate) {
      hashrate.value = prefill.hashrate
    }
    if (prefill.power) {
      power.value = prefill.power
    }
    if (prefill.unit) {
      hashrateUnit.value = prefill.unit
    }
    appliedPrefillQuery.value = true
    nextTick(() => {
      formRef.value?.scrollIntoView({ behavior: 'smooth', block: 'start' })
    })
    return
  }

  // Модель из query не найдена в каталоге после загрузки железа.
  if (prefill.model) {
    appliedPrefillQuery.value = true
  }
}

function onModelSelect(model: CalculatorHardwareModel) {
  selectedModel.value = model
  hashrate.value = model.hashrate
  power.value = model.powerW

  if (
    CALCULATOR_HASHRATE_UNITS.includes(
      model.hashrateUnit as CalculatorHashrateUnit,
    )
  ) {
    hashrateUnit.value = model.hashrateUnit as CalculatorHashrateUnit
  }

  if (!isAsic.value) {
    selectedAlgorithm.value = model.algorithm
    selectedCoin.value = null
  }
}

function onAlgorithmSelect(algorithm: string) {
  selectedAlgorithm.value = algorithm

  if (
    selectedCoin.value &&
    selectedCoin.value.algorithm.toLowerCase() !== algorithm.toLowerCase()
  ) {
    selectedCoin.value = null
  }
}

function onCoinSelect(coin: CalculatorCoin) {
  selectedCoin.value = coin
}

function decreaseQuantity() {
  quantity.value = Math.max(1, quantity.value - 1)
}

function increaseQuantity() {
  quantity.value += 1
}

function adjustDifficulty(deltaPercent: number) {
  networkDifficulty.value = networkDifficulty.value * (1 + deltaPercent / 100)
}

function toggleUnitMenu(menu: 'price' | 'hashrate' | 'electricity') {
  openUnitMenu.value = openUnitMenu.value === menu ? null : menu
}

function setPriceCurrency(value: CalculatorFiat) {
  priceCurrency.value = value
  openUnitMenu.value = null
}

function setHashrateUnit(value: CalculatorHashrateUnit) {
  hashrateUnit.value = value
  openUnitMenu.value = null
}

function setElectricityCurrency(value: CalculatorFiat) {
  electricityCurrency.value = value
  openUnitMenu.value = null
}

function resetForm() {
  selectedModel.value = null
  price.value = 120_000
  priceCurrency.value = '₽'
  quantity.value = 1
  power.value = 0
  electricityPrice.value = 5.5
  electricityCurrency.value = '₽'
  uptime.value = 99
  dogeUsdtRate.value =
    asicCoins.value.find((c) => c.id === 'DOGE')?.exchangeRateUsdt ?? 0
  usdtRubRate.value =
    coinsCatalog.value?.defaultUsdtRub ?? CALCULATOR_DEFAULT_USDT_RUB
  poolFee.value = 4
  btcUsdtRate.value =
    getDefaultCalculatorCoin(asicCoins.value)?.exchangeRateUsdt ?? 0
  showAdvanced.value = false
  openUnitMenu.value = null
  manualUnlock.value = false
  profitResult.value = null
  showDefaultPriceModal.value = false
  showAlertModal.value = false
  alertMessage.value = ''
  resultsCurrency.value = 'RUB'

  if (isAsic.value) {
    selectedCoin.value = getDefaultCalculatorCoin(asicCoins.value)
    selectedAlgorithm.value = null
    hashrate.value = 0
    hashrateUnit.value = 'Th/s'
    if (selectedCoin.value) {
      applyCoinDefaults(selectedCoin.value)
    }
  } else {
    selectedCoin.value = null
    selectedAlgorithm.value = null
    hashrate.value = 0
    hashrateUnit.value = 'Mh/s'
    blockReward.value = 0
    networkDifficulty.value = 0
    coinUsdtRate.value = 0
  }
}

function selectInputText(event: Event) {
  const target = event.target
  if (target instanceof HTMLInputElement) {
    target.select()
  }
}

function enableAdvanced() {
  showAdvanced.value = true
}

function toggleAdvanced() {
  showAdvanced.value = !showAdvanced.value
}

function unlockManualParams() {
  manualUnlock.value = true
}

function buildProfitLegs(): CalculatorProfitCoinLeg[] {
  const coin = selectedCoin.value
  if (!coin) {
    return []
  }

  if (coin.dualCoin) {
    const doge = asicCoins.value.find((item) => item.id === 'DOGE')
    const ltc = asicCoins.value.find((item) => item.id === 'LTC')
    const legs: CalculatorProfitCoinLeg[] = []

    if (doge) {
      legs.push({
        blockReward: doge.blockReward,
        networkDifficulty: doge.difficulty,
        coinUsdtRate: dogeUsdtRate.value || doge.exchangeRateUsdt,
        stepen: doge.stepen,
      })
    }

    if (ltc) {
      legs.push({
        blockReward: ltc.blockReward,
        networkDifficulty: ltc.difficulty,
        coinUsdtRate: btcUsdtRate.value || ltc.exchangeRateUsdt,
        stepen: ltc.stepen,
      })
    }

    return legs
  }

  return [
    {
      blockReward: blockReward.value,
      networkDifficulty: networkDifficulty.value,
      coinUsdtRate: coinUsdtRate.value,
      stepen: coin.stepen,
    },
  ]
}

function openAlert(message: string) {
  alertMessage.value = message
  showAlertModal.value = true
}

function validateBeforeCalculate(): boolean {
  if (!buildProfitLegs().length) {
    openAlert(t('calculator.alertSelectCoin'))
    return false
  }

  if (!hashrate.value || hashrate.value <= 0) {
    openAlert(t('calculator.alertHashrate'))
    return false
  }

  if (!power.value || power.value <= 0) {
    openAlert(t('calculator.alertPower'))
    return false
  }

  if (!price.value || price.value <= 0) {
    openAlert(t('calculator.alertPrice'))
    return false
  }

  return true
}

async function runProfitCalculation() {
  if (!validateBeforeCalculate()) {
    profitResult.value = null
    return
  }

  const legs = buildProfitLegs()
  profitResult.value = calculateMiningProfit(
    {
      price: price.value,
      priceCurrency: priceCurrency.value,
      quantity: quantity.value,
      hashrate: hashrate.value,
      hashrateUnit: hashrateUnit.value,
      powerW: power.value,
      electricityPrice: electricityPrice.value,
      electricityCurrency: electricityCurrency.value,
      uptimePercent: uptime.value,
      poolFeePercent: poolFee.value,
      usdtRubRate: usdtRubRate.value,
    },
    legs,
  )

  await nextTick()
  resultsRef.value?.scrollIntoView({ behavior: 'smooth', block: 'start' })
}

function calculate() {
  if (!buildProfitLegs().length) {
    openAlert(t('calculator.alertSelectCoin'))
    return
  }

  if (!price.value || price.value <= 0) {
    openAlert(t('calculator.alertPrice'))
    return
  }

  if (isAsic.value && isDefaultDevicePrice(price.value)) {
    showDefaultPriceModal.value = true
    return
  }

  void runProfitCalculation()
}

function confirmDefaultPriceCalculate() {
  void runProfitCalculation()
}
</script>

<template>
  <section
    ref="formRef"
    class="calculator-form"
    :aria-label="t('calculator.formAria')"
  >
    <div class="calculator-form__inner">
      <div class="calculator-form__row">
        <div class="calculator-form__block calculator-form__block--tabs">
          <div class="calculator-form__step-label">
            <span class="calculator-form__step-num">(01)</span>
            {{ t('calculator.selectDevice') }}
          </div>
          <div class="calculator-form__tabs" role="tablist">
            <button
              v-for="option in CALCULATOR_DEVICE_OPTIONS"
              :key="option.kind"
              type="button"
              role="tab"
              class="calculator-form__tab"
              :class="{ 'calculator-form__tab--active': activeKind === option.kind }"
              :aria-selected="activeKind === option.kind"
              @click="selectDevice(option.kind)"
            >
              <span class="calculator-form__tab-img-wrap">
                <img
                  :src="tabIcon(option.kind)"
                  :alt="option.label"
                  class="calculator-form__tab-img"
                  width="40"
                  height="40"
                />
              </span>
              <span class="calculator-form__tab-label">{{ option.label }}</span>
            </button>
          </div>
        </div>

        <div class="calculator-form__block calculator-form__block--model">
          <div class="calculator-form__step-label">
            <span class="calculator-form__step-num">(02)</span>
            {{ t('calculator.selectModel') }}
          </div>
          <calculator-model-dropdown
            :kind="activeKind"
            :brands="brands"
            :selected="selectedModel"
            :placeholder="placeholder"
            :button-icon="buttonIcon"
            :loading="hardwarePending"
            @select="onModelSelect"
          />
        </div>
      </div>

      <div ref="formParamsRef" class="calculator-form__params">
        <h2 class="calculator-form__params-title">{{ t('calculator.enterParams') }}</h2>

        <div
          class="calculator-form__params-body"
          :class="{ 'calculator-form__params-body--locked': isLocked }"
        >
          <div
            v-if="isLocked"
            class="calculator-form__lock"
            role="status"
          >
            <p class="calculator-form__lock-text">{{ lockMessage }}</p>
            <button
              v-if="showManualUnlock"
              type="button"
              class="calculator-form__lock-btn"
              @click="unlockManualParams"
            >
              {{ t('calculator.enterParamsBtn') }}
            </button>
          </div>

          <!-- ASIC: two-column layout -->
          <div v-if="isAsic" class="calculator-form__panels">
            <div class="calculator-form__panel">
              <div class="calculator-form__coin-wrap">
                <span class="calculator-form__field-label">{{ t('calculator.minedCoin') }}</span>
                <calculator-coin-dropdown
                  :coins="asicCoins"
                  :selected="selectedCoin"
                  :loading="coinsLoading"
                  variant="asic"
                  @select="onCoinSelect"
                />
              </div>

              <label class="calculator-form__field">
                <span class="calculator-form__field-label">{{ priceLabel }}</span>
                <span class="calculator-form__field-control">
                  <input
                    v-model.number="price"
                    type="number"
                    min="0"
                    class="calculator-form__input"
                  />
                  <span
                    class="calculator-form__unit"
                    :class="{ 'calculator-form__unit--open': openUnitMenu === 'price' }"
                  >
                    <button
                      type="button"
                      class="calculator-form__unit-btn"
                      :aria-expanded="openUnitMenu === 'price'"
                      @click.stop="toggleUnitMenu('price')"
                    >
                      {{ priceCurrency }}
                      <img
                        :src="dropdownArrow"
                        alt=""
                        class="calculator-form__unit-arrow"
                        width="12"
                        height="12"
                        aria-hidden="true"
                      />
                    </button>
                    <span
                      v-if="openUnitMenu === 'price'"
                      class="calculator-form__unit-menu"
                    >
                      <button
                        v-for="option in CALCULATOR_FIAT_OPTIONS"
                        :key="option"
                        type="button"
                        class="calculator-form__unit-item"
                        :class="{
                          'calculator-form__unit-item--active':
                            option === priceCurrency,
                        }"
                        @click.stop="setPriceCurrency(option)"
                      >
                        {{ option }}
                      </button>
                    </span>
                  </span>
                </span>
              </label>

              <label class="calculator-form__field">
                <span class="calculator-form__field-label">
                  {{ t('calculator.hashrate') }}
                  <span class="calculator-form__tip" :title="t('calculator.hashrateTip')">i</span>
                </span>
                <span class="calculator-form__field-control">
                  <input
                    v-model.number="hashrate"
                    type="number"
                    min="0"
                    step="any"
                    class="calculator-form__input"
                  />
                  <span
                    class="calculator-form__unit"
                    :class="{ 'calculator-form__unit--open': openUnitMenu === 'hashrate' }"
                  >
                    <button
                      type="button"
                      class="calculator-form__unit-btn"
                      :aria-expanded="openUnitMenu === 'hashrate'"
                      @click.stop="toggleUnitMenu('hashrate')"
                    >
                      {{ hashrateUnit }}
                      <img
                        :src="dropdownArrow"
                        alt=""
                        class="calculator-form__unit-arrow"
                        width="12"
                        height="12"
                        aria-hidden="true"
                      />
                    </button>
                    <span
                      v-if="openUnitMenu === 'hashrate'"
                      class="calculator-form__unit-menu"
                    >
                      <button
                        v-for="unit in CALCULATOR_HASHRATE_UNITS"
                        :key="unit"
                        type="button"
                        class="calculator-form__unit-item"
                        :class="{
                          'calculator-form__unit-item--active':
                            unit === hashrateUnit,
                        }"
                        @click.stop="setHashrateUnit(unit)"
                      >
                        {{ unit }}
                      </button>
                    </span>
                  </span>
                </span>
              </label>

              <label class="calculator-form__field">
                <span class="calculator-form__field-label">{{ quantityLabel }}</span>
                <span class="calculator-form__qty">
                  <button
                    type="button"
                    class="calculator-form__qty-btn"
                    :aria-label="t('calculator.decrease')"
                    @click="decreaseQuantity"
                  >
                    −
                  </button>
                  <span class="calculator-form__qty-value">
                    <input
                      v-model.number="quantity"
                      type="number"
                      min="1"
                      class="calculator-form__input calculator-form__input--qty"
                    />
                    <span class="calculator-form__qty-unit">ед.</span>
                  </span>
                  <button
                    type="button"
                    class="calculator-form__qty-btn calculator-form__qty-btn--plus"
                    :aria-label="t('calculator.increase')"
                    @click="increaseQuantity"
                  >
                    +
                  </button>
                </span>
              </label>

              <label class="calculator-form__field">
                <span class="calculator-form__field-label">
                  {{ t('calculator.power') }}
                  <span class="calculator-form__tip" :title="t('calculator.powerTip')">i</span>
                </span>
                <span class="calculator-form__field-control">
                  <input
                    v-model.number="power"
                    type="number"
                    min="0"
                    class="calculator-form__input"
                  />
                  <span class="calculator-form__suffix">Вт</span>
                </span>
              </label>

              <div class="calculator-form__total">
                <span class="calculator-form__field-label">{{ t('calculator.totalCostColon') }}</span>
                <span class="calculator-form__total-value">
                  {{ formatMoneyAmount(totalCost) }}
                  <i>{{ priceCurrency }}</i>
                </span>
              </div>

              <label class="calculator-form__field">
                <span class="calculator-form__field-label">
                  {{ t('calculator.electricityPrice') }}
                  <span class="calculator-form__tip" :title="t('calculator.electricityTip')">i</span>
                </span>
                <span class="calculator-form__field-control">
                  <input
                    v-model.number="electricityPrice"
                    type="number"
                    min="0"
                    step="any"
                    class="calculator-form__input"
                  />
                  <span
                    class="calculator-form__unit calculator-form__unit--wide"
                    :class="{
                      'calculator-form__unit--open': openUnitMenu === 'electricity',
                    }"
                  >
                    <button
                      type="button"
                      class="calculator-form__unit-btn"
                      :aria-expanded="openUnitMenu === 'electricity'"
                      @click.stop="toggleUnitMenu('electricity')"
                    >
                      {{ electricityCurrency }} {{ t('calculator.perKwh') }}
                      <img
                        :src="dropdownArrow"
                        alt=""
                        class="calculator-form__unit-arrow"
                        width="12"
                        height="12"
                        aria-hidden="true"
                      />
                    </button>
                    <span
                      v-if="openUnitMenu === 'electricity'"
                      class="calculator-form__unit-menu"
                    >
                      <button
                        v-for="option in CALCULATOR_FIAT_OPTIONS"
                        :key="option"
                        type="button"
                        class="calculator-form__unit-item"
                        :class="{
                          'calculator-form__unit-item--active':
                            option === electricityCurrency,
                        }"
                        @click.stop="setElectricityCurrency(option)"
                      >
                        {{ option }}
                      </button>
                    </span>
                  </span>
                </span>
              </label>
            </div>

            <div class="calculator-form__panel calculator-form__panel--advanced">
              <button
                type="button"
                class="calculator-form__advanced-toggle"
                :aria-expanded="showAdvanced"
                @click="toggleAdvanced"
              >
                {{ t('calculator.advanced') }}
              </button>

              <div
                class="calculator-form__advanced"
                :class="{ 'calculator-form__advanced--active': showAdvanced }"
                @focusin="enableAdvanced"
              >
                <div
                  v-if="coinsLoading"
                  class="calculator-form__advanced-skeletons"
                  aria-busy="true"
                  aria-live="polite"
                >
                  <div
                    v-for="row in 5"
                    :key="`adv-sk-${row}`"
                    class="calculator-form__advanced-skeleton-row"
                  >
                    <div class="calculator-form__skeleton calculator-form__skeleton--label" />
                    <div class="calculator-form__skeleton calculator-form__skeleton--input" />
                  </div>
                </div>

                <template v-else>
                <label class="calculator-form__field">
                  <span class="calculator-form__field-label">
                    UP-TIME
                    <span class="calculator-form__tip" :title="t('calculator.uptimeTip')">i</span>
                  </span>
                  <span class="calculator-form__field-control">
                    <input
                      v-model.number="uptime"
                      type="number"
                      min="0"
                      max="100"
                      class="calculator-form__input"
                    />
                    <span class="calculator-form__suffix">%</span>
                  </span>
                </label>

                <label class="calculator-form__field">
                  <span class="calculator-form__field-label">
                    {{ coinRateLabel }}
                    <span class="calculator-form__tip" :title="t('calculator.coinGeckoTip')">i</span>
                  </span>
                  <span class="calculator-form__field-control">
                    <input
                      v-model.number="coinUsdtRate"
                      type="number"
                      min="0"
                      step="any"
                      class="calculator-form__input"
                    />
                    <span class="calculator-form__suffix">USDT</span>
                  </span>
                </label>

                <label
                  v-if="selectedCoin?.dualCoin"
                  class="calculator-form__field"
                >
                  <span class="calculator-form__field-label">
                    {{ t('calculator.dogeUsdt') }}
                    <span class="calculator-form__tip" :title="t('calculator.coinGeckoTip')">i</span>
                  </span>
                  <span class="calculator-form__field-control">
                    <input
                      v-model.number="dogeUsdtRate"
                      type="number"
                      min="0"
                      step="any"
                      class="calculator-form__input"
                    />
                    <span class="calculator-form__suffix">USDT</span>
                  </span>
                </label>

                <label class="calculator-form__field">
                  <span class="calculator-form__field-label">
                    {{ t('calculator.usdtRub') }}
                    <span class="calculator-form__tip" :title="t('calculator.coinGeckoTip')">i</span>
                  </span>
                  <span class="calculator-form__field-control">
                    <input
                      v-model.number="usdtRubRate"
                      type="number"
                      min="0"
                      step="any"
                      class="calculator-form__input"
                    />
                    <span class="calculator-form__suffix">₽</span>
                  </span>
                </label>

                <label class="calculator-form__field">
                  <span class="calculator-form__field-label">
                    {{ t('calculator.poolFee') }}
                    <span class="calculator-form__tip" :title="t('calculator.poolFeeTip')">i</span>
                  </span>
                  <span class="calculator-form__field-control">
                    <input
                      v-model.number="poolFee"
                      type="number"
                      min="0"
                      max="100"
                      step="any"
                      class="calculator-form__input"
                    />
                    <span class="calculator-form__suffix">%</span>
                  </span>
                </label>

                <label class="calculator-form__field">
                  <span class="calculator-form__field-label">
                    {{ t('calculator.blockReward') }}
                    <span class="calculator-form__tip" :title="t('calculator.blockRewardTip')">i</span>
                  </span>
                  <span class="calculator-form__field-control">
                    <input
                      v-model.number="blockReward"
                      type="number"
                      min="0"
                      step="any"
                      class="calculator-form__input"
                    />
                    <span class="calculator-form__suffix">{{ rewardUnit }}</span>
                  </span>
                </label>

                <label class="calculator-form__field calculator-form__field--difficulty">
                  <span class="calculator-form__field-label">
                    {{ t('calculator.difficulty') }}
                    <span class="calculator-form__tip" :title="t('calculator.difficultyTip')">i</span>
                  </span>
                  <span class="calculator-form__difficulty">
                    <button
                      type="button"
                      class="calculator-form__diff-btn"
                      @click="adjustDifficulty(-5)"
                    >
                      − 5%
                    </button>
                    <input
                      v-model.number="networkDifficulty"
                      type="number"
                      min="0"
                      step="any"
                      class="calculator-form__input calculator-form__input--difficulty"
                      @focus="selectInputText"
                    />
                    <button
                      type="button"
                      class="calculator-form__diff-btn calculator-form__diff-btn--plus"
                      @click="adjustDifficulty(5)"
                    >
                      + 5%
                    </button>
                  </span>
                </label>
                </template>
              </div>
            </div>
          </div>

          <!-- GPU / CPU: stacked panels -->
          <div v-else class="calculator-form__gpu">
            <div class="calculator-form__panel">
              <div class="calculator-form__gpu-row calculator-form__gpu-row--2">
                <label class="calculator-form__field">
                  <span class="calculator-form__field-label">{{ t('calculator.algorithm') }}</span>
                  <calculator-algorithm-dropdown
                    :algorithms="gpuAlgorithms"
                    :selected="selectedAlgorithm"
                    :loading="coinsLoading"
                    @select="onAlgorithmSelect"
                  />
                </label>

                <label class="calculator-form__field">
                  <span class="calculator-form__field-label">{{ t('calculator.minedCoin') }}</span>
                  <calculator-coin-dropdown
                    :coins="gpuCoins"
                    :selected="selectedCoin"
                    :loading="coinsLoading"
                    variant="gpu"
                    @select="onCoinSelect"
                  />
                </label>
              </div>

              <div class="calculator-form__gpu-row calculator-form__gpu-row--3">
                <label class="calculator-form__field">
                  <span class="calculator-form__field-label">{{ priceLabel }}</span>
                  <span class="calculator-form__field-control">
                    <input
                      v-model.number="price"
                      type="number"
                      min="0"
                      class="calculator-form__input"
                    />
                    <span
                      class="calculator-form__unit"
                      :class="{ 'calculator-form__unit--open': openUnitMenu === 'price' }"
                    >
                      <button
                        type="button"
                        class="calculator-form__unit-btn"
                        :aria-expanded="openUnitMenu === 'price'"
                        @click.stop="toggleUnitMenu('price')"
                      >
                        {{ priceCurrency }}
                        <img
                          :src="dropdownArrow"
                          alt=""
                          class="calculator-form__unit-arrow"
                          width="12"
                          height="12"
                          aria-hidden="true"
                        />
                      </button>
                      <span
                        v-if="openUnitMenu === 'price'"
                        class="calculator-form__unit-menu"
                      >
                        <button
                          v-for="option in CALCULATOR_FIAT_OPTIONS"
                          :key="option"
                          type="button"
                          class="calculator-form__unit-item"
                          :class="{
                            'calculator-form__unit-item--active':
                              option === priceCurrency,
                          }"
                          @click.stop="setPriceCurrency(option)"
                        >
                          {{ option }}
                        </button>
                      </span>
                    </span>
                  </span>
                </label>

                <label class="calculator-form__field">
                  <span class="calculator-form__field-label">{{ quantityLabel }}</span>
                  <span class="calculator-form__qty">
                    <button
                      type="button"
                      class="calculator-form__qty-btn"
                      :aria-label="t('calculator.decrease')"
                      @click="decreaseQuantity"
                    >
                      −
                    </button>
                    <span class="calculator-form__qty-value">
                      <input
                        v-model.number="quantity"
                        type="number"
                        min="1"
                        class="calculator-form__input calculator-form__input--qty"
                      />
                      <span class="calculator-form__qty-unit">ед.</span>
                    </span>
                    <button
                      type="button"
                      class="calculator-form__qty-btn calculator-form__qty-btn--plus"
                      :aria-label="t('calculator.increase')"
                      @click="increaseQuantity"
                    >
                      +
                    </button>
                  </span>
                </label>

                <div class="calculator-form__total calculator-form__total--inline">
                  <span class="calculator-form__field-label">{{ t('calculator.totalCostColon') }}</span>
                  <span class="calculator-form__total-value">
                    {{ formatMoneyAmount(totalCost) }}
                    <i>{{ priceCurrency }}</i>
                  </span>
                </div>
              </div>

              <div class="calculator-form__gpu-row calculator-form__gpu-row--3">
                <label class="calculator-form__field">
                  <span class="calculator-form__field-label">
                    {{ t('calculator.hashrate') }}
                    <span class="calculator-form__tip" :title="t('calculator.hashrateTip')">i</span>
                  </span>
                  <span class="calculator-form__field-control">
                    <input
                      v-model.number="hashrate"
                      type="number"
                      min="0"
                      step="any"
                      class="calculator-form__input"
                    />
                    <span
                      class="calculator-form__unit"
                      :class="{ 'calculator-form__unit--open': openUnitMenu === 'hashrate' }"
                    >
                      <button
                        type="button"
                        class="calculator-form__unit-btn"
                        :aria-expanded="openUnitMenu === 'hashrate'"
                        @click.stop="toggleUnitMenu('hashrate')"
                      >
                        {{ hashrateUnit }}
                        <img
                          :src="dropdownArrow"
                          alt=""
                          class="calculator-form__unit-arrow"
                          width="12"
                          height="12"
                          aria-hidden="true"
                        />
                      </button>
                      <span
                        v-if="openUnitMenu === 'hashrate'"
                        class="calculator-form__unit-menu"
                      >
                        <button
                          v-for="unit in CALCULATOR_HASHRATE_UNITS"
                          :key="unit"
                          type="button"
                          class="calculator-form__unit-item"
                          :class="{
                            'calculator-form__unit-item--active':
                              unit === hashrateUnit,
                          }"
                          @click.stop="setHashrateUnit(unit)"
                        >
                          {{ unit }}
                        </button>
                      </span>
                    </span>
                  </span>
                </label>

                <label class="calculator-form__field">
                  <span class="calculator-form__field-label">
                    {{ t('calculator.power') }}
                    <span class="calculator-form__tip" :title="t('calculator.powerTipShort')">i</span>
                  </span>
                  <span class="calculator-form__field-control">
                    <input
                      v-model.number="power"
                      type="number"
                      min="0"
                      class="calculator-form__input"
                    />
                    <span class="calculator-form__suffix">Вт</span>
                  </span>
                </label>

                <label class="calculator-form__field">
                  <span class="calculator-form__field-label">
                    {{ t('calculator.electricityPrice') }}
                    <span class="calculator-form__tip" :title="t('calculator.electricityTip')">i</span>
                  </span>
                  <span class="calculator-form__field-control">
                    <input
                      v-model.number="electricityPrice"
                      type="number"
                      min="0"
                      step="any"
                      class="calculator-form__input"
                    />
                    <span
                      class="calculator-form__unit calculator-form__unit--wide"
                      :class="{
                        'calculator-form__unit--open':
                          openUnitMenu === 'electricity',
                      }"
                    >
                      <button
                        type="button"
                        class="calculator-form__unit-btn"
                        :aria-expanded="openUnitMenu === 'electricity'"
                        @click.stop="toggleUnitMenu('electricity')"
                      >
                        {{ electricityCurrency }} {{ t('calculator.perKwh') }}
                        <img
                          :src="dropdownArrow"
                          alt=""
                          class="calculator-form__unit-arrow"
                          width="12"
                          height="12"
                          aria-hidden="true"
                        />
                      </button>
                      <span
                        v-if="openUnitMenu === 'electricity'"
                        class="calculator-form__unit-menu"
                      >
                        <button
                          v-for="option in CALCULATOR_FIAT_OPTIONS"
                          :key="option"
                          type="button"
                          class="calculator-form__unit-item"
                          :class="{
                            'calculator-form__unit-item--active':
                              option === electricityCurrency,
                          }"
                          @click.stop="setElectricityCurrency(option)"
                        >
                          {{ option }}
                        </button>
                      </span>
                    </span>
                  </span>
                </label>
              </div>
            </div>

            <div class="calculator-form__panel calculator-form__panel--advanced">
              <div class="calculator-form__gpu-row calculator-form__gpu-row--rates">
                <label
                  class="calculator-form__field"
                  :class="{ 'calculator-form__field--dimmed': !showAdvanced }"
                  @focusin="enableAdvanced"
                >
                  <span class="calculator-form__field-label">
                    {{ coinRateLabel }}
                    <span class="calculator-form__tip" :title="t('calculator.coinGeckoTip')">i</span>
                  </span>
                  <span class="calculator-form__field-control">
                    <input
                      v-model.number="btcUsdtRate"
                      type="number"
                      min="0"
                      step="any"
                      class="calculator-form__input"
                    />
                    <span class="calculator-form__suffix">USDT</span>
                  </span>
                </label>

                <label
                  class="calculator-form__field"
                  :class="{ 'calculator-form__field--dimmed': !showAdvanced }"
                  @focusin="enableAdvanced"
                >
                  <span class="calculator-form__field-label">
                    {{ t('calculator.usdtRub') }}
                    <span class="calculator-form__tip" :title="t('calculator.coinGeckoTip')">i</span>
                  </span>
                  <span class="calculator-form__field-control">
                    <input
                      v-model.number="usdtRubRate"
                      type="number"
                      min="0"
                      step="any"
                      class="calculator-form__input"
                    />
                    <span class="calculator-form__suffix">₽</span>
                  </span>
                </label>

                <button
                  type="button"
                  class="calculator-form__advanced-toggle"
                  :aria-expanded="showAdvanced"
                  @click="toggleAdvanced"
                >
                  {{ t('calculator.advanced') }}
                </button>
              </div>

              <div
                class="calculator-form__advanced calculator-form__advanced--gpu"
                :class="{ 'calculator-form__advanced--active': showAdvanced }"
                @focusin="enableAdvanced"
              >
                <div
                  v-if="coinsLoading"
                  class="calculator-form__advanced-skeletons"
                  aria-busy="true"
                  aria-live="polite"
                >
                  <div
                    v-for="row in 4"
                    :key="`gpu-adv-sk-${row}`"
                    class="calculator-form__advanced-skeleton-row"
                  >
                    <div class="calculator-form__skeleton calculator-form__skeleton--label" />
                    <div class="calculator-form__skeleton calculator-form__skeleton--input" />
                  </div>
                </div>

                <template v-else>
                <label class="calculator-form__field">
                  <span class="calculator-form__field-label">
                    UP-TIME
                    <span class="calculator-form__tip" :title="t('calculator.uptimeTip')">i</span>
                  </span>
                  <span class="calculator-form__field-control">
                    <input
                      v-model.number="uptime"
                      type="number"
                      min="0"
                      max="100"
                      class="calculator-form__input"
                    />
                    <span class="calculator-form__suffix">%</span>
                  </span>
                </label>

                <label class="calculator-form__field">
                  <span class="calculator-form__field-label">
                    {{ t('calculator.poolFee') }}
                    <span class="calculator-form__tip" :title="t('calculator.poolFeeTip')">i</span>
                  </span>
                  <span class="calculator-form__field-control">
                    <input
                      v-model.number="poolFee"
                      type="number"
                      min="0"
                      max="100"
                      step="any"
                      class="calculator-form__input"
                    />
                    <span class="calculator-form__suffix">%</span>
                  </span>
                </label>

                <label class="calculator-form__field">
                  <span class="calculator-form__field-label">
                    {{ t('calculator.blockReward') }}
                    <span class="calculator-form__tip" :title="t('calculator.blockRewardTip')">i</span>
                  </span>
                  <span class="calculator-form__field-control">
                    <input
                      v-model.number="blockReward"
                      type="number"
                      min="0"
                      step="any"
                      class="calculator-form__input"
                    />
                    <span class="calculator-form__suffix">{{ rewardUnit }}</span>
                  </span>
                </label>

                <label class="calculator-form__field calculator-form__field--difficulty">
                  <span class="calculator-form__field-label">
                    {{ t('calculator.difficulty') }}
                    <span class="calculator-form__tip" :title="t('calculator.difficultyTip')">i</span>
                  </span>
                  <span class="calculator-form__difficulty">
                    <button
                      type="button"
                      class="calculator-form__diff-btn"
                      @click="adjustDifficulty(-5)"
                    >
                      − 5%
                    </button>
                    <input
                      v-model.number="networkDifficulty"
                      type="number"
                      min="0"
                      step="any"
                      class="calculator-form__input calculator-form__input--difficulty"
                      @focus="selectInputText"
                    />
                    <button
                      type="button"
                      class="calculator-form__diff-btn calculator-form__diff-btn--plus"
                      @click="adjustDifficulty(5)"
                    >
                      + 5%
                    </button>
                  </span>
                </label>
                </template>
              </div>
            </div>
          </div>
        </div>

        <div class="calculator-form__actions">
          <button
            type="button"
            class="calculator-form__action calculator-form__action--primary"
            @click="calculate"
          >
            {{ t('calculator.calculate') }}
          </button>
          <button
            type="button"
            class="calculator-form__action calculator-form__action--ghost"
            @click="resetForm"
          >
            {{ t('calculator.reset') }}
          </button>
        </div>
      </div>
    </div>

    <Transition name="calc-results-slide">
      <div
        v-if="profitResult"
        ref="resultsRef"
        class="calculator-form__results-wrap"
      >
        <calculator-results
          v-model:currency="resultsCurrency"
          :result="profitResult"
          :coin-symbol="resultCoinSymbol"
        />
      </div>
    </Transition>

    <calculator-default-price-modal
      v-model:open="showDefaultPriceModal"
      :device-label="defaultPriceDeviceLabel"
      :default-price-label="defaultPriceLabel"
      @confirm="confirmDefaultPriceCalculate"
    />

    <calculator-alert-modal v-model:open="showAlertModal">
      {{ alertMessage }}
    </calculator-alert-modal>
  </section>
</template>

<style scoped lang="scss">
.calculator-form {
  --tm-orange: #ec5100;
  --tm-orange-soft: #ff741f;
  --tm-ink: #1a1a1a;
  --tm-panel: #262626;
  --tm-white: #fff;
  --tm-muted: #a0a0a0;
  --tm-border: rgba(255, 255, 255, 0.18);

  background: var(--tm-ink);
  color: var(--tm-white);
  padding: clamp(28px, 4vw, 48px) 0 0;
  overflow: visible;
}

.calculator-form__inner {
  width: min(1180px, calc(100% - 32px));
  margin: 0 auto;
  padding-bottom: clamp(40px, 5vw, 64px);
}

.calculator-form__row {
  display: flex;
  flex-wrap: wrap;
  align-items: flex-end;
  gap: 24px;
  margin-bottom: clamp(28px, 4vw, 40px);
}

.calculator-form__block {
  display: flex;
  flex-direction: column;
  gap: 16px;
  min-width: 0;
}

.calculator-form__block--tabs {
  flex: 0 0 auto;
}

.calculator-form__block--model {
  flex: 1 1 320px;
  max-width: 495px;
  min-width: 0;
}

.calculator-form__step-label {
  margin: 0;
  color: var(--tm-white);
  font-family: Mulish, sans-serif;
  font-size: 14px;
  font-weight: 600;
  line-height: 1.3;
}

.calculator-form__step-num {
  margin-right: 4px;
  color: var(--tm-muted);
  font-weight: 500;
}

.calculator-form__tabs {
  display: flex;
  gap: 24px;
}

.calculator-form__tab {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 10px;
  padding: 0;
  border: 0;
  background: transparent;
  color: var(--tm-muted);
  cursor: pointer;
  font: inherit;
}

.calculator-form__tab-img-wrap {
  display: grid;
  place-items: center;
  width: 98px;
  height: 98px;
  border-radius: 50%;
  border: 2px solid transparent;
  background: rgba(255, 255, 255, 0.04);
  overflow: hidden;
  transition:
    border-color 0.2s ease,
    background 0.2s ease;
}

.calculator-form__tab-img {
  width: 40px;
  height: 40px;
  object-fit: contain;
  opacity: 0.55;
  filter: grayscale(0.35);
  transition:
    opacity 0.2s ease,
    filter 0.2s ease;
}

.calculator-form__tab-label {
  font-size: 14px;
  font-weight: 600;
  letter-spacing: 0.02em;
  text-transform: uppercase;
}

.calculator-form__tab--active {
  color: var(--tm-orange);
}

.calculator-form__tab--active .calculator-form__tab-img-wrap {
  border: 2px dashed var(--tm-orange);
  background:
    url('~/assets/images/calculator/tabs/active-tag-bg.png') center / cover
      no-repeat;
}

.calculator-form__tab--active .calculator-form__tab-img {
  opacity: 1;
  filter: none;
}

.calculator-form__params-title {
  margin: 0 0 20px;
  color: var(--tm-white);
  font-size: clamp(22px, 2.4vw, 28px);
  font-weight: 700;
  line-height: 1.2;
}

.calculator-form__params-body {
  position: relative;
}

.calculator-form__params-body--locked > :not(.calculator-form__lock) {
  filter: blur(5px);
  opacity: 0.45;
  pointer-events: none;
  user-select: none;
}

.calculator-form__lock {
  position: absolute;
  inset: 0;
  z-index: 10;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  gap: 20px;
  padding: 24px;
  text-align: center;
  pointer-events: none;
}

.calculator-form__lock-text {
  margin: 0;
  max-width: 520px;
  color: var(--tm-white);
  font-size: clamp(18px, 2.4vw, 24px);
  font-weight: 600;
  line-height: 1.35;
}

.calculator-form__lock-btn {
  pointer-events: auto;
  min-width: min(260px, 100%);
  height: 48px;
  padding: 0 28px;
  border: 0;
  border-radius: 999px;
  background: var(--tm-orange);
  color: var(--tm-white);
  cursor: pointer;
  font: inherit;
  font-size: 15px;
  font-weight: 700;
  letter-spacing: 0.04em;
  text-transform: uppercase;
  transition: background 0.2s ease;

  &:hover {
    background: var(--tm-orange-soft);
  }
}

.calculator-form__panels {
  display: grid;
  grid-template-columns: repeat(2, minmax(0, 1fr));
  gap: 20px;
  align-items: stretch;
}

.calculator-form__gpu {
  display: flex;
  flex-direction: column;
  gap: 20px;
}

.calculator-form__gpu-row {
  display: grid;
  gap: 16px;

  &--2 {
    grid-template-columns: repeat(2, minmax(0, 1fr));
  }

  &--3 {
    grid-template-columns: repeat(3, minmax(0, 1fr));
    align-items: end;
  }

  &--rates {
    grid-template-columns: minmax(0, 1fr) minmax(0, 1fr) auto;
    align-items: end;
  }
}

.calculator-form__panel {
  display: flex;
  flex-direction: column;
  gap: 16px;
  padding: clamp(18px, 2.2vw, 24px);
  border-radius: 24px;
  background: var(--tm-panel);
}

.calculator-form__coin-wrap {
  position: relative;
  z-index: 5;
  display: flex;
  flex-direction: column;
  gap: 8px;
}

.calculator-form__field {
  display: flex;
  flex-direction: column;
  gap: 8px;
  min-width: 0;
}

.calculator-form__field-label {
  display: inline-flex;
  align-items: center;
  gap: 6px;
  color: var(--tm-muted);
  font-size: 13px;
  font-weight: 500;
}

.calculator-form__tip {
  display: inline-grid;
  place-items: center;
  width: 16px;
  height: 16px;
  border: 1px solid rgba(255, 255, 255, 0.45);
  border-radius: 50%;
  color: rgba(255, 255, 255, 0.7);
  font-size: 10px;
  font-style: normal;
  font-weight: 600;
  line-height: 1;
  cursor: help;
}

.calculator-form__field-control,
.calculator-form__qty,
.calculator-form__difficulty {
  display: flex;
  align-items: center;
  min-height: 48px;
  border: 1px solid var(--tm-border);
  border-radius: 12px;
  background: rgba(0, 0, 0, 0.25);
  overflow: hidden;

  &:has(.calculator-form__unit--open) {
    overflow: visible;
    position: relative;
    z-index: 30;
  }
}

.calculator-form__input {
  flex: 1;
  min-width: 0;
  height: 48px;
  padding: 0 14px;
  border: 0;
  background: transparent;
  color: var(--tm-white);
  font: inherit;
  font-size: 16px;
  outline: none;
  appearance: textfield;

  &::-webkit-outer-spin-button,
  &::-webkit-inner-spin-button {
    appearance: none;
    margin: 0;
  }
}

.calculator-form__input--qty {
  text-align: center;
  padding: 0 4px;
  width: 48px;
  flex: 0 0 auto;
}

.calculator-form__input--difficulty {
  text-align: center;
  font-size: 14px;
}

.calculator-form__suffix {
  flex-shrink: 0;
  padding: 0 14px;
  color: var(--tm-muted);
  font-size: 14px;
  font-weight: 600;
  border-left: 1px solid var(--tm-border);
  line-height: 48px;
}

.calculator-form__unit {
  position: relative;
  flex-shrink: 0;
  border-left: 1px solid var(--tm-border);
  align-self: stretch;

  &--wide .calculator-form__unit-btn {
    min-width: 108px;
  }

  &--open {
    z-index: 40;
  }

  &--open .calculator-form__unit-btn {
    position: relative;
    z-index: 41;
    border-color: var(--tm-orange-soft);
    border-bottom-color: #1f1f1f;
    background: #1f1f1f;
  }

  &--open .calculator-form__unit-arrow {
    transform: rotate(180deg);
  }
}

.calculator-form__unit-btn {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  gap: 6px;
  height: 100%;
  min-height: 48px;
  padding: 0 14px;
  border: 1px solid transparent;
  background: transparent;
  color: var(--tm-orange-soft);
  cursor: pointer;
  font: inherit;
  font-size: 14px;
  font-weight: 600;
  white-space: nowrap;
}

.calculator-form__unit-arrow {
  flex-shrink: 0;
  transition: transform 0.2s ease;
}

.calculator-form__unit-menu {
  position: absolute;
  top: calc(100% - 1px);
  right: 0;
  left: 0;
  z-index: 40;
  display: flex;
  flex-direction: column;
  gap: 2px;
  min-width: max(100%, 72px);
  padding: 6px;
  border: 1px solid var(--tm-orange-soft);
  border-radius: 0 0 12px 12px;
  background: #1f1f1f;
  box-shadow: 0 8px 24px rgba(0, 0, 0, 0.35);
}

.calculator-form__unit-item {
  display: block;
  width: 100%;
  padding: 8px 10px;
  border: 0;
  border-radius: 6px;
  background: transparent;
  color: var(--tm-white);
  cursor: pointer;
  font: inherit;
  font-size: 13px;
  text-align: left;

  &:hover,
  &--active {
    background: rgba(255, 116, 31, 0.14);
    color: var(--tm-orange-soft);
  }
}

.calculator-form__qty-value {
  display: flex;
  flex: 1;
  align-items: center;
  justify-content: center;
  gap: 4px;
}

.calculator-form__qty-unit {
  color: var(--tm-muted);
  font-size: 14px;
  font-weight: 600;
}

.calculator-form__qty-btn {
  flex-shrink: 0;
  width: 44px;
  height: 48px;
  border: 0;
  background: transparent;
  color: var(--tm-muted);
  cursor: pointer;
  font-size: 20px;
  font-weight: 600;
  line-height: 1;

  &--plus {
    color: var(--tm-orange-soft);
  }

  &:hover {
    background: rgba(255, 116, 31, 0.1);
  }
}

.calculator-form__total {
  display: flex;
  align-items: baseline;
  justify-content: space-between;
  gap: 12px;
  padding-top: 4px;

  &--inline {
    flex-direction: column;
    align-items: flex-start;
    justify-content: flex-end;
    min-height: 76px;
    padding-top: 0;
  }
}

.calculator-form__total-value {
  color: var(--tm-muted);
  font-size: 16px;
  font-weight: 600;
  font-style: normal;

  i {
    font-style: normal;
  }
}

.calculator-form__advanced-toggle {
  align-self: flex-end;
  padding: 10px 18px;
  border: 0;
  border-radius: 999px;
  background: var(--tm-orange);
  color: var(--tm-white);
  cursor: pointer;
  font: inherit;
  font-size: 14px;
  font-weight: 600;
  white-space: nowrap;
  transition: background 0.2s ease;

  &:hover {
    background: var(--tm-orange-soft);
  }
}

.calculator-form__advanced {
  display: grid;
  grid-template-columns: repeat(2, minmax(0, 1fr));
  gap: 16px;

  &:not(.calculator-form__advanced--active) .calculator-form__field {
    opacity: 0.3;
    transition: opacity 0.2s ease;

    &:hover,
    &:focus-within {
      opacity: 1;
    }
  }

  &--active .calculator-form__field {
    opacity: 1;
  }

  &--gpu {
    grid-template-columns: repeat(3, minmax(0, 1fr));
  }
}

.calculator-form__field--dimmed {
  opacity: 0.3;
  transition: opacity 0.2s ease;

  &:hover,
  &:focus-within {
    opacity: 1;
  }
}

.calculator-form__field--difficulty {
  grid-column: 1 / -1;
}

.calculator-form__diff-btn {
  flex-shrink: 0;
  min-width: 64px;
  height: 48px;
  padding: 0 10px;
  border: 0;
  background: transparent;
  color: var(--tm-muted);
  cursor: pointer;
  font: inherit;
  font-size: 13px;
  font-weight: 600;

  &--plus {
    color: var(--tm-orange-soft);
  }

  &:hover {
    background: rgba(255, 116, 31, 0.1);
  }
}

.calculator-form__actions {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  gap: 28px;
  margin-top: 40px;
}

.calculator-form__action {
  min-width: min(260px, 100%);
  height: 52px;
  padding: 0 28px;
  border-radius: 999px;
  cursor: pointer;
  font: inherit;
  font-size: 15px;
  font-weight: 700;
  letter-spacing: 0.04em;
  text-transform: uppercase;
  transition:
    background 0.2s ease,
    color 0.2s ease,
    border-color 0.2s ease;

  &--primary {
    border: 0;
    background: var(--tm-orange);
    color: var(--tm-white);

    &:hover {
      background: var(--tm-orange-soft);
    }
  }

  &--ghost {
    border: 1px solid var(--tm-orange);
    background: transparent;
    color: var(--tm-white);

    &:hover {
      border-color: var(--tm-orange-soft);
      color: var(--tm-orange-soft);
    }
  }
}

.calculator-form__results-wrap {
  width: 100%;
  margin-top: 0;
  overflow: visible;
}

.calc-results-slide-enter-active {
  transition:
    opacity 0.45s ease,
    transform 0.55s cubic-bezier(0.22, 1, 0.36, 1);
}

.calc-results-slide-leave-active {
  transition:
    opacity 0.3s ease,
    transform 0.35s ease;
}

.calc-results-slide-enter-from,
.calc-results-slide-leave-to {
  opacity: 0;
  transform: translateY(-40px);
}

.calc-results-slide-enter-to,
.calc-results-slide-leave-from {
  opacity: 1;
  transform: translateY(0);
}

@media (max-width: 980px) {
  .calculator-form__panels {
    grid-template-columns: 1fr;
  }

  .calculator-form__advanced,
  .calculator-form__advanced--gpu {
    grid-template-columns: 1fr;
  }

  .calculator-form__gpu-row--2,
  .calculator-form__gpu-row--3,
  .calculator-form__gpu-row--rates {
    grid-template-columns: 1fr;
  }

  .calculator-form__advanced-toggle {
    align-self: flex-start;
  }
}

.calculator-form__advanced-skeletons {
  display: grid;
  gap: 14px;
  padding: 4px 0 8px;
}

.calculator-form__advanced-skeleton-row {
  display: grid;
  gap: 8px;
}

.calculator-form__skeleton {
  border-radius: 999px;
  background: linear-gradient(
    110deg,
    rgba(255, 255, 255, 0.06) 0%,
    rgba(255, 255, 255, 0.06) 35%,
    rgba(255, 255, 255, 0.14) 50%,
    rgba(255, 255, 255, 0.06) 65%,
    rgba(255, 255, 255, 0.06) 100%
  );
  background-size: 200% 100%;
  animation: calculator-form-shimmer 1.35s ease-in-out infinite;
}

.calculator-form__skeleton--label {
  width: 42%;
  height: 12px;
}

.calculator-form__skeleton--input {
  width: 100%;
  height: 44px;
  border-radius: 12px;
}

@keyframes calculator-form-shimmer {
  0% {
    background-position: 100% 0;
  }

  100% {
    background-position: -100% 0;
  }
}

@media (max-width: 900px) {
  .calculator-form__row {
    flex-direction: column;
    align-items: stretch;
  }

  .calculator-form__block--model {
    max-width: none;
  }
}

@media (max-width: 560px) {
  .calculator-form__tabs {
    gap: 16px;
    justify-content: center;
  }

  .calculator-form__tab-img-wrap {
    width: 72px;
    height: 72px;
  }

  .calculator-form__tab-img {
    width: 32px;
    height: 32px;
  }

  .calculator-form__action {
    min-width: 100%;
  }
}
</style>
