import { test, expect } from '@playwright/test'
import { gotoStory, toStoryId } from '../helpers/index.js'

test.describe('Storybook — Документация', () => {
  test('Введение Overview', async ({ page }) => {
    await gotoStory(page, toStoryId('Top Mining/Введение', 'Overview'))
    await expect(page.getByText('Top Mining')).toBeVisible()
  })

  test('Дизайн-токены Palette', async ({ page }) => {
    await gotoStory(page, toStoryId('Top Mining/Дизайн-токены', 'Palette'))
    await expect(page.locator('body')).toContainText(/цвет|color|token/i)
  })

  test('Использование в Nuxt Guide', async ({ page }) => {
    await gotoStory(page, toStoryId('Top Mining/Использование в Nuxt', 'Guide'))
    await expect(page.locator('body')).toContainText(/Nuxt|компонент/i)
  })
})
