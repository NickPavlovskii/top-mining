<template>
  <a
    class="data-center-calc-link"
    :href="href"
    :target="target"
    :rel="rel"
    :aria-label="ariaLabel"
  >
    <img
      class="data-center-calc-link__image data-center-calc-link__image--desktop"
      alt=""
      aria-hidden="true"
      :src="calcLinkDesktop"
    >
    <img
      class="data-center-calc-link__image data-center-calc-link__image--mobile"
      alt=""
      aria-hidden="true"
      :src="calcLinkMobile"
    >
  </a>
</template>

<script setup lang="ts">
  import calcLinkDesktop from '~/assets/images/data-center-construction/calc-link-bg.svg'
  import calcLinkMobile from '~/assets/images/data-center-construction/calc-link-bg-m.svg'

  withDefaults(
    defineProps<{
      href: string
      ariaLabel?: string
      target?: string
    }>(),
    {
      ariaLabel: 'Открыть калькулятор',
      target: '_blank',
    },
  )

  const rel = 'noopener noreferrer'
</script>

<style scoped>
  .data-center-calc-link {
    display: inline-flex;
    flex: 0 0 auto;
    align-items: center;
    justify-content: center;
    width: 112px;
    height: 48px;
    text-decoration: none;
  }

  .data-center-calc-link__image {
    display: block;
    width: 100%;
    height: 100%;
    object-fit: contain;
  }

  .data-center-calc-link__image--mobile {
    display: none;
  }

  @media (max-width: 767px) {
    .data-center-calc-link {
      width: 64px;
      height: 32px;
    }

    .data-center-calc-link__image--desktop {
      display: none;
    }

    .data-center-calc-link__image--mobile {
      display: block;
    }
  }
</style>
