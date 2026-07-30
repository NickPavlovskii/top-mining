import { mount } from '@vue/test-utils'
import { describe, expect, it } from 'vitest'

import { BUY_ASIC_HOW_WE_WORK } from '~/common/modules/top-mining/buy-asic-value-blocks'
import BuyAsicHowWeWork from '~/components/buy-asic/BuyAsicHowWeWork.vue'

describe('BuyAsicHowWeWork', () => {
  it('renders title and four steps', () => {
    const wrapper = mount(BuyAsicHowWeWork)

    expect(wrapper.text()).toContain(BUY_ASIC_HOW_WE_WORK.titleAccent)
    expect(wrapper.text()).toContain(BUY_ASIC_HOW_WE_WORK.subtitle)
    expect(wrapper.findAll('.buy-asic-how__step')).toHaveLength(
      BUY_ASIC_HOW_WE_WORK.steps.length,
    )
    expect(wrapper.findAll('.buy-asic-how__step--accent')).toHaveLength(1)
  })
})
