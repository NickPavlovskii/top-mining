import type { Meta, StoryObj } from '@storybook/vue3'
import { ref } from 'vue'

import TopMiningInput from '~/components/global/forms/TopMiningInput.vue'

import { canvasDark, canvasDarkMaxWidth, CANVAS_WIDTH } from '../helpers/decorators'

const meta = {
  title: 'Global/TopMiningInput',
  component: TopMiningInput,
  tags: ['autodocs', 'visual'],
  parameters: {
    layout: 'padded',
    backgrounds: { default: 'landing-dark' },
    docs: {
      description: {
        component: `
Pill-инпут для тёмных форм лендинга.

- **v-model** — строка
- **type / placeholder / autocomplete / inputmode**
- **label** — видимая подпись
- **accessibleLabel** — скрытый label для a11y
        `.trim(),
      },
    },
  },
  argTypes: {
    type: {
      control: 'select',
      options: ['text', 'tel', 'email', 'password'],
    },
    placeholder: { control: 'text' },
    label: { control: 'text' },
    disabled: { control: 'boolean' },
    required: { control: 'boolean' },
  },
  decorators: [canvasDarkMaxWidth(CANVAS_WIDTH.compact)],
} satisfies Meta<typeof TopMiningInput>

export default meta

type Story = StoryObj<typeof meta>

export const Default: Story = {
  name: 'Телефон',
  args: {
    type: 'tel',
    placeholder: 'Телефон',
    accessibleLabel: 'Телефон',
    inputmode: 'tel',
    autocomplete: 'tel',
  },
  render: (args) => ({
    components: { TopMiningInput },
    setup() {
      const value = ref('')
      return { args, value }
    },
    template: '<TopMiningInput v-model="value" v-bind="args" />',
  }),
}

export const WithLabel: Story = {
  name: 'С подписью',
  args: {
    type: 'email',
    label: 'E-mail',
    placeholder: 'name@example.com',
    hideLabelVisually: false,
  },
  render: (args) => ({
    components: { TopMiningInput },
    setup() {
      const value = ref('')
      return { args, value }
    },
    template: '<TopMiningInput v-model="value" v-bind="args" />',
  }),
}

export const Filled: Story = {
  name: 'Заполненный',
  render: () => ({
    components: { TopMiningInput },
    setup() {
      const value = ref('+7 900 123-45-67')
      return { value }
    },
    template: `
      <TopMiningInput
        v-model="value"
        type="tel"
        placeholder="Телефон"
        accessible-label="Телефон"
      />
    `,
  }),
}

export const Disabled: Story = {
  name: 'Disabled',
  render: () => ({
    components: { TopMiningInput },
    setup() {
      const value = ref('Недоступно')
      return { value }
    },
    template: `
      <TopMiningInput
        v-model="value"
        placeholder="Телефон"
        accessible-label="Телефон"
        disabled
      />
    `,
  }),
}

export const AllStates: Story = {
  name: 'Все состояния',
  tags: ['visual'],
  decorators: [canvasDark],
  render: () => ({
    components: { TopMiningInput },
    setup() {
      const empty = ref('')
      const filled = ref('+7 495 000-00-00')
      const disabled = ref('Locked')
      return { empty, filled, disabled }
    },
    template: `
      <div class="sb-stack" style="gap:20px;max-width:378px">
        <div class="sb-stack" style="gap:8px">
          <span style="font-size:11px;font-weight:600;letter-spacing:.08em;text-transform:uppercase;color:#999">Пустой</span>
          <TopMiningInput v-model="empty" type="tel" placeholder="Телефон" accessible-label="Телефон" />
        </div>
        <div class="sb-stack" style="gap:8px">
          <span style="font-size:11px;font-weight:600;letter-spacing:.08em;text-transform:uppercase;color:#999">Заполненный</span>
          <TopMiningInput v-model="filled" type="tel" placeholder="Телефон" accessible-label="Телефон" />
        </div>
        <div class="sb-stack" style="gap:8px">
          <span style="font-size:11px;font-weight:600;letter-spacing:.08em;text-transform:uppercase;color:#999">Disabled</span>
          <TopMiningInput v-model="disabled" placeholder="Телефон" accessible-label="Телефон" disabled />
        </div>
      </div>
    `,
  }),
}
