<script setup lang="ts">
import {
  formatCoinAmount,
  formatMoneyAmount,
  type CalculatorProfitResult,
} from '~/common/modules/top-mining'
import type { ResultsCurrencyTab } from '~/components/calculator/form/CalculatorResults.types'

export type { ResultsCurrencyTab } from '~/components/calculator/form/CalculatorResults.types'

const { t } = useT()

const props = defineProps<{
  result: CalculatorProfitResult
  coinSymbol: string
}>()

const currency = defineModel<ResultsCurrencyTab>('currency', {
  default: 'RUB',
})

const unitSuffix = computed(() => {
  if (currency.value === 'USDT') {
    return '$'
  }

  if (currency.value === 'COIN') {
    return props.coinSymbol
  }

  return '₽'
})

function money(rub: number, usdt: number, coins: number): string {
  if (currency.value === 'USDT') {
    return formatMoneyAmount(usdt)
  }

  if (currency.value === 'COIN') {
    return formatCoinAmount(coins)
  }

  return formatMoneyAmount(rub)
}

const incomeHour = computed(() =>
  money(
    props.result.incomeHourRub,
    props.result.incomeHourUsdt,
    props.result.coinsHour,
  ),
)

const incomeDay = computed(() =>
  money(
    props.result.incomeDayRub,
    props.result.incomeDayUsdt,
    props.result.coinsDay,
  ),
)

const incomeMonth = computed(() =>
  money(
    props.result.incomeMonthRub,
    props.result.incomeMonthUsdt,
    props.result.coinsMonth,
  ),
)

const incomeYear = computed(() =>
  money(
    props.result.incomeYearRub,
    props.result.incomeYearUsdt,
    props.result.coinsYear,
  ),
)

const placing = computed(() => {
  if (currency.value === 'USDT') {
    return formatMoneyAmount(props.result.placingMonthUsdt)
  }

  if (currency.value === 'COIN') {
    const ratio =
      props.result.incomeMonthUsdt > 0
        ? props.result.placingMonthUsdt / props.result.incomeMonthUsdt
        : 0
    return formatCoinAmount(ratio * props.result.coinsMonth)
  }

  return formatMoneyAmount(props.result.placingMonthRub)
})

const clean = computed(() => {
  if (currency.value === 'USDT') {
    return formatMoneyAmount(props.result.cleanProfitMonthUsdt)
  }

  if (currency.value === 'COIN') {
    const ratio =
      props.result.incomeMonthUsdt > 0
        ? props.result.cleanProfitMonthUsdt / props.result.incomeMonthUsdt
        : 0
    return formatCoinAmount(ratio * props.result.coinsMonth)
  }

  return formatMoneyAmount(props.result.cleanProfitMonthRub)
})

const paybackLabel = computed(() => {
  const months = props.result.paybackMonths
  if (months == null || !Number.isFinite(months) || months <= 0) {
    return t('calculator.notPayback')
  }

  return `${months.toLocaleString('ru-RU', {
    minimumFractionDigits: 2,
    maximumFractionDigits: 2,
  })} ${t('calculator.months')}`
})
</script>

<template>
  <section
    class="calc-results"
    :aria-label="t('calculator.resultsAria')"
  >
    <div class="calc-results__inner">
      <h2 class="calc-results__title">{{ t('calculator.results') }}</h2>

      <div
        class="calc-results__tabs"
        role="tablist"
        :aria-label="t('calculator.currencyAria')"
      >
        <button
          type="button"
          role="tab"
          class="calc-results__tab"
          :class="{ 'calc-results__tab--active': currency === 'COIN' }"
          :aria-selected="currency === 'COIN'"
          @click="currency = 'COIN'"
        >
          {{ t('calculator.coin') }}
        </button>
        <button
          type="button"
          role="tab"
          class="calc-results__tab"
          :class="{ 'calc-results__tab--active': currency === 'USDT' }"
          :aria-selected="currency === 'USDT'"
          @click="currency = 'USDT'"
        >
          USDT
        </button>
        <button
          type="button"
          role="tab"
          class="calc-results__tab"
          :class="{ 'calc-results__tab--active': currency === 'RUB' }"
          :aria-selected="currency === 'RUB'"
          @click="currency = 'RUB'"
        >
          RUB
        </button>
      </div>

      <div class="calc-results__table">
        <div class="calc-results__row calc-results__row--income">
          <div class="calc-results__label">
            <span class="calc-results__label-desktop">{{ t('calculator.incomeApprox') }}</span>
            <span class="calc-results__label-mobile">{{ t('calculator.incomeShort') }}</span>
          </div>
          <div class="calc-results__values calc-results__values--income">
            <div class="calc-results__value">
              <span>{{ incomeHour }}</span>
              {{ unitSuffix }} {{ t('calculator.perHourSlash') }}
            </div>
            <div class="calc-results__value">
              <span>{{ incomeDay }}</span>
              {{ unitSuffix }} {{ t('calculator.perDaySlash') }}
            </div>
            <div class="calc-results__value">
              <span>{{ incomeMonth }}</span>
              {{ unitSuffix }} {{ t('calculator.perMonthSlash') }}
            </div>
            <div class="calc-results__value">
              <span>{{ incomeYear }}</span>
              {{ unitSuffix }} {{ t('calculator.perYearSlash') }}
            </div>
          </div>
        </div>

        <div class="calc-results__row">
          <div class="calc-results__label">
            {{ t('calculator.placingMonth') }}
          </div>
          <div class="calc-results__value calc-results__value--wide">
            <span>{{ placing }}</span>
            {{ unitSuffix }} {{ t('calculator.perMonthSlash') }}
          </div>
        </div>

        <div class="calc-results__row">
          <div class="calc-results__label">{{ t('calculator.paybackPeriod') }}</div>
          <div class="calc-results__value calc-results__value--wide">
            {{ paybackLabel }}
          </div>
        </div>

        <div class="calc-results__row">
          <div class="calc-results__label">
            {{ t('calculator.netProfit') }}
            <span class="calc-results__label-soft"> {{ t('calculator.perMonthSlash') }}</span>
          </div>
          <div class="calc-results__value calc-results__value--wide">
            <span>{{ clean }}</span>
            {{ unitSuffix }} {{ t('calculator.perMonthSlash') }}
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<style scoped lang="scss">
.calc-results {
  --tm-orange-soft: #ff741f;
  --tm-ink: #141414;
  --tm-white: #fff;
  --tm-peach: rgba(255, 255, 255, 0.72);

  position: relative;
  z-index: 1;
  display: block;
  width: 100%;
  box-sizing: border-box;
  padding: clamp(40px, 5vw, 64px) 0 clamp(72px, 10vw, 120px);
  border-radius: 64px 64px 0 0;
  background: #ff741f;
  color: var(--tm-ink);
  margin: 0;
}

