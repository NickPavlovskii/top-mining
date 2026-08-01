<template>
  <section
    :id="copy.id"
    class="data-center-lead"
    aria-labelledby="data-center-lead-title"
  >
    <div class="data-center-lead__inner">
      <data-center-cta-form-card
        title-id="data-center-lead-title"
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
  import { DATA_CENTER_CONSTRUCTION_PAGE } from '~/common/modules/top-mining/data-center-construction-page'
  import type { DataCenterCtaFormSubmitPayload } from '~/common/modules/top-mining/data-center-construction-page'
  import DataCenterCtaFormCard from '~/components/data-center-construction/shared/DataCenterCtaFormCard.vue'

  const copy = DATA_CENTER_CONSTRUCTION_PAGE.lead

  function onSubmit(_payload: DataCenterCtaFormSubmitPayload) {
    // TODO: отправка заявки «Индивидуальный проект»
  }
</script>

<style scoped>
  .data-center-lead {
    position: relative;
    padding: 0 0 72px;
    color: var(--tm-white);
    scroll-margin-top: 100px;
  }

  .data-center-lead__inner {
    box-sizing: border-box;
    max-width: 1720px;
    margin: 0 auto;
    padding: 0 40px;
  }

  .data-center-lead__inner :deep(.data-center-cta-form-card) {
    margin-bottom: 68px;
  }

  @media (max-width: 1439px) {
    .data-center-lead__inner :deep(.data-center-cta-form-card) {
      margin-bottom: 40px;
    }
  }

  @media (max-width: 767px) {
    .data-center-lead {
      padding-bottom: 56px;
    }

    .data-center-lead__inner {
      padding: 0 16px;
    }
  }
</style>
