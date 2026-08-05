import { mount } from '@vue/test-utils'
import { describe, expect, it } from 'vitest'

import TopMiningSelect from '~/components/global/forms/TopMiningSelect.vue'

const flatOptions = [
  { id: 'btc', label: 'Bitcoin', image: '/btc.png' },
  { id: 'eth', label: 'Ethereum', image: '/eth.png' },
]

const treeGroups = [
  {
    id: 'microbt',
    label: 'Microbt Whatsminer',
    children: [
      {
        id: 'm70',
        label: 'M70 214 TH/s',
        meta: 'SHA-256 | 214 TH/s',
        data: { slug: 'm70' },
      },
    ],
  },
  {
    id: 'bitmain',
    label: 'Bitmain Antminer',
    children: [
      {
        id: 's21',
        label: 'S21 200 Th/s',
        meta: 'SHA-256 | 200 Th/s',
      },
    ],
  },
]

describe('TopMiningSelect', () => {
  it('renders flat options and selects by id', async () => {
    const wrapper = mount(TopMiningSelect, {
      props: {
        mode: 'flat',
        options: flatOptions,
        placeholder: 'Выберите монету',
        modelValue: null,
        'onUpdate:modelValue': (value: string | null) =>
          wrapper.setProps({ modelValue: value }),
      },
    })

    await wrapper.find('.tm-select__button').trigger('click')
    expect(wrapper.text()).toContain('Bitcoin')
    expect(wrapper.text()).toContain('Ethereum')

    await wrapper.findAll('.tm-select__option')[0].trigger('click')
    expect(wrapper.emitted('update:modelValue')?.[0]?.[0]).toBe('btc')
    expect(wrapper.emitted('select')?.[0]?.[0]).toMatchObject({ id: 'btc' })
  })

  it('renders tree groups and expands children', async () => {
    const wrapper = mount(TopMiningSelect, {
      props: {
        mode: 'tree',
        size: 'lg',
        groups: treeGroups,
        placeholder: 'Модель',
        buttonImage: '/asic.png',
        modelValue: null,
      },
    })

    await wrapper.find('.tm-select__button').trigger('click')
    expect(wrapper.text()).toContain('Microbt Whatsminer')
    expect(wrapper.text()).toContain('Bitmain Antminer')

    await wrapper.find('.tm-select__group-toggle').trigger('click')
    await wrapper.find('.tm-select__option').trigger('click')

    expect(wrapper.emitted('select')?.[0]?.[0]).toMatchObject({
      id: 'm70',
      label: 'M70 214 TH/s',
    })
  })

  it('filters flat options by search', async () => {
    const wrapper = mount(TopMiningSelect, {
      props: {
        mode: 'flat',
        options: flatOptions,
        modelValue: null,
      },
    })

    await wrapper.find('.tm-select__button').trigger('click')
    await wrapper.find('.tm-select__search-input').setValue('eth')

    expect(wrapper.text()).toContain('Ethereum')
    expect(wrapper.text()).not.toContain('Bitcoin')
  })
})
