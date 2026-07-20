<template>
  <h1
    v-if="titleTag === 'h1'"
    :class="titleClasses"
    :aria-label="ariaLabel"
  >
    <span class="top-mining-brand-title__inner">
      <img
        class="top-mining-brand-title__logo"
        :src="logoMark"
        alt=""
      />
      {{ titleText }}
    </span>
  </h1>
  <h2
    v-else-if="titleTag === 'h2'"
    :class="titleClasses"
    :aria-label="ariaLabel"
  >
    <span class="top-mining-brand-title__inner">
      <img
        class="top-mining-brand-title__logo"
        :src="logoMark"
        alt=""
      />
      {{ titleText }}
    </span>
  </h2>
  <h3
    v-else-if="titleTag === 'h3'"
    :class="titleClasses"
    :aria-label="ariaLabel"
  >
    <span class="top-mining-brand-title__inner">
      <img
        class="top-mining-brand-title__logo"
        :src="logoMark"
        alt=""
      />
      {{ titleText }}
    </span>
  </h3>
  <span
    v-else
    :class="titleClasses"
    :aria-label="ariaLabel"
  >
    <span class="top-mining-brand-title__inner">
      <img
        class="top-mining-brand-title__logo"
        :src="logoMark"
        alt=""
      />
      {{ titleText }}
    </span>
  </span>
</template>
<script setup lang="ts">
  import logoMark from '~/assets/images/top-mining/logo-mark.png'

  type TopMiningBrandTitleVariant = 'hero' | 'menu' | 'footer'

  /**
   * Логотип-заголовок бренда «ТОП-МАЙНИНГ» с вариантами для hero, меню и футера.
   *
   * @param {String} variant - вариант оформления: hero, menu или footer
   * @param {String} [tag] - HTML-тег заголовка; по умолчанию зависит от variant
   * @param {Boolean} [spaced = false] - пробелы в тексте: «ТОП - МАЙНИНГ» вместо «ТОП-МАЙНИНГ»
   * @param {String} [ariaLabel = 'топ-майнинг'] - ARIA-метка для скринридеров
   */
  const props = withDefaults(
    defineProps<{
      variant: TopMiningBrandTitleVariant
      tag?: 'h1' | 'h2' | 'h3' | 'span'
      spaced?: boolean
      ariaLabel?: string
    }>(),
    {
      spaced: false,
      ariaLabel: 'топ-майнинг',
    },
  )

  const defaultTags: Record<TopMiningBrandTitleVariant, 'h1' | 'h2' | 'span'> = {
    hero: 'h1',
    menu: 'h2',
    footer: 'span',
  }

  const titleTag = computed(() => props.tag ?? defaultTags[props.variant])

  const titleClasses = computed(() => [
    'top-mining-brand-title',
    `top-mining-brand-title--${props.variant}`,
  ])

  const titleText = computed(() =>    props.spaced ? 'ТОП - МАЙНИНГ' : 'ТОП-МАЙНИНГ',
  )
</script>

<style scoped>
  .top-mining-brand-title {
    margin: 0;
    color: var(--tm-black);
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-weight: 600;
    text-transform: uppercase;
  }

  .top-mining-brand-title__inner {
    position: relative;
    display: inline-block;
    max-width: 100%;
    white-space: nowrap;
  }

  .top-mining-brand-title__logo {
    position: absolute;
    left: var(--tm-brand-logo-left, 1.06em);
    top: var(--tm-brand-logo-top, 0.3em);
    width: var(--tm-brand-logo-size, 0.25em);
    height: var(--tm-brand-logo-size, 0.25em);
    object-fit: contain;
    z-index: 2;
    pointer-events: none;
  }

  .top-mining-brand-title--hero {
    --tm-brand-logo-left: 1.06em;
    --tm-brand-logo-top: 0.3em;
    --tm-brand-logo-size: 0.25em;

    position: relative;
    z-index: 1;
    width: 100vw;
    margin: 12px 0 -16px;
    margin-left: calc(50% - 50vw);
    padding: 0;
    overflow: hidden;
    font-size: clamp(58px, 10.2vw, 200px);
    line-height: 0.82;
    letter-spacing: -0.03em;
    text-align: center;
  }

  .top-mining-brand-title--menu {
    --tm-brand-logo-left: 1.02em;
    --tm-brand-logo-top: 0.37em;
    --tm-brand-logo-size: 0.22em;

    width: 100%;
    font-size: clamp(26px, 7vw, 32px);
    line-height: 1;
    letter-spacing: -0.03em;
    text-align: center;
  }

  .top-mining-brand-title--footer {
    --tm-brand-logo-left: 1.04em;
    --tm-brand-logo-top: 0.24em;
    --tm-brand-logo-size: 0.28em;

    display: inline;
    font: inherit;
    letter-spacing: inherit;
    line-height: inherit;
    text-align: inherit;
  }

  @media (max-width: 1200px) {
    .top-mining-brand-title--hero {
      --tm-brand-logo-left: 1.1em;
      --tm-brand-logo-top: 0.31em;

      font-size: clamp(58px, 10.4vw, 112px);
    }
  }

  @media (max-width: 900px) {
    .top-mining-brand-title--hero {
      --tm-brand-logo-left: 1.1em;
      --tm-brand-logo-top: 0.3em;

      margin: 18px 0 -9px;
      margin-left: calc(50% - 50vw);
      font-size: clamp(54px, 10.5vw, 108px);
    }
  }

  @media (max-width: 560px) {
    .top-mining-brand-title--hero {
      --tm-brand-logo-left: 1.17em;
      --tm-brand-logo-top: 0.34em;

      width: 100%;
      margin: -5px;
      margin-left: 0;
      padding-top: 8px;
      font-size: clamp(28px, 9.2vw, 36px);
      line-height: 0.9;
      letter-spacing: 0.05em;
    }

    .top-mining-brand-title--menu {
      font-size: clamp(24px, 11.5vw, 37px);
    }

    .top-mining-brand-title--footer {
      --tm-brand-logo-left: 1.03em;
      --tm-brand-logo-top: 0.32em;
      --tm-brand-logo-size: 0.26em;
    }
  }

  @media (max-width: 900px) {
    .top-mining-brand-title--footer {
      --tm-brand-logo-left: 1.04em;
      --tm-brand-logo-top: 0.24em;
      --tm-brand-logo-size: 0.28em;
    }
  }

  @media (max-height: 740px) {
    .top-mining-brand-title--menu {
      font-size: 22px;
    }
  }
</style>
