<template>
  <section class="org-reviews">
    <h2 class="org-reviews__title">
      Отзывы {{ organizationName }}
    </h2>

    <div class="org-reviews__intro">
      <div class="org-reviews__prompt">
        <ul class="org-reviews__prompt-list">
          <li
            v-for="question in reviewQuestions"
            :key="question"
          >
            {{ question }}
          </li>
        </ul>
      </div>

      <div class="org-reviews__policy">
        <p>
          У нас собрано большинство отзывов, которые есть о компании в интернете
          (Яндекс Карты, Google Карты, 2GIS, Отзовик, блеклист ТГ и другие).
        </p>
        <p>
          Мы, Команда ТОП-МАЙНИНГА, понимаем, что большинство отзывов могли быть
          накручены. <strong>Но на нашей площадке такого не будет.</strong>
        </p>
        <p>
          <strong>Просим всех майнеров активно оставлять отзывы</strong>, ведь оставляя
          положительный или отрицательный отзыв, вы помогаете компаниям
          развиваться и улучшать качество услуг в мире майнинга.
        </p>
        <p class="org-reviews__policy-note">
          <strong>Все отзывы проверяются перед публикацией!</strong>
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
          :aria-label="`Рейтинг ${summaryRatingValue}`"
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
          Нет рейтинга
        </p>
        <div
          class="org-reviews__summary-stars"
          aria-label="Нет рейтинга"
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
            <span class="sr-only">Текст отзыва</span>
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
              aria-label="Оценка отзыва"
            >
              <button
                v-for="index in 5"
                :key="`input-${index}`"
                type="button"
                class="org-reviews__rating-star-btn"
                :aria-label="`Оценка ${index}`"
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
              {{ isSubmitting ? 'Отправка…' : 'Оставить отзыв' }}
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
              placeholder="Имя*"
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
              placeholder="Email"
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
              placeholder="Телефон*"
              required
            />
            <button
              type="button"
              class="org-reviews__field-hint"
              aria-label="Подсказка по телефону"
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
        Отправлено! Наш менеджер свяжется с вами
      </p>
    </form>

    <div class="org-reviews__footer">
      <div class="org-reviews__footer-head">
        <p class="org-reviews__footer-count">
          {{ reviewCountUpperLabel }}
        </p>
        <label
          v-if="reviews.length"
          class="org-reviews__sort"
        >
          <span class="sr-only">Сортировка отзывов</span>
          <select
            v-model="sort"
            class="org-reviews__sort-select"
          >
            <option
              v-for="option in sortOptions"
              :key="option.value"
              :value="option.value"
            >
              {{ option.label }}
            </option>
          </select>
          <Icon
            name="mdi:chevron-down"
            class="org-reviews__sort-icon"
            aria-hidden="true"
          />
        </label>
      </div>
      <div class="org-reviews__footer-line" />
    </div>

    <ul
      v-if="reviews.length"
      class="org-reviews__list"
    >
      <li
        v-for="review in reviews"
        :key="review.id"
        class="org-reviews__item"
      >
        <div class="org-reviews__item-head">
          <img
            :src="logoMark"
            alt=""
            class="org-reviews__item-avatar"
          />
          <div class="org-reviews__item-meta">
            <p class="org-reviews__item-name">
              {{ review.authorName }}
            </p>
            <p class="org-reviews__item-date">
              <Icon
                name="mdi:clock-outline"
                aria-hidden="true"
              />
              {{ formatReviewDate(review.publishedAt) }}
            </p>
          </div>
        </div>

        <div
          class="org-reviews__item-stars"
          :aria-label="`Оценка ${review.rating}`"
        >
          <Icon
            v-for="index in 5"
            :key="`${review.id}-${index}`"
            :name="index <= review.rating ? 'mdi:star' : 'mdi:star-outline'"
            class="org-reviews__item-star"
            aria-hidden="true"
          />
        </div>

        <p class="org-reviews__item-content">
          {{ review.content }}
        </p>

        <p class="org-reviews__item-source">
          {{ review.source }}
        </p>

        <div class="org-reviews__item-actions">
          <span class="org-reviews__votes">
            <Icon
              name="mdi:thumb-up-outline"
              aria-hidden="true"
            />
            {{ review.likesCount }}
            <span aria-hidden="true">|</span>
            <Icon
              name="mdi:thumb-down-outline"
              aria-hidden="true"
            />
            {{ review.dislikesCount }}
          </span>
          <button
            type="button"
            class="org-reviews__reply"
          >
            <Icon
              name="mdi:reply"
              aria-hidden="true"
            />
            Ответить
          </button>
        </div>
      </li>
    </ul>
  </section>
</template>

