<template>
  <section
    class="stroy-models"
    aria-labelledby="stroy-models-title"
  >
    <div class="stroy-models__inner">
      <h2
        id="stroy-models-title"
        class="stroy-models__title"
      >
        {{ copy.title }}
      </h2>

      <div class="stroy-models__list">
        <article
          v-for="item in copy.items"
          :key="item.id"
          class="stroy-models__item"
        >
          <button
            type="button"
            class="stroy-models__header"
            :aria-expanded="openId === item.id"
            @click="toggle(item.id)"
          >
            <div class="stroy-models__header-main">
              <span class="stroy-models__label">{{ item.label }}</span>
              <span class="stroy-models__item-title">{{ item.title }}</span>
            </div>

            <div class="stroy-models__header-right">
              <div class="stroy-models__invested">
                {{ item.invested }}
              </div>
              <span
                class="stroy-models__arrow"
                aria-hidden="true"
              >↓</span>
              <div class="stroy-models__result">
                <b>{{ item.resultHighlight }}</b>
                {{ item.resultText }}
              </div>
            </div>

            <span
              :class="['stroy-models__toggle', { 'is-open': openId === item.id }]"
              aria-hidden="true"
            >
              <Icon name="mdi:chevron-down" />
            </span>
          </button>

          <top-mining-collapse
            variant="panel"
            :open="openId === item.id"
          >
            <template v-if="item.kind === 'grid'">
              <top-mining-compare-table
                :id="item.id"
                :headers="copy.scenarioLabels"
                :rows="
                  toCompareTableRows(copy.rowLabels, item.columns, {
                    accentLastRow: true,
                  })
                "
                :highlight-column="item.highlightColumn"
                :footnote="copy.calcFootnote"
              >
                <template #footer>
                  <stroy-calc-link :href="copy.calculatorHref" />
                </template>
              </top-mining-compare-table>

              <top-mining-button
                class="stroy-models__cta"
                preset="contact-pill"
                variant="primary"
                size="big"
                surface="dark"
                :title="copy.ctaLabel"
                :append-icon="arrowIcon"
                @click="onCta(item)"
              />
            </template>

            <template v-else-if="item.kind === 'dual'">
              <div class="stroy-models__dual">
                <div
                  v-for="table in item.miniTables"
                  :key="table.title"
                  class="stroy-models__mini"
                >
                  <h3 class="stroy-models__mini-title">
                    {{ table.title }}
                  </h3>
                  <div class="stroy-models__mini-grid">
                    <div class="stroy-models__mini-labels">
                      <div
                        v-for="row in table.rows"
                        :key="row.label"
                        class="stroy-models__mini-cell"
                      >
                        {{ row.label }}
                      </div>
                    </div>
                    <div class="stroy-models__mini-values">
                      <div
                        v-for="row in table.rows"
                        :key="`${table.title}-${row.value}`"
                        :class="[
                          'stroy-models__mini-cell',
                          row.accent && 'stroy-models__mini-cell--accent',
                        ]"
                      >
                        {{ row.value }}
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <div class="stroy-models__calc">
                <p>{{ copy.calcFootnote }}</p>
                <stroy-calc-link :href="copy.calculatorHref" />
              </div>

              <top-mining-button
                class="stroy-models__cta"
                preset="contact-pill"
                variant="primary"
                size="big"
                surface="dark"
                :title="copy.ctaLabel"
                :append-icon="arrowIcon"
                @click="onCta(item)"
              />
            </template>

            <template v-else>
              <div class="stroy-models__text-block">
                <p
                  v-for="(paragraph, index) in item.paragraphs"
                  :key="`${item.id}-p-${index}`"
                  v-html="paragraph.html"
                />
              </div>

              <form
                class="stroy-models__form"
                @submit.prevent="onFormSubmit"
              >
                <div class="stroy-models__form-row">
                  <top-mining-input
                    v-model="phone"
                    type="tel"
                    name="your-telegram"
                    autocomplete="tel"
                    inputmode="tel"
                    required
                    :placeholder="copy.phonePlaceholder"
                    :accessible-label="copy.phonePlaceholder"
                  />
                  <top-mining-button
                    class="stroy-models__form-cta"
                    preset="contact-pill"
                    variant="primary"
                    size="big"
                    surface="dark"
                    type="submit"
                    :title="copy.formSubmitLabel"
                    :append-icon="arrowIcon"
                  />
                </div>

                <label class="stroy-models__honeypot">
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
              </form>
            </template>
          </top-mining-collapse>
        </article>
      </div>
    </div>

    <stroy-business-model-modal
      v-model:open="isModalOpen"
      :model="activeModel"
    />
  </section>
