import type { Meta, StoryObj } from '@storybook/vue3'

import ConverterAbout from '~/components/converter/ConverterAbout.vue'

import { canvasFullBleed } from '../helpers/decorators'

const meta = {
  title: 'Converter/About',
  component: ConverterAbout,
  tags: ['autodocs', 'visual'],
  parameters: {
    layout: 'fullscreen',
    backgrounds: { default: 'light' },
    docs: {
      description: {
        component:
          'Текстовый блок «Для чего необходим калькулятор хешрейта?» со списком преимуществ.',
      },
    },
  },
  decorators: [canvasFullBleed],
} satisfies Meta<typeof ConverterAbout>

export default meta

type Story = StoryObj<typeof meta>

export const Default: Story = {}
