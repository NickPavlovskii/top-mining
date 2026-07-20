import { mount } from '@vue/test-utils'
import { describe, expect, it } from 'vitest'

import TopMiningRoundIconButton from '~/components/global/buttons/TopMiningRoundIconButton.vue'

function getButtonWrapper(wrapper: ReturnType<typeof mount>) {
  return wrapper.find('.top-mining-round-icon-button')
}

describe('TopMiningRoundIconButton', () => {
  it('renders accessible button by default', () => {
    const wrapper = mount(TopMiningRoundIconButton, {
      props: {
        ariaLabel: 'Отправить',
        type: 'submit',
      },
    })

    const button = getButtonWrapper(wrapper)

    expect(button.element.tagName).toBe('BUTTON')
    expect(button.attributes('type')).toBe('submit')
    expect(button.attributes('aria-label')).toBe('Отправить')
    expect(button.classes()).toContain('top-mining-round-icon-button--primary')
  })

  it('renders as link when href is provided', () => {
    const wrapper = mount(TopMiningRoundIconButton, {
      props: {
        ariaLabel: 'Telegram',
        href: 'https://t.me/example',
        target: '_blank',
      },
    })

    const button = getButtonWrapper(wrapper)

    expect(button.element.tagName).toBe('A')
    expect(button.attributes('href')).toBe('https://t.me/example')
    expect(button.attributes('target')).toBe('_blank')
  })

  it('emits click event', async () => {
    const wrapper = mount(TopMiningRoundIconButton, {
      props: {
        ariaLabel: 'Действие',
      },
    })

    await getButtonWrapper(wrapper).trigger('click')

    expect(wrapper.emitted('click')).toHaveLength(1)
  })

  it('applies outline variant class', () => {
    const wrapper = mount(TopMiningRoundIconButton, {
      props: {
        ariaLabel: 'Наверх',
        variant: 'outline',
      },
    })

    expect(getButtonWrapper(wrapper).classes()).toContain(
      'top-mining-round-icon-button--outline',
    )
  })

  it('does not emit click when disabled', async () => {
    const wrapper = mount(TopMiningRoundIconButton, {
      props: {
        ariaLabel: 'Отключена',
        disabled: true,
      },
    })

    await getButtonWrapper(wrapper).trigger('click')

    expect(wrapper.emitted('click')).toBeUndefined()
    expect(getButtonWrapper(wrapper).classes()).toContain(
      'top-mining-round-icon-button--disabled',
    )
  })
})
