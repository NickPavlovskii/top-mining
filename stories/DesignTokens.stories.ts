import type { Meta, StoryObj } from '@storybook/vue3'

import DesignTokensPage from './docs/DesignTokensPage.vue'

const meta = {
  title: 'Top Mining/Дизайн-токены',
  component: DesignTokensPage,
  tags: ['autodocs'],
  parameters: {
    layout: 'fullscreen',
    backgrounds: { default: 'landing-dark' },
    docs: {
      description: {
        component:
          'Палитра и CSS-переменные лендинга ТОП-МАЙНИНГ. Источник правды — `assets/scss/variables.scss`.',
      },
    },
  },
} satisfies Meta<typeof DesignTokensPage>

export default meta

type Story = StoryObj<typeof meta>

export const Palette: Story = {
  render: () => ({
    components: { DesignTokensPage },
    template: '<DesignTokensPage />',
  }),
  parameters: {
    docs: {
      description: {
        story: 'Визуальная палитра с образцами цветов и справочными таблицами.',
      },
    },
  },
}
