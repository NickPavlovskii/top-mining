import { mount } from '@vue/test-utils'
import { describe, expect, it } from 'vitest'

import CalculatorAbout from '~/components/calculator/about/CalculatorAbout.vue'
import { CALCULATOR_PAGE } from '~/common/modules/top-mining/calculator/page'

describe('CalculatorAbout', () => {
  it('renders feature bullet points', () => {
    const wrapper = mount(CalculatorAbout)

    expect(wrapper.find('.calculator-about__list').exists()).toBe(true)
    expect(wrapper.findAll('.calculator-about__list li')).toHaveLength(
      CALCULATOR_PAGE.about.features.length,
    )
    expect(wrapper.text()).toContain('Учет курса BTC-USDT и USDT-RUB;')
    expect(wrapper.text()).toContain('Калькуляция доходности CPU, GPU и асиков.')
  })
})
