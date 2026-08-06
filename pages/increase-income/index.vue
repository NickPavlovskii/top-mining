<template>
  <div class="increase-income-page">
    <increase-income-hero />
    <increase-income-promo />
  </div>
</template>

<script setup lang="ts">
  import IncreaseIncomeHero from '~/components/increase-income/IncreaseIncomeHero.vue'
  import IncreaseIncomePromo from '~/components/increase-income/IncreaseIncomePromo.vue'

  definePageMeta({
    path: '/uvelichim-vash-dohod',
  })

  const page = useIncreaseIncomePage()

  useSeoMeta({
    title: () => page.value.seoTitle,
    description: () => page.value.seoDescription,
  })
</script>

<style scoped>
  .increase-income-page {
    background: var(--tm-page-bg);
    color: var(--tm-white);
    min-height: 60vh;
  }
</style>
