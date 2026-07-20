<template>
  <aside class="org-detail__sidebar">
    <section class="org-detail__top-control">
      <img
        src="/images/catalog/org-detail-top-ribbon.png"
        alt=""
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
          <div
            v-if="organization.verification.dataCenter !== undefined"
            class="org-detail__top-control-row"
          >
            <span class="org-detail__top-control-label">Дата-центр</span>
            <verification-status-badge
              :verified="organization.verification.dataCenter"
            />
          </div>
        </div>
      </div>
    </section>

    <section
      v-if="organization.categorySlug === 'mining-hotels'"
      class="org-detail__registry-card"
    >
      <div class="org-detail__registry-head">
        <h2 class="org-detail__registry-title">
          Майнинг реестр
        </h2>
        <Icon
          name="mdi:check-decagram"
          class="org-detail__registry-badge"
          aria-hidden="true"
        />
      </div>
      <div class="org-detail__registry-body">
        <p class="org-detail__registry-text">
          Внесение компании в реестр операторов майнинговой инфраструктуры РФ
        </p>
        <top-mining-chip          
          text-color="#fff"
          icon-position="left"
          bg-color="transparent"
          border-width="0"
          min-width="auto"
          size="md"
          :label="miningRegistryLabel"
          :icon="miningRegistryIcon"
          :prepend-icon-background="
            organization.verification.miningRegistry
              ? TOP_MINING_VERIFICATION_STATUS_COLORS.success
              : TOP_MINING_VERIFICATION_STATUS_COLORS.danger
          "
          :prepend-icon-color="TOP_MINING_VERIFICATION_STATUS_COLORS.icon"
        />
      </div>
    </section>

    <a
      v-if="organization.referralProgramUrl"
      class="org-detail__referral-card"
      :href="organization.referralProgramUrl"
      target="_blank"
      rel="noopener noreferrer"
    >
      <Icon
        name="mdi:chart-line"
        class="org-detail__referral-icon"
        aria-hidden="true"
      />
      <span class="org-detail__referral-content">
        <span class="org-detail__referral-text">
          {{ organization.referralPromoText || 'Реферальная программа' }}
        </span>
        <span class="org-detail__referral-link">
          Реферальная программа
          <Icon
            name="mdi:open-in-new"
            class="org-detail__referral-link-icon"
            aria-hidden="true"
          />
        </span>
      </span>
    </a>

    <top-mining-chip
      v-if="domainRegisteredLabel"
      layout="info"
      :label="domainRegisteredLabel"
      subtitle="регистрация домена"
      append-image-url="/images/catalog/domain-cloud-lock.png"
      preset="dark"
      bg-color="#1a1a1a"
      border-radius="32px"
      min-width="100%"
    />

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
          <span>
            <template v-if="organization.categorySlug === 'crypto-exchanges'">
              Юрисдикция: {{ address.city || address.addressLine }}
            </template>
            <template v-else>
              {{ address.addressLine }}
            </template>
          </span>
        </li>
      </ul>
    </section>
  </aside>
</template>

<script setup lang="ts">
  import type { CatalogOrganizationDetail } from '~/common/modules/catalog'
  import { TOP_MINING_VERIFICATION_STATUS_COLORS } from '~/common/modules/top-mining/chip'
  import VerificationStatusBadge from '~/components/global/labels/VerificationStatusBadge.vue'

  const props = defineProps<{
    organization: CatalogOrganizationDetail
    ratingLabel: string
  }>()

  const phoneHref = computed(() => {
    const digits = props.organization.phone.replace(/\D/g, '')
    return digits ? `tel:+${digits}` : ''
  })

  const miningRegistryLabel = computed(() =>
    props.organization.verification.miningRegistry ? 'Внесена' : 'Не внесена',
  )

  const miningRegistryIcon = computed(() =>
    props.organization.verification.miningRegistry ? 'mdi:check' : 'mdi:close',
  )

  const domainRegisteredLabel = computed(() => {
    const value = props.organization.domainRegisteredAt

    if (!value) {
      return ''
    }

    const [year, month, day] = value.split('-')

    if (!year || !month || !day) {
      return value
    }

    if (month === '01' && day === '01') {
      return year
    }

    return `${day}.${month}.${year}`
  })
