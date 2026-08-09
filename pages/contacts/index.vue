<template>
  <div class="contacts-page">
    <div class="contacts-page__inner">
      <nav
        class="contacts-page__breadcrumbs"
        :aria-label="t('common.breadcrumbsAria')"
      >
        <nuxt-link
          class="contacts-page__breadcrumbs-link"
          to="/"
        >
          {{ t('common.home') }}
        </nuxt-link>
        <span
          class="contacts-page__breadcrumbs-sep"
          aria-hidden="true"
        >/</span>
        <span class="contacts-page__breadcrumbs-current">{{ page.breadcrumb }}</span>
      </nav>

      <h1 class="contacts-page__title">
        {{ page.title }}
      </h1>

      <div class="contacts-page__layout">
        <div class="contacts-page__channels">
          <article
            v-for="item in channels"
            :key="item.key"
            class="contacts-page__card"
          >
            <p class="contacts-page__card-label">
              {{ item.label }}
            </p>
            <div :class="['contacts-page__link', `contacts-page__link--${item.iconClass}`]">
              <a
                class="contacts-page__link-value"
                :href="item.href"
                :target="item.external ? '_blank' : undefined"
                :rel="item.external ? 'noopener noreferrer' : undefined"
              >
                {{ item.value }}
              </a>
              <button
                type="button"
                class="contacts-page__copy"
                :aria-label="page.copyLabel"
                @click="copyValue(item.copyValue, item.key)"
              >
                <span class="contacts-page__copy-tip">
                  {{ copyTipLabel(item.key) }}
                </span>
                <svg
                  xmlns="http://www.w3.org/2000/svg"
                  width="21"
                  height="26"
                  viewBox="0 0 21 26"
                  fill="none"
                  aria-hidden="true"
                >
                  <rect
                    x="1"
                    y="1"
                    width="13.3333"
                    height="18.6667"
                    rx="2"
                    stroke="currentColor"
                  />
                  <path
                    d="M6.32812 22.6668V23.0002C6.32812 24.1047 7.22355 25.0002 8.32812 25.0002H17.6615C18.766 25.0002 19.6615 24.1047 19.6615 23.0002V9.00016C19.6615 7.5274 18.4676 6.3335 16.9948 6.3335V6.3335"
                    stroke="currentColor"
                    stroke-linecap="round"
                    stroke-linejoin="round"
                  />
                </svg>
              </button>
            </div>
          </article>
        </div>

        <article class="contacts-page__card contacts-page__card--office">
          <p class="contacts-page__card-label">
            {{ page.address.label }}
          </p>
          <div class="contacts-page__link contacts-page__link--address">
            <span class="contacts-page__link-value">{{ page.address.value }}</span>
            <button
              type="button"
              class="contacts-page__copy"
              :aria-label="page.copyLabel"
              @click="copyValue(page.address.copyValue, 'address')"
            >
              <span class="contacts-page__copy-tip">
                {{ copyTipLabel('address') }}
              </span>
              <svg
                xmlns="http://www.w3.org/2000/svg"
                width="21"
                height="26"
                viewBox="0 0 21 26"
                fill="none"
                aria-hidden="true"
              >
                <rect
                  x="1"
                  y="1"
                  width="13.3333"
                  height="18.6667"
                  rx="2"
                  stroke="currentColor"
                />
                <path
                  d="M6.32812 22.6668V23.0002C6.32812 24.1047 7.22355 25.0002 8.32812 25.0002H17.6615C18.766 25.0002 19.6615 24.1047 19.6615 23.0002V9.00016C19.6615 7.5274 18.4676 6.3335 16.9948 6.3335V6.3335"
                  stroke="currentColor"
                  stroke-linecap="round"
                  stroke-linejoin="round"
                />
              </svg>
            </button>
          </div>

          <div class="contacts-page__coords">
            <span>
              {{ page.coordinates.label }}
              <strong>{{ page.coordinates.value }}</strong>
            </span>
            <button
              type="button"
              class="contacts-page__copy"
              :aria-label="page.copyLabel"
              @click="copyValue(page.coordinates.copyValue, 'coords')"
            >
              <span class="contacts-page__copy-tip">
                {{ copyTipLabel('coords') }}
              </span>
              <svg
                xmlns="http://www.w3.org/2000/svg"
                width="21"
                height="26"
                viewBox="0 0 21 26"
                fill="none"
                aria-hidden="true"
              >
                <rect
                  x="1"
                  y="1"
                  width="13.3333"
                  height="18.6667"
                  rx="2"
                  stroke="currentColor"
                />
                <path
                  d="M6.32812 22.6668V23.0002C6.32812 24.1047 7.22355 25.0002 8.32812 25.0002H17.6615C18.766 25.0002 19.6615 24.1047 19.6615 23.0002V9.00016C19.6615 7.5274 18.4676 6.3335 16.9948 6.3335V6.3335"
                  stroke="currentColor"
                  stroke-linecap="round"
                  stroke-linejoin="round"
                />
              </svg>
            </button>
          </div>

          <div
            v-for="(row, rowIndex) in page.metroRows"
            :key="`metro-row-${rowIndex}`"
            class="contacts-page__metro-row"
          >
            <div
              v-for="station in row"
              :key="station"
              class="contacts-page__metro"
            >
              {{ station }}
            </div>
          </div>

          <ClientOnly>
            <div
              ref="mapWrap"
              class="contacts-page__map"
            />
          </ClientOnly>
        </article>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
  import { CONTACTS_PAGE } from '~/common/modules/top-mining/pages/contacts'

  definePageMeta({
    hideFooterContact: true,
  })

  const { t } = useT()
  const page = CONTACTS_PAGE
  const copiedKey = ref<string | null>(null)
  const mapWrap = ref<HTMLElement | null>(null)
  let copiedTimer: ReturnType<typeof setTimeout> | null = null

  const channels = [
    { key: 'phone', ...page.phone, external: false },
    { key: 'telegram', ...page.telegram, external: true },
    { key: 'whatsapp', ...page.whatsapp, external: true },
    { key: 'email', ...page.email, external: false },
  ] as const

  const copyTipLabel = computed(() => {
    const activeKey = copiedKey.value
    return (key: string) =>
      activeKey === key ? page.copiedLabel : page.copyLabel
  })

  useSeoMeta({
    title: page.seoTitle,
    description: page.seoDescription,
    ogTitle: page.seoTitle,
    ogDescription: page.seoDescription,
  })

  async function copyValue(value: string, key: string) {
    if (import.meta.server) {
      return
    }

    try {
      await navigator.clipboard.writeText(value)
      copiedKey.value = key
      if (copiedTimer) {
        clearTimeout(copiedTimer)
      }
      copiedTimer = setTimeout(() => {
        copiedKey.value = null
      }, 1600)
    }
    catch {
      // ignore clipboard errors
    }
  }

  watch(
    mapWrap,
    (el) => {
      if (!el || el.dataset.mapLoaded === '1') {
        return
      }

      el.dataset.mapLoaded = '1'
      const script = document.createElement('script')
      script.src = page.map.constructorSrc
      script.async = true
      script.charset = 'utf-8'
      el.appendChild(script)
    },
    { flush: 'post' },
  )

  onBeforeUnmount(() => {
    if (copiedTimer) {
      clearTimeout(copiedTimer)
    }
  })
