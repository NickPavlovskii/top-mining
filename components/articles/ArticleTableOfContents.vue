<template>
  <nav
    class="article-toc"
    :aria-label="t('articles.tocAria')"
  >
    <div class="article-toc__heading">
      <span
        class="article-toc__icon"
        aria-hidden="true"
      >
        <span class="article-toc__icon-bar article-toc__icon-bar--sm" />
        <span class="article-toc__icon-bar article-toc__icon-bar--md" />
        <span class="article-toc__icon-bar article-toc__icon-bar--lg" />
      </span>
      <p class="article-toc__title article-toc__title--desktop">
        {{ t('articles.tocAria') }}
      </p>
      <p class="article-toc__title article-toc__title--mobile">
        {{ t('articles.toc') }}
      </p>
    </div>

    <ul class="article-toc__list">
      <li
        v-for="item in items"
        :key="item.id"
      >
        <a
          :ref="(el) => setLinkRef(item.id, el)"
          :class="[
            'article-toc__link',
            { 'article-toc__link--active': item.id === activeId },
          ]"
          :href="`#${item.id}`"
          @click.prevent="onNavigate(item.id)"
        >
          {{ item.title }}
        </a>
      </li>
    </ul>

    <div class="article-toc__share">
      <article-share-button
        :label="t('articles.shareShort')"
        size="small"
        block
        :share-title="shareTitle"
      />
    </div>
  </nav>
</template>

<script setup lang="ts">
  import type { ArticleTocItem } from '~/common/modules/articles'
  import ArticleShareButton from '~/components/articles/ArticleShareButton.vue'

  const { t } = useT()

  const props = defineProps<{
    items: ArticleTocItem[]
    activeId: string | null
    shareTitle?: string
  }>()

  const emit = defineEmits<{
    navigate: [id: string]
  }>()

  const linkRefs = new Map<string, HTMLElement>()

  function setLinkRef(id: string, el: unknown) {
    if (el && el instanceof HTMLElement) {
      linkRefs.set(id, el)
    } else {
      linkRefs.delete(id)
    }
  }

  function onNavigate(id: string) {
    emit('navigate', id)
  }

  function getScrollParent(node: HTMLElement | null): HTMLElement | null {
    let current = node?.parentElement ?? null
    while (current) {
      const { overflowY } = getComputedStyle(current)
      if (overflowY === 'auto' || overflowY === 'scroll') {
        return current
      }
      current = current.parentElement
    }
    return null
  }

  watch(
    () => props.activeId,
    (id) => {
      if (!id || !import.meta.client) {
        return
      }

      const link = linkRefs.get(id)
      if (!link) {
        return
      }

      const scroller = getScrollParent(link)
      if (scroller) {
        const scrollerRect = scroller.getBoundingClientRect()
        const linkRect = link.getBoundingClientRect()
        const pad = 12

        if (linkRect.top < scrollerRect.top + pad) {
          scroller.scrollBy({
            top: linkRect.top - scrollerRect.top - pad,
            behavior: 'smooth',
          })
        } else if (linkRect.bottom > scrollerRect.bottom - pad) {
          scroller.scrollBy({
            top: linkRect.bottom - scrollerRect.bottom + pad,
            behavior: 'smooth',
          })
        }
      } else {
        link.scrollIntoView({ block: 'nearest', behavior: 'smooth' })
      }
    },
  )
</script>

<style scoped>
  .article-toc {
    box-sizing: border-box;
    max-height: calc(100dvh - var(--article-sticky-top, 112px) - 16px);
    padding: 20px 14px 20px 18px;
    border-radius: 24px;
    background: #ececec;
    overflow-x: hidden;
    overflow-y: auto;
    overscroll-behavior: contain;
    -webkit-overflow-scrolling: touch;
    scrollbar-width: thin;
    scrollbar-color: var(--tm-orange) transparent;
  }

  .article-toc::-webkit-scrollbar {
    width: 8px;
  }

  .article-toc::-webkit-scrollbar-track {
    margin: 12px 0;
    background: transparent;
    border-radius: 999px;
  }

  .article-toc::-webkit-scrollbar-thumb {
    background-color: var(--tm-orange);
    border: 2px solid #ececec;
    border-radius: 999px;
    background-clip: padding-box;
  }

  .article-toc::-webkit-scrollbar-thumb:hover {
    background-color: var(--tm-orange-hover);
  }

  .article-toc__heading {
    margin-bottom: 16px;
  }

  .article-toc__icon {
    display: none;
  }

  .article-toc__title {
    margin: 0;
    color: #111;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 16px;
    font-weight: 500;
    line-height: 1.3;
  }

  .article-toc__title--mobile {
    display: none;
  }

  .article-toc__list {
    display: grid;
    gap: 10px;
    margin: 0;
    padding: 0;
    list-style: none;
  }

  .article-toc__link {
    display: block;
    color: #333;
    font-size: 14px;
    line-height: 1.35;
    text-decoration: none;
    transition: color 0.15s ease;
  }

  .article-toc__link:hover,
  .article-toc__link:focus-visible {
    color: var(--tm-orange);
  }

  .article-toc__link--active {
    color: var(--tm-orange);
    font-weight: 600;
  }

  .article-toc__share {
    margin-top: 20px;
  }

  @media (max-width: 1050px) {
    .article-toc {
      max-height: none;
      overflow: visible;
      padding: 22px 20px 24px;
      border-radius: 28px;
      background: #f0f0f0;
    }

    .article-toc__heading {
      display: flex;
      flex-direction: column;
      align-items: center;
      gap: 10px;
      margin-bottom: 20px;
    }

    .article-toc__icon {
      display: inline-flex;
      align-items: flex-end;
      justify-content: center;
      gap: 3px;
      height: 22px;
    }

    .article-toc__icon-bar {
      display: block;
      width: 5px;
      border-radius: 2px;
      background: var(--tm-orange);
    }

    .article-toc__icon-bar--sm {
      height: 10px;
    }

    .article-toc__icon-bar--md {
      height: 15px;
    }

    .article-toc__icon-bar--lg {
      height: 22px;
    }

    .article-toc__title--desktop {
      display: none;
    }

    .article-toc__title--mobile {
      display: block;
      font-size: 20px;
      font-weight: 600;
      text-align: center;
    }

    .article-toc__list {
      gap: 14px;
    }

    .article-toc__link {
      font-size: 15px;
      line-height: 1.4;
    }

    .article-toc__share {
      display: none;
    }
  }
</style>
