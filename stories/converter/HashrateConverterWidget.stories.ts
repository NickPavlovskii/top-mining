import type { Meta, StoryObj } from '@storybook/vue3'

import HashrateConverterWidget from '~/components/converter/HashrateConverterWidget.vue'

import { canvasFullBleed } from '../../helpers/decorators'

const meta = {
  title: 'Converter/Widget',
  component: HashrateConverterWidget,
  tags: ['autodocs', 'visual'],
  parameters: {
    layout: 'fullscreen',
    backgrounds: { default: 'landing-dark' },
    docs: {
      description: {
        component:
          'Виджет конвертации хешрейта: 8 единиц от H/s до ZH/s с взаимным пересчётом и копированием значений.',
      },
    },
  },
  decorators: [canvasFullBleed],
} satisfies Meta<typeof HashrateConverterWidget>

export default meta

type Story = StoryObj<typeof meta>

export const Default: Story = {}

export const Mobile: Story = {
  parameters: {
    viewport: { defaultViewport: 'mobile1' },
  },
}
