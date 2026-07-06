<template>
  <article :class="cardClass">
    <div
      :class="[
        'catalog-org-card__inner',
        { 'catalog-org-card__inner--rich': isGridCard },
      ]"
    >
      <div class="catalog-org-card__top top-card-block">
        <component
          :is="linkComponent"
          v-bind="linkProps"
          :class="[
            'catalog-org-card__logo image-card-wrap',
            {
              'catalog-org-card__logo--rich': isGridCard,
              'catalog-org-card__logo--light': isLightLogo,
            },
          ]"
          @click.stop
        >
          <img
            v-if="organization.logoUrl"
            loading="lazy"
            :src="organization.logoUrl"
            :alt="organization.name"
            @load="onLogoLoad"
          />
          <span
            v-else
            class="catalog-org-card__logo-fallback"
          >
            {{ initials }}
          </span>
        </component>

        <div class="catalog-org-card__header">
          <div class="catalog-org-card__title-wrap title-card-wrap">
            <div
              v-if="
                organization.verification?.legalEntity
                  || organization.verification?.miningRegistry
              "
              class="catalog-org-card__badges"
            >
              <span
                v-if="organization.verification?.legalEntity"
                :class="[
                  'catalog-org-card__verified catalog-org-card__verified--badge',
                  { 'catalog-org-card__verified--exchange': isLightLogo },
                ]"
                aria-label="Проверенная компания"
              >
                <svg
                  xmlns="http://www.w3.org/2000/svg"
                  width="32"
                  height="32"
                  viewBox="0 0 32 32"
                  fill="none"
                  aria-hidden="true"
                >
                  <path
                    fill-rule="evenodd"
                    clip-rule="evenodd"
                    d="M10.708 15.6514L13.9155 19.3483C14.0267 19.4757 14.1839 19.5538 14.3526 19.5655C14.5213 19.5772 14.6877 19.5216 14.8155 19.4108C14.83 19.4005 14.8433 19.3885 14.8551 19.3751L21.2207 13.5395C21.3427 13.4249 21.4147 13.2668 21.4209 13.0995C21.4271 12.9322 21.3672 12.7692 21.254 12.6458C21.1408 12.5224 20.9836 12.4486 20.8163 12.4404C20.6491 12.4322 20.4854 12.4903 20.3607 12.602L14.4506 18.0179L11.673 14.821C11.6184 14.7576 11.552 14.7056 11.4773 14.6679C11.4027 14.6302 11.3214 14.6076 11.238 14.6014C11.1547 14.5951 11.0709 14.6054 10.9915 14.6315C10.9121 14.6576 10.8386 14.6991 10.7753 14.7537C10.7119 14.8082 10.6599 14.8747 10.6222 14.9493C10.5845 15.0239 10.5619 15.1052 10.5557 15.1886C10.5494 15.272 10.5597 15.3557 10.5858 15.4351C10.6119 15.5145 10.6534 15.588 10.708 15.6514ZM15.9905 6.36876C18.2192 6.36846 20.379 7.14094 22.102 8.55459C23.8249 9.96823 25.0044 11.9356 25.4395 14.1214C25.8745 16.3072 25.5382 18.5762 24.4878 20.5418C23.4374 22.5075 21.738 24.0481 19.679 24.9011C17.6201 25.7542 15.329 25.867 13.1963 25.2202C11.0635 24.5734 9.22096 23.2072 7.98263 21.3542C6.74431 19.5012 6.1868 17.2761 6.4051 15.0582C6.62341 12.8402 7.60402 10.7666 9.17985 9.19058C10.0728 8.29424 11.1343 7.58344 12.3032 7.09915C13.4721 6.61485 14.7252 6.36662 15.9905 6.36876ZM21.8959 10.0925C23.2616 11.4586 24.1114 13.2561 24.3005 15.1786C24.4896 17.101 24.0062 19.0296 22.9328 20.6357C21.8594 22.2417 20.2623 23.4259 18.4137 23.9865C16.5651 24.5471 14.5793 24.4494 12.7946 23.71C11.01 22.9706 9.53689 21.6353 8.62636 19.9316C7.71582 18.2279 7.42417 16.2612 7.80109 14.3666C8.17801 12.472 9.20019 10.7666 10.6935 9.54115C12.1867 8.31567 14.0587 7.64586 15.9905 7.64583C17.0874 7.64514 18.1736 7.86091 19.187 8.28077C20.2004 8.70063 21.1209 9.31633 21.8959 10.0926V10.0925ZM17.2159 0.394824L20.1315 2.44426C20.2009 2.49357 20.277 2.53266 20.3575 2.56032C20.4376 2.58739 20.5217 2.60097 20.6062 2.60051L24.1696 2.65407C24.6093 2.65904 25.0368 2.79936 25.394 3.05595C25.7498 3.31515 26.0159 3.67878 26.1555 4.09626L27.3095 7.46726C27.3366 7.54828 27.3751 7.62497 27.4241 7.69495C27.4746 7.76297 27.5348 7.82316 27.6029 7.87358L30.453 10.0125C30.8067 10.2734 31.0699 10.6383 31.2058 11.0563C31.3417 11.4742 31.3434 11.9242 31.2108 12.3432L30.1624 15.75C30.1106 15.9126 30.1106 16.0873 30.1624 16.25L31.2109 19.6563C31.3436 20.0753 31.3418 20.5253 31.2059 20.9433C31.07 21.3612 30.8067 21.7262 30.453 21.9871L27.603 24.1258C27.5349 24.1762 27.4746 24.2363 27.4242 24.3043C27.3752 24.3743 27.3366 24.451 27.3096 24.5321L26.1555 27.9031C26.0159 28.3205 25.7497 28.6842 25.394 28.9434C25.0368 29.2 24.6093 29.3403 24.1696 29.3452L20.6087 29.3988C20.5237 29.4026 20.4394 29.4161 20.3575 29.439C20.277 29.4666 20.2009 29.5057 20.1315 29.5551L17.2159 31.6063C16.8586 31.8624 16.43 32.0001 15.9904 32.0001C15.5508 32.0001 15.1222 31.8624 14.7649 31.6063L11.8495 29.5551C11.78 29.5058 11.7038 29.4666 11.6232 29.439C11.5414 29.4161 11.4572 29.4026 11.3723 29.3988L7.81116 29.3452C7.371 29.3424 6.94277 29.2019 6.58662 28.9432C6.23048 28.6845 5.96432 28.3208 5.82553 27.9031L4.67172 24.5321C4.64468 24.451 4.60603 24.3743 4.55697 24.3043C4.50658 24.2363 4.44639 24.1761 4.37835 24.1258L1.52797 21.9871C1.17426 21.7262 0.911005 21.3612 0.775101 20.9433C0.639196 20.5253 0.637447 20.0753 0.770097 19.6563L1.81847 16.25C1.87029 16.0874 1.87029 15.9127 1.81847 15.75L0.770097 12.3429C0.637547 11.9239 0.639348 11.474 0.775249 11.0561C0.911149 10.6383 1.17434 10.2734 1.52797 10.0125L4.37797 7.87389C4.44597 7.82345 4.50616 7.76326 4.5566 7.69526C4.60566 7.62532 4.64431 7.54862 4.67135 7.46758L5.82553 4.09626C5.96512 3.6789 6.23126 3.31539 6.58697 3.05626C6.94404 2.79969 7.3715 2.65936 7.81116 2.65439L11.3747 2.60082C11.4592 2.60131 11.5432 2.58773 11.6232 2.56064C11.7038 2.533 11.78 2.49392 11.8495 2.44457L14.7649 0.394824C15.1225 0.139315 15.5509 0.00195312 15.9904 0.00195312C16.4299 0.00195313 16.8584 0.139315 17.2159 0.394824Z"
                    fill="#FFDFCF"
                  />
                </svg>
                <span class="catalog-org-card__verified-tip">Проверенная компания</span>
              </span>

              <span
                v-if="organization.verification?.miningRegistry"
                class="catalog-org-card__verified catalog-org-card__verified--badge catalog-org-card__verified--registry"
                aria-label="Компания включена в Майнинг Реестр"
              >
                <Icon name="mdi:check-decagram" />
                <span class="catalog-org-card__verified-tip">Компания включена в Майнинг Реестр</span>
              </span>
            </div>

            <component
              :is="linkComponent"
              v-bind="linkProps"
              class="catalog-org-card__name title-card"
            >
              {{ displayName }}
            </component>
          </div>

          <div
            v-if="showRatingRow"
            class="catalog-org-card__rating-row"
          >
            <span class="catalog-org-card__rating-value">
              {{ compactRatingLabel }}
            </span>
            <span
              class="catalog-org-card__stars"
              :style="{ width: `${starsTrackWidth}px` }"
              :aria-label="`${compactRatingLabel} из 5`"
            >
              <span class="catalog-org-card__stars-track">
                <img
                  v-for="starIndex in 5"
                  :key="`empty-${starIndex}`"
                  class="catalog-org-card__star-icon catalog-org-card__star-icon--empty"
                  alt=""
                  :src="catalogStarIcon"
                />
              </span>
              <span
                class="catalog-org-card__stars-fill"
                :style="{ width: starsFillWidth }"
              >
                <img
                  v-for="starIndex in 5"
                  :key="`filled-${starIndex}`"
                  class="catalog-org-card__star-icon"
                  alt=""
                  :src="catalogStarIcon"
                />
              </span>
            </span>
            <span class="catalog-org-card__reviews-count">
              {{ reviewCountLabel }}
            </span>
          </div>

          <p
            v-else
            class="catalog-org-card__rating-line catalog-org-card__no-rating"
          >
            Нет рейтинга
          </p>
        </div>
      </div>

      <div
        v-if="isGridCard && hasDescriptionContent"
        class="catalog-org-card__description description-wrap"
      >
        <p
          v-if="organization.cardPromo"
          class="catalog-org-card__promo list-item-bonus"
        >
          <span>{{ organization.cardPromo }}</span>
        </p>

        <span
          v-for="tag in organization.cardTags"
          :key="tag"
          :class="[
            'catalog-org-card__tag list-item-grey-wrap',
            { 'catalog-org-card__tag--wide': isWideTag(tag) },
          ]"
        >
          {{ tag }}
        </span>

        <div
          v-if="organization.cardFeatures?.length"
          class="spech-item-wrap catalog-org-card__features"
        >
          <div
            v-for="feature in organization.cardFeatures"
            :key="feature"
            class="catalog-org-card__feature"
          >
            <span
              class="catalog-org-card__feature-check"
              aria-hidden="true"
            >
              <Icon name="mdi:check" />
            </span>
            <span>{{ feature }}</span>
          </div>
        </div>

        <div
          v-if="organization.foundedYear || organization.officeCity || organization.siteCity"
          class="catalog-org-card__meta"
        >
          <p
            v-if="organization.officeCity"
            class="catalog-org-card__meta-item"
          >
            <Icon
              name="mdi:map-marker-outline"
              class="catalog-org-card__meta-icon"
              aria-hidden="true"
            />
            <span>Офис: {{ organization.officeCity }}</span>
          </p>

          <p
            v-if="organization.siteCity"
            class="catalog-org-card__meta-item"
          >
            <Icon
              name="mdi:map-marker-outline"
              class="catalog-org-card__meta-icon"
              aria-hidden="true"
            />
            <span>Площадка: {{ organization.siteCity }}</span>
          </p>

          <p
            v-if="organization.foundedYear"
            class="catalog-org-card__meta-item"
          >
            <img
              alt=""
              aria-hidden="true"
              class="catalog-org-card__meta-icon catalog-org-card__meta-icon--calendar"
              src="/images/catalog/calendar-or.svg"
            />
            <span>Год основания: {{ organization.foundedYear }}</span>
          </p>
        </div>
      </div>

      <div
        v-if="!isGridCard"
        class="catalog-org-card__rating"
      >
        <img
          class="catalog-org-card__star"
          alt=""
          aria-hidden="true"
          :src="catalogStarIcon"
        />
        <span class="catalog-org-card__rating-value">
          {{ compactRatingLabel }}
        </span>
        <span class="catalog-org-card__reviews">
          Отзывов: {{ organization.reviewCount }}
        </span>
      </div>
    </div>
  </article>
