import { test, expect } from '@playwright/test'
import { gotoStory, toStoryId } from '../helpers/index.js'

test.describe('Storybook — Buy ASIC', () => {
  test('BuyAsicSummary Default', async ({ page }) => {
    await gotoStory(page, toStoryId('Buy ASIC/BuyAsicSummary', 'Default'))
    await expect(page.getByText('ИТОГО')).toBeVisible()
  })

  test('BuyAsicHowWeWork Default', async ({ page }) => {
    await gotoStory(page, toStoryId('Buy ASIC/BuyAsicHowWeWork', 'Default'))
    await expect(page.getByText('Как мы работаем:')).toBeVisible()
  })

  test('BuyAsicClientProblems Default', async ({ page }) => {
    await gotoStory(page, toStoryId('Buy ASIC/BuyAsicClientProblems', 'Default'))
    await expect(page.locator('section, .buy-asic-client-problems').first()).toBeVisible()
  })

  test('BuyAsicPromoBanners Default', async ({ page }) => {
    await gotoStory(page, toStoryId('Buy ASIC/BuyAsicPromoBanners', 'Default'))
    await expect(page.getByText('НУЖЕН МАЙНИНГ-ОТЕЛЬ?')).toBeVisible()
  })
})
