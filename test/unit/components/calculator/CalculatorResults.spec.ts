import { mount } from '@vue/test-utils'
import { describe, expect, it } from 'vitest'

import CalculatorResults from '~/components/calculator/form/CalculatorResults.vue'
import type { CalculatorProfitResult } from '~/common/modules/top-mining'

const sampleResult: CalculatorProfitResult = {
  coinsHour: 0.000000004,
  coinsDay: 0.000000095,
  coinsMonth: 0.00000286,
  coinsYear: 0.0000348,
  incomeHourRub: 0.02,
  incomeDayRub: 0.48,
  incomeMonthRub: 14.25,
  incomeYearRub: 173.41,
  placingMonthRub: 1594.3,
  cleanProfitMonthRub: -1580.05,
  paybackMonths: null,
  incomeHourUsdt: 0,
  incomeDayUsdt: 0.01,
  incomeMonthUsdt: 0.18,
  incomeYearUsdt: 2.18,
  placingMonthUsdt: 20.03,
  cleanProfitMonthUsdt: -19.85,
}

describe('CalculatorResults', () => {
  it('renders orange results layout with RUB values', () => {
    const wrapper = mount(CalculatorResults, {
      props: {
        result: sampleResult,
        coinSymbol: 'BTC',
        currency: 'RUB',
      },
    })

    expect(wrapper.text()).toContain('Результаты расчетов')
    expect(wrapper.text()).toContain('Монета')
    expect(wrapper.text()).toContain('USDT')
    expect(wrapper.text()).toContain('RUB')
    expect(wrapper.text()).toContain('Ваш приблиз. доход')
    expect(wrapper.text()).toContain('Стоимость размещения / мес.')
    expect(wrapper.text()).toContain('Не окупается')
    expect(wrapper.text()).toContain('Чистая прибыль')
    expect(wrapper.text()).toContain('0,02')
    expect(wrapper.text()).toContain('1 594,30')
  })

  it('switches currency tab', async () => {
    const wrapper = mount(CalculatorResults, {
      props: {
        result: sampleResult,
        coinSymbol: 'BTC',
        currency: 'RUB',
        'onUpdate:currency': (value: string) =>
          wrapper.setProps({ currency: value }),
      },
    })

    await wrapper.findAll('.calc-results__tab')[1]!.trigger('click')
    expect(wrapper.props('currency')).toBe('USDT')
  })
})
