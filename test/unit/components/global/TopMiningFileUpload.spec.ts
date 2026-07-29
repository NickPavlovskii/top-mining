import { mount, type VueWrapper } from '@vue/test-utils'
import { describe, expect, it, vi } from 'vitest'

import TopMiningFileUpload from '~/components/global/forms/TopMiningFileUpload.vue'

type UploadWrapper = VueWrapper<InstanceType<typeof TopMiningFileUpload>>

function createFile(name: string, sizeBytes: number, type = 'application/octet-stream') {
  const file = new File(['x'], name, { type })
  Object.defineProperty(file, 'size', { value: sizeBytes })

  return file
}

function lastEmit<T>(wrapper: UploadWrapper, event: string): T | undefined {
  const calls = wrapper.emitted(event)

  if (!calls?.length) {
    return undefined
  }

  return calls.at(-1)?.[0] as T
}

function mountUpload(): UploadWrapper {
  return mount(TopMiningFileUpload, {
    global: {
      stubs: {
        TopMiningFileIcon: true,
        'top-mining-file-icon': true,
      },
    },
  }) as UploadWrapper
}

async function selectFile(wrapper: UploadWrapper, file: File) {
  const input = wrapper.find('input[type="file"]')
  const inputEl = input.element as HTMLInputElement

  Object.defineProperty(inputEl, 'files', {
    configurable: true,
    value: [file],
  })

  await input.trigger('change')
}

describe('TopMiningFileUpload', () => {
  it('renders choose button and empty counter', () => {
    const wrapper = mountUpload()

    expect(wrapper.text()).toContain('Выберите файл')
    expect(wrapper.text()).toContain('0 из 1')
    expect(wrapper.find('.top-mining-file-upload__status').exists()).toBe(false)
  })

  it('accepts valid pdf and updates model and counter', async () => {
    const wrapper = mountUpload()
    const file = createFile('resume.pdf', 1024 * 200)

    await selectFile(wrapper, file)

    const model = lastEmit<File | null>(wrapper, 'update:modelValue')

    expect(model).toBeTruthy()
    expect(model?.name).toBe('resume.pdf')
    expect(wrapper.text()).toContain('1 из 1')
    expect(wrapper.find('.top-mining-file-upload__status').exists()).toBe(true)
    expect(wrapper.find('.top-mining-file-upload__error').exists()).toBe(false)
    expect(
      wrapper.find('.top-mining-file-upload__progress-fill--complete').exists(),
    ).toBe(true)
  })

  it('rejects invalid format and keeps model null', async () => {
    const wrapper = mountUpload()

    await selectFile(wrapper, createFile('notes.docx', 1024 * 300))

    expect(lastEmit<string>(wrapper, 'update:error')).toBe(
      'Неправильный формат файла. Разрешены PDF и DOC',
    )
    expect(lastEmit<File | null>(wrapper, 'update:modelValue')).toBeUndefined()
    expect(wrapper.text()).toContain('0 из 1')
    expect(wrapper.find('.top-mining-file-upload__handler--invalid').exists()).toBe(true)
    expect(wrapper.find('.top-mining-file-upload__error').text()).toContain(
      'Неправильный формат файла',
    )
  })

  it('rejects file larger than maxSizeMb', async () => {
    const wrapper = mountUpload()

    await selectFile(wrapper, createFile('big.pdf', 11 * 1024 * 1024))

    expect(lastEmit<string>(wrapper, 'update:error')).toBe(
      'Размер файла не должен превышать 10 МБ',
    )
    expect(lastEmit<File | null>(wrapper, 'update:modelValue')).toBeUndefined()
    expect(wrapper.find('.top-mining-file-upload__handler--invalid').exists()).toBe(true)
  })

  it('truncates long file names in status', async () => {
    const wrapper = mountUpload()

    await selectFile(
      wrapper,
      createFile('Вопросы_к_заказчику_видеоаналитик_очень_длинное_имя.pdf', 1500),
    )

    const name = wrapper.find('.top-mining-file-upload__name span').text()

    expect(name).toContain('...')
    expect(name.endsWith('.pdf')).toBe(true)
    expect(name.length).toBeLessThanOrEqual(40)
  })

  it('formats file size as KB and MB', async () => {
    const wrapper = mountUpload()

    await selectFile(wrapper, createFile('small.pdf', 512))
    expect(wrapper.find('.top-mining-file-upload__name em').text()).toMatch(/KB\)/)

    await selectFile(wrapper, createFile('large.pdf', 2 * 1024 * 1024))
    expect(wrapper.find('.top-mining-file-upload__name em').text()).toMatch(/MB\)/)
  })

  it('removes selected file and resets error', async () => {
    const wrapper = mountUpload()

    await selectFile(wrapper, createFile('resume.pdf', 1000))
    expect(wrapper.find('.top-mining-file-upload__status').exists()).toBe(true)
    expect(lastEmit<File | null>(wrapper, 'update:modelValue')).toBeTruthy()

    await wrapper.find('.top-mining-file-upload__remove').trigger('click')

    expect(lastEmit<File | null>(wrapper, 'update:modelValue')).toBeNull()
    expect(wrapper.find('.top-mining-file-upload__status').exists()).toBe(false)
    expect(wrapper.find('.top-mining-file-upload__handler--invalid').exists()).toBe(false)
    expect(wrapper.text()).toContain('0 из 1')
  })

  it('accepts file via drop on handler', async () => {
    const wrapper = mountUpload()
    const file = createFile('dropped.doc', 2048)
    const handler = wrapper.find('.top-mining-file-upload__handler')

    await handler.trigger('drop', {
      dataTransfer: {
        files: [file],
      },
    })

    const model = lastEmit<File | null>(wrapper, 'update:modelValue')

    expect(model).toBeTruthy()
    expect(model?.name).toBe('dropped.doc')
    expect(wrapper.find('.top-mining-file-upload__handler--dragover').exists()).toBe(false)
  })

  it('toggles dragover class on drag enter and leave', async () => {
    const wrapper = mountUpload()
    const handler = wrapper.find('.top-mining-file-upload__handler')

    await handler.trigger('dragenter')
    expect(wrapper.find('.top-mining-file-upload__handler--dragover').exists()).toBe(true)

    await handler.trigger('dragleave')
    expect(wrapper.find('.top-mining-file-upload__handler--dragover').exists()).toBe(false)
  })

  it('opens file dialog when choose button is clicked', async () => {
    const wrapper = mountUpload()
    const input = wrapper.find('input[type="file"]').element as HTMLInputElement
    const clickSpy = vi.spyOn(input, 'click').mockImplementation(() => {})

    await wrapper.find('.top-mining-file-upload__btn').trigger('click')

    expect(clickSpy).toHaveBeenCalledTimes(1)
    clickSpy.mockRestore()
  })

  it('matches empty state snapshot', () => {
    const wrapper = mountUpload()

    expect(wrapper.html()).toMatchSnapshot()
  })

  it('matches invalid format state snapshot', async () => {
    const wrapper = mountUpload()

    await selectFile(wrapper, createFile('notes.docx', 1024 * 300))

    expect(wrapper.html()).toMatchSnapshot()
  })
})
