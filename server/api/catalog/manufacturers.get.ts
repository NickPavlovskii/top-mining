import { buildCatalogManufacturersResponse } from '~/common/modules/catalog/manufacturers-page'

export default defineEventHandler(() => {
  return buildCatalogManufacturersResponse()
})
