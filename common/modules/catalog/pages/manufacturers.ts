import type {
  CatalogCategory,
  CatalogFilterOption,
  CatalogManufacturer,
  CatalogManufacturersPageMeta,
  CatalogManufacturersResponse,
} from './types'
import { CATALOG_CATEGORY_DEFINITIONS } from './catalog-categories'
import { getCatalogCategoryTabs } from './category-tabs'

export const CATALOG_MANUFACTURERS_PAGE_META: CatalogManufacturersPageMeta = {
  title: 'Производители ASIC',
  subtitle:
    'Помогаем выбрать производителя, где вы можете выбрать лучший асик',
  totalReviews: 4573,
  categorySlug: 'equipment-manufacturers',
}

export const CATALOG_CATEGORY_TABS = getCatalogCategoryTabs(
  'equipment-manufacturers',
  CATALOG_CATEGORY_DEFINITIONS,
)

export const CATALOG_MANUFACTURER_ALGORITHM_FILTERS: CatalogFilterOption[] = [
  { id: 'blake2b-sha3', label: 'Blake2B+SHA3' },
  { id: 'blake2b-sia', label: 'Blake2B-Sia' },
  { id: 'blake2s', label: 'Blake2S' },
  { id: 'cryptonightr', label: 'CryptoNightR' },
  { id: 'cryptonight', label: 'CryptoNight' },
  { id: 'eaglesong', label: 'Eaglesong' },
  { id: 'equihash', label: 'Equihash' },
  { id: 'ethash', label: 'Ethash' },
  { id: 'kawpow', label: 'KawPow' },
  { id: 'lbry', label: 'LBRY' },
  { id: 'randomx', label: 'RandomX' },
  { id: 'scrypt', label: 'Scrypt' },
  { id: 'sha-256', label: 'SHA-256' },
  { id: 'x11', label: 'X11' },
]

export const CATALOG_MANUFACTURER_MODEL_COUNT_FILTERS: CatalogFilterOption[] = [
  { id: '10', label: '10' },
  { id: '11', label: '11' },
  { id: '12', label: '12' },
  { id: '13', label: '13' },
  { id: '14', label: '14' },
  { id: '15', label: '15' },
  { id: '16', label: '16' },
  { id: '17', label: '17' },
  { id: '18', label: '18' },
  { id: '19', label: '19' },
  { id: '20', label: '20' },
]

export const CATALOG_MANUFACTURER_MARKET_AGE_FILTERS: CatalogFilterOption[] = [
  { id: 'over-3y', label: 'Больше 3 лет' },
  { id: 'under-1y', label: 'До 1 года' },
  { id: '1-to-3y', label: 'От 1 до 3 лет' },
]

