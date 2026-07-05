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

export interface CatalogOrganizationVerification {
  contracts: boolean
  legalEntity: boolean
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
  aboutHtml: string
  rating: number
  reviewCount: number
  hasPublicRating: boolean
  foundedYear: number | null
  website: string
  email: string
  workHours: string
  verification: CatalogOrganizationVerification
  addresses: CatalogOrganizationAddress[]
  gallery: CatalogOrganizationGalleryImage[]
  equipmentSales: CatalogOrganizationEquipmentSales | null
  miningHotel: CatalogOrganizationMiningHotel | null
  paymentTerms: CatalogOrganizationPaymentTerms | null
  legalProfile: CatalogOrganizationLegalProfile | null
  cardTags: string[]
  cardFeatures: string[]
}

export interface CatalogOrganizationDetailResponse {
  source: 'api' | 'fallback'
  updatedAt: string
  organization: CatalogOrganizationDetail
}
