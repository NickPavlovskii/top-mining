<template>
  <NuxtLink
    :to="to"
    :class="['top-mining-more-link', `top-mining-more-link--${size}`]"
  >
    <span class="top-mining-more-link__label">{{ label }}</span>
    <img
      alt=""
      aria-hidden="true"
      class="top-mining-more-link__arrow"
      :src="arrowSrc"
    />
  </NuxtLink>
</template>

<script setup lang="ts">
  import type { RouteLocationRaw } from 'vue-router'
  import catalogArrowIcon from '~/assets/images/catalog/arrow-right.png'
  import articlesArrowIcon from '~/assets/images/articles/arrow-right-24.png'

  const props = withDefaults(
    defineProps<{
      to: RouteLocationRaw
      label: string
      size?: 'md' | 'lg'
    }>(),
    {
      size: 'md',
    },
  )

  const arrowSrc = computed(() =>
    props.size === 'lg' ? articlesArrowIcon : catalogArrowIcon,
  )
</script>

<style scoped>
  .top-mining-more-link {
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 10px;
    width: 100%;
    min-height: 64px;
    border-radius: 999px;
    background: #141414;
    color: var(--tm-white);
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(16px, 1.6vw, 20px);
    font-weight: 600;
    letter-spacing: 0.04em;
    text-decoration: none;
    text-transform: uppercase;
    transition:
      background-color 0.2s ease,
      transform 0.2s ease;
  }

  .top-mining-more-link__arrow {
    display: block;
    flex-shrink: 0;
    width: 12px;
    height: auto;
    object-fit: contain;
    filter: brightness(0) saturate(100%) invert(47%) sepia(98%) saturate(1450%)
      hue-rotate(1deg) brightness(101%) contrast(104%);
    transition:
      filter 0.2s ease,
      transform 0.2s ease;
  }

  .top-mining-more-link:hover,
  .top-mining-more-link:focus-visible {
    background: var(--tm-orange);
    transform: translateY(-1px);
  }

  .top-mining-more-link:hover .top-mining-more-link__arrow,
  .top-mining-more-link:focus-visible .top-mining-more-link__arrow {
    filter: brightness(0) invert(1);
    transform: translateX(3px);
  }

  @media (prefers-reduced-motion: reduce) {
    .top-mining-more-link:hover,
    .top-mining-more-link:focus-visible {
      transform: none;
    }

    .top-mining-more-link:hover .top-mining-more-link__arrow,
    .top-mining-more-link:focus-visible .top-mining-more-link__arrow {
      transform: none;
    }
  }

  .top-mining-more-link--lg {
    gap: 14px;
    min-height: 72px;
    font-size: clamp(14px, 1.4vw, 18px);
    font-weight: 500;
  }

  .top-mining-more-link--lg .top-mining-more-link__arrow {
    width: 28px;
    height: 28px;
  }
</style>
