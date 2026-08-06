<template>
  <article class="podbor-lead-form">
    <h3 class="podbor-lead-form__title">
      {{ offer.formTitle }}
    </h3>

    <form
      class="podbor-lead-form__form"
      @submit.prevent="onSubmit"
    >
      <div class="podbor-lead-form__row">
        <label class="podbor-lead-form__field">
          <span class="podbor-lead-form__visually-hidden">Телефон</span>
          <input
            v-model="phone"
            type="tel"
            class="podbor-lead-form__input"
            autocomplete="tel"
            inputmode="tel"
            :placeholder="offer.phonePlaceholder"
            required
          >
        </label>

        <button
          type="submit"
          class="podbor-lead-form__submit"
        >
          <span>{{ offer.submitLabel }}</span>
          <img
            class="podbor-lead-form__submit-icon"
            alt=""
            aria-hidden="true"
            :src="arrowIcon"
          >
        </button>
      </div>

      <label class="podbor-lead-form__privacy">
        <input
          v-model="privacyAccepted"
          type="checkbox"
          class="podbor-lead-form__privacy-check"
          required
        >
        <span class="podbor-lead-form__privacy-text">
          {{ offer.privacyPrefix }}
          <nuxt-link
            class="podbor-lead-form__privacy-link"
            :to="offer.privacyHref"
          >
            {{ offer.privacyLinkLabel }}
          </nuxt-link>
        </span>
      </label>

      <top-mining-form-status
        tone="dark"
        :status="status"
        :message="feedback"
      />
    </form>
  </article>
</template>

<script setup lang="ts">
  import arrowIcon from '~/assets/images/articles/arrow-up-right.png'

  const { offer } = usePodborMiningHotelPage()
  const { t } = useT()

  const phone = ref('')
  const privacyAccepted = ref(true)
  const {
    status,
    message: feedback,
    submit: submitLead,
  } = useSubmitLead('podbor-lead-form')

  async function onSubmit() {
    if (!privacyAccepted.value) {
      status.value = 'error'
      feedback.value = t('leads.privacyRequired')
      return
    }

    const ok = await submitLead({
      source: 'podbor-lead-form',
      contact: phone.value,
    })

    if (ok) {
      phone.value = ''
    }
  }
</script>

<style scoped>
  .podbor-lead-form {
    background: #1f1f1f;
    border-radius: 32px;
    padding: 40px;
    box-sizing: border-box;
  }

  .podbor-lead-form__title {
    margin: 0 0 40px;
    color: var(--tm-off-white);
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 22px;
    font-weight: 400;
    line-height: 30px;
  }

  .podbor-lead-form__form {
    display: flex;
    flex-direction: column;
    gap: 16px;
  }

  .podbor-lead-form__row {
    display: flex;
    align-items: stretch;
    gap: 24px;
    max-width: 616px;
  }

  .podbor-lead-form__field {
    display: block;
    min-width: 0;
    flex: 1 1 50%;
  }

  .podbor-lead-form__input {
    width: 100%;
    box-sizing: border-box;
    height: 56px;
    padding: 0 24px;
    border: 1px solid #5c5c5c;
    border-radius: 999px;
    background: transparent;
    color: var(--tm-white);
    font-size: 16px;
    line-height: 1.2;
    outline: none;
  }

  .podbor-lead-form__input::placeholder {
    color: rgba(255, 255, 255, 0.45);
  }

  .podbor-lead-form__input:focus {
    border-color: rgba(255, 255, 255, 0.7);
  }

  .podbor-lead-form__submit {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    gap: 10px;
    flex: 1 1 50%;
    min-width: 0;
    height: 56px;
    padding: 0 24px;
    border: 0;
    border-radius: 999px;
    background: var(--tm-orange);
    color: var(--tm-white);
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 14px;
    font-weight: 500;
    letter-spacing: 0.04em;
    text-transform: uppercase;
    cursor: pointer;
    white-space: nowrap;
  }

  .podbor-lead-form__submit:hover,
  .podbor-lead-form__submit:focus-visible {
    background: var(--tm-orange-hover, var(--tm-orange));
  }

  .podbor-lead-form__submit-icon {
    width: 14px;
    height: 14px;
    object-fit: contain;
  }

  .podbor-lead-form__privacy {
    display: flex;
    align-items: flex-start;
    gap: 10px;
    cursor: pointer;
  }

  .podbor-lead-form__privacy-check {
    flex-shrink: 0;
    width: 16px;
    height: 16px;
    margin-top: 2px;
    accent-color: var(--tm-orange);
  }

  .podbor-lead-form__privacy-text {
    color: rgba(255, 255, 255, 0.55);
    font-size: 12px;
    line-height: 1.4;
  }

  .podbor-lead-form__privacy-link {
    color: inherit;
    text-decoration: underline;
    text-underline-offset: 2px;
  }

  .podbor-lead-form__privacy-link:hover,
  .podbor-lead-form__privacy-link:focus-visible {
    color: var(--tm-white);
  }

  .podbor-lead-form__visually-hidden {
    position: absolute;
    width: 1px;
    height: 1px;
    padding: 0;
    margin: -1px;
    overflow: hidden;
    clip: rect(0, 0, 0, 0);
    white-space: nowrap;
    border: 0;
  }

  @media (max-width: 1600px) {
    .podbor-lead-form {
      padding: 30px;
    }

    .podbor-lead-form__title {
      margin-bottom: 30px;
      max-width: 635px;
    }
  }

  @media (max-width: 1299px) {
    .podbor-lead-form {
      height: 100%;
      padding: 24px;
    }

    .podbor-lead-form__title {
      margin-bottom: 20px;
      font-size: 18px;
      line-height: 26px;
    }

    .podbor-lead-form__row {
      flex-direction: column;
      gap: 12px;
      max-width: 100%;
    }

    .podbor-lead-form__field,
    .podbor-lead-form__submit {
      flex: 1 1 auto;
      width: 100%;
    }
  }

  @media (max-width: 767px) {
    .podbor-lead-form {
      border-radius: 16px;
      padding: 16px;
    }

    .podbor-lead-form__title {
      margin-bottom: 20px;
      font-size: 14px;
      line-height: 20px;
    }
  }
</style>
