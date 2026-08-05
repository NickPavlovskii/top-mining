<template>
  <section
    class="converter-about"
    aria-labelledby="converter-about-title"
  >
    <div class="converter-about__inner">
      <h2
        id="converter-about-title"
        class="converter-about__title"
      >
        {{ about.title }}
      </h2>

      <div class="converter-about__content">
        <p
          v-for="(paragraph, index) in about.paragraphs"
          :key="`intro-${index}`"
          :class="[
            'converter-about__paragraph',
            { 'converter-about__paragraph--strong': index === 1 },
          ]"
        >
          {{ paragraph }}
        </p>

        <p class="converter-about__paragraph">
          {{ about.listIntro }}
        </p>

        <ul class="converter-about__list">
          <li
            v-for="feature in about.features"
            :key="feature"
          >
            {{ feature }}
          </li>
        </ul>

        <p
          v-for="(paragraph, index) in about.closing"
          :key="`closing-${index}`"
          class="converter-about__paragraph"
        >
          {{ paragraph }}
        </p>
      </div>
    </div>
  </section>
</template>

<script setup lang="ts">
  import { HASHRATE_CONVERTER_PAGE } from '~/common/modules/top-mining/converter/page'

  const about = HASHRATE_CONVERTER_PAGE.about
</script>

<style scoped>
  .converter-about {
    background: #f2f2f2;
    color: var(--tm-black, #141414);
    padding: clamp(40px, 6vw, 72px) 0;
  }

  .converter-about__inner {
    box-sizing: border-box;
    max-width: 1720px;
    margin: 0 auto;
    padding: 0 40px;
  }

  .converter-about__title {
    margin: 0 0 28px;
    max-width: 1100px;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(22px, 3.2vw, 40px);
    font-weight: 500;
    line-height: 1.25;
    text-transform: uppercase;
  }

  .converter-about__content {
    max-width: 920px;
  }

  .converter-about__paragraph {
    margin: 0 0 16px;
    font-family: Mulish, 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(16px, 1.4vw, 18px);
    font-weight: 400;
    line-height: 1.55;
  }

  .converter-about__paragraph--strong {
    font-weight: 700;
  }

  .converter-about__list {
    margin: 0 0 16px;
    padding: 0 0 0 1.35em;
    list-style: disc outside;
    font-family: Mulish, 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(16px, 1.4vw, 18px);
    font-weight: 400;
    line-height: 1.55;
  }

  .converter-about__list li + li {
    margin-top: 8px;
  }

  @media (max-width: 899px) {
    .converter-about__inner {
      padding: 0 16px;
    }

    .converter-about__title {
      margin-bottom: 20px;
    }
  }
</style>
