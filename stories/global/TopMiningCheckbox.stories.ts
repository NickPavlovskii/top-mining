import type { Meta, StoryObj } from '@storybook/vue3'
import { ref } from 'vue'

import TopMiningCheckbox from '~/components/global/selection-controls/TopMiningCheckbox.vue'

import { canvasLight, canvasLightMaxWidth, CANVAS_WIDTH } from '../helpers/decorators'

const meta = {
  title: 'Global/TopMiningCheckbox',
  component: TopMiningCheckbox,
  tags: ['autodocs'],
  parameters: {
    layout: 'padded',
    backgrounds: { default: 'off-white' },
    docs: {
      description: {
        component: `
Чекбокс в стиле Top Mining по макету Figma.

- **size** — \`md\` (24px) / \`sm\` (18px)
- **v-model** — boolean
- **indeterminate** — промежуточное состояние (черта)
- Checked — оранжевый градиент и белая галочка
- Hover — оранжевая обводка (только на устройствах с hover)
        `.trim(),
      },
    },
  },
  argTypes: {
    label: { description: 'Подпись справа от контрола' },
    size: { control: 'select', options: ['md', 'sm'] },
    indeterminate: { control: 'boolean' },
    disabled: { control: 'boolean' },
  },
  decorators: [canvasLightMaxWidth(CANVAS_WIDTH.compact)],
} satisfies Meta<typeof TopMiningCheckbox>

export default meta

type Story = StoryObj<typeof meta>

export const Default: Story = {
  args: {
    label: 'Согласие на обработку данных',
    size: 'md',
  },
  render: (args) => ({
    components: { TopMiningCheckbox },
    setup() {
      const checked = ref(false)
      return { args, checked }
    },
    template: '<TopMiningCheckbox v-model="checked" v-bind="args" />',
  }),
}

export const Checked: Story = {
  name: 'Выбран',
  render: () => ({
    components: { TopMiningCheckbox },
    setup() {
      const checked = ref(true)
      return { checked }
    },
    template: '<TopMiningCheckbox v-model="checked" label="Выбранный пункт" />',
  }),
}

export const Indeterminate: Story = {
  name: 'Indeterminate',
  render: () => ({
    components: { TopMiningCheckbox },
    setup() {
      const checked = ref(false)
      return { checked }
    },
    template:
      '<TopMiningCheckbox v-model="checked" label="Частично выбрано" indeterminate />',
  }),
}

export const Disabled: Story = {
  name: 'Disabled',
  render: () => ({
    components: { TopMiningCheckbox },
    setup() {
      const checked = ref(true)
      return { checked }
    },
    template:
      '<TopMiningCheckbox v-model="checked" label="Недоступно" disabled />',
  }),
}

export const AllStates: Story = {
  name: 'Все состояния',
  decorators: [canvasLight],
  render: () => ({
    components: { TopMiningCheckbox },
    setup() {
      const enabled = ref(false)
      const checked = ref(true)
      const partial = ref(false)
      const partialIndeterminate = ref(true)
      const disabled = ref(false)
      const disabledChecked = ref(true)
      return {
        enabled,
        checked,
        partial,
        partialIndeterminate,
        disabled,
        disabledChecked,
      }
    },
    template: `
      <div class="sb-stack">
        <div class="sb-row" style="align-items:flex-start;gap:32px">
          <div class="sb-stack">
            <span style="font-size:11px;font-weight:600;letter-spacing:.08em;text-transform:uppercase;color:#666">md</span>
            <TopMiningCheckbox v-model="enabled" label="Enabled" />
            <TopMiningCheckbox v-model="checked" label="Active" />
            <TopMiningCheckbox v-model="partial" :indeterminate="partialIndeterminate" label="Indeterminate" />
            <TopMiningCheckbox v-model="disabled" label="Disabled" disabled />
            <TopMiningCheckbox v-model="disabledChecked" label="Disabled checked" disabled />
          </div>
          <div class="sb-stack">
            <span style="font-size:11px;font-weight:600;letter-spacing:.08em;text-transform:uppercase;color:#666">sm</span>
            <TopMiningCheckbox v-model="enabled" label="Enabled" size="sm" />
            <TopMiningCheckbox v-model="checked" label="Active" size="sm" />
            <TopMiningCheckbox v-model="partial" :indeterminate="partialIndeterminate" label="Indeterminate" size="sm" />
            <TopMiningCheckbox v-model="disabled" label="Disabled" size="sm" disabled />
            <TopMiningCheckbox v-model="disabledChecked" label="Disabled checked" size="sm" disabled />
          </div>
        </div>
      </div>
    `,
  }),
}
