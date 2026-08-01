import type { Meta, StoryObj } from '@storybook/vue3'

import {
  toCompareTableRows,
  type TopMiningCompareTableRow,
} from '~/common/modules/top-mining/compare-table'
import TopMiningCompareTable from '~/components/global/tables/TopMiningCompareTable.vue'

import { canvasDarkMaxWidth, CANVAS_WIDTH } from '../helpers/decorators'

const threeColHeaders = [
  'Курс BTC = <b>80 000$</b>',
  'Курс BTC = <b>100 000$</b>',
  'Курс BTC = <b>120 000$</b>',
] as const

const threeColRows = toCompareTableRows(
  [
    'Количество ASIC',
    'Доход в месяц',
    'Расходы в месяц',
    'Чистая прибыль',
  ],
  [
    ['1 427', '18 млн ₽', '12 млн ₽', '6 млн ₽'],
    ['1 427', '22 млн ₽', '12 млн ₽', '10 млн ₽'],
    ['1 427', '26 млн ₽', '12 млн ₽', '14 млн ₽'],
  ],
  { accentLastRow: true },
)

const twoColHeaders = [
  'Размещение <b>в собственном</b> data-центре',
  'Размещение в data-центре <b>компании Х</b>',
] as const

const twoColRows: TopMiningCompareTableRow[] = [
  {
    label: 'Входная комиссия',
    labelDetail: 'на размещение',
    values: ['0 ₽', '~10 000 ₽ / 1 асик'],
  },
  {
    label: 'Всего ASIC-майнеров',
    values: [
      '1427 (общее потребление 5 МВт)',
      '1427 (общее потребление 5 МВт)',
    ],
    mobileValues: ['1427 ед.', '1427 ед.'],
  },
  {
    label: 'Общая комиссия',
    values: ['0 ₽', '14,27 млн ₽'],
    accent: true,
  },
]

const meta = {
  title: 'Global/TopMiningCompareTable',
  component: TopMiningCompareTable,
  tags: ['autodocs', 'visual'],
  parameters: {
    layout: 'padded',
    backgrounds: { default: 'landing-dark' },
    docs: {
      description: {
        component: `
Сравнительная таблица для тёмных лендингов (2 или 3+ колонки).

- **headers** — заголовки колонок (можно HTML)
- **rows** — \`label\` / \`values\` / опц. \`mobileValues\`, \`accent\`, \`labelDetail\`
- **highlightColumn** — оранжевая колонка (\`null\` — без выделения)
- **accentLastRow** — подсветка последней строки
- **footnote** + слот **#footer** — подпись и доп. контент под таблицей

При 3+ колонках на ≤1099px включаются табы.
        `.trim(),
      },
    },
  },
  decorators: [canvasDarkMaxWidth(CANVAS_WIDTH.section)],
} satisfies Meta<typeof TopMiningCompareTable>

export default meta

type Story = StoryObj<typeof meta>

export const ThreeColumns: Story = {
  name: '3 колонки + highlight',
  args: {
    id: 'sb-three',
    headers: [...threeColHeaders],
    rows: threeColRows,
    highlightColumn: 1,
    footnote:
      'Для расчетов использовали ASIC-майнер Bitmain Antminer S21 Pro 234 Th/s.',
  },
  render: (args) => ({
    components: { TopMiningCompareTable },
    setup() {
      return { args }
    },
    template: `
      <top-mining-compare-table v-bind="args">
        <template #footer>
          <a
            href="/calculator/"
            style="color:#ff741f;font-family:Mulish,sans-serif;font-size:14px"
          >
            Открыть калькулятор
          </a>
        </template>
      </top-mining-compare-table>
    `,
  }),
}

export const TwoColumns: Story = {
  name: '2 колонки без highlight',
  args: {
    id: 'sb-two',
    headers: [...twoColHeaders],
    rows: twoColRows,
  },
}

export const AccentLastRow: Story = {
  name: 'accentLastRow',
  args: {
    id: 'sb-accent-prop',
    headers: [...twoColHeaders],
    rows: toCompareTableRows(
      ['Тариф на ЭЭ', 'Стоимость размещения, мес.'],
      [
        ['3,0 ₽ за 1 кВт/ч', '10.89 млн ₽ / мес.'],
        ['5,0 ₽ за 1 кВт/ч', '18.15 млн ₽ / мес.'],
      ],
    ),
    accentLastRow: true,
  },
}
