import { mount } from '@vue/test-utils'
import { describe, expect, it } from 'vitest'

import type { CalculatorCoin } from '~/common/modules/top-mining'
import CalculatorCoinDropdown from '~/components/calculator/form/CalculatorCoinDropdown.vue'

const coins: CalculatorCoin[] = [
  {
    id: 'BTC',
    symbol: 'BTC',
    name: 'Bitcoin',
    algorithm: 'SHA-256',
    difficulty: 1,
    blockReward: 3.125,
    exchangeRateUsdt: 60_000,
    netHash: 1,
    stepen: '2v32',
    dualCoin: false,
    iconUrl: '/btc.png',
    sort: 1,
  },
  {
    id: 'DOGE',
    symbol: 'DOGE',
    name: 'DogeCoin',
    algorithm: 'Scrypt',
    difficulty: 1,
    blockReward: 10_000,
    exchangeRateUsdt: 0.1,
    netHash: 1,
    stepen: '2v32',
    dualCoin: false,
    iconUrl: '/doge.png',
    sort: 2,
  },
  {
    id: 'KAS',
    symbol: 'KAS',
    name: 'Kaspa',
    algorithm: 'kHeavyHash',
    difficulty: 1,
    blockReward: 1,
    exchangeRateUsdt: 0.1,
    netHash: 1,
    stepen: '2v32',
    dualCoin: false,
    iconUrl: '/kas.png',
    sort: 3,
  },
  {
    id: 'ZEC',
    symbol: 'ZEC',
    name: 'Zcash',
    algorithm: 'Equihash',
    difficulty: 1,
    blockReward: 1.25,
    exchangeRateUsdt: 30,
    netHash: 1,
    stepen: '2v13',
    dualCoin: false,
    iconUrl: '/zec.png',
    sort: 4,
  },
]

describe('CalculatorCoinDropdown', () => {
  it('renders selected coin and opens searchable list', async () => {
    const selected = coins[0]!
    const wrapper = mount(CalculatorCoinDropdown, {
      props: {
        coins,
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
        coins,
        selected: coins[0]!,
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

  it('shows skeletons when loading or coins empty', async () => {
    const wrapper = mount(CalculatorCoinDropdown, {
      props: {
        coins: [],
        selected: null,
        loading: true,
      },
    })

    await wrapper.find('.tm-select__button').trigger('click')
    expect(wrapper.find('.tm-select__skeletons').exists()).toBe(true)
  })
})
