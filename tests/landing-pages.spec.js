import { test, expect } from '@playwright/test'
import { gotoApp } from './helpers/index.js'

test.describe('Consulting', () => {
  test('отображает hero консалтинга', async ({ page }) => {
    await gotoApp(page, '/consulting', { mockApi: false })
    await expect(page.locator('h1')).toContainText('Консалтинг')
    await expect(page.getByText('Сопровождение ваших инвестиций')).toBeVisible()
  })
})

test.describe('Подбор майнинг-отеля', () => {
  test('отображает hero лендинга', async ({ page }) => {
    await gotoApp(page, '/podbor-majning-otelya', { mockApi: true })
    await expect(page.getByRole('heading', { name: /Нужен/i })).toBeVisible()
    await expect(page.getByText(/отель\?/)).toBeVisible()
    await expect(page.getByText('на 15% дешевле рынка')).toBeVisible()
  })
})

test.describe('Покупка ASIC', () => {
  test('отображает hero лендинга', async ({ page }) => {
    await gotoApp(page, '/asic-majnery-po-czenam-nizhe-rynka', { mockApi: true })
    await expect(
      page.getByRole('heading', { name: 'ХОТИТЕ КУПИТЬ ASIC-МАЙНЕРЫ?' }),
    ).toBeVisible()
  })
})

test.describe('Увеличим ваш доход', () => {
  test('отображает hero лендинга', async ({ page }) => {
    await gotoApp(page, '/uvelichim-vash-dohod', { mockApi: false })
    await expect(
      page.getByRole('heading', { name: /ВЫ МАЙНЕР\?\s*УВЕЛИЧИМ ВАШ ДОХОД/i }),
    ).toBeVisible()
  })
})

test.describe('Строительство дата-центров', () => {
  test('отображает hero лендинга', async ({ page }) => {
    await gotoApp(page, '/data-center-construction', { mockApi: false })
    await expect(
      page.getByRole('heading', {
        name: /СТРОИТЕЛЬСТВО ДАТА-ЦЕНТРОВ ДЛЯ МАЙНИНГА ПОД КЛЮЧ/i,
      }),
    ).toBeVisible()
    await expect(page.getByText('ПОЛНЫЙ ЦИКЛ ОТ ИДЕИ ДО ЗАПУСКА')).toBeVisible()
  })
})
