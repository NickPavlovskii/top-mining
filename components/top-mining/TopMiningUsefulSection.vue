<template>
  <section
    class="useful-section"
    aria-labelledby="useful-section-title"
  >
    <div class="useful-section__wrapper">
      <header class="useful-section__header">
        <p
          class="useful-section__decor useful-section__decor--left"
          aria-hidden="true"
        >
          {{ TOP_MINING_USEFUL_SECTION.decorText }}
        </p>
        <p
          class="useful-section__decor useful-section__decor--right"
          aria-hidden="true"
        >
          {{ TOP_MINING_USEFUL_SECTION.decorText }}
        </p>

        <h2
          id="useful-section-title"
          class="useful-section__title"
        >
          <span class="useful-section__title-line useful-section__title-line--dark">
            {{ TOP_MINING_USEFUL_SECTION.titleLine1 }}
          </span>
          <span class="useful-section__title-line useful-section__title-line--accent">
            {{ TOP_MINING_USEFUL_SECTION.titleLine2 }}
          </span>
        </h2>
      </header>

      <div class="useful-section__list">
        <article
          v-for="(item, index) in TOP_MINING_USEFUL_ITEMS"
          v-show="!item.initiallyHidden || isExpanded"
          :key="item.title"
          class="useful-section__item"
        >
          <p
            class="useful-section__index"
            aria-hidden="true"
          >
            ({{ formatIndex(index) }}/{{ formatIndex(TOP_MINING_USEFUL_SECTION.totalItems - 1) }})
          </p>

          <h3 class="useful-section__item-title">
            {{ item.title }}
          </h3>

          <div class="useful-section__item-body">
            <p class="useful-section__item-text">
              {{ item.description }}
            </p>

            <div class="useful-section__actions">
              <a
                v-for="action in item.actions"
                :key="action.label"
                class="useful-section__action-link"
                :href="action.href"
                :target="action.external ? '_blank' : undefined"
                :rel="action.external ? 'noopener noreferrer' : undefined"
              >
                <span class="useful-section__action-label">{{ action.label }}</span>
                <Icon
                  name="mdi:arrow-top-right"
                  class="useful-section__action-icon"
                  aria-hidden="true"
                />
              </a>
            </div>
          </div>
        </article>

        <div
          v-if="!isExpanded"
          class="useful-section__item useful-section__item--more"
        >
          <button
            type="button"
            class="useful-section__more-btn"
            @click="isExpanded = true"
          >
            <span>{{ TOP_MINING_USEFUL_SECTION.lookMoreLabel }}</span>
            <Icon
              name="mdi:chevron-down"
              class="useful-section__more-icon"
            />
          </button>
        </div>
      </div>
    </div>
  </section>
</template>

<script setup lang="ts">
  import {
    TOP_MINING_USEFUL_ITEMS,
    TOP_MINING_USEFUL_SECTION,
  } from '~/common/modules/top-mining'

  const isExpanded = ref(false)

  function formatIndex(index: number) {
    return String(index + 1).padStart(2, '0')
  }
</script>

