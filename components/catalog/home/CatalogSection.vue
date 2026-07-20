<template>
  <section
    class="catalog-section"
    aria-labelledby="catalog-title-part-1"
  >
    <div class="catalog-section__wrapper">
      <div class="catalog-section__inner">
        <div class="catalog-section__header">
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
        </div>

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
          :action="CATALOG_PAGE_HREF"
          @submit.prevent
        >
          <label class="catalog-section__search-field">
            <input
              v-model="searchQuery"
              type="search"
              name="search"
              class="catalog-section__search-input"
              placeholder="Поиск по названию"
              autocomplete="off"
            />
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
            :to="CATALOG_PAGE_HREF"
            label="ещё категории"
          />
        </div>
      </div>
    </div>
  </section>
</template>

<script setup lang="ts">
  /**
   * Главная секция каталога на главной странице с поиском и категориями.
   */
  import { EMPTY_CATALOG_META, emptyCatalogResponse } from '~/common/modules/catalog'
  import { CATALOG_PAGE_HREF } from '~/common/modules/catalog/nav-links'
  import type { CatalogResponse } from '~/common/modules/catalog'
  import utpStar from '~/assets/images/catalog/star-24.png'
  import catalogSearchIcon from '~/assets/images/catalog/search.png'

  const searchQuery = ref('')

  const { data } = await useFetch<CatalogResponse>('/api/catalog', {
    default: () => emptyCatalogResponse(),
  })

  const meta = computed(
    () => data.value?.meta ?? EMPTY_CATALOG_META,
  )
  const categories = computed(() => data.value?.categories ?? [])

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

  .catalog-section__header {
    width: 100%;
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
    font-size: clamp(14px, 2vw, 28px);
    line-height: 1.43;
  }

  .catalog-section__utp {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    gap: 6px;
    width: 100%;
    margin: clamp(20px, 3vw, 32px) 0 clamp(28px, 4vw, 40px);
    color: #141414;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(15px, 1.5vw, 18px);
    font-weight: 400;
    line-height: 1.35;
    text-align: center;
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
    background-image: linear-gradient(
      90deg,
      #d8480d 0%,
      #cb3a08 33.9%,
      #fe731e 73.9%,
      #ed5f17 100%
    );
    background-size: 100%;
    background-repeat: repeat;
    background-clip: text;
    -webkit-background-clip: text;
    color: transparent;
    -webkit-text-fill-color: transparent;
  }

  .catalog-section__search-field {
    display: flex;
    align-items: center;
    gap: 12px;
    width: 100%;
    max-width: 300px;
    min-height: 48px;
    padding: 0 16px;
    border: 1px solid #e5e7eb;
    border-radius: 16px;
    background: #fff;
    box-sizing: border-box;
    cursor: text;
  }

  .catalog-section__search-icon {
    display: inline-flex;
    flex-shrink: 0;
    width: 16px;
    height: 16px;
    opacity: 0.72;
  }

  .catalog-section__search-icon-img {
    display: block;
    width: 100%;
    height: 100%;
    object-fit: contain;
  }

  .catalog-section__search-input {
    width: 100%;
    min-width: 0;
    border: 0;
    background: transparent;
    color: #374151;
    font-family: inherit;
    font-size: 15px;
    font-weight: 400;
    line-height: 1.2;
    outline: none;
  }

  .catalog-section__search-input::placeholder {
    color: #6b7280;
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

  @media (min-width: 768px) {
    .catalog-section__desc--desktop {
      display: block;
    }

    .catalog-section__desc--mobile {
      display: none;
    }
  }

  @media (max-width: 767px) {
    .catalog-section {
      margin-top: -48px;
      padding-top: 48px;
      background: var(--tm-rating-surface);
    }

    .catalog-section__wrapper {
      border-radius: 32px 32px 0 0;
      box-shadow: 0 -1px 0 var(--tm-rating-surface);
    }

    .catalog-section__inner {
      padding: 32px 16px 0;
    }

    .catalog-section__header {
      display: flex;
      flex-direction: column;
      align-items: stretch;
      width: 100%;
      gap: 0;
    }

    .catalog-section__h1 {
      flex-direction: column;
      align-items: flex-start;
      gap: 0;
    }

    .catalog-section__heading {
      max-width: 100%;
      font-size: 24px;
      line-height: 28px;
      font-weight: 500;
    }

    .catalog-section__heading--part1 {
      width: fit-content;
      margin: 0 0 0 10px;
      text-align: left;
      color: #141414;
      -webkit-text-fill-color: #141414;
    }

    .catalog-section__heading--part2 {
      width: fit-content;
      margin: 0 10px 0 auto;
      text-align: right;
    }

    .catalog-section__desc--mobile {
      max-width: 300px;
      margin: 16px 0 20px 10px;
      font-size: 14px;
      line-height: 20px;
      font-weight: 500;
    }

    .catalog-section__utp {
      gap: 15px;
      margin-top: 20px;
      justify-content: flex-start;
      text-align: left;
      padding-left: 10px;
    }

    .catalog-section__utp-star {
      width: 16px;
      height: 16px;
      margin-right: -4px;
    }
  }

  @media (max-width: 560px) {
    .catalog-section {
      margin-top: -40px;
      padding-top: 40px;
    }
  }
</style>
