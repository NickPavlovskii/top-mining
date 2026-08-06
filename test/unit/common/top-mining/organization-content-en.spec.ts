import { describe, expect, it } from 'vitest'
import { localizeOrganizationDetail } from '~/composables/useLocalizedOrganization'
import type { CatalogOrganizationDetail } from '~/common/modules/catalog'

function baseOrg(
  overrides: Partial<CatalogOrganizationDetail> = {},
): CatalogOrganizationDetail {
  return {
    id: 1,
    slug: '1-mining',
    name: '1-MINING',
    categorySlug: 'mining-hotels',
    categoryName: 'Майнинг-отели',
    tagline: 'Производитель контейнеров для майнинга и майнинг-отель',
    pageTitle: '1-MINING',
    logoUrl: '/images/catalog/1-mining.png',
    detailLogoUrl: '/images/catalog/1-mining-detail.png',
    aboutHtml: '<p>RU about</p>',
    rating: 0,
    reviewCount: 0,
    hasPublicRating: false,
    verification: {
      contracts: false,
      legalEntity: true,
    },
    showGallery: false,
    showArticleBlock: false,
    ...overrides,
  } as CatalogOrganizationDetail
}

describe('localizeOrganizationDetail', () => {
  it('keeps Russian copy for ru locale', () => {
    const org = baseOrg()
    const result = localizeOrganizationDetail(org, 'ru')
    expect(result.tagline).toBe(org.tagline)
    expect(result.aboutHtml).toBe(org.aboutHtml)
  })

  it('applies English copy for known slug', () => {
    const org = baseOrg({
      miningHotel: {
        pricePerKwhFrom: 5,
        pricePerKwhLabel: 'от 5 руб с НДС',
        sitesCount: 1,
        totalCapacityMw: 19,
        siteCities: 'Ленинградская обл.',
        minDevicesLabel: 'от 300 кВт',
        energyType: 'Своя генерация на ГПУ на магистрального газа',
      },
      paymentTerms: {
        paymentMethods: ['Наличными', 'Безналичная'],
        paymentFormats: [],
        extraTerms: ['Частичная предоплата'],
        contractForms: ['Договор с ООО'],
      },
      legalProfile: {
        legalName: 'ООО "Профстандарт"',
        primaryActivity: 'Производство...',
        ogrn: '1089847327250',
        inn: '7804397790',
        registeredAt: '2008-08-19',
        legalAddress: 'Санкт-Петербург',
        authorizedCapital: '20 000 руб.',
        reliability: 'ВЫСОКАЯ',
        defendantCases: '',
        revenue: '',
        profit: '',
        taxDebt: '',
        inSanctionsLists: '',
        sanctionsRestrictions: '',
      },
    })
    const result = localizeOrganizationDetail(org, 'en')
    expect(result.tagline).toBe('Mining container manufacturer and mining hotel')
    expect(result.aboutHtml).toContain('North-West')
    expect(result.aboutHtml).not.toContain('RU about')
    expect(result.miningHotel?.pricePerKwhLabel).toBe('from 5 RUB incl. VAT')
    expect(result.miningHotel?.siteCities).toBe('Leningrad Region')
    expect(result.miningHotel?.minDevicesLabel).toBe('from 300 kW')
    expect(result.miningHotel?.energyType).toContain('gas-piston')
    expect(result.paymentTerms?.paymentMethods).toEqual(['Cash', 'Bank transfer'])
    expect(result.paymentTerms?.extraTerms).toEqual(['Partial prepayment'])
    expect(result.legalProfile?.reliability).toBe('HIGH')
    expect(result.legalProfile?.legalName).toBe('LLC "Profstandart"')
  })

  it('leaves unknown slugs unchanged in en', () => {
    const org = baseOrg({ slug: 'unknown-org', aboutHtml: '<p>RU</p>' })
    const result = localizeOrganizationDetail(org, 'en')
    expect(result.aboutHtml).toBe('<p>RU</p>')
  })
})
