import type { CatalogMeta, CatalogResponse } from './types'

export const EMPTY_CATALOG_META: CatalogMeta = {
  totalReviews: 0,
  subtitle: '',
}

export function emptyCatalogResponse(): CatalogResponse {
  return {
    source: 'graphql',
    updatedAt: new Date().toISOString(),
    meta: { ...EMPTY_CATALOG_META },
    categories: [],
  }
}
