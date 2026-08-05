export type CalculatorProfitDevice = {
  /** Device price in selected fiat (₽ or $) */
  price: number
  priceCurrency: '₽' | '$'
  quantity: number
  hashrate: number
  hashrateUnit: 'Th/s' | 'Gh/s' | 'Mh/s' | 'Kh/s' | 'H/s'
  powerW: number
  electricityPrice: number
  electricityCurrency: '₽' | '$'
  uptimePercent: number
  poolFeePercent: number
  usdtRubRate: number
}

export type CalculatorProfitCoinLeg = {
  blockReward: number
  networkDifficulty: number
  /** Coin price in USDT */
  coinUsdtRate: number
  /** WhatToMine-style difficulty divisor: `2v32` | `2v13` | `0` */
  stepen: string
}

export type CalculatorProfitInput = CalculatorProfitDevice & CalculatorProfitCoinLeg

export type CalculatorProfitResult = {
  /** Gross mined coins for the primary (or summed dual) period yields */
  coinsHour: number
  coinsDay: number
  coinsMonth: number
  coinsYear: number
  incomeHourRub: number
  incomeDayRub: number
  incomeMonthRub: number
  incomeYearRub: number
  placingMonthRub: number
  cleanProfitMonthRub: number
  paybackMonths: number | null
  incomeHourUsdt: number
  incomeDayUsdt: number
  incomeMonthUsdt: number
  incomeYearUsdt: number
  placingMonthUsdt: number
  cleanProfitMonthUsdt: number
}

const HOURS_PER_MONTH = 732
const SECONDS_PER_DAY = 86_400
const HASHRATE_TH_SCALE = 1e12
const DEFAULT_DEVICE_PRICE_RUB = 120_000

export { DEFAULT_DEVICE_PRICE_RUB, HOURS_PER_MONTH }

/** Parse production `stepen` (`2v32` → 2^32, `2v13` → 2^13, else 1). */
export function parseStepen(stepen: string): number {
  if (stepen === '2v32') {
    return 2 ** 32
  }

  if (stepen === '2v13') {
    return 2 ** 13
  }

  return 1
}

/** Normalize hashrate to TH/s, matching production `Calc()`. */
export function hashrateToThs(
  hashrate: number,
  unit: CalculatorProfitDevice['hashrateUnit'],
): number {
  switch (unit) {
    case 'Gh/s':
      return hashrate / 1_000
    case 'Mh/s':
      return hashrate / 1e6
    case 'Kh/s':
      return hashrate / 1e9
    case 'H/s':
      return hashrate / 1e12
    default:
      return hashrate
  }
}

/**
 * Expected coins mined over `days` (WhatToMine / top-mining `totalIncome` without FX).
 *
 * ```
 * coins = reward × hashrateTh × 1e12 × 86400 × (1 − poolFee)
 *         × days × uptime / (difficulty × stepen) × quantity
 * ```
 */
export function totalCoins(
  device: CalculatorProfitDevice,
  coin: CalculatorProfitCoinLeg,
  days: number,
): number {
  const hashrateTh = hashrateToThs(device.hashrate, device.hashrateUnit)
  const stepen = parseStepen(coin.stepen)
  const efficiency = device.uptimePercent / 100
  const difficulty = coin.networkDifficulty

  if (
    !hashrateTh ||
    !coin.blockReward ||
    !difficulty ||
    !device.quantity ||
    days <= 0
  ) {
    return 0
  }

  const poolFactor = (100 - device.poolFeePercent) * 0.01

  return (
    (coin.blockReward *
      hashrateTh *
      HASHRATE_TH_SCALE *
      SECONDS_PER_DAY *
      poolFactor *
      days *
      efficiency *
      device.quantity) /
    (difficulty * stepen)
  )
}

export function totalCoinsForLegs(
  device: CalculatorProfitDevice,
  legs: CalculatorProfitCoinLeg[],
  days: number,
): number {
  return legs.reduce((sum, leg) => sum + totalCoins(device, leg, days), 0)
}

/**
 * Gross mining income for `days` in USDT.
 * `incomeUsdt = coins × coinUsdtRate` (summed per leg for dual mining).
 */
