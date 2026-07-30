import { mount } from '@vue/test-utils'
import { describe, expect, it } from 'vitest'

import { BUY_ASIC_SUMMARY } from '~/common/modules/top-mining/buy-asic-summary'
import BuyAsicSummary from '~/components/buy-asic/BuyAsicSummary.vue'
import TopMiningIconList from '~/components/global/lists/TopMiningIconList.vue'
import TopMiningInput from '~/components/global/forms/TopMiningInput.vue'
import TopMiningPrivacyConsent from '~/components/global/forms/TopMiningPrivacyConsent.vue'

describe('BuyAsicSummary', () => {
  function mountSection() {
    return mount(BuyAsicSummary, {
      global: {
        components: {
          TopMiningIconList,
          TopMiningInput,
          TopMiningPrivacyConsent,
          'top-mining-icon-list': TopMiningIconList,
          'top-mining-input': TopMiningInput,
          'top-mining-privacy-consent': TopMiningPrivacyConsent,
        },
        stubs: {
          'q-input': true,
          'q-checkbox': true,
        },
      },
    })
  }

  it('renders title and checklist items', () => {
    const wrapper = mountSection()

    expect(wrapper.text()).toContain(BUY_ASIC_SUMMARY.title)
    expect(wrapper.text()).toContain(BUY_ASIC_SUMMARY.items[0])
    expect(wrapper.text()).toContain(BUY_ASIC_SUMMARY.note.slice(0, 30))
  })

  it('renders submit label', () => {
    const wrapper = mountSection()

    expect(wrapper.text()).toContain(BUY_ASIC_SUMMARY.submitLabel)
  })
})
