import { mount } from '@vue/test-utils'
import { describe, expect, it } from 'vitest'

import TopMiningCollapse from '~/components/global/disclosure/TopMiningCollapse.vue'

describe('TopMiningCollapse', () => {
  it('renders slot content and closed state by default', () => {
    const wrapper = mount(TopMiningCollapse, {
      slots: {
        default: '<p class="slot-content">Контент</p>',
      },
    })

    expect(wrapper.classes()).toContain('tm-collapse')
    expect(wrapper.classes()).not.toContain('tm-collapse--open')
    expect(wrapper.attributes('aria-hidden')).toBe('true')
    expect(wrapper.find('.slot-content').text()).toBe('Контент')
  })

  it('opens with panel variant', async () => {
    const wrapper = mount(TopMiningCollapse, {
      props: {
        open: true,
        variant: 'panel',
      },
      slots: {
        default: '<p>Открыто</p>',
      },
    })

    expect(wrapper.classes()).toContain('tm-collapse--open')
    expect(wrapper.classes()).toContain('tm-collapse--panel')
    expect(wrapper.attributes('aria-hidden')).toBe('false')
  })
})
