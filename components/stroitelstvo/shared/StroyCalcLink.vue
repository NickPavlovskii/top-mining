<template>
  <a
    class="stroy-calc-link"
    :href="href"
    :target="target"
    :rel="rel"
    :aria-label="ariaLabel"
  >
    <img
      class="stroy-calc-link__image stroy-calc-link__image--desktop"
      alt=""
      aria-hidden="true"
      :src="calcLinkDesktop"
    >
    <img
      class="stroy-calc-link__image stroy-calc-link__image--mobile"
      alt=""
      aria-hidden="true"
      :src="calcLinkMobile"
    >
  </a>
</template>

<script setup lang="ts">
  import calcLinkDesktop from '~/assets/images/stroitelstvo-data-czentrov/calc-link-bg.svg'
  import calcLinkMobile from '~/assets/images/stroitelstvo-data-czentrov/calc-link-bg-m.svg'

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
  .stroy-calc-link {
    display: inline-flex;
    flex: 0 0 auto;
    align-items: center;
    justify-content: center;
    width: 112px;
    height: 48px;
    text-decoration: none;
  }

  .stroy-calc-link__image {
    display: block;
    width: 100%;
    height: 100%;
    object-fit: contain;
  }

  .stroy-calc-link__image--mobile {
    display: none;
  }

  @media (max-width: 767px) {
    .stroy-calc-link {
      width: 64px;
      height: 32px;
    }

    .stroy-calc-link__image--desktop {
      display: none;
    }

    .stroy-calc-link__image--mobile {
      display: block;
    }
  }
</style>
