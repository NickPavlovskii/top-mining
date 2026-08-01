import { mount } from '@vue/test-utils'
import { describe, expect, it } from 'vitest'

import { DATA_CENTER_CONSTRUCTION_PAGE } from '~/common/modules/top-mining/data-center-construction-page'
import DataCenterStages from '~/components/data-center-construction/stages/DataCenterStages.vue'

describe('DataCenterStages', () => {
  it('renders title, stage cards, example badge and turnkey block', () => {
    const wrapper = mount(DataCenterStages)
    const stages = DATA_CENTER_CONSTRUCTION_PAGE.stages

    expect(wrapper.text()).toContain(stages.title)
    expect(wrapper.findAll('.data-center-stages__card')).toHaveLength(
      stages.items.length,
    )
    expect(wrapper.text()).toContain(stages.items[0]!.title)
    expect(wrapper.findAll('.data-center-stages__example-badge').length).toBeGreaterThan(
      0,
    )
    expect(wrapper.text()).toContain('Заполнение площадки под ключ')
    expect(wrapper.find('.data-center-stages__intro--last').exists()).toBe(true)
  })

  it('renders both glow decorations', () => {
    const wrapper = mount(DataCenterStages)

    expect(wrapper.find('.data-center-stages__glow--1').exists()).toBe(true)
    expect(wrapper.find('.data-center-stages__glow--2').exists()).toBe(true)
  })
})
