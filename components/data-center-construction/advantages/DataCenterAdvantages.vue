<template>
  <section
    class="data-center-advantages"
    aria-labelledby="data-center-advantages-title"
  >
    <div class="data-center-advantages__inner">
      <h2
        id="data-center-advantages-title"
        class="data-center-advantages__title"
      >
        {{ copy.title }}
      </h2>

      <div class="data-center-advantages__wrap">
        <article
          v-for="item in copy.items"
          :key="item.index"
          class="data-center-advantages__row"
        >
          <div class="data-center-advantages__left">
            <span class="data-center-advantages__index">{{ item.index }}</span>
            <h3 class="data-center-advantages__row-title">
              {{ item.title }}
            </h3>
          </div>
          <div class="data-center-advantages__text">
            <template
              v-for="(paragraph, paragraphIndex) in itemParagraphs(item.text)"
              :key="`${item.index}-${paragraphIndex}`"
            >
              <br v-if="paragraphIndex > 0">
              <br v-if="paragraphIndex > 0">
              {{ paragraph }}
            </template>
          </div>
        </article>
      </div>
    </div>
  </section>
</template>

<script setup lang="ts">
  import { DATA_CENTER_CONSTRUCTION_PAGE } from '~/common/modules/top-mining/pages/data-center-construction'

  const copy = DATA_CENTER_CONSTRUCTION_PAGE.advantages

  function itemParagraphs(text: string) {
    return text
      .split(/\n+/)
      .map((part) => part.trim())
      .filter(Boolean)
  }
</script>

<style scoped>
  .data-center-advantages {
    background: var(--tm-ink);
    padding: 24px 0 0;
    color: var(--tm-white);
  }

  .data-center-advantages__inner {
    box-sizing: border-box;
    max-width: 1720px;
    margin: 0 auto;
    padding: 0 40px;
  }

  .data-center-advantages__title {
    margin: 0 0 32px;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(24px, 3vw, 40px);
    font-weight: 500;
    line-height: 1.2;
    text-transform: uppercase;
  }

  .data-center-advantages__wrap {
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    margin-bottom: 76px;
    padding: 40px;
    border: 1px solid rgba(247, 247, 247, 0.15);
    border-radius: 50px;
    background: rgba(247, 247, 247, 0.06);
    backdrop-filter: blur(20px);
    -webkit-backdrop-filter: blur(20px);
  }

  .data-center-advantages__row {
    display: grid;
    grid-template-columns: minmax(280px, 570px) minmax(0, 1fr);
    gap: clamp(24px, 4vw, 64px);
    align-items: center;
    padding: 28px 0;
  }

  .data-center-advantages__row + .data-center-advantages__row {
    border-top: 1px solid rgba(247, 247, 247, 0.12);
  }

  .data-center-advantages__row:first-child {
    padding-top: 0;
  }

  .data-center-advantages__row:last-child {
    padding-bottom: 0;
  }

  .data-center-advantages__left {
    display: flex;
    align-items: center;
    gap: 38px;
    max-width: 570px;
    color: #757575;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 26px;
    font-weight: 400;
    line-height: 32px;
  }

  .data-center-advantages__index {
    flex: 0 0 auto;
  }

  .data-center-advantages__row-title {
    margin: 0;
    color: inherit;
    font: inherit;
    text-transform: uppercase;
  }

  .data-center-advantages__text {
    color: #f6f6f6;
    font-family: Mulish, 'Segoe UI', system-ui, sans-serif;
    font-size: 18px;
    font-weight: 400;
    line-height: 26px;
  }

  @media (max-width: 1439px) {
    .data-center-advantages__wrap {
      margin-bottom: 80px;
      padding: 0 20px 30px;
      border-radius: 25px;
    }

    .data-center-advantages__row {
      padding: 22px 0;
    }

    .data-center-advantages__row:first-child {
      padding-top: 24px;
    }

    .data-center-advantages__left {
      gap: 20px;
      max-width: 292px;
      font-size: 14px;
      line-height: 20px;
    }

    .data-center-advantages__text {
      font-size: 15px;
      line-height: 22px;
    }
  }

  @media (max-width: 899px) {
    .data-center-advantages__inner {
      padding: 0 16px;
    }

    .data-center-advantages__wrap {
      padding: 8px 16px 20px;
      border-radius: 24px;
    }

    .data-center-advantages__row {
      grid-template-columns: 1fr;
      gap: 12px;
      align-items: start;
    }

    .data-center-advantages__left {
      max-width: none;
      align-items: flex-start;
    }
  }
</style>
