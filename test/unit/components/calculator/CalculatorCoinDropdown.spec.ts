import { mount } from '@vue/test-utils'
import { describe, expect, it } from 'vitest'

import {
  CALCULATOR_COINS,
  getDefaultCalculatorCoin,
} from '~/common/modules/top-mining'
import CalculatorCoinDropdown from '~/components/calculator/form/CalculatorCoinDropdown.vue'

describe('CalculatorCoinDropdown', () => {
  it('renders selected coin and opens searchable list', async () => {
    const selected = getDefaultCalculatorCoin()
    const wrapper = mount(CalculatorCoinDropdown, {
      props: {
        coins: CALCULATOR_COINS,
        selected,
      },
    })

    expect(wrapper.text()).toContain('BTC (Bitcoin)')

    await wrapper.find('.tm-select__button').trigger('click')
    expect(wrapper.find('.tm-select__panel').isVisible()).toBe(true)
    expect(wrapper.text()).toContain('KAS (Kaspa) | kHeavyHash')

    await wrapper.find('.tm-select__search-input').setValue('ze')
    expect(wrapper.text()).toContain('ZEC (Zcash) | Equihash')
    expect(wrapper.text()).not.toContain('KAS (Kaspa) | kHeavyHash')
  })

  it('emits select when a coin is chosen', async () => {
    const wrapper = mount(CalculatorCoinDropdown, {
      props: {
        coins: CALCULATOR_COINS,
        selected: getDefaultCalculatorCoin(),
      },
    })

    await wrapper.find('.tm-select__button').trigger('click')
    const doge = wrapper
      .findAll('.tm-select__option')
      .find((item) => item.text().includes('DOGE'))

    await doge!.trigger('click')

    expect(wrapper.emitted('select')?.[0]?.[0]).toMatchObject({
      id: 'DOGE',
      symbol: 'DOGE',
    })
  })
})
