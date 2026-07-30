import { mount } from '@vue/test-utils'
import { describe, expect, it } from 'vitest'

import BuyAsicHero from '~/components/buy-asic/hero/BuyAsicHero.vue'
import { BUY_ASIC_PAGE } from '~/common/modules/top-mining/buy-asic-page'

describe('BuyAsicHero', () => {
  function mountSection() {
    return mount(BuyAsicHero, {
      global: {
        stubs: {
          BuyAsicCompanyCard: true,
          'buy-asic-company-card': true,
          TopMiningIconList: {
            props: ['items'],
            template:
              '<ul class="buy-asic-hero__benefit-stub"><li v-for="(item, i) in items" :key="i" class="buy-asic-hero__benefit">{{ item }}</li></ul>',
          },
          'top-mining-icon-list': {
            props: ['items'],
            template:
              '<ul class="buy-asic-hero__benefit-stub"><li v-for="(item, i) in items" :key="i" class="buy-asic-hero__benefit">{{ item }}</li></ul>',
          },
          TopMiningInput: {
            template:
              '<input name="your-telegram" type="tel" />',
          },
          'top-mining-input': {
            template:
              '<input name="your-telegram" type="tel" />',
          },
          TopMiningPrivacyConsent: true,
          'top-mining-privacy-consent': true,
        },
      },
    })
  }

  it('renders title, subtitle and benefits', () => {
    const wrapper = mountSection()

    expect(wrapper.find('.buy-asic-hero__title').text()).toBe(BUY_ASIC_PAGE.title)
    expect(wrapper.text()).toContain(BUY_ASIC_PAGE.subtitleLead)
    expect(wrapper.text()).toContain(BUY_ASIC_PAGE.subtitleAccent)
    expect(wrapper.findAll('.buy-asic-hero__benefit')).toHaveLength(
      BUY_ASIC_PAGE.benefits.length,
    )
  })

  it('renders lead form', () => {
    const wrapper = mountSection()

    expect(wrapper.find('input[name="your-telegram"]').exists()).toBe(true)
    expect(wrapper.find('.buy-asic-hero__submit').text()).toContain(
      BUY_ASIC_PAGE.submitLabel,
    )
  })

  it('matches snapshot', () => {
    expect(mountSection().html()).toMatchSnapshot()
  })
})
