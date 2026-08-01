import { mount } from '@vue/test-utils'
import { describe, expect, it } from 'vitest'

import { DATA_CENTER_CONSTRUCTION_PAGE } from '~/common/modules/top-mining/data-center-construction-page'
import DataCenterConsult from '~/components/data-center-construction/cta/DataCenterConsult.vue'

describe('DataCenterConsult', () => {
  it('renders consult card via shared form component', () => {
    const wrapper = mount(DataCenterConsult, {
      global: {
        stubs: {
          DataCenterCtaFormCard: {
            props: ['title', 'text', 'submitLabel', 'variant'],
            template:
              '<div class="card-stub">{{ title }} {{ text }} {{ submitLabel }} {{ variant }}</div>',
          },
          'data-center-cta-form-card': {
            props: ['title', 'text', 'submitLabel', 'variant'],
            template:
              '<div class="card-stub">{{ title }} {{ text }} {{ submitLabel }} {{ variant }}</div>',
          },
        },
      },
    })

    const consult = DATA_CENTER_CONSTRUCTION_PAGE.consult

    expect(wrapper.attributes('id')).toBe(consult.id)
    expect(wrapper.text()).toContain('МЫ СТРОИМ ЛЮБЫЕ ДАТА-ЦЕНТРЫ.')
    expect(wrapper.text()).toContain(consult.submitLabel)
    expect(wrapper.text()).toContain('compact')
  })
})