export const CATALOG_MANUFACTURERS_FALLBACK: CatalogManufacturer[] = [
  {
    id: 1,
    name: 'INNOSILICON',
    slug: 'innosilicon',
    logoUrl:
      'https://top-mining.ru/wp-content/uploads/2024/08/innosilicon-90x90-1.png',
    rating: 0,
    reviewCount: 0,
    href: 'https://top-mining.ru/asic-manufacturer/corporation-innosilicon/',
    foundedYear: 2006,
    modelsCount: 12,
    algorithms: ['sha-256', 'scrypt', 'equihash', 'blake2s'],
  },
  {
    id: 2,
    name: 'IBELINK',
    slug: 'ibelink',
    logoUrl:
      'https://top-mining.ru/wp-content/uploads/2024/08/ibelink-90x90-1.png',
    rating: 0,
    reviewCount: 0,
    href: 'https://top-mining.ru/asic-manufacturer/ibelink/',
    foundedYear: 2018,
    modelsCount: 10,
    algorithms: ['blake2b-sha3', 'blake2b-sia', 'sha-256'],
  },
  {
    id: 3,
    name: 'GOLDSHELL',
    slug: 'goldshell',
    logoUrl:
      'https://top-mining.ru/wp-content/uploads/2024/08/goldshell-1.png',
    rating: 0,
    reviewCount: 0,
    href: 'https://top-mining.ru/asic-manufacturer/corporation-goldshell/',
    foundedYear: 2017,
    modelsCount: 14,
    algorithms: ['sha-256', 'scrypt', 'eaglesong', 'kawpow'],
  },
  {
    id: 4,
    name: 'CANAAN',
    slug: 'canaan',
    logoUrl:
      'https://top-mining.ru/wp-content/uploads/2024/08/canaan-1.png',
    rating: 0,
    reviewCount: 0,
    href: 'https://top-mining.ru/asic-manufacturer/canaan-corporation/',
    foundedYear: 2015,
    modelsCount: 11,
    algorithms: ['sha-256', 'blake2s'],
  },
  {
    id: 5,
    name: 'BITMAIN',
    slug: 'bitmain',
    logoUrl:
      'https://top-mining.ru/wp-content/uploads/2024/08/bitmain-1.png',
    rating: 4.9,
    reviewCount: 0,
    href: 'https://top-mining.ru/asic-manufacturer/bitmain-corporation/',
    foundedYear: 2013,
    modelsCount: 20,
    algorithms: ['sha-256', 'scrypt', 'equihash'],
  },
  {
    id: 6,
    name: 'MicroBT',
    slug: 'microbt',
    logoUrl:
      'https://top-mining.ru/wp-content/uploads/2024/08/microbt-1.png',
    rating: 4.8,
    reviewCount: 0,
    href: 'https://top-mining.ru/asic-manufacturer/microbt-corporation/',
    foundedYear: 2016,
    modelsCount: 18,
    algorithms: ['sha-256'],
  },
  {
    id: 7,
    name: 'IceRiver',
    slug: 'iceriver',
    logoUrl:
      'https://top-mining.ru/wp-content/uploads/2024/08/iceriver-1-1.png',
    rating: 0,
    reviewCount: 0,
    href: 'https://top-mining.ru/asic-manufacturer/iceriver-corporation/',
    foundedYear: 2021,
    modelsCount: 10,
    algorithms: ['blake2b-sha3', 'kawpow'],
  },
  {
    id: 8,
    name: 'Jasminer',
    slug: 'jasminer',
    logoUrl:
      'https://top-mining.ru/wp-content/uploads/2024/08/jasminer-1.png',
    rating: 0,
    reviewCount: 0,
    href: 'https://top-mining.ru/asic-manufacturer/corporation-jasminer/',
    foundedYear: 2016,
    modelsCount: 12,
    algorithms: ['ethash', 'eaglesong'],
  },
  {
    id: 9,
    name: 'SealMiner',
    slug: 'sealminer',
    logoUrl: 'https://top-mining.ru/wp-content/uploads/2025/11/1.png',
    rating: 0,
    reviewCount: 0,
    href: 'https://top-mining.ru/asic-manufacturer/sealminer/',
    foundedYear: 2023,
    modelsCount: 10,
    algorithms: ['sha-256'],
  },
  {
    id: 10,
    name: 'ElphaPex',
    slug: 'elphapex',
    logoUrl: '/images/catalog/elphapex.png',
    rating: 0,
    reviewCount: 0,
    href: 'https://top-mining.ru/asic-manufacturer/elphapex/',
    foundedYear: 2020,
    modelsCount: 11,
    algorithms: ['scrypt', 'lbry'],
  },
  {
    id: 11,
    name: 'VolcMiner',
    slug: 'volcminer',
    logoUrl: '/images/catalog/volcminer.png',
    rating: 0,
    reviewCount: 0,
    href: 'https://top-mining.ru/asic-manufacturer/volcminer/',
    foundedYear: 2019,
    modelsCount: 13,
    algorithms: ['sha-256', 'blake2s'],
  },
  {
    id: 12,
    name: 'Fluminer',
    slug: 'fluminer',
    logoUrl: '/images/catalog/fluminer.png',
    rating: 0,
    reviewCount: 0,
    href: 'https://top-mining.ru/asic-manufacturer/fluminer/',
    foundedYear: 2022,
    modelsCount: 10,
    algorithms: ['sha-256', 'randomx'],
  },
  {
    id: 13,
    name: 'Bombax',
    slug: 'bombax',
    logoUrl: '/images/catalog/volcminer.png',
    rating: 0,
    reviewCount: 0,
    href: 'https://top-mining.ru/asic-manufacturer/bombax/',
    foundedYear: 2021,
    modelsCount: 10,
    algorithms: ['sha-256'],
  },
  {
    id: 14,
    name: 'StrongU',
    slug: 'strongu',
    logoUrl:
      'https://top-mining.ru/wp-content/uploads/2024/08/strongu-90x90-1.png',
    rating: 0,
    reviewCount: 0,
    href: 'https://top-mining.ru/asic-manufacturer/strongu/',
    foundedYear: 2018,
    modelsCount: 15,
    algorithms: ['sha-256', 'x11', 'cryptonight'],
  },
  {
    id: 15,
    name: 'PandaMiner',
    slug: 'pandaminer',
    logoUrl:
      'https://top-mining.ru/wp-content/uploads/2024/08/pandaminer-90x90-1.png',
    rating: 0,
    reviewCount: 0,
    href: 'https://top-mining.ru/asic-manufacturer/pandaminer/',
    foundedYear: 2017,
    modelsCount: 12,
    algorithms: ['ethash', 'equihash'],
  },
  {
    id: 16,
    name: 'Ebang',
    slug: 'ebang',
    logoUrl:
      'https://top-mining.ru/wp-content/uploads/2024/08/ebang-90x90-1.png',
    rating: 0,
    reviewCount: 0,
    href: 'https://top-mining.ru/asic-manufacturer/ebang/',
    foundedYear: 2010,
    modelsCount: 16,
    algorithms: ['sha-256', 'cryptonightr'],
  },
]

