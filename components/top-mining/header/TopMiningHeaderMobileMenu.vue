<template>
  <div
    v-if="props.open"
    class="top-mining__mobile-nav"
    aria-label="Мобильное меню"
  >
    <div class="top-mining__mobile-menu-scroll">
      <ul class="top-mining__mobile-menu-list">
        <li
          v-for="column in TOP_MINING_NAV_COLUMNS"
          :key="`mobile-${column.slug}`"
          :class="[
            'top-mining__mobile-menu-item',
            `top-mining__mobile-menu-item--${column.slug}`,
          ]"
        >
          <nuxt-link
            v-if="isNavHeadingLink(column.slug)"
            :to="getTopMiningNavHeadingHref(column.slug)"
            class="top-mining__mobile-menu-section-title"
            @click="emit('nav-link-click')"
          >
            <span>{{ column.title }}</span>
            <img
              class="top-mining__mobile-menu-section-arrow"
              :src="pickaxeIcon"
              alt=""
              aria-hidden="true"
            />
          </nuxt-link>
          <a
            v-else
            href="#"
            class="top-mining__mobile-menu-section-title"
          >
            <span>{{ column.title }}</span>
            <img
              class="top-mining__mobile-menu-section-arrow"
              :src="pickaxeIcon"
              alt=""
              aria-hidden="true"
            />
          </a>

          <div
            :class="[
              'top-mining__mobile-menu-wrap',
              {
                'top-mining__mobile-menu-wrap--single':
                  column.mobileSingleColumn,
                'top-mining__mobile-menu-wrap--phone-columns':
                  props.isPhoneViewport && !column.mobileSingleColumn,
              },
            ]"
          >
            <ul
              v-for="(group, groupIndex) in getMobileMenuLayoutGroups(column)"
              v-show="group.length > 0"
              :key="`${column.slug}-${groupIndex}`"
              :class="[
                props.isPhoneViewport && !column.mobileSingleColumn
                  ? 'top-mining__mobile-menu-column'
                  : 'top-mining__mobile-menu-group',
              ]"
            >
              <li
                v-for="item in group"
                :key="item"
                class="top-mining__mobile-menu-group-item"
              >
                <nuxt-link
                  v-if="column.slug === 'catalog'"
                  :to="getCatalogCategoryHref(getCatalogCategoryIdByLabel(item))"
                  class="top-mining__mobile-menu-link"
                  @click="emit('nav-link-click')"
                >
                  <Icon
                    :name="column.icon"
                    class="top-mining__mobile-menu-link-icon"
                  />
                  <span>{{ item }}</span>
                </nuxt-link>
                <nuxt-link
                  v-else-if="column.slug === 'ratings'"
                  :to="getRatingsPageHref(getRatingsCategoryIdByLabel(item))"
                  class="top-mining__mobile-menu-link"
                  @click="emit('nav-link-click')"
                >
                  <img
                    alt=""
                    class="top-mining__mobile-menu-link-icon top-mining__mobile-menu-link-icon--image"
                    :src="topStarsIcon"
                  />
                  <span>{{ item }}</span>
                </nuxt-link>
                <nuxt-link
                  v-else-if="column.slug === 'articles'"
                  :to="getArticlesNavHref(item)"
                  class="top-mining__mobile-menu-link"
                  @click="emit('nav-link-click')"
                >
                  <Icon
                    :name="column.icon"
                    class="top-mining__mobile-menu-link-icon"
                  />
                  <span>{{ item }}</span>
                </nuxt-link>
                <a
                  v-else
                  href="#"
                  class="top-mining__mobile-menu-link"
                >
                  <img
                    v-if="item === 'Калькулятор в Telegram'"
                    alt=""
                    class="top-mining__mobile-menu-link-icon top-mining__mobile-menu-link-icon--image"
                    :src="telegramMenuIcon"
                  />
                  <img
                    v-else-if="column.slug === 'consulting'"
                    alt=""
                    class="top-mining__mobile-menu-link-icon top-mining__mobile-menu-link-icon--image top-mining__mobile-menu-link-icon--consulting"
                    :src="consultingServiceIcon"
                  />
                  <Icon
                    v-else
                    :name="column.icon"
                    class="top-mining__mobile-menu-link-icon"
                  />
                  <span>{{ item }}</span>
                </a>
              </li>
            </ul>
          </div>

          <button
            v-if="shouldShowPhoneMenuMore(column)"
            type="button"
            class="top-mining__mobile-menu-more"
            @click="emit('toggle-column', column.title)"
          >
            <span>{{ props.navColumnToggleLabels[column.title] }}</span>
            <Icon
              name="mdi:chevron-down"
              :class="[
                'top-mining__mobile-menu-more-icon',
                {
                  'top-mining__mobile-menu-more-icon--open':
                    props.isNavColumnExpanded(column.title),
                },
              ]"
            />
          </button>

          <div
            v-if="column.slug === 'consulting'"
            class="top-mining__mobile-menu-contacts"
          >
            <top-mining-contact-pill-buttons />
          </div>
        </li>
      </ul>
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
    getArticlesNavHref,
  } from '~/common/modules/top-mining/articles-section'
  import {
    TOP_MINING_NAV_COLUMNS,
    getMobileNavItemGroups,
    getMobileNavItemColumns,
    getVisiblePhoneMenuItems,
    hasPhoneMenuMoreItems,
    isNavHeadingLink,
  } from '~/common/modules/top-mining'
  import type { TopMiningNavColumn } from '~/common/modules/top-mining/nav-columns'
  import telegramMenuIcon from '~/assets/images/top-mining/telegram-menu-icon.png'
  import topStarsIcon from '~/assets/images/top-mining/top-stars-icon.png'
  import pickaxeIcon from '~/assets/images/top-mining/pickaxe-icon.png'
  import TopMiningContactPillButtons from '~/components/top-mining/header/TopMiningContactPillButtons.vue'
  import consultingServiceIcon from '~/assets/images/top-mining/consulting-service-icon.png'

  const props = defineProps<{
    open: boolean
    isPhoneViewport: boolean
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

  function getCatalogCategoryIdByLabel(label: string) {
    return visibleCatalogCategories.value.find(
      (category) => category.label === label,
    )?.id ?? ''
  }

  function getMobileMenuItems(column: TopMiningNavColumn) {
    const items = getColumnNavItems(column)

    if (!props.isPhoneViewport) {
      return items
    }

    return getVisiblePhoneMenuItems(
      items,
      column.phoneMenuVisible,
      props.isNavColumnExpanded(column.title),
    )
  }

  function getMobileMenuLayoutGroups(column: TopMiningNavColumn) {
    const items = getMobileMenuItems(column)

    if (props.isPhoneViewport) {
      return getMobileNavItemColumns(items, column.mobileSingleColumn)
    }

    return getMobileNavItemGroups(items, column.mobileSingleColumn)
  }

  function shouldShowPhoneMenuMore(column: TopMiningNavColumn) {
    return (
      props.isPhoneViewport
      && hasPhoneMenuMoreItems(
        getColumnNavItems(column),
        column.phoneMenuVisible,
      )
    )
  }
</script>
