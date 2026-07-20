<template>
  <div
    v-if="variant === 'mining-hotels'"
    class="catalog-mid-block-wrap"
    :style="miningHotelsStyle"
  >
    <div class="left-mid-block">
      <div class="title">
        {{ config.title }}
      </div>

      <top-mining-button
        class="btn-link btn-link--dark"
        target="_blank"
        variant="primary"
        size="small"
        surface="dark"
        bg-color="#141414"
        border-color="#141414"
        color="var(--white-color)"
        title="ПЕРЕЙТИ"
        :href="config.href"
      >
        <template #append>
          <Icon
            name="mdi:arrow-top-right"
            class="btn-link__arrow"
            aria-hidden="true"
          />
        </template>
      </top-mining-button>
    </div>

    <div class="right-mid-block">
      <p class="sub-title">
        {{ config.subtitle }}
        <span>{{ config.subtitleAccent }}</span>
      </p>

      <div class="ok-wrap-block">
        <div
          v-for="(benefit, index) in config.benefits"
          class="ok-wrap-block-item"
          :key="index"
        >
          <span
            class="ok-wrap-block-item__icon"
            aria-hidden="true"
          >
            <Icon name="mdi:check" />
          </span>
          <span class="ok-wrap-block-item__text">{{ benefit }}</span>
        </div>
      </div>
    </div>
  </div>

  <div
    v-else
    class="catalog-mid-block-wrap catalog-mid-block-wrap-a"
    :style="asicSalesStyle"
  >
    <div class="title">
      {{ config.title }}
    </div>

    <div class="sub-title">
      {{ config.subtitle }}
      <span>{{ config.subtitleAccent }}</span>
    </div>

    <div class="actions-row">
      <div class="ok-wrap-block">
        <div
          v-for="(benefit, index) in config.benefits"
          :key="index"
          class="ok-wrap-block-item"
        >
          <span
            class="ok-wrap-block-item__icon"
            aria-hidden="true"
          >
            <Icon name="mdi:check" />
          </span>
          <span class="ok-wrap-block-item__text">{{ benefit }}</span>
        </div>
      </div>

      <top-mining-button
        class="btn-link btn-link--orange"
        target="_blank"
        variant="primary"
        size="small"
        surface="dark"
        title="ПЕРЕЙТИ"
        :href="config.href"
      >
        <template #append>
          <Icon
            name="mdi:arrow-top-right"
            class="btn-link__arrow"
            aria-hidden="true"
          />
        </template>
      </top-mining-button>
    </div>
  </div>
</template>

<script setup lang="ts">
  import {
    CATALOG_MID_BLOCK_BANNER_CONFIG,
    type CatalogMidBlockBannerVariant,
  } from '~/common/modules/catalog/mid-block-banner'
  import asicVisualImage from '~/assets/images/catalog/catalog-mid-block-asic-visual.png'
  import containerImage from '~/assets/images/catalog/catalog-mid-block-container.png'
  import bannerBackground from '~/assets/images/catalog/catalog-mid-block-wrap-bg.png'

  const props = withDefaults(
    defineProps<{
      variant?: CatalogMidBlockBannerVariant
    }>(),
    {
      variant: 'mining-hotels',
    },
  )

  const config = computed(() => CATALOG_MID_BLOCK_BANNER_CONFIG[props.variant])

  const miningHotelsStyle = computed(() => ({
    '--catalog-mid-block-bg': `url(${bannerBackground})`,
    '--catalog-mid-block-visual': `url(${containerImage})`,
  }))

  const asicSalesStyle = computed(() => ({
    '--catalog-mid-block-bg': `url(${bannerBackground})`,
    '--catalog-mid-block-visual': `url(${asicVisualImage})`,
  }))
</script>

