<template>
  <section
    class="catalog-section"
    aria-labelledby="catalog-title-part-1"
  >
    <div class="catalog-section__wrapper">
      <div class="catalog-section__inner">
        <div class="catalog-section__h1">
          <h2
            id="catalog-title-part-1"
            class="catalog-section__heading catalog-section__heading--part1"
          >
            Каталог
          </h2>
          <p class="catalog-section__desc catalog-section__desc--desktop">
            {{ meta.subtitle }}
          </p>
        </div>

        <h2 class="catalog-section__heading catalog-section__heading--part2">
          организаций
        </h2>

        <p class="catalog-section__desc catalog-section__desc--mobile">
          {{ meta.subtitle }}
        </p>

        <p class="catalog-section__utp">
          <img
            class="catalog-section__utp-star"
            alt=""
            aria-hidden="true"
            :src="utpStar"
          />
          <span>
            Более
            <span class="catalog-section__utp-accent">
              {{ formattedReviews }} отзывов
            </span>
            от клиентов в майнинге
          </span>
        </p>

        <form
          class="catalog-section__search"
          action="/sale_miners/"
          @submit.prevent
        >
          <label class="catalog-section__search-field">
            <span
              class="catalog-section__search-icon"
              aria-hidden="true"
            >
              <img
                alt=""
                class="catalog-section__search-icon-img"
                :src="catalogSearchIcon"
              />
            </span>
            <input
              v-model="searchQuery"
              type="search"
              name="search"
              class="catalog-section__search-input"
              placeholder="Поиск по названию"
              autocomplete="off"
            />
          </label>
        </form>

        <div class="catalog-section__categories">
          <catalog-category-row
            v-for="category in visibleCategories"
            :key="category.id"
            :category="category"
          />
        </div>

        <div class="catalog-section__more">
          <top-mining-more-link
            to="/sale_miners/"
            label="ещё категории"
          />
        </div>
      </div>
    </div>
  </section>
</template>

<script setup lang="ts">
  import { CATALOG_FALLBACK } from '~/common/modules/catalog'
  import type { CatalogResponse } from '~/types/catalog'
  import utpStar from '~/assets/images/top-mining/utp-star.png'
  import catalogSearchIcon from '~/assets/images/catalog/search.png'

  const searchQuery = ref('')

  const { data } = await useFetch<CatalogResponse>('/api/catalog', {
    default: () => ({
      ...CATALOG_FALLBACK,
      updatedAt: new Date().toISOString(),
    }),
  })

  const meta = computed(() => data.value?.meta ?? CATALOG_FALLBACK.meta)
  const categories = computed(
    () => data.value?.categories ?? CATALOG_FALLBACK.categories,
  )

  const formattedReviews = computed(() =>
    new Intl.NumberFormat('ru-RU').format(meta.value.totalReviews),
  )

  const categoriesWithOrganizations = computed(() =>
    categories.value.filter((category) => category.organizations.length > 0),
  )

  const visibleCategories = computed(() => {
    const query = searchQuery.value.trim().toLowerCase()
    const base = categoriesWithOrganizations.value

    if (!query) {
      return base
    }

    return base
      .map((category) => ({
        ...category,
        organizations: category.organizations.filter((organization) =>
          organization.name.toLowerCase().includes(query),
        ),
      }))
      .filter((category) => category.organizations.length > 0)
  })
</script>

