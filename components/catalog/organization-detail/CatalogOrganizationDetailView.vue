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

      <section class="org-detail__hero-card">
        <div class="org-detail__hero-main">
          <div class="org-detail__logo">
            <img
              v-if="organization.logoUrl"
              :src="organization.logoUrl"
              :alt="organization.name"
            />
          </div>

          <div class="org-detail__hero-body">
            <div class="org-detail__title-row">
              <span
                v-if="organization.verification.legalEntity"
                class="org-detail__verified"
                aria-label="Проверенная организация"
              >
                <Icon name="mdi:check-decagram" />
              </span>
              <h1 class="org-detail__title">
                {{ organization.name.toUpperCase() }}
              </h1>
            </div>

            <p class="org-detail__rating">
              {{ ratingLabel }}
            </p>

            <div
              v-if="organization.cardTags.length"
              class="org-detail__tags"
            >
              <span
                v-for="tag in organization.cardTags"
                :key="tag"
                class="org-detail__tag"
              >
                {{ tag }}
              </span>
            </div>

            <div
              v-if="organization.cardFeatures.length"
              class="org-detail__features"
            >
              <p
                v-for="feature in organization.cardFeatures"
                :key="feature"
                class="org-detail__feature"
              >
                <span
                  class="org-detail__feature-check"
                  aria-hidden="true"
                >
                  <Icon name="mdi:check" />
                </span>
                <span>{{ feature }}</span>
              </p>
            </div>

            <p
              v-if="organization.foundedYear"
              class="org-detail__founded"
            >
              <Icon
                name="mdi:calendar-month-outline"
                class="org-detail__founded-icon"
                aria-hidden="true"
              />
              <span>Год основания: {{ organization.foundedYear }}</span>
            </p>
          </div>
        </div>
      </section>

      <div class="org-detail__layout">
        <div class="org-detail__content">
          <section
            v-if="organization.aboutHtml"
            class="org-detail__section"
          >
            <h2 class="org-detail__section-title">
              О компании {{ organization.name }}
            </h2>
            <div
              class="org-detail__about"
              v-html="organization.aboutHtml"
            />
          </section>

          <section
            v-if="organization.equipmentSales"
            class="org-detail__section"
          >
            <h2 class="org-detail__section-title">
              Продажа оборудования
            </h2>
            <dl class="org-detail__facts">
              <div class="org-detail__fact">
                <dt>Тип оборудования</dt>
                <dd>{{ organization.equipmentSales.equipmentType }}</dd>
              </div>
              <div class="org-detail__fact">
                <dt>Состояние оборудования</dt>
                <dd>{{ organization.equipmentSales.equipmentCondition }}</dd>
              </div>
              <div class="org-detail__fact">
                <dt>Объем продаж</dt>
                <dd>{{ organization.equipmentSales.salesVolume }}</dd>
              </div>
              <div class="org-detail__fact">
                <dt>Наличие</dt>
                <dd>{{ organization.equipmentSales.availability }}</dd>
              </div>
            </dl>
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

          <section
            v-if="organization.miningHotel"
            class="org-detail__section"
          >
            <h2 class="org-detail__section-title">
              Майнинг-отель {{ organization.name }}
            </h2>
            <dl class="org-detail__facts">
              <div class="org-detail__fact">
                <dt>Цена за кВт/ч</dt>
                <dd>{{ organization.miningHotel.pricePerKwhLabel }}</dd>
              </div>
              <div class="org-detail__fact">
                <dt>Количество площадок</dt>
                <dd>{{ organization.miningHotel.sitesCount }}</dd>
              </div>
              <div class="org-detail__fact">
                <dt>Мощности площадок</dt>
                <dd>{{ organization.miningHotel.totalCapacityMw }} МВт</dd>
              </div>
              <div class="org-detail__fact">
                <dt>Города площадок</dt>
                <dd>{{ organization.miningHotel.siteCities }}</dd>
              </div>
              <div class="org-detail__fact">
                <dt>Количество устройств для размещения</dt>
                <dd>{{ organization.miningHotel.minDevicesLabel }}</dd>
              </div>
              <div class="org-detail__fact">
                <dt>Тип энергии</dt>
                <dd>{{ organization.miningHotel.energyType }}</dd>
              </div>
            </dl>
          </section>

          <section
            v-if="organization.paymentTerms"
            class="org-detail__section"
          >
            <h2 class="org-detail__section-title">
              Оплата услуг
            </h2>
            <dl class="org-detail__facts">
              <div
                v-if="organization.paymentTerms.paymentMethods.length"
                class="org-detail__fact"
              >
                <dt>Оплата</dt>
                <dd>{{ organization.paymentTerms.paymentMethods.join(', ') }}</dd>
              </div>
              <div
                v-if="organization.paymentTerms.paymentFormats.length"
                class="org-detail__fact"
              >
                <dt>Формат оплаты</dt>
                <dd>{{ organization.paymentTerms.paymentFormats.join(', ') }}</dd>
              </div>
              <div
                v-if="organization.paymentTerms.extraTerms.length"
                class="org-detail__fact"
              >
                <dt>Доп. условия оплаты</dt>
                <dd>{{ organization.paymentTerms.extraTerms.join(', ') }}</dd>
              </div>
              <div
                v-if="organization.paymentTerms.contractForms.length"
                class="org-detail__fact"
              >
                <dt>Форма договора</dt>
                <dd>{{ organization.paymentTerms.contractForms.join(', ') }}</dd>
              </div>
            </dl>
          </section>

          <section
            v-if="organization.legalProfile"
            class="org-detail__section"
          >
            <h2 class="org-detail__section-title">
              rusprofile
            </h2>
            <dl class="org-detail__facts org-detail__facts--legal">
              <div class="org-detail__fact">
                <dt>Юридическое лицо</dt>
                <dd>{{ organization.legalProfile.legalName }}</dd>
              </div>
              <div class="org-detail__fact">
                <dt>Основной вид деятельности</dt>
                <dd>{{ organization.legalProfile.primaryActivity }}</dd>
              </div>
              <div class="org-detail__fact">
                <dt>ОГРН / ИНН</dt>
                <dd>
                  {{ organization.legalProfile.ogrn }}/{{ organization.legalProfile.inn }}
                </dd>
              </div>
              <div
                v-if="organization.legalProfile.registeredAt"
                class="org-detail__fact"
              >
                <dt>Дата регистрации</dt>
                <dd>{{ formatDate(organization.legalProfile.registeredAt) }}</dd>
              </div>
              <div class="org-detail__fact">
                <dt>Юридический адрес</dt>
                <dd>{{ organization.legalProfile.legalAddress }}</dd>
              </div>
              <div class="org-detail__fact">
                <dt>Уставный капитал</dt>
                <dd>{{ organization.legalProfile.authorizedCapital }}</dd>
              </div>
              <div class="org-detail__fact">
                <dt>Надежность</dt>
                <dd>{{ organization.legalProfile.reliability }}</dd>
              </div>
              <div class="org-detail__fact">
                <dt>Выручка</dt>
                <dd>{{ organization.legalProfile.revenue }}</dd>
              </div>
              <div class="org-detail__fact">
                <dt>Прибыль</dt>
                <dd>{{ organization.legalProfile.profit }}</dd>
              </div>
            </dl>
          </section>
        </div>

        <aside class="org-detail__sidebar">
          <section class="org-detail__sidebar-card">
            <h2 class="org-detail__sidebar-title">
              ТОП МАЙНИНГ
            </h2>
            <p class="org-detail__sidebar-subtitle">
              Проверка ТОП МАЙНИНГ:
            </p>
            <ul class="org-detail__checks">
              <li>
                <span>Договора</span>
                <strong>{{ organization.verification.contracts ? 'Проверены' : 'Не проверены' }}</strong>
              </li>
              <li>
                <span>Юридическое лицо</span>
                <strong>{{ organization.verification.legalEntity ? 'Проверены' : 'Не проверены' }}</strong>
              </li>
            </ul>
            <p class="org-detail__sidebar-rating">
              {{ ratingLabel }}
            </p>
            <p
              v-if="organization.foundedYear"
              class="org-detail__sidebar-founded"
            >
              Год основания: {{ organization.foundedYear }}
            </p>
            <a
              v-if="organization.website"
              :href="organization.website"
              class="org-detail__sidebar-link"
              target="_blank"
              rel="noopener noreferrer"
            >
              {{ organization.website }}
            </a>
            <a
              v-if="organization.email"
              :href="`mailto:${organization.email}`"
              class="org-detail__sidebar-link"
            >
              {{ organization.email }}
            </a>
            <p
              v-if="organization.workHours"
              class="org-detail__sidebar-hours"
            >
              {{ organization.workHours }}
            </p>
            <address
              v-if="organization.addresses.length"
              class="org-detail__sidebar-address"
            >
              <span
                v-for="(address, index) in organization.addresses"
                :key="`${address.city}-${index}`"
              >
                {{ address.addressLine }}
              </span>
            </address>
          </section>
        </aside>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
  import { getCatalogCategoryHref } from '~/common/modules/catalog/nav-links'
  import type { CatalogOrganizationDetail } from '~/types/catalog-organization-detail'

  const props = defineProps<{
    organization: CatalogOrganizationDetail
  }>()

  const categoryHref = computed(() =>
    getCatalogCategoryHref(props.organization.categorySlug),
  )

  const ratingLabel = computed(() => {
    if (!props.organization.hasPublicRating || props.organization.rating <= 0) {
      return 'Нет рейтинга'
    }

    const value = Number.isInteger(props.organization.rating)
      ? String(props.organization.rating)
      : props.organization.rating.toFixed(1)

    return `Рейтинг: ${value}`
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
    background: #f2f2f2;
  }

  .org-detail__inner {
    max-width: 1770px;
    margin: 0 auto;
    padding: clamp(40px, 5vw, 72px) clamp(16px, 4vw, 60px) clamp(56px, 7vw, 96px);
  }

  .org-detail__breadcrumbs {
    display: flex;
    flex-wrap: wrap;
    align-items: center;
    gap: 8px;
    margin-bottom: clamp(20px, 3vw, 32px);
    color: var(--tm-text-muted);
    font-size: 14px;
  }

  .org-detail__breadcrumbs a {
    color: inherit;
    text-decoration: none;
  }

  @media (hover: hover) {
    .org-detail__breadcrumbs a:hover {
      color: var(--tm-orange);
    }
  }

  .org-detail__hero-card {
    margin-bottom: clamp(24px, 3vw, 36px);
    padding: clamp(20px, 3vw, 28px);
    border-radius: 32px;
    background: #fff;
  }

  .org-detail__hero-main {
    display: flex;
    gap: clamp(16px, 2vw, 24px);
    align-items: flex-start;
  }

  .org-detail__logo {
    display: flex;
    align-items: center;
    justify-content: center;
    flex: 0 0 auto;
    width: clamp(72px, 10vw, 96px);
    height: clamp(72px, 10vw, 96px);
    padding: 10px;
    border-radius: 20px;
    background: #f3f3f3;
    overflow: hidden;
  }

  .org-detail__logo img {
    width: 100%;
    height: 100%;
    object-fit: contain;
  }

  .org-detail__hero-body {
    display: grid;
    gap: 12px;
    min-width: 0;
    flex: 1;
  }

  .org-detail__title-row {
    display: flex;
    align-items: center;
    gap: 8px;
  }

  .org-detail__verified {
    display: inline-flex;
    color: var(--tm-orange);
    font-size: 22px;
  }

  .org-detail__title {
    margin: 0;
    color: #141414;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(22px, 3vw, 32px);
    font-weight: 600;
    line-height: 1.15;
  }

  .org-detail__rating {
    margin: 0;
    color: var(--tm-text-muted);
    font-size: 14px;
    font-weight: 500;
  }

  .org-detail__tags {
    display: flex;
    flex-wrap: wrap;
    gap: 8px;
  }

  .org-detail__tag {
    display: inline-flex;
    padding: 8px 12px;
    border-radius: 999px;
    background: #f4f4f4;
    color: #141414;
    font-size: 13px;
    font-weight: 500;
    line-height: 1.2;
  }

  .org-detail__features {
    display: grid;
    gap: 8px;
    padding: 14px 16px;
    border-radius: 20px;
    background: #f4f4f4;
  }

  .org-detail__feature {
    display: flex;
    align-items: center;
    gap: 8px;
    margin: 0;
    color: #141414;
    font-size: 14px;
    font-weight: 500;
    line-height: 1.3;
  }

  .org-detail__feature-check {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    width: 18px;
    height: 18px;
    border-radius: 4px;
    background: var(--tm-orange);
    color: #fff;
    font-size: 14px;
  }

  .org-detail__founded {
    display: inline-flex;
    align-items: center;
    gap: 6px;
    margin: 0;
    color: var(--tm-orange);
    font-size: 13px;
    font-weight: 600;
  }

  .org-detail__founded-icon {
    width: 16px;
    height: 16px;
  }

  .org-detail__layout {
    display: grid;
    grid-template-columns: minmax(0, 1fr) minmax(280px, 340px);
    gap: clamp(20px, 3vw, 32px);
    align-items: start;
  }

  .org-detail__content {
    display: grid;
    gap: 20px;
    min-width: 0;
  }

  .org-detail__section {
    padding: clamp(20px, 3vw, 28px);
    border-radius: 32px;
    background: #fff;
  }

  .org-detail__section-title {
    margin: 0 0 18px;
    color: #141414;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(20px, 2.4vw, 28px);
    font-weight: 600;
    line-height: 1.2;
  }

  .org-detail__about {
    color: #141414;
    font-size: 16px;
    line-height: 1.65;
  }

  .org-detail__about :deep(p) {
    margin: 0 0 14px;
  }

  .org-detail__about :deep(p:last-child) {
    margin-bottom: 0;
  }

  .org-detail__facts {
    display: grid;
    gap: 14px;
    margin: 0;
  }

  .org-detail__fact {
    display: grid;
    gap: 4px;
  }

  .org-detail__fact dt {
    color: var(--tm-text-muted);
    font-size: 13px;
    font-weight: 500;
  }

  .org-detail__fact dd {
    margin: 0;
    color: #141414;
    font-size: 15px;
    font-weight: 600;
    line-height: 1.4;
  }

  .org-detail__extras {
    margin-top: 18px;
    padding-top: 18px;
    border-top: 1px solid rgba(0, 0, 0, 0.06);
  }

  .org-detail__extras-title {
    margin: 0 0 10px;
    color: #141414;
    font-size: 15px;
    font-weight: 600;
  }

  .org-detail__extras-list {
    display: grid;
    gap: 8px;
    margin: 0;
    padding-left: 18px;
    color: #141414;
    font-size: 15px;
    line-height: 1.45;
  }

  .org-detail__sidebar-card {
    padding: clamp(20px, 3vw, 24px);
    border-radius: 32px;
    background: #fff;
  }

  .org-detail__sidebar-title {
    margin: 0 0 8px;
    color: #141414;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 18px;
    font-weight: 600;
  }

  .org-detail__sidebar-subtitle {
    margin: 0 0 14px;
    color: var(--tm-text-muted);
    font-size: 14px;
  }

  .org-detail__checks {
    display: grid;
    gap: 10px;
    margin: 0 0 16px;
    padding: 0;
    list-style: none;
  }

  .org-detail__checks li {
    display: flex;
    justify-content: space-between;
    gap: 12px;
    color: #141414;
    font-size: 14px;
  }

  .org-detail__checks strong {
    color: var(--tm-orange);
    font-weight: 600;
  }

  .org-detail__sidebar-rating,
  .org-detail__sidebar-founded,
  .org-detail__sidebar-hours {
    margin: 0 0 10px;
    color: #141414;
    font-size: 14px;
    line-height: 1.4;
  }

  .org-detail__sidebar-link {
    display: block;
    margin-bottom: 8px;
    color: var(--tm-orange);
    font-size: 14px;
    word-break: break-word;
    text-decoration: none;
  }

  .org-detail__sidebar-address {
    display: grid;
    gap: 8px;
    margin: 12px 0 0;
    color: #141414;
    font-style: normal;
    font-size: 14px;
    line-height: 1.45;
  }

  @media (max-width: 960px) {
    .org-detail__layout {
      grid-template-columns: 1fr;
    }
  }

  @media (max-width: 640px) {
    .org-detail__hero-main {
      flex-direction: column;
    }
  }
</style>
