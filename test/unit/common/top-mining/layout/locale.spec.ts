import { describe, expect, it } from 'vitest'

import {
  isTopMiningLocale,
  normalizeTopMiningLocale,
  TOP_MINING_DEFAULT_LOCALE,
  TOP_MINING_LOCALE_OPTIONS,
} from '~/common/modules/top-mining/layout/locale'

describe('top-mining locale', () => {
  it('accepts only ru and en', () => {
    expect(isTopMiningLocale('ru')).toBe(true)
    expect(isTopMiningLocale('en')).toBe(true)
    expect(isTopMiningLocale('de')).toBe(false)
    expect(isTopMiningLocale(null)).toBe(false)
  })

  it('normalizes unknown values to default ru', () => {
    expect(normalizeTopMiningLocale('en')).toBe('en')
    expect(normalizeTopMiningLocale('xx')).toBe(TOP_MINING_DEFAULT_LOCALE)
    expect(TOP_MINING_LOCALE_OPTIONS.map((item) => item.code)).toEqual([
      'ru',
      'en',
    ])
  })
})
