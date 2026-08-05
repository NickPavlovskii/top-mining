<template>
  <section
    id="enter-mining"
    class="consulting-enter"
    aria-labelledby="consulting-enter-title"
  >
    <div class="consulting-enter__inner">
      <h2
        id="consulting-enter-title"
        class="consulting-enter__title"
      >
        {{ copy.sectionTitle }}
      </h2>

      <div
        id="enter-mining-first"
        class="w-bg-block"
      >
        <div class="stic-wrap">
          <div class="left-info">
            <h4 class="desc">
              {{ copy.leftTitle }}
            </h4>
            <h5>{{ copy.leftLead }}</h5>
            <h5>{{ copy.leftText }}</h5>
          </div>

          <div class="right-info">
            <div
              v-for="part in copy.parts"
              :key="part.id"
              class="table-block-wrap"
            >
              <div class="right-top">
                <top-mining-chip
                  class="consulting-enter__part-chip"
                  preset="orange-fill"
                  shape="pill"
                  size="md"
                  min-width="auto"
                  :label="part.badge"
                />
                {{ part.title }}
              </div>

              <div class="tag-wrap">
                <div class="accordion">
                  <div
                    v-for="item in part.accordions"
                    :key="item.id"
                    class="accordion-item-block"
                  >
                    <button
                      type="button"
                      :class="['accordion-button', { collapsed: !isOpen(part.id, item.id) }]"
                      :aria-expanded="isOpen(part.id, item.id)"
                      @click="toggle(part.id, item.id)"
                    >
                      <top-mining-chip
                        v-if="item.commercial"
                        class="consulting-enter__commercial-chip"
                        preset="commercial"
                        shape="pill"
                        size="sm"
                        min-width="auto"
                        :label="`₽ ${item.title}`"
                      />
                      <template v-else>
                        {{ item.title }}
                      </template>
                    </button>

                    <div
                      v-show="isOpen(part.id, item.id)"
                      class="accordion-body"
                    >
                      <div
                        v-for="(line, index) in item.items"
                        :key="`${item.id}-${index}`"
                        class="element"
                      >
                        {{ line }}
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <div class="bottom-right-info-wrap">
              <span>{{ copy.summaryLabel }}</span>
              {{ copy.summaryText }}
            </div>
          </div>
        </div>

        <div class="bottom-or-border-block">
          <div class="prise-top">
            {{ copy.priceLabel }}
          </div>
          <div class="price-or">
            {{ copy.priceValue }}
          </div>

          <a
            class="or-border-block-button"
            :href="copy.ctaHref"
          >
            <span>{{ copy.ctaLabel }}</span>
            <consulting-diagonal-arrow-icon />
          </a>

          <div class="warning-bottom">
            <consulting-info-circle-icon />
            <b>{{ copy.warningLead }}</b>
            {{ copy.warningMid }}
            <top-mining-chip
              class="consulting-enter__commercial-chip consulting-enter__commercial-chip--inline"
              :label="`₽ ${copy.warningTag}`"
              preset="commercial"
              shape="pill"
              size="xs"
              min-width="auto"
            />
            <br>
            {{ copy.warningTail }}
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script setup lang="ts">
  import { CONSULTING_ENTER_MINING } from '~/common/modules/top-mining/consulting/enter-mining'
  import TopMiningChip from '~/components/global/labels/TopMiningChip.vue'

  const copy = CONSULTING_ENTER_MINING

  const openByPart = reactive<Record<string, string>>(
    Object.fromEntries(
      copy.parts.map((part) => [
        part.id,
        part.accordions.find((item) => item.defaultOpen)?.id ?? part.accordions[0]?.id ?? '',
      ]),
    ),
  )

  function isOpen(partId: string, itemId: string) {
    return openByPart[partId] === itemId
  }

  function toggle(partId: string, itemId: string) {
    openByPart[partId] = openByPart[partId] === itemId ? '' : itemId
  }
</script>

