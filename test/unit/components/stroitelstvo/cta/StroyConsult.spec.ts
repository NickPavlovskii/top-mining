import { mount } from '@vue/test-utils'
import { describe, expect, it } from 'vitest'

import { STROITELSTVO_DATA_CZENTROV_PAGE } from '~/common/modules/top-mining/stroitelstvo-data-czentrov-page'
import StroyConsult from '~/components/stroitelstvo/cta/StroyConsult.vue'

describe('StroyConsult', () => {
  it('renders consult card via shared form component', () => {
    const wrapper = mount(StroyConsult, {
      global: {
        stubs: {
          StroyCtaFormCard: {
            props: ['title', 'text', 'submitLabel', 'variant'],
            template:
              '<div class="card-stub">{{ title }} {{ text }} {{ submitLabel }} {{ variant }}</div>',
          },
          'stroy-cta-form-card': {
            props: ['title', 'text', 'submitLabel', 'variant'],
            template:
              '<div class="card-stub">{{ title }} {{ text }} {{ submitLabel }} {{ variant }}</div>',
          },
        },
      },
    })

    const consult = STROITELSTVO_DATA_CZENTROV_PAGE.consult

    expect(wrapper.attributes('id')).toBe(consult.id)
    expect(wrapper.text()).toContain('МЫ СТРОИМ ЛЮБЫЕ ДАТА-ЦЕНТРЫ.')
    expect(wrapper.text()).toContain(consult.submitLabel)
    expect(wrapper.text()).toContain('compact')
  })
})
