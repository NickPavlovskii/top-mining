<template>
  <div
    class="articles-section"
    aria-labelledby="articles-section-title"
  >
    <header class="articles-section__header">
      <h2
        id="articles-section-title"
        class="articles-section__title"
      >
        <span class="articles-section__title-line">
          {{ TOP_MINING_ARTICLES_SECTION.titleLine1 }}
        </span>
        <span class="articles-section__title-line">
          {{ TOP_MINING_ARTICLES_SECTION.titleLine2 }}
        </span>
      </h2>

      <p class="articles-section__subtitle">
        {{ TOP_MINING_ARTICLES_SECTION.subtitle }}
      </p>
    </header>

    <div
      class="articles-section__topics"
      role="tablist"
      aria-label="Темы статей"
    >
      <button
        v-for="topic in TOP_MINING_ARTICLES_TOPICS"
        :id="`articles-topic-${topic.id}`"
        :key="topic.id"
        type="button"
        role="tab"
        :class="[
          'articles-section__topic',
          { 'articles-section__topic--active': activeTopic === topic.id },
        ]"
        :aria-selected="activeTopic === topic.id"
        :tabindex="activeTopic === topic.id ? 0 : -1"
        @click="selectTopic(topic.id)"
      >
        {{ topic.label }}
      </button>
    </div>

    <slot :active-topic="activeTopic" />
  </div>
</template>

<script setup lang="ts">
  import {
    TOP_MINING_ARTICLES_SECTION,
    TOP_MINING_ARTICLES_TOPICS,
    type TopMiningArticlesTopicId,
  } from '~/common/modules/top-mining/articles-section'

  const activeTopic = defineModel<TopMiningArticlesTopicId>('activeTopic', {
    default: 'all',
  })

  function selectTopic(topicId: TopMiningArticlesTopicId) {
    activeTopic.value = topicId
  }
</script>

<style scoped>
  .articles-section {
    width: 100%;
    max-width: 1720px;
    margin: 0 auto;
    padding-top: clamp(48px, 6vw, 88px);
    text-align: center;
  }

  .articles-section__header {
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 0;
    margin-bottom: clamp(28px, 4vw, 44px);
  }

  .articles-section__title {
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 0;
    margin: 0 0 clamp(16px, 2.4vw, 28px);
    color: var(--tm-white);
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(34px, 4.8vw, 64px);
    font-weight: 600;
    line-height: 1.04;
    letter-spacing: -0.03em;
    text-transform: uppercase;
  }

  .articles-section__title-line {
    display: block;
  }

  .articles-section__subtitle {
    display: block;
    width: min(100%, 920px);
    max-width: 920px;
    margin: 0;
    color: rgba(255, 255, 255, 0.88);
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(14px, 1.45vw, 22px);
    font-weight: 400;
    line-height: 1.36;
    letter-spacing: -0.02em;
  }

  .articles-section__topics {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    gap: 10px;
    max-width: 100%;
    margin: 0 auto;
  }

  .articles-section__topic {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    min-height: 44px;
    padding: 10px 18px;
    border: 1px solid rgba(255, 255, 255, 0.18);
    border-radius: 999px;
    background: transparent;
    color: rgba(255, 255, 255, 0.92);
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(12px, 1.1vw, 14px);
    font-weight: 400;
    line-height: 1.2;
    letter-spacing: -0.01em;
    white-space: nowrap;
    cursor: pointer;
    transition:
      background-color 0.2s ease,
      border-color 0.2s ease,
      color 0.2s ease,
      transform 0.2s ease;
  }

  .articles-section__topic:hover:not(.articles-section__topic--active) {
    border-color: rgba(255, 255, 255, 0.34);
    transform: translateY(-1px);
  }

  .articles-section__topic--active {
    border-color: transparent;
    background: var(--tm-orange-accent-gradient-horizontal);
    color: var(--jet-color);
    cursor: default;
  }

  .articles-section__topic:focus-visible {
    outline: 2px solid rgba(255, 255, 255, 0.45);
    outline-offset: 2px;
  }

  @media (max-width: 560px) {
    .articles-section__topics {
      flex-wrap: nowrap;
      justify-content: flex-start;
      overflow-x: auto;
      padding-bottom: 4px;
      margin-inline: -4px;
      padding-inline: 4px;
      scrollbar-width: none;
      -webkit-overflow-scrolling: touch;
    }

    .articles-section__topics::-webkit-scrollbar {
      display: none;
    }
  }
</style>
