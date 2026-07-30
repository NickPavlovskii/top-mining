<template>
  <section
    class="buy-asic-value"
    aria-labelledby="buy-asic-safety-title"
  >
    <div class="buy-asic-value__inner">
      <h2
        :id="safety.titleId"
        class="buy-asic-value__heading"
      >
        <span
          v-for="(line, index) in safety.titleLines"
          :key="index"
          class="buy-asic-value__heading-line"
        >
          {{ line }}
        </span>
      </h2>

      <div class="buy-asic-value__grid">
        <article
          v-for="card in safety.cards"
          :key="card.id"
          class="buy-asic-value__card"
        >
          <h3 class="buy-asic-value__card-title">
            {{ card.title }}
          </h3>
          <p
            v-if="card.subtitle"
            class="buy-asic-value__card-subtitle"
          >
            {{ card.subtitle }}
          </p>

          <div class="buy-asic-value__list-wrap">
            <ul class="buy-asic-value__list">
              <li
                v-for="(item, index) in card.items"
                :key="`vis-${card.id}-${index}`"
                class="buy-asic-value__item"
              >
                {{ item }}
              </li>
              <template v-if="isExpanded(card.id) && card.moreItems?.length">
                <li
                  v-for="(item, index) in card.moreItems"
                  :key="`more-${card.id}-${index}`"
                  class="buy-asic-value__item"
                >
                  {{ item }}
                </li>
              </template>
            </ul>

            <button
              v-if="card.moreItems?.length"
              type="button"
              class="buy-asic-value__more"
              :aria-expanded="isExpanded(card.id)"
              @click="toggle(card.id)"
            >
              {{
                isExpanded(card.id)
                  ? BUY_ASIC_VALUE_BLOCKS.seeLessLabel
                  : BUY_ASIC_VALUE_BLOCKS.seeMoreLabel
              }}
              <Icon
                class="buy-asic-value__more-icon"
                aria-hidden="true"
                :name="
                  isExpanded(card.id)
                    ? 'mdi:chevron-up'
                    : 'mdi:chevron-down'
                "
              />
            </button>
          </div>

          <p
            v-if="card.footnote"
            class="buy-asic-value__footnote"
          >
            {{ card.footnote }}
          </p>
        </article>
      </div>

      <h2
        :id="timeSave.titleId"
        class="buy-asic-value__heading buy-asic-value__heading--spaced"
      >
        <span
          v-for="(line, index) in timeSave.titleLines"
          :key="index"
          class="buy-asic-value__heading-line"
        >
          {{ line }}
        </span>
      </h2>

      <div class="buy-asic-value__grid">
        <article
          v-for="card in timeSave.cards"
          :key="card.id"
          :class="[
            'buy-asic-value__card',
            { 'buy-asic-value__card--full': card.fullWidth },
          ]"
        >
          <h3 class="buy-asic-value__card-title">
            <template
              v-for="(line, index) in cardTitleLines(card.title)"
              :key="index"
            >
              {{ line }}<br v-if="index < cardTitleLines(card.title).length - 1">
            </template>
          </h3>
          <p
            v-if="card.subtitle"
            class="buy-asic-value__card-subtitle"
          >
            {{ card.subtitle }}
          </p>

          <div
            v-if="card.items.length || card.moreItems?.length"
            class="buy-asic-value__list-wrap"
          >
            <ul class="buy-asic-value__list">
              <li
                v-for="(item, index) in card.items"
                :key="`vis-${card.id}-${index}`"
                class="buy-asic-value__item"
              >
                {{ item }}
              </li>
              <template v-if="isExpanded(card.id) && card.moreItems?.length">
                <li
                  v-for="(item, index) in card.moreItems"
                  :key="`more-${card.id}-${index}`"
                  class="buy-asic-value__item"
                >
                  {{ item }}
                </li>
              </template>
            </ul>

            <button
              v-if="card.moreItems?.length"
              type="button"
              class="buy-asic-value__more"
              :aria-expanded="isExpanded(card.id)"
              @click="toggle(card.id)"
            >
              {{
                isExpanded(card.id)
                  ? BUY_ASIC_VALUE_BLOCKS.seeLessLabel
                  : BUY_ASIC_VALUE_BLOCKS.seeMoreLabel
              }}
              <Icon
                class="buy-asic-value__more-icon"
                aria-hidden="true"
                :name="
                  isExpanded(card.id)
                    ? 'mdi:chevron-up'
                    : 'mdi:chevron-down'
                "
              />
            </button>
          </div>

          <top-mining-button
            v-if="card.cta"
            class="buy-asic-value__cta"
            variant="primary"
            surface="dark"
            size="big"
            :href="card.cta.href"
            :title="ctaTitle(card.cta)"
            :append-icon="arrowIcon"
          />
        </article>
      </div>
    </div>
  </section>
</template>

