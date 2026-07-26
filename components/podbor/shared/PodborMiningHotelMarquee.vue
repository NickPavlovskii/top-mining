<template>
  <div
    class="podbor-marquee-wrap"
    aria-hidden="true"
  >
    <div class="podbor-marquee">
      <div class="podbor-marquee__track">
        <div
          v-for="copy in 2"
          :key="copy"
          class="podbor-marquee__group"
        >
          <div
            v-for="n in itemCount"
            :key="`${copy}-${n}`"
            class="podbor-marquee__item"
          >
            <img
              class="podbor-marquee__icon"
              src="/images/podbor-majning-otelya/marquee-icon.png"
              alt=""
            >
            <span class="podbor-marquee__text">{{ label }}</span>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
  const label = 'Актуальные предложения'
  const itemCount = 8
</script>

<style scoped>
  .podbor-marquee-wrap {
    width: 100%;
    height: 189px;
    overflow: hidden;
    padding-top: 57px;
    pointer-events: none;
  }

  .podbor-marquee {
    margin: 0 -10px;
    height: 76px;
    background: #262626;
    transform: rotate(-3.27deg);
    overflow: hidden;
  }

  .podbor-marquee__track {
    display: flex;
    width: max-content;
    height: 100%;
    animation: podbor-marquee-scroll 28s linear infinite;
  }

  .podbor-marquee__group {
    display: flex;
    align-items: center;
    height: 100%;
    flex-shrink: 0;
  }

  .podbor-marquee__item {
    display: flex;
    align-items: center;
    gap: 48px;
    height: 100%;
    padding-right: 48px;
    flex-shrink: 0;
  }

  .podbor-marquee__icon {
    display: block;
    width: 36px;
    height: auto;
    flex-shrink: 0;
  }

  .podbor-marquee__text {
    color: var(--tm-white);
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-weight: 400;
    font-size: 28px;
    line-height: 34px;
    text-transform: uppercase;
    white-space: nowrap;
  }

  @keyframes podbor-marquee-scroll {
    from {
      transform: translateX(0);
    }

    to {
      transform: translateX(-50%);
    }
  }

  @media (max-width: 1439px) {
    .podbor-marquee-wrap {
      height: 130px;
      padding-top: 40px;
    }

    .podbor-marquee {
      height: 44px;
    }

    .podbor-marquee__item {
      gap: 32px;
      padding-right: 32px;
    }

    .podbor-marquee__icon {
      width: 24px;
    }

    .podbor-marquee__text {
      font-size: 14px;
      line-height: 20px;
    }
  }

  @media (max-width: 767px) {
    .podbor-marquee-wrap {
      height: 100px;
      padding-top: 28px;
    }

    .podbor-marquee__item {
      gap: 24px;
      padding-right: 24px;
    }
  }
</style>
