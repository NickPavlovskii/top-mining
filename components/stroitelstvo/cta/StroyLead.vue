<template>
  <section
    :id="copy.id"
    class="stroy-lead"
    aria-labelledby="stroy-lead-title"
  >
    <div class="stroy-lead__inner">
      <stroy-cta-form-card
        title-id="stroy-lead-title"
        variant="hero"
        :title="copy.title"
        :text="copy.text"
        :submit-label="copy.submitLabel"
        :phone-placeholder="copy.phonePlaceholder"
        :honeypot-label="copy.honeypotLabel"
        :privacy-prefix="copy.privacyPrefix"
        :privacy-link-label="copy.privacyLinkLabel"
        :privacy-href="copy.privacyHref"
        @submit="onSubmit"
      />
    </div>
  </section>
</template>

<script setup lang="ts">
  import { STROITELSTVO_DATA_CZENTROV_PAGE } from '~/common/modules/top-mining/stroitelstvo-data-czentrov-page'
  import type { StroyCtaFormSubmitPayload } from '~/common/modules/top-mining/stroitelstvo-data-czentrov-page'
  import StroyCtaFormCard from '~/components/stroitelstvo/shared/StroyCtaFormCard.vue'

  const copy = STROITELSTVO_DATA_CZENTROV_PAGE.lead

  function onSubmit(_payload: StroyCtaFormSubmitPayload) {
    // TODO: отправка заявки «Индивидуальный проект»
  }
</script>

<style scoped>
  .stroy-lead {
    position: relative;
    padding: 0 0 72px;
    color: var(--tm-white);
    scroll-margin-top: 100px;
  }

  .stroy-lead__inner {
    box-sizing: border-box;
    max-width: 1720px;
    margin: 0 auto;
    padding: 0 40px;
  }

  .stroy-lead__inner :deep(.stroy-cta-form-card) {
    margin-bottom: 68px;
  }

  @media (max-width: 1439px) {
    .stroy-lead__inner :deep(.stroy-cta-form-card) {
      margin-bottom: 40px;
    }
  }

  @media (max-width: 767px) {
    .stroy-lead {
      padding-bottom: 56px;
    }

    .stroy-lead__inner {
      padding: 0 16px;
    }
  }
</style>
