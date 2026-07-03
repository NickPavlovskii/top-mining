import { mount } from '@vue/test-utils'
import { describe, expect, it } from 'vitest'

import TopMiningArticleCard from '~/components/global/TopMiningArticleCard.vue'
import { sampleArticlePreview } from '~/test/fixtures/article-preview'

describe('TopMiningArticleCard', () => {
  it('renders article meta and excerpt', () => {
    const wrapper = mount(TopMiningArticleCard, {
      props: {
        article: sampleArticlePreview,
        to: `/articles/${sampleArticlePreview.slug}`,
      },
    })

    expect(wrapper.text()).toContain(sampleArticlePreview.excerpt)
    expect(wrapper.text()).toContain('7 мин.')
    expect(wrapper.text()).toContain('15.03.2024')
    expect(wrapper.find('.top-mining-article-card__image').attributes('src')).toBe(
      sampleArticlePreview.imageUrl,
    )
  })

  it('shows overlay when enabled', () => {
    const wrapper = mount(TopMiningArticleCard, {
      props: {
        article: sampleArticlePreview,
        to: `/articles/${sampleArticlePreview.slug}`,
        showOverlay: true,
      },
    })

    expect(wrapper.find('.top-mining-article-card__overlay').exists()).toBe(true)
    expect(wrapper.find('.top-mining-article-card__overlay').text()).toContain(
      sampleArticlePreview.title,
    )
  })

  it('hides reading time when it is missing', () => {
    const wrapper = mount(TopMiningArticleCard, {
      props: {
        article: {
          ...sampleArticlePreview,
          readingTimeMin: null,
        },
        to: `/articles/${sampleArticlePreview.slug}`,
      },
    })

    expect(wrapper.text()).not.toContain('мин.')
  })
})
