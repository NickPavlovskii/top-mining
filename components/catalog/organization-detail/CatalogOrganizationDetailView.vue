<template>
  <div class="org-detail">
    <div class="org-detail__inner">
      <nav
        class="org-detail__breadcrumbs"
        aria-label="Хлебные крошки"
      >
        <NuxtLink to="/">Главная</NuxtLink>
        <span aria-hidden="true">/</span>
        <NuxtLink :to="categoryHref">
          {{ organization.categoryName }}
        </NuxtLink>
        <span aria-hidden="true">/</span>
        <span>{{ organization.name }}</span>
      </nav>

      <header class="org-detail__hero">
        <div class="org-detail__hero-text">
          <h1 class="org-detail__title">
            <span class="org-detail__title-main">{{ heroTitleMain }}</span>
            <span
              v-if="heroTitleSub"
              class="org-detail__title-sub"
            >
              {{ heroTitleSub }}
            </span>
          </h1>
          <p class="org-detail__rating">
            {{ ratingLabel }}
          </p>
        </div>

        <div
          v-if="heroLogoUrl"
          :class="['org-detail__logo-card', heroLogoCardClass]"
        >
          <img
            :src="heroLogoUrl"
            :alt="organization.name"
            class="org-detail__logo-image"
          />
        </div>
      </header>

      <section
        v-if="organization.aboutHtml"
        class="org-detail__card org-detail__about-card"
      >
        <h2 class="org-detail__card-title">
          О компании {{ organization.name }}
        </h2>
        <div
          :class="[
            'org-detail__about',
            { 'org-detail__about--collapsed': !aboutExpanded },
          ]"
          v-html="organization.aboutHtml"
        />
        <button
          v-if="!aboutExpanded"
          type="button"
          class="org-detail__read-more"
          @click="aboutExpanded = true"
        >
          Читать дальше
        </button>
      </section>

      <div class="org-detail__layout">
        <div class="org-detail__main">
          <section
            v-if="organization.equipmentSales"
            class="org-detail__card org-detail__card--stretch"
          >
            <h2 class="org-detail__card-title">
              Продажа оборудования
            </h2>
            <div class="org-detail__rows">
              <div class="org-detail__row">
                <span class="org-detail__row-label">Тип оборудования</span>
                <span class="org-detail__row-value">
                  {{ organization.equipmentSales.equipmentType }}
                </span>
              </div>
              <div class="org-detail__row">
                <span class="org-detail__row-label">Состояние оборудования</span>
                <span class="org-detail__row-value">
                  {{ organization.equipmentSales.equipmentCondition }}
                </span>
              </div>
              <div class="org-detail__row">
                <span class="org-detail__row-label">Объем продаж</span>
                <span class="org-detail__row-value">
                  {{ organization.equipmentSales.salesVolume }}
                </span>
              </div>
              <div class="org-detail__row">
                <span class="org-detail__row-label">Наличие</span>
                <span class="org-detail__row-value">
                  {{ organization.equipmentSales.availability }}
                </span>
              </div>
            </div>
            <div
              v-if="organization.equipmentSales.extras.length"
              class="org-detail__extras"
            >
              <p class="org-detail__extras-title">
                Дополнительно при покупке асиков:
              </p>
              <ul class="org-detail__extras-list">
                <li
                  v-for="extra in organization.equipmentSales.extras"
                  :key="extra"
                >
                  {{ extra }}
                </li>
              </ul>
            </div>
          </section>
        </div>

        <aside class="org-detail__sidebar">
          <section class="org-detail__top-control">
            <span
              class="org-detail__top-ribbon"
              aria-hidden="true"
            />

            <div class="org-detail__top-control-content">
              <div class="org-detail__top-control-head">
                <h2 class="org-detail__top-control-title">
                  ТОП МАЙНИНГ
                </h2>
                <Icon
                  name="mdi:check-decagram"
                  class="org-detail__top-control-badge"
                  aria-hidden="true"
                />
              </div>
              <p class="org-detail__top-control-subtitle">
                Проверка ТОП МАЙНИНГ:
              </p>
              <div class="org-detail__top-control-rows">
                <div class="org-detail__top-control-row">
                  <span class="org-detail__top-control-label">Договора</span>
                  <verification-status-badge
                    :verified="organization.verification.contracts"
                  />
                </div>
                <div class="org-detail__top-control-row">
                  <span class="org-detail__top-control-label">Юридическое лицо</span>
                  <verification-status-badge
                    :verified="organization.verification.legalEntity"
                  />
                </div>
              </div>
            </div>
          </section>

          <section class="org-detail__card org-detail__contacts-card org-detail__card--stretch">
            <span class="org-detail__rating-badge">
              {{ ratingLabel }}
            </span>

            <ul class="org-detail__contacts">
              <li
                v-if="organization.foundedYear"
                class="org-detail__contact"
              >
                <Icon
                  name="mdi:calendar-month-outline"
                  class="org-detail__contact-icon"
                  aria-hidden="true"
                />
                <span>Год основания: {{ organization.foundedYear }}</span>
              </li>
              <li
                v-if="organization.website"
                class="org-detail__contact"
              >
                <Icon
                  name="mdi:web"
                  class="org-detail__contact-icon"
                  aria-hidden="true"
                />
                <a
                  :href="organization.website"
                  target="_blank"
                  rel="noopener noreferrer"
                >
                  {{ organization.website }}
                </a>
              </li>
              <li
                v-if="organization.phone"
                class="org-detail__contact"
              >
                <Icon
                  name="mdi:phone-outline"
                  class="org-detail__contact-icon"
                  aria-hidden="true"
                />
                <a :href="phoneHref">
                  {{ organization.phone }}
                </a>
              </li>
              <li
                v-if="organization.email"
                class="org-detail__contact"
              >
                <Icon
                  name="mdi:email-outline"
                  class="org-detail__contact-icon"
                  aria-hidden="true"
                />
                <a :href="`mailto:${organization.email}`">
                  {{ organization.email }}
                </a>
              </li>
              <li
                v-if="organization.workHours"
                class="org-detail__contact"
              >
                <Icon
                  name="mdi:clock-outline"
                  class="org-detail__contact-icon"
                  aria-hidden="true"
                />
                <span>{{ organization.workHours }}</span>
              </li>
              <li
                v-for="(address, index) in organization.addresses"
                :key="`${address.city}-${index}`"
                class="org-detail__contact"
              >
                <Icon
                  name="mdi:map-marker-outline"
                  class="org-detail__contact-icon"
                  aria-hidden="true"
                />
                <span>{{ address.addressLine }}</span>
              </li>
            </ul>
          </section>
        </aside>
      </div>

      <div class="org-detail__full-width">
        <section
          v-if="organization.miningHotel"
          class="org-detail__card org-detail__card--full"
        >
          <h2 class="org-detail__card-title">
            Майнинг-отель {{ organization.name }}
          </h2>
          <div class="org-detail__rows org-detail__rows--wide">
            <div class="org-detail__row">
              <span class="org-detail__row-label">Цена за кВт/ч</span>
              <span class="org-detail__row-value">
                {{ organization.miningHotel.pricePerKwhLabel }}
              </span>
            </div>
            <div
              v-if="organization.miningHotel.sitesCount"
              class="org-detail__row"
            >
              <span class="org-detail__row-label">Количество площадок</span>
              <span class="org-detail__row-value">
                {{ organization.miningHotel.sitesCount }}
              </span>
            </div>
            <div
              v-if="organization.miningHotel.totalCapacityMw"
              class="org-detail__row"
            >
              <span class="org-detail__row-label">Мощности площадок</span>
              <span class="org-detail__row-value">
                {{ organization.miningHotel.totalCapacityMw }} МВт
              </span>
            </div>
            <div
              v-if="organization.miningHotel.siteCities"
              class="org-detail__row"
            >
              <span class="org-detail__row-label">Города площадок</span>
              <span class="org-detail__row-value">
                {{ organization.miningHotel.siteCities }}
              </span>
            </div>
            <div
              v-if="organization.miningHotel.minDevicesLabel"
              class="org-detail__row"
            >
              <span class="org-detail__row-label">
                Количество устройств для размещения
              </span>
              <span class="org-detail__row-value">
                {{ organization.miningHotel.minDevicesLabel }}
              </span>
            </div>
            <div
              v-if="organization.miningHotel.energyType"
              class="org-detail__row"
            >
              <span class="org-detail__row-label">Тип энергии</span>
              <span class="org-detail__row-value">
                {{ organization.miningHotel.energyType }}
              </span>
            </div>
          </div>
        </section>

        <section
          v-if="organization.paymentTerms"
          class="org-detail__card org-detail__card--full"
        >
          <h2 class="org-detail__card-title org-detail__card-title--upper">
            Оплата услуг
          </h2>
          <div class="org-detail__rows org-detail__rows--wide">
            <div
              v-if="organization.paymentTerms.paymentMethods.length"
              class="org-detail__row"
            >
              <span class="org-detail__row-label">Оплата</span>
              <span class="org-detail__row-value">
                {{ organization.paymentTerms.paymentMethods.join(', ') }}
              </span>
            </div>
            <div
              v-if="organization.paymentTerms.paymentFormats.length"
              class="org-detail__row"
            >
              <span class="org-detail__row-label">Формат оплаты</span>
              <span class="org-detail__row-value">
                {{ organization.paymentTerms.paymentFormats.join(', ') }}
              </span>
            </div>
            <div
              v-if="organization.paymentTerms.extraTerms.length"
              class="org-detail__row"
            >
              <span class="org-detail__row-label">Доп. условия оплаты</span>
              <span class="org-detail__row-value">
                {{ organization.paymentTerms.extraTerms.join(', ') }}
              </span>
            </div>
            <div
              v-if="organization.paymentTerms.contractForms.length"
              class="org-detail__row"
            >
              <span class="org-detail__row-label">Форма договора</span>
              <span class="org-detail__row-value">
                {{ organization.paymentTerms.contractForms.join(', ') }}
              </span>
            </div>
          </div>
        </section>

        <section
          v-if="organization.showArticleBlock && organization.legalProfile"
          class="org-detail__card org-detail__card--full org-detail__more-card"
        >
          <div class="org-detail__more">
            <div class="org-detail__more-text">
              <h2 class="org-detail__more-title">
                Подробнее
              </h2>
              <component
                :is="organization.articleHref ? 'NuxtLink' : 'span'"
                :to="organization.articleHref || undefined"
                class="org-detail__more-link"
              >
                <Icon
                  name="mdi:link-variant"
                  class="org-detail__more-link-icon"
                  aria-hidden="true"
                />
                Читать статью
              </component>
            </div>
            <img
              src="/images/catalog/org-detail-cursor.png"
              alt=""
              class="org-detail__more-cursor"
              aria-hidden="true"
            />
          </div>
        </section>

        <section
          v-if="organization.legalProfile"
          class="org-detail__card org-detail__card--full org-detail__rusprofile-card"
        >
          <div class="org-detail__rusprofile-head">
            <h2 class="org-detail__rusprofile-title">
              rusprofile
            </h2>
            <img
              src="/images/catalog/rusprofile-logo.png"
              alt="Rusprofile"
              class="org-detail__rusprofile-logo"
            />
          </div>
          <p class="org-detail__rusprofile-name">
            {{ organization.legalProfile.legalName }}
          </p>
          <div class="org-detail__rusprofile-table">
            <div
              v-for="row in legalProfileRows"
              :key="row.label"
              class="org-detail__rusprofile-row"
            >
              <span class="org-detail__rusprofile-label">
                {{ row.label }}
              </span>
              <span class="org-detail__rusprofile-value">
                <span
                  v-if="row.isReliabilityBadge && row.value"
                  class="org-detail__reliability-badge"
                >
                  {{ row.value }}
                </span>
                <template v-else>
                  {{ row.value }}
                </template>
              </span>
            </div>
          </div>
        </section>
      </div>

      <catalog-organization-gallery
        v-if="organization.showGallery && organization.gallery.length"
        :images="organization.gallery"
      />

      <catalog-organization-reviews
        :organization-slug="organization.slug"
        :organization-name="organization.name"
        :rating="organization.rating"
        :has-public-rating="organization.hasPublicRating"
        :review-count="organization.reviewCount"
        @stats-updated="onReviewStatsUpdated"
      />
    </div>
  </div>
