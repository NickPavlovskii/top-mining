import type { Meta, StoryObj } from '@storybook/vue3'

import StroyHero from '~/components/stroitelstvo/hero/StroyHero.vue'
import TopMiningButton from '~/components/global/buttons/TopMiningButton.vue'

import { canvasFullBleed } from '../../helpers/decorators'

const meta = {
  title: 'Stroitelstvo/Hero/StroyHero',
  component: StroyHero,
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
} satisfies Meta<typeof StroyHero>

export default meta

type Story = StoryObj<typeof meta>

export const Default: Story = {
  render: () => ({
    components: {
      StroyHero,
      TopMiningButton,
      'top-mining-button': TopMiningButton,
    },
    template: '<StroyHero />',
  }),
}
