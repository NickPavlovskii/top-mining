import { mount } from '@vue/test-utils'
import { describe, expect, it } from 'vitest'

import { BUY_ASIC_CLIENT_PROBLEMS } from '~/common/modules/top-mining/buy-asic-client-problems'
import BuyAsicClientProblems from '~/components/buy-asic/shared/BuyAsicClientProblems.vue'
import TopMiningOutlineTitle from '~/components/global/pageTitle/TopMiningOutlineTitle.vue'
import TopMiningPillTabs from '~/components/global/navigation/TopMiningPillTabs.vue'

describe('BuyAsicClientProblems', () => {
  function mountSection() {
    return mount(BuyAsicClientProblems, {
      global: {
        components: {
          TopMiningOutlineTitle,
          TopMiningPillTabs,
          'top-mining-outline-title': TopMiningOutlineTitle,
          'top-mining-pill-tabs': TopMiningPillTabs,
        },
        stubs: {
          Icon: {
            template: '<span class="icon-stub" />',
          },
        },
      },
    })
  }

  it('renders outline title', () => {
    const wrapper = mountSection()

    expect(wrapper.text()).toContain(BUY_ASIC_CLIENT_PROBLEMS.titleLead)
    expect(wrapper.text()).toContain(BUY_ASIC_CLIENT_PROBLEMS.titleAccent)
  })

  it('renders all category tabs', () => {
    const wrapper = mountSection()
    const tabs = wrapper.findAll('.top-mining-pill-tabs__tab')

    expect(tabs).toHaveLength(BUY_ASIC_CLIENT_PROBLEMS.tabs.length)
    expect(tabs[0]?.text()).toBe(BUY_ASIC_CLIENT_PROBLEMS.tabs[0]?.label)
  })

  it('shows first review of the first tab by default', () => {
    const wrapper = mountSection()
    const firstReview = BUY_ASIC_CLIENT_PROBLEMS.tabs[0]!.reviews[0]!

    expect(wrapper.find('.buy-asic-problems__time').text()).toBe(
      firstReview.timeAgo,
    )
    expect(wrapper.find('.buy-asic-problems__text').text()).toContain(
      firstReview.parts[0]!.text.trim().slice(0, 40),
    )
  })

  it('switches review on next click', async () => {
    const wrapper = mountSection()
    const firstTab = BUY_ASIC_CLIENT_PROBLEMS.tabs[0]!
    const secondReview = firstTab.reviews[1]!

    await wrapper.find('.buy-asic-problems__nav--next').trigger('click')

    expect(wrapper.find('.buy-asic-problems__time').text()).toBe(
      secondReview.timeAgo,
    )
  })

  it('switches tab and resets review index', async () => {
    const wrapper = mountSection()
    const repairTab = BUY_ASIC_CLIENT_PROBLEMS.tabs[1]!

    await wrapper.find('.buy-asic-problems__nav--next').trigger('click')
    await wrapper.findAll('.top-mining-pill-tabs__tab')[1]!.trigger('click')

    expect(wrapper.find('.buy-asic-problems__time').text()).toBe(
      repairTab.reviews[0]!.timeAgo,
    )
    expect(wrapper.text()).toContain(repairTab.label)
  })

  it('matches snapshot', () => {
    expect(mountSection().html()).toMatchSnapshot()
  })
})
