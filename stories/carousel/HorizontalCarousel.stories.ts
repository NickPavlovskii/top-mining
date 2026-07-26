import type { Meta, StoryObj } from '@storybook/vue3'

import CarouselAddCard from '~/components/carousel/CarouselAddCard.vue'
import CarouselOfferCard from '~/components/carousel/CarouselOfferCard.vue'
import HorizontalCarousel from '~/components/carousel/HorizontalCarousel.vue'

import { canvasFullBleed } from '../helpers/decorators'

type HorizontalCarouselArgs = {
  title: string
  titleId: string
  itemSelector?: string
  gap?: number
}

const sampleOffers = [
  {
    id: 'moscow',
    title: 'Свободно 40 МВт в Московской области',
    metaLabel: 'Цена за кВт/ч:',
    metaValue: 'опт от 4,7₽',
    location: 'Московская область',
    image: '/images/podbor-majning-otelya/placement/moscow-region.png',
    ctaLabel: 'Узнать тариф',
  },
  {
    id: 'tula',
    title: 'Продается площадка 10 МВт в Туле',
    metaLabel: 'Мощность площадки:',
    metaValue: '10 МВт',
    location: 'Тула',
    image: '/images/podbor-majning-otelya/sale/tula.png',
    ctaLabel: 'Узнать цену',
  },
  {
    id: 'other',
    title: 'Другие регионы РФ',
    metaLabel: 'Цена за кВт/ч:',
    metaValue: 'от 4,6₽',
    location: 'Другие регионы РФ',
    image: '/images/podbor-majning-otelya/sale/other-regions.png',
    ctaLabel: 'Узнать тариф',
  },
] as const

const meta: Meta<HorizontalCarouselArgs> = {
  title: 'Carousel/HorizontalCarousel',
  component: HorizontalCarousel,
  tags: ['autodocs'],
  parameters: {
    layout: 'fullscreen',
    backgrounds: { default: 'landing-dark' },
    docs: {
      description: {
        component: `
Горизонтальная карусель с заголовком, стрелками и drag-scroll.

- **title** / **titleId** — заголовок секции и \`id\` для a11y
- **itemSelector** — CSS-селектор шага прокрутки (по умолчанию \`[data-carousel-item]\`)
- Контент передаётся через default slot (\`CarouselOfferCard\`, \`CarouselAddCard\` и т.п.)
        `.trim(),
      },
    },
  },
  argTypes: {
    title: { control: 'text' },
    titleId: { control: 'text' },
    itemSelector: { control: 'text' },
    gap: { control: 'number' },
  },
  decorators: [canvasFullBleed],
}

export default meta

type Story = StoryObj<typeof meta>

export const Default: Story = {
  args: {
    title: 'Размещение',
    titleId: 'sb-carousel-placement',
  },
  render: (args) => ({
    components: {
      HorizontalCarousel,
      CarouselOfferCard,
      CarouselAddCard,
    },
    setup() {
      return { args, offers: sampleOffers }
    },
    template: `
      <HorizontalCarousel v-bind="args">
        <CarouselOfferCard
          v-for="offer in offers"
          :key="offer.id"
          :title="offer.title"
          :meta-label="offer.metaLabel"
          :meta-value="offer.metaValue"
          :location="offer.location"
          :image="offer.image"
          :cta-label="offer.ctaLabel"
        />
        <CarouselAddCard label="Добавить свою карточку" />
      </HorizontalCarousel>
    `,
  }),
  parameters: {
    docs: {
      description: {
        story: 'Карусель с карточками офферов и кнопкой добавления.',
      },
    },
  },
}

export const Sale: Story = {
  args: {
    title: 'Продажа',
    titleId: 'sb-carousel-sale',
  },
  render: (args) => ({
    components: {
      HorizontalCarousel,
      CarouselOfferCard,
      CarouselAddCard,
    },
    setup() {
      const offers = sampleOffers.map((offer) => ({
        ...offer,
        ctaLabel: 'Узнать цену',
        metaLabel: 'Мощность площадки:',
      }))

      return { args, offers }
    },
    template: `
      <HorizontalCarousel v-bind="args">
        <CarouselOfferCard
          v-for="offer in offers"
          :key="offer.id"
          :title="offer.title"
          :meta-label="offer.metaLabel"
          :meta-value="offer.metaValue"
          :location="offer.location"
          :image="offer.image"
          :cta-label="offer.ctaLabel"
        />
        <CarouselAddCard label="Добавить свою карточку" />
      </HorizontalCarousel>
    `,
  }),
  parameters: {
    docs: {
      description: {
        story: 'Тот же блок для секции «Продажа».',
      },
    },
  },
}

export const OfferCard: Story = {
  render: () => ({
    components: { CarouselOfferCard },
    setup() {
      return { offer: sampleOffers[0] }
    },
    template: `
      <div style="padding: 24px; background: #141414">
        <CarouselOfferCard
          :title="offer.title"
          :meta-label="offer.metaLabel"
          :meta-value="offer.metaValue"
          :location="offer.location"
          :image="offer.image"
          :cta-label="offer.ctaLabel"
        />
      </div>
    `,
  }),
  parameters: {
    docs: {
      description: { story: 'Отдельная карточка оффера.' },
    },
  },
}

export const AddCard: Story = {
  render: () => ({
    components: { CarouselAddCard },
    template: `
      <div style="padding: 24px; background: #141414">
        <CarouselAddCard label="Добавить свою карточку" />
      </div>
    `,
  }),
  parameters: {
    docs: {
      description: { story: 'Кнопка добавления своей карточки.' },
    },
  },
}
