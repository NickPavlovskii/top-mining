import type { Meta, StoryObj } from '@storybook/vue3'

import CalculatorHero from '~/components/calculator/hero/CalculatorHero.vue'

import { canvasFullBleed } from '../../helpers/decorators'

const meta = {
  title: 'Calculator/Hero/CalculatorHero',
  component: CalculatorHero,
  tags: ['autodocs', 'visual'],
  parameters: {
    layout: 'fullscreen',
    backgrounds: { default: 'landing-dark' },
    docs: {
      description: {
        component:
          'Hero страницы майнинг-калькулятора: breadcrumbs, ряд логотипов производителей, заголовок и иллюстрация.',
      },
    },
  },
  decorators: [canvasFullBleed],
} satisfies Meta<typeof CalculatorHero>

export default meta

type Story = StoryObj<typeof meta>

export const Default: Story = {
  render: () => ({
    components: { CalculatorHero },
    template: '<CalculatorHero />',
  }),
}
