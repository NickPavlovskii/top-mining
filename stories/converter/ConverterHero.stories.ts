import type { Meta, StoryObj } from '@storybook/vue3'

import ConverterHero from '~/components/converter/ConverterHero.vue'

import { canvasFullBleed } from '../../helpers/decorators'

const meta = {
  title: 'Converter/Hero',
  component: ConverterHero,
  tags: ['autodocs', 'visual'],
  parameters: {
    layout: 'fullscreen',
    backgrounds: { default: 'landing-dark' },
    docs: {
      description: {
        component:
          'Hero страницы конвертера хешрейта: breadcrumbs и заголовок с outline-стилем для «хешрейта».',
      },
    },
  },
  decorators: [canvasFullBleed],
} satisfies Meta<typeof ConverterHero>

export default meta

type Story = StoryObj<typeof meta>

export const Desktop: Story = {
  parameters: {
    viewport: { defaultViewport: 'desktop' },
  },
}

export const Mobile: Story = {
  parameters: {
    viewport: { defaultViewport: 'mobile1' },
  },
}
