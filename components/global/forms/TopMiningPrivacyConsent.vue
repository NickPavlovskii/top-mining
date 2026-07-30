<template>
  <div class="top-mining-privacy-consent">
    <top-mining-checkbox
      v-model="model"
      class="top-mining-privacy-consent__checkbox"
      size="sm"
      :required="required"
      :disabled="disabled"
    >
      <span class="top-mining-privacy-consent__text">
        {{ prefix }}
        {{ ' ' }}
        <nuxt-link
          class="top-mining-privacy-consent__link"
          :to="privacyHref"
        >
          {{ privacyLinkLabel }}
        </nuxt-link>
      </span>
    </top-mining-checkbox>
  </div>
</template>

<script setup lang="ts">
  import TopMiningCheckbox from '~/components/global/selection-controls/TopMiningCheckbox.vue'

  withDefaults(
    defineProps<{
      prefix?: string
      privacyLinkLabel?: string
      privacyHref?: string
      required?: boolean
      disabled?: boolean
    }>(),
    {
      prefix: 'Продолжая, вы соглашаетесь с',
      privacyLinkLabel: 'Политикой конфиденциальности',
      privacyHref: '/privacy',
      required: true,
      disabled: false,
    },
  )

  const model = defineModel<boolean>({ default: true })
</script>

<style scoped>
  .top-mining-privacy-consent {
    color: var(--tm-text-soft);
    font-family: 'Mulish', 'Segoe UI', system-ui, sans-serif;
    font-size: 12px;
    font-weight: 300;
    line-height: 16px;
  }

  .top-mining-privacy-consent__checkbox {
    align-items: flex-start;
    max-width: 100%;
    color: inherit;
    font: inherit;
  }

  .top-mining-privacy-consent__text {
    color: var(--tm-text-soft);
  }

  .top-mining-privacy-consent__link {
    color: inherit;
    text-decoration: underline;
    text-underline-offset: 2px;
  }

  .top-mining-privacy-consent__link:hover,
  .top-mining-privacy-consent__link:focus-visible {
    color: #fff;
  }

  .top-mining-privacy-consent :deep(.top-mining-checkbox__control) {
    --tm-checkbox-size: 14px;
    --tm-checkbox-radius: 3px;
    margin-top: 1px;
  }
</style>
