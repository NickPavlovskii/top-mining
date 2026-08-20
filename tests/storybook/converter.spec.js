import { test, expect } from '@playwright/test'
import { gotoStory, toStoryId } from '../helpers/index.js'

test.describe('Storybook — Конвертер', () => {
  test('ConverterHero Desktop', async ({ page }) => {
    await gotoStory(page, toStoryId('Converter/Hero', 'Desktop'))
    await expect(page.getByRole('heading', { name: /Конвертер/i })).toBeVisible()
  })

  test('HashrateConverterWidget Default', async ({ page }) => {
    await gotoStory(page, toStoryId('Converter/Widget', 'Default'))
    await expect(
      page.getByRole('region', { name: 'Конвертер хешрейта' }),
    ).toBeVisible()
  })

  test('ConverterAbout Default', async ({ page }) => {
    await gotoStory(page, toStoryId('Converter/About', 'Default'))
    await expect(
      page.getByText('ДЛЯ ЧЕГО НЕОБХОДИМ КАЛЬКУЛЯТОР ХЕШРЕЙТА?'),
    ).toBeVisible()
  })

  test('ConverterFaq Default', async ({ page }) => {
    await gotoStory(page, toStoryId('Converter/Faq', 'Default'))
    await expect(
      page.getByText('ЧАСТО ЗАДАВАЕМЫЕ ВОПРОСЫ О КАЛЬКУЛЯТОРЕ ХЕШРЕЙТА'),
    ).toBeVisible()
  })
})
