import { mount } from '@vue/test-utils'
import { describe, expect, it } from 'vitest'

import { CALCULATOR_PAGE } from '~/common/modules/top-mining/calculator/page'
import CalculatorHero from '~/components/calculator/hero/CalculatorHero.vue'

describe('CalculatorHero', () => {
  it('renders breadcrumbs, brands and title', () => {
    const wrapper = mount(CalculatorHero, {
      global: {
        stubs: {
          NuxtLink: {
            props: ['to'],
            template: '<a :href="to"><slot /></a>',
          },
        },
      },
    })

    expect(wrapper.text()).toContain('Главная')
    expect(wrapper.text()).toContain(CALCULATOR_PAGE.breadcrumb)
    expect(wrapper.text()).toContain('МАЙНИНГ')
    expect(wrapper.text()).toContain('КАЛЬКУЛЯТОР')
    expect(wrapper.text()).toContain('ДОХОДНОСТИ')
    expect(wrapper.findAll('.calculator-hero__brand')).toHaveLength(
      CALCULATOR_PAGE.brands.length,
    )
  })
})
