<template>
  <article class="crypto-list">
    <h2 class="crypto-list__title">{{ title }}</h2>
    <div class="crypto-list__card">
      <div class="crypto-list__head">
        <span>Монета</span>
        <span>Цена (₽)</span>
        <label class="crypto-list__period">
          <select
            v-model="selectedPeriod"
            aria-label="Период изменения цены"
          >
            <option
              v-for="period in periods"
              :key="period.value"
              :value="period.value"
            >
              {{ period.label }}
            </option>
          </select>
          <span>{{ selectedPeriodLabel }}</span>
          <Icon
            name="mdi:chevron-down"
            class="crypto-list__chevron"
          />
        </label>
      </div>

      <div
        v-for="(coin, index) in coins"
        :key="coin.id"
        :class="[
          'crypto-list__row',
          { 'crypto-list__row--active': highlightIndex === index },
        ]"
      >
        <div class="crypto-list__coin">
          <img
            :src="getCryptoIcon(coin.id, coin.image)"
            :alt="coin.name"
          />
          <strong>{{ coin.name }} ({{ coin.symbol.toUpperCase() }})</strong>
        </div>

        <span class="crypto-list__price">{{ formatPrice(coin.price) }}</span>
        <span
          :class="[
            'crypto-list__change',
            getChangeClass(getPeriodChange(coin)),
          ]"
        >
          {{ formatChange(getPeriodChange(coin)) }}
        </span>
      </div>
    </div>
  </article>
</template>

<script setup lang="ts">
  import { getCryptoIcon } from '~/utils/cryptoIcons'

  interface CryptoCoin {
    id: string
    symbol: string
    name: string
    image: string
    price: number
    volume: number
    change24h: number
    change7d: number
    sparkline: number[]
  }

  withDefaults(
    defineProps<{
      title: string
      coins: CryptoCoin[]
      highlightIndex?: number | null
    }>(),
    { highlightIndex: null },
  )

  const periods = [
    { label: '24 ч', value: '24h' },
    { label: '7 д', value: '7d' },
  ] as const

  type PeriodValue = (typeof periods)[number]['value']

  const selectedPeriod = ref<PeriodValue>('24h')
  const selectedPeriodLabel = computed(
    () =>
      periods.find((period) => period.value === selectedPeriod.value)?.label ??
      periods[0].label,
  )

  function formatPrice(value: number) {
    return new Intl.NumberFormat('ru-RU', {
      maximumFractionDigits: value >= 100 ? 0 : 2,
    }).format(value)
  }

  function formatChange(value: number) {
    const sign = value > 0 ? '+' : ''

    return `${sign}${value.toFixed(2).replace('.', ',')}%`
  }

  function getChangeClass(value: number) {
    return value >= 0 ? 'is-positive' : 'is-negative'
  }

  function getPeriodChange(coin: CryptoCoin) {
    return selectedPeriod.value === '7d' ? coin.change7d : coin.change24h
  }
</script>

<style scoped>
  .crypto-list__title {
    margin: 0 0 18px;
    color: #151515;
    font-size: 30px;
    font-weight: 800;
    letter-spacing: -0.02em;
    line-height: 1.1;
  }

  .crypto-list__card {
    border: 1px solid rgba(255, 255, 255, 0.08);
    border-radius: 24px;
    background: #2a2a2a;
    overflow: hidden;
  }

  .crypto-list__head,
  .crypto-list__row {
    display: grid;
    grid-template-columns: minmax(0, 1fr) 130px 110px;
    align-items: center;
    gap: 14px;
    padding-left: 24px;
    padding-right: 24px;
  }

  .crypto-list__head {
    padding-top: 22px;
    padding-bottom: 16px;
    color: #ffffff !important;
    font-size: 14px;
    font-weight: 500;
  }

  .crypto-list__head span {
    color: #ffffff !important;
  }

  .crypto-list__head span:nth-child(2),
  .crypto-list__head span:nth-child(3) {
    text-align: right;
  }

  .crypto-list__period {
    position: relative;
    display: inline-flex;
    align-items: center;
    justify-content: flex-end;
    gap: 4px;
    min-width: 58px;
    cursor: pointer;
  }

  .crypto-list__period select {
    position: absolute;
    inset: -6px -4px;
    width: calc(100% + 8px);
    height: calc(100% + 12px);
    border: 0;
    opacity: 0;
    cursor: pointer;
  }

  .crypto-list__period span {
    color: inherit !important;
  }

  .crypto-list__chevron {
    width: 18px;
    height: 18px;
    opacity: 0.7;
  }

  .crypto-list__row {
    min-height: 72px;
    padding-top: 8px;
    padding-bottom: 8px;
    margin: 0 12px 10px;
    border-radius: 16px;
    color: #ffffff;
  }

  .crypto-list__row:last-child {
    margin-bottom: 16px;
  }

  .crypto-list__row--active {
    background: rgba(255, 255, 255, 0.06);
  }

  .crypto-list__coin {
    display: flex;
    align-items: center;
    gap: 16px;
    min-width: 0;
  }

  .crypto-list__coin img {
    flex-shrink: 0;
    width: 44px;
    height: 44px;
    border-radius: 50%;
    object-fit: cover;
  }

  .crypto-list__coin strong {
    overflow: hidden;
    font-size: 24px;
    font-weight: 800;
    letter-spacing: -0.03em;
    text-overflow: ellipsis;
    white-space: nowrap;
  }

  .crypto-list__price {
    text-align: right;
    font-size: 17px;
    font-weight: 600;
    color: #e8e8e8;
  }

  .crypto-list__change {
    text-align: right;
    font-size: 17px;
    font-weight: 700;
  }

  .is-positive {
    color: #4ade80;
  }

  .is-negative {
    color: #f87171;
  }

  @media (max-width: 520px) {
    .crypto-list {
      min-width: 0;
      color: #151515;
    }

    .crypto-list__title {
      margin-bottom: 12px;
      color: #151515;
      font-size: 22px;
    }

    .crypto-list__card {
      max-width: 100%;
      border: 1px solid #d6d6d6;
      border-radius: 22px;
      background: #f4f4f4;
    }

    .crypto-list__head,
    .crypto-list__row {
      grid-template-columns: minmax(0, 1fr) 64px 52px;
      gap: 6px;
      padding-left: 10px;
      padding-right: 10px;
    }

    .crypto-list__head {
      color: #8b8b8b !important;
      font-size: 9px;
      padding-top: 12px;
      padding-bottom: 8px;
    }

    .crypto-list__head span,
    .crypto-list__period span {
      color: #8b8b8b !important;
    }

    .crypto-list__row {
      min-height: 54px;
      margin: 0 8px 7px;
      border-radius: 10px;
      color: #151515;
      background: transparent;
    }

    .crypto-list__row--active {
      background: rgba(0, 0, 0, 0.04);
    }

    .crypto-list__coin {
      gap: 8px;
    }

    .crypto-list__coin img {
      width: 28px;
      height: 28px;
    }

    .crypto-list__coin strong {
      font-size: 11px;
    }

    .crypto-list__price,
    .crypto-list__change {
      font-size: 10px;
    }

    .crypto-list__price {
      color: #151515;
    }

    .is-positive {
      color: #10a64a;
    }

    .is-negative {
      color: #f00022;
    }
  }
</style>
