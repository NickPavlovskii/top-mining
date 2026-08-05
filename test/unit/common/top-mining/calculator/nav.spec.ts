import { describe, expect, it } from 'vitest'

import {
  getCalculatorDeviceHash,
  getCalculatorNavItemHref,
  parseCalculatorDeviceHash,
} from '~/common/modules/top-mining/calculator/nav'

describe('calculator-nav', () => {
  it('maps menu items to calculator routes', () => {
    expect(getCalculatorNavItemHref('ASIC-майнеры')).toBe('/calculator/#asic')
    expect(getCalculatorNavItemHref('GPU')).toBe('/calculator/#gpu')
    expect(getCalculatorNavItemHref('CPU')).toBe('/calculator/#cpu')
    expect(getCalculatorNavItemHref('Конвертер хешрейта')).toBe(
      '/konverter-heshrejta/',
    )
    expect(getCalculatorNavItemHref('Рейтинги')).toBe('/rating/')
  })

  it('parses device hashes', () => {
    expect(parseCalculatorDeviceHash('#gpu')).toBe('gpu')
    expect(parseCalculatorDeviceHash('cpu')).toBe('cpu')
    expect(parseCalculatorDeviceHash('#converter')).toBeNull()
  })

  it('builds device hashes', () => {
    expect(getCalculatorDeviceHash('asic')).toBe('#asic')
  })
})
