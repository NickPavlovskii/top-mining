import { mount } from '@vue/test-utils'
import { describe, expect, it } from 'vitest'

import type { CalculatorHardwareBrand } from '~/common/modules/top-mining'
import CalculatorModelDropdown from '~/components/calculator/form/CalculatorModelDropdown.vue'

const brands: CalculatorHardwareBrand[] = [
  {
    name: 'Microbt Whatsminer',
    models: [
      {
        slug: 'm70-214',
        name: 'Microbt Whatsminer M70 214 TH/s',
        algorithm: 'SHA-256',
        hashrate: 214,
        hashrateUnit: 'TH/s',
        powerW: 3103,
        href: '/calculator/microbt-whatsminer/m70-214/',
      },
    ],
  },
  {
    name: 'Bitmain Antminer',
    models: [
      {
        slug: 's21-200',
        name: 'Bitmain Antminer S21 200 Th/s',
        algorithm: 'SHA-256',
        hashrate: 200,
        hashrateUnit: 'Th/s',
        powerW: 3500,
        href: '/calculator/bitmain-antminer/s21-200/',
      },
    ],
  },
]

describe('CalculatorModelDropdown', () => {
  it('opens and lists brand categories', async () => {
    const wrapper = mount(CalculatorModelDropdown, {
      props: {
        kind: 'asic',
        brands,
        selected: null,
        placeholder: 'Модель ASIC-майнера',
        buttonIcon: '/asic.png',
      },
    })

    await wrapper.find('.tm-select__button').trigger('click')

    expect(wrapper.text()).toContain('Microbt Whatsminer')
    expect(wrapper.text()).toContain('Bitmain Antminer')
  })

  it('emits select when a model is chosen', async () => {
    const wrapper = mount(CalculatorModelDropdown, {
      props: {
        kind: 'asic',
        brands,
        selected: null,
        placeholder: 'Модель ASIC-майнера',
        buttonIcon: '/asic.png',
      },
    })

    await wrapper.find('.tm-select__button').trigger('click')
    await wrapper.find('.tm-select__group-toggle').trigger('click')
    await wrapper.find('.tm-select__option').trigger('click')

    expect(wrapper.emitted('select')?.[0]?.[0]).toMatchObject({
      slug: 'm70-214',
      name: 'Microbt Whatsminer M70 214 TH/s',
    })
  })

  it('shows skeletons when brands are empty', async () => {
    const wrapper = mount(CalculatorModelDropdown, {
      props: {
        kind: 'gpu',
        brands: [],
        selected: null,
        placeholder: 'Выберите Модель GPU',
        buttonIcon: '/gpu.png',
      },
    })

    await wrapper.find('.tm-select__button').trigger('click')

    expect(wrapper.find('.tm-select__skeletons').exists()).toBe(true)
    expect(wrapper.text()).not.toContain('Ничего не найдено')
  })
})
