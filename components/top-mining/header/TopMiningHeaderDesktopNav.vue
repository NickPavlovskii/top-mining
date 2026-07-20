<template>
  <div
    v-for="column in TOP_MINING_NAV_COLUMNS"
    :key="column.title"
    :class="[
      'top-mining__nav-column',
      {
        'top-mining__nav-column--ratings': column.slug === 'ratings',
        'top-mining__nav-column--consulting': column.slug === 'consulting',
      },
    ]"
  >
    <h3
      :class="[
        'top-mining__nav-heading',
        {
          'top-mining__nav-heading--consulting': column.slug === 'consulting',
        },
      ]"
    >
      <span
        v-if="column.slug === 'consulting'"
        class="top-mining__consulting-pill"
      >
        <span class="top-mining__consulting-pill-badge">
          <img
            alt=""
            class="top-mining__consulting-pill-icon"
            :src="logoMark"
          />
        </span>
        <span class="top-mining__consulting-pill-label">CONSULTING-УСЛУГИ</span>
      </span>
      <nuxt-link
        v-else-if="isNavHeadingLink(column.slug)"
        :to="getTopMiningNavHeadingHref(column.slug)"
        class="top-mining__nav-heading-link"
        @click="emit('nav-link-click')"
      >
        <span class="top-mining__nav-heading-text">{{ column.title }}</span>
        <Icon
          name="mdi:arrow-top-right"
          class="top-mining__nav-heading-arrow"
        />
      </nuxt-link>
      <a
        v-else
        href="#"
        class="top-mining__nav-heading-link"
      >
        <span class="top-mining__nav-heading-text">{{ column.title }}</span>
        <Icon
          name="mdi:arrow-top-right"
          class="top-mining__nav-heading-arrow"
        />
      </a>
    </h3>

    <template v-if="column.slug === 'catalog'">
      <nuxt-link
        v-for="(category, itemIndex) in visibleCatalogCategories"
        :key="category.id"
        :to="getCatalogCategoryHref(category.id)"
        :class="[
          'top-mining__nav-link',
          {
            'top-mining__nav-link--hidden':
              itemIndex >= column.mobileVisible && !props.isNavColumnExpanded(column.title),
          },
        ]"
        @click="emit('nav-link-click')"
      >
        <Icon
          :name="column.icon"
          class="top-mining__nav-link-icon"
        />
        <span class="top-mining__nav-link-text">{{ category.label }}</span>
      </nuxt-link>
    </template>

    <template v-else-if="column.slug === 'ratings'">
      <nuxt-link
        v-for="(item, itemIndex) in column.items"
        :key="item"
        :to="getRatingsPageHref(getRatingsCategoryIdByLabel(item))"
        :class="[
          'top-mining__nav-link',
          {
            'top-mining__nav-link--hidden':
              itemIndex >= column.mobileVisible && !props.isNavColumnExpanded(column.title),
          },
        ]"
        @click="emit('nav-link-click')"
      >
        <img
          alt=""
          class="top-mining__nav-top-icon"
          :src="topStarsIcon"
        />
        <span class="top-mining__nav-link-text">{{ item }}</span>
      </nuxt-link>
    </template>

    <template v-else-if="column.slug === 'calculator'">
      <a
        v-for="(item, itemIndex) in column.items"
        :key="item"
        href="#"
        :class="[
          'top-mining__nav-link',
          {
            'top-mining__nav-link--group-start':
              item === 'Конвертер хешрейта',
            'top-mining__nav-link--hidden':
              itemIndex >= column.mobileVisible && !props.isNavColumnExpanded(column.title),
          },
        ]"
      >
        <img
          v-if="item === 'Калькулятор в Telegram'"
          alt=""
          class="top-mining__nav-telegram-icon"
          :src="telegramMenuIcon"
        />
        <Icon
          v-else
          :name="getCalculatorNavItemIcon(item)"
          class="top-mining__nav-link-icon"
        />
        <span class="top-mining__nav-link-text">{{ item }}</span>
      </a>
    </template>

    <template v-else-if="column.slug === 'articles'">
      <nuxt-link
        v-for="(item, itemIndex) in column.items"
        :key="item"
        :to="getArticlesNavHref(item)"
        :class="[
          'top-mining__nav-link',
          {
            'top-mining__nav-link--hidden':
              itemIndex >= column.mobileVisible && !props.isNavColumnExpanded(column.title),
          },
        ]"
        @click="emit('nav-link-click')"
      >
        <Icon
          :name="column.icon"
          class="top-mining__nav-link-icon"
        />
        <span class="top-mining__nav-link-text">{{ item }}</span>
      </nuxt-link>
    </template>

    <template v-else-if="column.slug === 'consulting'">
      <a
        v-for="(item, itemIndex) in column.items"
        :key="item"
        href="#"
        :class="[
          'top-mining__nav-link',
          {
            'top-mining__nav-link--hidden':
              itemIndex >= column.mobileVisible && !props.isNavColumnExpanded(column.title),
          },
        ]"
      >
        <img
          alt=""
          class="top-mining__nav-link-icon top-mining__nav-link-icon--consulting"
          :src="consultingServiceIcon"
        />
        <span class="top-mining__nav-link-text">{{ item }}</span>
      </a>

      <div class="top-mining__nav-column-contacts">
        <div class="top-mining__nav-contact-icons">
          <a
            v-for="social in TOP_MINING_MOBILE_MENU_SOCIALS"
            :key="social.label"
            :href="social.href"
            class="top-mining__nav-contact-btn"
            :aria-label="social.label"
            :target="social.icon === 'mdi:phone' ? undefined : '_blank'"
            :rel="social.icon === 'mdi:phone' ? undefined : 'noopener noreferrer'"
          >
            <Icon :name="social.icon" />
          </a>
        </div>
        <a
          :href="TOP_MINING_MOBILE_MENU_PHONE.href"
          class="top-mining__nav-contact-phone"
        >
          {{ TOP_MINING_MOBILE_MENU_PHONE.label }}
        </a>
      </div>
    </template>

    <button
      v-if="getColumnNavItems(column).length > column.mobileVisible"
      type="button"
      class="top-mining__nav-more"
      @click="emit('toggle-column', column.title)"
    >
      <span>
        {{ props.navColumnToggleLabels[column.title] }}
      </span>
      <Icon
        name="mdi:chevron-down"
        :class="[
          'top-mining__nav-more-icon',
          { 'top-mining__nav-more-icon--open': props.isNavColumnExpanded(column.title) },
        ]"
      />
    </button>
  </div>