</template>

<script setup lang="ts">
  import arrowIcon from '~/assets/images/articles/arrow-up-right.png'
  import {
    STROITELSTVO_DATA_CZENTROV_PAGE,
    type StroyBusinessModelItem,
  } from '~/common/modules/top-mining/stroitelstvo-data-czentrov-page'
  import { toCompareTableRows } from '~/common/modules/top-mining/compare-table'
  import TopMiningButton from '~/components/global/buttons/TopMiningButton.vue'
  import TopMiningCollapse from '~/components/global/disclosure/TopMiningCollapse.vue'
  import TopMiningCompareTable from '~/components/global/tables/TopMiningCompareTable.vue'
  import TopMiningInput from '~/components/global/forms/TopMiningInput.vue'
  import TopMiningPrivacyConsent from '~/components/global/forms/TopMiningPrivacyConsent.vue'
  import StroyBusinessModelModal from '~/components/stroitelstvo/models/StroyBusinessModelModal.vue'
  import StroyCalcLink from '~/components/stroitelstvo/shared/StroyCalcLink.vue'

  const copy = STROITELSTVO_DATA_CZENTROV_PAGE.models
  const openId = ref<string | null>(copy.items[0]?.id ?? null)
  const phone = ref('')
  const honeypot = ref('')
  const privacyAccepted = ref(true)
  const isModalOpen = ref(false)
  const activeModel = ref<StroyBusinessModelItem | null>(null)

  function toggle(id: string) {
    openId.value = openId.value === id ? null : id
  }

  function onCta(item: StroyBusinessModelItem) {
    activeModel.value = item
    isModalOpen.value = true
  }

  function onFormSubmit() {
    if (honeypot.value || !privacyAccepted.value) {
      return
    }

    // TODO: отправка заявки бизнес-модели №2
  }
</script>