</script>

<style scoped>
  .org-detail__sidebar {
    display: grid;
    grid-template-rows: auto 1fr;
    gap: 20px;
    min-height: 100%;
    position: sticky;
    top: 24px;
    align-self: stretch;
  }

  .org-detail__card {
    padding: clamp(20px, 3vw, 32px);
    border-radius: 32px;
    background: #1a1a1a;
  }

  .org-detail__card--stretch {
    flex: 1;
    display: flex;
    flex-direction: column;
    margin-bottom: 0;
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
    padding-right: 56px;
    padding-bottom: 8px;
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
    color: var(--tm-orange-accent-light);
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
    display: grid;
    grid-template-columns: minmax(0, 1fr) auto;
    align-items: center;
    gap: 12px;
    font-size: 18px;
    line-height: 24px;
  }

  .org-detail__top-control-label {
    color: #fff;
  }

  .org-detail__top-control-row :deep(.top-mining-chip) {
    width: auto;
    min-width: 192px;
    max-width: none;
    flex-shrink: 0;
    justify-content: flex-start;
  }

  .org-detail__top-control-row :deep(.top-mining-chip__title) {
    overflow: visible;
    text-overflow: clip;
    white-space: nowrap;
  }

  .org-detail__top-ribbon {
    position: absolute;
    right: 0;
    bottom: 0;
    z-index: 0;
    width: 120px;
    height: auto;
    object-fit: contain;
    object-position: right bottom;
    pointer-events: none;
    user-select: none;
  }

  .org-detail__contacts-card {
    margin-bottom: 0;
  }

  .org-detail__referral-card {
    display: flex;
    align-items: flex-start;
    gap: 16px;
    padding: 20px 24px;
    border-radius: 32px;
    background: #1a1a1a;
    color: #fff;
    text-decoration: none;
    transition: background-color 0.15s ease;
  }

  @media (hover: hover) {
    .org-detail__referral-card:hover {
      background: #242424;
    }
  }

  .org-detail__referral-icon {
    flex: 0 0 auto;
    margin-top: 2px;
    color: var(--tm-orange-accent-light);
    font-size: 28px;
  }

  .org-detail__referral-content {
    display: grid;
    gap: 8px;
    min-width: 0;
  }

  .org-detail__referral-text {
    color: #fff;
    font-size: 15px;
    line-height: 1.45;
  }

  .org-detail__referral-link {
    display: inline-flex;
    align-items: center;
    gap: 6px;
    color: var(--tm-orange-accent-light);
    font-size: 15px;
    font-weight: 600;
    line-height: 1.3;
  }

  .org-detail__referral-link-icon {
    font-size: 16px;
  }

  .org-detail__registry-card {
    padding: 24px;
    border-radius: 32px;
    background:
      radial-gradient(
        circle at 100% 0%,
        rgba(65, 231, 180, 0.12),
        transparent 50%
      ),
      #1a1a1a;
  }

  .org-detail__registry-head {
    display: flex;
    align-items: flex-start;
    justify-content: space-between;
    gap: 12px;
    margin-bottom: 12px;
  }

  .org-detail__registry-title {
    margin: 0;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: 20px;
    font-weight: 400;
    line-height: 1.2;
  }

  .org-detail__registry-badge {
    flex: 0 0 auto;
    color: #41e7b4;
    font-size: 28px;
  }

  .org-detail__registry-text {
    margin: 0;
    color: #bdbdbd;
    font-size: 15px;
    line-height: 1.5;
  }

  .org-detail__registry-body {
    display: flex;
    align-items: flex-start;
    justify-content: space-between;
    gap: 16px;
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
      color: var(--tm-orange-accent-light);
    }
  }

  @media (max-width: 1100px) {
    .org-detail__sidebar {
      position: static;
      grid-template-rows: auto;
      min-height: auto;
    }

    .org-detail__card--stretch {
      flex: none;
    }
  }

  @media (max-width: 640px) {
    .org-detail__top-control-row {
      grid-template-columns: 1fr;
      align-items: flex-start;
    }

    .org-detail__top-control-row :deep(.top-mining-chip) {
      width: auto;
      min-width: 192px;
    }
  }
</style>
