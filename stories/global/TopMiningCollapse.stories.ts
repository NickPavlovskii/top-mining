import type { Meta, StoryObj } from '@storybook/vue3'
import { ref } from 'vue'

import TopMiningCollapse from '~/components/global/disclosure/TopMiningCollapse.vue'
import TopMiningButton from '~/components/global/buttons/TopMiningButton.vue'
import { TOP_MINING_BUTTON_PROPS } from '~/common/modules/top-mining/button'
import arrowIcon from '~/assets/images/articles/arrow-up-right.png'

import { canvasDarkMaxWidth, CANVAS_WIDTH } from '../helpers/decorators'

const meta = {
  title: 'Global/TopMiningCollapse',
  component: TopMiningCollapse,
  tags: ['autodocs', 'visual'],
  parameters: {
    layout: 'padded',
    backgrounds: { default: 'landing-dark' },
    docs: {
      description: {
        component: `
Анимированный выезжающий блок (\`grid-template-rows\`).

- **open** — открыт/закрыт
- **variant** — \`plain\` или \`panel\` (тёмная карточка с рамкой)
        `.trim(),
      },
    },
  },
  decorators: [canvasDarkMaxWidth(CANVAS_WIDTH.section)],
} satisfies Meta<typeof TopMiningCollapse>

export default meta

type Story = StoryObj<typeof meta>

export const Panel: Story = {
  name: 'Panel + CTA',
  render: () => ({
    components: { TopMiningCollapse, TopMiningButton },
    setup() {
      const open = ref(true)
      return { open, arrowIcon, TOP_MINING_BUTTON_PROPS }
    },
    template: `
      <div>
        <button
          type="button"
          style="margin-bottom:16px;padding:10px 16px;border-radius:999px;border:0;background:#ff741f;color:#fff;cursor:pointer"
          @click="open = !open"
        >
          {{ open ? 'Скрыть' : 'Показать' }}
        </button>
        <top-mining-collapse variant="panel" :open="open">
          <p style="margin:0 0 20px;color:#f6f6f6;font-family:Mulish,sans-serif;line-height:1.5">
            Контент выезжает плавно. Здесь может быть таблица, форма или любой слот.
          </p>
          <top-mining-button
            v-bind="TOP_MINING_BUTTON_PROPS"
            preset="contact-pill"
            title="ОТПРАВИТЬ"
            :append-icon="arrowIcon"
          />
        </top-mining-collapse>
      </div>
    `,
  }),
}
