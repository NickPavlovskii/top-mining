<template>
  <section
    id="black-ring"
    class="consulting-black-ring"
    aria-labelledby="consulting-black-ring-title"
  >
    <div
      class="consulting-black-ring__overlay"
      aria-hidden="true"
    />

    <div class="consulting-black-ring__inner">
      <div
        class="consulting-black-ring__image"
        aria-hidden="true"
      />

      <div class="consulting-black-ring__top">
        <h2
          id="consulting-black-ring-title"
          class="consulting-black-ring__title"
        >
          {{ copy.title }}
        </h2>

        <div class="consulting-black-ring__form-wrap">
          <form
            class="consulting-black-ring__form"
            @submit.prevent="onSubmit"
          >
            <div class="consulting-black-ring__fields">
              <label
                v-for="field in copy.fields"
                :key="field.name"
                :class="[
                  'consulting-black-ring__field',
                  field.width === 'half' && 'consulting-black-ring__field--half',
                ]"
              >
                <span class="consulting-black-ring__visually-hidden">
                  {{ field.placeholder }}
                </span>
                <input
                  v-model="values[field.name]"
                  class="consulting-black-ring__input"
                  type="text"
                  :name="field.name"
                  :placeholder="field.placeholder"
                  :required="field.required"
                  :autocomplete="field.autocomplete"
                >
              </label>
            </div>

            <label class="consulting-black-ring__honeypot">
              <span>{{ copy.honeypotLabel }}</span>
              <input
                v-model="honeypot"
                type="text"
                name="email"
                tabindex="-1"
                autocomplete="off"
              >
            </label>

            <button
              type="submit"
              class="consulting-black-ring__submit"
            >
              <span>{{ copy.submitLabel }}</span>
              <consulting-diagonal-arrow-icon />
            </button>

            <div class="consulting-black-ring__privacy">
              <label class="consulting-black-ring__privacy-label">
                <input
                  v-model="privacyAccepted"
                  type="checkbox"
                  class="consulting-black-ring__privacy-check"
                  required
                >
                <span>{{ copy.privacyPrefix }}</span>
              </label>
              <nuxt-link
                class="consulting-black-ring__privacy-link"
                target="_blank"
                :to="copy.privacyHref"
              >
                {{ copy.privacyLinkLabel }}
              </nuxt-link>
            </div>
          </form>

          <p class="consulting-black-ring__telegram">
            {{ copy.telegramLead }}
            <a
              class="consulting-black-ring__telegram-link"
              target="_blank"
              rel="noopener noreferrer"
              :href="copy.telegramHref"
            >
              {{ copy.telegramLabel }}
            </a>
          </p>
        </div>
      </div>

      <div class="consulting-black-ring__price">
        <p class="consulting-black-ring__price-label">
          {{ copy.priceLabel }}
        </p>
        <p class="consulting-black-ring__price-value">
          {{ copy.priceValue }}
        </p>
      </div>
    </div>
  </section>
</template>

<script setup lang="ts">
  import { CONSULTING_BLACK_RING } from '~/common/modules/top-mining/consulting/black-ring'

  const copy = CONSULTING_BLACK_RING
  const blackRingBgStyle = `url(${copy.blackRingBg})`
  const blackRingImgStyle = `url(${copy.blackRingImg})`

  const values = reactive<Record<string, string>>(
    Object.fromEntries(copy.fields.map(field => [field.name, ''])),
  )
  const honeypot = ref('')
  const privacyAccepted = ref(true)

  function onSubmit() {
    if (honeypot.value || !privacyAccepted.value) {
      return
    }

    // TODO: отправка заявки на размещение организации
  }
</script>

