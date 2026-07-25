<template>
  <top-mining-button
    class="article-share-button"
    :class="{ 'article-share-button--block': block }"
    :title="label"
    variant="secondary"
    surface="light"
    :size="size"
    :width="block ? '100%' : undefined"
    :append-icon="shareIcon"
    @click="open = true"
  />

  <article-share-modal
    v-model="open"
    :share-title="shareTitle"
  />
</template>

<script setup lang="ts">
  import shareIcon from '~/assets/images/articles/share-icon.png'
  import ArticleShareModal from '~/components/articles/ArticleShareModal.vue'

  withDefaults(
    defineProps<{
      label?: string
      size?: 'big' | 'small'
      /** Заголовок для шаринга */
      shareTitle?: string
      block?: boolean
    }>(),
    {
      label: 'Поделиться статьей',
      size: 'big',
      shareTitle: '',
      block: false,
    },
  )

  const open = ref(false)
</script>

<style scoped>
  .article-share-button :deep(.top-mining-button__icon--append) {
    width: 18px;
    height: 18px;
    transform: none;
  }

  .article-share-button.top-mining-button--secondary:hover:not(
      .top-mining-button--disabled
    ):not(.top-mining-button--loading)
    :deep(.top-mining-button__icon--append),
  .article-share-button.top-mining-button--secondary:focus-visible:not(
      .top-mining-button--disabled
    ):not(.top-mining-button--loading)
    :deep(.top-mining-button__icon--append) {
    transform: none;
  }

  .article-share-button--block {
    width: 100%;
  }

  .article-share-button--block :deep(.q-btn__content),
  .article-share-button--block.q-btn {
    width: 100%;
  }
</style>
