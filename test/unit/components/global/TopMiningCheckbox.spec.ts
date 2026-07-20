import { mount } from '@vue/test-utils'
import { describe, expect, it } from 'vitest'

import TopMiningCheckbox from '~/components/global/selection-controls/TopMiningCheckbox.vue'

describe('TopMiningCheckbox', () => {
  it('renders label and default size', () => {
    const wrapper = mount(TopMiningCheckbox, {
      props: {
        label: 'Согласие',
        modelValue: false,
      },
    })

    expect(wrapper.text()).toContain('Согласие')
    expect(wrapper.classes()).toContain('top-mining-checkbox--md')
    expect(wrapper.find('input[type="checkbox"]').exists()).toBe(true)
  })

  it('applies checked modifier when model is true', () => {
    const wrapper = mount(TopMiningCheckbox, {
      props: {
        label: 'Пункт',
        modelValue: true,
      },
    })

    expect(wrapper.classes()).toContain('top-mining-checkbox--checked')
  })

  it('applies indeterminate modifier and syncs native input', async () => {
    const wrapper = mount(TopMiningCheckbox, {
      props: {
        label: 'Частично',
        modelValue: false,
        indeterminate: true,
      },
    })

    expect(wrapper.classes()).toContain('top-mining-checkbox--indeterminate')

    const input = wrapper.find('input').element as HTMLInputElement
    expect(input.indeterminate).toBe(true)
  })

  it('emits update:modelValue on click', async () => {
    const wrapper = mount(TopMiningCheckbox, {
      props: {
        label: 'Пункт',
        modelValue: false,
        'onUpdate:modelValue': (value: boolean) => wrapper.setProps({ modelValue: value }),
      },
    })

    await wrapper.find('input').setValue(true)

    expect(wrapper.props('modelValue')).toBe(true)
  })

  it('uses small size modifier', () => {
    const wrapper = mount(TopMiningCheckbox, {
      props: {
        label: 'Малый',
        modelValue: false,
        size: 'sm',
      },
    })

    expect(wrapper.classes()).toContain('top-mining-checkbox--sm')
  })
})