<script setup lang="ts">
  import arrowIcon from '~/assets/images/articles/arrow-up-right.png'
  import {
    BUY_ASIC_SAFETY,
    BUY_ASIC_TIME_SAVE,
    BUY_ASIC_VALUE_BLOCKS,
  } from '~/common/modules/top-mining/buy-asic-value-blocks'

  const safety = BUY_ASIC_SAFETY
  const timeSave = BUY_ASIC_TIME_SAVE

  const expanded = ref<Record<string, boolean>>({})

  function isExpanded(id: string) {
    return Boolean(expanded.value[id])
  }

  function toggle(id: string) {
    expanded.value = {
      ...expanded.value,
      [id]: !expanded.value[id],
    }
  }

  function cardTitleLines(title: string) {
    return title.split('\n')
  }

  function ctaTitle(cta: { label: string; labelAccent?: string }) {
    return cta.labelAccent ? `${cta.label} ${cta.labelAccent}` : cta.label
  }
</script>

<style scoped>
  .buy-asic-value {
    background: var(--tm-ink);
    color: #fff;
    padding: 24px 0 56px;
  }

  .buy-asic-value__inner {
    box-sizing: border-box;
    max-width: 1100px;
    margin: 0 auto;
    padding: 0 40px;
  }

  .buy-asic-value__heading {
    display: flex;
    flex-direction: column;
    gap: 0.1em;
    margin: 0 0 28px;
    font-family: 'Unbounded', sans-serif;
    font-size: clamp(22px, 3.2vw, 36px);
    font-weight: 600;
    line-height: 1.15;
    letter-spacing: 0.01em;
    text-transform: uppercase;
    color: #fff;
  }

  .buy-asic-value__heading--spaced {
    margin-top: 56px;
  }

  .buy-asic-value__grid {
    display: flex;
    flex-wrap: wrap;
    gap: 24px;
  }

  .buy-asic-value__card {
    box-sizing: border-box;
    display: flex;
    flex-direction: column;
    width: calc(50% - 12px);
    padding: 36px 32px;
    border-radius: 40px;
    background: #1f1f1f;
  }

  .buy-asic-value__card--full {
    width: 100%;
  }

  .buy-asic-value__card-title {
    margin: 0 0 12px;
    font-family: 'Mulish', 'Roboto', sans-serif;
    font-size: 20px;
    font-weight: 700;
    line-height: 1.3;
    color: #fff;
  }

  .buy-asic-value__card-subtitle {
    margin: 0 0 20px;
    font-family: 'Mulish', 'Roboto', sans-serif;
    font-size: 16px;
    font-weight: 600;
    line-height: 1.4;
    color: var(--tm-orange, #ff6418);
  }

  .buy-asic-value__list-wrap {
    display: flex;
    flex-direction: column;
    gap: 12px;
    margin-top: auto;
    padding: 4px 16px 12px;
    border-radius: 20px;
    background: #171717;
  }

  .buy-asic-value__list {
    margin: 0;
    padding: 0;
    list-style: none;
  }

  .buy-asic-value__item {
    padding: 14px 0;
    border-bottom: 1px solid rgb(255 255 255 / 8%);
    font-family: 'Mulish', 'Roboto', sans-serif;
    font-size: 14px;
    font-weight: 400;
    line-height: 1.4;
    color: #e8e8e8;
  }

  .buy-asic-value__item:last-child {
    border-bottom: none;
  }

  .buy-asic-value__more {
    display: inline-flex;
    align-items: center;
    gap: 4px;
    align-self: flex-start;
    margin: 0 0 4px;
    padding: 0;
    border: 0;
    background: none;
    color: #c8c8c8;
    font-family: 'Mulish', 'Roboto', sans-serif;
    font-size: 13px;
    font-weight: 500;
    line-height: 1.2;
    cursor: pointer;
  }

  .buy-asic-value__more:hover {
    color: #fff;
  }

  .buy-asic-value__more-icon {
    width: 18px;
    height: 18px;
  }

  .buy-asic-value__footnote {
    margin: 16px 0 0;
    font-family: 'Mulish', 'Roboto', sans-serif;
    font-size: 12px;
    line-height: 1.35;
    color: #a0a0a0;
    text-align: right;
  }

  .buy-asic-value__cta {
    margin-top: 24px;
    align-self: flex-start;
  }

  .buy-asic-value__card--full .buy-asic-value__cta {
    margin-top: 8px;
  }

  .buy-asic-value__cta :deep(.top-mining-button__icon--append) {
    filter: brightness(0) invert(1);
  }

  @media (max-width: 900px) {
    .buy-asic-value__card {
      width: 100%;
      padding: 24px 20px;
      border-radius: 24px;
    }

    .buy-asic-value__heading--spaced {
      margin-top: 40px;
    }
  }

  @media (max-width: 560px) {
    .buy-asic-value__inner {
      padding: 0 16px;
    }

    .buy-asic-value__heading {
      font-size: 20px;
    }

    .buy-asic-value__card-title {
      font-size: 17px;
    }

    .buy-asic-value__card-subtitle {
      font-size: 14px;
    }

    .buy-asic-value__cta {
      width: 100%;
    }

    .buy-asic-value__cta :deep(.q-btn) {
      width: 100%;
    }
  }
</style>
