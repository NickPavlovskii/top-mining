<template>
  <section
    class="data-center-power"
    aria-labelledby="data-center-power-title"
  >
    <div class="data-center-power__inner">
      <h2
        id="data-center-power-title"
        class="data-center-power__title"
      >
        {{ copy.title }}
      </h2>

      <div class="data-center-power__scroll">
        <div
          class="data-center-power__hand"
          aria-hidden="true"
        />

        <div class="data-center-power__wrap">
          <div
            class="data-center-power__vs"
            aria-hidden="true"
          />

          <article
            v-for="column in copy.columns"
            :key="column.id"
            class="data-center-power__card"
          >
            <img
              class="data-center-power__icon"
              alt=""
              aria-hidden="true"
              :src="icons[column.icon]"
            >

            <h3 class="data-center-power__card-title">
              {{ column.title }}
            </h3>

            <ul class="data-center-power__list">
              <li
                v-for="item in column.items"
                :key="`${column.id}-${item.label}`"
                :class="item.align && `data-center-power__item--${item.align}`"
              >
                <div class="data-center-power__label">
                  {{ item.label }}
                </div>
                <p class="data-center-power__text">
                  {{ item.text }}
                </p>
              </li>
            </ul>
          </article>
        </div>
      </div>
    </div>
  </section>
</template>

<script setup lang="ts">
  import iconEl from '~/assets/images/data-center-construction/compare/sravnen-block-el.svg'
  import iconGaz from '~/assets/images/data-center-construction/compare/sravnen-block-gaz.svg'
  import {
    DATA_CENTER_CONSTRUCTION_PAGE,
    type DataCenterPowerIconId,
  } from '~/common/modules/top-mining/pages/data-center-construction'

  const copy = DATA_CENTER_CONSTRUCTION_PAGE.powerCompare

  const icons: Record<DataCenterPowerIconId, string> = {
    gaz: iconGaz,
    el: iconEl,
  }
</script>

<style scoped>
  .data-center-power {
    background: var(--tm-ink);
    padding: 0 0 72px;
    color: var(--tm-white);
  }

  .data-center-power__inner {
    box-sizing: border-box;
    max-width: 1720px;
    margin: 0 auto;
    padding: 0 40px;
  }

  .data-center-power__title {
    margin: 0 0 40px;
    max-width: 889px;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(22px, 2.8vw, 36px);
    font-weight: 500;
    line-height: 1.25;
    text-transform: uppercase;
  }

  .data-center-power__scroll {
    position: relative;
  }

  .data-center-power__hand {
    display: none;
  }

  .data-center-power__wrap {
    position: relative;
    display: flex;
    gap: 19px;
    margin-bottom: 34px;
  }

  .data-center-power__vs {
    position: absolute;
    bottom: 0;
    left: calc(50% - 68px);
    z-index: 2;
    width: 136px;
    height: 86px;
    background: url('~/assets/images/data-center-construction/compare/vs-icon.svg')
      no-repeat center;
    pointer-events: none;
  }

  .data-center-power__card {
    position: relative;
    width: 100%;
    padding: 136px 30px 176px;
    border-radius: 40px;
    background: rgba(247, 247, 247, 0.06);
  }

  .data-center-power__icon {
    position: absolute;
    top: 40px;
    right: 40px;
    width: 96px;
    height: 120px;
    object-fit: contain;
  }

  .data-center-power__card-title {
    margin: 0 0 30px;
    color: #f6f6f6;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 28px;
    font-weight: 400;
    line-height: 34px;
  }

  .data-center-power__list {
    display: flex;
    flex-direction: column;
    gap: 15px;
    margin: 0;
    padding: 0;
    list-style: none;
  }

  .data-center-power__list li {
    padding-bottom: 15px;
    border-bottom: 1px solid rgba(247, 247, 247, 0.15);
  }

  .data-center-power__list li:last-child {
    margin: 0;
    padding: 0;
    border: 0;
  }

  .data-center-power__label {
    color: #757575;
    font-family: Mulish, 'Segoe UI', system-ui, sans-serif;
    font-size: 20px;
    font-weight: 500;
    line-height: 28px;
  }

  .data-center-power__text {
    margin: 0;
    color: rgba(246, 246, 246, 0.8);
    font-family: Mulish, 'Segoe UI', system-ui, sans-serif;
    font-size: 20px;
    font-weight: 500;
    line-height: 28px;
  }

  .data-center-power__item--row-2 {
    min-height: 156px;
  }

  .data-center-power__item--gaz-4,
  .data-center-power__item--row-7 {
    min-height: 116px;
  }

  .data-center-power__item--gaz-6 {
    min-height: 136px;
  }

  @media (max-width: 1439px) {
    .data-center-power__wrap {
      margin-bottom: 0;
    }

    .data-center-power__vs {
      display: none;
    }

    .data-center-power__card {
      padding: 30px 20px;
      border-radius: 25px;
    }

    .data-center-power__icon {
      top: 20px;
      right: 20px;
      width: 25px;
      height: 30px;
    }

    .data-center-power__card-title {
      margin-bottom: 10px;
      padding-bottom: 20px;
      border-bottom: 1px solid rgba(247, 247, 247, 0.15);
      font-size: 14px;
      line-height: 20px;
    }

    .data-center-power__list {
      gap: 10px;
    }

    .data-center-power__list li {
      margin-bottom: 10px;
      min-height: 0;
      padding-bottom: 15px;
    }

    .data-center-power__label,
    .data-center-power__text {
      font-size: 14px;
      font-weight: 400;
      line-height: 20px;
    }
  }

  @media (max-width: 767px) {
    .data-center-power__inner {
      padding: 0 16px;
    }

    .data-center-power__title {
      margin-bottom: 24px;
      text-align: center;
    }

    .data-center-power__scroll {
      width: 100%;
      margin-bottom: 20px;
      padding-top: 47px;
      overflow-x: auto;
      scrollbar-width: none;
    }

    .data-center-power__scroll::-webkit-scrollbar {
      width: 0;
      height: 0;
    }

    .data-center-power__hand {
      position: absolute;
      top: 0;
      left: 154px;
      display: block;
      width: 32px;
      height: 32px;
      background: url('~/assets/images/data-center-construction/compare/bxs_hand-up.svg')
        no-repeat center;
      animation: data-center-power-hand 5s linear infinite;
      pointer-events: none;
    }

    .data-center-power__wrap {
      gap: 10px;
      width: 530px;
      margin: 0;
    }

    .data-center-power__card {
      width: 260px;
      flex: 0 0 260px;
      padding: 30px 10px;
    }
  }

  @keyframes data-center-power-hand {
    0% {
      left: 154px;
    }

    50% {
      left: 180px;
    }

    100% {
      left: 154px;
    }
  }
</style>
