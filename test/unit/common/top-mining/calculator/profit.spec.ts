import { describe, expect, it } from 'vitest'

import {
  DEFAULT_DEVICE_PRICE_RUB,
  calculateMiningProfit,
  hashrateToThs,
  isDefaultDevicePrice,
  parseStepen,
  placingMonthRub,
  totalIncomeUsdt,
} from '~/common/modules/top-mining/calculator/profit'

const btcDevice = {
  price: 120_000,
  priceCurrency: '₽' as const,
  quantity: 1,
  hashrate: 214,
  hashrateUnit: 'Th/s' as const,
  powerW: 3550,
  electricityPrice: 5.5,
  electricityCurrency: '₽' as const,
  uptimePercent: 99,
  poolFeePercent: 4,
  usdtRubRate: 79.2,
}

const btcCoin = {
  blockReward: 3.1421529371429,
  networkDifficulty: 1.2623150712187e14,
  coinUsdtRate: 63_076,
  stepen: '2v32',
}

describe('calculator-profit', () => {
  it('parses stepen and hashrate units like production', () => {
    expect(parseStepen('2v32')).toBe(2 ** 32)
    expect(parseStepen('2v13')).toBe(2 ** 13)
    expect(parseStepen('0')).toBe(1)
    expect(hashrateToThs(1000, 'Gh/s')).toBe(1)
    expect(hashrateToThs(1e6, 'Mh/s')).toBe(1)
  })

  it('flags the default ASIC price', () => {
    expect(isDefaultDevicePrice(DEFAULT_DEVICE_PRICE_RUB)).toBe(true)
    expect(isDefaultDevicePrice(250_000)).toBe(false)
  })

  it('computes positive BTC income and payback', () => {
    const result = calculateMiningProfit(btcDevice, [btcCoin])

    expect(result.coinsDay).toBeGreaterThan(0)
    expect(result.incomeDayUsdt).toBeGreaterThan(0)
    expect(result.incomeMonthRub).toBeGreaterThan(result.incomeDayRub)
    expect(result.placingMonthRub).toBeGreaterThan(0)
    expect(result.paybackMonths).not.toBeNull()
    expect(result.paybackMonths!).toBeGreaterThan(0)
  })

  it('matches the production income formula for one day', () => {
    const income = totalIncomeUsdt(btcDevice, btcCoin, 1)
    const expectedCoins =
      (btcCoin.blockReward *
        214 *
        1e12 *
        86_400 *
        0.96 *
        1 *
        0.99) /
      (btcCoin.networkDifficulty * 2 ** 32)

    expect(income).toBeCloseTo(expectedCoins * btcCoin.coinUsdtRate, 6)
    expect(calculateMiningProfit(btcDevice, [btcCoin]).coinsDay).toBeCloseTo(
      expectedCoins,
      12,
    )
  })

  it('computes electricity placing in RUB', () => {
    const placing = placingMonthRub(btcDevice)
    expect(placing).toBeCloseTo((3550 / 1000) * 732 * 0.99 * 5.5 * 1, 5)
  })
})
