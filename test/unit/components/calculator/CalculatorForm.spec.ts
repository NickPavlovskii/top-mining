import { mount } from '@vue/test-utils'
import { describe, expect, it, vi } from 'vitest'
import { ref } from 'vue'

import CalculatorForm from '~/components/calculator/form/CalculatorForm.vue'
import {
  emptyCalculatorHardwareByKind,
  type CalculatorCoinsCatalog,
} from '~/common/modules/top-mining'

vi.mock('~/composables/useCalculatorDeviceRoute', () => ({
  useCalculatorDeviceRoute: () => ({
    formRef: ref(null),
  }),
}))

const mockCoinsCatalog: CalculatorCoinsCatalog = {
  asic: [
    {
      id: 'BTC',
      symbol: 'BTC',
      name: 'Bitcoin',
      algorithm: 'SHA-256',
      difficulty: 1e14,
      blockReward: 3.125,
      exchangeRateUsdt: 63_076,
      netHash: 1e21,
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
  ],
  gpu: [],
  gpuAlgorithms: ['Ethash', 'KawPow'],
  defaultUsdtRub: 79.2,
}

vi.stubGlobal('useFetch', (url: string) => {
  if (String(url).includes('/api/calculator/coins')) {
    return {
      data: ref(mockCoinsCatalog),
      pending: ref(false),
      error: ref(null),
    }
  }

  return {
    data: ref(emptyCalculatorHardwareByKind()),
    pending: ref(false),
    error: ref(null),
  }
})

const stubs = {
  CalculatorModelDropdown: {
    props: ['placeholder'],
    template: '<div class="dropdown-stub">{{ placeholder }}</div>',
  },
  CalculatorCoinDropdown: {
    props: ['selected', 'placeholder', 'variant'],
    template:
      '<div class="coin-stub">{{ selected ? selected.symbol + \" (\" + selected.name + \")\" : placeholder }}</div>',
  },
  CalculatorAlgorithmDropdown: {
    props: ['selected', 'placeholder'],
    template:
      '<div class="algo-stub">{{ selected || placeholder }}</div>',
  },
  CalculatorDefaultPriceModal: true,
  CalculatorAlertModal: true,
  CalculatorResults: {
    props: ['result', 'coinSymbol', 'currency'],
    template:
      '<section class="calculator-form__results" data-testid="calculator-results"><h2>Результаты расчетов</h2><p>Чистая прибыль / мес.</p></section>',
  },
  Teleport: true,
}

async function unlockAsic(wrapper: ReturnType<typeof mount>) {
  await wrapper.find('.calculator-form__lock-btn').trigger('click')
}

describe('CalculatorForm', () => {
  it('locks ASIC params until model selected or manual unlock', () => {
    const wrapper = mount(CalculatorForm, {
      global: { stubs },
    })

    expect(wrapper.text()).toContain('(01)')
    expect(wrapper.text()).toContain('Выберите устройство')
    expect(wrapper.text()).toContain('(02)')
    expect(wrapper.text()).toContain('Выберите модель')
    expect(wrapper.text()).toContain('ASIC')
    expect(wrapper.text()).toContain('GPU')
    expect(wrapper.text()).toContain('CPU')
    expect(wrapper.text()).toContain('Модель ASIC-майнера')
    expect(wrapper.text()).toContain('Введите свои параметры')
    expect(wrapper.find('.calculator-form__params-body--locked').exists()).toBe(
      true,
    )
    expect(wrapper.text()).toContain(
      'Выберите модель ASIC, чтобы рассчитать доходность или введите свои параметры',
    )
    expect(wrapper.text()).toContain('Ввести параметры')
    expect(wrapper.text()).toContain('Добываемая монета')
    expect(wrapper.text()).toContain('BTC (Bitcoin)')
    expect(wrapper.text()).toContain('Рассчитать')
    expect(wrapper.text()).toContain('Сбросить данные')
  })

  it('unlocks ASIC params via manual button', async () => {
    const wrapper = mount(CalculatorForm, {
      global: { stubs },
    })

    await unlockAsic(wrapper)

    expect(wrapper.find('.calculator-form__params-body--locked').exists()).toBe(
      false,
    )
    expect(wrapper.text()).toContain('Цена ASIC-майнера')
    expect(wrapper.text()).toContain('Общая стоимость:')
    expect(wrapper.text()).toContain('120 000,00')
    expect(wrapper.text()).toContain('Расширенные опции')
  })

  it('dims advanced fields until the toggle is pressed', async () => {
    const wrapper = mount(CalculatorForm, {
      global: { stubs },
    })

    await unlockAsic(wrapper)

    const advanced = wrapper.find('.calculator-form__advanced')
    expect(advanced.classes()).not.toContain(
      'calculator-form__advanced--active',
    )

    await wrapper.find('.calculator-form__advanced-toggle').trigger('click')

    expect(advanced.classes()).toContain('calculator-form__advanced--active')
  })

  it('locks GPU params until a model is selected', async () => {
    const wrapper = mount(CalculatorForm, {
      global: { stubs },
    })

    const tabs = wrapper.findAll('.calculator-form__tab')
    await tabs[1]!.trigger('click')

    expect(wrapper.text()).toContain('Выберите Модель GPU')
    expect(wrapper.text()).toContain(
      'Выберите модель GPU, чтобы рассчитать доходность',
    )
    expect(wrapper.find('.calculator-form__params-body--locked').exists()).toBe(
      true,
    )
    expect(wrapper.find('.calculator-form__lock-btn').exists()).toBe(false)
    expect(wrapper.text()).toContain('Алгоритм')
    expect(wrapper.text()).toContain('Добываемая монета')
    expect(wrapper.text()).toContain('Цена GPU')
    expect(wrapper.text()).toContain('Кол-во видеокарт')
  })

  it('shows CPU lock message', async () => {
    const wrapper = mount(CalculatorForm, {
      global: { stubs },
    })

    const tabs = wrapper.findAll('.calculator-form__tab')
    await tabs[2]!.trigger('click')

    expect(wrapper.text()).toContain(
      'Выберите модель CPU, чтобы рассчитать доходность',
    )
    expect(wrapper.find('.calculator-form__lock-btn').exists()).toBe(false)
  })

  it('resets form values', async () => {
    const wrapper = mount(CalculatorForm, {
      global: { stubs },
    })

    await unlockAsic(wrapper)

    const priceInput = wrapper.find('input[type="number"]')
    await priceInput.setValue(250000)

    await wrapper.find('.calculator-form__action--ghost').trigger('click')

    expect((priceInput.element as HTMLInputElement).value).toBe('120000')
    expect(wrapper.find('.calculator-form__params-body--locked').exists()).toBe(
      true,
    )
  })

  it('opens default-price modal when ASIC price is 120000', async () => {
    const wrapper = mount(CalculatorForm, {
      global: { stubs },
    })

    await unlockAsic(wrapper)
    await wrapper.find('.calculator-form__action--primary').trigger('click')

    const modal = wrapper.findComponent({ name: 'CalculatorDefaultPriceModal' })
    expect(modal.exists()).toBe(true)
    expect(modal.props('open')).toBe(true)
  })

  it('calculates profit when price is not default', async () => {
    const wrapper = mount(CalculatorForm, {
      global: { stubs },
    })

    await unlockAsic(wrapper)

    const inputs = wrapper.findAll('input[type="number"]')
    await inputs[0]!.setValue(250000)
    // hashrate field — find by nearby label context via model after unlock
    const hashrateInput = wrapper
      .findAll('input[type="number"]')
      .find((input) => {
        const parent = input.element.closest('.calculator-form__field')
        return parent?.textContent?.includes('Хешрейт')
      })
    expect(hashrateInput).toBeTruthy()
    await hashrateInput!.setValue(214)

    const powerInput = wrapper
      .findAll('input[type="number"]')
      .find((input) => {
        const parent = input.element.closest('.calculator-form__field')
        return parent?.textContent?.includes('Потребление')
      })
    if (powerInput) {
      await powerInput.setValue(3550)
    }

    await wrapper.find('.calculator-form__action--primary').trigger('click')

    expect(wrapper.find('.calculator-form__results').exists()).toBe(true)
    expect(wrapper.text()).toContain('Результаты расчетов')
    expect(wrapper.text()).toContain('Чистая прибыль / мес.')
  })
})