<style scoped>
  .catalog-mid-block-wrap {
    position: relative;
    width: 100%;
    padding: 40px;
    border-radius: 24px;
    overflow: hidden;
    color: #fff;
    background: var(--catalog-mid-block-bg) center / cover no-repeat;
    backdrop-filter: blur(20px);
    -webkit-backdrop-filter: blur(20px);
    box-sizing: border-box;
  }

  .title {
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 36px;
    font-weight: 600;
    line-height: 1.08;
    letter-spacing: -0.02em;
    text-transform: uppercase;
  }

  .sub-title {
    margin: 0;
    font-size: 24px;
    font-weight: 500;
    line-height: 1.35;
    letter-spacing: -0.02em;
  }

  .sub-title span {
    color: var(--tm-orange);
    font-weight: 600;
  }

  .ok-wrap-block {
    display: flex;
    flex-direction: row;
    align-items: stretch;
    flex-wrap: wrap;
    gap: 12px;
    width: 100%;
  }

  .ok-wrap-block-item {
    display: flex;
    flex: 1 1 180px;
    align-items: flex-start;
    gap: 12px;
    min-height: 0;
    height: auto;
    padding: 18px 16px;
    border-radius: 12px;
    background: rgba(31, 31, 31, 0.78);
    backdrop-filter: blur(12px);
    -webkit-backdrop-filter: blur(12px);
    box-sizing: border-box;
    overflow: visible;
  }

  .ok-wrap-block-item__icon {
    display: inline-flex;
    flex-shrink: 0;
    align-items: center;
    justify-content: center;
    width: 26px;
    height: 26px;
    border-radius: 6px;
    background: var(--tm-orange);
    color: #fff;
  }

  .ok-wrap-block-item__icon :deep(svg) {
    width: 14px;
    height: 14px;
  }

  .ok-wrap-block-item__text {
    flex: 1 1 auto;
    min-width: 0;
    font-size: 14px;
    font-weight: 500;
    line-height: 1.35;
    white-space: pre-line;
  }

  .btn-link {
    width: 198px !important;
    min-width: 198px !important;
    max-width: 198px !important;
    height: 56px !important;
    min-height: 56px !important;
    padding: 0 22px !important;
    border: 0 !important;
    border-radius: 28px !important;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif !important;
    font-size: 12px !important;
    font-weight: 600 !important;
    letter-spacing: 0.04em !important;
    text-transform: uppercase !important;
    box-shadow: none !important;
  }

  .btn-link :deep(.top-mining-button__inner) {
    gap: 10px;
  }

  .btn-link__arrow {
    flex-shrink: 0;
    width: 14px;
    height: 14px;
  }

  .btn-link--orange {
    --tm-btn-bg: var(--tm-orange);
    --tm-btn-border: var(--tm-orange);
    background-color: var(--tm-orange) !important;
    border-color: var(--tm-orange) !important;
    color: var(--white-color) !important;
  }

  @media (hover: hover) {
    .btn-link--dark:hover:not(.top-mining-button--disabled),
    .btn-link--dark:focus-visible:not(.top-mining-button--disabled) {
      --tm-btn-bg: var(--tm-orange) !important;
      --tm-btn-border: var(--tm-orange) !important;
      background-color: var(--tm-orange) !important;
      border-color: var(--tm-orange) !important;
      color: var(--white-color) !important;
    }

    .btn-link--orange:hover:not(.top-mining-button--disabled),
    .btn-link--orange:focus-visible:not(.top-mining-button--disabled) {
      --tm-btn-bg: var(--tm-orange-dark) !important;
      --tm-btn-border: var(--tm-orange-dark) !important;
      background-color: var(--tm-orange-dark) !important;
      border-color: var(--tm-orange-dark) !important;
      color: var(--white-color) !important;
    }

    .btn-link:hover:not(.top-mining-button--disabled) :deep(.top-mining-button__inner),
    .btn-link:hover:not(.top-mining-button--disabled) :deep(.top-mining-button__label),
    .btn-link:focus-visible:not(.top-mining-button--disabled) :deep(.top-mining-button__inner),
    .btn-link:focus-visible:not(.top-mining-button--disabled) :deep(.top-mining-button__label) {
      color: var(--white-color) !important;
    }
  }

  /* Mining hotels */
  .catalog-mid-block-wrap:not(.catalog-mid-block-wrap-a) {
    display: flex;
    align-items: flex-start;
    justify-content: space-between;
    gap: 40px;
    min-height: 288px;
  }

  .catalog-mid-block-wrap:not(.catalog-mid-block-wrap-a)::before {
    content: '';
    position: absolute;
    bottom: 0;
    left: 54px;
    width: 480px;
    height: 208px;
    background: var(--catalog-mid-block-visual) left bottom / contain no-repeat;
    pointer-events: none;
    z-index: 0;
  }

  .left-mid-block,
  .right-mid-block {
    position: relative;
    z-index: 1;
    min-width: 0;
  }

  .left-mid-block {
    display: flex;
    flex: 1 1 280px;
    max-width: 400px;
    flex-direction: column;
    justify-content: space-between;
    gap: 24px;
    min-height: 180px;
  }

  .catalog-mid-block-wrap:not(.catalog-mid-block-wrap-a) .title {
    max-width: 320px;
  }

  .catalog-mid-block-wrap:not(.catalog-mid-block-wrap-a) .btn-link {
    align-self: flex-start;
    margin-top: auto;
  }

  .right-mid-block {
    display: flex;
    flex: 1 1 auto;
    flex-direction: column;
    justify-content: flex-start;
    gap: 28px;
    padding-top: 2px;
    min-width: 0;
  }

  .right-mid-block .sub-title {
    max-width: 720px;
  }

  /* ASIC sales */
  .catalog-mid-block-wrap-a {
    display: flex;
    flex-direction: column;
    align-items: flex-start;
    gap: 20px;
    min-height: 284px;
    padding-right: 40px;
  }

  .catalog-mid-block-wrap-a::before {
    content: '';
    position: absolute;
    top: 0;
    right: 0;
    bottom: auto;
    left: auto;
    width: 375px;
    height: 284px;
    background: var(--catalog-mid-block-visual) right center / contain no-repeat;
    pointer-events: none;
    z-index: 0;
  }

  .catalog-mid-block-wrap-a > :not(.actions-row) {
    position: relative;
    z-index: 1;
    max-width: calc(100% - 40px);
  }

  .catalog-mid-block-wrap-a .title {
    max-width: 640px;
  }

  .catalog-mid-block-wrap-a .sub-title {
    max-width: 720px;
  }

  .catalog-mid-block-wrap-a .actions-row {
    display: flex;
    flex-direction: row;
    align-items: flex-end;
    justify-content: space-between;
    gap: 12px;
    width: 100%;
    position: relative;
    z-index: 1;
    margin-top: auto;
  }

  .catalog-mid-block-wrap-a .ok-wrap-block {
    flex: 1 1 auto;
    min-width: 0;
    max-width: calc(100% - 210px);
  }

  .catalog-mid-block-wrap-a .ok-wrap-block .ok-wrap-block-item {
    flex: 1 1 auto;
    width: 100%;
    min-height: auto;
    height: auto;
  }

  .catalog-mid-block-wrap-a .ok-wrap-block .ok-wrap-block-item:last-child {
    flex: 0 1 247px;
    max-width: 247px;
    width: 100%;
  }

  .catalog-mid-block-wrap-a .btn-link {
    flex: 0 0 198px;
    align-self: flex-end;
    margin-top: 0;
    margin-left: auto;
  }

  @container catalog-mid-block (max-width: 1080px) {
    .catalog-mid-block-wrap:not(.catalog-mid-block-wrap-a) {
      min-height: 0;
      align-items: stretch;
    }

    .catalog-mid-block-wrap:not(.catalog-mid-block-wrap-a) .ok-wrap-block {
      flex-direction: column;
      flex-wrap: nowrap;
    }

    .catalog-mid-block-wrap:not(.catalog-mid-block-wrap-a) .ok-wrap-block-item {
      flex: 0 0 auto;
      width: 100%;
      min-height: auto;
      height: auto;
    }

    .left-mid-block {
      justify-content: flex-start;
      min-height: 0;
    }

    .right-mid-block {
      justify-content: flex-start;
      gap: 20px;
    }

    .catalog-mid-block-wrap-a .ok-wrap-block {
      flex-direction: column;
      flex-wrap: nowrap;
      max-width: 100%;
    }

    .catalog-mid-block-wrap-a .ok-wrap-block .ok-wrap-block-item,
    .catalog-mid-block-wrap-a .ok-wrap-block .ok-wrap-block-item:last-child {
      flex: 0 0 auto;
      width: 100%;
      max-width: none;
      min-height: auto;
      height: auto;
    }

    .catalog-mid-block-wrap-a .actions-row {
      flex-direction: column;
      align-items: stretch;
    }

    .catalog-mid-block-wrap-a .btn-link {
      flex-basis: auto;
      align-self: stretch;
      width: 100% !important;
      min-width: 0 !important;
      max-width: 100% !important;
    }
  }

  @container catalog-mid-block (max-width: 920px) {
    .catalog-mid-block-wrap:not(.catalog-mid-block-wrap-a) {
      flex-direction: column;
      gap: 24px;
      min-height: 0;
      padding-bottom: 180px;
    }

    .catalog-mid-block-wrap:not(.catalog-mid-block-wrap-a)::before {
      left: 24px;
      width: min(360px, calc(100% - 48px));
      height: 160px;
    }

    .left-mid-block {
      flex: 0 0 auto;
      max-width: none;
      min-height: 0;
      padding-bottom: 0;
    }

    .catalog-mid-block-wrap:not(.catalog-mid-block-wrap-a) .btn-link {
      margin-top: 0;
    }

    .right-mid-block {
      gap: 20px;
    }

    .catalog-mid-block-wrap-a {
      min-height: 0;
      padding-right: 32px;
      padding-bottom: 200px;
    }

    .catalog-mid-block-wrap-a::before {
      top: auto;
      right: auto;
      bottom: 0;
      left: 50%;
      width: min(320px, calc(100% - 48px));
      height: 180px;
      transform: translateX(-50%);
    }

    .catalog-mid-block-wrap-a > :not(.actions-row) {
      max-width: 100%;
    }
  }

  @media (max-width: 1200px) {
    .catalog-mid-block-wrap {
      padding: 32px;
    }

    .catalog-mid-block-wrap:not(.catalog-mid-block-wrap-a)::before {
      left: 32px;
      width: min(480px, 55%);
      height: 160px;
    }

    .catalog-mid-block-wrap-a {
      padding-right: 32px;
    }

    .catalog-mid-block-wrap-a .ok-wrap-block {
      max-width: calc(100% - 200px);
    }

    .catalog-mid-block-wrap-a::before {
      width: min(375px, 42%);
      height: min(240px, 70%);
    }

    .left-mid-block {
      max-width: 360px;
    }

    .title {
      font-size: 28px;
    }

    .sub-title {
      font-size: 20px;
    }
  }

  @media (max-width: 980px) {
    .catalog-mid-block-wrap:not(.catalog-mid-block-wrap-a) {
      flex-direction: column;
      min-height: 0;
    }

    .catalog-mid-block-wrap:not(.catalog-mid-block-wrap-a)::before {
      left: 24px;
      width: min(360px, 80vw);
      height: 160px;
    }

    .catalog-mid-block-wrap-a {
      padding-right: 32px;
      min-height: 0;
    }

    .catalog-mid-block-wrap-a::before {
      position: relative;
      top: auto;
      right: auto;
      width: 100%;
      height: 180px;
      margin-top: 8px;
      order: 5;
    }

    .left-mid-block {
      flex-basis: auto;
      min-height: 0;
    }

    .ok-wrap-block {
      flex-direction: column;
    }

    .ok-wrap-block-item {
      min-height: 0;
    }

    .catalog-mid-block-wrap-a .actions-row {
      flex-direction: column;
      align-items: stretch;
    }

    .catalog-mid-block-wrap-a .btn-link {
      flex-basis: auto;
      align-self: stretch;
      width: 100% !important;
      min-width: 0 !important;
      max-width: 100% !important;
    }
  }

  @media (max-width: 560px) {
    .catalog-mid-block-wrap {
      padding: 20px 16px;
      border-radius: 20px;
    }

    .catalog-mid-block-wrap:not(.catalog-mid-block-wrap-a)::before {
      left: 16px;
      width: calc(100% - 32px);
      height: 140px;
    }

    .title {
      font-size: 24px;
    }

    .sub-title {
      font-size: 18px;
    }

    .catalog-mid-block-wrap-a .btn-link,
    .btn-link {
      width: 100% !important;
      min-width: 0 !important;
      max-width: 100% !important;
    }
  }
</style>
