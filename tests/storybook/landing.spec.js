import { test, expect } from '@playwright/test'
import { gotoStory, toStoryId } from '../helpers/index.js'

test.describe('Storybook — Лендинги', () => {
  test('DataCenterHero Default', async ({ page }) => {
    await gotoStory(
      page,
      toStoryId('Data Center Construction/Hero/DataCenterHero', 'Default'),
    )
    await expect(
      page.getByText('СТРОИТЕЛЬСТВО ДАТА-ЦЕНТРОВ ДЛЯ МАЙНИНГА ПОД КЛЮЧ'),
    ).toBeVisible()
  })

  test('IncreaseIncomeHero Desktop', async ({ page }) => {
    await gotoStory(page, toStoryId('IncreaseIncome/Hero', 'Desktop'))
    await expect(
      page.getByRole('heading', { name: /ВЫ МАЙНЕР\?\s*УВЕЛИЧИМ ВАШ ДОХОД/i }),
    ).toBeVisible()
  })

  test('ConsultingBestSpeaker Default', async ({ page }) => {
    await gotoStory(page, toStoryId('Consulting/ConsultingBestSpeaker', 'Default'))
    await expect(page.locator('section, .consulting-best-speaker').first()).toBeVisible()
  })

  test('HorizontalCarousel Default', async ({ page }) => {
    await gotoStory(page, toStoryId('Carousel/HorizontalCarousel', 'Default'))
    await expect(page.getByText('Свободно 40 МВт в Московской области')).toBeVisible()
  })
})
