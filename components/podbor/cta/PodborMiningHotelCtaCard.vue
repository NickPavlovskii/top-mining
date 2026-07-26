<template>
  <article
    :class="[
      'podbor-cta-card',
      { 'podbor-cta-card--with-image': Boolean(image) },
    ]"
  >
    <div class="podbor-cta-card__content">
      <h3 class="podbor-cta-card__title">
        <template
          v-for="(part, index) in titleParts"
          :key="`${index}-${part.text}`"
        >
          <span :class="{ 'podbor-cta-card__title-accent': part.accent }">
            {{ part.text }}
          </span>
        </template>
      </h3>

      <p
        v-if="description"
        class="podbor-cta-card__description"
      >
        {{ description }}
      </p>

      <top-mining-button
        v-if="buttonLabel"
        class="podbor-cta-card__button"
        preset="contact-pill"
        variant="primary"
        size="big"
        surface="dark"
        type="button"
        :title="buttonLabel"
        :append-icon="appendIcon"
        @click="$emit('action')"
      >
        <template
          v-if="buttonIcon === 'plus'"
          #append
        >
          <span
            class="podbor-cta-card__button-plus"
            aria-hidden="true"
          >+</span>
        </template>
      </top-mining-button>
    </div>

    <div
      v-if="image"
      class="podbor-cta-card__media"
    >
      <img
        class="podbor-cta-card__image"
        loading="lazy"
        decoding="async"
        :src="image"
        :alt="imageAlt"
      >
    </div>
  </article>
</template>

<script setup lang="ts">
  import arrowIcon from '~/assets/images/articles/arrow-up-right.png'
  import type { PodborCtaTitlePart } from '~/common/modules/top-mining/podbor-mining-hotel'
  import TopMiningButton from '~/components/global/buttons/TopMiningButton.vue'

  const props = defineProps<{
    titleParts: readonly PodborCtaTitlePart[]
    description?: string
    buttonLabel?: string
    buttonIcon?: 'arrow' | 'plus'
    image?: string
    imageAlt?: string
  }>()

  defineEmits<{
    action: []
  }>()

  const appendIcon = computed(() =>
    props.buttonIcon === 'arrow' ? arrowIcon : '',
  )
</script>

<style scoped>
  .podbor-cta-card {
    box-sizing: border-box;
    display: flex;
    flex-direction: column;
    gap: 24px;
    min-height: 100%;
    padding: 32px 28px;
    border: 1px solid var(--tm-orange);
    border-radius: 28px;
    background: #141414;
    color: var(--tm-white);
  }

  .podbor-cta-card--with-image {
    gap: 28px;
  }

  .podbor-cta-card__content {
    display: flex;
    flex-direction: column;
    align-items: flex-start;
    gap: 16px;
    min-width: 0;
    flex: 1;
  }

  .podbor-cta-card__title {
    margin: 0;
    color: var(--tm-off-white);
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(18px, 1.6vw, 24px);
    font-weight: 500;
    line-height: 1.25;
    text-transform: uppercase;
  }

  .podbor-cta-card__title-accent {
    color: var(--tm-orange);
  }

  .podbor-cta-card__description {
    margin: 0;
    color: rgba(255, 255, 255, 0.78);
    font-size: 15px;
    line-height: 1.45;
  }

  .podbor-cta-card__button {
    margin-top: auto;
    width: auto !important;
    max-width: max-content;
  }

  .podbor-cta-card__button-plus {
    font-size: 22px;
    line-height: 1;
    font-weight: 400;
  }

  .podbor-cta-card__media {
    flex-shrink: 0;
    width: 100%;
    max-width: 280px;
    margin: 0 auto;
  }

  .podbor-cta-card__image {
    display: block;
    width: 100%;
    height: auto;
    object-fit: contain;
  }

  @media (min-width: 900px) {
    .podbor-cta-card--with-image {
      flex-direction: row;
      align-items: center;
      gap: 20px;
      padding: 36px 32px;
    }

    .podbor-cta-card__media {
      width: min(42%, 260px);
      max-width: none;
      margin: 0;
    }
  }

  @media (max-width: 899px) {
    .podbor-cta-card {
      padding: 28px 22px;
      text-align: center;
    }

    .podbor-cta-card__content {
      align-items: center;
    }

    .podbor-cta-card__description {
      max-width: 28ch;
    }

    .podbor-cta-card__button.top-mining-button {
      width: auto !important;
      max-width: 100%;
      min-height: 44px;
      padding: 0 18px;
      font-size: 12px;
      box-shadow: 0 2px 10px
        color-mix(in srgb, var(--orange-accent-deep-color) 20%, transparent);
    }

    .podbor-cta-card__button :deep(.top-mining-button__inner) {
      justify-content: center;
      gap: 8px;
      width: auto;
    }

    .podbor-cta-card__button-plus {
      font-size: 18px;
    }
  }
</style>
