import { mount } from '@vue/test-utils'
import { describe, expect, it } from 'vitest'

import CarouselAddCard from '~/components/carousel/CarouselAddCard.vue'

describe('CarouselAddCard', () => {
  it('renders label and carousel item marker', () => {
    const wrapper = mount(CarouselAddCard, {
      props: {
        label: 'Добавить свою карточку',
      },
    })

    expect(wrapper.element.tagName).toBe('BUTTON')
    expect(wrapper.attributes('data-carousel-item')).toBeDefined()
    expect(wrapper.text()).toContain('Добавить свою карточку')
  })

  it('emits click', async () => {
    const wrapper = mount(CarouselAddCard, {
      props: {
        label: 'Добавить свою карточку',
      },
    })

    await wrapper.trigger('click')

    expect(wrapper.emitted('click')).toHaveLength(1)
  })
})
