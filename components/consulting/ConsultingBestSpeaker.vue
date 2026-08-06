<template>
  <section
    id="best-speker"
    class="consulting-best-speaker"
    aria-labelledby="consulting-best-speaker-title"
  >
    <div class="consulting-best-speaker__inner">
      <div
        class="consulting-best-speaker__image"
        aria-hidden="true"
      />

      <div class="consulting-best-speaker__content">
        <h2
          id="consulting-best-speaker-title"
          class="consulting-best-speaker__title"
        >
          {{ copy.title }}
        </h2>

        <p class="consulting-best-speaker__subtitle">
          {{ copy.subtitle }}
        </p>

        <p class="consulting-best-speaker__text">
          {{ copy.telegramLead }}
          <a
            class="consulting-best-speaker__link"
            target="_blank"
            rel="noopener noreferrer"
            :href="copy.telegramHref"
          >
            {{ copy.telegramLabel }}
          </a>
          {{ copy.telegramTail }}
        </p>

        <p class="consulting-best-speaker__text">
          {{ copy.anonymityNote }}
        </p>

        <form
          class="consulting-best-speaker__form"
          @submit.prevent="onSubmit"
        >
          <div class="consulting-best-speaker__fields">
            <label
              v-for="field in copy.fields"
              :key="field.name"
              :class="[
                'consulting-best-speaker__field',
                field.width === 'half' && 'consulting-best-speaker__field--half',
              ]"
            >
              <span class="consulting-best-speaker__visually-hidden">
                {{ field.placeholder }}
              </span>
              <input
                v-model="values[field.name]"
                class="consulting-best-speaker__input"
                type="text"
                :name="field.name"
                :placeholder="field.placeholder"
                :required="field.required"
                :autocomplete="field.autocomplete"
              >
            </label>

            <label class="consulting-best-speaker__field consulting-best-speaker__field--full">
              <span class="consulting-best-speaker__visually-hidden">
                {{ copy.textarea.placeholder }}
              </span>
              <textarea
                v-model="values[copy.textarea.name]"
                class="consulting-best-speaker__textarea"
                rows="4"
                :name="copy.textarea.name"
                :placeholder="copy.textarea.placeholder"
                :required="copy.textarea.required"
              />
            </label>

            <top-mining-file-upload
              v-model="resumeFile"
              v-model:error="fileError"
              v-bind="copy.fileUpload"
            />
          </div>

          <label class="consulting-best-speaker__honeypot">
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
            class="consulting-best-speaker__submit"
          >
            <span>{{ copy.submitLabel }}</span>
            <consulting-diagonal-arrow-icon />
          </button>

          <div class="consulting-best-speaker__privacy">
            <label class="consulting-best-speaker__privacy-label">
              <input
                v-model="privacyAccepted"
                type="checkbox"
                class="consulting-best-speaker__privacy-check"
                required
              >
              <span>{{ copy.privacyPrefix }}</span>
            </label>
            <nuxt-link
              class="consulting-best-speaker__privacy-link"
              target="_blank"
              :to="copy.privacyHref"
            >
              {{ copy.privacyLinkLabel }}
            </nuxt-link>
          </div>

          <top-mining-form-status
            :status="status"
            :message="feedback"
          />
        </form>
      </div>
    </div>
  </section>
</template>

