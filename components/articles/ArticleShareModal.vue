<template>
  <<teleport to="body"> to="body">
    <div
      v-if="open"
      class="article-share-modal"
      role="dialog"
      aria-modal="true"
      aria-label="Поделиться"
      @keydown.esc.prevent="close"
    >
      <button
        type="button"
        class="article-share-modal__backdrop"
        aria-label="Закрыть"
        @click="close"
      />

      <div
        ref="panelRef"
        class="article-share-modal__panel"
        tabindex="-1"
      >
        <button
          type="button"
          class="article-share-modal__close"
          aria-label="Закрыть"
          @click="close"
        >
          <img
            class="article-share-modal__close-icon"
            alt=""
            aria-hidden="true"
            :src="closeIcon"
          >
        </button>

        <ul class="article-share-modal__networks">
          <li>
            <a
              class="article-share-modal__network"
              :href="telegramHref"
              target="_blank"
              rel="noopener noreferrer"
            >
              <span
                class="article-share-modal__network-icon article-share-modal__network-icon--telegram"
                aria-hidden="true"
              >
                <svg
                  viewBox="0 0 24 24"
                  width="22"
                  height="22"
                >
                  <path
                    fill="#fff"
                    d="M9.78 14.65 9.6 18.3c.3 0 .43-.13.59-.29l1.41-1.35 2.93 2.15c.54.3.92.14 1.07-.5l1.94-9.12c.18-.8-.29-1.12-.81-.92L5.1 11.07c-.78.3-.77.73-.13.93l3.37 1.05 7.83-4.93c.37-.23.71-.1.43.13z"
                  />
                </svg>
              </span>
              <span class="article-share-modal__network-label">Telegram</span>
            </a>
          </li>
          <li>
            <a
              class="article-share-modal__network"
              :href="whatsappHref"
              target="_blank"
              rel="noopener noreferrer"
            >
              <span
                class="article-share-modal__network-icon article-share-modal__network-icon--whatsapp"
                aria-hidden="true"
              >
                <svg
                  viewBox="0 0 24 24"
                  width="22"
                  height="22"
                >
                  <path
                    fill="#fff"
                    d="M12.04 2C6.58 2 2.15 6.4 2.15 11.84c0 1.95.54 3.78 1.48 5.35L2 22l4.97-1.6a9.86 9.86 0 0 0 5.07 1.4h.01c5.46 0 9.89-4.4 9.89-9.84S17.5 2 12.04 2zm5.77 14.12c-.24.68-1.4 1.25-1.94 1.33-.5.07-1.13.1-1.82-.11-.42-.13-.96-.31-1.65-.61-2.9-1.26-4.79-4.18-4.93-4.38-.14-.2-1.16-1.54-1.16-2.94 0-1.4.73-2.09.99-2.38.26-.29.57-.36.76-.36h.55c.18 0 .41-.07.64.49.24.58.81 2 .88 2.14.07.14.12.31.02.5-.1.2-.15.32-.3.49-.14.17-.3.38-.43.51-.14.14-.29.29-.12.57.16.28.73 1.2 1.56 1.94 1.08.96 1.98 1.26 2.26 1.4.28.14.44.12.61-.07.16-.2.7-.81.89-1.09.19-.28.37-.23.63-.14.26.1 1.64.77 1.92.91.28.14.47.21.54.33.07.12.07.68-.17 1.36z"
                  />
                </svg>
              </span>
              <span class="article-share-modal__network-label">WhatsApp</span>
            </a>
          </li>
          <li>
            <a
              class="article-share-modal__network"
              :href="vkHref"
              target="_blank"
              rel="noopener noreferrer"
            >
              <span
                class="article-share-modal__network-icon article-share-modal__network-icon--vk"
                aria-hidden="true"
              >
                <svg
                  viewBox="0 0 24 24"
                  width="22"
                  height="22"
                >
                  <path
                    fill="#fff"
                    d="M15.07 2H8.93C3.33 2 2 3.33 2 8.93v6.14C2 20.67 3.33 22 8.93 22h6.14c5.6 0 6.93-1.33 6.93-6.93V8.93C22 3.33 20.67 2 15.07 2zm3.08 14.27h-1.46c-.55 0-.72-.44-1.71-1.42-.86-.84-1.24-.95-1.45-.95-.3 0-.38.08-.38.49v1.3c0 .35-.11.56-1.04.56-1.54 0-3.25-.93-4.45-2.67-1.81-2.5-2.3-4.38-2.3-4.77 0-.2.08-.39.49-.39h1.46c.37 0 .51.17.65.56.71 2.05 1.9 3.85 2.39 3.85.18 0 .27-.09.27-.55v-2.13c-.06-.98-.57-1.07-.57-1.42 0-.17.14-.34.37-.34h2.3c.31 0 .42.17.42.53v2.87c0 .31.14.42.23.42.18 0 .33-.11.66-.44 1.02-1.14 1.75-2.91 1.75-2.91.1-.2.26-.39.65-.39h1.46c.44 0 .53.23.44.53-.18.84-1.95 3.35-1.95 3.35-.15.25-.21.36 0 .64.15.21.66.64 1 1.03.61.7 1.08 1.28 1.21 1.69.12.39-.07.59-.45.59z"
                  />
                </svg>
              </span>
              <span class="article-share-modal__network-label">VK</span>
            </a>
          </li>
          <li>
            <a
              class="article-share-modal__network"
              :href="okHref"
              target="_blank"
              rel="noopener noreferrer"
            >
              <span
                class="article-share-modal__network-icon article-share-modal__network-icon--ok"
                aria-hidden="true"
              >
                <svg
                  viewBox="0 0 24 24"
                  width="22"
                  height="22"
                >
                  <path
                    fill="#fff"
                    d="M12 4.5a3.25 3.25 0 1 1 0 6.5 3.25 3.25 0 0 1 0-6.5zm0 8.1c2.1 0 3.95.84 5.05 2.16a1.1 1.1 0 1 1-1.68 1.42c-.7-.83-1.92-1.38-3.37-1.38s-2.67.55-3.37 1.38a1.1 1.1 0 1 1-1.68-1.42C8.05 13.44 9.9 12.6 12 12.6zm-3.2 5.05 2.05-2.05L12 16.75l1.15-1.15 2.05 2.05a1.05 1.05 0 0 0 1.49-1.49l-2.05-2.05 1.05-.35a1.05 1.05 0 1 0-.66-2l-2.03.68-2.03-.68a1.05 1.05 0 1 0-.66 2l1.05.35-2.05 2.05a1.05 1.05 0 1 0 1.49 1.49z"
                  />
                </svg>
              </span>
              <span class="article-share-modal__network-label">OK</span>
            </a>
          </li>
          <li>
            <a
              class="article-share-modal__network"
              :href="emailHref"
            >
              <span
                class="article-share-modal__network-icon article-share-modal__network-icon--email"
                aria-hidden="true"
              >
                <svg
                  viewBox="0 0 24 24"
                  width="22"
                  height="22"
                >
                  <path
                    fill="#fff"
                    d="M20 4H4c-1.1 0-2 .9-2 2v12c0 1.1.9 2 2 2h16c1.1 0 2-.9 2-2V6c0-1.1-.9-2-2-2zm0 4-8 5L4 8V6l8 5 8-5v2z"
                  />
                </svg>
              </span>
              <span class="article-share-modal__network-label">E-mail</span>
            </a>
          </li>
        </ul>

        <div class="article-share-modal__copy-row">
          <div
            class="article-share-modal__url"
            :title="shareUrl"
          >
            {{ displayUrl }}
          </div>
          <button
            type="button"
            class="article-share-modal__copy"
            @click="copyUrl"
          >
            {{ copied ? 'Скопировано' : 'Скопировать' }}
          </button>
        </div>
      </div>
    </div>
  </teleport>