export function applyCatalogReviewStatsToManufacturers(
  manufacturers: CatalogManufacturer[],
  categories: CatalogCategory[],
): CatalogManufacturer[] {
  const equipmentOrganizations =
    categories.find((category) => category.slug === 'equipment-manufacturers')
      ?.organizations ?? []

  const bySlug = new Map(
    equipmentOrganizations
      .filter((organization) => organization.slug)
      .map((organization) => [organization.slug!, organization]),
  )

  const byName = new Map(
    equipmentOrganizations.map((organization) => [
      organization.name.trim().toLowerCase(),
      organization,
    ]),
  )

  return manufacturers.map((manufacturer) => {
    const organization =
      bySlug.get(manufacturer.slug)
      || byName.get(manufacturer.name.trim().toLowerCase())

    if (!organization) {
      return manufacturer
    }

    return {
      ...manufacturer,
      rating: organization.rating,
      reviewCount: organization.reviewCount,
    }
  })
}

export function buildCatalogManufacturersResponse(): CatalogManufacturersResponse {
  return {
    source: 'fallback',
    updatedAt: new Date().toISOString(),
    meta: CATALOG_MANUFACTURERS_PAGE_META,
    categoryTabs: CATALOG_CATEGORY_TABS,
    algorithmFilters: CATALOG_MANUFACTURER_ALGORITHM_FILTERS,
    modelCountFilters: CATALOG_MANUFACTURER_MODEL_COUNT_FILTERS,
    marketAgeFilters: CATALOG_MANUFACTURER_MARKET_AGE_FILTERS,
    manufacturers: CATALOG_MANUFACTURERS_FALLBACK,
  }
}

export function getManufacturerMarketAge(
  foundedYear: number | null,
  currentYear = new Date().getFullYear(),
): 'under-1y' | '1-to-3y' | 'over-3y' | null {
  if (foundedYear == null) {
    return null
  }

  const age = currentYear - foundedYear

  if (age < 1) {
    return 'under-1y'
  }

  if (age <= 3) {
    return '1-to-3y'
  }

  return 'over-3y'
}
