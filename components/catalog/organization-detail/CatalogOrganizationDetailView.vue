<template>
  <div class="org-detail">
    <div class="org-detail__inner">
      <nav
        class="org-detail__breadcrumbs"
        aria-label="Хлебные крошки"
      >
        <nuxt-link to="/">Главная</nuxt-link>
        <span aria-hidden="true">/</span>
        <nuxt-link :to="categoryHref">
          {{ organization.categoryName }}
        </nuxt-link>
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

        <img
          v-if="heroLogoUrl"
          class="org-detail__logo"
          :src="heroLogoUrl"
          :alt="organization.name"
        />
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
              v-if="equipmentSalesExtras.length"
              class="org-detail__extras"
            >
              <p class="org-detail__extras-title">
                Дополнительно при покупке асиков:
              </p>
              <ul class="org-detail__extras-list">
                <li
                  v-for="extra in equipmentSalesExtras"
                  :key="extra"
                >
                  {{ extra }}
                </li>
              </ul>
            </div>
          </section>

          <section
            v-else-if="organization.miningHotel"
            class="org-detail__card org-detail__card--stretch"
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
            <div
              v-if="miningHotelExtras.length"
              class="org-detail__extras"
            >
              <p class="org-detail__extras-title">
                Дополнительно для хостинга:
              </p>
              <ul class="org-detail__extras-list">
                <li
                  v-for="extra in miningHotelExtras"
                  :key="extra"
                >
                  {{ extra }}
                </li>
              </ul>
            </div>
          </section>

          <section
            v-else-if="organization.miningPool"
            class="org-detail__card org-detail__card--stretch"
          >
            <h2 class="org-detail__card-title">
              Майнинг-пул
            </h2>
            <div class="org-detail__rows org-detail__rows--wide">
              <div
                v-if="organization.miningPool.mobileApp"
                class="org-detail__row"
              >
                <span class="org-detail__row-label">Мобильное приложение</span>
                <span class="org-detail__row-value">
                  {{ organization.miningPool.mobileApp }}
                </span>
              </div>
              <div
                v-if="organization.miningPool.referralProgram"
                class="org-detail__row"
              >
                <span class="org-detail__row-label">Реферальная программа</span>
                <span class="org-detail__row-value">
                  {{ organization.miningPool.referralProgram }}
                </span>
              </div>
              <div
                v-if="organization.miningPool.totalHashrate"
                class="org-detail__row"
              >
                <span class="org-detail__row-label">Общий хешрейт</span>
                <span class="org-detail__row-value">
                  {{ organization.miningPool.totalHashrate }}
                </span>
              </div>
              <div
                v-if="organization.miningPool.rewardDistribution"
                class="org-detail__row"
              >
                <span class="org-detail__row-label">Способ распределения награды</span>
                <span class="org-detail__row-value">
                  {{ organization.miningPool.rewardDistribution }}
                </span>
              </div>
              <div
                v-if="organization.miningPool.poolCommission"
                class="org-detail__row"
              >
                <span class="org-detail__row-label">Комиссия пула</span>
                <span class="org-detail__row-value">
                  {{ organization.miningPool.poolCommission }}
                </span>
              </div>
              <div
                v-if="organization.miningPool.minPayout"
                class="org-detail__row"
              >
                <span class="org-detail__row-label">Минимальный лимит выплат</span>
                <span class="org-detail__row-value">
                  {{ organization.miningPool.minPayout }}
                </span>
              </div>
              <div
                v-if="organization.miningPool.payoutFrequency"
                class="org-detail__row"
              >
                <span class="org-detail__row-label">Периодичность начисления награды</span>
                <span class="org-detail__row-value">
                  {{ organization.miningPool.payoutFrequency }}
                </span>
              </div>
              <div
                v-if="organization.miningPool.minedCoins"
                class="org-detail__row"
              >
                <span class="org-detail__row-label">Добываемые монеты</span>
                <span class="org-detail__row-value">
                  {{ organization.miningPool.minedCoins }}
                </span>
              </div>
            </div>
          </section>

          <section
            v-else-if="organization.cryptoExchange"
            class="org-detail__card org-detail__card--stretch"
          >
            <h2 class="org-detail__card-title">
              Криптобиржа
            </h2>

            <h3 class="org-detail__card-subtitle">
              Общие характеристики
            </h3>
            <div class="org-detail__rows org-detail__rows--wide">
              <div
                v-if="organization.cryptoExchange.tradingPairsLabel"
                class="org-detail__row"
              >
                <span class="org-detail__row-label">Число торговых пар</span>
                <span class="org-detail__row-value">
                  {{ organization.cryptoExchange.tradingPairsLabel }}
                </span>
              </div>
              <div
                v-if="organization.cryptoExchange.coinsCountLabel"
                class="org-detail__row"
              >
                <span class="org-detail__row-label">Количество монет</span>
                <span class="org-detail__row-value">
                  {{ organization.cryptoExchange.coinsCountLabel }}
                </span>
              </div>
              <div
                v-if="organization.cryptoExchange.verificationType"
                class="org-detail__row"
              >
                <span class="org-detail__row-label">Верификация</span>
                <span class="org-detail__row-value">
                  {{ organization.cryptoExchange.verificationType }}
                </span>
              </div>
            </div>

            <div
              v-if="cryptoExchangeExtras.length"
              class="org-detail__extras"
            >
              <p class="org-detail__extras-title">
                Общие дополнительные функции
              </p>
              <ul class="org-detail__extras-list org-detail__extras-list--checks">
                <li
                  v-for="extra in cryptoExchangeExtras"
                  :key="extra"
                >
                  {{ extra }}
                </li>
              </ul>
            </div>

            <h3 class="org-detail__card-subtitle">
              Характеристики Spot биржи
            </h3>
            <div class="org-detail__rows org-detail__rows--wide">
              <div
                v-if="organization.cryptoExchange.liquidityCoefficient"
                class="org-detail__row"
              >
                <span class="org-detail__row-label">Коэф. ликвидности</span>
                <span class="org-detail__row-value">
                  {{ organization.cryptoExchange.liquidityCoefficient }}
                </span>
              </div>
              <div
                v-if="organization.cryptoExchange.spotMarkets"
                class="org-detail__row"
              >
                <span class="org-detail__row-label">SPOT Рынки</span>
                <span class="org-detail__row-value">
                  {{ organization.cryptoExchange.spotMarkets }}
                </span>
              </div>
              <div
                v-if="organization.cryptoExchange.supportedCurrencies"
                class="org-detail__row"
              >
                <span class="org-detail__row-label">Поддержка валют</span>
                <span class="org-detail__row-value">
                  {{ organization.cryptoExchange.supportedCurrencies }}
                </span>
              </div>
            </div>

            <h3 class="org-detail__card-subtitle">
              Характеристики биржи деривативов
            </h3>
            <div class="org-detail__rows org-detail__rows--wide">
              <div
                v-if="organization.cryptoExchange.makerFee"
                class="org-detail__row"
              >
                <span class="org-detail__row-label">Комиссии мейкера</span>
                <span class="org-detail__row-value">
                  {{ organization.cryptoExchange.makerFee }}
                </span>
              </div>
              <div
                v-if="organization.cryptoExchange.takerFee"
                class="org-detail__row"
              >
                <span class="org-detail__row-label">Комиссии тейкера</span>
                <span class="org-detail__row-value">
                  {{ organization.cryptoExchange.takerFee }}
                </span>
              </div>
              <div
                v-if="organization.cryptoExchange.derivativeMarkets"
                class="org-detail__row"
              >
                <span class="org-detail__row-label">Рынки деривативов</span>
                <span class="org-detail__row-value">
                  {{ organization.cryptoExchange.derivativeMarkets }}
                </span>
              </div>
            </div>
          </section>

          <section
            v-else-if="organization.cryptoWallet"
            class="org-detail__card org-detail__card--stretch"
          >
            <h2 class="org-detail__card-title">
              Криптокошелек
            </h2>

            <h3 class="org-detail__card-subtitle">
              Возможности кошелька:
            </h3>
            <div class="org-detail__rows org-detail__rows--wide">
              <div
                v-if="organization.cryptoWallet.supportedCoins"
                class="org-detail__row"
              >
                <span class="org-detail__row-label">Поддержка монет</span>
                <span class="org-detail__row-value">
                  {{ organization.cryptoWallet.supportedCoins }}
                </span>
              </div>
              <div
                v-if="organization.cryptoWallet.platform"
                class="org-detail__row"
              >
                <span class="org-detail__row-label">Платформа</span>
                <span class="org-detail__row-value">
                  {{ organization.cryptoWallet.platform }}
                </span>
              </div>
              <div
                v-if="organization.cryptoWallet.commission"
                class="org-detail__row"
              >
                <span class="org-detail__row-label">Комиссия</span>
                <span class="org-detail__row-value">
                  {{ organization.cryptoWallet.commission }}
                </span>
              </div>
              <div
                v-if="organization.cryptoWallet.commissionCalculation"
                class="org-detail__row"
              >
                <span class="org-detail__row-label">Расчет комиссии</span>
                <span class="org-detail__row-value">
                  {{ organization.cryptoWallet.commissionCalculation }}
                </span>
              </div>
            </div>

            <div
              v-if="cryptoWalletExtras.length"
              class="org-detail__extras"
            >
              <p class="org-detail__extras-title">
                Дополнительно:
              </p>
              <ul class="org-detail__extras-list org-detail__extras-list--checks">
                <li
                  v-for="extra in cryptoWalletExtras"
                  :key="extra"
                >
                  {{ extra }}
                </li>
              </ul>
            </div>
          </section>
        </div>

        <catalog-organization-detail-sidebar
          :organization="organization"
          :rating-label="ratingLabel"
        />
      </div>

      <div class="org-detail__full-width">
        <section
          v-if="organization.miningHotel && organization.equipmentSales"
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
              v-if="paymentMethodsLabel"
              class="org-detail__row"
            >
              <span class="org-detail__row-label">Оплата</span>
              <span class="org-detail__row-value">
                {{ paymentMethodsLabel }}
              </span>
            </div>
            <div
              v-if="paymentFormatsLabel"
              class="org-detail__row"
            >
              <span class="org-detail__row-label">Формат оплаты</span>
              <span class="org-detail__row-value">
                {{ paymentFormatsLabel }}
              </span>
            </div>
            <div
              v-if="paymentExtraTermsLabel"
              class="org-detail__row"
            >
              <span class="org-detail__row-label">Доп. условия оплаты</span>
              <span class="org-detail__row-value">
                {{ paymentExtraTermsLabel }}
              </span>
            </div>
            <div
              v-if="paymentContractFormsLabel"
              class="org-detail__row"
            >
              <span class="org-detail__row-label">Форма договора</span>
              <span class="org-detail__row-value">
                {{ paymentContractFormsLabel }}
              </span>
            </div>
          </div>
        </section>

        <section
          v-if="organization.showArticleBlock"
          class="org-detail__card org-detail__card--full org-detail__more-card"
        >
          <div class="org-detail__more">
            <div class="org-detail__more-text">
              <h2 class="org-detail__more-title">
                Подробнее
              </h2>
              <component
                :is="organization.articleHref ? 'nuxt-link' : 'span'"
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
        v-if="organization.showGallery && galleryImages.length"
        :images="galleryImages"
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
  import CatalogOrganizationDetailSidebar from '~/components/catalog/organization-detail/CatalogOrganizationDetailSidebar.vue'
  import CatalogOrganizationReviews from '~/components/catalog/organization-detail/CatalogOrganizationReviews.vue'
  import type { CatalogOrganizationDetail } from '~/common/modules/catalog'
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

  function asStringList(values: string[] | null | undefined): string[] {
    return Array.isArray(values) ? values.filter(Boolean) : []
  }

  function joinList(values: string[] | null | undefined): string {
    const list = asStringList(values)
    return list.length ? list.join(', ') : ''
  }

  const equipmentSalesExtras = computed(() =>
    asStringList(props.organization.equipmentSales?.extras),
  )
  const miningHotelExtras = computed(() =>
    asStringList(props.organization.miningHotel?.extras),
  )
  const cryptoExchangeExtras = computed(() =>
    asStringList(props.organization.cryptoExchange?.extras),
  )
  const cryptoWalletExtras = computed(() =>
    asStringList(props.organization.cryptoWallet?.extras),
  )

  const paymentMethodsLabel = computed(() =>
    joinList(props.organization.paymentTerms?.paymentMethods),
  )
  const paymentFormatsLabel = computed(() =>
    joinList(props.organization.paymentTerms?.paymentFormats),
  )
  const paymentExtraTermsLabel = computed(() =>
    joinList(props.organization.paymentTerms?.extraTerms),
  )
  const paymentContractFormsLabel = computed(() =>
    joinList(props.organization.paymentTerms?.contractForms),
  )

  const galleryImages = computed(() =>
    Array.isArray(props.organization.gallery) ? props.organization.gallery : [],
  )

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
        value: formatLegalProfileValue(profile.primaryActivity),
      },
      {
        label: 'ОГРН / ИНН',
        value:
          profile.ogrn?.trim() && profile.inn?.trim()
            ? `${profile.ogrn}/${profile.inn}`
            : 'Не определено',
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
        value: formatLegalProfileValue(profile.legalAddress),
      },
      {
        label: 'Уставный капитал',
        value: formatLegalProfileValue(profile.authorizedCapital),
      },
      {
        label: 'Надежность',
        value: formatLegalProfileValue(profile.reliability),
        isReliabilityBadge: Boolean(profile.reliability?.trim()),
      },
      {
        label: 'Судебные дела в роли ответчика',
        value: formatLegalProfileValue(profile.defendantCases),
      },
      {
        label: 'Выручка',
        value: formatLegalProfileValue(profile.revenue),
      },
      {
        label: 'Прибыль',
        value: formatLegalProfileValue(profile.profit),
      },
      {
        label: 'Налоговая задолженность',
        value: formatLegalProfileValue(profile.taxDebt),
      },
      {
        label: 'Компания в санкционных списках',
        value: formatLegalProfileValue(profile.inSanctionsLists),
      },
      {
        label: 'Санкционные ограничения',
        value: formatLegalProfileValue(profile.sanctionsRestrictions),
      },
    )

    return rows
  })

  function formatLegalProfileValue(value: string | null | undefined) {
    const normalized = value?.trim()

    if (!normalized) {
      return 'Не определено'
    }

    return normalized
  }

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
      color: var(--tm-orange-accent-light);
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

  .org-detail__logo {
    display: block;
    width: 100%;
    max-width: 420px;
    aspect-ratio: 3 / 2;
    border-radius: 24px;
    object-fit: contain;
    object-position: center;
    background: #fff;
    justify-self: end;
    align-self: start;
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

  .org-detail__card-subtitle {
    margin: 24px 0 12px;
    color: #fff;
    font-size: 16px;
    font-weight: 600;
    line-height: 1.4;
  }

  .org-detail__card-subtitle:first-of-type {
    margin-top: 0;
  }

  .org-detail__extras-list--checks {
    padding-left: 0;
    list-style: none;
  }

  .org-detail__extras-list--checks li {
    position: relative;
    padding-left: 28px;
  }

  .org-detail__extras-list--checks li::before {
    content: '';
    position: absolute;
    left: 0;
    top: 3px;
    width: 16px;
    height: 16px;
    border-radius: 4px;
    background: var(--tm-orange-accent, #ff6b00)
      url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16'%3E%3Cpath fill='white' d='M6.5 11.2 3.3 8l1.2-1.2 2 2 5-5L12.7 5z'/%3E%3C/svg%3E")
      center / 12px no-repeat;
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
    color: var(--tm-orange-accent-light);
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
    grid-template-columns: minmax(160px, 280px) minmax(0, 1fr);
  }

  .org-detail__row {
    display: grid;
    grid-template-columns: minmax(120px, 1fr) minmax(0, 1.4fr);
    gap: 12px;
    align-items: center;
    font-size: 16px;
    line-height: 24px;
    min-width: 0;
  }

  .org-detail__row-label {
    min-width: 0;
    color: #fff;
    font-weight: 400;
  }

  .org-detail__row-value {
    min-width: 0;
    max-width: 100%;
    justify-self: stretch;
    padding: 12px 16px;
    border-radius: 16px;
    background: #0a0a0a;
    color: #fff;
    font-weight: 400;
    line-height: 1.4;
    overflow-wrap: anywhere;
    word-break: break-word;
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
    color: var(--tm-orange-accent-light);
    font-size: 18px;
  }

  @media (hover: hover) {
    .org-detail__more-link:hover {
      color: var(--tm-orange-accent-light);
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

    .org-detail__card--stretch {
      flex: none;
    }

    .org-detail__rows--wide .org-detail__row {
      grid-template-columns: minmax(140px, 200px) minmax(0, 1fr);
    }

    .org-detail__extras {
      margin-top: 24px;
    }
  }

  @media (max-width: 640px) {
    .org-detail__inner {
      padding: 24px clamp(14px, 4vw, 24px) 12px;
    }

    .org-detail__row,
    .org-detail__rows--wide .org-detail__row {
      grid-template-columns: 1fr;
      gap: 8px;
    }

    .org-detail__row-value {
      justify-self: start;
      width: fit-content;
      max-width: 100%;
      box-sizing: border-box;
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
  }
</style>
