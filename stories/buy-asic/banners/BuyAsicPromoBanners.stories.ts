import type { Meta, StoryObj } from '@storybook/vue3'

import BuyAsicPromoBanners from '~/components/buy-asic/banners/BuyAsicPromoBanners.vue'
import PodborMiningHotelPromoBanner from '~/components/podbor/banners/PodborMiningHotelPromoBanner.vue'
import TopMiningButton from '~/components/global/buttons/TopMiningButton.vue'

import { canvasFullBleed } from '../helpers/decorators'

const meta = {
  title: 'Buy ASIC/BuyAsicPromoBanners',
  component: BuyAsicPromoBanners,
  tags: ['autodocs', 'visual'],
  parameters: {
    layout: 'fullscreen',
    backgrounds: { default: 'landing-dark' },
    docs: {
      description: {
        component: `
Промо-баннеры после «ИТОГО»: майнинг-отель и увеличение дохода.
        `.trim(),
      },
    },
  },
  decorators: [canvasFullBleed],
} satisfies Meta<typeof BuyAsicPromoBanners>

export default meta

type Story = StoryObj<typeof meta>

export const Default: Story = {
  render: () => ({
    components: {
      BuyAsicPromoBanners,
      PodborMiningHotelPromoBanner,
      TopMiningButton,
      'podbor-mining-hotel-promo-banner': PodborMiningHotelPromoBanner,
      'top-mining-button': TopMiningButton,
    },
    template: '<BuyAsicPromoBanners />',
  }),
}
