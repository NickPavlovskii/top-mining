<template>
  <div class="buy-asic-model-page">
    <buy-asic-model-offer
      v-if="model"
      :key="model.slug"
      :model="model"
    />
    <buy-asic-models-marquee />
    <buy-asic-models />
    <buy-asic-useful />
    <buy-asic-client-problems />
  </div>
</template>

<script setup lang="ts">
  import {
    getBuyAsicModelBySlug,
    getBuyAsicModelShortName,
  } from '~/common/modules/top-mining/buy-asic/page'
  import BuyAsicModelOffer from '~/components/buy-asic/models/BuyAsicModelOffer.vue'
  import BuyAsicModels from '~/components/buy-asic/models/BuyAsicModels.vue'
  import BuyAsicModelsMarquee from '~/components/buy-asic/models/BuyAsicModelsMarquee.vue'
  import BuyAsicClientProblems from '~/components/buy-asic/shared/BuyAsicClientProblems.vue'
  import BuyAsicUseful from '~/components/buy-asic/shared/BuyAsicUseful.vue'

  definePageMeta({
    path: '/asic-majnery-po-czenam-nizhe-rynka/:slug',
  })

  const route = useRoute()
  const slug = computed(() => String(route.params.slug || ''))
  const model = computed(() => getBuyAsicModelBySlug(slug.value))

  if (!model.value) {
    throw createError({
      statusCode: 404,
      statusMessage: 'Model not found',
    })
  }

  const shortName = computed(() => getBuyAsicModelShortName(model.value!))

  useSeoMeta({
    title: () =>
      `${model.value!.name} — ASIC по цене ниже рынка | ТОП МАЙНИНГ`,
    description: () =>
      `Подберем майнинг-компанию, где вы сможете купить ASIC ${shortName.value} на 10% дешевле рынка.`,
  })
</script>

<style scoped>
  .buy-asic-model-page {
    background: #fff;
    color: var(--tm-white);
    min-height: 60vh;
  }
</style>
