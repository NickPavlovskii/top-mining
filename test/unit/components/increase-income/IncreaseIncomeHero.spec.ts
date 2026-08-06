import { mount } from '@vue/test-utils'
import { describe, expect, it } from 'vitest'

import IncreaseIncomeHero from '~/components/increase-income/IncreaseIncomeHero.vue'
import { INCREASE_INCOME_PAGE } from '~/common/modules/top-mining/pages/increase-income'

describe('IncreaseIncomeHero', () => {
  function mountSection() {
    return mount(IncreaseIncomeHero, {
      global: {
        stubs: {
          ConsultingDiagonalArrowIcon: true,
          'consulting-diagonal-arrow-icon': true,
          TopMiningFormStatus: true,
          'top-mining-form-status': true,
        },
      },
    })
  }

  it('renders breadcrumbs, title and card copy', () => {
    const wrapper = mountSection()

    expect(wrapper.text()).toContain('Главная')
    expect(wrapper.text()).toContain(INCREASE_INCOME_PAGE.breadcrumb)
    expect(wrapper.find('.increase-income-hero__title-lead').text()).toBe(
      INCREASE_INCOME_PAGE.titleLead,
    )
    expect(wrapper.text()).toContain(INCREASE_INCOME_PAGE.titleMain)
    expect(wrapper.text()).toContain(INCREASE_INCOME_PAGE.cardLead)
    expect(wrapper.text()).toContain(INCREASE_INCOME_PAGE.cardCta)
  })

  it('renders phone form and privacy link', () => {
    const wrapper = mountSection()

    expect(wrapper.find('input[name="your-telegram"]').exists()).toBe(true)
    expect(wrapper.find('.increase-income-hero__submit').text()).toContain(
      INCREASE_INCOME_PAGE.submitLabel,
    )
    expect(wrapper.find('.top-mining-privacy-consent__link').attributes('href')).toBe(
      INCREASE_INCOME_PAGE.privacyHref,
    )
  })

  it('matches section snapshot', () => {
    const wrapper = mountSection()

    expect(wrapper.html()).toMatchSnapshot()
  })
})
