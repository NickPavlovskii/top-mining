<template>
  <section class="org-reviews">
    <h2 class="org-reviews__title">
      {{ t('orgDetail.reviewsTitle', undefined, { name: organizationName }) }}
    </h2>

    <div class="org-reviews__intro">
      <div class="org-reviews__prompt">
        <ul class="org-reviews__prompt-list">
          <li
            v-for="(question, index) in reviewQuestions"
            :key="index"
          >
            {{ question }}
          </li>
        </ul>
      </div>

      <div class="org-reviews__policy">
        <p>
          {{ t('orgDetail.policyP1') }}
        </p>
        <p>
          {{ t('orgDetail.policyP2Before') }}<strong>{{ t('orgDetail.policyP2Strong') }}</strong>
        </p>
        <p>
          <strong>{{ t('orgDetail.policyP3Strong') }}</strong>{{ t('orgDetail.policyP3After') }}
        </p>
        <p class="org-reviews__policy-note">
          <strong>{{ t('orgDetail.policyNote') }}</strong>
        </p>
      </div>
    </div>

    <div class="org-reviews__summary">
      <template v-if="hasSummaryRating">
        <p class="org-reviews__summary-value">
          {{ summaryRatingValue }}
        </p>
        <div
          class="org-reviews__summary-stars"
          :aria-label="t('orgDetail.reviewRatingValueAria', undefined, { value: summaryRatingValue })"
        >
          <Icon
            v-for="index in 5"
            :key="`summary-${index}`"
            :name="index <= summaryFilledStars ? 'mdi:star' : 'mdi:star-outline'"
            class="org-reviews__summary-star org-reviews__summary-star--filled"
            aria-hidden="true"
          />
        </div>
        <p class="org-reviews__summary-count">
          {{ reviewCountLabel }}
        </p>
      </template>
      <template v-else>
        <p class="org-reviews__summary-empty">
          {{ t('catalog.noRating') }}
        </p>
        <div
          class="org-reviews__summary-stars"
          :aria-label="t('catalog.noRating')"
        >
          <Icon
            v-for="index in 5"
            :key="`summary-empty-${index}`"
            name="mdi:star-outline"
            class="org-reviews__summary-star"
            aria-hidden="true"
          />
        </div>
      </template>
    </div>

    <form
      class="org-reviews__form"
      @submit.prevent="onSubmit"
    >
      <div class="org-reviews__form-grid">
        <div class="org-reviews__avatar">
          <img
            :src="logoMark"
            alt=""
            class="org-reviews__avatar-logo"
          />
        </div>

        <div class="org-reviews__form-main">
          <label class="org-reviews__textarea-wrap">
            <span class="sr-only">{{ t('orgDetail.reviewContentLabel') }}</span>
            <textarea
              v-model="form.content"
              class="org-reviews__textarea"
              rows="4"
              :placeholder="reviewPlaceholder"
              required
            />
          </label>

          <div class="org-reviews__actions-row">
            <div
              class="org-reviews__rating-input"
              :aria-label="t('orgDetail.reviewRatingAria')"
            >
              <button
                v-for="index in 5"
                :key="`input-${index}`"
                type="button"
                class="org-reviews__rating-star-btn"
                :aria-label="t('orgDetail.reviewRatingStarAria', undefined, { n: index })"
                @click="form.rating = index"
                @mouseenter="hoverRating = index"
                @mouseleave="hoverRating = 0"
              >
                <Icon
                  :name="index <= activeInputStars ? 'mdi:star' : 'mdi:star-outline'"
                  :class="[
                    'org-reviews__rating-star',
                    { 'org-reviews__rating-star--active': index <= activeInputStars },
                  ]"
                  aria-hidden="true"
                />
              </button>
            </div>

            <button
              type="submit"
              class="org-reviews__submit"
              :disabled="isSubmitting || !form.rating"
            >
              {{ isSubmitting ? t('orgDetail.submitting') : t('orgDetail.leaveReview') }}
            </button>
          </div>
        </div>

        <div class="org-reviews__fields">
          <label class="org-reviews__field">
            <Icon
              name="mdi:account-outline"
              class="org-reviews__field-icon"
              aria-hidden="true"
            />
            <input
              v-model="form.authorName"
              type="text"
              class="org-reviews__input"
              :placeholder="t('orgDetail.namePlaceholder')"
              required
            />
          </label>

          <label class="org-reviews__field">
            <Icon
              name="mdi:at"
              class="org-reviews__field-icon"
              aria-hidden="true"
            />
            <input
              v-model="form.authorEmail"
              type="email"
              class="org-reviews__input"
              :placeholder="t('orgDetail.emailPlaceholder')"
            />
          </label>

          <label class="org-reviews__field">
            <Icon
              name="mdi:phone-outline"
              class="org-reviews__field-icon"
              aria-hidden="true"
            />
            <input
              v-model="form.authorPhone"
              type="tel"
              class="org-reviews__input"
              :placeholder="t('orgDetail.phonePlaceholder')"
              required
            />
            <button
              type="button"
              class="org-reviews__field-hint"
              :aria-label="t('orgDetail.phoneHintAria')"
            >
              <Icon
                name="mdi:help-circle-outline"
                aria-hidden="true"
              />
            </button>
          </label>
        </div>
      </div>

      <p
        v-if="submitError"
        class="org-reviews__error"
        role="alert"
      >
        {{ submitError }}
      </p>

      <p
        v-if="isSubmitted"
        class="org-reviews__success"
        role="status"
      >
        {{ t('orgDetail.submitSuccess') }}
      </p>
    </form>

    <catalog-organization-review-list
      v-model:sort="sort"
      :reviews="reviews"
      :review-count-upper-label="reviewCountUpperLabel"
    />
  </section>
