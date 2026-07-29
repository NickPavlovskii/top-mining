<template>
  <div class="top-mining-file-upload">
    <input
      ref="fileInputRef"
      class="top-mining-file-upload__input"
      type="file"
      :name="name"
      :accept="accept"
      @change="onFileChange"
    >

    <div
      :class="[
        'top-mining-file-upload__handler',
        {
          'top-mining-file-upload__handler--invalid': error,
          'top-mining-file-upload__handler--dragover': isDragOver,
        },
      ]"
      @dragenter.prevent="onDragEnter"
      @dragover.prevent="onDragOver"
      @dragleave.prevent="onDragLeave"
      @drop.prevent="onDrop"
    >
      <div class="top-mining-file-upload__container">
        <button
          type="button"
          class="top-mining-file-upload__btn"
          @click="openFileDialog"
        >
          {{ chooseLabel }}
        </button>
      </div>

      <span class="top-mining-file-upload__counter">
        {{ validFileCount }} {{ counterTemplate }} {{ maxFiles }}
      </span>
    </div>

    <div
      v-if="selectedFile"
      class="top-mining-file-upload__status"
    >
      <div
        class="top-mining-file-upload__icon"
        aria-hidden="true"
      >
        <top-mining-file-icon />
      </div>

      <div class="top-mining-file-upload__details">
        <div class="top-mining-file-upload__name">
          <span>{{ truncatedFileName }}</span>
          <em>({{ formattedFileSize }})</em>
        </div>

        <div class="top-mining-file-upload__progress">
          <span
            :class="!error && 'top-mining-file-upload__progress-fill--complete'"
          />
        </div>

        <span
          v-if="error"
          class="top-mining-file-upload__error"
        >
          {{ error }}
        </span>

        <button
          type="button"
          class="top-mining-file-upload__remove"
          :aria-label="removeFileLabel"
          @click="removeFile"
        >
          <svg
            width="10"
            height="10"
            viewBox="0 0 14 14"
            fill="none"
            xmlns="http://www.w3.org/2000/svg"
            aria-hidden="true"
          >
            <path
              d="M1 1L13 13M13 1L1 13"
              stroke="currentColor"
              stroke-width="1.5"
              stroke-linecap="round"
            />
          </svg>
        </button>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
  const props = withDefaults(
    defineProps<{
      accept?: string
      allowedExtensions?: readonly string[]
      maxFiles?: number
      maxSizeMb?: number
      chooseLabel?: string
      counterTemplate?: string
      invalidFormatError?: string
      invalidSizeError?: string
      removeFileLabel?: string
      name?: string
    }>(),
    {
      accept: '.pdf,.doc',
      allowedExtensions: () => ['pdf', 'doc'],
      maxFiles: 1,
      maxSizeMb: 10,
      chooseLabel: 'Выберите файл',
      counterTemplate: 'из',
      invalidFormatError: 'Неправильный формат файла. Разрешены PDF и DOC',
      invalidSizeError: 'Размер файла не должен превышать 10 МБ',
      removeFileLabel: 'Удалить файл',
      name: undefined,
    },
  )

  const model = defineModel<File | null>({ default: null })
  const error = defineModel<string>('error', { default: '' })

  const fileInputRef = ref<HTMLInputElement | null>(null)
  const selectedFile = ref<File | null>(null)
  const isDragOver = ref(false)
  let dragCounter = 0

  const validFileCount = computed(() => (selectedFile.value && !error.value ? 1 : 0))

  const truncatedFileName = computed(() => {
    if (!selectedFile.value) {
      return ''
    }

    const fileName = selectedFile.value.name
    const maxLength = 34

    if (fileName.length <= maxLength) {
      return fileName
    }

    const extension = fileName.includes('.') ? fileName.slice(fileName.lastIndexOf('.')) : ''
    const base = fileName.slice(0, maxLength - extension.length - 3)

    return `${base}...${extension}`
  })

  const formattedFileSize = computed(() => {
    if (!selectedFile.value) {
      return ''
    }

    const sizeMb = selectedFile.value.size / (1024 * 1024)

    if (sizeMb < 1) {
      return `${(selectedFile.value.size / 1024).toFixed(2)}KB`
    }

    return `${sizeMb.toFixed(2)}MB`
  })

  function getFileExtension(fileName: string) {
    const parts = fileName.toLowerCase().split('.')

    return parts.length > 1 ? parts.at(-1) ?? '' : ''
  }

  function validateFile(file: File) {
    const extension = getFileExtension(file.name)
    const maxBytes = props.maxSizeMb * 1024 * 1024

    if (!props.allowedExtensions.includes(extension)) {
      return props.invalidFormatError
    }

    if (file.size > maxBytes) {
      return props.invalidSizeError
    }

    return ''
  }

  function syncModel() {
    model.value = selectedFile.value && !error.value ? selectedFile.value : null
  }

  function setFile(file: File) {
    selectedFile.value = file
    error.value = validateFile(file)
    syncModel()

    if (fileInputRef.value) {
      const dataTransfer = new DataTransfer()
      dataTransfer.items.add(file)
      fileInputRef.value.files = dataTransfer.files
    }
  }

  function openFileDialog() {
    fileInputRef.value?.click()
  }

  function onFileChange(event: Event) {
    const input = event.target as HTMLInputElement
    const file = input.files?.[0]

    if (!file) {
      return
    }

    setFile(file)
  }

  function onDragEnter() {
    dragCounter += 1
    isDragOver.value = true
  }

  function onDragOver() {
    isDragOver.value = true
  }

  function onDragLeave() {
    dragCounter -= 1

    if (dragCounter <= 0) {
      dragCounter = 0
      isDragOver.value = false
    }
  }

  function onDrop(event: DragEvent) {
    dragCounter = 0
    isDragOver.value = false

    const file = event.dataTransfer?.files?.[0]

    if (!file) {
      return
    }

    setFile(file)
  }

  function removeFile() {
    selectedFile.value = null
    error.value = ''

    if (fileInputRef.value) {
      fileInputRef.value.value = ''
    }

    syncModel()
  }

  watch(model, (file) => {
    if (!file && selectedFile.value) {
      removeFile()
    }
  })