</template>

<script setup lang="ts">
  import { NuxtLink } from '#components'
  import type { CatalogOrganization } from '~/types/catalog'
  import catalogStarIcon from '~/assets/images/catalog/star-24.png'

  const STAR_SIZE = 14
  const STAR_GAP = 2
  const STARS_COUNT = 5
  const starsTrackWidth = STAR_SIZE * STARS_COUNT + STAR_GAP * (STARS_COUNT - 1)

  const props = withDefaults(
    defineProps<{
      organization: CatalogOrganization
      layout?: 'carousel' | 'grid'
    }>(),
    {
      layout: 'carousel',
    },
  )

  const emit = defineEmits<{
    logoLoad: []
  }>()

  const isGridCard = computed(() => props.layout === 'grid')

  const hasDescriptionContent = computed(
    () =>
      Boolean(props.organization.cardPromo)
      || Boolean(props.organization.cardTags?.length)
      || Boolean(props.organization.cardFeatures?.length)
      || Boolean(props.organization.foundedYear)
      || Boolean(props.organization.officeCity)
      || Boolean(props.organization.siteCity),
  )

  const isLightLogo = computed(
    () => props.organization.logoTheme === 'light',
  )

  const starsFillWidth = computed(() => {
    const rating = Math.min(5, Math.max(0, props.organization.rating))
    return `${(rating / 5) * 100}%`
  })

  const showRatingRow = computed(
    () =>
      props.organization.hasPublicRating !== false
      && (props.organization.rating > 0 || props.organization.reviewCount > 0),
  )

  const reviewCountLabel = computed(() =>
    formatReviewCount(props.organization.reviewCount),
  )

  const cardClass = computed(() => [
    'catalog-org-card',
    { 'catalog-org-card--grid': isGridCard.value },
    { 'catalog-org-card--rich': isGridCard.value },
  ])

  const detailHref = computed(() => {
    if (props.organization.slug) {
      return `/sale_asic/${props.organization.slug}/`
    }

    const href = props.organization.href

    if (href?.startsWith('/')) {
      return href
    }

    return null
  })

  const linkComponent = computed(() => (detailHref.value ? NuxtLink : 'a'))

  const linkProps = computed(() => {
    if (detailHref.value) {
      return { to: detailHref.value }
    }

    return {
      href: props.organization.href || '#',
      target: '_blank',
      rel: 'noopener noreferrer',
    }
  })

  const displayName = computed(() =>
    isGridCard.value
      ? props.organization.name.toUpperCase()
      : props.organization.name,
  )

  const compactRatingLabel = computed(() => {
    if (props.organization.rating <= 0) {
      return '0'
    }

    return Number.isInteger(props.organization.rating)
      ? String(props.organization.rating)
      : props.organization.rating.toFixed(1)
  })

  const initials = computed(() => getInitials(props.organization.name))

  function isWideTag(tag: string) {
    return tag.startsWith('Добываемые монеты:') || tag.length > 48
  }

  function formatReviewCount(count: number) {
    const mod10 = count % 10
    const mod100 = count % 100

    if (mod100 >= 11 && mod100 <= 14) {
      return `${count} отзывов`
    }

    if (mod10 === 1) {
      return `${count} отзыв`
    }

    if (mod10 >= 2 && mod10 <= 4) {
      return `${count} отзыва`
    }

    return `${count} отзывов`
  }

  function getInitials(name: string) {
    return name
      .split(/\s+/)
      .slice(0, 2)
      .map((part) => part[0]?.toUpperCase() ?? '')
      .join('')
  }

  function onLogoLoad() {
    emit('logoLoad')
  }
