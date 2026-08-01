import { mount } from '@vue/test-utils'
import { describe, expect, it } from 'vitest'

import { STROITELSTVO_DATA_CZENTROV_PAGE } from '~/common/modules/top-mining/stroitelstvo-data-czentrov-page'
import StroyStages from '~/components/stroitelstvo/stages/StroyStages.vue'

describe('StroyStages', () => {
  it('renders title, stage cards, example badge and turnkey block', () => {
    const wrapper = mount(StroyStages)
    const stages = STROITELSTVO_DATA_CZENTROV_PAGE.stages

    expect(wrapper.text()).toContain(stages.title)
    expect(wrapper.findAll('.stroy-stages__card')).toHaveLength(
      stages.items.length,
    )
    expect(wrapper.text()).toContain(stages.items[0]!.title)
    expect(wrapper.findAll('.stroy-stages__example-badge').length).toBeGreaterThan(
      0,
    )
    expect(wrapper.text()).toContain('Заполнение площадки под ключ')
    expect(wrapper.find('.stroy-stages__intro--last').exists()).toBe(true)
  })

  it('renders both glow decorations', () => {
    const wrapper = mount(StroyStages)

    expect(wrapper.find('.stroy-stages__glow--1').exists()).toBe(true)
    expect(wrapper.find('.stroy-stages__glow--2').exists()).toBe(true)
  })
})