</script>

<style scoped>
  .top-mining-file-upload {
    width: 100%;
    font-family: 'Mulish', 'Segoe UI', system-ui, sans-serif;
    font-size: 18px;
    font-weight: 400;
    line-height: 24px;
    text-align: left;
  }

  .top-mining-file-upload__input {
    position: absolute;
    overflow: hidden;
    width: 1px;
    height: 1px;
    clip: rect(0, 0, 0, 0);
    white-space: nowrap;
  }

  .top-mining-file-upload__handler {
    position: relative;
    margin-bottom: 10px;
    padding: 15px 20px;
    border: 2px dashed #c5c5c5;
    border-radius: 5px;
  }

  .top-mining-file-upload__handler--invalid {
    border-bottom-color: #900;
    border-bottom-style: solid;
  }

  .top-mining-file-upload__handler--dragover {
    border-color: #6b6a6a;
  }

  .top-mining-file-upload__container {
    text-align: center;
  }

  .top-mining-file-upload__btn {
    padding: 0;
    border: 0;
    background: transparent;
    color: var(--tm-orange-accent-deep);
    font: inherit;
    text-decoration: none;
    cursor: pointer;
  }

  .top-mining-file-upload__btn:hover,
  .top-mining-file-upload__btn:focus-visible {
    color: var(--tm-orange-accent-light);
  }

  .top-mining-file-upload__counter {
    position: absolute;
    right: 18px;
    bottom: 18px;
    color: #757575;
    font-size: 12px;
  }

  .top-mining-file-upload__status {
    display: flex;
    align-items: flex-start;
    padding: 4px 0;
  }

  .top-mining-file-upload__icon {
    display: flex;
    align-items: center;
    justify-content: center;
    flex-shrink: 0;
    width: 40px;
    height: 40px;
    border: 1px solid #a5a5a5;
    border-radius: 100%;
    color: #757575;
  }

  .top-mining-file-upload__details {
    position: relative;
    width: calc(100% - 40px);
    padding-left: 10px;
  }

  .top-mining-file-upload__name {
    display: flex;
    align-items: baseline;
    gap: 4px;
    padding: 4px 36px 4px 0;
    color: #757575;
    font: inherit;
  }

  .top-mining-file-upload__name span {
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
  }

  .top-mining-file-upload__name em {
    flex-shrink: 0;
    color: #757575;
    font-style: normal;
    font-weight: 400;
  }

  .top-mining-file-upload__progress {
    display: block;
    overflow: hidden;
    height: 14px;
    border-radius: 5px;
    background: #565555;
  }

  .top-mining-file-upload__progress span {
    display: block;
    width: 0;
    height: 100%;
    background: #4caf50;
    font-size: 11px;
    line-height: 14px;
    color: #fff;
    text-align: right;
  }

  .top-mining-file-upload__progress-fill--complete {
    width: 100% !important;
    padding-right: 5px;
  }

  .top-mining-file-upload__error {
    display: block;
    padding-top: 4px;
    color: #f50505;
    font: inherit;
  }

  .top-mining-file-upload__remove {
    position: absolute;
    top: 6px;
    right: 0;
    display: flex;
    align-items: center;
    justify-content: center;
    width: 16px;
    height: 16px;
    padding: 0;
    border: 1px solid #a5a5a5;
    border-radius: 100%;
    background: transparent;
    color: #757575;
    cursor: pointer;
  }

  .top-mining-file-upload__remove svg {
    display: block;
    width: 10px;
    height: 10px;
  }

  .top-mining-file-upload__remove:hover,
  .top-mining-file-upload__remove:focus-visible {
    color: var(--tm-page-bg);
  }

  @media (max-width: 1400px) {
    .top-mining-file-upload {
      font-size: 12px;
    }

    .top-mining-file-upload__handler {
      border-radius: 24px;
    }
  }
</style>
