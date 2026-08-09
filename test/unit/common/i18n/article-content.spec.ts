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

  it('returns article as-is (translations come from API/DB)', () => {
    expect(localizeArticlePreview(sample, 'en').title).toBe(sample.title)
    expect(localizeArticlePreview(sample, 'ru').title).toBe(sample.title)
  })
})
