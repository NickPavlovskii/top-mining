import { test, expect } from '@playwright/test'
import { gotoApp } from './helpers/index.js'

test.describe('Политика конфиденциальности', () => {
  test.beforeEach(async ({ page }) => {
    await gotoApp(page, '/privacy', { mockApi: false })
  })

  test('отображает заголовок и текст политики', async ({ page }) => {
    await expect(
      page.getByRole('heading', {
        name: 'Политика конфиденциальности (обработки персональных данных)',
      }),
    ).toBeVisible()
    await expect(page.getByRole('heading', { name: '1. Общие положения' })).toBeVisible()
  })
})