</template>

<script setup lang="ts">
  import logoMark from '~/assets/images/top-mining/logo-mark.png'
  import { ORGANIZATION_REVIEW_QUESTIONS } from '~/common/modules/catalog'
  import CatalogOrganizationReviewList from '~/components/catalog/organization-detail/CatalogOrganizationReviewList.vue'
  import type {
    OrganizationReview,
    OrganizationReviewSort,
    OrganizationReviewStats,
    OrganizationReviewsResponse,
  } from '~/types/organization-reviews'

  const props = defineProps<{
    organizationSlug: string
    organizationName: string
    rating: number
    hasPublicRating: boolean
    reviewCount: number
  }>()

  const emit = defineEmits<{
    'stats-updated': [stats: OrganizationReviewStats]
  }>()

  const { t } = useT()

  const sort = ref<OrganizationReviewSort>('newest')
  const hoverRating = ref(0)
  const isSubmitting = ref(false)
  const isSubmitted = ref(false)
  const submitError = ref('')

  const form = reactive({
    content: '',
    authorName: '',
    authorEmail: '',
    authorPhone: '',
    rating: 0,
  })

  const stats = ref<OrganizationReviewStats>({
    rating: props.rating,
    reviewCount: props.reviewCount,
    hasPublicRating: props.hasPublicRating,
  })

  const { data, refresh } = await useFetch<OrganizationReviewsResponse>(
    () => `/api/catalog/organizations/${props.organizationSlug}/reviews`,
    {
      query: computed(() => ({ sort: sort.value })),
      watch: [sort, () => props.organizationSlug],
    },
  )

  const reviews = computed<OrganizationReview[]>(() => data.value?.reviews ?? [])

  watch(
    data,
    (value) => {
      if (value?.stats) {
        stats.value = value.stats
        emit('stats-updated', value.stats)
      }
    },
    { immediate: true },
  )

  const reviewQuestions = computed(() =>
    ORGANIZATION_REVIEW_QUESTIONS.map((question, index) =>
      t(`orgDetail.reviewQ${index + 1}`, question),
    ),
  )

  const activeInputStars = computed(() => hoverRating.value || form.rating)

  const hasSummaryRating = computed(
    () => stats.value.hasPublicRating && stats.value.reviewCount > 0 && stats.value.rating > 0,
  )

  const summaryRatingValue = computed(() => {
    if (!hasSummaryRating.value) {
      return ''
    }

    return Number.isInteger(stats.value.rating)
      ? String(stats.value.rating)
      : stats.value.rating.toFixed(1)
  })

  const summaryFilledStars = computed(() => {
    if (!hasSummaryRating.value) {
      return 0
    }

    return Math.round(stats.value.rating)
  })

  function formatReviewCount(count: number) {
    const mod10 = count % 10
    const mod100 = count % 100
    let key = 'orgDetail.reviewCountMany'

    if (!(mod100 >= 11 && mod100 <= 14)) {
      if (mod10 === 1) {
        key = 'orgDetail.reviewCountOne'
      } else if (mod10 >= 2 && mod10 <= 4) {
        key = 'orgDetail.reviewCountFew'
      }
    }

    return t(key, undefined, { count })
  }

  const reviewCountLabel = computed(() =>
    formatReviewCount(stats.value.reviewCount),
  )

  const reviewCountUpperLabel = computed(() =>
    formatReviewCount(stats.value.reviewCount).toUpperCase(),
  )

  const reviewPlaceholder = computed(() =>
    stats.value.reviewCount > 0
      ? t('orgDetail.leaveReview')
      : t('orgDetail.leaveFirstReview'),
  )

  async function onSubmit() {
    if (!form.rating || isSubmitting.value) {
      return
    }

    isSubmitting.value = true
    submitError.value = ''
    isSubmitted.value = false

    try {
      const response = await $fetch<{
        stats: OrganizationReviewStats
      }>(`/api/catalog/organizations/${props.organizationSlug}/reviews`, {
        method: 'POST',
        body: {
          authorName: form.authorName,
          authorEmail: form.authorEmail,
          authorPhone: form.authorPhone,
          rating: form.rating,
          content: form.content,
        },
      })

      stats.value = response.stats
      emit('stats-updated', response.stats)
      isSubmitted.value = true

      form.content = ''
      form.authorName = ''
      form.authorEmail = ''
      form.authorPhone = ''
      form.rating = 0

      await refresh()
    } catch {
      submitError.value = t('orgDetail.submitError')
    } finally {
      isSubmitting.value = false
    }
  }
