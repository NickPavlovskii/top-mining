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
            <div class="contacts-page__card-row">
              <a
                class="contacts-page__card-main"
                :href="item.href"
                :target="item.external ? '_blank' : undefined"
                :rel="item.external ? 'noopener noreferrer' : undefined"
              >
                <icon
                  :name="item.icon"
                  class="contacts-page__card-icon"
                  aria-hidden="true"
                />
                <span>{{ item.value }}</span>
              </a>
              <button
                type="button"
                class="contacts-page__copy"
                :aria-label="`Копировать ${item.label.replace(':', '')}`"
                @click="copyValue(item.copyValue, item.key)"
              >
                <icon
                  :name="copiedKey === item.key ? 'mdi:check' : 'mdi:content-copy'"
                  aria-hidden="true"
                />
              </button>
            </div>
          </article>
        </div>

        <article class="contacts-page__card contacts-page__card--office">
          <p class="contacts-page__card-label">
            {{ page.address.label }}
          </p>
          <div class="contacts-page__card-row">
            <div class="contacts-page__card-main contacts-page__card-main--static">
              <icon
                :name="page.address.icon"
                class="contacts-page__card-icon"
                aria-hidden="true"
              />
              <span>{{ page.address.value }}</span>
            </div>
            <button
              type="button"
              class="contacts-page__copy"
              aria-label="Копировать адрес офиса"
              @click="copyValue(page.address.copyValue, 'address')"
            >
              <icon
                :name="copiedKey === 'address' ? 'mdi:check' : 'mdi:content-copy'"
                aria-hidden="true"
              />
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
              aria-label="Копировать координаты"
              @click="copyValue(page.coordinates.copyValue, 'coords')"
            >
              <icon
                :name="copiedKey === 'coords' ? 'mdi:check' : 'mdi:content-copy'"
                aria-hidden="true"
              />
            </button>
          </div>

          <ul class="contacts-page__metro">
            <li
              v-for="station in page.metro"
              :key="station"
            >
              <span
                class="contacts-page__metro-badge"
                aria-hidden="true"
              >M</span>
              <span>{{ station }}</span>
            </li>
          </ul>

          <div class="contacts-page__map">
            <iframe
              class="contacts-page__map-frame"
              :src="page.map.embedSrc"
              title="Карта офиса TOP MINING"
              loading="lazy"
              allowfullscreen
            />
            <a
              class="contacts-page__map-open"
              :href="page.map.openHref"
              target="_blank"
              rel="noopener noreferrer"
            >
              {{ page.map.openLabel }}
            </a>
          </div>
        </article>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
  import { CONTACTS_PAGE } from '~/common/modules/top-mining/pages/contacts'

  const { t } = useT()
  const page = CONTACTS_PAGE
  const copiedKey = ref<string | null>(null)
  let copiedTimer: ReturnType<typeof setTimeout> | null = null

  const channels = [
    {
      key: 'phone',
      ...page.phone,
      external: false,
    },
    {
      key: 'telegram',
      ...page.telegram,
      external: true,
    },
    {
      key: 'whatsapp',
      ...page.whatsapp,
      external: true,
    },
    {
      key: 'email',
      ...page.email,
      external: false,
    },
  ] as const

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
      // ignore clipboard errors (permissions / insecure context)
    }
  }

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
    color: var(--tm-white);
    font-family:
      'Segoe UI',
      system-ui,
      -apple-system,
      sans-serif;
  }

  .contacts-page__inner {
    max-width: 1280px;
    margin: 0 auto;
    padding: 28px 46px 96px;
  }

  .contacts-page__breadcrumbs {
    display: flex;
    flex-wrap: wrap;
    align-items: center;
    gap: 8px;
    margin-bottom: 28px;
    color: rgba(255, 255, 255, 0.55);
    font-size: 14px;
    line-height: 1.2;
  }

  .contacts-page__breadcrumbs-link {
    color: inherit;
    text-decoration: none;
  }

  .contacts-page__breadcrumbs-link:hover,
  .contacts-page__breadcrumbs-link:focus-visible {
    color: var(--tm-orange);
  }

  .contacts-page__breadcrumbs-current {
    color: rgba(255, 255, 255, 0.78);
  }

  .contacts-page__title {
    margin: 0 0 40px;
    color: var(--tm-white);
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(40px, 6vw, 72px);
    font-weight: 600;
    line-height: 1;
    letter-spacing: -0.03em;
    text-transform: uppercase;
  }

  .contacts-page__layout {
    display: grid;
    grid-template-columns: minmax(0, 0.92fr) minmax(0, 1.08fr);
    gap: 20px;
    align-items: start;
  }

  .contacts-page__channels {
    display: grid;
    gap: 16px;
  }

  .contacts-page__card {
    padding: 22px 24px;
    border-radius: 22px;
    background: #1b1b1b;
  }

  .contacts-page__card--office {
    display: grid;
    gap: 18px;
    padding: 26px 26px 22px;
  }

  .contacts-page__card-label {
    margin: 0 0 14px;
    color: rgba(255, 255, 255, 0.55);
    font-size: 15px;
    font-weight: 500;
    line-height: 1.2;
  }

  .contacts-page__card--office .contacts-page__card-label {
    margin-bottom: 0;
  }

  .contacts-page__card-row {
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 12px;
  }

  .contacts-page__card-main {
    display: inline-flex;
    align-items: center;
    gap: 12px;
    min-width: 0;
    color: var(--tm-white);
    font-size: clamp(22px, 2.4vw, 32px);
    font-weight: 700;
    line-height: 1.15;
    text-decoration: none;
  }

  .contacts-page__card-main--static {
    cursor: default;
  }

  .contacts-page__card-main:hover,
  .contacts-page__card-main:focus-visible {
    color: var(--tm-orange);
  }

  .contacts-page__card-main--static:hover,
  .contacts-page__card-main--static:focus-visible {
    color: var(--tm-white);
  }

  .contacts-page__card-main span {
    overflow-wrap: anywhere;
  }

  .contacts-page__card-icon {
    flex: 0 0 auto;
    width: 28px;
    height: 28px;
    color: var(--tm-orange);
  }

  .contacts-page__copy {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    flex: 0 0 auto;
    width: 36px;
    height: 36px;
    margin: 0;
    padding: 0;
    border: 0;
    border-radius: 10px;
    background: transparent;
    color: rgba(255, 255, 255, 0.55);
    cursor: pointer;
    transition:
      color 0.2s ease,
      background 0.2s ease;
  }

  .contacts-page__copy:hover,
  .contacts-page__copy:focus-visible {
    color: var(--tm-orange);
    background: rgba(255, 255, 255, 0.04);
  }

  .contacts-page__copy :deep(svg) {
    width: 18px;
    height: 18px;
  }

  .contacts-page__coords {
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 12px;
    color: rgba(255, 255, 255, 0.55);
    font-size: 14px;
    line-height: 1.35;
  }

  .contacts-page__coords strong {
    color: rgba(255, 255, 255, 0.78);
    font-weight: 600;
  }

  .contacts-page__metro {
    display: grid;
    grid-template-columns: repeat(2, minmax(0, 1fr));
    gap: 12px 24px;
    margin: 0;
    padding: 0;
    list-style: none;
  }

  .contacts-page__metro li {
    display: inline-flex;
    align-items: center;
    gap: 10px;
    color: var(--tm-white);
    font-size: 16px;
    font-weight: 600;
    line-height: 1.2;
  }

  .contacts-page__metro-badge {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    width: 22px;
    height: 22px;
    border-radius: 6px;
    background: #e31e24;
    color: var(--tm-white);
    font-size: 12px;
    font-weight: 800;
    line-height: 1;
  }

  .contacts-page__map {
    position: relative;
    overflow: hidden;
    border-radius: 18px;
    background: #101010;
  }

  .contacts-page__map-frame {
    display: block;
    width: 100%;
    height: 320px;
    border: 0;
  }

  .contacts-page__map-open {
    position: absolute;
    left: 12px;
    bottom: 12px;
    z-index: 1;
    padding: 8px 12px;
    border-radius: 10px;
    background: rgba(20, 20, 20, 0.88);
    color: var(--tm-white);
    font-size: 12px;
    font-weight: 600;
    line-height: 1;
    text-decoration: none;
  }

  .contacts-page__map-open:hover,
  .contacts-page__map-open:focus-visible {
    color: var(--tm-orange);
  }

  @media (max-width: 1100px) {
    .contacts-page__inner {
      padding-right: 32px;
      padding-left: 32px;
    }

    .contacts-page__layout {
      grid-template-columns: 1fr;
    }

    .contacts-page__card-main {
      font-size: 26px;
    }
  }

  @media (max-width: 700px) {
    .contacts-page__inner {
      padding: 20px 18px 72px;
    }

    .contacts-page__title {
      margin-bottom: 28px;
      font-size: 36px;
    }

    .contacts-page__card {
      padding: 18px 16px;
      border-radius: 18px;
    }

    .contacts-page__card-main {
      gap: 10px;
      font-size: 20px;
    }

    .contacts-page__card-icon {
      width: 22px;
      height: 22px;
    }

    .contacts-page__metro {
      grid-template-columns: 1fr;
    }

    .contacts-page__map-frame {
      height: 260px;
    }
  }
</style>
