<template>
  <section
    class="consulting-soprovod"
    aria-labelledby="consulting-soprovod-title"
  >
    <div class="consulting-soprovod__inner">
      <h2
        id="consulting-soprovod-title"
        class="consulting-soprovod__title"
      >
        {{ copy.sectionTitle }}
      </h2>

      <consulting-soprovod-card
        v-for="card in copy.cards"
        :key="card.id"
        :card="card"
      />
    </div>
  </section>
</template>

<script setup lang="ts">
  import { CONSULTING_SOPROVOD } from '~/common/modules/top-mining/consulting-soprovod'
  import ConsultingSoprovodCard from '~/components/consulting/ConsultingSoprovodCard.vue'

  const copy = CONSULTING_SOPROVOD
</script>

<style scoped>
  .consulting-soprovod {
    padding: 144px 0 144px;
    background: var(--tm-off-white);
    color: var(--tm-page-bg);
  }

  .consulting-soprovod__inner {
    max-width: 1700px;
    margin: 0 auto;
    padding: 0 40px;
  }

  .consulting-soprovod__title {
    margin: 0 0 24px;
    color: var(--tm-page-bg);
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 95px;
    font-weight: 500;
    line-height: 100%;
    text-align: left;
    text-transform: uppercase;
  }

  @media (max-width: 1299px) {
    .consulting-soprovod {
      padding: 56px 0;
    }

    .consulting-soprovod__inner {
      padding: 0 24px;
    }

    .consulting-soprovod__title {
      font-size: 24px;
      line-height: 29.76px;
    }
  }

  @media (max-width: 767px) {
    .consulting-soprovod {
      padding: 40px 0;
    }

    .consulting-soprovod__inner {
      padding: 0 16px;
    }
  }
</style>