</template>

<script setup lang="ts">
  import {
    getCatalogCategoryHref,
    getTopMiningNavHeadingHref,
  } from '~/common/modules/catalog/nav-links'
  import {
    getRatingsCategoryIdByLabel,
    getRatingsPageHref,
  } from '~/common/modules/ratings'
  import {
    getArticlesNavHref,
  } from '~/common/modules/top-mining/articles-section'
  import {
    TOP_MINING_MOBILE_MENU_PHONE,
    TOP_MINING_MOBILE_MENU_SOCIALS,
    TOP_MINING_NAV_COLUMNS,
    getCalculatorNavItemIcon,
    isNavHeadingLink,
  } from '~/common/modules/top-mining'
  import type { TopMiningNavColumn } from '~/common/modules/top-mining/nav-columns'
  import logoMark from '~/assets/images/top-mining/logo-mark.png'
  import telegramMenuIcon from '~/assets/images/top-mining/telegram-menu-icon.png'
  import topStarsIcon from '~/assets/images/top-mining/top-stars-icon.png'
  import consultingServiceIcon from '~/assets/images/top-mining/consulting-service-icon.png'

  const props = defineProps<{
    isNavColumnExpanded: (title: string) => boolean
    navColumnToggleLabels: Record<string, string>
  }>()

  const emit = defineEmits<{
    'toggle-column': [title: string]
    'nav-link-click': []
  }>()

  const { visibleCategories: visibleCatalogCategories } = useVisibleCatalogCategories()

  function getColumnNavItems(column: TopMiningNavColumn) {
    if (column.slug === 'catalog') {
      return visibleCatalogCategories.value.map((category) => category.label)
    }

    return column.items
  }
</script>
