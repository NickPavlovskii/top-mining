<template>
  <div
    :class="[
      'top-mining-locale-switcher',
      `top-mining-locale-switcher--${size}`,
    ]"
    role="group"
    :aria-label="ariaLabel"
  >
    <button
      v-for="option in options"
      :key="option.code"
      type="button"
      :class="[
        'top-mining-locale-switcher__btn',
        {
          'top-mining-locale-switcher__btn--active': locale === option.code,
        },
      ]"
      :aria-label="option.ariaLabel"
      :aria-pressed="locale === option.code"
      @click="setLocale(option.code)"
    >
      {{ option.label }}
    </button>
  </div>
</template>

<script setup lang="ts">
  withDefaults(
    defineProps<{
      size?: 'sm' | 'md'
    }>(),
    {
      size: 'md',
    },
  )

  const { locale, options, setLocale } = useTopMiningLocale()
  const { t } = useT()
  const ariaLabel = computed(() => t('common.language'))
</script>

<style scoped>
  .top-mining-locale-switcher {
    display: inline-flex;
    align-items: center;
    flex-shrink: 0;
    padding: 3px;
    border: 1px solid rgba(20, 20, 20, 0.12);
    border-radius: 999px;
    background: #f3f3f3;
  }

  .top-mining-locale-switcher__btn {
    min-width: 36px;
    height: 28px;
    padding: 0 10px;
    border: 0;
    border-radius: 999px;
    background: transparent;
    color: var(--tm-text-secondary, #666);
    font-family: 'Mulish', 'Segoe UI', system-ui, sans-serif;
    font-size: 12px;
    font-weight: 700;
    letter-spacing: 0.04em;
    line-height: 1;
    cursor: pointer;
    transition:
      background-color 0.18s ease,
      color 0.18s ease,
      box-shadow 0.18s ease;
  }

  .top-mining-locale-switcher--sm .top-mining-locale-switcher__btn {
    min-width: 32px;
    height: 26px;
    padding: 0 8px;
    font-size: 11px;
  }

  .top-mining-locale-switcher__btn--active {
    background: linear-gradient(
      94.62deg,
      var(--tm-orange-accent-light, #ec5100) 2.04%,
      var(--tm-orange-accent-deep, #ff741f) 49.92%
    );
    color: #fff;
    box-shadow: 0 4px 12px rgba(236, 81, 0, 0.28);
  }

  @media (hover: hover) {
    .top-mining-locale-switcher__btn:not(.top-mining-locale-switcher__btn--active):hover,
    .top-mining-locale-switcher__btn:not(.top-mining-locale-switcher__btn--active):focus-visible {
      color: var(--tm-orange-hover, #ec5100);
    }
  }
</style>
