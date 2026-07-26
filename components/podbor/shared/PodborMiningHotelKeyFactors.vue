<template>
  <section
    class="podbor-factors"
    aria-labelledby="podbor-factors-title"
  >
    <div class="podbor-factors__inner">
      <h2
        id="podbor-factors-title"
        class="podbor-factors__title"
      >
        {{ factors.titleLead }}
        <br>
        {{ factors.titleRest }}
      </h2>

      <div class="podbor-factors__points">
        <div
          v-for="factor in factors.factors"
          :key="factor.id"
          class="podbor-factors__item"
        >
          <div class="podbor-factors__number">
            {{ factor.number }}
          </div>
          <div class="podbor-factors__label">
            {{ factor.title }}
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script setup lang="ts">
  import { PODBOR_MINING_HOTEL_KEY_FACTORS } from '~/common/modules/top-mining/podbor-mining-hotel'

  const factors = PODBOR_MINING_HOTEL_KEY_FACTORS
</script>

<style scoped>
  .podbor-factors {
    background: #141414;
    color: var(--tm-white);
    padding: 24px 0 88px;
  }

  .podbor-factors__inner {
    max-width: 1700px;
    margin: 0 auto;
    padding: 0 40px;
  }

  .podbor-factors__title {
    margin: 0 0 64px;
    color: var(--tm-off-white);
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 48px;
    font-weight: 500;
    line-height: 64px;
    text-transform: uppercase;
  }

  .podbor-factors__points {
    display: flex;
    flex-direction: column;
  }

  .podbor-factors__item {
    display: flex;
    align-items: center;
    gap: 28px;
    padding: 28px 0;
    border-top: 1px solid rgba(255, 255, 255, 0.14);
  }

  .podbor-factors__item:last-child {
    border-bottom: 1px solid rgba(255, 255, 255, 0.14);
  }

  .podbor-factors__number,
  .podbor-factors__label {
    color: var(--tm-off-white);
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 24px;
    font-weight: 400;
    line-height: 1.3;
  }

  .podbor-factors__number {
    flex: 0 0 auto;
    min-width: 2.2em;
    font-weight: 500;
  }

  @media (max-width: 1730px) {
    .podbor-factors__title {
      margin-bottom: 40px;
    }
  }

  @media (max-width: 1600px) {
    .podbor-factors__inner {
      max-width: 1320px;
      padding: 0 32px;
    }
  }

  @media (max-width: 1299px) {
    .podbor-factors__inner {
      padding: 0 24px;
    }

    .podbor-factors__title {
      font-size: 36px;
      line-height: 48px;
    }

    .podbor-factors__item {
      gap: 20px;
      padding: 24px 0;
    }

    .podbor-factors__number,
    .podbor-factors__label {
      font-size: 20px;
    }
  }

  @media (max-width: 767px) {
    .podbor-factors {
      padding: 16px 0 64px;
    }

    .podbor-factors__inner {
      padding: 0 16px;
    }

    .podbor-factors__title {
      margin-bottom: 24px;
      font-size: 26px;
      line-height: 34px;
    }

    .podbor-factors__item {
      align-items: flex-start;
      gap: 16px;
      padding: 20px 0;
    }

    .podbor-factors__number,
    .podbor-factors__label {
      font-size: 16px;
    }
  }
</style>
