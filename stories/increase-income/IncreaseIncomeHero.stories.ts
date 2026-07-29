import type { Meta, StoryObj } from '@storybook/vue3'

import IncreaseIncomeHero from '~/components/increase-income/IncreaseIncomeHero.vue'

const meta = {
  title: 'IncreaseIncome/Hero',
  component: IncreaseIncomeHero,
  tags: ['visual'],
  parameters: {
    layout: 'fullscreen',
    backgrounds: { default: 'dark' },
  },
} satisfies Meta<typeof IncreaseIncomeHero>

export default meta

type Story = StoryObj<typeof meta>

export const Desktop: Story = {
  parameters: {
    viewport: { defaultViewport: 'desktop' },
  },
}

export const Tablet: Story = {
  parameters: {
    viewport: { defaultViewport: 'tablet' },
  },
}

export const Mobile: Story = {
  parameters: {
    viewport: { defaultViewport: 'mobile1' },
  },
}
