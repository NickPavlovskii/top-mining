<template>
  <article class="tm-tokens-doc">
    <header class="tm-tokens-doc__intro">
      <h1 class="tm-tokens-doc__title">Дизайн-токены</h1>
      <p class="tm-tokens-doc__lead">
        CSS-переменные объявлены в
        <code>assets/scss/variables.scss</code>. Префикс
        <code>--tm-*</code> — публичный API для компонентов Top Mining.
      </p>
    </header>

    <section
      v-for="group in designTokenGroups"
      :id="group.id"
      :key="group.id"
      class="tm-tokens-doc__section"
    >
      <h2 class="tm-tokens-doc__heading">{{ group.title }}</h2>

      <div
        v-if="group.id === 'animation'"
        class="tm-tokens-doc__anim-strip"
        aria-hidden="true"
      />

      <div
        class="tm-tokens-doc__swatch-grid"
        :class="{ 'tm-tokens-doc__swatch-grid--anim': group.id === 'animation' }"
      >
        <figure
          v-for="swatch in group.swatches"
          :key="swatch.token"
          class="tm-tokens-doc__swatch"
        >
          <div
            class="tm-tokens-doc__swatch-color"
            :style="swatchStyle(swatch)"
          />
          <figcaption class="tm-tokens-doc__swatch-meta">
            <code>{{ swatch.token }}</code>
            <span class="tm-tokens-doc__swatch-hex">{{ swatch.hex }}</span>
            <span
              v-if="swatch.note"
              class="tm-tokens-doc__swatch-note"
            >
              {{ swatch.note }}
            </span>
          </figcaption>
        </figure>
      </div>
    </section>
  </article>
</template>

<script setup lang="ts">
  import { designTokenGroups } from './design-token-groups'
  import type { DesignTokenSwatch } from './design-token-types'

  function swatchStyle(swatch: DesignTokenSwatch) {
    if (swatch.gradient) {
      return { background: swatch.gradient }
    }

    return { background: swatch.hex }
  }
</script>
