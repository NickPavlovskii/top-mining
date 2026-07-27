<template>
  <section
    class="podbor-factors"
    aria-labelledby="podbor-factors-title"
  >
    <div class="podbor-factors__inner">
      <h2
        id="podbor-factors-title"
        class="podbor-factors__title"
      >
        {{ factors.titleLead }}
        <br>
        {{ factors.titleRest }}
      </h2>

      <div class="podbor-factors__points">
        <div
          v-for="factor in factors.factors"
          class="podbor-factors__item"
          :key="factor.id"
        >
          <div class="podbor-factors__number">
            {{ factor.number }}
          </div>
          <div class="podbor-factors__label">
            {{ factor.title }}
          </div>
        </div>
      </div>

      <div class="podbor-factors__details">
        <article
          v-for="detail in factors.details"
          :key="detail.id"
          class="podbor-factor-card"
        >
          <div class="podbor-factor-card__number">
            {{ detail.number }}
          </div>

          <h3 class="podbor-factor-card__title">
            {{ detail.title }}
          </h3>

          <p
            v-if="detail.infoBanner"
            class="podbor-factor-card__info"
          >
            <Icon
              name="mdi:information"
              class="podbor-factor-card__info-icon"
              aria-hidden="true"
            />
            <span>{{ detail.infoBanner }}</span>
          </p>

          <div
            v-if="detail.caseStudy"
            class="podbor-factor-card__case-wrap"
          >
            <div class="podbor-factor-card__questions">
              <p
                v-if="detail.lead"
                class="podbor-factor-card__bigi"
              >
                {{ detail.lead }}
              </p>

              <div
                v-if="detail.items?.length"
                class="podbor-factor-card__dop-wrap"
              >
                <p
                  v-for="(item, index) in detail.items"
                  :key="`${detail.id}-item-${index}`"
                >
                  {{ item }}
                </p>
              </div>
            </div>

            <aside class="podbor-factor-case">
              <span class="podbor-factor-case__badge">
                {{ detail.caseStudy.badge }}
              </span>

              <p class="podbor-factor-case__title">
                {{ detail.caseStudy.title }}
              </p>

              <div class="podbor-factor-case__calc-wrap">
                <p class="podbor-factor-case__description">
                  {{ detail.caseStudy.description }}
                </p>

                <nuxt-link
                  class="podbor-factor-case__calc-btn"
                  :to="detail.caseStudy.calculatorHref"
                  title="Калькулятор"
                >
                  <svg
                    class="podbor-factor-case__calc-icon"
                    xmlns="http://www.w3.org/2000/svg"
                    width="24"
                    height="24"
                    viewBox="0 0 24 24"
                    fill="none"
                    aria-hidden="true"
                  >
                    <path
                      d="M22.4565 11.543C22.711 11.543 22.911 11.743 22.911 11.9975C22.911 12.2521 22.711 12.4521 22.4565 12.4521H22.002V11.543H22.4565Z"
                      fill="currentColor"
                    />
                    <path
                      d="M12.4551 11.543H22.0005V12.4521H12.4551V11.543Z"
                      fill="currentColor"
                    />
                    <path
                      d="M20.6364 22.9091H12C12.2545 22.9091 12.4545 22.7091 12.4545 22.4545V22H20.6364C21.3909 22 22 21.3909 22 20.6364V12.4545H22.4545C22.7091 12.4545 22.9091 12.2545 22.9091 12V20.6364C22.9091 21.8909 21.8909 22.9091 20.6364 22.9091Z"
                      fill="currentColor"
                    />
                    <path
                      d="M22.9091 3.36257V11.9989C22.9091 11.7444 22.7091 11.5444 22.4545 11.5444H22V3.36257C22 2.60803 21.3909 1.99893 20.6364 1.99893H12.4545V1.54439C12.4545 1.28984 12.2545 1.08984 12 1.08984H20.6364C21.8909 1.08984 22.9091 2.10803 22.9091 3.36257Z"
                      fill="currentColor"
                    />
                    <path
                      d="M19.2745 6.54297C19.529 6.54297 19.729 6.74297 19.729 6.99751C19.729 7.25206 19.529 7.45206 19.2745 7.45206H15.6381C15.3836 7.45206 15.1836 7.25206 15.1836 6.99751C15.1836 6.74297 15.3836 6.54297 15.6381 6.54297H19.2745Z"
                      fill="currentColor"
                    />
                    <path
                      d="M19.2745 15.6367C19.529 15.6367 19.729 15.8367 19.729 16.0913C19.729 16.3458 19.529 16.5458 19.2745 16.5458H15.6381C15.3836 16.5458 15.1836 16.3458 15.1836 16.0913C15.1836 15.8367 15.3836 15.6367 15.6381 15.6367H19.2745Z"
                      fill="currentColor"
                    />
                    <path
                      d="M19.2745 18.3633C19.529 18.3633 19.729 18.5633 19.729 18.8178C19.729 19.0724 19.529 19.2724 19.2745 19.2724H15.6381C15.3836 19.2724 15.1836 19.0724 15.1836 18.8178C15.1836 18.5633 15.3836 18.3633 15.6381 18.3633H19.2745Z"
                      fill="currentColor"
                    />
                    <path
                      d="M12.456 22V22.4545C12.456 22.7091 12.256 22.9091 12.0014 22.9091C11.7469 22.9091 11.5469 22.7091 11.5469 22.4545V22H12.456Z"
                      fill="currentColor"
                    />
                    <path
                      d="M11.5469 12.4531H12.456V21.9986H11.5469V12.4531Z"
                      fill="currentColor"
                    />
                    <path
                      d="M11.5469 11.543H12.456V12.4521H11.5469V11.543Z"
                      fill="currentColor"
                    />
                    <path
                      d="M11.5469 2H12.456V11.5455H11.5469V2Z"
                      fill="currentColor"
                    />
                    <path
                      d="M12.456 1.54439V1.99893H11.5469V1.54439C11.5469 1.28984 11.7469 1.08984 12.0014 1.08984C12.256 1.08984 12.456 1.28984 12.456 1.54439Z"
                      fill="currentColor"
                    />
                    <path
                      d="M2 11.543H11.5455V12.4521H2V11.543Z"
                      fill="currentColor"
                    />
                    <path
                      d="M8.36559 6.54297C8.62013 6.54297 8.82013 6.74297 8.82013 6.99751C8.82013 7.25206 8.62013 7.45206 8.36559 7.45206H7.00195V6.54297H8.36559Z"
                      fill="currentColor"
                    />
                    <path
                      d="M8.22869 18.4986C8.41051 18.6713 8.41051 18.9622 8.22869 19.1349C8.14687 19.2259 8.02869 19.2713 7.91051 19.2713C7.79233 19.2713 7.67415 19.2259 7.59233 19.1349L6.54688 18.0895L7.18324 17.4531L8.22869 18.4986Z"
                      fill="currentColor"
                    />
                    <path
                      d="M7.59233 15.7731C7.76506 15.5913 8.05597 15.5913 8.22869 15.7731C8.41051 15.9458 8.41051 16.2367 8.22869 16.4094L7.18324 17.4549L6.54688 16.8185L7.59233 15.7731Z"
                      fill="currentColor"
                    />
                    <path
                      d="M5.9082 17.4531L6.5446 16.8167L7.181 17.4531L6.5446 18.0895L5.9082 17.4531Z"
                      fill="currentColor"
                    />
                    <path
                      d="M7.00089 7.45312V8.81676C7.00089 9.07131 6.80089 9.27131 6.54634 9.27131C6.2918 9.27131 6.0918 9.07131 6.0918 8.81676V7.45312H7.00089Z"
                      fill="currentColor"
                    />
                    <path
                      d="M6.0918 6.54297H7.00089V7.45206H6.0918V6.54297Z"
                      fill="currentColor"
                    />
                    <path
                      d="M7.00089 5.18111V6.54474H6.0918V5.18111C6.0918 4.92656 6.2918 4.72656 6.54634 4.72656C6.80089 4.72656 7.00089 4.92656 7.00089 5.18111Z"
                      fill="currentColor"
                    />
                    <path
                      d="M6.5467 16.8185L5.91033 17.4549L4.86488 16.4094C4.68306 16.2367 4.68306 15.9458 4.86488 15.7731C5.03761 15.5913 5.32852 15.5913 5.50124 15.7731L6.5467 16.8185Z"
                      fill="currentColor"
                    />
                    <path
                      d="M6.09162 6.54297V7.45206H4.72798C4.47344 7.45206 4.27344 7.25206 4.27344 6.99751C4.27344 6.74297 4.47344 6.54297 4.72798 6.54297H6.09162Z"
                      fill="currentColor"
                    />
                    <path
                      d="M5.50124 19.1349C5.41942 19.2259 5.30124 19.2713 5.18306 19.2713C5.06488 19.2713 4.9467 19.2259 4.86488 19.1349C4.68306 18.9622 4.68306 18.6713 4.86488 18.4986L5.91033 17.4531L6.5467 18.0895L5.50124 19.1349Z"
                      fill="currentColor"
                    />
                    <path
                      d="M2.00089 11.543V12.4521H1.54634C1.2918 12.4521 1.0918 12.2521 1.0918 11.9975C1.0918 11.743 1.2918 11.543 1.54634 11.543H2.00089Z"
                      fill="currentColor"
                    />
                    <path
                      d="M1.0918 3.36257C1.0918 2.10803 2.10998 1.08984 3.36452 1.08984H12.0009C11.7463 1.08984 11.5463 1.28984 11.5463 1.54439V1.99893H3.36452C2.60998 1.99893 2.00089 2.60803 2.00089 3.36257V11.5444H1.54634C1.2918 11.5444 1.0918 11.7444 1.0918 11.9989V3.36257Z"
                      fill="currentColor"
                    />
                    <path
                      d="M2.00089 20.6364C2.00089 21.3909 2.60998 22 3.36452 22H11.5463V22.4545C11.5463 22.7091 11.7463 22.9091 12.0009 22.9091H3.36452C2.10998 22.9091 1.0918 21.8909 1.0918 20.6364V12C1.0918 12.2545 1.2918 12.4545 1.54634 12.4545H2.00089V20.6364Z"
                      fill="currentColor"
                    />
                  </svg>
                  <svg
                    class="podbor-factor-case__calc-arrow"
                    xmlns="http://www.w3.org/2000/svg"
                    width="24"
                    height="24"
                    viewBox="0 0 24 24"
                    fill="none"
                    aria-hidden="true"
                  >
                    <path
                      d="M8 6H18M18 6V16M18 6L8 16L5 19"
                      stroke="currentColor"
                    />
                  </svg>
                </nuxt-link>
              </div>

              <div class="podbor-factor-case__body">
                <p
                  v-for="(line, index) in detail.caseStudy.lines"
                  :key="`${detail.id}-line-${index}`"
                >
                  {{ line.text }}<span v-if="line.muted">{{ line.muted }}</span>
                </p>
                <small>{{ detail.caseStudy.footnote }}</small>
              </div>
            </aside>
          </div>

          <div
            v-else-if="detail.columns?.length"
            class="podbor-factor-card__columns"
          >
            <div
              v-for="(column, index) in detail.columns"
              :key="`${detail.id}-col-${index}`"
              class="podbor-factor-card__column"
            >
              <h4 class="podbor-factor-card__column-title">
                {{ column.title }}
              </h4>
              <p class="podbor-factor-card__column-text">
                {{ column.text }}
              </p>
            </div>
          </div>

          <div
            v-else-if="detail.items?.length"
            class="podbor-factor-card__list-wrap"
          >
            <div class="podbor-factor-card__text">
              <p
                v-for="(item, index) in detail.items"
                :key="`${detail.id}-item-${index}`"
              >
                {{ item }}
              </p>

              <p
                v-if="detail.note"
                class="podbor-factor-card__note"
              >
                {{ detail.note }}
              </p>
            </div>
          </div>

          <form
            v-if="detail.withForm"
            class="podbor-factor-card__form"
            @submit.prevent="onSubmit(detail.id)"
          >
            <div class="podbor-factor-card__form-row">
              <label class="podbor-factor-card__field">
                <span class="podbor-factors__visually-hidden">Телефон</span>
                <input
                  v-model="phones[detail.id]"
                  type="tel"
                  class="podbor-factor-card__input"
                  autocomplete="tel"
                  inputmode="tel"
                  :placeholder="factors.phonePlaceholder"
                  required
                >
              </label>

              <top-mining-button
                class="podbor-factor-card__submit"
                preset="contact-pill"
                variant="primary"
                size="big"
                surface="dark"
                type="submit"
                :title="factors.submitLabel"
                :append-icon="arrowIcon"
              />
            </div>

            <label class="podbor-factor-card__privacy">
              <input
                v-model="privacyAccepted[detail.id]"
                type="checkbox"
                class="podbor-factor-card__privacy-check"
                required
              >
              <span class="podbor-factor-card__privacy-text">
                {{ factors.privacyPrefix }}
                <nuxt-link
                  class="podbor-factor-card__privacy-link"
                  :to="factors.privacyHref"
                >
                  {{ factors.privacyLinkLabel }}
                </nuxt-link>
              </span>
            </label>
          </form>
        </article>
      </div>
    </div>
  </section>