</script>

<style scoped>
  .contacts-page {
    position: relative;
    z-index: 1;
    margin-bottom: 0;
    padding: 64px 0 120px;
    border-radius: 64px 64px 0 0;
    background: #141414;
    color: var(--tm-white);
  }

  .contacts-page__inner {
    max-width: 1728px;
    margin: 0 auto;
    padding: 0 96px;
  }

  .contacts-page__breadcrumbs {
    display: flex;
    flex-wrap: wrap;
    align-items: center;
    gap: 8px;
    color: #757575;
    font-size: 18px;
    font-weight: 600;
    line-height: 1.2;
  }

  .contacts-page__breadcrumbs-link {
    color: inherit;
    text-decoration: none;
  }

  .contacts-page__breadcrumbs-link:hover,
  .contacts-page__breadcrumbs-link:focus-visible {
    color: #ff741f;
  }

  .contacts-page__breadcrumbs-current {
    font-weight: 400;
  }

  .contacts-page__title {
    margin: 64px 0;
    color: #f6f6f6;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(48px, 8vw, 120px);
    font-weight: 500;
    line-height: 1;
    text-transform: uppercase;
  }

  .contacts-page__layout {
    display: flex;
    gap: 24px;
    align-items: stretch;
  }

  .contacts-page__channels {
    display: flex;
    flex: 1 1 0;
    flex-direction: column;
    gap: 24px;
    max-width: 855px;
    width: 100%;
  }

  .contacts-page__card {
    width: 100%;
    min-height: 168px;
    padding: 40px;
    border-radius: 32px;
    background: #1f1f1f;
    box-sizing: border-box;
  }

  .contacts-page__card--office {
    flex: 1 1 0;
    max-width: 855px;
    min-height: auto;
  }

  .contacts-page__card-label {
    margin: 0 0 30px;
    color: #5c5c5c;
    font-size: 18px;
    font-weight: 400;
    line-height: 26px;
  }

  .contacts-page__link {
    position: relative;
    display: flex;
    align-items: center;
    gap: 16px;
    padding-left: 48px;
    color: #fff;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 22px;
    font-weight: 400;
    line-height: 30px;
  }

  .contacts-page__link::before {
    content: '';
    position: absolute;
    left: 0;
    top: calc(50% - 16px);
    width: 32px;
    height: 32px;
    background-position: center;
    background-repeat: no-repeat;
    background-size: contain;
  }

  .contacts-page__link--phone::before {
    background-image: url('/images/contacts/c-phone.png');
  }

  .contacts-page__link--tg::before {
    background-image: url('/images/contacts/c-tg.png');
  }

  .contacts-page__link--wa::before {
    background-image: url('/images/contacts/c-wa.png');
  }

  .contacts-page__link--email::before {
    background-image: url('/images/contacts/c-email.png');
  }

  .contacts-page__link--address::before {
    background-image: url('/images/contacts/c-address.png');
  }

  .contacts-page__link-value {
    min-width: 0;
    color: inherit;
    text-decoration: none;
    overflow-wrap: anywhere;
  }

  a.contacts-page__link-value:hover,
  a.contacts-page__link-value:focus-visible {
    color: #ff741f;
  }

  .contacts-page__copy {
    position: relative;
    z-index: 10;
    display: block;
    flex: 0 0 auto;
    margin: 0;
    padding: 0;
    border: 0;
    background: transparent;
    color: #757575;
    cursor: pointer;
  }

  .contacts-page__copy-tip {
    position: absolute;
    top: -42px;
    left: 0;
    z-index: 1;
    display: none;
    width: max-content;
    height: 40px;
    padding: 8px 12px;
    border-radius: 8px;
    background: #fff;
    box-shadow: 0 4px 20px rgb(0 0 0 / 15%);
    color: #141414;
    font-size: 18px;
    font-weight: 400;
    line-height: 24px;
    opacity: 0;
    white-space: nowrap;
    pointer-events: none;
  }

  .contacts-page__copy:hover,
  .contacts-page__copy:focus-visible {
    color: #ff741f;
  }

  .contacts-page__copy:hover .contacts-page__copy-tip,
  .contacts-page__copy:focus-visible .contacts-page__copy-tip {
    display: block;
    opacity: 1;
  }

  .contacts-page__coords {
    display: flex;
    align-items: center;
    gap: 16px;
    margin: 20px 0 0;
    color: #757575;
    font-size: 18px;
    font-weight: 400;
    line-height: 24px;
  }

  .contacts-page__coords strong {
    color: #757575;
    font-weight: 400;
  }

  .contacts-page__metro-row {
    display: flex;
    justify-content: space-between;
    gap: 24px;
    max-width: 402px;
  }

  .contacts-page__metro {
    position: relative;
    margin-top: 8px;
    padding-left: 30px;
    color: #757575;
    font-size: 18px;
    font-weight: 400;
    line-height: 24px;
  }

  .contacts-page__metro::before {
    content: '';
    position: absolute;
    left: 0;
    top: calc(50% - 8px);
    width: 23px;
    height: 16px;
    background: url('/images/contacts/metro.png') no-repeat center;
    background-size: contain;
  }

  .contacts-page__map {
    overflow: hidden;
    margin-top: 30px;
    border-radius: 22px;
    min-height: 424px;
  }

  .contacts-page__map :deep(iframe) {
    display: block;
    width: 100% !important;
    height: 424px !important;
    border: 0;
  }

  @media (max-width: 1439px) {
    .contacts-page__inner {
      max-width: 1440px;
      padding: 0 60px;
    }

    .contacts-page__card {
      min-height: 197px;
    }
  }

  @media (max-width: 1100px) {
    .contacts-page {
      padding-bottom: 88px;
      margin-bottom: 0;
    }

    .contacts-page__inner {
      max-width: 700px;
      padding: 0 24px;
    }

    .contacts-page__title {
      margin: 20px 0;
      font-size: 48px;
      line-height: 64px;
    }

    .contacts-page__layout {
      flex-direction: column;
    }

    .contacts-page__channels {
      flex-direction: row;
      flex-wrap: wrap;
      gap: 20px;
      max-width: none;
    }

    .contacts-page__channels .contacts-page__card {
      width: calc(50% - 10px);
      min-height: 100px;
      border-radius: 24px;
    }

    .contacts-page__card {
      min-height: 96px;
      padding: 16px;
      border-radius: 24px;
    }

    .contacts-page__card--office {
      max-width: none;
    }

    .contacts-page__card-label {
      margin-bottom: 20px;
      font-size: 14px;
      line-height: 20px;
    }

    .contacts-page__link {
      gap: 8px;
      padding-left: 28px;
      font-family: 'Segoe UI', system-ui, sans-serif;
      font-size: 14px;
      font-weight: 600;
      line-height: 24px;
    }

    .contacts-page__link::before {
      top: calc(50% - 10px);
      width: 20px;
      height: 20px;
    }

    .contacts-page__copy svg {
      width: 12px;
      height: auto;
    }

    .contacts-page__coords {
      gap: 8px;
      margin: 16px 0 8px;
      font-size: 14px;
      line-height: 24px;
    }

    .contacts-page__metro {
      font-size: 14px;
      line-height: 24px;
    }

    .contacts-page__map {
      min-height: 237px;
      border-radius: 24px;
    }

    .contacts-page__map :deep(iframe) {
      height: 237px !important;
    }
  }

  @media (max-width: 767px) {
    .contacts-page {
      padding-top: 32px;
      border-radius: 24px 24px 0 0;
    }

    .contacts-page__inner {
      max-width: 470px;
      padding: 0 15px;
    }

    .contacts-page__breadcrumbs {
      font-size: 12px;
      font-weight: 400;
    }

    .contacts-page__title {
      margin: 32px 0;
      font-size: 24px;
      line-height: 28px;
    }

    .contacts-page__layout {
      gap: 10px;
    }

    .contacts-page__channels {
      flex-direction: column;
      gap: 10px;
    }

    .contacts-page__channels .contacts-page__card {
      width: 100%;
    }

    .contacts-page__metro-row {
      flex-direction: column;
      gap: 0;
    }

    .contacts-page__coords {
      flex-wrap: wrap;
    }

    .contacts-page__coords strong {
      display: block;
    }

    .contacts-page__map {
      margin-top: 20px;
    }

    .contacts-page__copy-tip {
      font-size: 14px;
      line-height: 24px;
    }
  }
</style>
