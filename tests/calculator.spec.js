import { test, expect } from '@playwright/test'
import { gotoApp } from './helpers/index.js'

test.describe('Майнинг-калькулятор', () => {
  test.beforeEach(async ({ page }) => {
    await gotoApp(page, '/calculator')
  })

  test('отображает hero и форму калькулятора', async ({ page }) => {
    await expect(page.getByRole('heading', { name: /КАЛЬКУЛЯТОР/i }).first()).toBeVisible()
    await expect(page.getByRole('heading', { name: /ДОХОДНОСТИ/i }).first()).toBeVisible()
    await expect(
      page.getByRole('region', { name: 'Калькулятор доходности', exact: true }),
    ).toBeVisible()
  })

  test('показывает шаг выбора модели', async ({ page }) => {
    await expect(page.getByText('Выберите модель').first()).toBeVisible()
    await expect(page.getByRole('button', { name: 'Рассчитать' })).toBeVisible()
  })

  test('содержит блок конвертера хешрейта', async ({ page }) => {
    await expect(page.getByText('Конвертер хешрейта').first()).toBeVisible()
    await expect(page.getByRole('link', { name: 'Перейти' }).first()).toBeVisible()
  })
})
