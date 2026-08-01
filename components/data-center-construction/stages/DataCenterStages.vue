<template>
  <section
    class="data-center-stages"
    aria-labelledby="data-center-stages-title"
  >
    <div class="data-center-stages__inner">
      <h2
        id="data-center-stages-title"
        class="data-center-stages__title"
      >
        {{ copy.title }}
      </h2>

      <div class="data-center-stages__wrap">
        <div
          class="data-center-stages__glow data-center-stages__glow--1"
          aria-hidden="true"
        />
        <div
          class="data-center-stages__glow data-center-stages__glow--2"
          aria-hidden="true"
        />

        <article
          v-for="(item, index) in copy.items"
          :key="item.title"
          class="data-center-stages__card"
        >
          <h3 class="data-center-stages__card-title">
            {{ item.title }}
          </h3>

          <div class="data-center-stages__card-body">
            <div
              v-if="item.intro"
              :class="[
                'data-center-stages__intro',
                item.introLast && 'data-center-stages__intro--last',
              ]"
            >
              {{ item.intro }}
            </div>

            <p
              v-for="(point, pointIndex) in item.points ?? []"
              :key="`${index}-${pointIndex}`"
              :class="[
                'data-center-stages__point',
                isLastPointWithoutExample(item, pointIndex) &&
                  'data-center-stages__point--last',
              ]"
              v-html="point"
            />

            <template v-if="item.example">
              <div class="data-center-stages__example-badge">
                Пример:
              </div>
              <p class="data-center-stages__example">
                {{ item.example }}
              </p>
            </template>
          </div>
        </article>
      </div>
    </div>
  </section>
</template>

<script setup lang="ts">
  import {
    DATA_CENTER_CONSTRUCTION_PAGE,
    type DataCenterStageItem,
  } from '~/common/modules/top-mining/data-center-construction-page'

  const copy = DATA_CENTER_CONSTRUCTION_PAGE.stages

  function isLastPointWithoutExample(
    item: DataCenterStageItem,
    pointIndex: number,
  ): boolean {
    const points = item.points
    if (!points?.length) {
      return false
    }
    const isLast = pointIndex === points.length - 1
    return isLast && !item.example
  }
</script>

<style scoped>
  .data-center-stages {
    position: relative;
    z-index: 0;
    overflow: visible;
    background: var(--tm-ink);
    padding: 0 0 72px;
    color: var(--tm-white);
  }

  .data-center-stages__inner {
    box-sizing: border-box;
    max-width: 1720px;
    margin: 0 auto;
    padding: 0 40px;
  }

  .data-center-stages__title {
    margin: 0 0 32px;
    max-width: 1141px;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(22px, 2.8vw, 36px);
    font-weight: 500;
    line-height: 1.25;
    text-transform: uppercase;
  }

  .data-center-stages__wrap {
    position: relative;
    display: flex;
    flex-direction: column;
    gap: 20px;
    margin-bottom: 68px;
  }

  .data-center-stages__glow {
    position: absolute;
    z-index: 0;
    pointer-events: none;
  }

  .data-center-stages__glow--1 {
    right: -150px;
    top: -665px;
    width: 765px;
    height: 883px;
    background: url('~/assets/images/data-center-construction/cl-1.png')
      no-repeat center;
  }

  .data-center-stages__glow--2 {
    left: -100px;
    bottom: -650px;
    width: 1224px;
    height: 1299px;
    background: url('~/assets/images/data-center-construction/cl-2.png')
      no-repeat center;
  }

  .data-center-stages__card {
    position: relative;
    z-index: 1;
    display: flex;
    justify-content: space-between;
    gap: 40px;
    width: 100%;
    height: fit-content;
    padding: 40px;
    border: 1px solid rgba(247, 247, 247, 0.15);
    border-radius: 50px;
    background: #101010;
  }

  .data-center-stages__card-title {
    margin: 0;
    width: 100%;
    max-width: 510px;
    color: #f6f6f6;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 28px;
    font-weight: 400;
    line-height: 34px;
  }

  .data-center-stages__card-body {
    width: 100%;
    max-width: 813px;
    font-family: Mulish, 'Segoe UI', system-ui, sans-serif;
    font-size: 18px;
    font-weight: 400;
    line-height: 24px;
  }

  .data-center-stages__intro {
    margin-bottom: 20px;
    padding: 15px 20px;
    border-radius: 20px;
    background: rgba(247, 247, 247, 0.06);
    color: #f6f6f6;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 16px;
    font-weight: 400;
    line-height: 22px;
  }

  .data-center-stages__intro--last {
    margin: 0;
    padding-right: 40px;
  }

  .data-center-stages__point {
    margin: 0 0 20px;
    color: rgba(246, 246, 246, 0.8);
    font-family: Mulish, 'Segoe UI', system-ui, sans-serif;
    font-size: 18px;
    font-weight: 400;
    line-height: 24px;
  }

  .data-center-stages__point--last {
    margin-bottom: 0;
  }

  .data-center-stages__point :deep(b) {
    color: #fff;
    font-weight: 600;
  }

  .data-center-stages__example-badge {
    width: fit-content;
    margin: 40px 0 20px;
    padding: 5px 10px;
    border-radius: 20px;
    background: linear-gradient(94.62deg, #ff741f 2.04%, #ec5100 49.92%);
    color: #fff;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 16px;
    font-weight: 400;
    line-height: 22px;
  }

  .data-center-stages__example {
    margin: 0;
    color: rgba(246, 246, 246, 0.8);
    font-family: Mulish, 'Segoe UI', system-ui, sans-serif;
    font-size: 18px;
    font-weight: 400;
    line-height: 24px;
  }

  @media (max-width: 1730px) {
    .data-center-stages__title {
      max-width: 780px;
    }

    .data-center-stages__card-body {
      max-width: 610px;
    }
  }

  @media (max-width: 1439px) {
    .data-center-stages__wrap {
      margin-bottom: 40px;
    }

    .data-center-stages__glow--1 {
      top: -337px;
      width: 500px;
      height: 500px;
      background-size: cover;
    }

    .data-center-stages__glow--2 {
      left: -57px;
      bottom: -315px;
      width: 700px;
      height: 700px;
      background-size: cover;
    }

    .data-center-stages__card {
      flex-direction: column;
      gap: 20px;
      padding: 20px;
      border-radius: 25px;
    }

    .data-center-stages__card-title {
      max-width: none;
      font-size: 16px;
      line-height: 22px;
    }

    .data-center-stages__card-body {
      max-width: 100%;
    }

    .data-center-stages__intro {
      font-size: 14px;
      font-weight: 600;
      line-height: 20px;
    }

    .data-center-stages__point,
    .data-center-stages__example {
      margin-bottom: 15px;
      font-size: 14px;
      line-height: 20px;
    }

    .data-center-stages__example {
      margin-bottom: 0;
    }

    .data-center-stages__example-badge {
      width: 93px;
      height: 30px;
      margin: 20px 0;
      font-size: 14px;
      line-height: 20px;
      display: flex;
      align-items: center;
      justify-content: center;
      box-sizing: border-box;
    }
  }

  @media (max-width: 767px) {
    .data-center-stages__inner {
      padding: 0 16px;
    }

    .data-center-stages__intro {
      font-family: Mulish, 'Segoe UI', system-ui, sans-serif;
    }
  }
</style>