<style scoped>
  .catalog-section {
    position: relative;
    z-index: 5;
    width: 100%;
    display: flex;
    justify-content: center;
    margin-top: -64px;
    padding-top: 64px;
    background: var(--tm-rating-surface);
  }

  .catalog-section__wrapper {
    position: relative;
    z-index: 1;
    display: flex;
    flex-direction: column;
    width: 100%;
    box-sizing: border-box;
    padding-bottom: clamp(96px, 11vw, 208px);
    border-radius: 64px 64px 0 0;
    background: #f2f2f2;
    overflow: hidden;
    text-align: center;
  }

  .catalog-section__inner {
    width: 100%;
    max-width: 1770px;
    margin: 0 auto;
    padding: clamp(48px, 6vw, 88px) clamp(16px, 4vw, 60px) 0;
    text-align: left;
    box-sizing: border-box;
  }

  .catalog-section__h1 {
    display: flex;
    flex-direction: row;
    align-items: flex-start;
  }

  .catalog-section__heading {
    margin: 0;
    max-width: 100%;
    color: #141414;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(40px, 7.2vw, 120px);
    font-weight: 500;
    line-height: 1.05;
    letter-spacing: 0;
    text-transform: uppercase;
    overflow-wrap: break-word;
  }

  .catalog-section__desc {
    margin: 0;
    color: #141414;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(16px, 2vw, 28px);
    font-weight: 400;
    line-height: 1.2;
    text-align: left;
  }

  .catalog-section__desc--desktop {
    display: none;
    margin: 41px 0 10px 24px;
    max-width: 808px;
  }

  .catalog-section__desc--mobile {
    display: block;
    margin-top: 16px;
    max-width: 640px;
  }

  .catalog-section__utp {
    display: inline-flex;
    align-items: center;
    justify-content: flex-start;
    gap: 6px;
    width: 100%;
    margin: clamp(20px, 3vw, 32px) 0 clamp(28px, 4vw, 40px);
    color: #141414;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(15px, 1.5vw, 18px);
    font-weight: 400;
    line-height: 1.35;
    text-align: left;
  }

  .catalog-section__utp-star {
    width: 18px;
    height: 18px;
    flex-shrink: 0;
    object-fit: contain;
    margin-right: -2px;
  }

  .catalog-section__utp-accent {
    color: var(--tm-orange);
    font-weight: 600;
  }

  .catalog-section__search {
    display: block;
    width: 100%;
    margin: 0 0 clamp(48px, 6vw, 72px);
  }

  .catalog-section__heading--part2 {
    margin: 0 0 0 clamp(0px, 8vw, 128px);
  }

  .catalog-section__search-field {
    display: flex;
    align-items: center;
    gap: 12px;
    width: 100%;
    min-height: 56px;
    padding: 0 clamp(18px, 2vw, 24px);
    border-radius: 999px;
    background: #fff;
    box-shadow: inset 0 0 0 1px rgba(0, 0, 0, 0.04);
    cursor: text;
  }

  .catalog-section__search-icon {
    display: inline-flex;
    flex-shrink: 0;
    width: 16px;
    height: 16px;
  }

  .catalog-section__search-icon-img {
    display: block;
    width: 100%;
    height: 100%;
    object-fit: contain;
  }

  .catalog-section__search-input {
    width: 100%;
    border: 0;
    background: transparent;
    color: #141414;
    font-size: 16px;
    line-height: 1.2;
    outline: none;
  }

  .catalog-section__search-input::placeholder {
    color: var(--tm-text-placeholder);
  }

  .catalog-section__categories {
    display: grid;
    gap: clamp(32px, 4vw, 56px);
    margin-bottom: clamp(32px, 4vw, 48px);
    overflow: hidden;
  }

  .catalog-section__more {
    width: 100%;
    max-width: 100%;
  }

  .catalog-section__more :deep(.top-mining-more-link) {
    min-height: 64px;
    font-size: clamp(16px, 1.2vw, 20px);
    line-height: 1;
  }

  @media (min-width: 901px) {
    .catalog-section__desc--desktop {
      display: block;
    }

    .catalog-section__desc--mobile {
      display: none;
    }
  }

  @media (max-width: 900px) {
    .catalog-section {
      margin-top: -48px;
      padding-top: 48px;
      background: var(--tm-rating-surface);
    }

    .catalog-section__wrapper {
      border-radius: 32px 32px 0 0;
      box-shadow: 0 -1px 0 var(--tm-rating-surface);
    }

    .catalog-section__h1 {
      flex-direction: column;
      align-items: flex-start;
      gap: 0;
    }

    .catalog-section__heading {
      max-width: 100%;
      font-size: clamp(36px, 11vw, 72px);
      line-height: 1.05;
    }

    .catalog-section__heading--part2 {
      margin: 0;
    }
  }

  @media (max-width: 560px) {
    .catalog-section {
      margin-top: -40px;
      padding-top: 40px;
    }

    .catalog-section__inner {
      padding-inline: 16px;
    }

    .catalog-section__heading--part1,
    .catalog-section__heading--part2 {
      font-size: clamp(33px, 8.5vw, 89px);
      line-height: 1.05;
    }

    .catalog-section__utp {
      gap: 15px;
      align-items: flex-start;
    }

    .catalog-section__utp-star {
      width: 16px;
      height: 16px;
      margin-top: 2px;
      margin-right: -4px;
    }
  }
</style>
