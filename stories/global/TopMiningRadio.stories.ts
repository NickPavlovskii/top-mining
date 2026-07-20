import type { Meta, StoryObj } from '@storybook/vue3'
import { ref } from 'vue'

import TopMiningRadio from '~/components/global/selection-controls/TopMiningRadio.vue'

import { canvasLight, canvasLightMaxWidth, CANVAS_WIDTH } from '../helpers/decorators'

const meta = {
  title: 'Global/TopMiningRadio',
  component: TopMiningRadio,
  tags: ['autodocs'],
  parameters: {
    layout: 'padded',
    backgrounds: { default: 'off-white' },
    docs: {
      description: {
        component: `
Радиокнопка в стиле Top Mining по макету Figma.

- **size** — \`md\` (24px) / \`sm\` (18px)
- **v-model** — выбранное значение группы
- **value** — значение конкретной кнопки
- **name** — имя группы для нативного \`radio\`
        `.trim(),
      },
    },
  },
  argTypes: {
    label: { description: 'Подпись справа от контрола' },
    size: { control: 'select', options: ['md', 'sm'] },
    indeterminate: { control: 'boolean' },
    disabled: { control: 'boolean' },
    value: { control: 'text' },
  },
  decorators: [canvasLightMaxWidth(CANVAS_WIDTH.compact)],
} satisfies Meta<typeof TopMiningRadio>

export default meta

type Story = StoryObj<typeof meta>

export const Group: Story = {
  name: 'Группа',
  render: () => ({
    components: { TopMiningRadio },
    setup() {
      const selected = ref('a')
      return { selected }
    },
    template: `
      <div class="sb-stack">
        <TopMiningRadio v-model="selected" name="demo" value="a" label="Вариант A" />
        <TopMiningRadio v-model="selected" name="demo" value="b" label="Вариант B" />
        <TopMiningRadio v-model="selected" name="demo" value="c" label="Вариант C" />
      </div>
    `,
  }),
}

export const AllStates: Story = {
  name: 'Все состояния',
  decorators: [canvasLight],
  render: () => ({
    components: { TopMiningRadio },
    setup() {
      const selected = ref('active')
      return { selected }
    },
    template: `
      <div class="sb-stack">
        <div class="sb-row" style="align-items:flex-start;gap:32px">
          <div class="sb-stack">
            <span style="font-size:11px;font-weight:600;letter-spacing:.08em;text-transform:uppercase;color:#666">md</span>
            <TopMiningRadio v-model="selected" name="states-md" value="enabled" label="Enabled" />
            <TopMiningRadio v-model="selected" name="states-md" value="active" label="Active" />
            <TopMiningRadio :model-value="''" name="states-md-ind" value="ind" label="Indeterminate" indeterminate />
            <TopMiningRadio v-model="selected" name="states-md" value="disabled" label="Disabled" disabled />
          </div>
          <div class="sb-stack">
            <span style="font-size:11px;font-weight:600;letter-spacing:.08em;text-transform:uppercase;color:#666">sm</span>
            <TopMiningRadio v-model="selected" name="states-sm" value="enabled" label="Enabled" size="sm" />
            <TopMiningRadio v-model="selected" name="states-sm" value="active" label="Active" size="sm" />
            <TopMiningRadio :model-value="''" name="states-sm-ind" value="ind" label="Indeterminate" size="sm" indeterminate />
            <TopMiningRadio v-model="selected" name="states-sm" value="disabled" label="Disabled" size="sm" disabled />
          </div>
        </div>
      </div>
    `,
  }),
}
