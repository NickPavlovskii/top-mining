import { mount } from '@vue/test-utils'
import { describe, expect, it } from 'vitest'

import { DATA_CENTER_CONSTRUCTION_PAGE } from '~/common/modules/top-mining/pages/data-center-construction'
import DataCenterDiscuss from '~/components/data-center-construction/cta/DataCenterDiscuss.vue'

describe('DataCenterDiscuss', () => {
  it('renders discuss title, text and submit label', () => {
    const wrapper = mount(DataCenterDiscuss, {
      global: {
        stubs: {
          TopMiningButton: {
            props: ['title'],
            template: '<button type="submit">{{ title }}</button>',
          },
          'top-mining-button': {
            props: ['title'],
            template: '<button type="submit">{{ title }}</button>',
          },
          TopMiningInput: {
            template: '<input />',
          },
          'top-mining-input': {
            template: '<input />',
          },
          TopMiningPrivacyConsent: {
            template: '<div class="privacy-stub" />',
          },
          'top-mining-privacy-consent': {
            template: '<div class="privacy-stub" />',
          },
        },
      },
    })

    const discuss = DATA_CENTER_CONSTRUCTION_PAGE.discuss

    expect(wrapper.attributes('id')).toBe(discuss.id)
    expect(wrapper.text()).toContain(discuss.title)
    expect(wrapper.text()).toContain(discuss.text)
    expect(wrapper.text()).toContain(discuss.submitLabel)
  })
})
