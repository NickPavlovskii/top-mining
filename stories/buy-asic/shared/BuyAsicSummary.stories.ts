import type { Meta, StoryObj } from '@storybook/vue3'

import BuyAsicSummary from '~/components/buy-asic/shared/BuyAsicSummary.vue'
import TopMiningIconList from '~/components/global/lists/TopMiningIconList.vue'
import TopMiningInput from '~/components/global/forms/TopMiningInput.vue'
import TopMiningPrivacyConsent from '~/components/global/forms/TopMiningPrivacyConsent.vue'

import { canvasFullBleed } from '../helpers/decorators'

const meta = {
  title: 'Buy ASIC/BuyAsicSummary',
  component: BuyAsicSummary,
  tags: ['autodocs', 'visual'],
  parameters: {
    layout: 'fullscreen',
    backgrounds: { default: 'landing-dark' },
    docs: {
      description: {
        component: `
Финальный блок «ИТОГО»: чеклист выгод, пояснение и форма заявки.
        `.trim(),
      },
    },
  },
  decorators: [canvasFullBleed],
} satisfies Meta<typeof BuyAsicSummary>

export default meta

type Story = StoryObj<typeof meta>

export const Default: Story = {
  render: () => ({
    components: {
      BuyAsicSummary,
      TopMiningIconList,
      TopMiningInput,
      TopMiningPrivacyConsent,
      'top-mining-icon-list': TopMiningIconList,
      'top-mining-input': TopMiningInput,
      'top-mining-privacy-consent': TopMiningPrivacyConsent,
    },
    template: '<BuyAsicSummary />',
  }),
}
