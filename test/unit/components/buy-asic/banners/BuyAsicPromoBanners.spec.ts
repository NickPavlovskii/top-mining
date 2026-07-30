import { mount } from '@vue/test-utils'
import { describe, expect, it } from 'vitest'

import { BUY_ASIC_PROMO_BANNERS } from '~/common/modules/top-mining/buy-asic-promo-banners'
import BuyAsicPromoBanners from '~/components/buy-asic/banners/BuyAsicPromoBanners.vue'
import PodborMiningHotelPromoBanner from '~/components/podbor/banners/PodborMiningHotelPromoBanner.vue'
import TopMiningButton from '~/components/global/buttons/TopMiningButton.vue'

describe('BuyAsicPromoBanners', () => {
  it('renders both promo banners with CTAs', () => {
    const wrapper = mount(BuyAsicPromoBanners, {
      global: {
        components: {
          PodborMiningHotelPromoBanner,
          TopMiningButton,
          'podbor-mining-hotel-promo-banner': PodborMiningHotelPromoBanner,
          'top-mining-button': TopMiningButton,
        },
        stubs: {
          'q-btn': {
            props: ['href', 'title'],
            template: '<a class="q-btn-stub" :href="href">{{ title }}</a>',
          },
          ConsultingDiagonalArrowIcon: true,
        },
      },
    })

    expect(wrapper.text()).toContain(BUY_ASIC_PROMO_BANNERS.items[0]!.title)
    expect(wrapper.text()).toContain(BUY_ASIC_PROMO_BANNERS.items[1]!.title)
    expect(wrapper.html()).toContain(BUY_ASIC_PROMO_BANNERS.items[0]!.href)
    expect(wrapper.html()).toContain(BUY_ASIC_PROMO_BANNERS.items[1]!.href)
  })
})
