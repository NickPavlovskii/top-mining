<template>
  <button
    type="button"
    class="carousel-add-card"
    data-carousel-item
    @click="$emit('click')"
  >
    <span
      class="carousel-add-card__icon"
      aria-hidden="true"
    >+</span>
    <span class="carousel-add-card__label">
      {{ label }}
    </span>
  </button>
</template>

<script setup lang="ts">
  defineProps<{
    label: string
  }>()

  defineEmits<{
    click: []
  }>()
</script>

<style scoped>
  .carousel-add-card {
    flex: 0 0 min(360px, 78vw);
    width: min(360px, 78vw);
    max-width: 360px;
    aspect-ratio: 1 / 1;
    align-self: flex-start;
    scroll-snap-align: start;
    box-sizing: border-box;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    gap: 16px;
    padding: 24px;
    border: 1px solid rgba(255, 255, 255, 0.18);
    border-radius: 24px;
    background: transparent;
    cursor: pointer;
    text-align: center;
    transition: border-color 0.2s ease;
  }

  .carousel-add-card:hover,
  .carousel-add-card:focus-visible {
    border-color: var(--tm-orange);
  }

  .carousel-add-card__icon {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    width: 56px;
    height: 56px;
    border-radius: 50%;
    background: var(--tm-orange);
    color: #fff;
    font-size: 32px;
    line-height: 1;
  }

  .carousel-add-card__label {
    color: var(--tm-orange);
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 14px;
    font-weight: 500;
    letter-spacing: 0.03em;
    text-transform: uppercase;
    line-height: 1.35;
  }

  @media (max-width: 1299px) {
    .carousel-add-card {
      flex-basis: min(300px, 72vw);
      width: min(300px, 72vw);
      max-width: 300px;
    }
  }
</style>
