import { mount } from '@vue/test-utils'
import { describe, expect, it } from 'vitest'

import { HASHRATE_CONVERTER_PAGE } from '~/common/modules/top-mining/converter/page'
import ConverterAbout from '~/components/converter/ConverterAbout.vue'

describe('ConverterAbout', () => {
  function mountAbout() {
    return mount(ConverterAbout)
  }

  it('renders title, bullets and strong unit paragraph', () => {
    const wrapper = mountAbout()
    const about = HASHRATE_CONVERTER_PAGE.about

    expect(wrapper.find('#converter-about-title').text()).toBe(about.title)
    expect(wrapper.findAll('.converter-about__list li')).toHaveLength(
      about.features.length,
    )
    expect(wrapper.find('.converter-about__paragraph--strong').text()).toContain(
      'KH/s, MH/s, GH/s',
    )
  })

  it('matches about snapshot', () => {
    expect(mountAbout().html()).toMatchSnapshot()
  })
})
