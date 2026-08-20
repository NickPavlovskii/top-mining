import { test, expect } from '@playwright/test'
import { gotoApp } from './helpers/index.js'

test.describe('Рейтинги в майнинге', () => {
  test.beforeEach(async ({ page }) => {
    await gotoApp(page, '/rating')
  })

  test('отображает hero и сетку рейтингов', async ({ page }) => {
    await expect(page.locator('.ratings-page')).toBeVisible()
    await expect(page.getByRole('navigation', { name: 'Хлебные крошки' })).toBeVisible()
  })
})
