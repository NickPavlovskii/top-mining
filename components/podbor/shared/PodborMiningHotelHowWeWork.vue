<template>
  <section
    class="podbor-how"
    aria-labelledby="podbor-how-title"
  >
    <div class="podbor-how__inner">
      <header class="podbor-how__header">
        <h2
          id="podbor-how-title"
          class="podbor-how__title"
        >
          {{ how.titleLead }}
        </h2>
        <p class="podbor-how__subtitle">
          {{ how.titleSub }}
        </p>
      </header>

      <div class="podbor-how__panel">
        <h3 class="podbor-how__panel-title">
          {{ how.panelTitle }}
        </h3>

        <div
          class="podbor-how__grid"
          aria-label="Этапы работы"
        >
          <article
            v-for="step in how.steps"
            :key="step.id"
            :class="[
              'podbor-how-card',
              {
                'podbor-how-card--highlight': step.highlight,
                'podbor-how-card--offer': step.id === 'offer',
                'podbor-how-card--place': step.id === 'place',
              },
            ]"
          >
            <span
              v-if="step.number"
              class="podbor-how-card__number"
            >
              {{ step.number }}
            </span>

            <p class="podbor-how-card__text">
              <template
                v-for="(part, index) in step.parts"
                :key="`${step.id}-${index}`"
              >
                <strong v-if="part.strong">{{ part.text }}</strong>
                <template v-else>
                  {{ part.text }}
                </template>
              </template>
            </p>
          </article>
        </div>
      </div>
    </div>
  </section>
</template>

<script setup lang="ts">
  const { howWeWork: how } = usePodborMiningHotelPage()
</script>

<style scoped>
  .podbor-how {
    background: var(--tm-page-bg);
    color: var(--tm-white);
    padding: 24px 0 80px;
  }

  .podbor-how__inner {
    max-width: 1700px;
    margin: 0 auto;
    padding: 0 40px;
  }

  .podbor-how__header {
    margin-bottom: 28px;
    text-align: left;
  }

  .podbor-how__title {
    margin: 0 0 8px;
    color: var(--tm-off-white);
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(28px, 3.4vw, 44px);
    font-weight: 500;
    line-height: 1.1;
    text-transform: uppercase;
  }

  .podbor-how__subtitle {
    margin: 0;
    color: rgba(255, 255, 255, 0.88);
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(16px, 1.6vw, 22px);
    font-weight: 400;
    line-height: 1.3;
    text-transform: uppercase;
  }

  .podbor-how__panel {
    padding: 36px 32px 32px;
    border-radius: 36px;
    background: #1b1b1b;
  }

  .podbor-how__panel-title {
    margin: 0 0 24px;
    color: var(--tm-off-white);
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(20px, 2vw, 28px);
    font-weight: 500;
    line-height: 1.2;
    text-transform: uppercase;
  }

  .podbor-how__grid {
    display: grid;
    grid-template-columns: repeat(3, minmax(0, 1fr));
    gap: 16px;
  }

  .podbor-how-card {
    position: relative;
    box-sizing: border-box;
    min-height: 168px;
    padding: 36px 22px 24px;
    border-radius: 24px;
    background: #242424;
    display: flex;
    align-items: center;
    justify-content: center;
    text-align: center;
  }

  .podbor-how-card--highlight {
    background: var(--tm-orange-accent-gradient-horizontal, var(--tm-orange));
  }

  .podbor-how-card--offer {
    grid-column: 1;
  }

  .podbor-how-card--place {
    grid-column: 2;
  }

  .podbor-how-card__number {
    position: absolute;
    top: 14px;
    left: 50%;
    transform: translateX(-50%);
    display: inline-flex;
    align-items: center;
    justify-content: center;
    width: 28px;
    height: 28px;
    border-radius: 50%;
    background: var(--tm-orange);
    color: #fff;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 13px;
    font-weight: 500;
    line-height: 1;
  }

  .podbor-how-card__text {
    margin: 0;
    color: var(--tm-off-white);
    font-size: 16px;
    line-height: 1.4;
  }

  .podbor-how-card__text strong {
    font-weight: 700;
  }

  .podbor-how-card--highlight .podbor-how-card__text {
    font-size: 18px;
    font-weight: 500;
  }

  @media (max-width: 1600px) {
    .podbor-how__inner {
      max-width: 1320px;
      padding: 0 32px;
    }
  }

  @media (max-width: 1299px) {
    .podbor-how__inner {
      padding: 0 24px;
    }

    .podbor-how__panel {
      padding: 28px 24px 24px;
      border-radius: 28px;
    }

    .podbor-how-card {
      min-height: 150px;
      padding: 34px 18px 20px;
    }

    .podbor-how-card__text {
      font-size: 15px;
    }
  }

  @media (max-width: 899px) {
    .podbor-how {
      padding: 16px 0 64px;
    }

    .podbor-how__inner {
      padding: 0 16px;
    }

    .podbor-how__header {
      margin-bottom: 20px;
      text-align: center;
    }

    .podbor-how__panel {
      padding: 24px 16px 16px;
      border-radius: 24px;
    }

    .podbor-how__panel-title {
      margin-bottom: 16px;
      text-align: center;
    }

    .podbor-how__grid {
      grid-template-columns: 1fr;
      gap: 12px;
    }

    .podbor-how-card--offer,
    .podbor-how-card--place {
      grid-column: auto;
    }

    .podbor-how-card {
      min-height: 132px;
    }
  }
</style>
