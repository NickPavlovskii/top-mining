import type { Meta, StoryObj } from '@storybook/vue3'

import ConsultingBestSpeaker from '~/components/consulting/ConsultingBestSpeaker.vue'

import { canvasFullBleed } from '../helpers/decorators'

const meta = {
  title: 'Consulting/ConsultingBestSpeaker',
  component: ConsultingBestSpeaker,
  tags: ['autodocs', 'visual'],
  parameters: {
    layout: 'fullscreen',
    backgrounds: { default: 'off-white' },
    docs: {
      description: {
        component: `
Секция «Мы собираем лучших экспертов» (\`#best-speker\`) на странице consulting.

- Заголовок, Telegram-ссылка, форма заявки
- Загрузка резюме через \`TopMiningFileUpload\`
- Картинка эксперта слева (desktop) / под заголовком (mobile)
        `.trim(),
      },
    },
  },
  decorators: [canvasFullBleed],
} satisfies Meta<typeof ConsultingBestSpeaker>

export default meta

type Story = StoryObj<typeof meta>

export const Default: Story = {
  name: 'Desktop',
  render: () => ({
    components: { ConsultingBestSpeaker },
    template: '<ConsultingBestSpeaker />',
  }),
}

export const CompactViewport: Story = {
  name: '≤1400px (скрин)',
  parameters: {
    viewport: {
      defaultViewport: 'tablet',
    },
    docs: {
      description: {
        story: 'Узкая колонка формы рядом с уменьшенным фото — для визуальной проверки.',
      },
    },
  },
  render: () => ({
    components: { ConsultingBestSpeaker },
    template: `
      <div style="max-width:1200px;margin:0 auto">
        <ConsultingBestSpeaker />
      </div>
    `,
  }),
}

export const MobileViewport: Story = {
  name: 'Mobile (скрин)',
  parameters: {
    viewport: {
      defaultViewport: 'mobile1',
    },
    docs: {
      description: {
        story: 'Мобильная раскладка: заголовок, фото, форма столбцом.',
      },
    },
  },
  render: () => ({
    components: { ConsultingBestSpeaker },
    template: `
      <div style="max-width:390px;margin:0 auto">
        <ConsultingBestSpeaker />
      </div>
    `,
  }),
}
