import { test, expect } from '@playwright/test'
import { gotoApp } from './helpers/index.js'

test.describe('Контакты', () => {
  test.beforeEach(async ({ page }) => {
    await gotoApp(page, '/contacts', { mockApi: false })
  })

  test('отображает заголовок и каналы связи', async ({ page }) => {
    await expect(page.locator('main h1')).toHaveText('Контакты')
    await expect(page.getByText('Телефон:')).toBeVisible()
    await expect(page.getByRole('main').getByRole('link', { name: '+7 495 492-78-99' })).toBeVisible()
    await expect(page.getByRole('main').getByRole('link', { name: 'info@top-mining.ru' })).toBeVisible()
    await expect(page.getByText('Каширское шоссе, 16, Москва')).toBeVisible()
  })
})
