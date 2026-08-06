import { mount } from '@vue/test-utils'
import { describe, expect, it } from 'vitest'

import { DATA_CENTER_CONSTRUCTION_PAGE } from '~/common/modules/top-mining/pages/data-center-construction'
import DataCenterHero from '~/components/data-center-construction/hero/DataCenterHero.vue'
import TopMiningButton from '~/components/global/buttons/TopMiningButton.vue'

describe('DataCenterHero', () => {
  it('renders title, investment cards and CTA', () => {
    const wrapper = mount(DataCenterHero, {
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

    const hero = DATA_CENTER_CONSTRUCTION_PAGE.hero

    // RU is the default test locale — hero copy comes from i18n catalogs.
    expect(wrapper.text()).toContain(hero.title)
    expect(wrapper.text()).toContain(hero.titleAccent)
    expect(wrapper.text()).toContain(hero.investmentValue)
    expect(wrapper.text()).toContain(hero.paybackValue)
    expect(wrapper.text()).toContain(hero.ctaLabel)
    expect(wrapper.html()).toContain(hero.ctaHref)
  })
})
