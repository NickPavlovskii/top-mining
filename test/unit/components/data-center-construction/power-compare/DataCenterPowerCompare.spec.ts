import { mount } from '@vue/test-utils'
import { describe, expect, it } from 'vitest'

import { DATA_CENTER_CONSTRUCTION_PAGE } from '~/common/modules/top-mining/data-center-construction-page'
import DataCenterPowerCompare from '~/components/data-center-construction/power-compare/DataCenterPowerCompare.vue'

describe('DataCenterPowerCompare', () => {
  it('renders title, both columns and comparison rows', () => {
    const wrapper = mount(DataCenterPowerCompare)
    const copy = DATA_CENTER_CONSTRUCTION_PAGE.powerCompare

    expect(wrapper.text()).toContain(copy.title)
    expect(wrapper.findAll('.data-center-power__card')).toHaveLength(2)
    expect(wrapper.text()).toContain('Газ')
    expect(wrapper.text()).toContain('Электросеть')
    expect(wrapper.findAll('.data-center-power__list li')).toHaveLength(
      copy.columns[0]!.items.length + copy.columns[1]!.items.length,
    )
    expect(wrapper.find('.data-center-power__vs').exists()).toBe(true)
  })
})
