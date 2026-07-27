<template>
  <section
    class="podbor-time"
    aria-labelledby="podbor-time-title"
  >
    <div class="podbor-time__inner">
      <h2
        id="podbor-time-title"
        class="podbor-time__title"
      >
        {{ copy.titleLead }}
        <br>
        {{ copy.titleRest }}
      </h2>

      <div class="podbor-time__grid">
        <article
          v-for="card in copy.cards"
          :key="card.id"
          class="podbor-time-card"
        >
          <h3 class="podbor-time-card__title">
            {{ card.title }}
          </h3>

          <p
            v-if="card.accent"
            class="podbor-time-card__accent"
          >
            {{ card.accent }}
          </p>

          <div class="podbor-time-card__list-wrap">
            <ul class="podbor-time-card__list">
              <li
                v-for="(item, index) in visibleItems(card)"
                :key="`${card.id}-${index}`"
                class="podbor-time-card__item"
              >
                {{ item }}
              </li>
            </ul>

            <button
              v-if="card.moreItems.length"
              type="button"
              class="podbor-time-card__toggle"
              :aria-expanded="isExpanded(card.id)"
              @click="toggle(card.id)"
            >
              <span>
                {{ toggleLabel(card.id) }}
              </span>
              <Icon
                :name="toggleIcon(card.id)"
                class="podbor-time-card__toggle-icon"
                aria-hidden="true"
              />
            </button>
          </div>

          <top-mining-button
            v-if="card.buttonLabel"
            class="podbor-time-card__button"
            preset="contact-pill"
            variant="primary"
            size="big"
            surface="dark"
            target="_blank"
            rel="noopener noreferrer"
            :title="card.buttonLabel"
            :href="card.buttonHref"
            :append-icon="arrowIcon"
          />
        </article>
      </div>

      <article class="podbor-time-card podbor-time-card--wide">
        <h3 class="podbor-time-card__title">
          {{ incomeTips.title }}
        </h3>

        <p
          v-if="incomeTips.accent"
          class="podbor-time-card__accent"
        >
          {{ incomeTips.accent }}
        </p>

        <div class="podbor-time-card__list-wrap">
          <ul class="podbor-time-card__list">
            <li
              v-for="(item, index) in visibleItems(incomeTips)"
              :key="`income-${index}`"
              class="podbor-time-card__item"
            >
              {{ item }}
            </li>
          </ul>

          <button
            v-if="incomeTips.moreItems.length"
            type="button"
            class="podbor-time-card__toggle"
            :aria-expanded="isExpanded(incomeTips.id)"
            @click="toggle(incomeTips.id)"
          >
            <span>
              {{ toggleLabel(incomeTips.id) }}
            </span>
            <Icon
              :name="toggleIcon(incomeTips.id)"
              class="podbor-time-card__toggle-icon"
              aria-hidden="true"
            />
          </button>
        </div>
      </article>
    </div>
  </section>
</template>

<script setup lang="ts">
  import arrowIcon from '~/assets/images/articles/arrow-up-right.png'
  import type { PodborTimeSaveCard } from '~/common/modules/top-mining/podbor-mining-hotel'
  import { PODBOR_MINING_HOTEL_TIME_SAVE } from '~/common/modules/top-mining/podbor-mining-hotel'
  import TopMiningButton from '~/components/global/buttons/TopMiningButton.vue'

  const TOGGLE_ICON_EXPANDED = 'mdi:chevron-up'
  const TOGGLE_ICON_COLLAPSED = 'mdi:chevron-down'

  const copy = PODBOR_MINING_HOTEL_TIME_SAVE
  const incomeTips = copy.incomeTips
  const expandedIds = ref<Set<string>>(new Set())

  function isExpanded(id: string) {
    return expandedIds.value.has(id)
  }

  function toggleIcon(id: string) {
    return isExpanded(id) ? TOGGLE_ICON_EXPANDED : TOGGLE_ICON_COLLAPSED
  }

  function toggleLabel(id: string) {
    return isExpanded(id) ? copy.hideLabel : copy.showMoreLabel
  }

  function toggle(id: string) {
    const next = new Set(expandedIds.value)

    if (next.has(id)) {
      next.delete(id)
    } else {
      next.add(id)
    }

    expandedIds.value = next
  }

  function visibleItems(card: PodborTimeSaveCard) {
    if (isExpanded(card.id)) {
      return [...card.previewItems, ...card.moreItems]
    }

    return card.previewItems
  }