</template>

<script setup lang="ts">
  import { getCatalogCategoryHref } from '~/common/modules/catalog/nav-links'
  import CatalogOrganizationGallery from '~/components/catalog/organization-detail/CatalogOrganizationGallery.vue'
  import CatalogOrganizationReviews from '~/components/catalog/organization-detail/CatalogOrganizationReviews.vue'
  import VerificationStatusBadge from '~/components/catalog/VerificationStatusBadge.vue'
  import type { CatalogOrganizationDetail } from '~/types/catalog-organization-detail'
  import type { OrganizationReviewStats } from '~/types/organization-reviews'

  const props = defineProps<{
    organization: CatalogOrganizationDetail
  }>()

  const aboutExpanded = ref(false)

  const organizationStats = ref({
    rating: props.organization.rating,
    reviewCount: props.organization.reviewCount,
    hasPublicRating: props.organization.hasPublicRating,
  })

  watch(
    () => props.organization,
    (organization) => {
      organizationStats.value = {
        rating: organization.rating,
        reviewCount: organization.reviewCount,
        hasPublicRating: organization.hasPublicRating,
      }
    },
    { deep: true },
  )

  function onReviewStatsUpdated(stats: OrganizationReviewStats) {
    organizationStats.value = stats
  }

  const categoryHref = computed(() =>
    getCatalogCategoryHref(props.organization.categorySlug),
  )

  const heroLogoUrl = computed(
    () => props.organization.detailLogoUrl || props.organization.logoUrl,
  )

  const heroLogoCardClass = computed(() => {
    if (!props.organization.detailLogoUrl) {
      return 'org-detail__logo-card--brand'
    }

    if (props.organization.slug === 'ttm-mining') {
      return 'org-detail__logo-card--banner'
    }

    return 'org-detail__logo-card--compact'
  })

  const phoneHref = computed(() => {
    const digits = props.organization.phone.replace(/\D/g, '')
    return digits ? `tel:+${digits}` : ''
  })

  const heroTitleParts = computed(() => {
    const source = props.organization.pageTitle || props.organization.name
    const colonIndex = source.indexOf(':')

    if (colonIndex === -1) {
      return { main: source, sub: props.organization.tagline || '' }
    }

    return {
      main: `${source.slice(0, colonIndex + 1)}`,
      sub: source.slice(colonIndex + 1).trim() || props.organization.tagline || '',
    }
  })

  const heroTitleMain = computed(() => heroTitleParts.value.main)
  const heroTitleSub = computed(() => heroTitleParts.value.sub)

  const ratingLabel = computed(() => {
    if (!organizationStats.value.hasPublicRating || organizationStats.value.rating <= 0) {
      return 'Нет рейтинга'
    }

    const value = Number.isInteger(organizationStats.value.rating)
      ? String(organizationStats.value.rating)
      : organizationStats.value.rating.toFixed(1)

    return `Рейтинг: ${value}`
  })

  const legalProfileRows = computed(() => {
    const profile = props.organization.legalProfile

    if (!profile) {
      return []
    }

    const rows: Array<{
      label: string
      value: string
      isReliabilityBadge?: boolean
    }> = [
      {
        label: 'Основной вид деятельности',
        value: profile.primaryActivity,
      },
      {
        label: 'ОГРН / ИНН',
        value: `${profile.ogrn}/${profile.inn}`,
      },
    ]

    if (profile.registeredAt) {
      rows.push({
        label: 'Дата регистрации',
        value: formatDate(profile.registeredAt),
      })
    }

    rows.push(
      {
        label: 'Юридический адрес',
        value: profile.legalAddress,
      },
      {
        label: 'Уставный капитал',
        value: profile.authorizedCapital,
      },
      {
        label: 'Надежность',
        value: profile.reliability,
        isReliabilityBadge: true,
      },
      {
        label: 'Судебные дела в роли ответчика',
        value: profile.defendantCases,
      },
      {
        label: 'Выручка',
        value: profile.revenue,
      },
      {
        label: 'Прибыль',
        value: profile.profit,
      },
      {
        label: 'Налоговая задолженность',
        value: profile.taxDebt,
      },
      {
        label: 'Компания в санкционных списках',
        value: profile.inSanctionsLists,
      },
      {
        label: 'Санкционные ограничения',
        value: profile.sanctionsRestrictions,
      },
    )

    return rows
  })

  function formatDate(isoDate: string) {
    const [year, month, day] = isoDate.split('-')

    if (!year || !month || !day) {
      return isoDate
    }

    return `${day}.${month}.${year}`
  }
