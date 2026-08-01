import { mount } from '@vue/test-utils'
import { beforeEach, describe, expect, it, vi } from 'vitest'

const { useSeoMeta, definePageMeta } = vi.hoisted(() => ({
  useSeoMeta: vi.fn(),
  definePageMeta: vi.fn(),
}))

vi.stubGlobal('definePageMeta', definePageMeta)
vi.stubGlobal('useSeoMeta', useSeoMeta)

import { STROITELSTVO_DATA_CZENTROV_PAGE } from '~/common/modules/top-mining/stroitelstvo-data-czentrov-page'
import StroitelstvoDataCzentrovPage from '~/pages/stroitelstvo-data-czentrov/index.vue'

describe('pages/stroitelstvo-data-czentrov', () => {
  beforeEach(() => {
    useSeoMeta.mockClear()
    definePageMeta.mockClear()
  })

  function mountPage() {
    return mount(StroitelstvoDataCzentrovPage, {
      global: {
        stubs: {
          StroyHero: { template: '<section data-testid="stroy-hero" />' },
          'stroy-hero': { template: '<section data-testid="stroy-hero" />' },
          StroyAdvantages: {
            template: '<section data-testid="stroy-advantages" />',
          },
          'stroy-advantages': {
            template: '<section data-testid="stroy-advantages" />',
          },
          StroyOffer: { template: '<section data-testid="stroy-offer" />' },
          'stroy-offer': { template: '<section data-testid="stroy-offer" />' },
          StroyModels: { template: '<section data-testid="stroy-models" />' },
          'stroy-models': { template: '<section data-testid="stroy-models" />' },
          StroyWhyInvest: {
            template: '<section data-testid="stroy-why-invest" />',
          },
          'stroy-why-invest': {
            template: '<section data-testid="stroy-why-invest" />',
          },
          StroyStages: { template: '<section data-testid="stroy-stages" />' },
          'stroy-stages': {
            template: '<section data-testid="stroy-stages" />',
          },
          StroyLead: { template: '<section data-testid="stroy-lead" />' },
          'stroy-lead': { template: '<section data-testid="stroy-lead" />' },
          StroyPowerCompare: {
            template: '<section data-testid="stroy-power-compare" />',
          },
          'stroy-power-compare': {
            template: '<section data-testid="stroy-power-compare" />',
          },
          StroyConsult: {
            template: '<section data-testid="stroy-consult" />',
          },
          'stroy-consult': {
            template: '<section data-testid="stroy-consult" />',
          },
        },
      },
    })
  }

  it('renders page sections in order', () => {
    const wrapper = mountPage()
    const sections = wrapper
      .findAll('[data-testid]')
      .map((node) => node.attributes('data-testid'))

    expect(wrapper.classes()).toContain('stroy-page')
    expect(sections).toEqual([
      'stroy-hero',
      'stroy-advantages',
      'stroy-offer',
      'stroy-models',
      'stroy-why-invest',
      'stroy-stages',
      'stroy-lead',
      'stroy-power-compare',
      'stroy-consult',
    ])
  })

  it('sets page meta and seo from page data', () => {
    mountPage()

    expect(definePageMeta).toHaveBeenCalledWith({
      path: '/stroitelstvo-data-czentrov',
    })
    expect(useSeoMeta).toHaveBeenCalledWith({
      title: STROITELSTVO_DATA_CZENTROV_PAGE.seoTitle,
      description: STROITELSTVO_DATA_CZENTROV_PAGE.seoDescription,
    })
  })
})
