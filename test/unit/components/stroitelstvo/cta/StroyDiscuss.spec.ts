import { mount } from '@vue/test-utils'
import { describe, expect, it } from 'vitest'

import { STROITELSTVO_DATA_CZENTROV_PAGE } from '~/common/modules/top-mining/stroitelstvo-data-czentrov-page'
import StroyDiscuss from '~/components/stroitelstvo/cta/StroyDiscuss.vue'

describe('StroyDiscuss', () => {
  it('renders discuss title, text and submit label', () => {
    const wrapper = mount(StroyDiscuss, {
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

    const discuss = STROITELSTVO_DATA_CZENTROV_PAGE.discuss

    expect(wrapper.attributes('id')).toBe(discuss.id)
    expect(wrapper.text()).toContain(discuss.title)
    expect(wrapper.text()).toContain(discuss.text)
    expect(wrapper.text()).toContain(discuss.submitLabel)
  })
})
