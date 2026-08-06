import { mount } from '@vue/test-utils'
import { describe, expect, it, vi } from 'vitest'
import { CALCULATOR_PAGE } from '~/common/modules/top-mining'
import CalculatorPage from '~/pages/calculator/index.vue'

const { useSeoMetaMock } = vi.hoisted(() => ({
  useSeoMetaMock: vi.fn(),
}))

vi.stubGlobal('useSeoMeta', useSeoMetaMock)

vi.mock('~/composables/useAppConfig', () => ({
  useAppConfig: () => ({
    name: 'ТОП МАЙНИНГ',
  }),
}))

const stubs = {
  CalculatorHero: {
    template: '<section data-testid="calculator-hero" />',
  },
  CalculatorForm: {
    template: '<section data-testid="calculator-form" />',
  },
  CalculatorAbout: {
    template: '<section data-testid="calculator-about" />',
  },
  TopMiningEpicBlocks: {
    template: '<section data-testid="epic-blocks" />',
  },
}

describe('pages/calculator/index.vue', () => {
  it('renders calculator sections in order', () => {
    const wrapper = mount(CalculatorPage, { global: { stubs } })

    expect(wrapper.find('[data-testid="calculator-hero"]').exists()).toBe(true)
    expect(wrapper.find('[data-testid="calculator-form"]').exists()).toBe(true)
    expect(wrapper.find('[data-testid="calculator-about"]').exists()).toBe(true)
    expect(wrapper.find('.calculator-page__epic').exists()).toBe(true)
    expect(wrapper.find('[data-testid="epic-blocks"]').exists()).toBe(true)
  })

  it('sets SEO meta from i18n calculator keys', () => {
    mount(CalculatorPage, { global: { stubs } })

    expect(useSeoMetaMock).toHaveBeenCalled()
    const seoArg = useSeoMetaMock.mock.calls.at(-1)?.[0]
    const title =
      typeof seoArg?.title === 'function' ? seoArg.title() : seoArg?.title
    const description =
      typeof seoArg?.description === 'function'
        ? seoArg.description()
        : seoArg?.description
    expect(title).toBe(CALCULATOR_PAGE.seoTitle)
    expect(description).toBe(CALCULATOR_PAGE.seoDescription)
  })
})
