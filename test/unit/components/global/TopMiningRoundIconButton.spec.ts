import { mount } from '@vue/test-utils'
import { describe, expect, it } from 'vitest'

import TopMiningRoundIconButton from '~/components/global/TopMiningRoundIconButton.vue'

describe('TopMiningRoundIconButton', () => {
  it('renders accessible button by default', () => {
    const wrapper = mount(TopMiningRoundIconButton, {
      props: {
        ariaLabel: 'Отправить',
        type: 'submit',
      },
    })

    expect(wrapper.element.tagName).toBe('BUTTON')
    expect(wrapper.attributes('type')).toBe('submit')
    expect(wrapper.attributes('aria-label')).toBe('Отправить')
    expect(wrapper.classes()).toContain('top-mining-round-icon-button--primary')
  })

  it('renders as link when href is provided', () => {
    const wrapper = mount(TopMiningRoundIconButton, {
      props: {
        ariaLabel: 'Telegram',
        href: 'https://t.me/example',
        target: '_blank',
      },
    })

    expect(wrapper.element.tagName).toBe('A')
    expect(wrapper.attributes('href')).toBe('https://t.me/example')
    expect(wrapper.attributes('target')).toBe('_blank')
  })

  it('emits click event', async () => {
    const wrapper = mount(TopMiningRoundIconButton, {
      props: {
        ariaLabel: 'Действие',
      },
    })

    await wrapper.trigger('click')

    expect(wrapper.emitted('click')).toHaveLength(1)
  })

  it('applies outline variant class', () => {
    const wrapper = mount(TopMiningRoundIconButton, {
      props: {
        ariaLabel: 'Наверх',
        variant: 'outline',
      },
    })

    expect(wrapper.classes()).toContain('top-mining-round-icon-button--outline')
  })

  it('does not emit click when disabled', async () => {
    const wrapper = mount(TopMiningRoundIconButton, {
      props: {
        ariaLabel: 'Отключена',
        disabled: true,
      },
    })

    await wrapper.trigger('click')

    expect(wrapper.emitted('click')).toBeUndefined()
    expect(wrapper.classes()).toContain('top-mining-round-icon-button--disabled')
  })
})
