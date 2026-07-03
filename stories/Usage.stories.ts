import type { Meta, StoryObj } from '@storybook/vue3'

import UsagePage from './docs/UsagePage.vue'

const meta = {
  title: 'Top Mining/Использование в Nuxt',
  component: UsagePage,
  tags: ['autodocs'],
  parameters: {
    layout: 'fullscreen',
    backgrounds: { default: 'landing-dark' },
    docs: {
      description: {
        component: 'Примеры подключения и использования глобальных компонентов в Nuxt-приложении.',
      },
    },
  },
} satisfies Meta<typeof UsagePage>

export default meta

type Story = StoryObj<typeof meta>

export const Guide: Story = {
  render: () => ({
    components: { UsagePage },
    template: '<UsagePage />',
  }),
}
