import { mount } from '@vue/test-utils'
import { describe, expect, it } from 'vitest'

import type { DataCenterCtaFormCardProps } from '~/common/modules/top-mining/data-center-construction-page'
import DataCenterCtaFormCard from '~/components/data-center-construction/shared/DataCenterCtaFormCard.vue'
import TopMiningButton from '~/components/global/buttons/TopMiningButton.vue'
import TopMiningInput from '~/components/global/forms/TopMiningInput.vue'
import TopMiningPrivacyConsent from '~/components/global/forms/TopMiningPrivacyConsent.vue'

describe('DataCenterCtaFormCard', () => {
  function mountCard(props: Partial<DataCenterCtaFormCardProps> = {}) {
    return mount(DataCenterCtaFormCard, {
      props: {
        title: 'Заголовок\nвторая строка',
        text: 'Подпись формы',
        submitLabel: 'ОТПРАВИТЬ',
        ...props,
      },
      global: {
        components: {
          TopMiningButton,
          'top-mining-button': TopMiningButton,
          TopMiningInput,
          'top-mining-input': TopMiningInput,
          TopMiningPrivacyConsent,
          'top-mining-privacy-consent': TopMiningPrivacyConsent,
        },
        stubs: {
          TopMiningCheckbox: {
            template: '<label class="checkbox-stub"><slot /></label>',
          },
          'top-mining-checkbox': {
            template: '<label class="checkbox-stub"><slot /></label>',
          },
        },
      },
    })
  }

  it('renders title lines, text and form', () => {
    const wrapper = mountCard()

    expect(wrapper.text()).toContain('Заголовок')
    expect(wrapper.text()).toContain('вторая строка')
    expect(wrapper.text()).toContain('Подпись формы')
    expect(wrapper.find('input[name="your-telegram"]').exists()).toBe(true)
    expect(wrapper.text()).toContain('ОТПРАВИТЬ')
  })

  it('applies compact variant class', () => {
    const wrapper = mountCard({ variant: 'compact' })

    expect(wrapper.classes()).toContain('data-center-cta-form-card--compact')
  })

  it('emits submit with phone when privacy accepted', async () => {
    const wrapper = mountCard()
    const phone = wrapper.find('input[name="your-telegram"]')

    await phone.setValue('+79990001122')
    await wrapper.find('form').trigger('submit')

    expect(wrapper.emitted('submit')?.[0]).toEqual([
      { phone: '+79990001122' },
    ])
  })
})
