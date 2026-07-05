export interface CatalogOrganizationVerification {
  contracts: boolean
  legalEntity: boolean
  miningRegistry?: boolean
}

export interface CatalogOrganization {
  id: number
  name: string
  slug?: string
  logoUrl: string
  rating: number
  reviewCount: number
  href?: string
  foundedYear?: number | null
  minAsicPlacement?: number | null
  hasPublicRating?: boolean
  verification?: CatalogOrganizationVerification
  cardTags?: string[]
  cardFeatures?: string[]
  cardPromo?: string
  logoTheme?: 'light' | 'dark'
  officeCity?: string | null
  siteCity?: string | null
}

export interface CatalogCategory {
  id: number
  name: string
  slug: string
  href: string
  organizations: CatalogOrganization[]
}

export interface CatalogMeta {
  totalReviews: number
  subtitle: string
}

export interface CatalogResponse {
  source: 'graphql' | 'fallback'
  updatedAt: string
  meta: CatalogMeta
  categories: CatalogCategory[]
}
