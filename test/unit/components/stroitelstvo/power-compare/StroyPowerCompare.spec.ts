import { mount } from '@vue/test-utils'
import { describe, expect, it } from 'vitest'

import { STROITELSTVO_DATA_CZENTROV_PAGE } from '~/common/modules/top-mining/stroitelstvo-data-czentrov-page'
import StroyPowerCompare from '~/components/stroitelstvo/power-compare/StroyPowerCompare.vue'

describe('StroyPowerCompare', () => {
  it('renders title, both columns and comparison rows', () => {
    const wrapper = mount(StroyPowerCompare)
    const copy = STROITELSTVO_DATA_CZENTROV_PAGE.powerCompare

    expect(wrapper.text()).toContain(copy.title)
    expect(wrapper.findAll('.stroy-power__card')).toHaveLength(2)
    expect(wrapper.text()).toContain('Газ')
    expect(wrapper.text()).toContain('Электросеть')
    expect(wrapper.findAll('.stroy-power__list li')).toHaveLength(
      copy.columns[0]!.items.length + copy.columns[1]!.items.length,
    )
    expect(wrapper.find('.stroy-power__vs').exists()).toBe(true)
  })
})
