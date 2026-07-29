import { mount } from '@vue/test-utils'
import { describe, expect, it } from 'vitest'

import TopMiningPromoBanner from '~/components/global/banners/TopMiningPromoBanner.vue'

describe('TopMiningPromoBanner', () => {
  function mountBanner(props = {}) {
    return mount(TopMiningPromoBanner, {
      props: {
        title: 'Найдем для вас самые выгодные и дешевые асики',
        href: '/asic-majnery-po-czenam-nizhe-rynka/',
        image: '/banner-asic.png',
        imageAlt: 'ASIC-майнеры',
        buttonLabel: 'ПЕРЕЙТИ НА СТРАНИЦУ',
        ...props,
      },
      global: {
        stubs: {
          ConsultingDiagonalArrowIcon: true,
          'consulting-diagonal-arrow-icon': true,
        },
      },
    })
  }

  it('renders title, button and image', () => {
    const wrapper = mountBanner()

    expect(wrapper.find('.tm-promo-banner__title').text()).toBe(
      'Найдем для вас самые выгодные и дешевые асики',
    )
    expect(wrapper.find('.tm-promo-banner__button').text()).toContain(
      'ПЕРЕЙТИ НА СТРАНИЦУ',
    )
    expect(wrapper.find('.tm-promo-banner__button').attributes('href')).toBe(
      '/asic-majnery-po-czenam-nizhe-rynka/',
    )
    expect(wrapper.find('.tm-promo-banner__image').attributes('src')).toBe(
      '/banner-asic.png',
    )
  })

  it('matches snapshot', () => {
    expect(mountBanner().html()).toMatchSnapshot()
  })
})
