import { mount } from '@vue/test-utils'
import { describe, expect, it } from 'vitest'

import { HASHRATE_CONVERTER_PAGE } from '~/common/modules/top-mining/hashrate-converter-page'
import ConverterFaq from '~/components/converter/ConverterFaq.vue'

describe('ConverterFaq', () => {
  function mountFaq() {
    return mount(ConverterFaq)
  }

  it('renders FAQ title and all Q&A pairs', () => {
    const wrapper = mountFaq()
    const faq = HASHRATE_CONVERTER_PAGE.faq

    expect(wrapper.find('#converter-faq-title').text()).toBe(faq.title)
    expect(wrapper.findAll('.converter-faq__item')).toHaveLength(faq.items.length)
    expect(wrapper.text()).toContain(faq.items[0].question)
    expect(wrapper.text()).toContain(faq.items[2].answer)
  })

  it('matches faq snapshot', () => {
    expect(mountFaq().html()).toMatchSnapshot()
  })
})
