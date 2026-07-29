import type { Meta, StoryObj } from '@storybook/vue3'
import { nextTick, onMounted, ref } from 'vue'

import TopMiningFileUpload from '~/components/global/forms/TopMiningFileUpload.vue'

import { canvasLight, canvasLightMaxWidth, CANVAS_WIDTH } from '../helpers/decorators'

function createDemoFile(name: string, sizeBytes: number) {
  const file = new File(['x'], name, { type: 'application/octet-stream' })
  Object.defineProperty(file, 'size', { value: sizeBytes })

  return file
}

async function assignFileToInput(root: HTMLElement, file: File) {
  const input = root.querySelector('input[type="file"]') as HTMLInputElement | null

  if (!input) {
    return
  }

  const dataTransfer = new DataTransfer()
  dataTransfer.items.add(file)
  input.files = dataTransfer.files
  input.dispatchEvent(new Event('change', { bubbles: true }))
  await nextTick()
}

const meta = {
  title: 'Global/TopMiningFileUpload',
  component: TopMiningFileUpload,
  tags: ['autodocs'],
  parameters: {
    layout: 'padded',
    backgrounds: { default: 'off-white' },
    docs: {
      description: {
        component: `
Загрузка файла (pdf/doc) с drag-and-drop, счётчиком и статусом валидации.

- **v-model** — валидный \`File | null\`
- **v-model:error** — текст ошибки
- **accept / allowedExtensions / maxSizeMb** — ограничения
- Состояния: пусто, валидный файл, неверный формат, превышен размер
        `.trim(),
      },
    },
  },
  argTypes: {
    chooseLabel: { control: 'text' },
    maxFiles: { control: 'number' },
    maxSizeMb: { control: 'number' },
    accept: { control: 'text' },
  },
  decorators: [canvasLightMaxWidth(CANVAS_WIDTH.card)],
} satisfies Meta<typeof TopMiningFileUpload>

export default meta

type Story = StoryObj<typeof meta>

export const Default: Story = {
  name: 'Пусто',
  render: (args) => ({
    components: { TopMiningFileUpload },
    setup() {
      const file = ref<File | null>(null)
      const error = ref('')

      return { args, file, error }
    },
    template: `
      <TopMiningFileUpload
        v-model="file"
        v-model:error="error"
        v-bind="args"
      />
    `,
  }),
}

export const ValidFile: Story = {
  name: 'Валидный файл',
  parameters: {
    docs: {
      description: {
        story: 'PDF до 10 МБ — счётчик `1 из 1`, зелёный прогресс-бар.',
      },
    },
  },
  render: () => ({
    components: { TopMiningFileUpload },
    setup() {
      const file = ref<File | null>(null)
      const error = ref('')
      const root = ref<HTMLElement | null>(null)

      onMounted(async () => {
        if (!root.value) {
          return
        }

        await assignFileToInput(
          root.value,
          createDemoFile('resume.pdf', 1.39 * 1024 * 1024),
        )
      })

      return { file, error, root }
    },
    template: `
      <div ref="root">
        <TopMiningFileUpload v-model="file" v-model:error="error" />
      </div>
    `,
  }),
}

export const InvalidFormat: Story = {
  name: 'Неверный формат',
  parameters: {
    docs: {
      description: {
        story: 'DOCX и другие расширения кроме pdf/doc — красная ошибка формата.',
      },
    },
  },
  render: () => ({
    components: { TopMiningFileUpload },
    setup() {
      const file = ref<File | null>(null)
      const error = ref('')
      const root = ref<HTMLElement | null>(null)

      onMounted(async () => {
        if (!root.value) {
          return
        }

        await assignFileToInput(
          root.value,
          createDemoFile('Вопросы_к_заказчику_видеоаналитик.docx', 1.39 * 1024 * 1024),
        )
      })

      return { file, error, root }
    },
    template: `
      <div ref="root">
        <TopMiningFileUpload v-model="file" v-model:error="error" />
      </div>
    `,
  }),
}

export const InvalidSize: Story = {
  name: 'Превышен размер',
  parameters: {
    docs: {
      description: {
        story: 'Файл больше 10 МБ — ошибка размера и invalid-бордер.',
      },
    },
  },
  render: () => ({
    components: { TopMiningFileUpload },
    setup() {
      const file = ref<File | null>(null)
      const error = ref('')
      const root = ref<HTMLElement | null>(null)

      onMounted(async () => {
        if (!root.value) {
          return
        }

        await assignFileToInput(
          root.value,
          createDemoFile('Акт_обследования_цеха.pdf', 15.12 * 1024 * 1024),
        )
      })

      return { file, error, root }
    },
    template: `
      <div ref="root">
        <TopMiningFileUpload v-model="file" v-model:error="error" />
      </div>
    `,
  }),
}

export const AllStates: Story = {
  name: 'Все состояния (скрин)',
  tags: ['visual'],
  decorators: [canvasLight],
  parameters: {
    docs: {
      description: {
        story:
          'Сводка состояний для визуальной проверки / скриншотов. Тег `visual`.',
      },
    },
  },
  render: () => ({
    components: { TopMiningFileUpload },
    setup() {
      const emptyFile = ref<File | null>(null)
      const emptyError = ref('')
      const validFile = ref<File | null>(null)
      const validError = ref('')
      const formatFile = ref<File | null>(null)
      const formatError = ref('')
      const sizeFile = ref<File | null>(null)
      const sizeError = ref('')
      const root = ref<HTMLElement | null>(null)

      onMounted(async () => {
        if (!root.value) {
          return
        }

        const blocks = root.value.querySelectorAll('[data-upload-demo]')

        await assignFileToInput(
          blocks[0] as HTMLElement,
          createDemoFile('resume.pdf', 900 * 1024),
        )
        await assignFileToInput(
          blocks[1] as HTMLElement,
          createDemoFile('notes.docx', 1.39 * 1024 * 1024),
        )
        await assignFileToInput(
          blocks[2] as HTMLElement,
          createDemoFile('big.pdf', 15 * 1024 * 1024),
        )
      })

      return {
        emptyFile,
        emptyError,
        validFile,
        validError,
        formatFile,
        formatError,
        sizeFile,
        sizeError,
        root,
      }
    },
    template: `
      <div ref="root" class="sb-stack" style="gap:28px;max-width:420px">
        <div class="sb-stack" style="gap:8px">
          <span style="font-size:11px;font-weight:600;letter-spacing:.08em;text-transform:uppercase;color:#666">Пусто</span>
          <TopMiningFileUpload v-model="emptyFile" v-model:error="emptyError" />
        </div>
        <div class="sb-stack" style="gap:8px" data-upload-demo>
          <span style="font-size:11px;font-weight:600;letter-spacing:.08em;text-transform:uppercase;color:#666">Валидный</span>
          <TopMiningFileUpload v-model="validFile" v-model:error="validError" />
        </div>
        <div class="sb-stack" style="gap:8px" data-upload-demo>
          <span style="font-size:11px;font-weight:600;letter-spacing:.08em;text-transform:uppercase;color:#666">Неверный формат</span>
          <TopMiningFileUpload v-model="formatFile" v-model:error="formatError" />
        </div>
        <div class="sb-stack" style="gap:8px" data-upload-demo>
          <span style="font-size:11px;font-weight:600;letter-spacing:.08em;text-transform:uppercase;color:#666">Превышен размер</span>
          <TopMiningFileUpload v-model="sizeFile" v-model:error="sizeError" />
        </div>
      </div>
    `,
  }),
}
