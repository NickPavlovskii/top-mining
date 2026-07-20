import { mount } from '@vue/test-utils'
import { describe, expect, it } from 'vitest'

import TopMiningArticleRow from '~/components/global/articles/TopMiningArticleRow.vue'
import { sampleArticlePreview } from '~/test/fixtures/article-preview'

describe('TopMiningArticleRow', () => {
  it('renders title, meta and grid row', () => {
    const wrapper = mount(TopMiningArticleRow, {
      props: {
        article: sampleArticlePreview,
        to: `/articles/${sampleArticlePreview.slug}`,
      },
    })

    expect(wrapper.find('.top-mining-article-row').exists()).toBe(true)
    expect(wrapper.find('.top-mining-article-row__title').text()).toBe(
      sampleArticlePreview.title,
    )
    expect(wrapper.text()).toContain('7 мин.')
    expect(wrapper.text()).toContain('15.03.2024')
    expect(wrapper.find('.top-mining-article-row__arrow').exists()).toBe(true)
  })

  it('uses configurable heading tag', () => {
    const wrapper = mount(TopMiningArticleRow, {
      props: {
        article: sampleArticlePreview,
        to: `/articles/${sampleArticlePreview.slug}`,
        titleTag: 'h2',
      },
    })

    expect(wrapper.find('h2.top-mining-article-row__title').exists()).toBe(true)
  })
})
