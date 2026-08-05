import { mount } from '@vue/test-utils'
import { describe, expect, it } from 'vitest'

import {
  HASHRATE_CONVERTER_UNITS,
  createDefaultHashrateValues,
} from '~/common/modules/top-mining/converter/hashrate'
import HashrateConverterWidget from '~/components/converter/HashrateConverterWidget.vue'

describe('HashrateConverterWidget', () => {
  function mountWidget() {
    return mount(HashrateConverterWidget, {
      global: {
        stubs: {
          Icon: true,
        },
      },
    })
  }

  it('renders all hashrate units with default 1 MH/s', () => {
    const wrapper = mountWidget()
    const defaults = createDefaultHashrateValues()

    expect(wrapper.findAll('.hashrate-converter__row')).toHaveLength(
      HASHRATE_CONVERTER_UNITS.length,
    )
    expect(
      (wrapper.find('#hashrate-megahash').element as HTMLInputElement).value,
    ).toBe(defaults.megahash)
    expect(
      (wrapper.find('#hashrate-hash').element as HTMLInputElement).value,
    ).toBe(defaults.hash)
  })

  it('recalculates other units when one input changes', async () => {
    const wrapper = mountWidget()
    const thInput = wrapper.find('#hashrate-terahash')

    await thInput.setValue('214')
    await thInput.trigger('input')

    expect(
      (wrapper.find('#hashrate-gigahash').element as HTMLInputElement).value,
    ).toBe('214000')
    expect(
      (wrapper.find('#hashrate-megahash').element as HTMLInputElement).value,
    ).toBe('214000000')
  })

  it('matches widget snapshot', () => {
    expect(mountWidget().html()).toMatchSnapshot()
  })
})
