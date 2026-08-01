import { mount } from '@vue/test-utils'
import { describe, expect, it } from 'vitest'

import { STROITELSTVO_DATA_CZENTROV_PAGE } from '~/common/modules/top-mining/stroitelstvo-data-czentrov-page'
import StroyHero from '~/components/stroitelstvo/hero/StroyHero.vue'
import TopMiningButton from '~/components/global/buttons/TopMiningButton.vue'

describe('StroyHero', () => {
  it('renders title, investment cards and CTA', () => {
    const wrapper = mount(StroyHero, {
      global: {
        components: {
          TopMiningButton,
          'top-mining-button': TopMiningButton,
        },
        stubs: {
          'q-btn': {
            props: ['href', 'title'],
            template: '<a class="q-btn-stub" :href="href">{{ title }}</a>',
          },
          NuxtLink: {
            props: ['to'],
            template: '<a :href="to"><slot /></a>',
          },
        },
      },
    })

    const hero = STROITELSTVO_DATA_CZENTROV_PAGE.hero

    expect(wrapper.text()).toContain(hero.title)
    expect(wrapper.text()).toContain(hero.titleAccent)
    expect(wrapper.text()).toContain(hero.investmentValue)
    expect(wrapper.text()).toContain(hero.paybackValue)
    expect(wrapper.html()).toContain(hero.ctaHref)
  })
})
