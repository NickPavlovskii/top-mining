<template>
  <div class="consulting-construction-form-card">
    <div class="consulting-construction-form-card__title">
      <template
        v-for="(line, index) in form.titleLines"
        :key="`${form.id}-title-${index}`"
      >
        <br v-if="index > 0">
        {{ line }}
      </template>
    </div>

    <form
      class="consulting-construction-form-card__form"
      @submit.prevent="onSubmit"
    >
      <div class="consulting-construction-form-card__fields">
        <label
          v-for="field in form.fields"
          :key="`${form.id}-${field.name}`"
          class="consulting-construction-form-card__field"
        >
          <span class="consulting-construction-form-card__visually-hidden">
            {{ field.placeholder }}
          </span>
          <input
            v-model="values[field.name]"
            class="consulting-construction-form-card__input"
            type="text"
            :name="field.name"
            :placeholder="field.placeholder"
            :required="field.required"
            :autocomplete="field.autocomplete"
          >
        </label>
      </div>

      <label class="consulting-construction-form-card__honeypot">
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
        class="consulting-construction-form-card__submit"
        :disabled="status === 'loading'"
      >
        <span>{{ copy.submitLabel }}</span>
        <consulting-diagonal-arrow-icon />
      </button>

      <top-mining-form-status
        :status="status"
        :message="feedback"
      />

      <div class="consulting-construction-form-card__privacy">
        <label class="consulting-construction-form-card__privacy-label">
          <input
            v-model="privacyAccepted"
            type="checkbox"
            class="consulting-construction-form-card__privacy-check"
            required
          >
          <span>{{ copy.privacyPrefix }}</span>
        </label>
        <nuxt-link
          class="consulting-construction-form-card__privacy-link"
          target="_blank"
          :to="copy.privacyHref"
        >
          {{ copy.privacyLinkLabel }}
        </nuxt-link>
      </div>
    </form>
  </div>
</template>

<script setup lang="ts">
  import type { ConsultingConstructionForm } from '~/common/modules/top-mining/consulting/construction-forms'

  const props = defineProps<{
    form: ConsultingConstructionForm
  }>()

  const { constructionForms: copy } = useConsultingPage()
  const { t } = useT()

  const values = reactive<Record<string, string>>(
    Object.fromEntries(props.form.fields.map(field => [field.name, ''])),
  )
  const honeypot = ref('')
  const privacyAccepted = ref(true)
  const {
    status,
    message: feedback,
    submit: submitLead,
  } = useSubmitLead(`consulting-construction-${props.form.id}`)

  async function onSubmit() {
    if (honeypot.value) {
      return
    }

    if (!privacyAccepted.value) {
      status.value = 'error'
      feedback.value = t('leads.privacyRequired')
      return
    }

    const name = String(values['your-name'] || '').trim()
    const contact = String(values['your-telegram'] || '').trim()
    const fields = Object.fromEntries(
      Object.entries(values).filter(
        ([key]) => key !== 'your-name' && key !== 'your-telegram',
      ),
    )

    const ok = await submitLead({
      source: `consulting-construction-${props.form.id}`,
      name,
      contact,
      fields,
      website: honeypot.value,
    })

    if (ok) {
      for (const key of Object.keys(values)) {
        values[key] = ''
      }
    }
  }
</script>

<style scoped>
  .consulting-construction-form-card {
    flex: 1 1 calc(50% - 10px);
    width: auto;
    min-width: 0;
    height: fit-content;
    padding: 40px;
    border-radius: 40px;
    background: var(--tm-off-white);
    box-sizing: border-box;
  }

  .consulting-construction-form-card__title {
    margin-bottom: 20px;
    color: var(--tm-page-bg);
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 18px;
    font-weight: 400;
    line-height: 26px;
    text-align: left;
  }

  .consulting-construction-form-card__form {
    position: relative;
  }

  .consulting-construction-form-card__fields {
    display: flex;
    flex-direction: column;
    gap: 10px;
  }

  .consulting-construction-form-card__field {
    display: block;
  }

  .consulting-construction-form-card__input {
    box-sizing: border-box;
    width: 100%;
    padding: 16px;
    border: 1px solid #d3d3d3;
    border-radius: 32px;
    background: transparent;
    color: var(--tm-text-soft);
    font-family: 'Mulish', 'Segoe UI', system-ui, sans-serif;
    font-size: 18px;
    font-weight: 400;
    line-height: 24px;
    outline: none;
  }

  .consulting-construction-form-card__input::placeholder {
    color: var(--tm-text-soft);
  }

  .consulting-construction-form-card__input:focus-visible {
    border-color: #999;
  }

  .consulting-construction-form-card__honeypot {
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

  .consulting-construction-form-card__submit {
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

  .consulting-construction-form-card__submit:hover {
    background: transparent;
    color: var(--tm-page-bg);
  }

  .consulting-construction-form-card__submit:hover :deep(svg path) {
    stroke: var(--tm-page-bg);
  }

  .consulting-construction-form-card__submit :deep(svg) {
    width: 16px;
    height: 16px;
    flex-shrink: 0;
  }

  .consulting-construction-form-card__submit :deep(svg path) {
    stroke: #fff;
  }

  .consulting-construction-form-card__privacy {
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

  .consulting-construction-form-card__privacy-label {
    display: inline-flex;
    align-items: center;
    gap: 6px;
    cursor: pointer;
  }

  .consulting-construction-form-card__privacy-check {
    appearance: none;
    flex-shrink: 0;
    width: 16px;
    height: 16px;
    margin: 0;
    border: 1px solid var(--tm-orange-accent-deep);
    border-radius: 3px;
    background: #fff;
    cursor: pointer;
  }

  .consulting-construction-form-card__privacy-check:checked {
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

  .consulting-construction-form-card__privacy-link {
    color: var(--tm-text-soft);
    text-decoration: underline;
  }

  .consulting-construction-form-card__privacy-link:hover,
  .consulting-construction-form-card__privacy-link:focus-visible {
    color: var(--tm-page-bg);
  }

  .consulting-construction-form-card__visually-hidden {
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
    .consulting-construction-form-card {
      padding: 20px;
      border-radius: 32px;
      background: #fff;
    }
  }

  @media (max-width: 1299px) {
    .consulting-construction-form-card__title {
      font-size: 14px;
      line-height: 20px;
      text-transform: uppercase;
    }

    .consulting-construction-form-card__input {
      font-size: 14px;
      line-height: 24px;
    }
  }

  @media (max-width: 767px) {
    .consulting-construction-form-card {
      flex: none;
      width: 100%;
      border-radius: 20px;
      padding: 20px 12px;
      background: #fff;
    }
  }
</style>