</template>

<script setup lang="ts">
  import closeIcon from '~/assets/images/top-mining/icons/close-icon.png'

  const props = withDefaults(
    defineProps<{
      modelValue: boolean
      shareTitle?: string
      shareUrl?: string
    }>(),
    {
      shareTitle: '',
      shareUrl: '',
    },
  )

  const emit = defineEmits<{
    'update:modelValue': [value: boolean]
  }>()

  const open = computed({
    get: () => props.modelValue,
    set: (value: boolean) => emit('update:modelValue', value),
  })

  const panelRef = ref<HTMLElement | null>(null)
  const copied = ref(false)
  let copiedTimer: ReturnType<typeof setTimeout> | null = null

  const shareUrl = computed(() => {
    if (props.shareUrl) {
      return props.shareUrl
    }
    if (import.meta.client) {
      return window.location.href
    }
    return ''
  })

  const shareTitle = computed(
    () => props.shareTitle || (import.meta.client ? document.title : ''),
  )

  const displayUrl = computed(() => {
    const url = shareUrl.value
    if (url.length <= 42) {
      return url
    }
    return `${url.slice(0, 34)}...`
  })

  const encodedUrl = computed(() => encodeURIComponent(shareUrl.value))
  const encodedTitle = computed(() => encodeURIComponent(shareTitle.value))

  const telegramHref = computed(
    () =>
      `https://t.me/share/url?url=${encodedUrl.value}&text=${encodedTitle.value}`,
  )
  const whatsappHref = computed(
    () =>
      `https://wa.me/?text=${encodeURIComponent(`${shareTitle.value} ${shareUrl.value}`)}`,
  )
  const vkHref = computed(
    () =>
      `https://vk.com/share.php?url=${encodedUrl.value}&title=${encodedTitle.value}`,
  )
  const okHref = computed(
    () =>
      `https://connect.ok.ru/offer?url=${encodedUrl.value}&title=${encodedTitle.value}`,
  )
  const emailHref = computed(
    () => `mailto:?subject=${encodedTitle.value}&body=${encodedUrl.value}`,
  )

  function close() {
    open.value = false
  }

  async function copyUrl() {
    const url = shareUrl.value
    if (!url) {
      return
    }

    try {
      await navigator.clipboard.writeText(url)
    } catch {
      window.prompt('Скопируйте ссылку:', url)
      return
    }

    copied.value = true
    if (copiedTimer) {
      clearTimeout(copiedTimer)
    }
    copiedTimer = setTimeout(() => {
      copied.value = false
      copiedTimer = null
    }, 1800)
  }

  watch(open, async (isOpen) => {
    if (!import.meta.client) {
      return
    }

    document.body.style.overflow = isOpen ? 'hidden' : ''

    if (isOpen) {
      await nextTick()
      panelRef.value?.focus()
    }
  })

  onBeforeUnmount(() => {
    if (import.meta.client) {
      document.body.style.overflow = ''
    }
    if (copiedTimer) {
      clearTimeout(copiedTimer)
    }
  })
