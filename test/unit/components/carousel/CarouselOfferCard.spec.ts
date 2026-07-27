import { mount } from '@vue/test-utils'
import { describe, expect, it } from 'vitest'

import CarouselOfferCard from '~/components/carousel/CarouselOfferCard.vue'

const defaultProps = {
  title: 'Свободно 40 МВт в Московской области',
  metaLabel: 'Цена за кВт/ч:',
  metaValue: 'опт от 4,7₽',
  location: 'Московская область',
  image: '/images/podbor-majning-otelya/placement/moscow-region.png',
  ctaLabel: 'Узнать тариф',
}

describe('CarouselOfferCard', () => {
  it('renders offer content', () => {
    const wrapper = mount(CarouselOfferCard, {
      props: defaultProps,
    })

    expect(wrapper.attributes('data-carousel-item')).toBeDefined()
    expect(wrapper.find('.carousel-offer-card__title').text()).toBe(defaultProps.title)
    expect(wrapper.find('.carousel-offer-card__meta-label').text()).toBe(
      defaultProps.metaLabel,
    )
    expect(wrapper.find('.carousel-offer-card__meta-value').text()).toBe(
      defaultProps.metaValue,
    )
    expect(wrapper.find('.carousel-offer-card__location').text()).toContain(
      defaultProps.location,
    )
    expect(wrapper.find('.carousel-offer-card__image').attributes('src')).toBe(
      defaultProps.image,
    )
    expect(wrapper.find('.carousel-offer-card__cta').text()).toContain(
      defaultProps.ctaLabel,
    )
  })

  it('emits cta when action is clicked', async () => {
    const wrapper = mount(CarouselOfferCard, {
      props: defaultProps,
    })

    await wrapper.find('.carousel-offer-card__cta').trigger('click')

    expect(wrapper.emitted('cta')).toHaveLength(1)
  })
})
