import { mount } from '@vue/test-utils'
import { describe, expect, it } from 'vitest'

import { HASHRATE_CONVERTER_PAGE } from '~/common/modules/top-mining/converter/page'
import ConverterHero from '~/components/converter/ConverterHero.vue'

describe('ConverterHero', () => {
  function mountHero() {
    return mount(ConverterHero, {
      global: {
        stubs: {
          NuxtLink: {
            props: ['to'],
            template: '<a :href="to"><slot /></a>',
          },
        },
      },
    })
  }

  it('renders breadcrumbs and outline title', () => {
    const wrapper = mountHero()

    expect(wrapper.text()).toContain('Главная')
    expect(wrapper.text()).toContain(HASHRATE_CONVERTER_PAGE.breadcrumb)
    expect(wrapper.find('.converter-hero__title').text()).toContain(
      HASHRATE_CONVERTER_PAGE.hero.titleLead,
    )
    expect(wrapper.find('.converter-hero__title span').text()).toBe(
      HASHRATE_CONVERTER_PAGE.hero.titleAccent,
    )
  })

  it('matches hero snapshot', () => {
    expect(mountHero().html()).toMatchSnapshot()
  })
})
