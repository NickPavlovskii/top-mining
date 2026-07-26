import { mount } from '@vue/test-utils'
import { describe, expect, it, vi } from 'vitest'

import HorizontalCarousel from '~/components/carousel/HorizontalCarousel.vue'

function mountCarousel(slot = '<div data-carousel-item style="width: 200px">card</div>') {
  return mount(HorizontalCarousel, {
    props: {
      title: 'Размещение',
      titleId: 'test-carousel-title',
    },
    slots: {
      default: slot,
    },
  })
}

function mockTrackOverflow(
  track: HTMLElement,
  options: { scrollWidth: number; clientWidth: number; scrollLeft?: number },
) {
  Object.defineProperty(track, 'scrollWidth', {
    configurable: true,
    get: () => options.scrollWidth,
  })
  Object.defineProperty(track, 'clientWidth', {
    configurable: true,
    get: () => options.clientWidth,
  })
  Object.defineProperty(track, 'scrollLeft', {
    configurable: true,
    writable: true,
    value: options.scrollLeft ?? 0,
  })
}

describe('HorizontalCarousel', () => {
  it('renders title and navigation buttons', () => {
    const wrapper = mountCarousel()

    expect(wrapper.find('#test-carousel-title').text()).toBe('Размещение')
    expect(wrapper.find('[aria-label="Прокрутить влево"]').exists()).toBe(true)
    expect(wrapper.find('[aria-label="Прокрутить вправо"]').exists()).toBe(true)
    expect(wrapper.find('[data-carousel-item]').text()).toBe('card')
  })

  it('marks nav buttons inactive when track has no overflow', async () => {
    const wrapper = mountCarousel()
    const track = wrapper.find('.horizontal-carousel__track').element as HTMLElement

    mockTrackOverflow(track, { scrollWidth: 300, clientWidth: 300 })
    window.dispatchEvent(new Event('resize'))
    await wrapper.vm.$nextTick()

    expect(
      wrapper.find('[aria-label="Прокрутить влево"]').classes(),
    ).toContain('horizontal-carousel__nav-btn--inactive')
    expect(
      wrapper.find('[aria-label="Прокрутить вправо"]').classes(),
    ).toContain('horizontal-carousel__nav-btn--inactive')
  })

  it('scrolls right when next button is clicked', async () => {
    const wrapper = mountCarousel()
    const track = wrapper.find('.horizontal-carousel__track').element as HTMLElement
    const scrollBy = vi.fn()

    mockTrackOverflow(track, { scrollWidth: 1200, clientWidth: 400, scrollLeft: 0 })
    track.scrollBy = scrollBy

    window.dispatchEvent(new Event('resize'))
    await wrapper.vm.$nextTick()

    await wrapper.find('[aria-label="Прокрутить вправо"]').trigger('click')

    expect(scrollBy).toHaveBeenCalledWith({
      left: expect.any(Number),
      behavior: 'smooth',
    })
    expect(scrollBy.mock.calls[0]?.[0].left).toBeGreaterThan(0)
  })

  it('does not start drag on interactive targets', async () => {
    const wrapper = mountCarousel(
      '<button data-carousel-item type="button">cta</button>',
    )
    const track = wrapper.find('.horizontal-carousel__track')
    const button = wrapper.find('button[data-carousel-item]')

    await button.trigger('pointerdown', { button: 0, clientX: 100 })
    await track.trigger('pointermove', { clientX: 40 })

    expect(track.classes()).not.toContain('horizontal-carousel__track--dragging')
  })
})
