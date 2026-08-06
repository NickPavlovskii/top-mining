import { describe, expect, it } from 'vitest'
import { createTranslate } from '~/common/modules/i18n/resolve'
import { i18nCatalogs } from '~/common/modules/i18n/messages'

describe('i18n resolve', () => {
  it('returns Russian by default catalog', () => {
    const t = createTranslate('ru', i18nCatalogs)
    expect(t('footer.send')).toBe('Отправить')
    expect(t('navItem.ASIC-майнеры')).toBe('ASIC-майнеры')
  })

  it('switches nav and calculator strings to English', () => {
    const t = createTranslate('en', i18nCatalogs)
    expect(t('footer.send')).toBe('Send')
    expect(t('navItem.ASIC-майнеры')).toBe('ASIC miners')
    expect(t('calculator.calculate')).toBe('Calculate')
    expect(t('home.heroCatalogTitle')).toBe('Organization catalog')
    expect(t('crypto.popular')).toBe('Popular coins')
    expect(t('catalog.title1')).toBe('Catalog')
    expect(t('orgDetail.equipmentSales')).toBe('Equipment sales')
    expect(t('reviewSort.newest')).toBe('Newest')
    expect(t('catalog.notFoundDescription')).toContain('catalog')
    expect(t('ratingTitle.ТОП: Техника и оборудование')).toBe(
      'TOP: Hardware & equipment',
    )
  })
})
