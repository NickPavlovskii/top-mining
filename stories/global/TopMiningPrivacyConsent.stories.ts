import type { Meta, StoryObj } from '@storybook/vue3'
import { ref } from 'vue'

import TopMiningPrivacyConsent from '~/components/global/forms/TopMiningPrivacyConsent.vue'

import { canvasDark, canvasDarkMaxWidth, CANVAS_WIDTH } from '../helpers/decorators'

const meta = {
  title: 'Global/TopMiningPrivacyConsent',
  component: TopMiningPrivacyConsent,
  tags: ['autodocs', 'visual'],
  parameters: {
    layout: 'padded',
    backgrounds: { default: 'landing-dark' },
    docs: {
      description: {
        component: `
Согласие с политикой конфиденциальности для форм лендинга.

- **v-model** — boolean (по умолчанию \`true\`)
- **prefix / privacyLinkLabel / privacyHref**
- Внутри использует \`TopMiningCheckbox\` (size sm)
        `.trim(),
      },
    },
  },
  argTypes: {
    prefix: { control: 'text' },
    privacyLinkLabel: { control: 'text' },
    privacyHref: { control: 'text' },
    required: { control: 'boolean' },
    disabled: { control: 'boolean' },
  },
  decorators: [canvasDarkMaxWidth(CANVAS_WIDTH.compact)],
} satisfies Meta<typeof TopMiningPrivacyConsent>

export default meta

type Story = StoryObj<typeof meta>

export const Default: Story = {
  name: 'Согласие принято',
  render: (args) => ({
    components: { TopMiningPrivacyConsent },
    setup() {
      const accepted = ref(true)
      return { args, accepted }
    },
    template: '<TopMiningPrivacyConsent v-model="accepted" v-bind="args" />',
  }),
}

export const Unchecked: Story = {
  name: 'Не отмечено',
  render: () => ({
    components: { TopMiningPrivacyConsent },
    setup() {
      const accepted = ref(false)
      return { accepted }
    },
    template: '<TopMiningPrivacyConsent v-model="accepted" />',
  }),
}

export const Disabled: Story = {
  name: 'Disabled',
  render: () => ({
    components: { TopMiningPrivacyConsent },
    setup() {
      const accepted = ref(true)
      return { accepted }
    },
    template: '<TopMiningPrivacyConsent v-model="accepted" disabled />',
  }),
}

export const CustomCopy: Story = {
  name: 'Кастомный текст',
  args: {
    prefix: 'Нажимая кнопку, вы принимаете',
    privacyLinkLabel: 'условия использования',
    privacyHref: '/privacy',
  },
  render: (args) => ({
    components: { TopMiningPrivacyConsent },
    setup() {
      const accepted = ref(true)
      return { args, accepted }
    },
    template: '<TopMiningPrivacyConsent v-model="accepted" v-bind="args" />',
  }),
}

export const AllStates: Story = {
  name: 'Все состояния',
  tags: ['visual'],
  decorators: [canvasDark],
  render: () => ({
    components: { TopMiningPrivacyConsent },
    setup() {
      const on = ref(true)
      const off = ref(false)
      const locked = ref(true)
      return { on, off, locked }
    },
    template: `
      <div class="sb-stack" style="gap:24px;max-width:420px">
        <div class="sb-stack" style="gap:8px">
          <span style="font-size:11px;font-weight:600;letter-spacing:.08em;text-transform:uppercase;color:#999">Checked</span>
          <TopMiningPrivacyConsent v-model="on" />
        </div>
        <div class="sb-stack" style="gap:8px">
          <span style="font-size:11px;font-weight:600;letter-spacing:.08em;text-transform:uppercase;color:#999">Unchecked</span>
          <TopMiningPrivacyConsent v-model="off" />
        </div>
        <div class="sb-stack" style="gap:8px">
          <span style="font-size:11px;font-weight:600;letter-spacing:.08em;text-transform:uppercase;color:#999">Disabled</span>
          <TopMiningPrivacyConsent v-model="locked" disabled />
        </div>
      </div>
    `,
  }),
}
