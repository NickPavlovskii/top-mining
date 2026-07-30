<template>
  <div
    class="buy-asic-marquee-wrap"
    aria-hidden="true"
  >
    <div class="buy-asic-marquee">
      <div class="buy-asic-marquee__track">
        <div
          v-for="copyIndex in 2"
          :key="copyIndex"
          class="buy-asic-marquee__group"
        >
          <div
            v-for="n in itemCount"
            :key="`${copyIndex}-${n}`"
            class="buy-asic-marquee__item"
          >
            <img
              class="buy-asic-marquee__icon"
              src="/images/podbor-majning-otelya/marquee-icon.png"
              alt=""
            >
            <span class="buy-asic-marquee__text">{{ label }}</span>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
  const label = 'АКТУАЛЬНЫЕ МОДЕЛИ'
  const itemCount = 8
</script>

<style scoped>
  .buy-asic-marquee-wrap {
    width: 100%;
    height: 230px;
    padding-top: 96px;
    overflow: hidden;
    background: var(--tm-ink);
    pointer-events: none;
  }

  .buy-asic-marquee {
    margin: 0 -10px;
    height: 76px;
    overflow: hidden;
    background: #262626;
    transform: rotate(-3.27deg);
  }

  .buy-asic-marquee__track {
    display: flex;
    width: max-content;
    height: 100%;
    animation: buy-asic-models-marquee 28s linear infinite;
  }

  .buy-asic-marquee__group {
    display: flex;
    flex-shrink: 0;
    align-items: center;
    height: 100%;
  }

  .buy-asic-marquee__item {
    display: flex;
    flex-shrink: 0;
    align-items: center;
    gap: 48px;
    height: 100%;
    padding-right: 48px;
  }

  .buy-asic-marquee__icon {
    display: block;
    flex-shrink: 0;
    width: 36px;
    height: auto;
  }

  .buy-asic-marquee__text {
    color: #fff;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 28px;
    font-weight: 400;
    line-height: 34px;
    text-transform: uppercase;
    white-space: nowrap;
  }

  @keyframes buy-asic-models-marquee {
    from {
      transform: translateX(0);
    }

    to {
      transform: translateX(-50%);
    }
  }

  @media (max-width: 1439px) {
    .buy-asic-marquee-wrap {
      height: 160px;
      padding-top: 68px;
    }

    .buy-asic-marquee {
      height: 44px;
    }

    .buy-asic-marquee__item {
      gap: 32px;
      padding-right: 32px;
    }

    .buy-asic-marquee__icon {
      width: 24px;
    }

    .buy-asic-marquee__text {
      font-size: 14px;
      line-height: 20px;
    }
  }

  @media (max-width: 767px) {
    .buy-asic-marquee-wrap {
      height: 120px;
      padding-top: 44px;
    }

    .buy-asic-marquee__item {
      gap: 24px;
      padding-right: 24px;
    }
  }
</style>
