import type { Meta, StoryObj } from '@storybook/vue3'

import BuyAsicHowWeWork from '~/components/buy-asic/BuyAsicHowWeWork.vue'

import { canvasFullBleed } from '../helpers/decorators'

const meta = {
  title: 'Buy ASIC/BuyAsicHowWeWork',
  component: BuyAsicHowWeWork,
  tags: ['autodocs', 'visual'],
  parameters: {
    layout: 'fullscreen',
    backgrounds: { default: 'landing-dark' },
    docs: {
      description: {
        component: `
Секция «Снизим цену на 7% / Как мы работаем» (block-2).

Четыре шага процесса; последний — оранжевый акцент.
        `.trim(),
      },
    },
  },
  decorators: [canvasFullBleed],
} satisfies Meta<typeof BuyAsicHowWeWork>

export default meta

type Story = StoryObj<typeof meta>

export const Default: Story = {
  render: () => ({
    components: { BuyAsicHowWeWork },
    template: '<BuyAsicHowWeWork />',
  }),
}
