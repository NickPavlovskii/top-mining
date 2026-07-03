import { mount } from '@vue/test-utils'
import { describe, expect, it } from 'vitest'

import TopMiningBrandTitle from '~/components/global/TopMiningBrandTitle.vue'

describe('TopMiningBrandTitle', () => {
  it('renders hero title with default h1 tag', () => {
    const wrapper = mount(TopMiningBrandTitle, {
      props: {
        variant: 'hero',
      },
    })

    expect(wrapper.element.tagName).toBe('H1')
    expect(wrapper.text()).toContain('ТОП-МАЙНИНГ')
    expect(wrapper.classes()).toContain('top-mining-brand-title--hero')
    expect(wrapper.find('.top-mining-brand-title__logo').exists()).toBe(true)
  })

  it('uses spaced title text when requested', () => {
    const wrapper = mount(TopMiningBrandTitle, {
      props: {
        variant: 'menu',
        spaced: true,
      },
    })

    expect(wrapper.text()).toContain('ТОП - МАЙНИНГ')
  })

  it('respects custom heading tag', () => {
    const wrapper = mount(TopMiningBrandTitle, {
      props: {
        variant: 'footer',
        tag: 'h3',
      },
    })

    expect(wrapper.element.tagName).toBe('H3')
    expect(wrapper.classes()).toContain('top-mining-brand-title--footer')
  })
})