<style scoped>
  .consulting-black-ring {
    position: relative;
    z-index: 10;
    margin-top: -100px;
    padding: 144px 0 200px;
    border-radius: 64px 64px 0 0;
    background-color: #141414;
    background-image: v-bind(blackRingBgStyle);
    background-repeat: no-repeat;
    background-position: center;
    background-size: cover;
    box-shadow: 0 20px 80px 0 rgba(0, 0, 0, 0.05);
    color: #fff;
    overflow: hidden;
  }

  .consulting-black-ring__overlay {
    position: absolute;
    inset: 0;
    z-index: 1;
    background: linear-gradient(0deg, rgba(20, 20, 20, 0.6), rgba(20, 20, 20, 0.6));
  }

  .consulting-black-ring__inner {
    position: relative;
    z-index: 3;
    max-width: 1700px;
    margin: 0 auto;
    padding: 0 40px;
  }

  .consulting-black-ring__image {
    position: absolute;
    top: -68px;
    right: 0;
    z-index: 2;
    width: 869px;
    height: 646px;
    background-image: v-bind(blackRingImgStyle);
    background-repeat: no-repeat;
    background-position: top center;
    background-size: contain;
    pointer-events: none;
  }

  .consulting-black-ring__top {
    position: relative;
    z-index: 10;
    display: flex;
    justify-content: space-between;
    gap: 40px;
    margin-bottom: 54px;
  }

  .consulting-black-ring__title {
    flex: 0 1 705px;
    max-width: 705px;
    margin: 0;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 48px;
    font-weight: 500;
    line-height: 64px;
    text-align: left;
    text-transform: uppercase;
  }

  .consulting-black-ring__form-wrap {
    flex: 0 1 934px;
    max-width: 934px;
    width: 100%;
  }

  .consulting-black-ring__form {
    position: relative;
  }

  .consulting-black-ring__fields {
    display: flex;
    flex-wrap: wrap;
    gap: 20px;
  }

  .consulting-black-ring__field {
    display: block;
    width: 100%;
  }

  .consulting-black-ring__field--half {
    width: calc(50% - 10px);
  }

  .consulting-black-ring__input {
    box-sizing: border-box;
    width: 100%;
    padding: 16px;
    border: 1px solid #5c5c5c;
    border-radius: 32px;
    background: rgba(255, 255, 255, 0.02);
    backdrop-filter: blur(15px);
    color: #fff;
    font-family: 'Mulish', 'Segoe UI', system-ui, sans-serif;
    font-size: 18px;
    font-weight: 400;
    line-height: 24px;
    outline: none;
  }

  .consulting-black-ring__input::placeholder {
    color: var(--tm-text-soft);
  }

  .consulting-black-ring__input:focus-visible {
    border-color: #999;
  }

  .consulting-black-ring__honeypot {
    position: absolute;
    overflow: hidden;
    width: 1px;
    height: 1px;
    margin: -1px;
    padding: 0;
    border: 0;
    clip: rect(0, 0, 0, 0);
    white-space: nowrap;
  }

  .consulting-black-ring__submit {
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 16px;
    width: 100%;
    margin-top: 20px;
    padding: 16px 24px;
    border: 1px solid var(--tm-orange-accent-deep);
    border-radius: 32px;
    background: linear-gradient(
      94.62deg,
      var(--tm-orange-accent-light) 2.04%,
      var(--tm-orange-accent-deep) 49.92%
    );
    color: #fff;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 16px;
    font-weight: 400;
    line-height: 22px;
    text-transform: uppercase;
    cursor: pointer;
    transition:
      background 0.2s ease,
      color 0.2s ease;
  }

  .consulting-black-ring__submit:hover {
    background: transparent;
    color: #fff;
  }

  .consulting-black-ring__submit :deep(svg) {
    width: 16px;
    height: 16px;
    flex-shrink: 0;
  }

  .consulting-black-ring__submit :deep(svg path) {
    stroke: #fff;
  }

  .consulting-black-ring__privacy {
    display: flex;
    flex-wrap: wrap;
    align-items: baseline;
    gap: 4px;
    margin-top: 20px;
    color: var(--tm-text-soft);
    font-family: 'Mulish', 'Segoe UI', system-ui, sans-serif;
    font-size: 12px;
    font-weight: 300;
    line-height: 16px;
  }

  .consulting-black-ring__privacy-label {
    display: inline-flex;
    align-items: center;
    gap: 6px;
    cursor: pointer;
  }

  .consulting-black-ring__privacy-check {
    appearance: none;
    flex-shrink: 0;
    width: 16px;
    height: 16px;
    margin: 0;
    border: 1px solid var(--tm-orange-accent-deep);
    border-radius: 3px;
    background: transparent;
    cursor: pointer;
  }

  .consulting-black-ring__privacy-check:checked {
    border-color: var(--tm-orange-accent-deep);
    background:
      url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 12 10' fill='none'%3E%3Cpath d='M1 5.2L4.2 8.4L11 1.6' stroke='white' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'/%3E%3C/svg%3E")
      no-repeat center,
      linear-gradient(
        94.62deg,
        var(--tm-orange-accent-light) 2.04%,
        var(--tm-orange-accent-deep) 49.92%
      );
    background-size: 10px, auto;
  }

  .consulting-black-ring__privacy-link {
    color: var(--tm-text-soft);
    text-decoration: underline;
  }

  .consulting-black-ring__telegram {
    margin: 24px 0 0;
    color: #fff;
    font-family: 'Mulish', 'Segoe UI', system-ui, sans-serif;
    font-size: 20px;
    font-weight: 600;
    line-height: 28px;
    text-align: left;
  }

  .consulting-black-ring__telegram-link {
    color: var(--tm-orange-accent-deep);
    text-decoration: none;
  }

  .consulting-black-ring__telegram-link:hover,
  .consulting-black-ring__telegram-link:focus-visible {
    color: var(--tm-orange-accent-light);
  }

  .consulting-black-ring__price {
    position: relative;
    z-index: 10;
    margin-top: 50px;
    padding: 40px;
    border: 1px solid var(--tm-orange-accent-deep);
    border-radius: 64px;
  }

  .consulting-black-ring__price-label {
    margin: 0 0 10px;
    color: #fff;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 18px;
    font-weight: 400;
    line-height: 26px;
    text-transform: uppercase;
  }

  .consulting-black-ring__price-value {
    margin: 0;
    background: linear-gradient(
      94.62deg,
      var(--tm-orange-accent-deep) 2.06%,
      var(--tm-orange-accent-light) 93.25%
    );
    background-clip: text;
    -webkit-background-clip: text;
    color: transparent;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 40px;
    font-weight: 500;
    line-height: 50px;
    text-transform: uppercase;
  }

  .consulting-black-ring__visually-hidden {
    position: absolute;
    overflow: hidden;
    width: 1px;
    height: 1px;
    margin: -1px;
    padding: 0;
    border: 0;
    clip: rect(0, 0, 0, 0);
    white-space: nowrap;
  }

  @media (max-width: 1400px) {
    .consulting-black-ring {
      padding: 88px 0 120px;
      border-radius: 32px 32px 0 0;
    }

    .consulting-black-ring__title {
      flex: 0 1 auto;
      max-width: none;
      width: fit-content;
      margin-right: 40px;
      font-size: 24px;
      line-height: 29.76px;
    }

    .consulting-black-ring__form-wrap {
      flex: 0 1 780px;
      max-width: 780px;
    }

    .consulting-black-ring__image {
      width: 430px;
      height: 320px;
      background-size: cover;
    }

    .consulting-black-ring__price {
      margin-top: 40px;
      padding: 20px;
      border-radius: 24px;
    }
  }

  @media (max-width: 1299px) {
    .consulting-black-ring__inner {
      padding: 0 24px;
    }

    .consulting-black-ring__fields {
      gap: 10px;
    }

    .consulting-black-ring__field--half {
      width: 100%;
    }

    .consulting-black-ring__telegram {
      font-size: 12px;
      line-height: 12.55px;
    }
  }

  @media (max-width: 1439px) {
    .consulting-black-ring__price {
      margin-top: 20px;
    }

    .consulting-black-ring__price-value {
      color: #fff;
      background: none;
      -webkit-text-fill-color: #fff;
    }
  }

  @media (max-width: 767px) {
    .consulting-black-ring {
      padding: 40px 0 100px;
      background-image: none;
      background-color: #171717;
    }

    .consulting-black-ring__inner {
      padding: 0 16px;
    }

    .consulting-black-ring__top {
      flex-direction: column;
      gap: 0;
      margin-bottom: 15px;
    }

    .consulting-black-ring__title {
      width: 100%;
      margin: 0 0 20px;
      font-size: 20px;
      font-weight: 400;
      line-height: 28px;
    }

    .consulting-black-ring__form-wrap {
      max-width: none;
    }

    .consulting-black-ring__image {
      top: 31px;
      width: 300px;
      height: 300px;
      transform: rotate(671deg);
      background-size: 100%;
    }

    .consulting-black-ring__telegram {
      margin-top: 20px;
      font-size: 10px;
      font-weight: 600;
      line-height: 12.55px;
    }

    .consulting-black-ring__price-label {
      margin-bottom: 10px;
      color: #d3d3d3;
      font-size: 14px;
      line-height: 20px;
    }

    .consulting-black-ring__price-value {
      font-size: 24px;
      line-height: 29.76px;
    }
  }
</style>
