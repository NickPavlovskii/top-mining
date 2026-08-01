<template>
  <section
    class="data-center-consult"
    aria-labelledby="data-center-consult-title"
    :id="copy.id"
  >
    <div class="data-center-consult__inner">
      <data-center-cta-form-card
        title-id="data-center-consult-title"
        variant="compact"
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

  const copy = DATA_CENTER_CONSTRUCTION_PAGE.consult

  function onSubmit(_payload: DataCenterCtaFormSubmitPayload) {
    // TODO: отправка заявки «Нужна консультация»
  }
</script>

<style scoped>
  .data-center-consult {
    position: relative;
    z-index: 20;
    background: var(--tm-ink);
    padding: 0 0 72px;
    color: var(--tm-white);
  }

  .data-center-consult__inner {
    box-sizing: border-box;
    max-width: 1720px;
    margin: 0 auto;
    padding: 0 40px;
  }

  @media (max-width: 767px) {
    .data-center-consult {
      padding-bottom: 56px;
    }

    .data-center-consult__inner {
      padding: 0 16px;
    }
  }
</style>
