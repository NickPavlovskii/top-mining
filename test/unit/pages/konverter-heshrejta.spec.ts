import { mount } from '@vue/test-utils'
import { describe, expect, it, vi } from 'vitest'
import { HASHRATE_CONVERTER_PAGE } from '~/common/modules/top-mining/converter/page'
import HashrateConverterPage from '~/pages/konverter-heshrejta/index.vue'

const { useSeoMetaMock, definePageMetaMock } = vi.hoisted(() => ({
  useSeoMetaMock: vi.fn(),
  definePageMetaMock: vi.fn(),
}))

vi.stubGlobal('useSeoMeta', useSeoMetaMock)
vi.stubGlobal('definePageMeta', definePageMetaMock)

vi.mock('~/composables/useAppConfig', () => ({
  useAppConfig: () => ({
    name: 'ТОП МАЙНИНГ',
  }),
}))

const stubs = {
  ConverterHero: {
    template: '<section data-testid="converter-hero" />',
  },
  HashrateConverterWidget: {
    template: '<section data-testid="converter-widget" />',
  },
  ConverterAbout: {
    template: '<section data-testid="converter-about" />',
  },
  ConverterFaq: {
    template: '<section data-testid="converter-faq" />',
  },
  TopMiningEpicBlocks: {
    template: '<section data-testid="epic-blocks" />',
  },
}

describe('pages/konverter-heshrejta/index.vue', () => {
  it('renders converter sections in order', () => {
    const wrapper = mount(HashrateConverterPage, { global: { stubs } })

    expect(wrapper.find('[data-testid="converter-hero"]').exists()).toBe(true)
    expect(wrapper.find('[data-testid="converter-widget"]').exists()).toBe(true)
    expect(wrapper.find('[data-testid="converter-about"]').exists()).toBe(true)
    expect(wrapper.find('[data-testid="converter-faq"]').exists()).toBe(true)
    expect(wrapper.find('[data-testid="epic-blocks"]').exists()).toBe(true)
  })

  it('sets SEO meta from HASHRATE_CONVERTER_PAGE', () => {
    mount(HashrateConverterPage, { global: { stubs } })

    expect(useSeoMetaMock).toHaveBeenCalled()
    const seoArg = useSeoMetaMock.mock.calls.at(-1)?.[0]
    expect(seoArg?.title).toBe(HASHRATE_CONVERTER_PAGE.seoTitle)
    expect(seoArg?.description).toBe(HASHRATE_CONVERTER_PAGE.seoDescription)
  })
})