</script>

<style scoped>
  .catalog-org-card {
    flex: 0 0 clamp(220px, 17vw, 260px);
    display: flex;
    align-self: stretch;
    scroll-snap-align: start;
  }

  .catalog-org-card--grid {
    flex: initial;
    width: 100%;
  }

  .catalog-org-card__inner {
    display: flex;
    flex: 1;
    flex-direction: column;
    align-items: stretch;
    width: 100%;
    min-height: 168px;
    padding: 24px;
    border-radius: 32px;
    background: #fff;
    box-shadow: 0 8px 24px rgba(20, 20, 20, 0.06);
    box-sizing: border-box;
    transition: transform 0.2s ease, box-shadow 0.2s ease;
  }

  .catalog-org-card--rich .catalog-org-card__inner {
    gap: 0;
    padding: 20px;
    border: none;
    border-radius: 30px;
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.03);
  }

  .catalog-org-card--rich:hover .catalog-org-card__inner {
    transform: none;
    box-shadow: 0 6px 24px rgba(0, 0, 0, 0.06);
  }

  .top-card-block {
    display: flex;
    align-items: center;
    gap: 20px;
    margin-bottom: 12px;
  }

  .catalog-org-card--rich .catalog-org-card__top {
    align-items: flex-start;
  }

  .catalog-org-card__inner--rich {
    gap: 12px;
    min-height: 0;
  }

  .catalog-org-card:hover .catalog-org-card__inner:not(.catalog-org-card__inner--rich) {
    transform: translateY(-2px);
    box-shadow: 0 12px 28px rgba(20, 20, 20, 0.08);
  }

  .catalog-org-card__top {
    display: flex;
    align-items: center;
    gap: 16px;
  }

  .catalog-org-card:not(.catalog-org-card--rich) .catalog-org-card__top {
    flex-direction: column;
    gap: 0;
  }

  .catalog-org-card__logo {
    display: flex;
    align-items: center;
    justify-content: center;
    flex-shrink: 0;
    width: 56px;
    height: 56px;
    margin-bottom: 16px;
    padding: 6px;
    border-radius: 14px;
    background: #f3f3f3;
    overflow: hidden;
    box-sizing: border-box;
    color: inherit;
    text-decoration: none;
  }

  .catalog-org-card--rich .catalog-org-card__logo {
    width: 100px;
    height: 100px;
    max-width: 100px;
    max-height: 100px;
    margin-bottom: 0;
    padding: 0;
    border-radius: 16px;
    background: #141414;
  }

  .catalog-org-card--rich .catalog-org-card__logo--light {
    padding: 10px;
    border: 1px solid #efefef;
    background: #fff;
  }

  .title-card-wrap {
    display: flex;
    flex-direction: column;
    gap: 9px;
    margin-top: 0;
    margin-bottom: 0;
    min-width: 0;
  }

  .catalog-org-card__badges {
    display: flex;
    flex-direction: row;
    align-items: center;
    gap: 6px;
  }

  .catalog-org-card__verified {
    position: relative;
    display: inline-flex;
    flex-shrink: 0;
    color: var(--tm-orange);
    font-size: 20px;
    line-height: 1;
    cursor: help;
  }

  .catalog-org-card__verified.catalog-org-card__verified--badge {
    align-items: center;
    justify-content: center;
    width: 32px;
    height: 32px;
    font-size: 32px;
  }

  .catalog-org-card__verified.catalog-org-card__verified--badge svg,
  .catalog-org-card__verified.catalog-org-card__verified--badge :deep(svg) {
    display: block;
    width: 32px;
    height: 32px;
    flex-shrink: 0;
  }

  .catalog-org-card--rich .catalog-org-card__logo--light img {
    border-radius: 0;
  }

  .catalog-org-card--rich .catalog-org-card__logo:not(.catalog-org-card__logo--light) img {
    border-radius: 16px;
  }

  .catalog-org-card__logo-fallback {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    width: 100%;
    height: 100%;
    border-radius: 12px;
    background: #ececec;
    color: #666;
    font-size: 13px;
    font-weight: 700;
    letter-spacing: 0.04em;
  }

  .catalog-org-card__header {
    display: grid;
    gap: 4px;
    min-width: 0;
    flex: 1;
  }

  .catalog-org-card__logo img {
    display: block;
    width: 100%;
    height: 100%;
    object-fit: contain;
    object-position: center;
  }

  .catalog-org-card__title-row {
    display: flex;
    align-items: center;
    flex-wrap: wrap;
    gap: 6px;
    min-width: 0;
  }

  .catalog-org-card__title-row .catalog-org-card__name {
    min-width: 0;
  }

  .catalog-org-card__verified--inline {
    flex-shrink: 0;
  }

  .catalog-org-card__verified--exchange {
    color: #ff6b9d;
  }

  .catalog-org-card__verified--registry {
    color: #4da3ff;
  }

  .catalog-org-card__verified-tip {
    position: absolute;
    left: 0;
    bottom: calc(100% + 8px);
    z-index: 2;
    display: none;
    padding: 8px 12px;
    border-radius: 12px;
    background: #141414;
    color: #fff;
    font-family: inherit;
    font-size: 13px;
    font-weight: 500;
    line-height: 1.2;
    white-space: nowrap;
    pointer-events: none;
  }

  .catalog-org-card__verified:hover .catalog-org-card__verified-tip,
  .catalog-org-card__verified:focus-within .catalog-org-card__verified-tip {
    display: block;
  }

  .catalog-org-card--rich .catalog-org-card__name,
  .catalog-org-card--rich .title-card {
    font-size: clamp(18px, 2vw, 28px);
    font-weight: 400;
    line-height: 1.2;
    letter-spacing: 0;
  }

  .catalog-org-card__name {
    margin: 0;
    color: #141414;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(16px, 2vw, 22px);
    font-weight: 600;
    line-height: 1.15;
    text-align: left;
    text-decoration: none;
  }

  .catalog-org-card__name:hover {
    color: var(--tm-orange);
  }

  .catalog-org-card:not(.catalog-org-card--rich) .catalog-org-card__name {
    display: -webkit-box;
    -webkit-box-orient: vertical;
    -webkit-line-clamp: 2;
    overflow: hidden;
    font-family: inherit;
    font-size: 16px;
  }

  .catalog-org-card__rating-line {
    margin: 0;
    color: #141414;
    font-size: 14px;
    font-weight: 400;
    line-height: 20px;
  }

  .catalog-org-card__rating-row {
    display: flex;
    align-items: center;
    flex-wrap: wrap;
    gap: 6px 8px;
  }

  .catalog-org-card__stars {
    position: relative;
    display: inline-flex;
    flex-shrink: 0;
    height: 14px;
  }

  .catalog-org-card__stars-track,
  .catalog-org-card__stars-fill {
    display: inline-flex;
    align-items: center;
    gap: 2px;
  }

  .catalog-org-card__stars-fill {
    position: absolute;
    left: 0;
    top: 0;
    overflow: hidden;
  }

  .catalog-org-card__star-icon {
    width: 14px;
    height: 14px;
    flex-shrink: 0;
    object-fit: contain;
  }

  .catalog-org-card__star-icon--empty {
    opacity: 0.22;
    filter: grayscale(1);
  }

  .catalog-org-card__reviews-count {
    color: var(--tm-text-muted);
    font-size: 14px;
    font-weight: 400;
    line-height: 20px;
  }

  .catalog-org-card__no-rating {
    margin-right: 10px;
    color: #ccc;
  }

  .catalog-org-card__rating-value {
    font-size: 14px;
    font-weight: 400;
    line-height: 20px;
  }

  .description-wrap {
    display: flex;
    flex-wrap: wrap;
    gap: 10px 15px;
    color: #141414;
    font-family: 'Mulish', 'Segoe UI', system-ui, sans-serif;
    font-size: 14px;
    font-weight: 400;
    line-height: 20px;
  }

  .list-item-bonus {
    width: 100%;
    margin: 0 0 5px;
    padding: 0;
    font-family: inherit;
    font-size: 14px;
    font-weight: 400;
    line-height: 20px;
    color: #141414;
  }

  .description-wrap .list-item-grey-wrap {
    font-family: inherit;
    font-size: 12px;
    line-height: 16px;
    padding: 8px 10px;
    border-radius: 9px;
    background: #f6f6f6;
    color: #141414;
  }

  .catalog-org-card__tag--wide {
    display: block;
    width: 100%;
    max-width: 100%;
    min-width: 0;
    order: 5;
    overflow: hidden;
    white-space: nowrap;
    text-overflow: ellipsis;
    box-sizing: border-box;
  }

  .catalog-org-card__meta {
    display: flex;
    flex-wrap: wrap;
    align-items: center;
    order: 20;
    width: 100%;
    gap: 8px 16px;
    margin-top: 5px;
  }

  .catalog-org-card__meta-item {
    display: inline-flex;
    align-items: center;
    gap: 6px;
    margin: 0;
    color: var(--tm-orange);
    font-family: inherit;
    font-size: 12px;
    font-weight: 500;
    line-height: 16px;
  }

  .catalog-org-card__meta-icon {
    width: 14px;
    height: 14px;
    flex-shrink: 0;
  }

  .catalog-org-card__meta-icon--calendar {
    display: block;
    object-fit: contain;
  }

  .catalog-org-card__description {
    margin-top: 0;
  }

  .description-wrap .spech-item-wrap {
    margin-top: 5px;
  }

  .spech-item-wrap {
    width: 100%;
    display: flex;
    flex-wrap: wrap;
    padding: 5px 10px;
    background: #f6f6f6;
    border-radius: 9px;
    gap: 10px 15px;
    order: 10;
    box-sizing: border-box;
  }

  .catalog-org-card__feature {
    display: flex;
    align-items: flex-start;
    gap: 8px;
    width: auto;
    margin: 0;
    color: #141414;
    font-family: inherit;
    font-size: 14px;
    font-weight: 400;
    line-height: 20px;
  }

  .catalog-org-card__feature-check {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    width: 16px;
    height: 16px;
    margin-top: 2px;
    flex-shrink: 0;
    border-radius: 3px;
    background: var(--tm-orange);
    color: #fff;
    font-size: 12px;
  }

  .catalog-org-card__rating {
    display: flex;
    align-items: center;
    flex-wrap: wrap;
    gap: 6px 8px;
    margin-top: auto;
    flex-shrink: 0;
    width: 100%;
    color: #141414;
    font-size: 14px;
    font-weight: 500;
    line-height: 1.2;
  }

  .catalog-org-card:not(.catalog-org-card--rich) .catalog-org-card__rating-value {
    font-weight: 600;
  }

  .catalog-org-card__star {
    width: 15px;
    height: 15px;
    flex-shrink: 0;
    object-fit: contain;
  }

  .catalog-org-card__reviews {
    font-weight: 500;
  }
</style>
