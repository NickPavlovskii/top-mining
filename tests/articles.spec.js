import { test, expect } from '@playwright/test'
import { gotoApp } from './helpers/index.js'

test.describe('Статьи', () => {
  test.beforeEach(async ({ page }) => {
    await gotoApp(page, '/articles')
  })

  test('отображает hero и фильтр тем', async ({ page }) => {
    await expect(page.getByRole('heading', { name: /Интересные/i })).toBeVisible()
    await expect(page.getByRole('tablist', { name: 'Темы статей' })).toBeVisible()
    await expect(page.getByRole('tab', { name: 'Все', exact: true })).toBeVisible()
  })

  test('переключает вид списка', async ({ page }) => {
    await expect(page.getByRole('button', { name: 'Сетка' })).toBeVisible()
    await expect(page.getByRole('button', { name: 'Список' })).toBeVisible()
  })
})