</template>

<script setup lang="ts">
  import arrowIcon from '~/assets/images/articles/arrow-up-right.png'
  import { PODBOR_MINING_HOTEL_KEY_FACTORS } from '~/common/modules/top-mining/podbor-mining-hotel'
  import TopMiningButton from '~/components/global/buttons/TopMiningButton.vue'

  const factors = PODBOR_MINING_HOTEL_KEY_FACTORS

  const phones = reactive<Record<string, string>>(
    Object.fromEntries(
      factors.details.filter((d) => d.withForm).map((d) => [d.id, '']),
    ),
  )

  const privacyAccepted = reactive<Record<string, boolean>>(
    Object.fromEntries(
      factors.details.filter((d) => d.withForm).map((d) => [d.id, true]),
    ),
  )

  function onSubmit(id: string) {
    if (!privacyAccepted[id]) {
      return
    }

    // TODO: отправка заявки по ключевому фактору
  }
</script>

<style scoped>
  .podbor-factors {
    background: var(--tm-page-bg);
    color: var(--tm-white);
    padding: 24px 0 88px;
  }

  .podbor-factors__inner {
    max-width: 1700px;
    margin: 0 auto;
    padding: 0 40px;
  }

  .podbor-factors__title {
    margin: 0 0 64px;
    color: var(--tm-off-white);
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 48px;
    font-weight: 500;
    line-height: 64px;
    text-transform: uppercase;
  }

  .podbor-factors__points {
    display: flex;
    flex-direction: column;
    margin-bottom: 40px;
  }

  .podbor-factors__item {
    display: flex;
    align-items: center;
    gap: 28px;
    padding: 28px 0;
    border-top: 1px solid rgba(255, 255, 255, 0.14);
  }

  .podbor-factors__item:last-child {
    border-bottom: 1px solid rgba(255, 255, 255, 0.14);
  }

  .podbor-factors__number,
  .podbor-factors__label {
    color: var(--tm-off-white);
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 24px;
    font-weight: 400;
    line-height: 1.3;
  }

  .podbor-factors__number {
    flex: 0 0 auto;
    min-width: 2.2em;
    font-weight: 500;
  }

  .podbor-factors__details {
    display: flex;
    flex-direction: column;
    gap: 24px;
  }

  .podbor-factor-card {
    position: relative;
    padding: 40px;
    border-radius: 40px;
    background: #1f1f1f;
  }

  .podbor-factor-card__number {
    position: absolute;
    top: 40px;
    right: 40px;
    color: #5c5c5c;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 28px;
    font-weight: 400;
    line-height: 34px;
  }

  .podbor-factor-card__title {
    margin: 0 80px 20px 0;
    color: var(--tm-off-white);
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 28px;
    font-weight: 400;
    line-height: 34px;
  }

  .podbor-factor-card__info {
    display: inline-flex;
    align-items: center;
    gap: 10px;
    margin: 0 0 20px;
    padding: 10px 16px;
    border-radius: 999px;
    background: var(--tm-page-bg);
    color: var(--tm-off-white);
    font-size: 15px;
    line-height: 1.35;
  }

  .podbor-factor-card__info-icon {
    flex-shrink: 0;
    width: 20px;
    height: 20px;
    color: var(--tm-orange);
  }

  .podbor-factor-card__bigi {
    margin: 0 0 30px;
    color: var(--tm-white);
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 18px;
    font-weight: 400;
    line-height: 26px;
  }

  .podbor-factor-card__list-wrap {
    display: flex;
    flex-direction: column;
    gap: 0;
  }

  .podbor-factor-card__text {
    padding: 20px;
    border-radius: 24px;
    background: #262626;
  }

  .podbor-factor-card__text p {
    margin: 0 0 20px;
    color: #f6f6f6cc;
    font-size: 18px;
    font-weight: 400;
    line-height: 24px;
  }

  .podbor-factor-card__text p:last-child {
    margin-bottom: 0;
  }

  .podbor-factor-card__dop-wrap {
    padding: 20px;
    border: 1px solid rgba(92, 92, 92, 0.3);
    border-radius: 24px;
  }

  .podbor-factor-card__dop-wrap p {
    margin: 0 0 16px;
    color: #f6f6f6cc;
    font-size: 18px;
    font-weight: 400;
    line-height: 24px;
  }

  .podbor-factor-card__dop-wrap p:last-child {
    margin-bottom: 0;
  }

  .podbor-factor-card__note {
    margin: 20px 0 0;
    color: #757575;
    font-size: 18px;
    font-weight: 400;
    line-height: 24px;
  }

  .podbor-factor-card__case-wrap {
    display: flex;
    gap: 20px;
    align-items: stretch;
    margin-bottom: 40px;
  }

  .podbor-factor-card__questions {
    flex: 1 1 0;
    min-width: 0;
    width: 50%;
    max-width: 814px;
  }

  .podbor-factor-case {
    position: relative;
    flex: 1 1 0;
    min-width: 0;
    width: 50%;
    max-width: 814px;
    padding: 20px;
    border: 1px solid #5c5c5c;
    border-radius: 24px;
  }

  .podbor-factor-case__badge {
    position: absolute;
    top: -21px;
    right: 20px;
    padding: 10px 19px;
    border: 1px solid #5c5c5c;
    border-radius: 40px;
    background: #1f1f1f;
    color: var(--tm-off-white);
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 16px;
    font-weight: 400;
    line-height: 22px;
    text-transform: uppercase;
  }

  .podbor-factor-case__title {
    margin: 0 0 30px;
    color: var(--tm-white);
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 18px;
    font-weight: 400;
    line-height: 26px;
  }

  .podbor-factor-case__calc-wrap {
    display: flex;
    align-items: center;
    gap: 47px;
    margin-bottom: 30px;
  }

  .podbor-factor-case__description {
    flex: 1 1 auto;
    margin: 0;
    color: var(--tm-white);
    font-size: 18px;
    font-weight: 400;
    line-height: 24px;
  }

  .podbor-factor-case__calc-btn {
    flex: 0 0 auto;
    display: inline-flex;
    flex-direction: row;
    align-items: center;
    justify-content: space-between;
    gap: 16px;
    width: 112px;
    height: 48px;
    padding: 0 24px;
    border: 1px solid var(--tm-orange);
    border-radius: 999px;
    color: var(--tm-white);
    text-decoration: none;
    transition: background 0.2s ease;
  }

  .podbor-factor-case__calc-btn:hover {
    background: linear-gradient(94.62deg, #ff741f 2.04%, #ec5100 49.92%);
  }

  .podbor-factor-case__calc-icon,
  .podbor-factor-case__calc-arrow {
    display: block;
    width: 24px;
    height: 24px;
  }

  .podbor-factor-case__body {
    padding: 20px;
    border-radius: 24px;
    background: #262626;
  }

  .podbor-factor-case__body p {
    margin: 0 0 10px;
    color: #f6f6f6cc;
    font-size: 18px;
    font-weight: 400;
    line-height: 24px;
  }

  .podbor-factor-case__body p span {
    color: #757575;
  }

  .podbor-factor-case__body p:last-of-type {
    margin-bottom: 0;
  }

  .podbor-factor-case__body small {
    display: block;
    margin-top: 20px;
    color: #757575;
    font-size: 14px;
    font-weight: 400;
    line-height: 24px;
  }

  .podbor-factor-card__columns {
    display: grid;
    grid-template-columns: repeat(2, minmax(0, 1fr));
    gap: 16px;
  }

  .podbor-factor-card__column {
    padding: 24px;
    border: 1px solid #5c5c5c;
    border-radius: 24px;
  }

  .podbor-factor-card__column-title {
    margin: 0 0 12px;
    color: var(--tm-off-white);
    font-size: 18px;
    font-weight: 600;
    line-height: 1.3;
  }

  .podbor-factor-card__column-text {
    margin: 0;
    color: color-mix(in srgb, var(--tm-off-white) 78%, transparent);
    font-size: 16px;
    line-height: 1.4;
  }

  .podbor-factor-card__form {
    display: flex;
    flex-direction: column;
    gap: 14px;
    margin-top: 0;
  }

  .podbor-factor-card__form-row {
    display: flex;
    align-items: stretch;
    gap: 16px;
  }

  .podbor-factor-card__field {
    display: block;
    min-width: 0;
    flex: 1 1 auto;
  }

  .podbor-factor-card__input {
    width: 100%;
    box-sizing: border-box;
    height: 56px;
    padding: 0 24px;
    border: 1px solid #5c5c5c;
    border-radius: 999px;
    background: transparent;
    color: var(--tm-white);
    font-size: 16px;
    outline: none;
  }

  .podbor-factor-card__input::placeholder {
    color: rgba(255, 255, 255, 0.45);
  }

  .podbor-factor-card__submit {
    flex: 0 0 auto;
    width: auto !important;
    max-width: max-content;
  }

  .podbor-factor-card__privacy {
    display: flex;
    align-items: flex-start;
    gap: 10px;
    cursor: pointer;
  }

  .podbor-factor-card__privacy-check {
    flex-shrink: 0;
    width: 16px;
    height: 16px;
    margin-top: 2px;
    accent-color: var(--tm-orange);
  }

  .podbor-factor-card__privacy-text {
    color: rgba(255, 255, 255, 0.55);
    font-size: 12px;
    line-height: 1.4;
  }

  .podbor-factor-card__privacy-link {
    color: inherit;
    text-decoration: underline;
    text-underline-offset: 2px;
  }

  .podbor-factor-card__privacy-link:hover,
  .podbor-factor-card__privacy-link:focus-visible {
    color: var(--tm-orange);
  }

  .podbor-factors__visually-hidden {
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

  @media (max-width: 1730px) {
    .podbor-factors__title {
      margin-bottom: 40px;
    }
  }

  @media (max-width: 1600px) {
    .podbor-factors__inner {
      max-width: 1320px;
      padding: 0 32px;
    }
  }

  @media (max-width: 1439px) {
    .podbor-factor-card__case-wrap {
      flex-direction: column;
      gap: 40px;
      margin-bottom: 20px;
    }

    .podbor-factor-card__questions,
    .podbor-factor-case {
      width: 100%;
      max-width: none;
    }

    .podbor-factor-case {
      order: 1;
      padding: 15px 10px;
    }

    .podbor-factor-card__questions {
      order: 1;
    }

    .podbor-factor-card__bigi {
      margin-bottom: 20px;
      font-size: 14px;
      line-height: 18px;
    }

    .podbor-factor-case__title {
      margin-bottom: 20px;
      font-size: 14px;
      line-height: 18px;
    }

    .podbor-factor-case__description {
      max-width: 410px;
      font-size: 14px;
      line-height: 18px;
    }

    .podbor-factor-case__calc-wrap {
      align-items: center;
    }

    .podbor-factor-case__calc-btn {
      width: 104px;
      border-radius: 34px;
    }

    .podbor-factor-case__badge {
      right: 80px;
      height: 40px;
      padding: 0 19px;
      font-size: 16px;
      line-height: 40px;
    }
  }

  @media (max-width: 1299px) {
    .podbor-factors__inner {
      padding: 0 24px;
    }

    .podbor-factors__title {
      font-size: 36px;
      line-height: 48px;
    }

    .podbor-factors__item {
      gap: 20px;
      padding: 24px 0;
    }

    .podbor-factors__number,
    .podbor-factors__label {
      font-size: 20px;
    }

    .podbor-factor-card {
      padding: 28px 24px;
      border-radius: 32px;
    }

    .podbor-factor-card__number {
      top: 20px;
      right: 20px;
      font-size: 14px;
      line-height: 20px;
    }

    .podbor-factor-card__title {
      font-size: 16px;
      line-height: 20px;
    }

    .podbor-factor-card__text {
      border-radius: 16px;
    }

    .podbor-factor-card__text p,
    .podbor-factor-card__dop-wrap p,
    .podbor-factor-card__note {
      font-size: 14px;
      line-height: 18px;
    }

    .podbor-factor-card__text p {
      margin-bottom: 10px;
    }

    .podbor-factor-card__columns {
      grid-template-columns: 1fr;
    }
  }

  @media (max-width: 767px) {
    .podbor-factors {
      padding: 16px 0 64px;
    }

    .podbor-factors__inner {
      padding: 0 16px;
    }

    .podbor-factors__title {
      margin-bottom: 24px;
      font-size: 26px;
      line-height: 34px;
    }

    .podbor-factors__item {
      align-items: flex-start;
      gap: 16px;
      padding: 20px 0;
    }

    .podbor-factors__number,
    .podbor-factors__label {
      font-size: 16px;
    }

    .podbor-factor-card {
      padding: 24px 18px;
      border-radius: 24px;
    }

    .podbor-factor-card__title {
      margin-right: 56px;
      font-size: 18px;
    }

    .podbor-factor-card__form-row {
      flex-direction: column;
    }

    .podbor-factor-card__submit.top-mining-button {
      width: 100% !important;
      max-width: 100%;
      min-height: 48px;
    }

    .podbor-factor-card__submit :deep(.top-mining-button__inner) {
      justify-content: center;
    }
  }
</style>