</script>

<style scoped>
  .org-reviews {
    margin-bottom: 20px;
    padding: clamp(20px, 3vw, 32px);
    border-radius: 32px;
    background: #1a1a1a;
    color: #fff;
    font-family: 'Mulish', 'Segoe UI', sans-serif;
  }

  .org-reviews__title {
    margin: 0 0 24px;
    color: #fff;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(22px, 2.5vw, 32px);
    font-weight: 400;
    line-height: 1.2;
  }

  .org-reviews__intro {
    margin-bottom: 28px;
  }

  .org-reviews__prompt {
    margin-bottom: 20px;
    padding: 20px 24px;
    border: 1px solid #4a4a4a;
    border-radius: 20px;
    background: transparent;
  }

  .org-reviews__prompt-list {
    display: grid;
    gap: 8px;
    margin: 0;
    padding-left: 20px;
    font-size: 16px;
    line-height: 1.5;
  }

  .org-reviews__policy {
    display: grid;
    gap: 16px;
    color: #fff;
    font-size: 16px;
    line-height: 1.65;
  }

  .org-reviews__policy p {
    margin: 0;
  }

  .org-reviews__policy-note {
    margin-top: 4px;
  }

  .org-reviews__summary {
    display: grid;
    justify-items: center;
    gap: 12px;
    margin-bottom: 28px;
    text-align: center;
  }

  .org-reviews__summary-empty {
    margin: 0;
    font-size: 16px;
    line-height: 24px;
  }

  .org-reviews__summary-value {
    margin: 0;
    font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
    font-size: clamp(32px, 5vw, 48px);
    line-height: 1;
  }

  .org-reviews__summary-stars {
    display: flex;
    gap: 10px;
  }

  .org-reviews__summary-star {
    color: #fff;
    font-size: 30px;
  }

  .org-reviews__summary-star--filled {
    color: #ffb400;
  }

  .org-reviews__summary-count {
    margin: 0;
    color: #bdbdbd;
    font-size: 16px;
    line-height: 24px;
  }

  .org-reviews__form {
    margin-bottom: 24px;
  }

  .org-reviews__form-grid {
    display: grid;
    grid-template-columns: 72px minmax(0, 1fr);
    gap: 16px 20px;
    align-items: start;
  }

  .org-reviews__avatar {
    padding-top: 4px;
  }

  .org-reviews__avatar-logo {
    width: 72px;
    height: 72px;
    border-radius: 20px;
    object-fit: contain;
    background: #161e35;
    padding: 10px;
    box-sizing: border-box;
  }

  .org-reviews__form-main {
    display: grid;
    gap: 16px;
    min-width: 0;
  }

  .org-reviews__textarea {
    width: 100%;
    min-height: 132px;
    padding: 18px 22px;
    border: 1px solid #4a4a4a;
    border-radius: 24px;
    background: #0a0a0a;
    color: #fff;
    font: inherit;
    line-height: 1.5;
    resize: vertical;
  }

  .org-reviews__textarea::placeholder {
    color: #8a8a8a;
  }

  .org-reviews__actions-row {
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 16px;
  }

  .org-reviews__rating-input {
    display: flex;
    gap: 10px;
  }

  .org-reviews__rating-star-btn {
    padding: 0;
    border: 0;
    background: none;
    cursor: pointer;
  }

  .org-reviews__rating-star {
    color: #fff;
    font-size: 30px;
  }

  .org-reviews__rating-star--active {
    color: #ffb400;
  }

  .org-reviews__submit {
    flex: 0 0 auto;
    min-width: 200px;
    padding: 16px 28px;
    border: 0;
    border-radius: 999px;
    background: var(--tm-orange-accent-light);
    color: #fff;
    font-family: inherit;
    font-size: 18px;
    font-weight: 600;
    line-height: 1.2;
    cursor: pointer;
  }

  .org-reviews__submit:disabled {
    opacity: 0.75;
    cursor: default;
  }

  .org-reviews__fields {
    display: grid;
    gap: 12px;
    grid-column: 1 / -1;
    max-width: 420px;
  }

  .org-reviews__field {
    display: flex;
    align-items: center;
    gap: 12px;
    min-height: 52px;
    padding: 0 16px;
    border: 0;
    border-radius: 16px;
    background: #fff;
    color: #0a0a0a;
  }

  .org-reviews__field-icon {
    flex: 0 0 auto;
    color: var(--tm-text-soft);
    font-size: 20px;
  }

  .org-reviews__input {
    flex: 1;
    min-width: 0;
    padding: 14px 0;
    border: 0;
    background: transparent;
    color: #0a0a0a;
    font: inherit;
    outline: none;
  }

  .org-reviews__input::placeholder {
    color: var(--tm-text-soft);
  }

  .org-reviews__field-hint {
    flex: 0 0 auto;
    padding: 0;
    border: 0;
    background: none;
    color: #bdbdbd;
    font-size: 18px;
    cursor: default;
  }

  .org-reviews__success {
    margin: 16px 0 0;
    color: #4caf50;
    font-size: 16px;
    line-height: 1.5;
    text-align: center;
  }

  .org-reviews__error {
    margin: 16px 0 0;
    color: #ff6b6b;
    font-size: 16px;
    line-height: 1.5;
    text-align: center;
  }

  .sr-only {
    position: absolute;
    width: 1px;
    height: 1px;
    padding: 0;
    margin: -1px;
    overflow: hidden;
    clip: rect(0, 0, 0, 0);
    white-space: nowrap;
    border: 0;
  }

  @media (max-width: 900px) {
    .org-reviews__form-grid {
      grid-template-columns: 1fr;
    }

    .org-reviews__avatar {
      display: none;
    }

    .org-reviews__fields {
      max-width: none;
    }

    .org-reviews__actions-row {
      flex-direction: column;
      align-items: stretch;
    }

    .org-reviews__submit {
      width: 100%;
      min-width: 0;
    }
  }
</style>