<script setup lang="ts">
  const { bestSpeaker: copy } = useConsultingPage()
  const { t } = useT()
  const imageStyle = computed(() => `url(${copy.value.bestImgGirl})`)

  const values = reactive<Record<string, string>>(
    Object.fromEntries([
      ...copy.value.fields.map(field => [field.name, '']),
      [copy.value.textarea.name, ''],
    ]),
  )
  const honeypot = ref('')
  const privacyAccepted = ref(true)
  const resumeFile = ref<File | null>(null)
  const fileError = ref('')
  const {
    status,
    message: feedback,
    submit: submitLead,
  } = useSubmitLead('consulting-best-speaker')

  async function onSubmit() {
    if (honeypot.value || fileError.value) {
      return
    }

    if (!privacyAccepted.value) {
      status.value = 'error'
      feedback.value = t('leads.privacyRequired')
      return
    }

    const name = String(values['your-name'] || '').trim()
    const contact = String(values['your-telegram'] || '').trim()
    const message = String(values[copy.textarea.name] || '').trim()
    const fields: Record<string, string> = {}

    if (resumeFile.value?.name) {
      fields.resumeFileName = resumeFile.value.name
    }

    const ok = await submitLead({
      source: 'consulting-best-speaker',
      name,
      contact,
      message,
      fields,
      website: honeypot.value,
    })

    if (ok) {
      for (const key of Object.keys(values)) {
        values[key] = ''
      }
      resumeFile.value = null
    }
  }
</script>

