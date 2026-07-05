import { CATALOG_FALLBACK } from './fallback'
import type { CatalogCategory, CatalogOrganization, CatalogResponse } from '~/types/catalog'

const FALLBACK_ORGS_BY_SLUG = new Map<string, CatalogOrganization>()
const FALLBACK_ORGS_BY_ID = new Map<number, CatalogOrganization>()

for (const category of CATALOG_FALLBACK.categories) {
  for (const organization of category.organizations) {
    FALLBACK_ORGS_BY_ID.set(organization.id, organization)

    if (organization.slug) {
      FALLBACK_ORGS_BY_SLUG.set(organization.slug, organization)
    }
  }
}

function mergeOrganization(
  organization: CatalogOrganization,
): CatalogOrganization {
  const fallback =
    (organization.slug && FALLBACK_ORGS_BY_SLUG.get(organization.slug))
    || FALLBACK_ORGS_BY_ID.get(organization.id)

  if (!fallback) {
    return organization
  }

  return {
    ...fallback,
    ...organization,
    cardTags: organization.cardTags?.length
      ? organization.cardTags
      : fallback.cardTags,
    cardFeatures: organization.cardFeatures?.length
      ? organization.cardFeatures
      : fallback.cardFeatures,
    cardPromo: organization.cardPromo ?? fallback.cardPromo,
    logoTheme: organization.logoTheme ?? fallback.logoTheme,
    verification: organization.verification ?? fallback.verification,
    foundedYear: organization.foundedYear ?? fallback.foundedYear,
    hasPublicRating:
      organization.hasPublicRating ?? fallback.hasPublicRating,
    slug: organization.slug ?? fallback.slug,
    href: organization.href || fallback.href,
    logoUrl: organization.logoUrl || fallback.logoUrl,
    officeCity: organization.officeCity ?? fallback.officeCity,
    siteCity: organization.siteCity ?? fallback.siteCity,
  }
}

export function mergeCatalogWithFallback(
  catalog: Omit<CatalogResponse, 'source' | 'updatedAt'>,
): Omit<CatalogResponse, 'source' | 'updatedAt'> {
  const mergedBySlug = new Map(
    catalog.categories.map((category) => [
      category.slug,
      mergeCatalogCategory(category),
    ]),
  )

  for (const fallbackCategory of CATALOG_FALLBACK.categories) {
    if (!mergedBySlug.has(fallbackCategory.slug)) {
      mergedBySlug.set(
        fallbackCategory.slug,
        mergeCatalogCategory(fallbackCategory),
      )
    }
  }

  const categories = CATALOG_FALLBACK.categories
    .map((category) => mergedBySlug.get(category.slug))
    .filter((category): category is CatalogCategory => Boolean(category))

  for (const category of mergedBySlug.values()) {
    if (!categories.some((item) => item.slug === category.slug)) {
      categories.push(category)
    }
  }

  return {
    ...catalog,
    categories,
  }
}

function mergeCatalogCategory(
  category: CatalogCategory,
): CatalogCategory {
  return {
    ...category,
    organizations: category.organizations.map((organization) =>
      mergeOrganization(organization),
    ),
  }
}