<style scoped>
  .stroy-models {
    background: var(--tm-ink);
    padding: 0 0 72px;
    color: var(--tm-white);
  }

  .stroy-models__inner {
    box-sizing: border-box;
    max-width: 1720px;
    margin: 0 auto;
    padding: 0 40px;
  }

  .stroy-models__title {
    margin: 0 0 32px;
    max-width: 1100px;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(22px, 2.8vw, 36px);
    font-weight: 500;
    line-height: 1.25;
    text-transform: uppercase;
  }

  .stroy-models__list {
    display: flex;
    flex-direction: column;
    gap: 16px;
  }

  .stroy-models__item {
    display: flex;
    flex-direction: column;
  }

  .stroy-models__header {
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 53px;
    width: 100%;
    padding: 40px;
    border: 1px solid rgba(247, 247, 247, 0.15);
    border-radius: 40px;
    background: rgba(247, 247, 247, 0.06);
    color: inherit;
    text-align: left;
    cursor: pointer;
  }

  .stroy-models__header-main {
    display: flex;
    flex-direction: column;
    gap: 10px;
    min-width: 0;
    flex: 1 1 420px;
  }

  .stroy-models__label {
    color: #f6f6f6;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 18px;
    font-weight: 500;
    line-height: 1.3;
  }

  .stroy-models__item-title {
    color: #ff741f;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(16px, 1.5vw, 22px);
    font-weight: 500;
    line-height: 1.3;
    text-transform: uppercase;
  }

  .stroy-models__header-right {
    display: flex;
    flex-direction: column;
    gap: 8px;
    flex: 0 1 360px;
    min-width: 0;
  }

  .stroy-models__invested {
    color: #f6f6f6;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 18px;
    font-weight: 500;
  }

  .stroy-models__arrow {
    color: rgba(246, 246, 246, 0.7);
    font-size: 14px;
    line-height: 1;
  }

  .stroy-models__result {
    color: #757575;
    font-family: Mulish, 'Segoe UI', system-ui, sans-serif;
    font-size: 16px;
    line-height: 22px;
  }

  .stroy-models__result b {
    color: #f6f6f6;
    font-weight: 700;
  }

  .stroy-models__toggle {
    display: inline-flex;
    flex: 0 0 auto;
    align-items: center;
    justify-content: center;
    width: 48px;
    height: 48px;
    border-radius: 50%;
    background: #ff741f;
    color: #fff;
    font-size: 28px;
  }

  .stroy-models__toggle :deep(svg) {
    transition: transform 0.45s cubic-bezier(0.22, 1, 0.36, 1);
  }

  .stroy-models__toggle.is-open :deep(svg) {
    transform: rotate(180deg);
  }

  @media (prefers-reduced-motion: reduce) {
    .stroy-models__toggle :deep(svg) {
      transition: none;
    }
  }

  .stroy-models__cta {
    margin-top: 24px;
  }

  .stroy-models__calc {
    display: flex;
    align-items: flex-start;
    justify-content: space-between;
    gap: 16px;
    margin-top: 20px;
  }

  .stroy-models__calc p {
    margin: 0;
    max-width: 920px;
    color: #757575;
    font-family: Mulish, 'Segoe UI', system-ui, sans-serif;
    font-size: 14px;
    line-height: 20px;
  }

  .stroy-models__form-row :deep(
    .stroy-models__form-cta.top-mining-button.q-btn.top-mining-button--contact-pill
  ) {
    flex: 0 0 auto;
    width: auto;
    min-width: 180px;
  }

  .stroy-models__form-row :deep(
    .stroy-models__form-cta .top-mining-button__inner
  ) {
    justify-content: center;
  }

  .stroy-models__dual {
    display: grid;
    grid-template-columns: repeat(2, minmax(0, 1fr));
    gap: 16px;
  }

  .stroy-models__mini {
    padding: 20px;
    border-radius: 24px;
    background: #1f1f1f;
  }

  .stroy-models__mini-title {
    margin: 0 0 16px;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 18px;
    font-weight: 500;
  }

  .stroy-models__mini-grid {
    display: grid;
    grid-template-columns: 1.4fr 1fr;
    gap: 8px;
  }

  .stroy-models__mini-cell {
    display: flex;
    align-items: center;
    min-height: 48px;
    padding: 8px 0;
    border-bottom: 1px solid rgba(247, 247, 247, 0.08);
    color: #757575;
    font-family: Mulish, 'Segoe UI', system-ui, sans-serif;
    font-size: 15px;
    line-height: 20px;
  }

  .stroy-models__mini-values .stroy-models__mini-cell {
    color: #f6f6f6;
    justify-content: flex-end;
    text-align: right;
  }

  .stroy-models__mini-cell--accent {
    color: #ff741f;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-weight: 500;
  }

  .stroy-models__text-block {
    display: flex;
    flex-direction: column;
    gap: 14px;
    max-width: 920px;
    margin-bottom: 24px;
    color: rgba(246, 246, 246, 0.88);
    font-family: Mulish, 'Segoe UI', system-ui, sans-serif;
    font-size: 18px;
    line-height: 28px;
  }

  .stroy-models__text-block p {
    margin: 0;
  }

  .stroy-models__text-block :deep(a) {
    color: #ff741f;
  }

  .stroy-models__text-block :deep(b) {
    color: #f6f6f6;
  }

  .stroy-models__form {
    max-width: 520px;
  }

  .stroy-models__form-row {
    display: flex;
    gap: 16px;
  }

  .stroy-models__form-row :deep(.top-mining-input) {
    flex: 1 1 auto;
    min-width: 0;
  }

  .stroy-models__honeypot {
    position: absolute;
    width: 1px;
    height: 1px;
    overflow: hidden;
    clip: rect(0 0 0 0);
  }

  .stroy-models__form :deep(.top-mining-privacy-consent) {
    margin-top: 14px;
  }

  @media (max-width: 1439px) {
    .stroy-models__header {
      gap: 55px;
      padding: 20px;
      border-radius: 25px;
    }
  }

  @media (max-width: 1099px) {
    .stroy-models__header {
      flex-wrap: wrap;
      gap: 16px;
    }

    .stroy-models__header-main,
    .stroy-models__header-right {
      flex: 1 1 100%;
    }

    .stroy-models__toggle {
      margin-left: auto;
    }

    .stroy-models__dual {
      grid-template-columns: 1fr;
    }
  }

  @media (max-width: 767px) {
    .stroy-models__inner {
      padding: 0 16px;
    }

    .stroy-models__form-row {
      flex-direction: column;
    }

    .stroy-models__calc {
      flex-direction: column;
    }
  }
</style>
