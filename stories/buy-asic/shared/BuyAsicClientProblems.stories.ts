import type { Meta, StoryObj } from '@storybook/vue3'

import BuyAsicClientProblems from '~/components/buy-asic/shared/BuyAsicClientProblems.vue'

import { canvasFullBleed } from '../../helpers/decorators'

const meta = {
  title: 'Buy ASIC/BuyAsicClientProblems',
  component: BuyAsicClientProblems,
  tags: ['autodocs', 'visual'],
  parameters: {
    layout: 'fullscreen',
    backgrounds: { default: 'landing-dark' },
    docs: {
      description: {
        component: `
Секция «Частые проблемы клиентов» на лендинге ASIC.

- Outline-заголовок (\`TopMiningOutlineTitle\`)
- Pill-табы категорий (\`TopMiningPillTabs\`)
- Карусель отзывов со стрелками и точками
        `.trim(),
      },
    },
  },
  decorators: [canvasFullBleed],
} satisfies Meta<typeof BuyAsicClientProblems>

export default meta

type Story = StoryObj<typeof meta>

export const Default: Story = {
  name: 'Desktop',
  render: () => ({
    components: { BuyAsicClientProblems },
    template: '<BuyAsicClientProblems />',
  }),
}

export const CompactViewport: Story = {
  name: '≤1439px',
  parameters: {
    viewport: {
      defaultViewport: 'tablet',
    },
  },
  render: () => ({
    components: { BuyAsicClientProblems },
    template: `
      <div style="max-width:1100px;margin:0 auto">
        <BuyAsicClientProblems />
      </div>
    `,
  }),
}

export const MobileViewport: Story = {
  name: 'Mobile',
  parameters: {
    viewport: {
      defaultViewport: 'mobile1',
    },
  },
  render: () => ({
    components: { BuyAsicClientProblems },
    template: `
      <div style="max-width:390px;margin:0 auto">
        <BuyAsicClientProblems />
      </div>
    `,
  }),
}
