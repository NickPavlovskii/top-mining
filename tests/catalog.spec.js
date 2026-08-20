import { test, expect } from '@playwright/test'
import { gotoApp } from './helpers/index.js'

test.describe('Каталог организаций', () => {
  test.beforeEach(async ({ page }) => {
    await gotoApp(page, '/asic-manufacturers/?category=all')
  })

  test('отображает заголовок и поиск', async ({ page }) => {
    await expect(page.locator('main h1')).toHaveText('Каталог организаций')
    await expect(page.getByPlaceholder('Поиск по названию')).toBeVisible()
  })

  test('показывает фильтры каталога', async ({ page }) => {
    await expect(page.getByPlaceholder('Поиск по названию')).toBeVisible()
    await expect(page.getByText('Сортировка')).toBeVisible()
  })

  test('открывает страницу организации в каталоге продаж', async ({ page }) => {
    await gotoApp(page, '/sale_asic/test-miner')
    await expect(page.locator('main.sale-asic-page')).toBeVisible()
  })
})

test.describe('Производители ASIC', () => {
  test('отображает страницу производителей', async ({ page }) => {
    await gotoApp(page, '/asic-manufacturers/?category=equipment-manufacturers')
    await expect(page.locator('main h1')).toHaveText('Производители ASIC')
  })
})
