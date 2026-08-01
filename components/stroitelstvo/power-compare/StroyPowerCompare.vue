<template>
  <section
    class="stroy-power"
    aria-labelledby="stroy-power-title"
  >
    <div class="stroy-power__inner">
      <h2
        id="stroy-power-title"
        class="stroy-power__title"
      >
        {{ copy.title }}
      </h2>

      <div class="stroy-power__scroll">
        <div
          class="stroy-power__hand"
          aria-hidden="true"
        />

        <div class="stroy-power__wrap">
          <div
            class="stroy-power__vs"
            aria-hidden="true"
          />

          <article
            v-for="column in copy.columns"
            :key="column.id"
            class="stroy-power__card"
          >
            <img
              class="stroy-power__icon"
              alt=""
              aria-hidden="true"
              :src="icons[column.icon]"
            >

            <h3 class="stroy-power__card-title">
              {{ column.title }}
            </h3>

            <ul class="stroy-power__list">
              <li
                v-for="item in column.items"
                :key="`${column.id}-${item.label}`"
                :class="item.align && `stroy-power__item--${item.align}`"
              >
                <div class="stroy-power__label">
                  {{ item.label }}
                </div>
                <p class="stroy-power__text">
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
  import iconEl from '~/assets/images/stroitelstvo-data-czentrov/compare/sravnen-block-el.svg'
  import iconGaz from '~/assets/images/stroitelstvo-data-czentrov/compare/sravnen-block-gaz.svg'
  import {
    STROITELSTVO_DATA_CZENTROV_PAGE,
    type StroyPowerIconId,
  } from '~/common/modules/top-mining/stroitelstvo-data-czentrov-page'

  const copy = STROITELSTVO_DATA_CZENTROV_PAGE.powerCompare

  const icons: Record<StroyPowerIconId, string> = {
    gaz: iconGaz,
    el: iconEl,
  }
</script>

<style scoped>
  .stroy-power {
    background: var(--tm-ink);
    padding: 0 0 72px;
    color: var(--tm-white);
  }

  .stroy-power__inner {
    box-sizing: border-box;
    max-width: 1720px;
    margin: 0 auto;
    padding: 0 40px;
  }

  .stroy-power__title {
    margin: 0 0 40px;
    max-width: 889px;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(22px, 2.8vw, 36px);
    font-weight: 500;
    line-height: 1.25;
    text-transform: uppercase;
  }

  .stroy-power__scroll {
    position: relative;
  }

  .stroy-power__hand {
    display: none;
  }

  .stroy-power__wrap {
    position: relative;
    display: flex;
    gap: 19px;
    margin-bottom: 34px;
  }

  .stroy-power__vs {
    position: absolute;
    bottom: 0;
    left: calc(50% - 68px);
    z-index: 2;
    width: 136px;
    height: 86px;
    background: url('~/assets/images/stroitelstvo-data-czentrov/compare/vs-icon.svg')
      no-repeat center;
    pointer-events: none;
  }

  .stroy-power__card {
    position: relative;
    width: 100%;
    padding: 136px 30px 176px;
    border-radius: 40px;
    background: rgba(247, 247, 247, 0.06);
  }

  .stroy-power__icon {
    position: absolute;
    top: 40px;
    right: 40px;
    width: 96px;
    height: 120px;
    object-fit: contain;
  }

  .stroy-power__card-title {
    margin: 0 0 30px;
    color: #f6f6f6;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 28px;
    font-weight: 400;
    line-height: 34px;
  }

  .stroy-power__list {
    display: flex;
    flex-direction: column;
    gap: 15px;
    margin: 0;
    padding: 0;
    list-style: none;
  }

  .stroy-power__list li {
    padding-bottom: 15px;
    border-bottom: 1px solid rgba(247, 247, 247, 0.15);
  }

  .stroy-power__list li:last-child {
    margin: 0;
    padding: 0;
    border: 0;
  }

  .stroy-power__label {
    color: #757575;
    font-family: Mulish, 'Segoe UI', system-ui, sans-serif;
    font-size: 20px;
    font-weight: 500;
    line-height: 28px;
  }

  .stroy-power__text {
    margin: 0;
    color: rgba(246, 246, 246, 0.8);
    font-family: Mulish, 'Segoe UI', system-ui, sans-serif;
    font-size: 20px;
    font-weight: 500;
    line-height: 28px;
  }

  .stroy-power__item--row-2 {
    min-height: 156px;
  }

  .stroy-power__item--gaz-4,
  .stroy-power__item--row-7 {
    min-height: 116px;
  }

  .stroy-power__item--gaz-6 {
    min-height: 136px;
  }

  @media (max-width: 1439px) {
    .stroy-power__wrap {
      margin-bottom: 0;
    }

    .stroy-power__vs {
      display: none;
    }

    .stroy-power__card {
      padding: 30px 20px;
      border-radius: 25px;
    }

    .stroy-power__icon {
      top: 20px;
      right: 20px;
      width: 25px;
      height: 30px;
    }

    .stroy-power__card-title {
      margin-bottom: 10px;
      padding-bottom: 20px;
      border-bottom: 1px solid rgba(247, 247, 247, 0.15);
      font-size: 14px;
      line-height: 20px;
    }

    .stroy-power__list {
      gap: 10px;
    }

    .stroy-power__list li {
      margin-bottom: 10px;
      min-height: 0;
      padding-bottom: 15px;
    }

    .stroy-power__label,
    .stroy-power__text {
      font-size: 14px;
      font-weight: 400;
      line-height: 20px;
    }
  }

  @media (max-width: 767px) {
    .stroy-power__inner {
      padding: 0 16px;
    }

    .stroy-power__title {
      margin-bottom: 24px;
      text-align: center;
    }

    .stroy-power__scroll {
      width: 100%;
      margin-bottom: 20px;
      padding-top: 47px;
      overflow-x: auto;
      scrollbar-width: none;
    }

    .stroy-power__scroll::-webkit-scrollbar {
      width: 0;
      height: 0;
    }

    .stroy-power__hand {
      position: absolute;
      top: 0;
      left: 154px;
      display: block;
      width: 32px;
      height: 32px;
      background: url('~/assets/images/stroitelstvo-data-czentrov/compare/bxs_hand-up.svg')
        no-repeat center;
      animation: stroy-power-hand 5s linear infinite;
      pointer-events: none;
    }

    .stroy-power__wrap {
      gap: 10px;
      width: 530px;
      margin: 0;
    }

    .stroy-power__card {
      width: 260px;
      flex: 0 0 260px;
      padding: 30px 10px;
    }
  }

  @keyframes stroy-power-hand {
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
