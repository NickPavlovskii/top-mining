/** @typedef {import('@playwright/test').Page} Page */

import {
  mockArticleDetailResponse,
  mockArticlesCatalogResponse,
  mockArticlesFeedResponse,
  mockCalculatorCoins,
  mockCalculatorHardware,
  mockCatalogManufacturersResponse,
  mockCatalogResponse,
  mockCryptoResponse,
  mockOrganizationDetailResponse,
  mockOrganizationReviewsResponse,
  mockPodborOffers,
  mockRatingsResponse,
} from './fixtures.js'

/**
 * Мокаем только Nitro `/api/...` — явные пути, без широкого glob по api.
 * @param {Page} page
 */
export async function installApiMocks(page) {
  const fulfillJson = (route, body) =>
    route.fulfill({
      status: 200,
      contentType: 'application/json',
      body: JSON.stringify(body),
    })

  await page.route('**/api/catalog/manufacturers', (route) =>
    fulfillJson(route, mockCatalogManufacturersResponse()),
  )

  await page.route('**/api/catalog', (route) => {
    if (route.request().url().includes('/organizations/')) {
      return route.continue()
    }
    return fulfillJson(route, mockCatalogResponse())
  })

  await page.route('**/api/calculator/hardware', (route) =>
    fulfillJson(route, mockCalculatorHardware()),
  )

  await page.route('**/api/calculator/coins', (route) =>
    fulfillJson(route, mockCalculatorCoins()),
  )

  await page.route('**/api/ratings/home', (route) =>
    fulfillJson(route, mockRatingsResponse()),
  )

  await page.route('**/api/ratings', (route) => {
    if (route.request().url().includes('/home')) {
      return route.continue()
    }
    return fulfillJson(route, mockRatingsResponse())
  })

  await page.route(/\/api\/catalog\/organizations\/[^/]+\/reviews(\?|$)/, (route) =>
    fulfillJson(route, mockOrganizationReviewsResponse()),
  )

  await page.route(/\/api\/catalog\/organizations\/[^/?]+(\?|$)/, (route) =>
    fulfillJson(route, mockOrganizationDetailResponse()),
  )

  await page.route(/\/api\/articles\/catalog(\?|$)/, (route) =>
    fulfillJson(route, mockArticlesCatalogResponse()),
  )

  await page.route(/\/api\/articles(\?|$)/, (route) =>
    fulfillJson(route, mockArticlesFeedResponse()),
  )

  await page.route(/\/api\/articles\/[^/?]+(\?|$)/, (route) =>
    fulfillJson(route, mockArticleDetailResponse()),
  )

  await page.route('**/api/crypto', (route) =>
    fulfillJson(route, mockCryptoResponse()),
  )

  await page.route('**/api/podbor/placement', (route) =>
    fulfillJson(route, mockPodborOffers()),
  )

  await page.route('**/api/podbor/sale', (route) =>
    fulfillJson(route, mockPodborOffers()),
  )
}