export function totalIncomeUsdt(
  device: CalculatorProfitDevice,
  coin: CalculatorProfitCoinLeg,
  days: number,
): number {
  if (!coin.coinUsdtRate) {
    return 0
  }

  return totalCoins(device, coin, days) * coin.coinUsdtRate
}

export function totalIncomeUsdtForLegs(
  device: CalculatorProfitDevice,
  legs: CalculatorProfitCoinLeg[],
  days: number,
): number {
  return legs.reduce(
    (sum, leg) => sum + totalIncomeUsdt(device, leg, days),
    0,
  )
}

/** Monthly electricity / hosting cost in RUB (732 h × kW × tariff × qty × uptime). */
export function placingMonthRub(device: CalculatorProfitDevice): number {
  const efficiency = device.uptimePercent / 100
  const pricePerKwhRub =
    device.electricityCurrency === '₽'
      ? device.electricityPrice
      : device.electricityPrice * device.usdtRubRate

  return (
    (device.powerW / 1000) *
    HOURS_PER_MONTH *
    efficiency *
    pricePerKwhRub *
    device.quantity
  )
}

function deviceTotalUsdt(device: CalculatorProfitDevice): number {
  const total = device.price * device.quantity
  if (!device.usdtRubRate) {
    return device.priceCurrency === '₽' ? 0 : total
  }

  return device.priceCurrency === '₽' ? total / device.usdtRubRate : total
}

export function calculateMiningProfit(
  device: CalculatorProfitDevice,
  legs: CalculatorProfitCoinLeg[],
): CalculatorProfitResult {
  const rub = device.usdtRubRate || 1
  const coinLegs = legs.length > 0 ? legs : []

  const coinsDay = totalCoinsForLegs(device, coinLegs, 1)
  const coinsMonth = totalCoinsForLegs(device, coinLegs, 30)
  const coinsYear = totalCoinsForLegs(device, coinLegs, 365)
  const coinsHour = coinsDay / 24

  const incomeDayUsdt = totalIncomeUsdtForLegs(device, coinLegs, 1)
  const incomeMonthUsdt = totalIncomeUsdtForLegs(device, coinLegs, 30)
  const incomeYearUsdt = totalIncomeUsdtForLegs(device, coinLegs, 365)
  const incomeHourUsdt = incomeDayUsdt / 24

  const placingRub = placingMonthRub(device)
  const placingUsdt = placingRub / rub

  const cleanMonthUsdt = incomeMonthUsdt - placingUsdt
  const cleanMonthRub = cleanMonthUsdt * rub

  const totalUsdt = deviceTotalUsdt(device)
  let paybackMonths: number | null = null
  if (totalUsdt > 0 && cleanMonthUsdt > 0) {
    paybackMonths = totalUsdt / cleanMonthUsdt
  } else if (cleanMonthUsdt <= 0) {
    paybackMonths = null
  }

  return {
    coinsHour,
    coinsDay,
    coinsMonth,
    coinsYear,
    incomeHourRub: incomeHourUsdt * rub,
    incomeDayRub: incomeDayUsdt * rub,
    incomeMonthRub: incomeMonthUsdt * rub,
    incomeYearRub: incomeYearUsdt * rub,
    placingMonthRub: placingRub,
    cleanProfitMonthRub: cleanMonthRub,
    paybackMonths,
    incomeHourUsdt,
    incomeDayUsdt,
    incomeMonthUsdt,
    incomeYearUsdt,
    placingMonthUsdt: placingUsdt,
    cleanProfitMonthUsdt: cleanMonthUsdt,
  }
}

export function isDefaultDevicePrice(price: number): boolean {
  return price === DEFAULT_DEVICE_PRICE_RUB
}

export function formatCoinAmount(value: number): string {
  if (!Number.isFinite(value) || value === 0) {
    return '0'
  }

  const abs = Math.abs(value)
  const digits = abs >= 1 ? 6 : abs >= 0.0001 ? 8 : 12

  return value.toLocaleString('ru-RU', {
    minimumFractionDigits: 0,
    maximumFractionDigits: digits,
  })
}