<style scoped>
  .useful-section {
    position: relative;
    z-index: 4;
    width: 100%;
    margin-top: -48px;
    padding-top: 48px;
    background: #000;
  }

  .useful-section__wrapper {
    width: 100%;
    border-radius: 64px 64px 0 0;
    background: var(--tm-white);
    overflow: hidden;
  }

  .useful-section__header {
    position: relative;
    z-index: 0;
    margin: 0 auto;
    padding: 0 clamp(16px, 4vw, 60px) clamp(24px, 4vw, 40px);
    text-align: center;
    overflow: hidden;
  }

  .useful-section__decor {
    position: absolute;
    top: 50%;
    width: min(1281px, 140%);
    height: 156px;
    margin: 0;
    color: #fff;
    font-family: 'Unbounded', sans-serif;
    font-size: clamp(72px, 10vw, 156px);
    font-style: normal;
    font-weight: 500;
    line-height: 156px;
    white-space: nowrap;
    pointer-events: none;
    user-select: none;
    text-shadow:
      2px 0 rgba(19, 19, 21, 0.1),
      -2px 0 rgba(19, 19, 21, 0.1),
      0 2px rgba(19, 19, 21, 0.1),
      0 -2px rgba(19, 19, 21, 0.1),
      1px 1px rgba(19, 19, 21, 0.1),
      -1px -1px rgba(19, 19, 21, 0.1),
      1px -1px rgba(19, 19, 21, 0.1),
      -1px 1px rgba(19, 19, 21, 0.1);
    transform: translateY(-50%);
    z-index: 0;
  }

  .useful-section__decor--left {
    left: 260px;
    top: 320px;
    text-align: left;
  }

  .useful-section__decor--right {
    left: 870px;
    text-align: right;
  }

  .useful-section__title {
    position: relative;
    z-index: 1;
    display: grid;
    gap: 0;
    margin: 0;
    text-align: center;
    text-transform: uppercase;
  }

  .useful-section__title-line {
    display: block;
    font-family: 'Unbounded', sans-serif;
    font-weight: 500;
    font-size: clamp(48px, 8vw, 120px);
    line-height: clamp(48px, 8vw, 120px);
  }

  .useful-section__title-line--dark {
    position: relative;
    z-index: 0;
    margin-top: clamp(72px, 10vw, 144px);
    color: #141414;
    font-size: clamp(48px, 8vw, 120px);
    line-height: clamp(48px, 8vw, 120px);
  }

  .useful-section__title-line--accent {
    position: relative;
    z-index: 1;
    margin-top: -8px;
    font-size: clamp(48px, 8vw, 120px);
    line-height: clamp(60px, 10vw, 150px);
    background-color: #d8480d;
    background-image: linear-gradient(
      90deg,
      #d8480d 0%,
      #cb3a08 33.9%,
      #fe731e 73.9%,
      #ed5f17 100%
    );
    background-size: 100%;
    background-repeat: repeat;
    -webkit-background-clip: text;
    background-clip: text;
    -webkit-text-fill-color: transparent;
    color: transparent;
  }

  .useful-section__list {
    max-width: 1720px;
    margin: 0 auto;
    padding: 0 clamp(16px, 4vw, 60px) clamp(48px, 6vw, 88px);
  }

  .useful-section__item {
    display: grid;
    grid-template-columns: minmax(72px, 92px) minmax(220px, 0.95fr) minmax(0, 1.35fr);
    gap: clamp(16px, 2.5vw, 32px);
    align-items: start;
    padding: clamp(22px, 3vw, 34px) 0;
    border-top: 1px solid var(--tm-border);
  }

  .useful-section__item:last-child {
    border-bottom: 1px solid var(--tm-border);
  }

  .useful-section__index {
    margin: 4px 0 0;
    color: var(--tm-text-placeholder);
    font-family: 'Roboto', system-ui, sans-serif;
    font-size: 12px;
    font-weight: 500;
    letter-spacing: 0.04em;
    white-space: nowrap;
  }

  .useful-section__item-title {
    margin: 0;
    color: var(--tm-text-primary);
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(18px, 2vw, 28px);
    font-weight: 600;
    line-height: 1.15;
    letter-spacing: -0.02em;
    text-wrap: balance;
  }

  .useful-section__item-body {
    display: grid;
    gap: 18px;
    min-width: 0;
  }

  .useful-section__item-text {
    margin: 0;
    color: var(--tm-text-muted);
    font-family: 'Roboto', system-ui, sans-serif;
    font-size: clamp(14px, 1.2vw, 16px);
    font-weight: 400;
    line-height: 1.55;
  }

  .useful-section__actions {
    display: flex;
    flex-wrap: wrap;
    gap: 10px 16px;
  }

  .useful-section__action-link {
    display: inline-flex;
    align-items: center;
    gap: 6px;
    min-height: 40px;
    padding: 0 18px;
    border: 1px solid var(--tm-orange);
    border-radius: 999px;
    background: var(--tm-white);
    color: var(--tm-text-secondary);
    font-family: 'Roboto', system-ui, sans-serif;
    font-size: 11px;
    font-weight: 800;
    line-height: 1.1;
    letter-spacing: 0.04em;
    text-decoration: none;
    text-transform: uppercase;
    transition:
      background-color 0.2s ease,
      color 0.2s ease,
      border-color 0.2s ease;
  }

  @media (hover: hover) {
    .useful-section__action-link:hover,
    .useful-section__action-link:focus-visible {
      background: var(--tm-orange);
      border-color: var(--tm-orange);
      color: var(--tm-white);
    }

    .useful-section__action-link:hover .useful-section__action-icon,
    .useful-section__action-link:focus-visible .useful-section__action-icon {
      color: var(--tm-white);
    }
  }

  .useful-section__action-label {
    line-height: 1.1;
    text-align: left;
  }

  .useful-section__action-icon {
    width: 14px;
    height: 14px;
    flex-shrink: 0;
    color: currentColor;
    transition: color 0.2s ease;
  }

  .useful-section__item--more {
    grid-template-columns: 1fr;
    justify-items: start;
    padding-top: clamp(28px, 3vw, 36px);
    border-bottom: 1px solid var(--tm-border);
  }

  .useful-section__more-btn {
    display: inline-flex;
    align-items: center;
    gap: 8px;
    margin: 0;
    padding: 0;
    border: 0;
    background: transparent;
    color: var(--tm-text-primary);
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(18px, 2vw, 24px);
    font-weight: 600;
    line-height: 1.2;
    cursor: pointer;
    transition: color 0.18s ease;
  }

  @media (hover: hover) {
    .useful-section__more-btn:hover,
    .useful-section__more-btn:focus-visible {
      color: var(--tm-orange);
    }
  }

  .useful-section__more-icon {
    width: 22px;
    height: 22px;
  }

  @media (max-width: 1800px) {
  .useful-section__decor--left {
    left: 60px;
    top: 320px;
    text-align: left;
  }

  .useful-section__decor--right {
    left: 270px;
    text-align: right;
  }
  }
  @media (max-width: 900px) {
  .useful-section__decor--left {
    left: 60px;
    top: 320px;
    text-align: left;
  }

  .useful-section__decor--right {
    left: 370px;
    text-align: right;
  }
    .useful-section {
      margin-top: -40px;
      padding-top: 40px;
    }

    .useful-section__wrapper {
      border-radius: 32px 32px 0 0;
      background: #f2f2f2;
    }

    .useful-section__header {
      padding: 0 16px 20px;
      text-align: center;
    }

    .useful-section__decor {
      left: 50%;
      right: auto;
      top: 42%;
      width: 120%;
      font-size: clamp(72px, 22vw, 104px);
      line-height: 1;
      text-align: center;
      transform: translate(-50%, -50%);
    }

    .useful-section__decor--left {
      display: block;
    }

    .useful-section__decor--right {
      display: none;
    }

    .useful-section__title-line {
      font-size: clamp(36px, 11vw, 52px);
      line-height: 1.05;
    }

    .useful-section__title-line--dark {
      margin-top: clamp(40px, 14vw, 64px);
      font-size: clamp(36px, 11vw, 52px);
      line-height: 1.05;
    }

    .useful-section__title-line--accent {
      margin-top: 0;
      font-size: clamp(36px, 11vw, 52px);
      line-height: 1.08;
    }

    .useful-section__list {
      position: relative;
      padding: 0 0 clamp(32px, 8vw, 48px);
    }

    .useful-section__item {
      position: relative;
      z-index: 1;
      grid-template-columns: 1fr;
      gap: 14px;
      padding: 28px 16px;
      border-top-color: rgba(20, 20, 20, 0.14);
    }

    .useful-section__index {
      position: absolute;
      top: 28px;
      right: 16px;
      margin: 0;
      color: rgba(20, 20, 20, 0.34);
      font-size: 11px;
      font-weight: 400;
      letter-spacing: 0.02em;
    }

    .useful-section__item-title {
      max-width: calc(100% - 72px);
      font-size: clamp(22px, 6.4vw, 28px);
      font-weight: 600;
      line-height: 1.12;
    }

    .useful-section__item-body {
      gap: 16px;
    }

    .useful-section__item-text {
      color: #141414;
      font-size: 14px;
      line-height: 1.5;
    }

    .useful-section__actions {
      gap: 12px;
    }

    .useful-section__action-link {
      min-height: 0;
      padding: 0;
      border: 0;
      border-radius: 0;
      background: transparent;
      color: #141414;
      font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
      font-size: 12px;
      font-weight: 500;
      letter-spacing: 0.06em;
    }

    .useful-section__action-icon {
      width: 12px;
      height: 12px;
    }

    @media (hover: hover) {
      .useful-section__action-link:hover,
      .useful-section__action-link:focus-visible {
        background: transparent;
        border-color: transparent;
        color: var(--tm-orange);
      }
    }

    .useful-section__item--more {
      padding-inline: 16px;
    }
  }
</style>
