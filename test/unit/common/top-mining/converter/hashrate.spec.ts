import { describe, expect, it } from 'vitest'

import {
  convertHashrateValues,
  createDefaultHashrateValues,
  formatConverterValue,
  hashrateFromBaseHs,
  hashrateToBaseHs,
  parseConverterInput,
} from '~/common/modules/top-mining/hashrate-converter'

describe('hashrate-converter', () => {
  it('converts between metric prefixes via base H/s', () => {
    expect(hashrateToBaseHs(1, 6)).toBe(1_000_000)
    expect(hashrateFromBaseHs(1_000_000, 6)).toBe(1)
    expect(hashrateFromBaseHs(1_000_000, 12)).toBe(0.000001)
  })

  it('creates default values like production (1 MH/s)', () => {
    const values = createDefaultHashrateValues()

    expect(values.megahash).toBe('1')
    expect(values.hash).toBe('1000000')
    expect(values.kilohash).toBe('1000')
    expect(values.gigahash).toBe('0.001')
    expect(values.terahash).toBe('0.000001')
  })

  it('updates all fields when one unit changes', () => {
    const values = convertHashrateValues('terahash', '214')

    expect(values.terahash).toBe('214')
    expect(values.gigahash).toBe('214000')
    expect(values.megahash).toBe('214000000')
  })

  it('parses comma decimals and empty input', () => {
    expect(parseConverterInput('1,5')).toBe(1.5)
    expect(parseConverterInput('')).toBeNull()
    expect(parseConverterInput('abc')).toBeNull()
  })

  it('formats small and large values without trailing zeros', () => {
    expect(formatConverterValue(0)).toBe('0')
    expect(formatConverterValue(1.5)).toBe('1.5')
    expect(formatConverterValue(0.000001)).toBe('0.000001')
  })
})
