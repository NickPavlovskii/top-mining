import { mount } from '@vue/test-utils'
import { describe, expect, it } from 'vitest'

import { DATA_CENTER_CONSTRUCTION_PAGE } from '~/common/modules/top-mining/pages/data-center-construction'
import DataCenterLead from '~/components/data-center-construction/cta/DataCenterLead.vue'

describe('DataCenterLead', () => {
  it('renders lead card via shared form component', () => {
    const wrapper = mount(DataCenterLead, {
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

    const lead = DATA_CENTER_CONSTRUCTION_PAGE.lead

    expect(wrapper.attributes('id')).toBe(lead.id)
    expect(wrapper.text()).toContain(lead.title)
    expect(wrapper.text()).toContain(lead.submitLabel)
    expect(wrapper.text()).toContain('hero')
  })
})
