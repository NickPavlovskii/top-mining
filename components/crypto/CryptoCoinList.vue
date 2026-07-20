<template>
  <article class="crypto-list">
    <h2 class="crypto-list__title">{{ title }}</h2>
    <div class="crypto-list__card">
      <div class="crypto-list__head">
        <span>Монета</span>
        <span>Цена (₽)</span>
        <div
          ref="periodDropdownRef"
          class="crypto-list__period"
        >
          <button
            class="crypto-list__period-toggle"
            type="button"
            aria-haspopup="listbox"            
            :aria-expanded="isPeriodOpen"
            @click="togglePeriodDropdown"
          >
            <span>
              {{ selectedPeriodLabel }}
            </span>
            <Icon
              name="mdi:chevron-down"
              :class="[
                'crypto-list__chevron',
                { 'crypto-list__chevron--open': isPeriodOpen },
              ]"
            />
          </button>

          <ul
            v-if="isPeriodOpen"
            class="crypto-list__period-menu"
            role="listbox"
            aria-label="Период изменения цены"
          >
            <li
              v-for="period in periods"
              role="option"
              :key="period.value"
              :aria-selected="selectedPeriod === period.value"
            >
              <button
                type="button"
                :class="[
                  'crypto-list__period-option',
                  { 'crypto-list__period-option--active': selectedPeriod === period.value },
                ]"
                @click="selectPeriod(period.value)"
              >
                {{ period.label }}
              </button>
            </li>
          </ul>
        </div>
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

        <span class="crypto-list__price">{{ formatPriceRub(coin.price) }}</span>
        <span
          :class="[
            'crypto-list__change',
            getChangeToneClass(getCoinChangeByPeriod(coin, selectedPeriod)),
          ]"
        >
          {{ formatChangePercent(getCoinChangeByPeriod(coin, selectedPeriod)) }}
        </span>
      </div>
    </div>
  </article>
</template>

<script setup lang="ts">
  import {
    CRYPTO_PRICE_PERIODS,
    DEFAULT_CRYPTO_PRICE_PERIOD,
    type CryptoPricePeriodValue,
  } from '~/common/modules/crypto'
  import type { CryptoCoin } from '~/common/modules/crypto'
  import {
    formatChangePercent,
    formatPriceRub,
    getChangeToneClass,
    getCoinChangeByPeriod,
    getCryptoIcon,
    getPeriodLabel,
  } from '~/common/modules/crypto'

  withDefaults(
    defineProps<{
      title: string
      coins: CryptoCoin[]
      highlightIndex?: number | null
    }>(),
    { highlightIndex: null },
  )

  const periods = CRYPTO_PRICE_PERIODS

  const selectedPeriod = ref<CryptoPricePeriodValue>(DEFAULT_CRYPTO_PRICE_PERIOD)
  const isPeriodOpen = ref(false)
  const periodDropdownRef = ref<HTMLElement | null>(null)

  const selectedPeriodLabel = computed(() =>
    getPeriodLabel(selectedPeriod.value),
  )

  function togglePeriodDropdown() {
    isPeriodOpen.value = !isPeriodOpen.value
  }

  function selectPeriod(value: CryptoPricePeriodValue) {
    selectedPeriod.value = value
    isPeriodOpen.value = false
  }

  function closePeriodDropdown(event: MouseEvent) {
    if (periodDropdownRef.value?.contains(event.target as Node)) {
      return
    }

    isPeriodOpen.value = false
  }

  onMounted(() => {
    document.addEventListener('click', closePeriodDropdown)
  })

  onBeforeUnmount(() => {
    document.removeEventListener('click', closePeriodDropdown)
  })
</script>

