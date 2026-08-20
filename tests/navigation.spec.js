import { test, expect } from '@playwright/test'
import { gotoApp } from './helpers/index.js'

test.describe('Навигация по сайту', () => {
  test('шапка содержит основные разделы', async ({ page }) => {
    await gotoApp(page, '/')
    const nav = page.getByRole('navigation', { name: 'Навигация по разделам' })
    await expect(nav).toBeVisible()
    await expect(nav.getByRole('link', { name: 'Каталог организаций' })).toBeVisible()
    await expect(nav.getByRole('link', { name: 'Рейтинги в майнинге' })).toBeVisible()
    await expect(nav.getByRole('link', { name: 'Майнинг-калькулятор' })).toBeVisible()
    await expect(nav.getByRole('link', { name: 'Статьи в майнинге' })).toBeVisible()
  })

  test('переход в калькулятор', async ({ page }) => {
    await gotoApp(page, '/calculator')
    await expect(page).toHaveURL(/\/calculator/)
    await expect(page.getByRole('heading', { name: /КАЛЬКУЛЯТОР/i }).first()).toBeVisible()
  })

  test('переход в каталог', async ({ page }) => {
    await gotoApp(page, '/asic-manufacturers/?category=all')
    await expect(page.locator('main h1')).toHaveText('Каталог организаций')
  })

  test('переход в рейтинги', async ({ page }) => {
    await gotoApp(page, '/rating')
    await expect(page).toHaveURL(/\/rating/)
    await expect(page.locator('.ratings-page')).toBeVisible()
  })

  test('переход в статьи', async ({ page }) => {
    await gotoApp(page, '/articles')
    await expect(page.getByRole('heading', { name: /Интересные/i })).toBeVisible()
  })
})
