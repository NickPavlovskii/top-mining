import type { Meta, StoryObj } from '@storybook/vue3'

import TopMiningIconList from '~/components/global/lists/TopMiningIconList.vue'
import { BUY_ASIC_PAGE } from '~/common/modules/top-mining/buy-asic-page'

import { canvasDark, canvasDarkMaxWidth, CANVAS_WIDTH } from '../helpers/decorators'

const meta = {
  title: 'Global/TopMiningIconList',
  component: TopMiningIconList,
  tags: ['autodocs', 'visual'],
  parameters: {
    layout: 'padded',
    backgrounds: { default: 'landing-dark' },
    docs: {
      description: {
        component: `
Список преимуществ с иконкой-галочкой.

- **items** — массив строк
- **iconSrc** — опциональная своя иконка (по умолчанию \`ok-or-big.png\`)
        `.trim(),
      },
    },
  },
  decorators: [canvasDarkMaxWidth(CANVAS_WIDTH.card)],
} satisfies Meta<typeof TopMiningIconList>

export default meta

type Story = StoryObj<typeof meta>

export const Default: Story = {
  name: 'ASIC benefits',
  args: {
    items: [...BUY_ASIC_PAGE.benefits],
  },
}

export const ShortList: Story = {
  name: 'Короткий список',
  args: {
    items: [
      'Собьем цены поставщиков на 7%',
      'Договоримся о минимальном тарифе на размещение',
      'С нами ваши асики и вложения в безопасности',
    ],
  },
}

export const Wide: Story = {
  name: 'Широкий блок',
  decorators: [canvasDarkMaxWidth(CANVAS_WIDTH.section)],
  args: {
    items: [...BUY_ASIC_PAGE.benefits],
  },
}

export const OnCard: Story = {
  name: 'На карточке',
  decorators: [canvasDark],
  render: (args) => ({
    components: { TopMiningIconList },
    setup() {
      return { args }
    },
    template: `
      <div style="max-width:420px;padding:24px;border-radius:24px;background:#1f1f1f">
        <p style="margin:0 0 20px;color:rgba(255,255,255,.72);font-size:14px;line-height:1.4">
          46 компаний по продаже майнинг-оборудования
        </p>
        <TopMiningIconList v-bind="args" />
      </div>
    `,
  }),
  args: {
    items: [...BUY_ASIC_PAGE.benefits],
  },
}
