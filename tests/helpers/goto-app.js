/** @typedef {import('@playwright/test').Page} Page */

import { installApiMocks } from './install-api-mocks.js'

/**
 * @param {Page} page
 * @param {string} path
 * @param {{ mockApi?: boolean }} [options]
 */
export async function gotoApp(page, path, options = {}) {
  const { mockApi = true } = options

  if (mockApi) {
    await installApiMocks(page)
  }

  const normalized = path.startsWith('/') ? path : `/${path}`
  await page.goto(normalized, { waitUntil: 'load' })
  await page.locator('header .top-mining__logo').waitFor({
    state: 'visible',
    timeout: 30_000,
  })
}
