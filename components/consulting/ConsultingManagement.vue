<template>
  <section
    class="consulting-management"
    aria-labelledby="consulting-management-title"
  >
    <div class="consulting-management__inner">
      <h2
        id="consulting-management-title"
        class="consulting-management__title"
      >
        {{ copy.sectionTitle }}
      </h2>

      <consulting-management-card
        v-for="card in copy.cards"
        :key="card.id"
        :card="card"
      />
    </div>
  </section>
</template>

<script setup lang="ts">
  import { CONSULTING_MANAGEMENT } from '~/common/modules/top-mining/consulting/management'
  import ConsultingManagementCard from '~/components/consulting/ConsultingManagementCard.vue'

  const copy = CONSULTING_MANAGEMENT
</script>

<style scoped>
  .consulting-management {
    padding: 64px 0 144px;
    background: var(--tm-off-white);
    color: var(--tm-page-bg);
  }

  .consulting-management__inner {
    max-width: 1700px;
    margin: 0 auto;
    padding: 0 40px;
  }

  .consulting-management__title {
    margin: 0 0 16px;
    color: var(--tm-page-bg);
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 95px;
    font-weight: 500;
    line-height: 100%;
    text-align: left;
    text-transform: uppercase;
  }

  @media (max-width: 1299px) {
    .consulting-management {
      padding: 40px 0 56px;
    }

    .consulting-management__inner {
      padding: 0 24px;
    }

    .consulting-management__title {
      font-size: 24px;
      line-height: 29.76px;
    }
  }

  @media (max-width: 767px) {
    .consulting-management {
      padding: 24px 0 40px;
    }

    .consulting-management__inner {
      padding: 0 16px;
    }
  }
</style>