<style scoped>
  .consulting-best-speaker {
    position: relative;
    z-index: 11;
    margin-top: -64px;
    margin-bottom: -100px;
    padding: 144px 0 244px;
    border-radius: 64px 64px 0 0;
    background: var(--tm-off-white);
    color: var(--tm-page-bg);
  }

  .consulting-best-speaker__inner {
    position: relative;
    z-index: 3;
    max-width: 1700px;
    margin: 0 auto;
    padding: 0 40px;
  }

  .consulting-best-speaker__image {
    position: absolute;
    bottom: 0;
    left: 40px;
    z-index: 2;
    width: 346px;
    height: 346px;
    border-radius: 40px;
    background-image: v-bind(imageStyle);
    background-repeat: no-repeat;
    background-position: top center;
    background-size: cover;
    box-shadow: 0 20px 80px 0 rgba(0, 0, 0, 0.05);
    pointer-events: none;
  }

  .consulting-best-speaker__content {
    width: 100%;
    max-width: 1000px;
    margin-left: auto;
  }

  .consulting-best-speaker__title {
    margin: 0 0 40px;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 48px;
    font-weight: 500;
    line-height: 64px;
    text-align: left;
    text-transform: uppercase;
  }

  .consulting-best-speaker__subtitle {
    margin: 0 0 40px;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 28px;
    font-weight: 400;
    line-height: 34px;
    text-align: left;
  }

  .consulting-best-speaker__text {
    margin: 0 0 10px;
    font-family: 'Mulish', 'Segoe UI', system-ui, sans-serif;
    font-size: 20px;
    font-weight: 600;
    line-height: 28px;
    text-align: left;
  }

  .consulting-best-speaker__link {
    color: var(--tm-orange-accent-deep);
    font-size: inherit;
    font-weight: inherit;
    line-height: inherit;
    text-decoration: none;
  }

  .consulting-best-speaker__link:hover,
  .consulting-best-speaker__link:focus-visible {
    color: var(--tm-orange-accent-light);
  }

  .consulting-best-speaker__form {
    position: relative;
  }

  .consulting-best-speaker__fields {
    display: flex;
    flex-wrap: wrap;
    gap: 20px;
    margin-top: 24px;
  }

  .consulting-best-speaker__field {
    display: block;
    width: 100%;
  }

  .consulting-best-speaker__field--half {
    width: calc(50% - 10px);
  }

  .consulting-best-speaker__input,
  .consulting-best-speaker__textarea {
    box-sizing: border-box;
    width: 100%;
    padding: 16px;
    border: 1px solid #d3d3d3;
    border-radius: 32px;
    background: var(--tm-off-white);
    color: var(--tm-page-bg);
    font-family: 'Mulish', 'Segoe UI', system-ui, sans-serif;
    font-size: 18px;
    font-weight: 400;
    line-height: 24px;
    outline: none;
  }

  .consulting-best-speaker__input::placeholder,
  .consulting-best-speaker__textarea::placeholder {
    color: var(--tm-text-soft);
  }

  .consulting-best-speaker__input:focus-visible,
  .consulting-best-speaker__textarea:focus-visible {
    border-color: #999;
  }

  .consulting-best-speaker__textarea {
    min-height: 120px;
    resize: vertical;
  }

  .consulting-best-speaker__honeypot {
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

  .consulting-best-speaker__submit {
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

  .consulting-best-speaker__submit:hover {
    background: transparent;
    color: var(--tm-page-bg);
  }

  .consulting-best-speaker__submit :deep(svg) {
    width: 16px;
    height: 16px;
    flex-shrink: 0;
  }

  .consulting-best-speaker__submit :deep(svg path) {
    stroke: currentColor;
  }

  .consulting-best-speaker__privacy {
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

  .consulting-best-speaker__privacy-label {
    display: inline-flex;
    align-items: center;
    gap: 6px;
    cursor: pointer;
  }

  .consulting-best-speaker__privacy-check {
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

  .consulting-best-speaker__privacy-check:checked {
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

  .consulting-best-speaker__privacy-link {
    color: var(--tm-text-soft);
    font-size: 12px;
    text-decoration: underline;
  }

  .consulting-best-speaker__visually-hidden {
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

  @media (min-width: 1401px) {
    .consulting-best-speaker__inner {
      min-height: 346px;
      padding: 0 40px;
    }

    .consulting-best-speaker__content {
      max-width: 1000px;
      padding-left: 40px;
    }

    .consulting-best-speaker__title {
      font-size: 48px;
      line-height: 64px;
    }

    .consulting-best-speaker__subtitle {
      font-size: 28px;
      line-height: 34px;
    }

    .consulting-best-speaker__text {
      font-size: 20px;
      line-height: 28px;
    }

    .consulting-best-speaker__input,
    .consulting-best-speaker__textarea {
      font-size: 18px;
      line-height: 24px;
    }

    .consulting-best-speaker__submit {
      font-size: 16px;
      line-height: 22px;
    }
  }

  @media (max-width: 1400px) {
    .consulting-best-speaker {
      margin-top: -40px;
      margin-bottom: 0;
      padding: 88px 0 120px;
      border-radius: 32px 32px 0 0;
    }

    .consulting-best-speaker__content {
      max-width: 410px;
      padding-left: 0;
    }

    .consulting-best-speaker__image {
      left: 10px;
      width: 240px;
      height: 240px;
      border-radius: 24px;
      background-size: 100%;
    }

    .consulting-best-speaker__title {
      margin-bottom: 24px;
      font-size: 32px;
      line-height: 40px;
    }

    .consulting-best-speaker__subtitle {
      margin-bottom: 24px;
      font-size: 20px;
      line-height: 28px;
    }

    .consulting-best-speaker__text {
      margin-bottom: 12px;
      font-size: 16px;
      line-height: 24px;
    }

    .consulting-best-speaker__textarea {
      font-size: 16px;
    }

    .consulting-best-speaker__field--half {
      width: 100%;
    }

    .consulting-best-speaker__fields {
      gap: 12px;
    }
  }

  @media (max-width: 1200px) {
    .consulting-best-speaker__content {
      max-width: 760px;
    }
  }

  @media (max-width: 670px) {
    .consulting-best-speaker {
      padding: 40px 0 68px;
    }

    .consulting-best-speaker__inner {
      padding: 0 16px;
    }

    .consulting-best-speaker__content {
      max-width: 100%;
      padding-left: 0;
    }

    .consulting-best-speaker__title {
      max-width: 350px;
      margin-bottom: 200px;
      font-size: 20px;
      font-weight: 400;
      line-height: 28px;
    }

    .consulting-best-speaker__subtitle {
      margin-bottom: 10px;
      font-size: 11px;
      line-height: 20px;
    }

    .consulting-best-speaker__text {
      margin-bottom: 10px;
      font-size: 10px;
      line-height: 12.55px;
    }

    .consulting-best-speaker__image {
      top: 100px;
      bottom: auto;
      left: 10px;
      width: 160px;
      height: 160px;
    }

    .consulting-best-speaker__input,
    .consulting-best-speaker__textarea {
      border-radius: 24px;
      font-size: 14px;
    }
  }
</style>
