import { describe, expect, it } from 'vitest'
import { localizeArticlePreview } from '~/composables/useLocalizedArticle'

describe('localizeArticlePreview', () => {
  const sample = {
    id: 3,
    slug: 'best-asic-miners-2026',
    title: 'Лучшие асики для майнинга: умный сервис, зрелая экосистема',
    excerpt:
      'Как выбрать ASIC в 2026 году: железо, сервис, логистика и прозрачные условия размещения.',
    imageUrl: '/x.jpg',
    imageAlt: 'Лучшие ASIC-майнеры',
    topicId: 'mining' as const,
    readingTimeMin: 10,
    publishedAt: '2025-12-12',
    displayType: 'featured' as const,
  }

  it('keeps Russian for ru locale', () => {
    const result = localizeArticlePreview(sample, 'ru')
    expect(result.title).toBe(sample.title)
  })

  it('translates known slug to English', () => {
    const result = localizeArticlePreview(sample, 'en')
    expect(result.title).toBe(
      'Best mining ASICs: smart service, mature ecosystem',
    )
    expect(result.excerpt).toContain('How to choose an ASIC in 2026')
  })
})
