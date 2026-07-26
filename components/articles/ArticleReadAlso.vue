<template>
  <aside
    class="article-read-also"
    aria-label="Читайте также"
  >
    <p class="article-read-also__title">
      Читайте также
    </p>
    <ul class="article-read-also__list">
      <li
        v-for="item in items"
        :key="item.href"
      >
        <nuxt-link
          class="article-read-also__link"
          :to="item.href"
        >
          <span>{{ item.label }}</span>
          <img
            :src="arrowIcon"
            alt=""
            class="article-read-also__icon"
            aria-hidden="true"
          >
        </nuxt-link>
      </li>
    </ul>
  </aside>
</template>

<script setup lang="ts">
  import arrowIcon from '~/assets/images/articles/arrow-up-right.png'

  const items = [
    { label: 'Майнинг', href: '/articles/?topic=mining' },
    { label: 'Инвестиции', href: '/articles/?topic=investments' },
    { label: 'Инструменты и сервисы', href: '/articles/?topic=tools' },
    { label: 'Новичкам', href: '/articles/?topic=beginners' },
  ]
</script>

<style scoped>
  .article-read-also {
    box-sizing: border-box;
    max-height: calc(100dvh - var(--article-sticky-top, 112px) - 16px);
    padding: 20px 14px 20px 16px;
    border-radius: 24px;
    background: #f0f0f0;
    overflow-x: hidden;
    overflow-y: auto;
    overscroll-behavior: contain;
    -webkit-overflow-scrolling: touch;
    scrollbar-width: thin;
    scrollbar-color: var(--tm-orange) transparent;
  }

  .article-read-also::-webkit-scrollbar {
    width: 8px;
  }

  .article-read-also::-webkit-scrollbar-track {
    margin: 12px 0;
    background: transparent;
    border-radius: 999px;
  }

  .article-read-also::-webkit-scrollbar-thumb {
    background-color: var(--tm-orange);
    border: 2px solid #f0f0f0;
    border-radius: 999px;
    background-clip: padding-box;
  }

  .article-read-also::-webkit-scrollbar-thumb:hover {
    background-color: var(--tm-orange-hover);
  }

  .article-read-also__title {
    margin: 0 0 16px;
    color: #111;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 16px;
    font-weight: 500;
    line-height: 1.3;
  }

  .article-read-also__list {
    display: grid;
    gap: 10px;
    margin: 0;
    padding: 0;
    list-style: none;
  }

  .article-read-also__link {
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 12px;
    min-height: 48px;
    padding: 12px 14px;
    border-radius: 14px;
    background: #fff;
    color: #111;
    font-size: 14px;
    line-height: 1.3;
    text-decoration: none;
    transition:
      color 0.15s ease,
      box-shadow 0.15s ease;
  }

  .article-read-also__link:hover,
  .article-read-also__link:focus-visible {
    color: var(--tm-orange);
    box-shadow: 0 0 0 1px rgba(255, 100, 24, 0.25);
  }

  .article-read-also__icon {
    flex-shrink: 0;
    width: 16px;
    height: 16px;
    object-fit: contain;
    filter: brightness(0);
    opacity: 0.75;
  }

  .article-read-also__link:hover .article-read-also__icon,
  .article-read-also__link:focus-visible .article-read-also__icon {
    opacity: 1;
    /* Approximate brand orange */
    filter: brightness(0) saturate(100%) invert(48%) sepia(93%) saturate(2477%)
      hue-rotate(360deg) brightness(102%) contrast(104%);
  }

  @media (max-width: 1050px) {
    .article-read-also {
      max-height: none;
      overflow: visible;
    }
  }
</style>
