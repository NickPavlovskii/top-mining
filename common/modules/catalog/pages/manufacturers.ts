/**
 * Папка pages — данные списков каталога.
 * Производители из БД (категория equipment-manufacturers) и сборка ответа.
 */
import type {
  CatalogCategory,
  CatalogFilterOption,
  CatalogManufacturer,
  CatalogManufacturersPageMeta,
  CatalogManufacturersResponse,
  CatalogOrganization,
} from '../types'
import { CATALOG_CATEGORY_DEFINITIONS } from '../nav/categories'
import { getCatalogCategoryTabs } from '../nav/tabs'

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

function slugifyManufacturerName(name: string): string {
  return name
    .trim()
    .toLowerCase()
    .replace(/[^a-z0-9а-яё]+/gi, '-')
    .replace(/^-+|-+$/g, '')
}

export function mapCatalogOrganizationsToManufacturers(
  organizations: CatalogOrganization[],
): CatalogManufacturer[] {
  return organizations.map((organization) => {
    const slug =
      organization.slug?.trim()
      || slugifyManufacturerName(organization.name)
      || String(organization.id)

    return {
      id: organization.id,
      name: organization.name,
      slug,
      logoUrl: organization.logoUrl || '',
      rating: organization.rating,
      reviewCount: organization.reviewCount,
      href: `/asic-manufacturers/${slug}/`,
      foundedYear: organization.foundedYear ?? null,
      modelsCount: 0,
      algorithms: [],
    }
  })
}

export function manufacturersFromCatalogCategories(
  categories: CatalogCategory[],
): CatalogManufacturer[] {
  const equipment =
    categories.find(
      (category) => category.slug === CATALOG_MANUFACTURERS_PAGE_META.categorySlug,
    )?.organizations ?? []

  return mapCatalogOrganizationsToManufacturers(equipment)
}

export function emptyCatalogManufacturersResponse(): CatalogManufacturersResponse {
  return {
    source: 'api',
    updatedAt: new Date().toISOString(),
    meta: CATALOG_MANUFACTURERS_PAGE_META,
    categoryTabs: CATALOG_CATEGORY_TABS,
    algorithmFilters: CATALOG_MANUFACTURER_ALGORITHM_FILTERS,
    modelCountFilters: CATALOG_MANUFACTURER_MODEL_COUNT_FILTERS,
    marketAgeFilters: CATALOG_MANUFACTURER_MARKET_AGE_FILTERS,
    manufacturers: [],
  }
}

export function buildCatalogManufacturersResponse(
  manufacturers: CatalogManufacturer[] = [],
  source: CatalogManufacturersResponse['source'] = 'api',
): CatalogManufacturersResponse {
  return {
    ...emptyCatalogManufacturersResponse(),
    source,
    updatedAt: new Date().toISOString(),
    manufacturers,
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
