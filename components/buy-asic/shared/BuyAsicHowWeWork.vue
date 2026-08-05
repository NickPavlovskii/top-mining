<template>
  <section
    class="buy-asic-how"
    aria-labelledby="buy-asic-how-we-work-title"
  >
    <div class="buy-asic-how__inner">
      <div class="buy-asic-how__panel">
        <h2
          :id="copy.titleId"
          class="buy-asic-how__title"
        >
          {{ copy.titleLead }}
          <span class="buy-asic-how__title-accent">{{ copy.titleAccent }}</span>
          <span class="buy-asic-how__title-tail">{{ copy.titleTail }}</span>
        </h2>

        <p class="buy-asic-how__subtitle">
          {{ copy.subtitle }}
        </p>

        <ul class="buy-asic-how__steps">
          <li
            v-for="step in copy.steps"
            :key="step.id"
            :class="[
              'buy-asic-how__step',
              { 'buy-asic-how__step--accent': step.highlighted },
            ]"
          >
            <span
              v-if="step.number != null"
              class="buy-asic-how__badge"
              aria-hidden="true"
            >
              {{ step.number }}
            </span>
            <p class="buy-asic-how__text">
              <template
                v-for="(part, index) in step.parts"
                :key="index"
              >
                <strong v-if="part.bold">{{ part.text }}</strong>
                <template v-else>{{ part.text }}</template>
              </template>
            </p>
          </li>
        </ul>
      </div>
    </div>
  </section>
</template>

<script setup lang="ts">
  import { BUY_ASIC_HOW_WE_WORK } from '~/common/modules/top-mining/buy-asic/value-blocks'

  const copy = BUY_ASIC_HOW_WE_WORK
</script>

<style scoped>
  .buy-asic-how {
    background: var(--tm-ink);
    color: #fff;
    padding: 24px 0 48px;
  }

  .buy-asic-how__inner {
    box-sizing: border-box;
    max-width: 1100px;
    margin: 0 auto;
    padding: 0 40px;
  }

  .buy-asic-how__panel {
    box-sizing: border-box;
    padding: 32px 28px 28px;
    border-radius: 32px;
    background: #1f1f1f;
  }

  .buy-asic-how__title {
    margin: 0 0 28px;
    font-family: 'Unbounded', sans-serif;
    font-size: clamp(22px, 3.2vw, 36px);
    font-weight: 600;
    line-height: 1.15;
    letter-spacing: 0.01em;
    text-transform: uppercase;
    color: #fff;
  }

  .buy-asic-how__title-accent {
    display: inline-block;
    margin: 0 0.2em;
    color: #fff;
    font-size: 1.28em;
    line-height: 1;
  }

  .buy-asic-how__title-tail {
    display: inline;
  }

  .buy-asic-how__subtitle {
    margin: 0 0 20px;
    font-family: 'Mulish', 'Roboto', sans-serif;
    font-size: 18px;
    font-weight: 600;
    line-height: 1.35;
    color: #fff;
  }

  .buy-asic-how__steps {
    display: flex;
    flex-wrap: wrap;
    gap: 12px;
    margin: 0;
    padding: 0;
    list-style: none;
  }

  .buy-asic-how__step {
    box-sizing: border-box;
    display: flex;
    flex-direction: column;
    align-items: flex-start;
    gap: 14px;
    width: calc(25% - 9px);
    min-height: 120px;
    padding: 18px 16px;
    border-radius: 16px;
    background: #262626;
  }

  .buy-asic-how__step--accent {
    align-items: center;
    justify-content: center;
    background: linear-gradient(
      94.62deg,
      var(--tm-orange-gradient-start, #ec5100) 2.06%,
      var(--tm-orange, #ff6418) 93.25%
    );
    text-align: center;
  }

  .buy-asic-how__badge {
    display: grid;
    place-items: center;
    width: 28px;
    height: 28px;
    border-radius: 50%;
    background: var(--tm-orange, #ff6418);
    color: #fff;
    font-family: 'Unbounded', sans-serif;
    font-size: 13px;
    font-weight: 600;
    line-height: 1;
  }

  .buy-asic-how__text {
    margin: 0;
    font-family: 'Mulish', 'Roboto', sans-serif;
    font-size: 14px;
    font-weight: 400;
    line-height: 1.35;
    color: #fff;
  }

  .buy-asic-how__text strong {
    font-weight: 700;
  }

  .buy-asic-how__step--accent .buy-asic-how__text {
    font-size: 15px;
    font-weight: 600;
    line-height: 1.3;
  }

  @media (max-width: 900px) {
    .buy-asic-how__step {
      width: calc(50% - 6px);
      min-height: 110px;
    }
  }

  @media (max-width: 560px) {
    .buy-asic-how__inner {
      padding: 0 16px;
    }

    .buy-asic-how__panel {
      padding: 20px 16px;
      border-radius: 24px;
    }

    .buy-asic-how__title {
      margin-bottom: 20px;
      font-size: 20px;
    }

    .buy-asic-how__subtitle {
      font-size: 16px;
    }

    .buy-asic-how__step {
      width: 100%;
      min-height: 0;
    }
  }
</style>
