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

export interface CatalogSidebarFilterOption {
  id: string
  label: string
  children?: CatalogSidebarFilterOption[]
}

export interface CatalogSidebarFilterGroup {
  id: string
  title: string
  searchable?: boolean
  options: CatalogSidebarFilterOption[]
}

export interface CatalogOrganizationAddress {
  city: string
  addressLine: string
}

export interface CatalogOrganizationGalleryImage {
  imageUrl: string
  imageAlt: string
}

export interface CatalogOrganizationEquipmentSales {
  equipmentType: string
  equipmentCondition: string
  salesVolume: string
  availability: string
  extras: string[]
}

export interface CatalogOrganizationMiningHotel {
  pricePerKwhFrom: number | null
  pricePerKwhLabel: string
  sitesCount: number | null
  totalCapacityMw: number | null
  siteCities: string
  minDevicesLabel: string
  energyType: string
  extras?: string[]
}

export interface CatalogOrganizationMiningPool {
  mobileApp: string
  referralProgram: string
  totalHashrate: string
  rewardDistribution: string
  poolCommission: string
  minPayout: string
  payoutFrequency: string
  minedCoins: string
}

export interface CatalogOrganizationCryptoExchange {
  tradingPairsLabel: string
  coinsCountLabel: string
  verificationType: string
  liquidityCoefficient: number | null
  spotMarkets: number | null
  supportedCurrencies: string
  makerFee: string
  takerFee: string
  derivativeMarkets: number | null
  extras: string[]
}

export interface CatalogOrganizationCryptoWallet {
  supportedCoins: string
  platform: string
  commission: string
  commissionCalculation: string
  extras: string[]
}

export interface CatalogOrganizationPaymentTerms {
  paymentMethods: string[]
  paymentFormats: string[]
  extraTerms: string[]
  contractForms: string[]
}

export interface CatalogOrganizationLegalProfile {
  legalName: string
  primaryActivity: string
  ogrn: string
  inn: string
  registeredAt: string | null
  legalAddress: string
  authorizedCapital: string
  reliability: string
  defendantCases: string
  revenue: string
  profit: string
  taxDebt: string
  inSanctionsLists: string
  sanctionsRestrictions: string
}

export interface CatalogOrganizationDetail {
  id: number
  slug: string
  name: string
  categorySlug: string
  categoryName: string
  tagline: string
  pageTitle: string
  logoUrl: string
  detailLogoUrl: string | null
  aboutHtml: string
  rating: number
  reviewCount: number
  hasPublicRating: boolean
  foundedYear: number | null
  website: string
  phone: string
  email: string
  workHours: string
  domainRegisteredAt?: string | null
  referralProgramUrl?: string | null
  referralPromoText?: string | null
  verification: Pick<
    CatalogOrganizationVerification,
    'contracts' | 'legalEntity' | 'miningRegistry'
  > & {
    dataCenter?: boolean
  }
  addresses: CatalogOrganizationAddress[]
  gallery: CatalogOrganizationGalleryImage[]
  equipmentSales: CatalogOrganizationEquipmentSales | null
  miningHotel: CatalogOrganizationMiningHotel | null
  miningPool: CatalogOrganizationMiningPool | null
  cryptoExchange: CatalogOrganizationCryptoExchange | null
  cryptoWallet: CatalogOrganizationCryptoWallet | null
  paymentTerms: CatalogOrganizationPaymentTerms | null
  legalProfile: CatalogOrganizationLegalProfile | null
  articleHref: string | null
  showGallery: boolean
  showArticleBlock: boolean
  cardTags: string[]
  cardFeatures: string[]
}

export interface CatalogOrganizationDetailResponse {
  source: 'graphql' | 'fallback'
  updatedAt: string
  organization: CatalogOrganizationDetail | null
}
