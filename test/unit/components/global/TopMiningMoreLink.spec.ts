import { mount } from '@vue/test-utils'
import { describe, expect, it } from 'vitest'

import TopMiningMoreLink from '~/components/global/TopMiningMoreLink.vue'

describe('TopMiningMoreLink', () => {
  it('renders label and catalog size by default', () => {
    const wrapper = mount(TopMiningMoreLink, {
      props: {
        to: '/catalog',
        label: 'Ещё категории',
      },
    })

    expect(wrapper.text()).toContain('Ещё категории')
    expect(wrapper.classes()).toContain('top-mining-more-link--md')
    expect(wrapper.find('.top-mining-more-link__arrow').exists()).toBe(true)
  })

  it('uses large size modifier for articles', () => {
    const wrapper = mount(TopMiningMoreLink, {
      props: {
        to: '/articles',
        label: 'Смотреть ещё',
        size: 'lg',
      },
    })

    expect(wrapper.classes()).toContain('top-mining-more-link--lg')
  })

  it('links to the provided route', () => {
    const wrapper = mount(TopMiningMoreLink, {
      props: {
        to: '/articles?page=2',
        label: 'Смотреть ещё',
      },
    })

    expect(wrapper.attributes('href')).toContain('/articles')
  })
})
