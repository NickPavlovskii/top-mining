import { test, expect } from '@playwright/test'
import { gotoStory, toStoryId } from '../helpers/index.js'

test.describe('Storybook — Калькулятор', () => {
  test('CalculatorHero Default', async ({ page }) => {
    await gotoStory(page, toStoryId('Calculator/Hero/CalculatorHero', 'Default'))
    await expect(page.getByRole('heading', { name: /КАЛЬКУЛЯТОР/i })).toBeVisible()
    await expect(page.getByRole('navigation', { name: 'Производители ASIC' })).toBeVisible()
  })
})