<style scoped>
  .crypto-list {
    display: flex;
    flex-direction: column;
    height: 100%;
    min-height: 0;
  }

  .crypto-list__title {
    margin: 0 0 18px;
    min-height: calc(2 * 1.1em);
    color: var(--tm-white);
    font-size: 30px;
    font-weight: 800;
    letter-spacing: -0.02em;
    line-height: 1.1;
  }

  .crypto-list__card {
    flex: 1;
    border: 1px solid rgba(255, 255, 255, 0.1);
    border-radius: 24px;
    background:
      linear-gradient(180deg, rgba(255, 255, 255, 0.04) 0%, transparent 28%),
      var(--tm-card-bg);
    overflow: visible;
    box-shadow: 0 18px 40px rgba(0, 0, 0, 0.18);
  }

  .crypto-list__head,
  .crypto-list__row {
    display: grid;
    grid-template-columns: minmax(0, 1fr) 120px 92px;
    align-items: center;
    gap: 12px;
    padding-left: 24px;
    padding-right: 24px;
  }

  .crypto-list__head {
    padding-top: 20px;
    padding-bottom: 14px;
    border-bottom: 1px solid rgba(255, 255, 255, 0.08);
    color: rgba(255, 255, 255, 0.72) !important;
    font-size: 13px;
    font-weight: 500;
    letter-spacing: 0.02em;
    text-transform: uppercase;
  }

  .crypto-list__head span {
    color: inherit !important;
  }

  .crypto-list__head span:nth-child(2) {
    text-align: right;
  }

  .crypto-list__period {
    position: relative;
    justify-self: end;
    width: 100%;
    max-width: 92px;
  }

  .crypto-list__period-toggle {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    gap: 2px;
    width: 100%;
    padding: 6px 8px;
    border: 1px solid rgba(255, 255, 255, 0.14);
    border-radius: 999px;
    background: rgba(255, 255, 255, 0.06);
    color: rgba(255, 255, 255, 0.92);
    font: inherit;
    font-size: 13px;
    font-weight: 600;
    line-height: 1;
    text-transform: uppercase;
    cursor: pointer;
    transition:
      background-color 0.2s ease,
      border-color 0.2s ease,
      color 0.2s ease;
  }

  .crypto-list__period-toggle:hover,
  .crypto-list__period-toggle:focus-visible {
    border-color: rgba(255, 106, 24, 0.55);
    background: rgba(255, 106, 24, 0.12);
    color: var(--tm-white);
    outline: none;
  }

  .crypto-list__period-menu {
    position: absolute;
    top: calc(100% + 8px);
    right: 0;
    z-index: 5;
    min-width: 108px;
    margin: 0;
    padding: 6px;
    border: 1px solid rgba(255, 255, 255, 0.12);
    border-radius: 14px;
    background: var(--tm-shadow);
    box-shadow: 0 14px 34px rgba(0, 0, 0, 0.34);
    list-style: none;
  }

  .crypto-list__period-option {
    display: block;
    width: 100%;
    padding: 10px 12px;
    border: 0;
    border-radius: 10px;
    background: transparent;
    color: rgba(255, 255, 255, 0.82);
    font: inherit;
    font-size: 13px;
    font-weight: 600;
    line-height: 1;
    text-align: left;
    text-transform: uppercase;
    cursor: pointer;
    transition:
      background-color 0.2s ease,
      color 0.2s ease;
  }

  .crypto-list__period-option:hover,
  .crypto-list__period-option:focus-visible {
    background: rgba(255, 255, 255, 0.08);
    color: var(--tm-white);
    outline: none;
  }

  .crypto-list__period-option--active {
    background: rgba(255, 106, 24, 0.18);
    color: #ff8a45;
  }

  .crypto-list__chevron {
    width: 16px;
    height: 16px;
    opacity: 0.75;
    transition: transform 0.2s ease;
  }

  .crypto-list__chevron--open {
    transform: rotate(180deg);
  }

  .crypto-list__row {
    min-height: 74px;
    padding-top: 10px;
    padding-bottom: 10px;
    margin: 0 10px;
    border-bottom: 1px solid rgba(255, 255, 255, 0.06);
    border-radius: 0;
    color: var(--tm-white);
    transition: background-color 0.2s ease;
  }

  .crypto-list__row:last-child {
    margin-bottom: 10px;
    border-bottom: 0;
  }

  .crypto-list__row:hover {
    background: rgba(255, 255, 255, 0.04);
  }

  .crypto-list__row--active {
    background: rgba(255, 255, 255, 0.06);
  }

  .crypto-list__row--active:hover {
    background: rgba(255, 255, 255, 0.08);
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
    border: 1px solid rgba(255, 255, 255, 0.08);
    border-radius: 50%;
    object-fit: cover;
    box-shadow: 0 6px 16px rgba(0, 0, 0, 0.22);
  }

  .crypto-list__coin strong {
    overflow: hidden;
    font-size: 22px;
    font-weight: 700;
    letter-spacing: -0.02em;
    text-overflow: ellipsis;
    white-space: nowrap;
  }

  .crypto-list__price {
    text-align: right;
    font-size: 16px;
    font-weight: 600;
    font-variant-numeric: tabular-nums;
    color: #f2f2f2;
  }

  .crypto-list__change {
    justify-self: end;
    min-width: 72px;
    padding: 6px 10px;
    border-radius: 999px;
    font-size: 14px;
    font-weight: 700;
    font-variant-numeric: tabular-nums;
    text-align: center;
  }

  .is-positive {
    color: #4ade80;
    background: rgba(74, 222, 128, 0.12);
  }

  .is-negative {
    color: #f87171;
    background: rgba(248, 113, 113, 0.12);
  }

  @media (max-width: 820px) {
    .crypto-list__title {
      margin-bottom: 12px;
      min-height: calc(2 * 1.1em);
      color: var(--tm-black);
      font-size: 22px;
    }

    .crypto-list__card {
      box-shadow: none;
    }

    .crypto-list__period {
      z-index: 2;
    }

    .crypto-list__period-menu {
      top: auto;
      bottom: calc(100% + 8px);
    }
  }

  @media (max-width: 520px) {
    .crypto-list {
      min-width: 0;
      color: var(--tm-black);
    }

    .crypto-list__title {
      margin-bottom: 12px;
      color: var(--tm-black);
      font-size: 22px;
    }

    .crypto-list__card {
      max-width: 100%;
      border: 1px solid #d6d6d6;
      border-radius: 22px;
      background: var(--tm-surface-gray);
      overflow: hidden;
    }

    .crypto-list__head,
    .crypto-list__row {
      grid-template-columns: minmax(0, 1fr) minmax(0, 58px) minmax(0, 44px);
      gap: 4px;
      padding-left: 12px;
      padding-right: 12px;
    }

    .crypto-list__head {
      color: #8b8b8b !important;
      font-size: 8px;
      padding-top: 12px;
      padding-bottom: 8px;
      border-bottom-color: rgba(0, 0, 0, 0.08);
    }

    .crypto-list__head span:nth-child(2) {
      text-align: right;
    }

    .crypto-list__head span {
      color: #8b8b8b !important;
    }

    .crypto-list__period {
      max-width: none;
      width: 100%;
      justify-self: stretch;
    }

    .crypto-list__period-toggle {
      width: 100%;
      min-width: 0;
      padding: 3px 4px;
      border-color: rgba(0, 0, 0, 0.1);
      background: rgba(0, 0, 0, 0.04);
      color: #8b8b8b;
      font-size: 8px;
      line-height: 1.1;
    }

    .crypto-list__chevron {
      width: 10px;
      height: 10px;
      flex-shrink: 0;
    }

    .crypto-list__period-toggle:hover,
    .crypto-list__period-toggle:focus-visible {
      border-color: rgba(255, 100, 24, 0.45);
      background: rgba(255, 100, 24, 0.08);
      color: var(--tm-black);
    }

    .crypto-list__period-menu {
      background: var(--tm-white);
      border-color: #e2e2e2;
      box-shadow: 0 10px 24px rgba(0, 0, 0, 0.12);
    }

    .crypto-list__period-option {
      color: var(--tm-black);
    }

    .crypto-list__period-option:hover,
    .crypto-list__period-option:focus-visible {
      background: #f3f3f3;
      color: var(--tm-black);
    }

    .crypto-list__period-option--active {
      background: rgba(255, 100, 24, 0.12);
      color: var(--tm-orange);
    }

    .crypto-list__row {
      min-height: 50px;
      margin: 0;
      padding-top: 8px;
      padding-bottom: 8px;
      border-bottom-color: rgba(0, 0, 0, 0.06);
      color: var(--tm-black);
      background: transparent;
    }

    .crypto-list__row:last-child {
      margin-bottom: 8px;
    }

    .crypto-list__row:hover {
      background: rgba(0, 0, 0, 0.03);
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
      font-size: 10px;
      letter-spacing: -0.03em;
    }

    .crypto-list__price {
      font-size: 8px;
      line-height: 1.1;
      color: var(--tm-black);
      overflow: hidden;
      text-overflow: ellipsis;
      white-space: nowrap;
    }

    .crypto-list__change {
      min-width: 0;
      width: 100%;
      padding: 3px 2px;
      font-size: 8px;
      line-height: 1.1;
      justify-self: stretch;
    }

    .is-positive {
      color: #10a64a;
      background: rgba(16, 166, 74, 0.1);
    }

    .is-negative {
      color: #f00022;
      background: rgba(240, 0, 34, 0.08);
    }
  }
</style>
