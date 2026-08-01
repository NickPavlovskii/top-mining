import type { Meta, StoryObj } from '@storybook/vue3'

import DataCenterHero from '~/components/data-center-construction/hero/DataCenterHero.vue'
import TopMiningButton from '~/components/global/buttons/TopMiningButton.vue'

import { canvasFullBleed } from '../../helpers/decorators'

const meta = {
  title: 'Data Center Construction/Hero/DataCenterHero',
  component: DataCenterHero,
  tags: ['autodocs', 'visual'],
  parameters: {
    layout: 'fullscreen',
    backgrounds: { default: 'landing-dark' },
    docs: {
      description: {
        component:
          'Hero лендинга «Строительство дата-центров»: заголовок, карточки инвестиций/окупаемости, контейнер и CTA.',
      },
    },
  },
  decorators: [canvasFullBleed],
} satisfies Meta<typeof DataCenterHero>

export default meta

type Story = StoryObj<typeof meta>

export const Default: Story = {
  render: () => ({
    components: {
      DataCenterHero,
      TopMiningButton,
      'top-mining-button': TopMiningButton,
    },
    template: '<DataCenterHero />',
  }),
}
