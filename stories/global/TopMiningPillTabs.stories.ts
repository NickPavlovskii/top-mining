import type { Meta, StoryObj } from '@storybook/vue3'
import { ref } from 'vue'

import TopMiningPillTabs from '~/components/global/navigation/TopMiningPillTabs.vue'

const sampleTabs = [
  { id: 'prices', label: 'Повышение тарифа, цены' },
  { id: 'repair', label: 'Ремонт' },
  { id: 'delivery', label: 'Сроки поставки' },
  { id: 'service', label: 'Сервис' },
  { id: 'hosting', label: 'Размещение' },
] as const

const meta = {
  title: 'Global/TopMiningPillTabs',
  component: TopMiningPillTabs,
  tags: ['autodocs', 'visual'],
  parameters: {
    layout: 'centered',
    backgrounds: { default: 'landing-dark' },
    docs: {
      description: {
        component: `
Pill-табы для тёмных секций (outline + оранжевая активная обводка).

Управляется через \`v-model\` (id активной вкладки).
        `.trim(),
      },
    },
  },
} satisfies Meta<typeof TopMiningPillTabs>

export default meta
type Story = StoryObj<typeof meta>

export const Default: Story = {
  render: () => ({
    components: { TopMiningPillTabs },
    setup() {
      const active = ref('prices')
      return { active, sampleTabs }
    },
    template: `
      <div style="width:min(100vw,720px);padding:24px">
        <top-mining-pill-tabs
          v-model="active"
          aria-label="Категории"
          :tabs="sampleTabs"
        />
        <p style="margin:20px 0 0;color:#fff;text-align:center;font-family:Mulish,sans-serif">
          Активно: {{ active }}
        </p>
      </div>
    `,
  }),
}
