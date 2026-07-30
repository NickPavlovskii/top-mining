import { mount } from '@vue/test-utils'
import { describe, expect, it } from 'vitest'

import {
  BUY_ASIC_SAFETY,
  BUY_ASIC_TIME_SAVE,
  BUY_ASIC_VALUE_BLOCKS,
} from '~/common/modules/top-mining/buy-asic-value-blocks'
import BuyAsicSafetyAndTime from '~/components/buy-asic/BuyAsicSafetyAndTime.vue'
import TopMiningButton from '~/components/global/buttons/TopMiningButton.vue'

describe('BuyAsicSafetyAndTime', () => {
  function mountSection() {
    return mount(BuyAsicSafetyAndTime, {
      global: {
        components: {
          TopMiningButton,
          'top-mining-button': TopMiningButton,
        },
        stubs: {
          Icon: { template: '<span class="icon-stub" />' },
          'q-btn': {
            props: ['href', 'title'],
            template:
              '<a class="q-btn-stub" :href="href">{{ title }}<slot /></a>',
          },
        },
      },
    })
  }

  it('renders safety and time headings', () => {
    const wrapper = mountSection()

    expect(wrapper.text()).toContain(BUY_ASIC_SAFETY.titleLines[0])
    expect(wrapper.text()).toContain(BUY_ASIC_TIME_SAVE.titleLines[0])
  })

  it('expands more items on toggle', async () => {
    const wrapper = mountSection()
    const moreItem = BUY_ASIC_SAFETY.cards[0]!.moreItems![0]!

    expect(wrapper.text()).not.toContain(moreItem.slice(0, 40))

    await wrapper.find('.buy-asic-value__more').trigger('click')

    expect(wrapper.text()).toContain(moreItem.slice(0, 40))
    expect(wrapper.text()).toContain(BUY_ASIC_VALUE_BLOCKS.seeLessLabel)
  })

  it('links CTA to increase-income path', () => {
    const wrapper = mountSection()
    const incomeCta = BUY_ASIC_TIME_SAVE.cards.find(
      (card) => card.id === 'income',
    )?.cta

    expect(incomeCta?.href).toContain('uvelichim-vash-dohod')
    expect(wrapper.html()).toContain(incomeCta!.href)
  })
})
