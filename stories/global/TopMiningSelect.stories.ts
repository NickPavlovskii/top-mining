import type { Meta, StoryObj } from '@storybook/vue3'
import { ref } from 'vue'

import TopMiningSelect from '~/components/global/forms/TopMiningSelect.vue'
import type {
  TopMiningSelectGroup,
  TopMiningSelectOption,
} from '~/components/global/forms/TopMiningSelect.types'

import { canvasDarkMaxWidth, CANVAS_WIDTH } from '../helpers/decorators'

const flatOptions: TopMiningSelectOption[] = [
  { id: 'btc', label: 'Bitcoin (BTC)', image: 'https://placehold.co/64x64/png?text=BTC' },
  { id: 'eth', label: 'Ethereum (ETH)', image: 'https://placehold.co/64x64/png?text=ETH' },
  { id: 'ltc', label: 'Litecoin (LTC)', image: 'https://placehold.co/64x64/png?text=LTC' },
  { id: 'doge', label: 'Dogecoin (DOGE)', image: 'https://placehold.co/64x64/png?text=DOGE' },
  { id: 'kas', label: 'Kaspa (KAS)', image: 'https://placehold.co/64x64/png?text=KAS' },
  { id: 'aleo', label: 'Aleo (ALEO)', image: 'https://placehold.co/64x64/png?text=ALEO' },
]

const treeGroups: TopMiningSelectGroup[] = [
  {
    id: 'microbt',
    label: 'Microbt Whatsminer',
    children: [
      {
        id: 'm70-214',
        label: 'Microbt Whatsminer M70 214 TH/s',
        image: 'https://placehold.co/80x80/png?text=ASIC',
        meta: 'SHA-256 | 214 TH/s | 3103 Вт',
      },
      {
        id: 'm70-236',
        label: 'Microbt Whatsminer M70 236 TH/s',
        image: 'https://placehold.co/80x80/png?text=ASIC',
        meta: 'SHA-256 | 236 TH/s | 3422 Вт',
      },
    ],
  },
  {
    id: 'bitmain',
    label: 'Bitmain Antminer',
    children: [
      {
        id: 's21-200',
        label: 'Bitmain Antminer S21 200 Th/s',
        image: 'https://placehold.co/80x80/png?text=ASIC',
        meta: 'SHA-256 | 200 Th/s | 3500 Вт',
      },
      {
        id: 's21-pro',
        label: 'Bitmain Antminer S21 Pro 245 Th/s',
        image: 'https://placehold.co/80x80/png?text=ASIC',
        meta: 'SHA-256 | 245 Th/s | 3675 Вт',
      },
    ],
  },
  {
    id: 'canaan',
    label: 'Canaan Avalon',
    children: [
      {
        id: 'a16-282',
        label: 'Canaan Avalon A16 282 Th/s',
        image: 'https://placehold.co/80x80/png?text=ASIC',
        meta: 'SHA-256 | 282 Th/s | 3900 Вт',
      },
    ],
  },
]

const meta = {
  title: 'Global/TopMiningSelect',
  component: TopMiningSelect,
  tags: ['autodocs', 'visual'],
  parameters: {
    layout: 'padded',
    backgrounds: { default: 'landing-dark' },
    docs: {
      description: {
        component: `
Универсальный селект с поиском для тёмных форм.

- **mode=\`flat\`** — одноуровневый список (монеты, алгоритмы)
- **mode=\`tree\`** — группы с раскрывающимися детьми (модели ASIC / GPU / CPU)
- **size** — \`lg\` | \`md\` | \`sm\`
- **v-model** — id выбранного пункта
- **@select** — полный объект option
        `.trim(),
      },
    },
  },
  argTypes: {
    mode: {
      control: 'select',
      options: ['flat', 'tree'],
    },
    size: {
      control: 'select',
      options: ['lg', 'md', 'sm'],
    },
    columns: {
      control: 'select',
      options: [1, 2],
    },
    searchable: { control: 'boolean' },
    showOptionMeta: { control: 'boolean' },
  },
  decorators: [canvasDarkMaxWidth(CANVAS_WIDTH.card)],
} satisfies Meta<typeof TopMiningSelect>

export default meta

type Story = StoryObj<typeof meta>

export const FlatList: Story = {
  name: 'Одноуровневый (flat)',
  args: {
    mode: 'flat',
    size: 'md',
    columns: 2,
    options: flatOptions,
    placeholder: 'Выберите монету',
    showOptionMeta: false,
  },
  render: (args) => ({
    components: { TopMiningSelect },
    setup() {
      const value = ref<string | null>(null)
      return { args, value }
    },
    template: `
      <div style="width:min(100%,360px)">
        <top-mining-select v-model="value" v-bind="args" />
        <p style="margin:16px 0 0;color:#fff;font:14px Mulish,sans-serif">
          Выбрано: {{ value ?? '—' }}
        </p>
      </div>
    `,
  }),
}

export const TreeGroups: Story = {
  name: 'Многоуровневый (tree)',
  args: {
    mode: 'tree',
    size: 'lg',
    groups: treeGroups,
    placeholder: 'Модель ASIC-майнера',
    buttonImage: 'https://placehold.co/80x80/png?text=ASIC',
    showOptionMeta: true,
  },
  decorators: [canvasDarkMaxWidth(CANVAS_WIDTH.compact)],
  render: (args) => ({
    components: { TopMiningSelect },
    setup() {
      const value = ref<string | null>(null)
      return { args, value }
    },
    template: `
      <div style="width:min(100%,495px)">
        <top-mining-select v-model="value" v-bind="args" />
        <p style="margin:16px 0 0;color:#fff;font:14px Mulish,sans-serif">
          Выбрано: {{ value ?? '—' }}
        </p>
      </div>
    `,
  }),
}

export const CompactFlat: Story = {
  name: 'Компактный flat',
  args: {
    mode: 'flat',
    size: 'sm',
    columns: 1,
    options: [
      { id: 'ethash', label: 'Ethash' },
      { id: 'kawpow', label: 'KawPow' },
      { id: 'autolykos', label: 'Autolykos' },
      { id: 'blake3', label: 'Blake3' },
    ],
    placeholder: 'Выберите алгоритм',
    showOptionMeta: false,
  },
  render: (args) => ({
    components: { TopMiningSelect },
    setup() {
      const value = ref<string | null>('ethash')
      return { args, value }
    },
    template: `
      <div style="width:min(100%,280px)">
        <top-mining-select v-model="value" v-bind="args" />
      </div>
    `,
  }),
}
