<template>
  <section
    class="converter-faq"
    aria-labelledby="converter-faq-title"
  >
    <div class="converter-faq__inner">
      <h2
        id="converter-faq-title"
        class="converter-faq__title"
      >
        {{ faq.title }}
      </h2>

      <div class="converter-faq__list">
        <article
          v-for="item in faq.items"
          :key="item.question"
          class="converter-faq__item"
        >
          <h3 class="converter-faq__question">
            {{ item.question }}
          </h3>
          <p class="converter-faq__answer">
            {{ item.answer }}
          </p>
        </article>
      </div>
    </div>
  </section>
</template>

<script setup lang="ts">
  import { HASHRATE_CONVERTER_PAGE } from '~/common/modules/top-mining/hashrate-converter-page'

  const faq = HASHRATE_CONVERTER_PAGE.faq
</script>

<style scoped>
  .converter-faq {
    background: var(--tm-white, #fff);
    color: var(--tm-black, #141414);
    padding: clamp(40px, 6vw, 72px) 0 clamp(32px, 4vw, 56px);
  }

  .converter-faq__inner {
    box-sizing: border-box;
    max-width: 1720px;
    margin: 0 auto;
    padding: 0 40px;
  }

  .converter-faq__title {
    margin: 0 0 32px;
    max-width: 1100px;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(22px, 3.2vw, 40px);
    font-weight: 500;
    line-height: 1.25;
    text-transform: uppercase;
  }

  .converter-faq__list {
    display: flex;
    flex-direction: column;
    gap: 0;
  }

  .converter-faq__item {
    display: grid;
    grid-template-columns: minmax(220px, 0.9fr) minmax(0, 1.4fr);
    gap: clamp(16px, 3vw, 40px);
    align-items: start;
    padding: clamp(20px, 3vw, 28px) 0;
    border-top: 1px solid rgba(20, 20, 20, 0.1);
  }

  .converter-faq__item:last-child {
    border-bottom: 1px solid rgba(20, 20, 20, 0.1);
  }

  .converter-faq__question {
    margin: 0;
    font-family: Mulish, 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(16px, 1.5vw, 18px);
    font-weight: 700;
    line-height: 1.45;
  }

  .converter-faq__answer {
    margin: 0;
    font-family: Mulish, 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(16px, 1.5vw, 18px);
    font-weight: 400;
    line-height: 1.55;
  }

  @media (max-width: 899px) {
    .converter-faq__inner {
      padding: 0 16px;
    }

    .converter-faq__item {
      grid-template-columns: 1fr;
      gap: 10px;
    }
  }
</style>