.calc-results__inner {
  width: min(1180px, calc(100% - 32px));
  margin: 0 auto;
}

.calc-results__title {
  margin: 0 0 24px;
  color: var(--tm-white);
  font-family: Unbounded, 'Segoe UI', system-ui, sans-serif;
  font-size: clamp(22px, 3vw, 32px);
  font-weight: 600;
  letter-spacing: -0.03em;
  text-transform: uppercase;
}

.calc-results__tabs {
  display: inline-flex;
  align-items: center;
  gap: 4px;
  margin-bottom: 20px;
  padding: 6px;
  border-radius: 999px;
  background: var(--tm-white);
}

.calc-results__tab {
  min-width: 88px;
  height: 40px;
  padding: 0 18px;
  border: 0;
  border-radius: 999px;
  background: transparent;
  color: var(--tm-ink);
  cursor: pointer;
  font: inherit;
  font-family: Unbounded, 'Segoe UI', system-ui, sans-serif;
  font-size: 14px;
  font-weight: 500;
  transition:
    background 0.2s ease,
    color 0.2s ease;

  &--active {
    background: var(--tm-orange-soft);
    color: var(--tm-white);
  }
}

.calc-results__table {
  display: grid;
  gap: 12px;
}

.calc-results__row {
  display: grid;
  grid-template-columns: minmax(180px, 0.9fr) minmax(0, 2.4fr);
  gap: 12px;
  align-items: stretch;
}

.calc-results__row--income {
  align-items: stretch;
}

.calc-results__label {
  display: flex;
  align-items: center;
  min-height: 76px;
  padding: 16px;
  border-radius: 12px;
  background: var(--tm-white);
  color: var(--tm-ink);
  font-family: Unbounded, 'Segoe UI', system-ui, sans-serif;
  font-size: clamp(13px, 1.4vw, 16px);
  font-weight: 400;
  line-height: 1.35;
}

.calc-results__label-mobile {
  display: none;
}

.calc-results__label-soft {
  white-space: nowrap;
}

.calc-results__values--income {
  display: grid;
  grid-template-columns: repeat(4, minmax(0, 1fr));
  gap: 12px;
}

.calc-results__value {
  display: flex;
  align-items: center;
  justify-content: flex-start;
  min-height: 76px;
  padding: 16px;
  border-radius: 12px;
  background: var(--tm-peach);
  color: var(--tm-ink);
  font-family: Unbounded, 'Segoe UI', system-ui, sans-serif;
  font-size: clamp(13px, 1.35vw, 16px);
  font-weight: 400;
  line-height: 1.3;
  word-break: break-word;

  span {
    margin-right: 0.35em;
    font-weight: 500;
  }

  &--wide {
    width: 100%;
  }
}

@media (max-width: 900px) {
  .calc-results {
    border-radius: 40px 40px 0 0;
    padding-bottom: 80px;
    margin-bottom: -32px;
  }

  .calc-results__row {
    grid-template-columns: 1fr;
  }

  .calc-results__values--income {
    grid-template-columns: 1fr 1fr;
  }

  .calc-results__label {
    min-height: 56px;
  }

  .calc-results__value {
    min-height: 56px;
  }
}

@media (max-width: 560px) {
  .calc-results {
    border-radius: 28px 28px 0 0;
  }

  .calc-results__values--income {
    grid-template-columns: 1fr;
  }

  .calc-results__label-desktop {
    display: none;
  }

  .calc-results__label-mobile {
    display: inline;
  }

  .calc-results__tabs {
    width: 100%;
    justify-content: space-between;
  }

  .calc-results__tab {
    flex: 1;
    min-width: 0;
    padding: 0 8px;
    font-size: 12px;
  }
}
</style>
