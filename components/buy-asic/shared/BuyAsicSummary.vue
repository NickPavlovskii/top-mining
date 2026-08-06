<template>
  <section
    class="buy-asic-summary"
    aria-labelledby="buy-asic-summary-title"
  >
    <div class="buy-asic-summary__inner">
      <h2
        :id="copy.titleId"
        class="buy-asic-summary__title"
      >
        {{ copy.title }}
      </h2>

      <div class="buy-asic-summary__panel">
        <top-mining-icon-list
          class="buy-asic-summary__list"
          :items="copy.items"
        />

        <div class="buy-asic-summary__note-wrap">
          <p class="buy-asic-summary__note">
            {{ copy.note }}
          </p>
        </div>

        <form
          class="buy-asic-summary__form"
          @submit.prevent="onSubmit"
        >
          <top-mining-input
            v-model="phone"
            type="tel"
            name="your-tel"
            autocomplete="tel"
            inputmode="tel"
            required
            :placeholder="copy.phonePlaceholder"
            :accessible-label="copy.phonePlaceholder"
          />

          <button
            type="submit"
            class="buy-asic-summary__submit"
          >
            <span>{{ copy.submitLabel }}</span>
            <img
              class="buy-asic-summary__submit-icon"
              alt=""
              aria-hidden="true"
              :src="arrowIcon"
            >
          </button>

          <label class="buy-asic-summary__honeypot">
            <span>{{ copy.honeypotLabel }}</span>
            <input
              v-model="honeypot"
              type="text"
              name="email"
              tabindex="-1"
              autocomplete="off"
            >
          </label>

          <top-mining-privacy-consent
            v-model="privacyAccepted"
            :prefix="copy.privacyPrefix"
            :privacy-link-label="copy.privacyLinkLabel"
            :privacy-href="copy.privacyHref"
          />

          <top-mining-form-status
            tone="dark"
            :status="status"
            :message="feedback"
          />
        </form>
      </div>
    </div>
  </section>
</template>

<script setup lang="ts">
  import arrowIcon from '~/assets/images/articles/arrow-up-right.png'
  import { BUY_ASIC_SUMMARY } from '~/common/modules/top-mining/buy-asic/summary'
  import { LEADS_UI } from '~/common/modules/top-mining/layout/leads'
  import TopMiningIconList from '~/components/global/lists/TopMiningIconList.vue'
  import TopMiningInput from '~/components/global/forms/TopMiningInput.vue'
  import TopMiningPrivacyConsent from '~/components/global/forms/TopMiningPrivacyConsent.vue'

  const copy = BUY_ASIC_SUMMARY

  const phone = ref('')
  const privacyAccepted = ref(true)
  const honeypot = ref('')
  const {
    status,
    message: feedback,
    submit: submitLead,
  } = useSubmitLead('buy-asic-summary')

  async function onSubmit() {
    if (honeypot.value) {
      return
    }

    if (!privacyAccepted.value) {
      status.value = 'error'
      feedback.value = LEADS_UI.privacyRequired
      return
    }

    const ok = await submitLead({
      source: 'buy-asic-summary',
      contact: phone.value,
      website: honeypot.value,
    })

    if (ok) {
      phone.value = ''
    }
  }
</script>

<style scoped>
  .buy-asic-summary {
    background: var(--tm-ink);
    color: #fff;
    padding: 24px 0 88px;
  }

  .buy-asic-summary__inner {
    box-sizing: border-box;
    max-width: 1100px;
    margin: 0 auto;
    padding: 0 40px;
  }

  .buy-asic-summary__title {
    margin: 0 0 24px;
    font-family: 'Unbounded', sans-serif;
    font-size: clamp(28px, 4vw, 40px);
    font-weight: 600;
    line-height: 1.1;
    letter-spacing: 0.02em;
    text-transform: uppercase;
    color: #fff;
  }

  .buy-asic-summary__panel {
    box-sizing: border-box;
    padding: 36px 40px 40px;
    border-radius: 40px;
    background: #1f1f1f;
  }

  .buy-asic-summary__list {
    margin-bottom: 8px;
  }

  .buy-asic-summary__list :deep(.top-mining-icon-list__item) {
    font-size: 18px;
    line-height: 1.35;
  }

  .buy-asic-summary__note-wrap {
    margin: 28px 0 32px;
    padding: 20px 0;
    border-top: 1px solid rgb(255 255 255 / 12%);
    border-bottom: 1px solid rgb(255 255 255 / 12%);
  }

  .buy-asic-summary__note {
    margin: 0;
    max-width: 52ch;
    font-family: 'Mulish', 'Roboto', sans-serif;
    font-size: 15px;
    font-weight: 400;
    line-height: 1.45;
    color: #c8c8c8;
  }

  .buy-asic-summary__form {
    position: relative;
    display: flex;
    flex-direction: column;
    gap: 14px;
    max-width: 420px;
  }

  .buy-asic-summary__submit {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    gap: 10px;
    width: 100%;
    min-height: 56px;
    padding: 14px 24px;
    border: 0;
    border-radius: 999px;
    background: var(--tm-orange, #ff6418);
    color: #fff;
    font-family: 'Unbounded', sans-serif;
    font-size: 14px;
    font-weight: 600;
    letter-spacing: 0.04em;
    text-transform: uppercase;
    cursor: pointer;
    transition: background-color 0.2s ease;
  }

  .buy-asic-summary__submit:hover {
    background: var(--tm-orange-hover, #ff7a3a);
  }

  .buy-asic-summary__submit-icon {
    width: 18px;
    height: 18px;
    object-fit: contain;
    filter: brightness(0) invert(1);
  }

  .buy-asic-summary__honeypot {
    position: absolute;
    width: 1px;
    height: 1px;
    margin: -1px;
    padding: 0;
    overflow: hidden;
    clip: rect(0, 0, 0, 0);
    white-space: nowrap;
    border: 0;
  }

  @media (max-width: 900px) {
    .buy-asic-summary__panel {
      padding: 24px 20px 28px;
      border-radius: 24px;
    }

    .buy-asic-summary__list :deep(.top-mining-icon-list__item) {
      font-size: 15px;
    }

    .buy-asic-summary__note {
      font-size: 14px;
    }

    .buy-asic-summary__form {
      max-width: none;
    }
  }

  @media (max-width: 560px) {
    .buy-asic-summary__inner {
      padding: 0 16px;
    }

    .buy-asic-summary__title {
      font-size: 24px;
    }
  }
</style>
