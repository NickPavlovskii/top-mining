/**
 * Папка calculator — майнинг-калькулятор.
 * Типы монет и хелперы; каталог приходит из API/БД.
 */
export type CalculatorHashrateUnit = 'Th/s' | 'Gh/s' | 'Mh/s' | 'Kh/s' | 'H/s'
export type CalculatorFiat = '₽' | '$'

export type CalculatorCoin = {
  id: string
  symbol: string
  name: string
  algorithm: string
  difficulty: number
  blockReward: number
  exchangeRateUsdt: number
  netHash: number
  stepen: string
  dualCoin: boolean
  iconUrl: string
  sort: number
}

export type CalculatorCoinsCatalog = {
  asic: CalculatorCoin[]
  gpu: CalculatorCoin[]
  gpuAlgorithms: string[]
  defaultUsdtRub: number
}

export const CALCULATOR_HASHRATE_UNITS: CalculatorHashrateUnit[] = [
  'Th/s',
  'Gh/s',
  'Mh/s',
  'Kh/s',
  'H/s',
]

export const CALCULATOR_FIAT_OPTIONS: CalculatorFiat[] = ['₽', '$']

export const CALCULATOR_DEFAULT_USDT_RUB = 79.2

export function emptyCalculatorCoinsCatalog(): CalculatorCoinsCatalog {
  return {
    asic: [],
    gpu: [],
    gpuAlgorithms: [],
    defaultUsdtRub: CALCULATOR_DEFAULT_USDT_RUB,
  }
}

export function getDefaultCalculatorCoin(
  coins: CalculatorCoin[],
): CalculatorCoin | null {
  return coins.find((coin) => coin.id === 'BTC') ?? coins[0] ?? null
}

export function formatCoinButtonLabel(coin: CalculatorCoin): string {
  if (coin.dualCoin) {
    return coin.name
  }

  return `${coin.symbol} (${coin.name})`
}

export function formatCoinOptionLabel(coin: CalculatorCoin): string {
  if (coin.dualCoin) {
    return `${coin.name} | ${coin.algorithm}`
  }

  return `${coin.symbol} (${coin.name}) | ${coin.algorithm}`
}

export function filterCalculatorCoins(
  coins: CalculatorCoin[],
  query: string,
): CalculatorCoin[] {
  const normalized = query.trim().toLowerCase()

  if (!normalized) {
    return coins
  }

  return coins.filter((coin) => {
    const haystack = [
      coin.symbol,
      coin.name,
      coin.algorithm,
      formatCoinOptionLabel(coin),
    ]
      .join(' ')
      .toLowerCase()

    return haystack.includes(normalized)
  })
}

export function formatMoneyAmount(value: number): string {
  return value.toLocaleString('ru-RU', {
    minimumFractionDigits: 2,
    maximumFractionDigits: 2,
  })
}
