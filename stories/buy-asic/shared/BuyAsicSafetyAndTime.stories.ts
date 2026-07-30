import type { Meta, StoryObj } from '@storybook/vue3'

import BuyAsicSafetyAndTime from '~/components/buy-asic/shared/BuyAsicSafetyAndTime.vue'
import TopMiningButton from '~/components/global/buttons/TopMiningButton.vue'

import { canvasFullBleed } from '../helpers/decorators'

const meta = {
  title: 'Buy ASIC/BuyAsicSafetyAndTime',
  component: BuyAsicSafetyAndTime,
  tags: ['autodocs', 'visual'],
  parameters: {
    layout: 'fullscreen',
    backgrounds: { default: 'landing-dark' },
    docs: {
      description: {
        component: `
Секция «100% безопасность» + «100+ часов» (block-3).

Карточки с раскрывающимися списками и CTA на модели / increase-income.
        `.trim(),
      },
    },
  },
  decorators: [canvasFullBleed],
} satisfies Meta<typeof BuyAsicSafetyAndTime>

export default meta

type Story = StoryObj<typeof meta>

export const Default: Story = {
  render: () => ({
    components: {
      BuyAsicSafetyAndTime,
      TopMiningButton,
      'top-mining-button': TopMiningButton,
    },
    template: '<BuyAsicSafetyAndTime />',
  }),
}