</script>

<style scoped>
  .podbor-time {
    background: var(--tm-page-bg);
    color: var(--tm-white);
    padding: 24px 0 40px;
  }

  .podbor-time__inner {
    max-width: 1700px;
    margin: 0 auto;
    padding: 0 40px;
  }

  .podbor-time__title {
    margin: 0 0 40px;
    color: var(--tm-off-white);
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(28px, 3.4vw, 48px);
    font-weight: 500;
    line-height: 1.15;
    text-transform: uppercase;
  }

  .podbor-time__grid {
    display: grid;
    grid-template-columns: repeat(2, minmax(0, 1fr));
    gap: 24px;
    align-items: stretch;
    margin-bottom: 24px;
  }

  .podbor-time-card {
    display: flex;
    flex-direction: column;
    min-height: 100%;
    padding: 36px 32px;
    border-radius: 28px;
    background: #1b1b1b;
  }

  .podbor-time-card--wide {
    min-height: 0;
  }

  .podbor-time-card__title {
    margin: 0 0 16px;
    color: var(--tm-off-white);
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(18px, 1.5vw, 24px);
    font-weight: 500;
    line-height: 1.3;
  }

  .podbor-time-card__accent {
    margin: 0 0 24px;
    color: var(--tm-orange);
    font-size: clamp(15px, 1.2vw, 17px);
    font-weight: 500;
    line-height: 1.4;
  }

  .podbor-time-card__list-wrap {
    display: flex;
    flex-direction: column;
    gap: 16px;
    margin-bottom: 24px;
    padding: 20px;
    border-radius: 24px;
    background: #262626;
    flex: 1;
  }

  .podbor-time-card__list {
    margin: 0;
    padding: 0;
    list-style: none;
    display: flex;
    flex-direction: column;
    gap: 16px;
  }

  .podbor-time-card__item {
    color: color-mix(in srgb, var(--tm-off-white) 80%, transparent);
    font-size: 18px;
    font-weight: 400;
    line-height: 24px;
  }

  .podbor-time-card__toggle {
    display: inline-flex;
    align-items: center;
    gap: 6px;
    align-self: flex-start;
    padding: 0;
    border: 0;
    background: transparent;
    color: rgba(255, 255, 255, 0.72);
    font-size: 15px;
    line-height: 1.3;
    cursor: pointer;
  }

  .podbor-time-card__toggle:hover,
  .podbor-time-card__toggle:focus-visible {
    color: var(--tm-off-white);
  }

  .podbor-time-card__toggle-icon {
    width: 18px;
    height: 18px;
  }

  .podbor-time-card
    .podbor-time-card__button.top-mining-button.q-btn.top-mining-button--contact-pill.top-mining-button--primary {
    width: auto;
    max-width: max-content;
    min-width: 0;
    margin-top: auto;
  }

  @media (max-width: 1600px) {
    .podbor-time__inner {
      max-width: 1320px;
      padding: 0 32px;
    }
  }

  @media (max-width: 1299px) {
    .podbor-time__inner {
      padding: 0 24px;
    }

    .podbor-time-card {
      padding: 28px 24px;
      border-radius: 24px;
    }

    .podbor-time-card__item {
      font-size: 16px;
      line-height: 22px;
    }
  }

  @media (max-width: 899px) {
    .podbor-time {
      padding: 16px 0 64px;
    }

    .podbor-time__inner {
      padding: 0 16px;
    }

    .podbor-time__title {
      margin-bottom: 24px;
      font-size: 26px;
    }

    .podbor-time__grid {
      grid-template-columns: 1fr;
      gap: 16px;
      margin-bottom: 16px;
    }

    .podbor-time-card {
      padding: 24px 20px;
    }

    .podbor-time-card
      .podbor-time-card__button.top-mining-button.q-btn.top-mining-button--contact-pill.top-mining-button--primary {
      width: 100%;
      max-width: 100%;
      min-height: 44px;
      padding: 0 18px;
      font-size: 12px;
    }

    .podbor-time-card__button :deep(.top-mining-button__inner) {
      justify-content: center;
      width: auto;
    }
  }
</style>