<script setup lang="ts">
  import logoMark from '~/assets/images/top-mining/logo-mark.png'
  import type {
    OrganizationReview,
    OrganizationReviewSort,
    OrganizationReviewStats,
    OrganizationReviewsResponse,
  } from '~/types/organization-reviews'

  const reviewQuestions = [
    'Вас плохо или хорошо проконсультировали?',
    'Вам понравилась или не понравилась коммуникация?',
    'Компания не выполнила свои обязательства или выполнила их превосходя ваши ожидания?',
    'Нарушены сроки поставки?',
    'Вам необоснованно подняли тариф на электроэнергию?',
  ]

  const sortOptions: Array<{ value: OrganizationReviewSort; label: string }> = [
    { value: 'newest', label: 'Новые' },
    { value: 'oldest', label: 'Старые' },
    { value: 'rating-desc', label: 'Высокая оценка' },
    { value: 'rating-asc', label: 'Низкая оценка' },
  ]

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

  const reviewCountLabel = computed(() => formatReviewCount(stats.value.reviewCount))

  const reviewCountUpperLabel = computed(() => {
    const count = stats.value.reviewCount
    const word = formatReviewCount(count).split(' ').slice(1).join(' ')

    return `${count} ${word}`.toUpperCase()
  })

  const reviewPlaceholder = computed(() =>
    stats.value.reviewCount > 0 ? 'Оставить отзыв' : 'Оставьте первый отзыв!',
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
      submitError.value = 'Не удалось отправить отзыв. Попробуйте позже.'
    } finally {
      isSubmitting.value = false
    }
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

  function formatReviewDate(isoDate: string) {
    const date = new Date(isoDate)

    if (Number.isNaN(date.getTime())) {
      return isoDate
    }

    const day = String(date.getDate()).padStart(2, '0')
    const month = String(date.getMonth() + 1).padStart(2, '0')
    const year = date.getFullYear()
    const hours = String(date.getHours()).padStart(2, '0')
    const minutes = String(date.getMinutes()).padStart(2, '0')

    return `${day}.${month}.${year} ${hours}:${minutes}`
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

  .org-reviews__avatar-logo,
  .org-reviews__item-avatar {
    width: 56px;
    height: 56px;
    border-radius: 999px;
    object-fit: contain;
    background: #fff;
    padding: 8px;
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
    background: #ff741f;
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
    color: #757575;
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
    color: #757575;
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

  .org-reviews__footer {
    display: grid;
    gap: 16px;
    margin-bottom: 24px;
  }

  .org-reviews__footer-head {
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 16px;
  }

  .org-reviews__footer-count {
    margin: 0;
    color: #8a8a8a;
    font-size: 14px;
    letter-spacing: 0.04em;
  }

  .org-reviews__footer-line {
    height: 1px;
    background: #3a3a3a;
  }

  .org-reviews__sort {
    position: relative;
    display: inline-flex;
    align-items: center;
  }

  .org-reviews__sort-select {
    appearance: none;
    padding: 8px 32px 8px 12px;
    border: 0;
    border-radius: 12px;
    background: transparent;
    color: #fff;
    font: inherit;
    cursor: pointer;
  }

  .org-reviews__sort-icon {
    position: absolute;
    right: 8px;
    pointer-events: none;
    color: #bdbdbd;
    font-size: 20px;
  }

  .org-reviews__list {
    display: grid;
    gap: 16px;
    margin: 0;
    padding: 0;
    list-style: none;
  }

  .org-reviews__item {
    padding: 20px 24px;
    border-radius: 24px;
    background: #141414;
  }

  .org-reviews__item-head {
    display: flex;
    align-items: center;
    gap: 12px;
    margin-bottom: 12px;
  }

  .org-reviews__item-meta {
    min-width: 0;
  }

  .org-reviews__item-name {
    margin: 0 0 4px;
    font-size: 18px;
    font-weight: 600;
    line-height: 1.3;
  }

  .org-reviews__item-date {
    display: inline-flex;
    align-items: center;
    gap: 6px;
    margin: 0;
    color: #bdbdbd;
    font-size: 14px;
    line-height: 1.3;
  }

  .org-reviews__item-stars {
    display: flex;
    gap: 6px;
    margin-bottom: 12px;
  }

  .org-reviews__item-star {
    color: #ffb400;
    font-size: 22px;
  }

  .org-reviews__item-content {
    margin: 0 0 12px;
    font-size: 16px;
    line-height: 1.6;
  }

  .org-reviews__item-source {
    margin: 0 0 16px;
    color: #757575;
    font-size: 14px;
    line-height: 1.4;
  }

  .org-reviews__item-actions {
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 12px;
    color: #bdbdbd;
    font-size: 14px;
  }

  .org-reviews__votes {
    display: inline-flex;
    align-items: center;
    gap: 8px;
  }

  .org-reviews__reply {
    display: inline-flex;
    align-items: center;
    gap: 6px;
    padding: 0;
    border: 0;
    background: none;
    color: #fff;
    font: inherit;
    cursor: pointer;
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