<style scoped>
  .consulting-enter {
    margin-top: 0;
    padding: 80px 0 64px;
    border-radius: 64px 64px 0 0;
    background: var(--tm-off-white);
    color: var(--tm-page-bg);
  }

  .consulting-enter__inner {
    max-width: 1700px;
    margin: 0 auto;
    padding: 0 40px;
  }

  .consulting-enter__title {
    margin: 0 0 24px;
    color: var(--tm-page-bg);
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 95px;
    font-weight: 500;
    line-height: 100%;
    text-transform: uppercase;
  }

  .w-bg-block {
    margin-bottom: 24px;
    padding: 64px;
    border-radius: 64px;
    background: #fff;
    box-shadow: 0 20px 80px 0 rgba(0, 0, 0, 0.05);
  }

  .stic-wrap {
    position: relative;
    display: flex;
    align-items: flex-start;
    justify-content: flex-start;
    gap: 20px;
  }

  .left-info {
    position: sticky;
    top: 120px;
    z-index: 10;
    flex: 0 0 auto;
    width: 100%;
    max-width: 502px;
  }

  .right-info {
    max-width: 974px;
    margin-left: auto;
    min-width: 0;
    flex: 1 1 auto;
  }

  .left-info .desc {
    margin: 0 0 40px;
    max-width: 500px;
    color: var(--tm-page-bg);
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 38px;
    font-weight: 500;
    line-height: 1;
    text-align: left;
    text-transform: uppercase;
  }

  .left-info h5 {
    margin: 0 0 20px;
    color: var(--tm-page-bg);
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 16px;
    font-weight: 400;
    line-height: 22px;
  }

  .table-block-wrap {
    display: flex;
    flex-direction: column;
    gap: 40px;
    margin-bottom: 40px;
    padding: 40px;
    border-radius: 40px;
    background: var(--tm-off-white);
  }

  .right-top {
    max-width: 715px;
    color: var(--tm-page-bg);
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 28px;
    font-weight: 400;
    line-height: 100%;
    text-transform: uppercase;
  }

  .consulting-enter__part-chip {
    display: inline-flex;
    width: fit-content;
    margin-bottom: 20px;
    white-space: nowrap;
  }

  .consulting-enter__part-chip :deep(.top-mining-chip__title) {
    white-space: nowrap;
  }

  .tag-wrap {
    position: relative;
    display: flex;
    flex-direction: column;
  }

  .accordion {
    display: flex;
    flex-direction: column;
    gap: 20px;
  }

  .accordion-item-block {
    border: none;
    border-radius: 10px;
    background: var(--tm-off-white);
  }

  .accordion-button {
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 16px;
    width: 100%;
    padding: 0;
    border: 0;
    background: transparent;
    color: #000;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 14px;
    font-weight: 400;
    line-height: 22px;
    text-align: left;
    text-transform: uppercase;
    cursor: pointer;
  }

  .accordion-button::after {
    content: '';
    flex-shrink: 0;
    display: inline-block;
    width: 25px;
    height: 25px;
    margin-left: auto;
    border: 1px solid #999;
    border-radius: 50%;
    background:
      url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16' fill='%23999'%3E%3Cpath fill-rule='evenodd' d='M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z'/%3E%3C/svg%3E")
      no-repeat center;
    background-size: 12px;
    transition: transform 0.2s ease;
  }

  .accordion-button:not(.collapsed)::after {
    border-color: #ec5100;
    background:
      #ec5100
      url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16' fill='%23fff'%3E%3Cpath fill-rule='evenodd' d='M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z'/%3E%3C/svg%3E")
      no-repeat center;
    background-size: 12px;
    transform: rotate(-180deg);
  }

  .accordion-body {
    display: flex;
    flex-direction: column;
    gap: 20px;
    width: 100%;
    margin-top: 10px;
    padding: 20px;
    border-radius: 20px;
    background: rgba(255, 255, 255, 0.9);
  }

  .accordion-item-block .element {
    color: var(--tm-page-bg);
    font-size: 16px;
    font-weight: 400;
    line-height: 20.08px;
  }

  .consulting-enter__commercial-chip {
    display: inline-flex;
    width: fit-content;
    pointer-events: none;
  }

  .consulting-enter__commercial-chip--inline {
    margin: 0 4px;
    vertical-align: middle;
  }

  .bottom-right-info-wrap {
    color: var(--tm-page-bg);
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 28px;
    font-weight: 500;
    line-height: 40px;
    text-transform: uppercase;
  }

  .bottom-right-info-wrap span {
    color: #fe731e;
  }

  .bottom-or-border-block {
    position: relative;
    z-index: 10;
    margin-top: 50px;
    padding: 40px;
    border: 1px solid #ec5100;
    border-radius: 64px;
  }

  .prise-top {
    margin-bottom: 10px;
    color: var(--tm-page-bg);
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 18px;
    font-weight: 400;
    line-height: 26px;
    text-align: left;
    text-transform: uppercase;
  }

  .price-or {
    margin-bottom: 20px;
    color: var(--tm-page-bg);
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 40px;
    font-weight: 500;
    line-height: 50px;
    text-align: left;
  }

  .or-border-block-button {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    gap: 16px;
    width: 300px;
    height: 56px;
    padding: 0;
    border: 1px solid #ec5100;
    border-radius: 100px;
    background: linear-gradient(94.62deg, #ec5100 2.06%, #ff741f 93.25%);
    color: #fff;
    font-size: 16px;
    line-height: 56px;
    text-decoration: none;
    text-transform: uppercase;
    transition:
      background 0.2s ease,
      color 0.2s ease;
  }

  .or-border-block-button:hover {
    background: transparent;
    color: var(--tm-page-bg);
  }

  .warning-bottom {
    position: relative;
    margin-top: 40px;
    padding-left: 36px;
    color: var(--tm-page-bg);
    font-size: 14px;
    font-weight: 400;
    line-height: 20px;
    text-align: left;
  }

  .warning-bottom b {
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 18px;
    font-weight: 400;
    line-height: 26px;
    text-transform: uppercase;
  }

  .warning-bottom svg {
    position: absolute;
    top: 0;
    left: 0;
    width: 26px;
    height: 26px;
  }

  @media (max-width: 1600px) {
    .consulting-enter__inner {
      max-width: 1320px;
      padding: 0 32px;
    }

    .consulting-enter__title {
      font-size: 64px;
    }

    .left-info {
      max-width: 354px;
    }

    .right-info {
      max-width: 722px;
    }

    .left-info .desc {
      max-width: 490px;
      margin-bottom: 40px;
      font-size: 32px;
      line-height: 39.68px;
    }
  }

  @media (max-width: 1299px) {
    .consulting-enter {
      margin-top: 0;
      padding: 48px 0 48px;
      border-radius: 32px 32px 0 0;
    }

    .consulting-enter__inner {
      padding: 0 24px;
    }

    .consulting-enter__title {
      margin-bottom: 20px;
      font-size: 24px;
      line-height: 29.76px;
    }

    .w-bg-block {
      padding: 40px;
    }

    .stic-wrap {
      flex-direction: column;
      gap: 10px;
    }

    .left-info {
      position: static;
      max-width: none;
    }

    .left-info .desc {
      margin-bottom: 40px;
      font-size: 28px;
      font-weight: 400;
      line-height: 34px;
    }

    .right-info {
      max-width: none;
      margin-left: 0;
    }

    .table-block-wrap {
      gap: 20px;
      padding: 20px;
      border-radius: 20px;
    }

    .right-top {
      font-size: 20px;
    }

    .bottom-right-info-wrap {
      margin-bottom: 20px;
      font-size: 14px;
      font-weight: 400;
      line-height: 140%;
      text-transform: none;
    }

    .bottom-or-border-block {
      margin-top: 40px;
      padding: 20px;
      border-radius: 32px;
    }

    .prise-top {
      margin-bottom: 5px;
      color: #5c5c5c;
      font-size: 12px;
      line-height: 14.88px;
    }

    .price-or {
      margin-bottom: 20px;
      font-size: 24px;
      line-height: 29.76px;
    }

    .or-border-block-button {
      width: 100%;
      max-width: 300px;
    }

    .warning-bottom {
      margin-top: 20px;
      padding-left: 26px;
      font-size: 12px;
      line-height: 16px;
    }

    .warning-bottom b {
      display: block;
      font-size: 10px;
      line-height: 12.4px;
    }

    .warning-bottom svg {
      top: 3px;
      width: 16px;
      height: 16px;
    }
  }

  @media (max-width: 767px) {
    .consulting-enter {
      padding: 64px 0 72px;
      border-radius: 24px 24px 0 0;
    }

    .consulting-enter__inner {
      padding: 0 16px;
    }

    .w-bg-block {
      padding: 24px 16px;
      border-radius: 24px;
    }
  }
</style>
