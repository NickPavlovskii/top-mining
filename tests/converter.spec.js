import { test, expect } from '@playwright/test'
import { gotoApp } from './helpers/index.js'

test.describe('Конвертер хешрейта', () => {
  test.beforeEach(async ({ page }) => {
    await gotoApp(page, '/konverter-heshrejta')
  })

  test('отображает hero и виджет конвертера', async ({ page }) => {
    await expect(page.getByRole('heading', { name: /Конвертер/i }).first()).toBeVisible()
    await expect(page.getByText('хешрейта').first()).toBeVisible()
    await expect(
      page.locator('.hashrate-converter').first(),
    ).toBeVisible()
  })

  test('показывает FAQ', async ({ page }) => {
    await expect(
      page.getByText('ЧАСТО ЗАДАВАЕМЫЕ ВОПРОСЫ О КАЛЬКУЛЯТОРЕ ХЕШРЕЙТА'),
    ).toBeVisible()
  })
})
