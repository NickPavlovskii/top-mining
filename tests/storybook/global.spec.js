import { test, expect } from '@playwright/test'
import { gotoStory, toStoryId } from '../helpers/index.js'

test.describe('Storybook — Global UI', () => {
  test('TopMiningButton PrimaryLight', async ({ page }) => {
    await gotoStory(page, toStoryId('Global/TopMiningButton', 'PrimaryLight'))
    await expect(page.getByRole('button', { name: 'Подробнее' })).toBeVisible()
  })

  test('TopMiningInput Default', async ({ page }) => {
    await gotoStory(page, toStoryId('Global/TopMiningInput', 'Default'))
    await expect(page.getByRole('textbox', { name: 'Телефон' })).toBeVisible()
  })

  test('TopMiningCheckbox Default', async ({ page }) => {
    await gotoStory(page, toStoryId('Global/TopMiningCheckbox', 'Default'))
    await expect(page.getByRole('checkbox').first()).toBeVisible()
  })

  test('TopMiningSelect FlatList', async ({ page }) => {
    await gotoStory(page, toStoryId('Global/TopMiningSelect', 'FlatList'))
    await expect(page.locator('#storybook-root')).not.toBeEmpty()
  })

  test('TopMiningChip Verified', async ({ page }) => {
    await gotoStory(page, toStoryId('Global/TopMiningChip', 'Verified'))
    await expect(page.getByText('Проверены')).toBeVisible()
  })

  test('TopMiningPrivacyConsent Default', async ({ page }) => {
    await gotoStory(page, toStoryId('Global/TopMiningPrivacyConsent', 'Default'))
    await expect(page.getByRole('checkbox')).toBeVisible()
    await expect(page.getByRole('link', { name: 'Политикой конфиденциальности' })).toBeVisible()
  })

  test('TopMiningPromoBanner Asic', async ({ page }) => {
    await gotoStory(page, toStoryId('Global/TopMiningPromoBanner', 'Asic'))
    await expect(page.getByText('Найдем для вас самые выгодные и дешевые асики')).toBeVisible()
  })

  test('TopMiningCompareTable ThreeColumns', async ({ page }) => {
    await gotoStory(page, toStoryId('Global/TopMiningCompareTable', 'ThreeColumns'))
    await expect(page.locator('.tm-compare-table')).toBeVisible()
  })
})
