<template>
  <div class="top-mining__nav-compact">
    <div
      v-for="column in compactNavColumns"
      :key="`compact-${column.slug}`"
      class="top-mining__nav-compact-wrap"
    >
      <nuxt-link
        v-if="isNavHeadingLink(column.slug)"
        :to="getTopMiningNavHeadingHref(column.slug)"
        class="top-mining__nav-compact-link"
        @click="emit('nav-link-click')"
      >
        {{ column.title }}
      </nuxt-link>
      <a
        v-else
        href="#"
        class="top-mining__nav-compact-link"
      >
        {{ column.title }}
      </a>

      <div
        class="top-mining__nav-compact-panel"
        role="menu"
        :aria-label="column.title"
      >
        <template v-if="column.slug === 'catalog'">
          <nuxt-link
            v-for="category in visibleCatalogCategories"
            class="top-mining__nav-compact-panel-link"
            role="menuitem"
            :key="category.id"
            :to="getCatalogCategoryHref(category.id)"
            @click="emit('nav-link-click')"
          >
            <Icon
              class="top-mining__nav-compact-panel-icon"
              aria-hidden="true"
              :name="column.icon"
            />
            <span>{{ category.label }}</span>
          </nuxt-link>
        </template>

        <template v-else-if="column.slug === 'ratings'">
          <nuxt-link
            v-for="item in column.items"
            :key="item"
            :to="getRatingsPageHref(getRatingsCategoryIdByLabel(item))"
            class="top-mining__nav-compact-panel-link"
            role="menuitem"
            @click="emit('nav-link-click')"
          >
            <img
              alt=""
              aria-hidden="true"
              class="top-mining__nav-compact-panel-icon top-mining__nav-compact-panel-icon--image top-mining__nav-compact-panel-icon--ratings"
              :src="topStarsIcon"
            />
            <span>{{ item }}</span>
          </nuxt-link>
        </template>

        <template v-else>
          <template
            v-for="(item, itemIndex) in column.items"
            :key="item"
          >
            <hr
              v-if="shouldShowCompactNavDivider(column, itemIndex)"
              class="top-mining__nav-compact-panel-divider"
            />
            <a
              href="#"
              class="top-mining__nav-compact-panel-link"
              role="menuitem"
            >
              <img
                v-if="item === 'Калькулятор в Telegram'"
                alt=""
                aria-hidden="true"
                class="top-mining__nav-compact-panel-icon top-mining__nav-compact-panel-icon--image"
                :src="telegramMenuIcon"
              />
              <Icon
                v-else
                class="top-mining__nav-compact-panel-icon"
                aria-hidden="true"
                :name="getCompactNavItemIcon(column, item)"
              />
              <span>{{ item }}</span>
            </a>
          </template>
        </template>
      </div>
    </div>
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
    TOP_MINING_NAV_COLUMNS,
    getCalculatorNavItemIcon,
    isNavHeadingLink,
  } from '~/common/modules/top-mining'
  import type { TopMiningNavColumn } from '~/common/modules/top-mining/nav-columns'
  import telegramMenuIcon from '~/assets/images/top-mining/telegram-menu-icon.png'
  import topStarsIcon from '~/assets/images/top-mining/top-stars-icon.png'

  const emit = defineEmits<{
    'nav-link-click': []
  }>()

  const { visibleCategories: visibleCatalogCategories } = useVisibleCatalogCategories()

  const compactNavColumns = computed(() =>
    TOP_MINING_NAV_COLUMNS.filter((column) => column.slug !== 'consulting'),
  )

  function shouldShowCompactNavDivider(
    column: TopMiningNavColumn,
    itemIndex: number,
  ) {
    return column.slug === 'calculator' && itemIndex === 3
  }

  function getCompactNavItemIcon(column: TopMiningNavColumn, item: string) {
    if (column.slug === 'calculator') {
      return getCalculatorNavItemIcon(item)
    }

    return column.icon
  }
</script>
