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

  useSeoMeta({
    title: 'Увеличим ваш доход | ТОП МАЙНИНГ',
    description:
      'Ваши асики зарабатывают от 100.000 ₽ в месяц? Увеличим вашу чистую прибыль на 7%.',
  })
</script>

<style scoped>
  .increase-income-page {
    background: var(--tm-page-bg);
    color: var(--tm-white);
    min-height: 60vh;
  }
</style>
