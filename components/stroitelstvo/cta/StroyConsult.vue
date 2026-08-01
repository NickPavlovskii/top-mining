<template>
  <section
    class="stroy-consult"
    aria-labelledby="stroy-consult-title"
    :id="copy.id"
  >
    <div class="stroy-consult__inner">
      <stroy-cta-form-card
        title-id="stroy-consult-title"
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
  import { STROITELSTVO_DATA_CZENTROV_PAGE } from '~/common/modules/top-mining/stroitelstvo-data-czentrov-page'
  import type { StroyCtaFormSubmitPayload } from '~/common/modules/top-mining/stroitelstvo-data-czentrov-page'
  import StroyCtaFormCard from '~/components/stroitelstvo/shared/StroyCtaFormCard.vue'

  const copy = STROITELSTVO_DATA_CZENTROV_PAGE.consult

  function onSubmit(_payload: StroyCtaFormSubmitPayload) {
    // TODO: отправка заявки «Нужна консультация»
  }
</script>

<style scoped>
  .stroy-consult {
    position: relative;
    z-index: 20;
    background: var(--tm-ink);
    padding: 0 0 72px;
    color: var(--tm-white);
  }

  .stroy-consult__inner {
    box-sizing: border-box;
    max-width: 1720px;
    margin: 0 auto;
    padding: 0 40px;
  }

  @media (max-width: 767px) {
    .stroy-consult {
      padding-bottom: 56px;
    }

    .stroy-consult__inner {
      padding: 0 16px;
    }
  }
</style>
