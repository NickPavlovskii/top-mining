import type { Meta, StoryObj } from '@storybook/vue3'

import bannerAsic from '~/assets/images/increase-income/banner-asic.png'
import bannerHotel from '~/assets/images/increase-income/banner-hotel.png'
import TopMiningPromoBanner from '~/components/global/banners/TopMiningPromoBanner.vue'

const meta = {
  title: 'Global/TopMiningPromoBanner',
  component: TopMiningPromoBanner,
  tags: ['visual'],
  parameters: {
    layout: 'padded',
    backgrounds: { default: 'light' },
  },
  decorators: [
    () => ({
      template: '<div style="max-width: 1200px; margin: 0 auto; background: #f6f6f6; padding: 24px;"><story /></div>',
    }),
  ],
} satisfies Meta<typeof TopMiningPromoBanner>

export default meta

type Story = StoryObj<typeof meta>

export const Asic: Story = {
  args: {
    title: 'Найдем для вас самые выгодные и дешевые асики',
    href: '/asic-majnery-po-czenam-nizhe-rynka/',
    buttonLabel: 'ПЕРЕЙТИ НА СТРАНИЦУ',
    image: bannerAsic,
    imageAlt: 'ASIC-майнеры',
  },
}

export const Hotel: Story = {
  args: {
    title: 'Улучшим ваш тариф на майнинг-отель',
    href: '/podbor-majning-otelya/',
    buttonLabel: 'ПЕРЕЙТИ НА СТРАНИЦУ',
    image: bannerHotel,
    imageAlt: 'Лампочка с Bitcoin',
  },
}

export const Both: Story = {
  render: () => ({
    components: { TopMiningPromoBanner },
    setup() {
      return {
        asic: Asic.args,
        hotel: Hotel.args,
      }
    },
    template: `
      <div style="display: flex; flex-direction: column; gap: 24px;">
        <top-mining-promo-banner v-bind="asic" />
        <top-mining-promo-banner v-bind="hotel" />
      </div>
    `,
  }),
}
