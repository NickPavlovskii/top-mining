import { mount } from '@vue/test-utils'
import { describe, expect, it } from 'vitest'

import { STROITELSTVO_DATA_CZENTROV_PAGE } from '~/common/modules/top-mining/stroitelstvo-data-czentrov-page'
import StroyLead from '~/components/stroitelstvo/cta/StroyLead.vue'

describe('StroyLead', () => {
  it('renders lead card via shared form component', () => {
    const wrapper = mount(StroyLead, {
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

    const lead = STROITELSTVO_DATA_CZENTROV_PAGE.lead

    expect(wrapper.attributes('id')).toBe(lead.id)
    expect(wrapper.text()).toContain(lead.title)
    expect(wrapper.text()).toContain(lead.submitLabel)
    expect(wrapper.text()).toContain('hero')
  })
})
