import type { Meta, StoryObj } from '@storybook/vue3'

import TopMiningOutlineTitle from '~/components/global/pageTitle/TopMiningOutlineTitle.vue'

type TopMiningOutlineTitleArgs = {
  lead: string
  accent?: string
  tag?: 'h1' | 'h2' | 'h3' | 'p' | 'div'
  titleId?: string
}

const meta = {
  title: 'Global/TopMiningOutlineTitle',
  component: TopMiningOutlineTitle,
  tags: ['autodocs', 'visual'],
  parameters: {
    layout: 'centered',
    backgrounds: { default: 'landing-dark' },
    docs: {
      description: {
        component: `
Заголовок секции: обведённый lead + сплошной белый accent.

Используется в блоках вроде «Частые проблемы клиентов».
        `.trim(),
      },
    },
  },
  argTypes: {
    lead: { control: 'text' },
    accent: { control: 'text' },
    tag: {
      control: 'select',
      options: ['h1', 'h2', 'h3', 'p', 'div'],
    },
  },
  args: {
    lead: 'ЧАСТЫЕ ПРОБЛЕМЫ',
    accent: 'КЛИЕНТОВ',
    tag: 'h2',
  },
} satisfies Meta<TopMiningOutlineTitleArgs>

export default meta
type Story = StoryObj<TopMiningOutlineTitleArgs>

export const Default: Story = {}

export const LeadOnly: Story = {
  args: {
    lead: 'АКТУАЛЬНЫЕ МОДЕЛИ',
    accent: '',
    tag: 'h2',
  },
}
