import { test, expect } from '@playwright/test'
import { gotoApp } from './helpers/index.js'

test.describe('Главная страница', () => {
  test.beforeEach(async ({ page }) => {
    await gotoApp(page, '/')
  })

  test('отображает шапку и основные секции', async ({ page }) => {
    await expect(page.locator('header .top-mining__logo')).toBeVisible()
    await expect(page.getByRole('main').getByText('Криптовалюта', { exact: true })).toBeVisible()
    await expect(page.getByRole('main').getByText('сейчас', { exact: true })).toBeVisible()
    await expect(page.getByText('Калькулятор доходности').first()).toBeVisible()
    await expect(page.getByText('Рейтинги в майнинге').first()).toBeVisible()
  })

  test('показывает блок «Чем полезен ТОП майнинг»', async ({ page }) => {
    await expect(page.getByText('Чем полезен')).toBeVisible()
    await expect(page.getByText('ТОП майнинг')).toBeVisible()
  })

  test('отображает секцию каталога', async ({ page }) => {
    await expect(page.getByRole('main').getByText('Каталог', { exact: true })).toBeVisible()
    await expect(page.getByRole('main').getByText('организаций', { exact: true })).toBeVisible()
  })
})
