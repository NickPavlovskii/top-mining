import { mount } from '@vue/test-utils'
import { describe, expect, it } from 'vitest'

import ConsultingBestSpeaker from '~/components/consulting/ConsultingBestSpeaker.vue'
import { CONSULTING_BEST_SPEAKER } from '~/common/modules/top-mining/consulting/best-speaker'

describe('ConsultingBestSpeaker', () => {
  function mountSection() {
    return mount(ConsultingBestSpeaker, {
      global: {
        stubs: {
          TopMiningFileUpload: true,
          'top-mining-file-upload': true,
          ConsultingDiagonalArrowIcon: true,
          'consulting-diagonal-arrow-icon': true,
        },
      },
    })
  }

  it('renders section anchor, title and telegram link', () => {
    const wrapper = mountSection()

    expect(wrapper.find('#best-speker').exists()).toBe(true)
    expect(wrapper.find('#consulting-best-speaker-title').text()).toBe(
      CONSULTING_BEST_SPEAKER.title,
    )
    expect(wrapper.text()).toContain(CONSULTING_BEST_SPEAKER.subtitle)
    expect(wrapper.text()).toContain(CONSULTING_BEST_SPEAKER.anonymityNote)

    const telegram = wrapper.find('.consulting-best-speaker__link')

    expect(telegram.text()).toBe(CONSULTING_BEST_SPEAKER.telegramLabel)
    expect(telegram.attributes('href')).toBe(CONSULTING_BEST_SPEAKER.telegramHref)
  })

  it('renders form fields and submit', () => {
    const wrapper = mountSection()

    expect(wrapper.find('input[name="your-name"]').exists()).toBe(true)
    expect(wrapper.find('input[name="your-telegram"]').exists()).toBe(true)
    expect(wrapper.find('textarea[name="textarea-best"]').exists()).toBe(true)
    expect(wrapper.find('.consulting-best-speaker__submit').text()).toContain(
      CONSULTING_BEST_SPEAKER.submitLabel,
    )
    expect(wrapper.findComponent({ name: 'TopMiningFileUpload' }).exists()
      || wrapper.find('top-mining-file-upload-stub').exists()).toBe(true)
  })

  it('matches section snapshot', () => {
    const wrapper = mountSection()

    expect(wrapper.html()).toMatchSnapshot()
  })
})
