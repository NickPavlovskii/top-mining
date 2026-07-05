export interface CatalogManufacturer {
  id: number
  name: string
  slug: string
  logoUrl: string
  rating: number
  reviewCount: number
  href: string
  foundedYear: number | null
  modelsCount: number
  algorithms: string[]
}

export interface CatalogCategoryTab {
  id: string
  label: string
  href: string
  active?: boolean
}

export interface CatalogFilterOption {
  id: string
  label: string
}

export interface CatalogManufacturersPageMeta {
  title: string
  subtitle: string
  totalReviews: number
  categorySlug: string
}

export interface CatalogManufacturersResponse {
  source: 'api' | 'fallback'
  updatedAt: string
  meta: CatalogManufacturersPageMeta
  categoryTabs: CatalogCategoryTab[]
  algorithmFilters: CatalogFilterOption[]
  modelCountFilters: CatalogFilterOption[]
  marketAgeFilters: CatalogFilterOption[]
  manufacturers: CatalogManufacturer[]
}

export type CatalogManufacturersSort =
  | 'rating-desc'
  | 'rating-asc'
  | 'reviews-desc'
  | 'reviews-asc'
  | 'name-asc'
  | 'name-desc'

export type CatalogManufacturerMarketAge =
  | 'under-1y'
  | '1-to-3y'
  | 'over-3y'