</script>

<style scoped>
  .article-share-modal {
    position: fixed;
    inset: 0;
    z-index: 1200;
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 16px;
  }

  .article-share-modal__backdrop {
    position: absolute;
    inset: 0;
    border: 0;
    margin: 0;
    padding: 0;
    cursor: pointer;
    background: rgb(15 23 42 / 28%);
    backdrop-filter: blur(6px);
    -webkit-backdrop-filter: blur(6px);
  }

  .article-share-modal__panel {
    position: relative;
    z-index: 1;
    width: min(100%, 520px);
    padding: 36px 28px 28px;
    border-radius: 28px;
    background: #fff;
    box-shadow: 0 24px 64px rgb(15 23 42 / 18%);
    outline: none;
  }

  .article-share-modal__close {
    position: absolute;
    top: 14px;
    right: 14px;
    display: inline-flex;
    align-items: center;
    justify-content: center;
    width: 32px;
    height: 32px;
    padding: 0;
    border: 0;
    border-radius: 999px;
    background: transparent;
    color: #94a3b8;
    cursor: pointer;
  }

  .article-share-modal__close:hover,
  .article-share-modal__close:focus-visible {
    color: #64748b;
    background: #f1f5f9;
  }

  .article-share-modal__close-icon {
    display: block;
    width: 14px;
    height: 14px;
    object-fit: contain;
    mix-blend-mode: screen;
  }

  .article-share-modal__networks {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    gap: 18px 22px;
    margin: 0;
    padding: 8px 8px 28px;
    list-style: none;
  }

  .article-share-modal__network {
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 10px;
    min-width: 64px;
    text-decoration: none;
    color: #64748b;
  }

  .article-share-modal__network:hover .article-share-modal__network-icon,
  .article-share-modal__network:focus-visible .article-share-modal__network-icon {
    transform: translateY(-1px);
    filter: brightness(1.05);
  }

  .article-share-modal__network-icon {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    width: 56px;
    height: 56px;
    border-radius: 999px;
    transition:
      transform 0.15s ease,
      filter 0.15s ease;
  }

  .article-share-modal__network-icon--telegram {
    background: #2aabee;
  }

  .article-share-modal__network-icon--whatsapp {
    background: #25d366;
  }

  .article-share-modal__network-icon--vk {
    background: #0077ff;
  }

  .article-share-modal__network-icon--ok {
    background: #ee8208;
  }

  .article-share-modal__network-icon--email {
    background: #4a90e2;
  }

  .article-share-modal__network-icon svg {
    display: block;
  }

  .article-share-modal__network-label {
    font-size: 13px;
    font-weight: 500;
    line-height: 1.2;
    color: #64748b;
  }

  .article-share-modal__copy-row {
    display: flex;
    align-items: center;
    gap: 12px;
  }

  .article-share-modal__url {
    flex: 1;
    min-width: 0;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
    padding: 14px 18px;
    border-radius: 999px;
    background: #f1f5f9;
    color: #0f172a;
    font-size: 14px;
    font-weight: 500;
    line-height: 1.2;
  }

  .article-share-modal__copy {
    flex-shrink: 0;
    min-height: 48px;
    padding: 0 22px;
    border: 0;
    border-radius: 999px;
    background: var(--tm-orange, #ff6418);
    color: #fff;
    font-family: inherit;
    font-size: 13px;
    font-weight: 700;
    letter-spacing: 0.04em;
    text-transform: uppercase;
    cursor: pointer;
  }

  .article-share-modal__copy:hover,
  .article-share-modal__copy:focus-visible {
    background: var(--tm-orange-dark, #f25b12);
  }

  @media (max-width: 560px) {
    .article-share-modal__panel {
      padding: 32px 16px 20px;
      border-radius: 24px;
    }

    .article-share-modal__networks {
      gap: 14px 12px;
      padding-bottom: 20px;
    }

    .article-share-modal__network {
      min-width: 56px;
    }

    .article-share-modal__network-icon {
      width: 48px;
      height: 48px;
    }

    .article-share-modal__copy-row {
      flex-direction: column;
      align-items: stretch;
    }

    .article-share-modal__copy {
      width: 100%;
    }
  }
</style>
