import { mount } from '@vue/test-utils'
import { beforeEach, describe, expect, it, vi } from 'vitest'

const { useSeoMeta, definePageMeta } = vi.hoisted(() => ({
  useSeoMeta: vi.fn(),
  definePageMeta: vi.fn(),
}))

vi.stubGlobal('definePageMeta', definePageMeta)
vi.stubGlobal('useSeoMeta', useSeoMeta)

import { CALCULATOR_PAGE } from '~/common/modules/top-mining/calculator-page'
import CalculatorPage from '~/pages/calculator/index.vue'

describe('pages/calculator', () => {
  beforeEach(() => {
    useSeoMeta.mockClear()
    definePageMeta.mockClear()
  })

  function mountPage() {
    return mount(CalculatorPage, {
      global: {
        stubs: {
          CalculatorHero: { template: '<section data-testid="calculator-hero" />' },
          'calculator-hero': { template: '<section data-testid="calculator-hero" />' },
          CalculatorAbout: { template: '<section data-testid="calculator-about" />' },
          'calculator-about': { template: '<section data-testid="calculator-about" />' },
          TopMiningEpicBlocks: {
            template: '<section data-testid="calculator-epic-blocks" />',
          },
          'top-mining-epic-blocks': {
            template: '<section data-testid="calculator-epic-blocks" />',
          },
        },
      },
    })
  }

  it('renders calculator hero, about and epic blocks', () => {
    const wrapper = mountPage()
    expect(wrapper.find('[data-testid="calculator-hero"]').exists()).toBe(true)
    expect(wrapper.find('[data-testid="calculator-about"]').exists()).toBe(true)
    expect(wrapper.find('[data-testid="calculator-epic-blocks"]').exists()).toBe(
      true,
    )
  })

  it('sets page path and seo meta', () => {
    mountPage()
    expect(definePageMeta).toHaveBeenCalledWith({ path: '/calculator' })
    expect(useSeoMeta).toHaveBeenCalledWith({
      title: CALCULATOR_PAGE.seoTitle,
      description: CALCULATOR_PAGE.seoDescription,
    })
  })
})
