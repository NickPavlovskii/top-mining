<template>
  <section
    class="podbor-security"
    aria-labelledby="podbor-security-title"
  >
    <div class="podbor-security__inner">
      <h2
        id="podbor-security-title"
        class="podbor-security__title"
      >
        {{ security.title }}
      </h2>

      <div class="podbor-security__grid">
        <article
          v-for="card in security.cards"
          :key="card.id"
          class="podbor-security-card"
        >
          <h3 class="podbor-security-card__title">
            {{ card.title }}
          </h3>
          <p class="podbor-security-card__accent">
            {{ card.accent }}
          </p>

          <ul class="podbor-security-card__list">
            <li
              v-for="(item, index) in card.items"
              :key="`${card.id}-${index}`"
              class="podbor-security-card__item"
            >
              {{ item }}
            </li>
          </ul>
        </article>
      </div>

      <p class="podbor-security__note">
        {{ security.note }}
      </p>
    </div>
  </section>
</template>

<script setup lang="ts">
  import { PODBOR_MINING_HOTEL_SECURITY } from '~/common/modules/top-mining/podbor/mining-hotel'

  const security = PODBOR_MINING_HOTEL_SECURITY
</script>

<style scoped>
  .podbor-security {
    background: var(--tm-page-bg);
    color: var(--tm-white);
    padding: 24px 0 88px;
  }

  .podbor-security__inner {
    max-width: 1700px;
    margin: 0 auto;
    padding: 0 40px;
  }

  .podbor-security__title {
    margin: 0 0 40px;
    color: var(--tm-off-white);
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(28px, 3.4vw, 48px);
    font-weight: 500;
    line-height: 1.15;
    text-transform: uppercase;
  }

  .podbor-security__grid {
    display: grid;
    grid-template-columns: repeat(2, minmax(0, 1fr));
    gap: 24px;
    align-items: stretch;
  }

  .podbor-security-card {
    display: flex;
    flex-direction: column;
    min-height: 100%;
    padding: 36px 32px;
    border-radius: 28px;
    background: #1b1b1b;
  }

  .podbor-security-card__title {
    margin: 0 0 16px;
    color: var(--tm-off-white);
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(20px, 1.8vw, 28px);
    font-weight: 500;
    line-height: 1.25;
  }

  .podbor-security-card__accent {
    margin: 0 0 24px;
    color: var(--tm-orange);
    font-size: clamp(15px, 1.2vw, 18px);
    font-weight: 500;
    line-height: 1.4;
  }

  .podbor-security-card__list {
    margin: 0;
    padding: 24px 28px;
    list-style: none;
    border-radius: 20px;
    background: var(--tm-page-bg);
    display: flex;
    flex-direction: column;
    gap: 18px;
    flex: 1;
  }

  .podbor-security-card__item {
    color: rgba(255, 255, 255, 0.72);
    font-size: 16px;
    line-height: 1.45;
  }

  .podbor-security__note {
    margin: 20px 0 0;
    text-align: right;
    color: rgba(255, 255, 255, 0.35);
    font-size: 13px;
    line-height: 1.3;
  }

  @media (max-width: 1600px) {
    .podbor-security__inner {
      max-width: 1320px;
      padding: 0 32px;
    }
  }

  @media (max-width: 1299px) {
    .podbor-security__inner {
      padding: 0 24px;
    }

    .podbor-security-card {
      padding: 28px 24px;
      border-radius: 24px;
    }

    .podbor-security-card__list {
      padding: 20px 22px;
      gap: 14px;
    }

    .podbor-security-card__item {
      font-size: 15px;
    }
  }

  @media (max-width: 899px) {
    .podbor-security {
      padding: 16px 0 64px;
    }

    .podbor-security__inner {
      padding: 0 16px;
    }

    .podbor-security__title {
      margin-bottom: 24px;
      font-size: 26px;
    }

    .podbor-security__grid {
      grid-template-columns: 1fr;
      gap: 16px;
    }

    .podbor-security-card {
      padding: 24px 20px;
    }

    .podbor-security-card__title {
      font-size: 20px;
    }

    .podbor-security__note {
      text-align: left;
      margin-top: 16px;
    }
  }
</style>
