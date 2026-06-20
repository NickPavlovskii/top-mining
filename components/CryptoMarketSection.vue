<template>
  <section class="crypto-section">
    <div class="crypto-section__inner">
      <header class="crypto-section__hero">
        <h1>
          <span class="crypto-section__title-fill">Криптовалюта</span>
          <span class="crypto-section__title-outline">сейчас</span>
        </h1>
      </header>

      <div class="crypto-section__grid">
        <crypto-coin-list
          title="Популярные монеты"
          :coins="popularCoins"
          :highlight-index="1"
        />

        <div class="crypto-section__chart-block">
          <h2 class="crypto-section__chart-block-title">Курс Bitcoin</h2>

          <article class="crypto-section__chart">
            <div v-if="bitcoinUsd" class="crypto-section__chart-meta">
              <img
                :src="bitcoinIcon"
                alt="Bitcoin"
                class="crypto-section__chart-icon"
              />
              <strong class="crypto-section__chart-price">
                {{ formatUsd(bitcoinUsd.price) }}
              </strong>
              <span
                :class="[
                  'crypto-section__chart-change',
                  getChangeClass(bitcoinUsd.change7d),
                ]"
              >
                <Icon
                  :name="
                    bitcoinUsd.change7d >= 0
                      ? 'mdi:triangle'
                      : 'mdi:triangle-down'
                  "
                  class="crypto-section__chart-arrow"
                />
                {{ formatChangeAbs(bitcoinUsd.change7d) }} (7д.)
              </span>
            </div>

            <svg
              class="crypto-section__chart-svg"
              viewBox="0 0 500 180"
              preserveAspectRatio="none"
              aria-hidden="true"
            >
              <g class="crypto-section__chart-grid">
                <line
                  v-for="x in gridLines"
                  :key="x"
                  :x1="x"
                  y1="0"
                  :x2="x"
                  y2="180"
                />
              </g>

              <polyline
                :points="chartPoints"
                fill="none"
                stroke="#4ade80"
                stroke-width="2.5"
                vector-effect="non-scaling-stroke"
              />
            </svg>
          </article>
        </div>

        <crypto-coin-list title="Лидер роста" :coins="growthCoins" />

        <crypto-coin-list
          title="Монета с максимальным объемом"
          :coins="volumeCoins"
        />
      </div>
    </div>
  </section>
</template>

<script setup lang="ts">
  import {
    CRYPTO_CHART_GRID_LINES,
    FALLBACK_BITCOIN_USD,
    GROWTH_COIN_IDS,
    POPULAR_COIN_IDS,
    VOLUME_COIN_IDS,
  } from '~/constants/crypto'
  import type { CryptoCoin, CryptoResponse } from '~/types/crypto-coin'
  import { bitcoinIcon } from '~/utils/cryptoIcons'
  import { getChangeToneClass } from '~/utils/cryptoPeriod'

  const { data } = await useFetch<CryptoResponse>('/api/crypto', {
    default: () => ({
      source: 'fallback',
      currency: 'rub',
      updatedAt: new Date().toISOString(),
      coins: [],
      bitcoinUsd: FALLBACK_BITCOIN_USD,
    }),
  })

  const coins = computed(() => data.value?.coins ?? [])
  const bitcoinUsd = computed(
    () => data.value?.bitcoinUsd ?? FALLBACK_BITCOIN_USD,
  )

  const popularCoins = computed(() =>
    POPULAR_COIN_IDS.map((id) => coins.value.find((coin) => coin.id === id))
      .filter((coin): coin is CryptoCoin => Boolean(coin)),
  )

  const growthCoins = computed(() =>
    [...coins.value]
      .filter((coin) =>
        (GROWTH_COIN_IDS as readonly string[]).includes(coin.id),
      )
      .sort((first, second) => second.change24h - first.change24h)
      .slice(0, 3),
  )

  const volumeCoins = computed(() =>
    [...coins.value]
      .filter((coin) =>
        (VOLUME_COIN_IDS as readonly string[]).includes(coin.id),
      )
      .sort((first, second) => second.volume - first.volume)
      .slice(0, 3),
  )

  const chartValues = computed(() => {
    const values = bitcoinUsd.value.sparkline

    return values.length > 1 ? values : FALLBACK_BITCOIN_USD.sparkline
  })

  const gridLines = CRYPTO_CHART_GRID_LINES

  const chartPoints = computed(() => {
    const values = chartValues.value
    const min = Math.min(...values)
    const max = Math.max(...values)
    const range = max - min || 1
    const width = 500
    const height = 180
    const paddingTop = 28
    const paddingBottom = 8

    return values
      .map((value, index) => {
        const x = (index / (values.length - 1)) * width
        const y =
          height -
          paddingBottom -
          ((value - min) / range) * (height - paddingTop - paddingBottom)

        return `${x.toFixed(1)},${y.toFixed(1)}`
      })
      .join(' ')
  })

  function formatUsd(value: number) {
    return new Intl.NumberFormat('en-US', {
      style: 'currency',
      currency: 'USD',
      maximumFractionDigits: 0,
    }).format(value)
  }

  function formatChangeAbs(value: number) {
    return `${Math.abs(value).toFixed(2).replace('.', ',')}%`
  }

  function getChangeClass(value: number) {
    return getChangeToneClass(value)
  }
