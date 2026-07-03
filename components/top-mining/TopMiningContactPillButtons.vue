<template>
  <div class="tm-contact-pills">
    <top-mining-button
      preset="contact-pill"
      variant="primary"
      size="big"
      surface="dark"
      target="_blank"
      rel="noopener noreferrer"
      :title="TOP_MINING_CONTACT_TELEGRAM.handle"
      :href="TOP_MINING_CONTACT_TELEGRAM.href"
    >
      <template #prepend>
        <Icon
          name="mdi:telegram"
          class="top-mining-button__contact-pill-icon"
        />
      </template>
    </top-mining-button>

    <top-mining-button
      preset="contact-pill"
      class="top-mining-button--contact-pill-phone"
      variant="primary"
      size="big"
      surface="dark"
      :title="TOP_MINING_CONTACT_PHONE.label"
      :href="TOP_MINING_CONTACT_PHONE.href"
    >
      <template #prepend>
        <Icon
          name="mdi:phone"
          class="top-mining-button__contact-pill-icon"
        />
      </template>
    </top-mining-button>
  </div>
</template>

<script setup lang="ts">
  import {
    TOP_MINING_CONTACT_PHONE,
    TOP_MINING_CONTACT_TELEGRAM,
  } from '~/common/modules/top-mining/contact-section'
</script>

<style scoped>
  .tm-contact-pills {
    display: flex;
    flex-direction: column;
    gap: 10px;
    width: 100%;
  }
</style>
