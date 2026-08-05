import { mount } from '@vue/test-utils'
import { beforeEach, describe, expect, it, vi } from 'vitest'

const { useSeoMeta, definePageMeta } = vi.hoisted(() => ({
  useSeoMeta: vi.fn(),
  definePageMeta: vi.fn(),
}))

vi.stubGlobal('definePageMeta', definePageMeta)
vi.stubGlobal('useSeoMeta', useSeoMeta)

import { DATA_CENTER_CONSTRUCTION_PAGE } from '~/common/modules/top-mining/pages/data-center-construction'
import DataCenterConstructionPage from '~/pages/data-center-construction/index.vue'

describe('pages/data-center-construction', () => {
  beforeEach(() => {
    useSeoMeta.mockClear()
    definePageMeta.mockClear()
  })

  function mountPage() {
    return mount(DataCenterConstructionPage, {
      global: {
        stubs: {
          DataCenterHero: { template: '<section data-testid="data-center-hero" />' },
          'data-center-hero': { template: '<section data-testid="data-center-hero" />' },
          DataCenterAdvantages: {
            template: '<section data-testid="data-center-advantages" />',
          },
          'data-center-advantages': {
            template: '<section data-testid="data-center-advantages" />',
          },
          DataCenterDiscuss: {
            template: '<section data-testid="data-center-discuss" />',
          },
          'data-center-discuss': {
            template: '<section data-testid="data-center-discuss" />',
          },
          DataCenterOffer: { template: '<section data-testid="data-center-offer" />' },
          'data-center-offer': { template: '<section data-testid="data-center-offer" />' },
          DataCenterModels: { template: '<section data-testid="data-center-models" />' },
          'data-center-models': { template: '<section data-testid="data-center-models" />' },
          DataCenterWhyInvest: {
            template: '<section data-testid="data-center-why-invest" />',
          },
          'data-center-why-invest': {
            template: '<section data-testid="data-center-why-invest" />',
          },
          DataCenterStages: { template: '<section data-testid="data-center-stages" />' },
          'data-center-stages': {
            template: '<section data-testid="data-center-stages" />',
          },
          DataCenterLead: { template: '<section data-testid="data-center-lead" />' },
          'data-center-lead': { template: '<section data-testid="data-center-lead" />' },
          DataCenterPowerCompare: {
            template: '<section data-testid="data-center-power-compare" />',
          },
          'data-center-power-compare': {
            template: '<section data-testid="data-center-power-compare" />',
          },
          DataCenterConsult: {
            template: '<section data-testid="data-center-consult" />',
          },
          'data-center-consult': {
            template: '<section data-testid="data-center-consult" />',
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

    expect(wrapper.classes()).toContain('data-center-page')
    expect(sections).toEqual([
      'data-center-hero',
      'data-center-advantages',
      'data-center-discuss',
      'data-center-offer',
      'data-center-models',
      'data-center-why-invest',
      'data-center-stages',
      'data-center-lead',
      'data-center-power-compare',
      'data-center-consult',
    ])
  })

  it('sets page meta and seo from page data', () => {
    mountPage()

    expect(definePageMeta).toHaveBeenCalledWith({
      path: '/data-center-construction',
    })
    expect(useSeoMeta).toHaveBeenCalledWith({
      title: DATA_CENTER_CONSTRUCTION_PAGE.seoTitle,
      description: DATA_CENTER_CONSTRUCTION_PAGE.seoDescription,
    })
  })
})
