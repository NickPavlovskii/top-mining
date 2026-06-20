import {
  CRYPTO_PRICE_PERIODS,
  DEFAULT_CRYPTO_PRICE_PERIOD,
  type CryptoPricePeriodValue,
} from '~/constants/crypto'
import type { CryptoCoin } from '~/types/crypto-coin'

export function getPeriodLabel(period: CryptoPricePeriodValue) {
  const found = CRYPTO_PRICE_PERIODS.find((item) => item.value === period)

  if (found) {
    return found.label
  }

  return CRYPTO_PRICE_PERIODS.find(
    (item) => item.value === DEFAULT_CRYPTO_PRICE_PERIOD,
  )!.label
}

export function getCoinChangeByPeriod(
  coin: CryptoCoin,
  period: CryptoPricePeriodValue,
) {
  if (period === '7d') {
    return coin.change7d
  }

  return coin.change24h
}

export function formatPriceRub(value: number) {
  return new Intl.NumberFormat('ru-RU', {
    maximumFractionDigits: value >= 100 ? 0 : 2,
  }).format(value)
}

export function formatChangePercent(value: number) {
  const sign = value > 0 ? '+' : ''

  return `${sign}${value.toFixed(2).replace('.', ',')}%`
}

export function getChangeToneClass(value: number) {
  if (value >= 0) {
    return 'is-positive'
  }

  return 'is-negative'
}