</script>

<style scoped>
  .crypto-section {
    min-height: 100vh;
    padding: 88px 48px 96px;
    background: #1e1e1e;
    color: #ffffff;
    font-family:
      'Segoe UI',
      system-ui,
      -apple-system,
      sans-serif;
  }

  .crypto-section__inner {
    width: 100%;
    margin: 0 auto;
  }

  .crypto-section__hero {
    margin-bottom: 56px;
    text-align: center;
    text-transform: uppercase;
  }

  .crypto-section__hero h1 {
    margin: 0;
    font-size: clamp(78px, 9.8vw, 178px);
    font-weight: 900;
    line-height: 0.88;
    letter-spacing: -0.04em;
  }

  .crypto-section__hero h1 span {
    display: block;
  }

  .crypto-section__title-fill {
    color: #ffffff;
  }

  .crypto-section__title-outline {
    color: transparent;
    -webkit-text-stroke: 1.5px rgba(255, 255, 255, 0.55);
    paint-order: stroke fill;
  }

  .crypto-section__grid {
    display: grid;
    grid-template-columns: repeat(2, minmax(0, 1fr));
    gap: 40px 32px;
    align-items: start;
  }

  .crypto-section__chart-block-title {
    margin: 0 0 18px;
    color: #ffffff;
    font-size: 30px;
    font-weight: 800;
    letter-spacing: -0.02em;
    line-height: 1.1;
  }

  .crypto-section__chart {
    position: relative;
    min-height: 300px;
    border: 1px solid rgba(255, 255, 255, 0.08);
    border-radius: 24px;
    background: #2a2a2a;
    overflow: hidden;
  }

  .crypto-section__chart-meta {
    position: relative;
    z-index: 2;
    display: flex;
    align-items: center;
    gap: 10px;
    padding: 24px 28px 0;
  }

  .crypto-section__chart-icon {
    width: 38px;
    height: 38px;
    border-radius: 50%;
    object-fit: cover;
  }

  .crypto-section__chart-price {
    font-size: 30px;
    font-weight: 800;
    letter-spacing: -0.03em;
  }

  .crypto-section__chart-change {
    display: inline-flex;
    align-items: center;
    gap: 3px;
    font-size: 16px;
    font-weight: 600;
  }

  .crypto-section__chart-arrow {
    width: 14px;
    height: 14px;
  }

  .crypto-section__chart-svg {
    position: absolute;
    left: 0;
    right: 0;
    bottom: 0;
    width: 100%;
    height: calc(100% - 44px);
  }

  .crypto-section__chart-grid line {
    stroke: rgba(255, 255, 255, 0.06);
    stroke-width: 1;
  }

  .is-positive {
    color: #4ade80;
  }

  .is-negative {
    color: #f87171;
  }

  @media (max-width: 820px) {
    .crypto-section {
      width: 100%;
      margin-top: -34px;
      padding: 72px 14px 56px;
      border-radius: 42px 42px 0 0;
      background: #f4f4f4;
      color: #151515;
      overflow: hidden;
    }

    .crypto-section__inner {
      width: 100%;
      max-width: 100%;
    }

    .crypto-section__hero {
      margin-bottom: 28px;
      overflow: hidden;
    }

    .crypto-section__hero h1 {
      font-size: clamp(30px, 10.5vw, 40px);
      line-height: 0.9;
      letter-spacing: -0.055em;
    }

    .crypto-section__title-fill {
      color: #151515;
    }

    .crypto-section__title-outline {
      color: #ff6418;
      -webkit-text-stroke: 0;
    }

    .crypto-section__grid {
      grid-template-columns: 1fr;
      gap: 24px;
      width: 100%;
      max-width: 100%;
    }

    .crypto-section__chart-block-title {
      color: #151515;
      font-size: 22px;
      margin-bottom: 12px;
    }

    .crypto-section__chart {
      min-height: 220px;
      border: 1px solid #d8d8d8;
      border-radius: 22px;
      background: #151515;
      color: #ffffff;
    }

    .crypto-section__chart-meta {
      gap: 8px;
      padding: 16px 14px 0;
    }

    .crypto-section__chart-icon {
      width: 28px;
      height: 28px;
    }

    .crypto-section__chart-price {
      font-size: 21px;
    }

    .crypto-section__chart-change {
      font-size: 12px;
    }
  }
</style>
