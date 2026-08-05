<template>
  <section
    class="calculator-about"
    aria-labelledby="calculator-about-title"
  >
    <div class="calculator-about__inner">
      <h2
        id="calculator-about-title"
        class="calculator-about__title"
      >
        {{ about.title }}
      </h2>

      <p class="calculator-about__intro">
        {{ about.intro }}
      </p>

      <ul class="calculator-about__list">
        <li
          v-for="feature in about.features"
          :key="feature"
        >
          {{ feature }}
        </li>
      </ul>

      <p class="calculator-about__closing">
        {{ about.closing }}
      </p>
    </div>
  </section>
</template>

<script setup lang="ts">
  import { CALCULATOR_PAGE } from '~/common/modules/top-mining/calculator-page'

  const about = CALCULATOR_PAGE.about
</script>

<style scoped>
  .calculator-about {
    background: var(--tm-ink);
    color: var(--tm-white);
    padding: 24px 0 56px;
  }

  .calculator-about__inner {
    box-sizing: border-box;
    max-width: 1720px;
    margin: 0 auto;
    padding: 0 40px;
  }

  .calculator-about__title {
    margin: 0 0 28px;
    max-width: 1100px;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(22px, 3.2vw, 40px);
    font-weight: 500;
    line-height: 1.25;
    text-transform: uppercase;
  }

  .calculator-about__intro {
    margin: 0 0 16px;
    max-width: 920px;
    color: var(--tm-white);
    font-family: Mulish, 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(16px, 1.4vw, 18px);
    font-weight: 700;
    line-height: 1.45;
  }

  .calculator-about__list {
    margin: 0 0 16px;
    padding: 0 0 0 1.35em;
    max-width: 920px;
    list-style: disc outside;
    color: rgba(246, 246, 246, 0.92);
    font-family: Mulish, 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(16px, 1.4vw, 18px);
    font-weight: 400;
    line-height: 1.55;
  }

  .calculator-about__list li {
    padding-left: 0.15em;
  }

  .calculator-about__list li::marker {
    color: var(--tm-white);
  }

  .calculator-about__list li + li {
    margin-top: 8px;
  }

  .calculator-about__closing {
    margin: 0;
    max-width: 920px;
    color: var(--tm-white);
    font-family: Mulish, 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(16px, 1.4vw, 18px);
    font-weight: 700;
    line-height: 1.45;
  }

  @media (max-width: 899px) {
    .calculator-about {
      padding: 8px 0 40px;
    }

    .calculator-about__inner {
      padding: 0 16px;
    }

    .calculator-about__title {
      margin-bottom: 20px;
    }
  }
</style>
