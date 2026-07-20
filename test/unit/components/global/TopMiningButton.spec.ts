import { mount } from '@vue/test-utils'
import { describe, expect, it } from 'vitest'

import TopMiningButton from '~/components/global/buttons/TopMiningButton.vue'

describe('TopMiningButton', () => {
  it('renders as button with title', () => {
    const wrapper = mount(TopMiningButton, {
      props: {
        title: 'Подробнее',
      },
    })

    expect(wrapper.element.tagName).toBe('BUTTON')
    expect(wrapper.text()).toContain('Подробнее')
    expect(wrapper.classes()).toContain('top-mining-button--primary')
    expect(wrapper.classes()).toContain('top-mining-button--big')
  })

  it('renders as link when href is set', () => {
    const wrapper = mount(TopMiningButton, {
      props: {
        title: 'Перейти',
        href: 'https://example.com',
        target: '_blank',
      },
    })

    expect(wrapper.element.tagName).toBe('A')
    expect(wrapper.attributes('href')).toBe('https://example.com')
    expect(wrapper.attributes('rel')).toBe('noopener noreferrer')
  })

  it('emits click on button press', async () => {
    const wrapper = mount(TopMiningButton, {
      props: {
        title: 'Клик',
      },
    })

    await wrapper.trigger('click')

    expect(wrapper.emitted('click')).toHaveLength(1)
  })

  it('applies custom width via inline style', () => {
    const wrapper = mount(TopMiningButton, {
      props: {
        title: 'Фиксированная ширина',
        width: 220,
      },
    })

    expect(wrapper.attributes('style')).toContain('width: 220px')
  })

  it('does not emit click when disabled', async () => {
    const wrapper = mount(TopMiningButton, {
      props: {
        title: 'Отключена',
        disabled: true,
      },
    })

    await wrapper.trigger('click')

    expect(wrapper.emitted('click')).toBeUndefined()
    expect(wrapper.classes()).toContain('top-mining-button--disabled')
  })

  it('shows spinner when loading', () => {
    const wrapper = mount(TopMiningButton, {
      props: {
        title: 'Загрузка',
        loading: true,
      },
    })

    expect(wrapper.find('.top-mining-button__spinner').exists()).toBe(true)
    expect(wrapper.classes()).toContain('top-mining-button--loading')
  })
})
