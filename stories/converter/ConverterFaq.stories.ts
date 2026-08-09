import type { Meta, StoryObj } from '@storybook/vue3'

import ConverterFaq from '~/components/converter/ConverterFaq.vue'

import { canvasFullBleed } from '../helpers/decorators'

const meta = {
  title: 'Converter/Faq',
  component: ConverterFaq,
  tags: ['autodocs', 'visual'],
  parameters: {
    layout: 'fullscreen',
    backgrounds: { default: 'light' },
    docs: {
      description: {
        component: 'FAQ-секция конвертера хешрейта: 3 вопроса и ответа в двухколоночной сетке.',
      },
    },
  },
  decorators: [canvasFullBleed],
} satisfies Meta<typeof ConverterFaq>

export default meta

type Story = StoryObj<typeof meta>

export const Default: Story = {}
