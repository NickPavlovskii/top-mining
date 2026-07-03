import { mount } from '@vue/test-utils'
import { describe, expect, it } from 'vitest'

import TopMiningRadio from '~/components/global/TopMiningRadio.vue'

describe('TopMiningRadio', () => {
  it('renders label and radio input', () => {
    const wrapper = mount(TopMiningRadio, {
      props: {
        label: 'Вариант A',
        modelValue: 'a',
        value: 'a',
        name: 'group',
      },
    })

    expect(wrapper.text()).toContain('Вариант A')
    expect(wrapper.find('input[type="radio"]').exists()).toBe(true)
    expect(wrapper.classes()).toContain('top-mining-radio--checked')
  })

  it('marks checked state when model matches value', () => {
    const wrapper = mount(TopMiningRadio, {
      props: {
        label: 'B',
        modelValue: 'b',
        value: 'b',
        name: 'group',
      },
    })

    expect(wrapper.classes()).toContain('top-mining-radio--checked')
  })

  it('does not mark checked when model differs', () => {
    const wrapper = mount(TopMiningRadio, {
      props: {
        label: 'C',
        modelValue: 'a',
        value: 'c',
        name: 'group',
      },
    })

    expect(wrapper.classes()).not.toContain('top-mining-radio--checked')
  })

  it('applies indeterminate modifier', () => {
    const wrapper = mount(TopMiningRadio, {
      props: {
        label: 'Indeterminate',
        modelValue: '',
        value: 'x',
        name: 'group',
        indeterminate: true,
      },
    })

    expect(wrapper.classes()).toContain('top-mining-radio--indeterminate')
  })
})