</script>

<style scoped>
  .org-detail {
    background: #0a0a0a;
    color: #fff;
    font-family: 'Mulish', 'Segoe UI', system-ui, sans-serif;
  }

  .org-detail__inner {
    max-width: 1770px;
    margin: 0 auto;
    padding: 40px clamp(16px, 4vw, 60px) 96px;
  }

  .org-detail__breadcrumbs {
    display: flex;
    flex-wrap: wrap;
    align-items: center;
    gap: 8px;
    margin-bottom: 32px;
    color: #757575;
    font-size: 14px;
    line-height: 20px;
  }

  .org-detail__breadcrumbs a {
    color: inherit;
    text-decoration: none;
  }

  @media (hover: hover) {
    .org-detail__breadcrumbs a:hover {
      color: #ff741f;
    }
  }

  .org-detail__hero {
    display: grid;
    grid-template-columns: minmax(0, 1fr) minmax(280px, 420px);
    gap: 24px;
    align-items: stretch;
    margin-bottom: 24px;
  }

  .org-detail__hero-text {
    min-width: 0;
  }

  .org-detail__title {
    display: grid;
    gap: 0;
    margin: 0 0 16px;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-weight: 400;
    line-height: 1.2;
  }

  .org-detail__title-main {
    font-size: clamp(24px, 3vw, 40px);
    text-transform: uppercase;
  }

  .org-detail__title-sub {
    margin-top: 8px;
    font-family: 'Mulish', 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(16px, 2vw, 22px);
    font-weight: 400;
    line-height: 1.35;
    text-transform: none;
  }

  .org-detail__rating {
    margin: 0;
    color: #757575;
    font-size: 14px;
    line-height: 20px;
  }

  .org-detail__logo-card {
    display: flex;
    align-items: center;
    justify-content: center;
    min-height: 132px;
    padding: 28px 36px;
    border-radius: 32px;
    background: #1a1a1a;
    overflow: hidden;
  }

  .org-detail__logo-image {
    display: block;
    object-fit: contain;
  }

  .org-detail__logo-card--compact .org-detail__logo-image {
    width: auto;
    max-width: min(100%, 300px);
    height: auto;
    max-height: 68px;
  }

  .org-detail__logo-card--banner {
    min-height: 140px;
    padding: 20px 28px;
    background: #000;
  }

  .org-detail__logo-card--banner .org-detail__logo-image {
    width: 100%;
    max-width: 100%;
    height: auto;
    max-height: 120px;
  }

  .org-detail__logo-card--brand .org-detail__logo-image {
    width: 100%;
    max-width: 100%;
    height: auto;
    max-height: 120px;
  }

  .org-detail__card {
    margin-bottom: 20px;
    padding: clamp(20px, 3vw, 32px);
    border-radius: 32px;
    background: #1a1a1a;
  }

  .org-detail__about-card {
    margin-bottom: 24px;
  }

  .org-detail__card-title {
    margin: 0 0 24px;
    color: #fff;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(22px, 2.5vw, 32px);
    font-weight: 400;
    line-height: 1.2;
  }

  .org-detail__card-title--upper {
    text-transform: uppercase;
  }

  .org-detail__about {
    color: #fff;
    font-size: 16px;
    line-height: 1.65;
  }

  .org-detail__about :deep(p) {
    margin: 0 0 16px;
  }

  .org-detail__about :deep(p:last-child) {
    margin-bottom: 0;
  }

  .org-detail__about :deep(strong) {
    font-weight: 600;
  }

  .org-detail__about--collapsed {
    max-height: 220px;
    overflow: hidden;
    mask-image: linear-gradient(180deg, #000 70%, transparent);
  }

  .org-detail__read-more {
    margin-top: 16px;
    padding: 0;
    border: 0;
    background: none;
    color: #ff741f;
    font-family: inherit;
    font-size: 16px;
    line-height: 24px;
    cursor: pointer;
  }

  .org-detail__layout {
    display: grid;
    grid-template-columns: minmax(0, 1fr) minmax(300px, 380px);
    gap: 20px;
    align-items: stretch;
  }

  .org-detail__main {
    display: flex;
    min-width: 0;
    min-height: 100%;
  }

  .org-detail__card--stretch {
    flex: 1;
    display: flex;
    flex-direction: column;
    margin-bottom: 0;
  }

  .org-detail__full-width {
    display: grid;
    gap: 20px;
    width: 100%;
    margin-top: 20px;
  }

  .org-detail__card--full {
    width: 100%;
    margin-bottom: 0;
  }

  .org-detail__rows {
    display: grid;
    gap: 12px;
  }

  .org-detail__rows--wide .org-detail__row {
    grid-template-columns: minmax(220px, 340px) minmax(0, 1fr);
  }

  .org-detail__row {
    display: grid;
    grid-template-columns: minmax(140px, 1fr) minmax(0, 1.4fr);
    gap: 12px;
    align-items: center;
    font-size: 16px;
    line-height: 24px;
  }

  .org-detail__row-label {
    color: #fff;
    font-weight: 400;
  }

  .org-detail__row-value {
    padding: 12px 16px;
    border-radius: 16px;
    background: #0a0a0a;
    color: #fff;
    font-weight: 400;
    line-height: 1.4;
  }

  .org-detail__extras {
    margin-top: auto;
    padding-top: 24px;
    border-top: 1px solid #2e2e2e;
  }

  .org-detail__extras-title {
    margin: 0 0 12px;
    font-size: 16px;
    font-weight: 600;
    line-height: 24px;
  }

  .org-detail__extras-list {
    display: grid;
    gap: 8px;
    margin: 0;
    padding-left: 20px;
    font-size: 15px;
    line-height: 1.5;
  }

  .org-detail__more-card {
    padding: clamp(20px, 3vw, 28px) clamp(20px, 3vw, 32px);
  }

  .org-detail__more {
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 24px;
  }

  .org-detail__more-text {
    display: grid;
    gap: 12px;
    min-width: 0;
  }

  .org-detail__more-title {
    margin: 0;
    color: #fff;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(22px, 2.5vw, 32px);
    font-weight: 400;
    line-height: 1.2;
  }

  .org-detail__more-link {
    display: inline-flex;
    align-items: center;
    gap: 8px;
    color: #fff;
    font-size: 16px;
    line-height: 24px;
    text-decoration: none;
  }

  .org-detail__more-link-icon {
    color: #ff741f;
    font-size: 18px;
  }

  @media (hover: hover) {
    .org-detail__more-link:hover {
      color: #ff741f;
    }
  }

  .org-detail__more-cursor {
    flex: 0 0 auto;
    width: min(70px, 34vw);
    height: auto;
    object-fit: contain;
    pointer-events: none;
    user-select: none;
  }

  .org-detail__rusprofile-card {
    padding: clamp(20px, 3vw, 32px);
  }

  .org-detail__rusprofile-head {
    display: flex;
    align-items: flex-start;
    justify-content: space-between;
    gap: 16px;
    margin-bottom: 16px;
  }

  .org-detail__rusprofile-title {
    margin: 0;
    color: #fff;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(22px, 2.5vw, 32px);
    font-weight: 400;
    line-height: 1.2;
    text-transform: lowercase;
  }

  .org-detail__rusprofile-logo {
    flex: 0 0 auto;
    width: 48px;
    height: 48px;
    object-fit: contain;
  }

  .org-detail__rusprofile-name {
    margin: 0 0 24px;
    color: #fff;
    font-size: 16px;
    line-height: 1.5;
  }

  .org-detail__rusprofile-table {
    display: grid;
    gap: 12px;
  }

  .org-detail__rusprofile-row {
    display: flex;
    align-items: stretch;
    gap: 12px;
  }

  .org-detail__rusprofile-label {
    flex: 0 0 340px;
    max-width: 100%;
    padding: 12px 24px;
    border-radius: 12px;
    background: linear-gradient(91.1deg, #e71d7c 0%, #41e7b4 100%);
    color: #fff;
    font-size: 16px;
    line-height: 24px;
  }

  .org-detail__rusprofile-value {
    display: flex;
    flex: 1;
    align-items: center;
    min-width: 0;
    padding: 12px 16px;
    border: 1px solid #2e2e2e;
    border-radius: 16px;
    background: #0a0a0a;
    color: #fff;
    font-size: 16px;
    line-height: 1.4;
  }

  .org-detail__reliability-badge {
    display: inline-flex;
    align-items: center;
    padding: 6px 14px;
    border-radius: 999px;
    background: #4caf50;
    color: #0a0a0a;
    font-size: 14px;
    font-weight: 700;
    line-height: 1;
    letter-spacing: 0.02em;
    text-transform: uppercase;
  }

  .org-detail__sidebar {
    display: grid;
    grid-template-rows: auto 1fr;
    gap: 20px;
    min-height: 100%;
    position: sticky;
    top: 24px;
    align-self: stretch;
  }

  .org-detail__top-control {
    position: relative;
    overflow: hidden;
    padding: 24px;
    border-radius: 32px;
    background:
      radial-gradient(
        circle at 100% 0%,
        rgba(255, 116, 31, 0.18),
        transparent 45%
      ),
      linear-gradient(180deg, #1f2a2a 0%, #141414 100%);
    isolation: isolate;
  }

  .org-detail__top-control-content {
    position: relative;
    z-index: 1;
  }

  .org-detail__top-control-head {
    display: flex;
    align-items: flex-start;
    justify-content: space-between;
    gap: 12px;
    margin-bottom: 8px;
  }

  .org-detail__top-control-title {
    margin: 0;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 22px;
    font-weight: 400;
    line-height: 1.2;
    text-transform: uppercase;
  }

  .org-detail__top-control-badge {
    flex: 0 0 auto;
    color: #ff741f;
    font-size: 28px;
  }

  .org-detail__top-control-subtitle {
    margin: 0 0 16px;
    color: #bdbdbd;
    font-size: 16px;
    line-height: 24px;
  }

  .org-detail__top-control-rows {
    display: grid;
    gap: 8px;
  }

  .org-detail__top-control-row {
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 8px;
    font-size: 18px;
    line-height: 24px;
  }

  .org-detail__top-control-label {
    color: #fff;
  }

  .org-detail__top-ribbon {
    position: absolute;
    right: 0;
    bottom: 0;
    z-index: 0;
    width: 120px;
    height: 120px;
    overflow: hidden;
    pointer-events: none;
  }

  .org-detail__top-ribbon::before {
    content: 'TOP';
    position: absolute;
    right: -34px;
    bottom: 0px;
    width: 140px;
    padding: 8px 0;
    background: linear-gradient(135deg, #ff853b, #ec5100);
    color: #fff;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 14px;
    font-weight: 600;
    line-height: 1;
    text-align: center;
    transform: rotate(-45deg);
    box-shadow: 0 4px 12px rgba(236, 81, 0, 0.35);
  }

  .org-detail__contacts-card {
    margin-bottom: 0;
  }

  .org-detail__contacts-card.org-detail__card--stretch {
    justify-content: flex-start;
  }

  .org-detail__rating-badge {
    display: inline-flex;
    margin-bottom: 20px;
    padding: 8px 14px;
    border-radius: 999px;
    background: #2e2e2e;
    color: #fff;
    font-size: 14px;
    line-height: 20px;
  }

  .org-detail__contacts {
    display: grid;
    gap: 16px;
    margin: 0;
    padding: 0;
    list-style: none;
  }

  .org-detail__contact {
    display: flex;
    align-items: flex-start;
    gap: 12px;
    color: #fff;
    font-size: 16px;
    line-height: 1.45;
  }

  .org-detail__contact-icon {
    flex: 0 0 auto;
    margin-top: 2px;
    color: #757575;
    font-size: 20px;
  }

  .org-detail__contact a {
    color: inherit;
    text-decoration: none;
    word-break: break-word;
  }

  @media (hover: hover) {
    .org-detail__contact a:hover {
      color: #ff741f;
    }
  }

  @media (max-width: 1100px) {
    .org-detail__hero {
      grid-template-columns: 1fr;
    }

    .org-detail__layout {
      grid-template-columns: 1fr;
    }

    .org-detail__main {
      min-height: auto;
    }

    .org-detail__sidebar {
      position: static;
      grid-template-rows: auto;
      min-height: auto;
    }

    .org-detail__card--stretch {
      flex: none;
    }

    .org-detail__extras {
      margin-top: 24px;
    }
  }

  @media (max-width: 640px) {
    .org-detail__row {
      grid-template-columns: 1fr;
    }

    .org-detail__rusprofile-row {
      flex-direction: column;
    }

    .org-detail__rusprofile-label {
      flex-basis: auto;
      width: 100%;
    }

    .org-detail__more {
      flex-direction: column;
      align-items: flex-start;
    }

    .org-detail__more-cursor {
      align-self: flex-end;
      width: min(140px, 50vw);
    }

    .org-detail__top-control-row {
      flex-direction: column;
      align-items: flex-start;
    }
  }
</style>
