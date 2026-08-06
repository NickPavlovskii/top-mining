import type {
  CatalogOrganizationDetail,
  CatalogOrganizationLegalProfile,
  CatalogOrganizationMiningHotel,
  CatalogOrganizationPaymentTerms,
} from '~/common/modules/catalog'
import { organizationContentEn } from '~/common/modules/i18n/organization-content-en'
import type { TopMiningLocale } from '~/common/modules/top-mining/layout/locale'

function mergeMiningHotel(
  current: CatalogOrganizationMiningHotel | null,
  localized: NonNullable<(typeof organizationContentEn)[string]['miningHotel']> | undefined,
): CatalogOrganizationMiningHotel | null {
  if (!current || !localized) {
    return current
  }

  return {
    ...current,
    pricePerKwhLabel: localized.pricePerKwhLabel ?? current.pricePerKwhLabel,
    siteCities: localized.siteCities ?? current.siteCities,
    minDevicesLabel: localized.minDevicesLabel ?? current.minDevicesLabel,
    energyType: localized.energyType ?? current.energyType,
    extras: localized.extras ?? current.extras,
  }
}

function mergePaymentTerms(
  current: CatalogOrganizationPaymentTerms | null,
  localized: NonNullable<(typeof organizationContentEn)[string]['paymentTerms']> | undefined,
): CatalogOrganizationPaymentTerms | null {
  if (!current || !localized) {
    return current
  }

  return {
    ...current,
    paymentMethods: localized.paymentMethods ?? current.paymentMethods,
    paymentFormats: localized.paymentFormats ?? current.paymentFormats,
    extraTerms: localized.extraTerms ?? current.extraTerms,
    contractForms: localized.contractForms ?? current.contractForms,
  }
}

function mergeLegalProfile(
  current: CatalogOrganizationLegalProfile | null,
  localized: NonNullable<(typeof organizationContentEn)[string]['legalProfile']> | undefined,
): CatalogOrganizationLegalProfile | null {
  if (!current || !localized) {
    return current
  }

  return {
    ...current,
    legalName: localized.legalName ?? current.legalName,
    primaryActivity: localized.primaryActivity ?? current.primaryActivity,
    legalAddress: localized.legalAddress ?? current.legalAddress,
    authorizedCapital: localized.authorizedCapital ?? current.authorizedCapital,
    reliability: localized.reliability ?? current.reliability,
    defendantCases: localized.defendantCases ?? current.defendantCases,
    revenue: localized.revenue ?? current.revenue,
    profit: localized.profit ?? current.profit,
    taxDebt: localized.taxDebt ?? current.taxDebt,
    inSanctionsLists: localized.inSanctionsLists ?? current.inSanctionsLists,
    sanctionsRestrictions:
      localized.sanctionsRestrictions ?? current.sanctionsRestrictions,
  }
}

/**
 * Подставляет EN-поля карточки организации по slug, если есть перевод.
 */
export function localizeOrganizationDetail(
  organization: CatalogOrganizationDetail,
  locale: TopMiningLocale,
): CatalogOrganizationDetail {
  if (locale !== 'en') {
    return organization
  }

  const localized = organizationContentEn[organization.slug]
  if (!localized) {
    return organization
  }

  return {
    ...organization,
    tagline: localized.tagline ?? organization.tagline,
    pageTitle: localized.pageTitle ?? organization.pageTitle,
    aboutHtml: localized.aboutHtml ?? organization.aboutHtml,
    cardTags: localized.cardTags ?? organization.cardTags,
    cardFeatures: localized.cardFeatures ?? organization.cardFeatures,
    miningHotel: mergeMiningHotel(organization.miningHotel, localized.miningHotel),
    paymentTerms: mergePaymentTerms(
      organization.paymentTerms,
      localized.paymentTerms,
    ),
    legalProfile: mergeLegalProfile(
      organization.legalProfile,
      localized.legalProfile,
    ),
  }
}

export function useLocalizedOrganization() {
  const { locale } = useTopMiningLocale()

  function localize(organization: CatalogOrganizationDetail): CatalogOrganizationDetail {
    return localizeOrganizationDetail(organization, locale.value)
  }

  return {
    locale,
    localize,
  }
}
