<template>
  <div
    class="top-mining__header-shell"
    :style="headerShellStyle"
  >
    <div
      class="top-mining__consulting-backdrop"
      aria-hidden="true"
    />
    <header
      ref="headerRef"
      :class="[
        'top-mining__header',
        { 'top-mining__header--menu-open': isMobileMenuOpen },
        { 'top-mining__header--tablet-menu': isTabletMenuOpen },
        { 'top-mining__header--mobile-top': isMobileTopState },
        { 'top-mining__header--sticky': isHeaderSticky && !isMobileMenuOpen && !isMobileTopState },
      ]"
    >
      <div class="top-mining__header-inner">
      <NuxtLink to="/" class="top-mining__logo" aria-label="Топ Майнинг" @click="onLogoClick">
        <img
          class="top-mining__logo-mark"
          :src="logoMark" alt=""
        />
        <span class="top-mining__logo-text">
          <strong class="top-mining__logo-title">топ</strong>
          <small class="top-mining__logo-subtitle">майнинг</small>
        </span>
      </NuxtLink>

      <div
        v-if="isMobileTopState"
        class="top-mining__mobile-header-contacts"
      >
        <a
          v-for="social in mobileHeaderSocials"
          :key="social.label"
          :href="social.href"
          class="top-mining__mobile-header-contact-btn"
          :aria-label="social.label"
          target="_blank"
          rel="noopener noreferrer"
        >
          <Icon :name="social.icon" />
        </a>
      </div>

      <button
        v-else
        type="button"
        class="top-mining__menu-toggle"
        :aria-label="mobileMenuToggleAriaLabel"
        :aria-expanded="isMobileMenuOpen"
        @click="isMobileMenuOpen = !isMobileMenuOpen"
      >
        <span />
        <span />
        <span />
      </button>

      <top-mining-brand-title
        v-if="isMobileMenuOpen && isPhoneViewport"
        variant="menu"
        class="top-mining__mobile-menu-title"
      />

      <nav
        class="top-mining__nav top-mining__nav--desktop"
        aria-label="Навигация по разделам"
      >
        <div
          v-for="column in TOP_MINING_NAV_COLUMNS"
          :key="column.title"
          :class="[
            'top-mining__nav-column',
            {
              'top-mining__nav-column--ratings': column.title === 'Рейтинги в майнинге',
              'top-mining__nav-column--consulting': column.title === 'Бизнес-consulting',
            },
          ]"
        >
          <h3 class="top-mining__nav-heading">
            <a href="#" class="top-mining__nav-heading-link">
              <span class="top-mining__nav-heading-text">{{ column.title }}</span>
              <Icon
                name="mdi:arrow-top-right"
                class="top-mining__nav-heading-arrow"
              />
            </a>
          </h3>

          <a
            v-for="(item, itemIndex) in column.items"
            href="#"
            :key="item"
            :class="[
              'top-mining__nav-link',
              {
                'top-mining__nav-link--telegram': item === 'Калькулятор в Telegram',
                'top-mining__nav-link--hidden':
                  itemIndex >= column.mobileVisible && !isNavColumnExpanded(column.title),
              },
            ]"
          >
            <img
              v-if="item === 'Калькулятор в Telegram'"
              alt=""
              class="top-mining__nav-telegram-icon"
              :src="telegramMenuIcon"
            />
            <img
              v-else-if="column.title === 'Рейтинги в майнинге'"
              alt=""
              class="top-mining__nav-top-icon"
              :src="topStarsIcon"
            />
            <img
              v-else-if="column.title === 'Бизнес-consulting'"
              alt=""
              class="top-mining__nav-link-icon top-mining__nav-link-icon--consulting"
              :src="consultingServiceIcon"
            />
            <Icon
              v-else
              :name="column.icon"
              class="top-mining__nav-link-icon"
            />
            <span class="top-mining__nav-link-text">{{ item }}</span>
          </a>

          <button
            v-if="column.items.length > column.mobileVisible"
            type="button"
            class="top-mining__nav-more"
            @click="toggleNavColumn(column.title)"
          >
            <span>
              {{ navColumnToggleLabels[column.title] }}
            </span>
            <Icon
              name="mdi:chevron-down"
              :class="[
                'top-mining__nav-more-icon',
                { 'top-mining__nav-more-icon--open': isNavColumnExpanded(column.title) },
              ]"
            />
          </button>
        </div>

        <div class="top-mining__nav-compact">
          <a
            v-for="column in TOP_MINING_NAV_COLUMNS"
            :key="`compact-${column.title}`"
            href="#"
            class="top-mining__nav-compact-link"
          >
            {{ column.title }}
          </a>
        </div>
      </nav>

      <div
        v-if="isMobileMenuOpen || isMobileTopState"
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
              <a href="#" class="top-mining__mobile-menu-section-title">
                <span>{{ column.title }}</span>
                <svg
                  class="top-mining__mobile-menu-section-arrow"
                  xmlns="http://www.w3.org/2000/svg"
                  viewBox="0 0 24 24"
                  fill="none"
                  aria-hidden="true"
                >
                  <path
                    d="M7.15385 3.00012H21M21 3.00012V16.8463M21 3.00012L7.15385 16.8463L3 21.0001"
                    stroke="currentColor"
                    stroke-width="3"
                  />
                </svg>
              </a>

              <div
                :class="[
                  'top-mining__mobile-menu-wrap',
                  {
                    'top-mining__mobile-menu-wrap--single':
                      column.mobileSingleColumn,
                    'top-mining__mobile-menu-wrap--phone-columns':
                      isPhoneViewport && !column.mobileSingleColumn,
                  },
                ]"
              >
                <ul
                  v-for="(group, groupIndex) in getMobileMenuLayoutGroups(column)"
                  v-show="group.length > 0"
                  :key="`${column.slug}-${groupIndex}`"
                  :class="[
                    isPhoneViewport && !column.mobileSingleColumn
                      ? 'top-mining__mobile-menu-column'
                      : 'top-mining__mobile-menu-group',
                  ]"
                >
                  <li
                    v-for="item in group"
                    :key="item"
                    class="top-mining__mobile-menu-group-item"
                  >
                    <a href="#" class="top-mining__mobile-menu-link">
                      <img
                        v-if="item === 'Калькулятор в Telegram'"
                        alt=""
                        class="top-mining__mobile-menu-link-icon top-mining__mobile-menu-link-icon--image"
                        :src="telegramMenuIcon"
                      />
                      <img
                        v-else-if="column.slug === 'ratings'"
                        alt=""
                        class="top-mining__mobile-menu-link-icon top-mining__mobile-menu-link-icon--image"
                        :src="topStarsIcon"
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
                @click="toggleNavColumn(column.title)"
              >
                <span>{{ navColumnToggleLabels[column.title] }}</span>
                <Icon
                  name="mdi:chevron-down"
                  :class="[
                    'top-mining__mobile-menu-more-icon',
                    {
                      'top-mining__mobile-menu-more-icon--open':
                        isNavColumnExpanded(column.title),
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

      <div class="top-mining__header-actions">
        <div class="top-mining__consulting-wrap">
          <top-mining-button
            class="top-mining-button--consulting"
            href="#"
            variant="primary"
            size="big"
            surface="dark"
            bg-color="var(--orange-color)"
            color="var(--white-color)"
          >
            <span class="top-mining-button__consulting-label">
              Consulting- услуги
            </span>
          </top-mining-button>

          <div
            class="top-mining__consulting-panel"
            role="menu"
            aria-label="Consulting-услуги"
          >
            <a
              v-for="item in TOP_MINING_CONSULTING_DROPDOWN_ITEMS"
              :key="item"
              href="#"
              class="top-mining__consulting-panel-link"
              role="menuitem"
            >
              <img
                alt=""
                aria-hidden="true"
                class="top-mining__consulting-panel-link-icon"
                :src="consultingServiceIcon"
              />
              <span>{{ item }}</span>
            </a>

            <top-mining-contact-pill-buttons
              class="top-mining__consulting-panel-contacts"
            />
          </div>
        </div>
      </div>
      </div>
    </header>
  </div>
</template>

<script setup lang="ts">
  import {
    TOP_MINING_CONSULTING_DROPDOWN_ITEMS,
    TOP_MINING_MOBILE_MENU_SOCIALS,
    TOP_MINING_NAV_COLUMNS,
    getMobileNavItemGroups,
    getMobileNavItemColumns,
    getVisiblePhoneMenuItems,
    hasPhoneMenuMoreItems,
  } from '~/common/modules/top-mining'
  import type { TopMiningNavColumn } from '~/common/modules/top-mining/nav-columns'
  import logoMark from '~/assets/images/top-mining/logo-mark.png'
  import telegramMenuIcon from '~/assets/images/top-mining/telegram-menu-icon.png'
  import topStarsIcon from '~/assets/images/top-mining/top-stars-icon.png'
  import TopMiningContactPillButtons from '~/components/top-mining/TopMiningContactPillButtons.vue'
  import consultingServiceIcon from '~/assets/images/top-mining/consulting-service-icon.png'

  const expandedNavColumns = ref<string[]>([])
  const isMobileMenuOpen = ref(false)
  const isHeaderSticky = ref(false)
  const headerRef = ref<HTMLElement | null>(null)
  const headerShellHeight = ref(0)

  const HEADER_STICKY_OFFSET = 80
  const MOBILE_HEADER_MAX_PLACEHOLDER = 120
  const MOBILE_HEADER_BREAKPOINT = 900
  const PHONE_BREAKPOINT = 560

  const isMobileViewport = ref(false)
  const isPhoneViewport = ref(false)
  let savedScrollY = 0

  const headerShellStyle = computed(() => {
    if (
      !isMobileMenuOpen.value
      && !isMobileTopState.value
      && isHeaderSticky.value
      && headerShellHeight.value > 0
    ) {
      return { minHeight: `${headerShellHeight.value}px` }
    }

    return undefined
  })

  const isMobileTopState = computed(
    () => isPhoneViewport.value && !isHeaderSticky.value && !isMobileMenuOpen.value,
  )

  const isTabletViewport = computed(
    () => isMobileViewport.value && !isPhoneViewport.value,
  )

  const isTabletMenuOpen = computed(
    () => isMobileMenuOpen.value && isTabletViewport.value,
  )

  const mobileHeaderSocials = TOP_MINING_MOBILE_MENU_SOCIALS.filter(
    (social) => social.icon !== 'mdi:phone',
  )

  const mobileMenuToggleAriaLabel = computed(() =>
    isMobileMenuOpen.value ? 'Закрыть меню' : 'Открыть меню',
  )

  const navColumnToggleLabels = computed(() =>
    Object.fromEntries(
      TOP_MINING_NAV_COLUMNS.map((column) => [
        column.title,
        expandedNavColumns.value.includes(column.title) ? 'Скрыть' : 'Смотреть еще',
      ]),
    ),
  )

  watch(isMobileMenuOpen, (isOpen) => {
    if (import.meta.server) {
      return
    }

    document.body.classList.toggle('is-mobile-menu-open', isOpen)

    if (isOpen) {
      savedScrollY = window.scrollY
      document.body.style.position = 'fixed'
      document.body.style.top = `-${savedScrollY}px`
      document.body.style.left = '0'
      document.body.style.right = '0'
      document.body.style.width = '100%'
      return
    }

    document.body.style.position = ''
    document.body.style.top = ''
    document.body.style.left = ''
    document.body.style.right = ''
    document.body.style.width = ''
    expandedNavColumns.value = []
    window.scrollTo(0, savedScrollY)
    syncHeaderStickyState()
    nextTick(updateHeaderShellHeight)
  })

  watch(isMobileTopState, (isActive) => {
    if (!isActive) {
      expandedNavColumns.value = []
    }
  })

  function onLogoClick() {
    isMobileMenuOpen.value = false
  }

  function syncMobileViewport() {
    isMobileViewport.value = window.innerWidth <= MOBILE_HEADER_BREAKPOINT
    isPhoneViewport.value = window.innerWidth <= PHONE_BREAKPOINT
    updateHeaderShellHeight()
  }

  function syncHeaderStickyState() {
    const wasSticky = isHeaderSticky.value

    if (!isMobileMenuOpen.value) {
      isHeaderSticky.value = window.scrollY > HEADER_STICKY_OFFSET
    }

    if (wasSticky !== isHeaderSticky.value) {
      nextTick(updateHeaderShellHeight)
    }
  }

  function updateHeaderShellHeight() {
    if (import.meta.server || !headerRef.value || isMobileMenuOpen.value) {
      return
    }

    const inner = headerRef.value.querySelector('.top-mining__header-inner') as HTMLElement | null
    const isMobile = window.innerWidth <= 900
    let height = isMobile && inner ? inner.offsetHeight : headerRef.value.offsetHeight

    if (isMobile) {
      height = Math.min(height, MOBILE_HEADER_MAX_PLACEHOLDER)
    }

    headerShellHeight.value = height
  }

  onMounted(() => {
    if (import.meta.server) {
      return
    }

    syncMobileViewport()
    syncHeaderStickyState()

    const onScroll = () => {
      syncHeaderStickyState()
    }

    const onResize = () => {
      syncMobileViewport()
      syncHeaderStickyState()
    }

    window.addEventListener('scroll', onScroll, { passive: true })
    window.addEventListener('resize', onResize, { passive: true })

    onBeforeUnmount(() => {
      window.removeEventListener('scroll', onScroll)
      window.removeEventListener('resize', onResize)
      document.body.classList.remove('is-mobile-menu-open')
      document.body.style.position = ''
      document.body.style.top = ''
      document.body.style.left = ''
      document.body.style.right = ''
      document.body.style.width = ''
    })
  })

  function isNavColumnExpanded(title: string) {
    return expandedNavColumns.value.includes(title)
  }

  function toggleNavColumn(title: string) {
    expandedNavColumns.value = isNavColumnExpanded(title)
      ? expandedNavColumns.value.filter((columnTitle) => columnTitle !== title)
      : [...expandedNavColumns.value, title]
  }

  function getMobileMenuItems(column: TopMiningNavColumn) {
    if (!isPhoneViewport.value) {
      return column.items
    }

    return getVisiblePhoneMenuItems(
      column.items,
      column.phoneMenuVisible,
      isNavColumnExpanded(column.title),
    )
  }

  function getMobileMenuLayoutGroups(column: TopMiningNavColumn) {
    const items = getMobileMenuItems(column)

    if (isPhoneViewport.value) {
      return getMobileNavItemColumns(items, column.mobileSingleColumn)
    }

    return getMobileNavItemGroups(items, column.mobileSingleColumn)
  }

  function shouldShowPhoneMenuMore(column: TopMiningNavColumn) {
    return (
      isPhoneViewport.value
      && hasPhoneMenuMoreItems(column.items, column.phoneMenuVisible)
    )
  }
</script>

<style scoped>
  .top-mining {
    background: var(--tm-white);
    color: var(--tm-text-primary);
    font-family:
      'Segoe UI',
      system-ui,
      -apple-system,
      sans-serif;
    overflow: hidden;
  }

  .top-mining__header-shell {
    position: relative;
    z-index: 100;
  }

  .top-mining__consulting-backdrop {
    position: fixed;
    inset: 0;
    z-index: 95;
    opacity: 0;
    visibility: hidden;
    pointer-events: none;
    background: rgba(15, 15, 15, 0.44);
    backdrop-filter: blur(14px);
    -webkit-backdrop-filter: blur(14px);
    transition:
      opacity 0.22s ease,
      visibility 0.22s ease;
  }

  .top-mining__header-shell:has(.top-mining__consulting-wrap:hover) .top-mining__consulting-backdrop,
  .top-mining__header-shell:has(.top-mining__consulting-wrap:focus-within)
    .top-mining__consulting-backdrop {
    opacity: 1;
    visibility: visible;
  }

  .top-mining__consulting-wrap {
    position: relative;
    z-index: 110;
  }

  .top-mining__consulting-panel {
    position: absolute;
    top: calc(100% + 10px);
    right: 0;
    z-index: 120;
    box-sizing: border-box;
    width: max-content;
    min-width: 300px;
    max-width: min(360px, calc(100vw - 32px));
    padding: 18px 20px 16px;
    border-radius: 20px;
    background: var(--tm-white);
    box-shadow: 0 18px 48px rgba(0, 0, 0, 0.18);
    opacity: 0;
    visibility: hidden;
    pointer-events: none;
    transform: translateY(-6px);
    transition:
      opacity 0.2s ease,
      visibility 0.2s ease,
      transform 0.2s ease;
  }

  .top-mining__consulting-panel::before {
    content: '';
    position: absolute;
    top: -12px;
    right: 0;
    left: 0;
    height: 12px;
  }

  .top-mining__consulting-wrap:hover .top-mining__consulting-panel,
  .top-mining__consulting-wrap:focus-within .top-mining__consulting-panel {
    opacity: 1;
    visibility: visible;
    pointer-events: auto;
    transform: translateY(0);
  }

  .top-mining__consulting-panel-link {
    display: flex;
    align-items: flex-start;
    gap: 8px;
    padding: 7px 0;
    color: var(--tm-text-secondary);
    font-size: 13px;
    font-weight: 500;
    line-height: 1.25;
    text-decoration: none;
    transition: color 0.18s ease;
  }

  .top-mining__consulting-panel-link-icon {
    flex: 0 0 auto;
    width: 18px;
    height: 18px;
    margin-top: 1px;
    object-fit: contain;
  }

  @media (hover: hover) {
    .top-mining__consulting-panel-link:hover,
    .top-mining__consulting-panel-link:focus-visible {
      color: var(--tm-orange-hover);
    }
  }

  .top-mining__consulting-panel-contacts {
    margin-top: 12px;
    padding-top: 14px;
    border-top: 1px solid var(--tm-border);
  }

  .top-mining__header-inner {
    display: contents;
  }

  .top-mining__header {
    position: relative;
    z-index: 101;
    display: grid;
    grid-template-columns: 190px 1fr 190px;
    gap: 44px;
    align-items: start;
    margin: 0 auto;
    padding: 34px 68px 34px;
    background: var(--tm-white);
    transition:
      background-color 0.25s ease,
      box-shadow 0.25s ease,
      padding 0.25s ease;
  }

  .top-mining__header--sticky {
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    z-index: 200;
    display: flex;
    justify-content: center;
    align-items: center;
    max-width: none;
    padding: 14px clamp(16px, 3vw, 32px);
    background: transparent;
    box-shadow: none;
  }

  .top-mining__header--sticky .top-mining__header-inner {
    display: grid;
    grid-template-columns: auto minmax(0, 1fr) auto;
    align-items: center;
    gap: clamp(16px, 2.5vw, 36px);
    width: 100%;
    max-width: 1440px;
    min-height: 58px;
    padding: 8px 14px 8px 18px;
    border-radius: 999px;
    background: var(--tm-white);
    box-shadow: 0 8px 28px rgba(0, 0, 0, 0.22);
  }

  .top-mining__header--sticky .top-mining__logo-mark {
    width: 36px;
    height: 36px;
  }

  .top-mining__header--sticky .top-mining__logo-title {
    color: var(--tm-text-primary);
    font-size: clamp(24px, 2.2vw, 30px);
  }

  .top-mining__header--sticky .top-mining__nav-column {
    display: none;
  }

  .top-mining__header--sticky .top-mining__nav {
    display: flex;
    align-items: center;
    justify-content: center;
    grid-template-columns: unset;
  }

  .top-mining__header--sticky .top-mining__mobile-menu-footer {
    display: none;
  }

  .top-mining__header--sticky .top-mining__header-actions {
    align-self: center;
  }

  .top-mining__nav-compact {
    display: none;
    align-items: center;
    justify-content: center;
    flex-wrap: wrap;
    gap: clamp(12px, 2vw, 32px);
  }

  .top-mining__header--sticky .top-mining__nav-compact {
    display: flex;
  }

  .top-mining__nav-compact-link {
    color: var(--tm-black);
    font-size: clamp(12px, 1.05vw, 14px);
    font-weight: 600;
    line-height: 1.2;
    text-decoration: none;
    white-space: nowrap;
    transition: color 0.18s ease;
  }

  @media (hover: hover) {
    .top-mining__nav-compact-link:hover,
    .top-mining__nav-compact-link:focus-visible {
      color: var(--tm-orange-hover);
    }
  }

  .top-mining__header-actions {
    display: flex;
    align-items: center;
    justify-content: flex-end;
    align-self: start;
    overflow: visible;
  }

  .top-mining__header-actions :deep(.top-mining-button--consulting) {
    flex-shrink: 0;
    width: max-content !important;
    min-width: max-content !important;
    max-width: none !important;
    height: 42px !important;
    min-height: 42px !important;
    padding: 0 22px !important;
    border: 0 !important;
    border-radius: 999px !important;
    background: var(--tm-orange) !important;
    box-shadow: none !important;
    font-size: 11px !important;
    font-weight: 800 !important;
    line-height: 1 !important;
    letter-spacing: 0.02em !important;
    white-space: nowrap !important;
    justify-content: center !important;
  }

  .top-mining__header-actions :deep(.top-mining-button--consulting .top-mining-button__inner) {
    flex: 0 0 auto;
    justify-content: center;
  }

  .top-mining__header-actions :deep(.top-mining-button--consulting .top-mining-button__inner span),
  .top-mining__header-actions :deep(.top-mining-button--consulting .top-mining-button__inner div) {
    justify-content: center;
    text-align: center;
  }

  .top-mining__header-actions :deep(.top-mining-button__inner) {
    justify-content: center;
  }

  .top-mining__header-actions :deep(.top-mining-button__consulting-label) {
    display: inline-block;
    line-height: 1;
    text-align: center;
    text-transform: uppercase;
    white-space: nowrap;
  }

  .top-mining__header-actions :deep(.top-mining-button--consulting:hover),
  .top-mining__header-actions :deep(.top-mining-button--consulting:focus-visible) {
    background: var(--tm-orange-dark) !important;
    border-color: var(--tm-orange-dark) !important;
    color: var(--tm-white) !important;
  }

  @media (hover: hover) {
    .top-mining__consulting-wrap:hover :deep(.top-mining-button--consulting),
    .top-mining__consulting-wrap:focus-within :deep(.top-mining-button--consulting) {
      background: var(--tm-white) !important;
      border: 1px solid var(--tm-orange) !important;
      color: var(--tm-orange) !important;
      box-shadow: none !important;
    }

    .top-mining__consulting-wrap:hover :deep(.top-mining-button--consulting .top-mining-button__inner),
    .top-mining__consulting-wrap:hover :deep(.top-mining-button--consulting .top-mining-button__label),
    .top-mining__consulting-wrap:focus-within :deep(.top-mining-button--consulting .top-mining-button__inner),
    .top-mining__consulting-wrap:focus-within :deep(.top-mining-button--consulting .top-mining-button__label) {
      color: var(--tm-orange) !important;
    }
  }

  .top-mining__logo {
    display: inline-flex;
    align-items: center;
    gap: 11px;
    color: var(--tm-text-primary);
    text-decoration: none;
  }

  .top-mining__logo-mark {
    width: 42px;
    height: 42px;
    object-fit: contain;
  }

  .top-mining__logo-text {
    display: grid;
    line-height: 0.85;
    text-transform: uppercase;
  }

  .top-mining__logo-title {
    color: var(--tm-text-primary);
    font-size: 36px;
    font-weight: 900;
    letter-spacing: -0.05em;
  }

  .top-mining__logo-subtitle {
    color: var(--tm-orange-dark);
    font-size: 14px;
    font-weight: 900;
    letter-spacing: -0.03em;
  }

  .top-mining__menu-toggle,
  .top-mining__mobile-menu-title,
  .top-mining__mobile-telegram,
  .top-mining__mobile-header-contacts {
    display: none;
  }

  .top-mining__mobile-menu-footer {
    display: none;
  }

  .top-mining__nav {
    display: grid;
    grid-template-columns: 1.25fr 1.1fr 1fr 0.95fr;
    gap: 44px;
  }

  .top-mining__nav-heading {
    margin: 0 0 14px;
    color: var(--tm-text-primary);
    font-size: 15px;
    font-weight: 800;
  }

  .top-mining__nav-heading-link {
    display: block;
    color: inherit;
    text-decoration: none;
  }

  .top-mining__nav-heading-arrow {
    display: none;
  }

  .top-mining__nav-link-icon--consulting {
    width: 18px;
    height: 18px;
    object-fit: contain;
  }

  .top-mining__mobile-menu-contacts {
    display: none;
  }

  .top-mining__nav-link {
    display: flex;
    align-items: flex-start;
    gap: 7px;
    margin-bottom: 8px;
    color: var(--tm-text-muted);
    font-size: 13px;
    font-weight: 500;
    line-height: 1.15;
    text-decoration: none;
    transition: color 0.18s ease;
  }

  .top-mining__nav-link-icon,
  .top-mining__nav-column svg {
    flex: 0 0 auto;
    width: 17px;
    height: 17px;
    color: var(--tm-text-subtle);
    transition: color 0.18s ease;
  }

  @media (hover: hover) {
    .top-mining__nav-link:hover,
    .top-mining__nav-link:focus-visible {
      color: var(--tm-orange-hover);
    }

    .top-mining__nav-link:hover :is(svg, .top-mining__nav-link-icon),
    .top-mining__nav-link:focus-visible :is(svg, .top-mining__nav-link-icon) {
      color: var(--tm-orange-hover);
    }
  }

  .top-mining__nav-link:active {
    color: var(--tm-orange-hover);
  }

  .top-mining__nav-link:active :is(svg, .top-mining__nav-link-icon) {
    color: var(--tm-orange-hover);
  }

  .top-mining__nav-telegram-icon {
    flex: 0 0 auto;
    width: 17px;
    height: 17px;
    object-fit: contain;
  }

  .top-mining__nav-top-icon {
    flex: 0 0 auto;
    width: 22px;
    height: 22px;
    object-fit: contain;
  }

  .top-mining__nav-link--telegram {
    margin-top: 16px;
    padding-top: 16px;
    border-top: 1px solid var(--tm-border-dark);
  }

  .top-mining__nav-link--telegram svg {
    color: var(--tm-text-primary);
  }

  .top-mining__nav-more {
    display: none !important;
  }

  .top-mining__card .top-mining-button {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    gap: 8px;
    min-height: 0;
    padding: 0 28px;
    border-radius: 999px;
    background: linear-gradient(180deg, var(--tm-orange-gradient-start), var(--tm-orange-dark));
    color: var(--tm-white);
    font-size: 13px;
    font-weight: 800;
    line-height: 1;
    text-decoration: none;
    text-transform: uppercase;
    box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.3);
  }

  .top-mining-button--contact {
    justify-self: end;
    min-width: 174px;
    height: 38px;
    padding: 0 22px;
  }

  .top-mining-button--contact:hover,
  .top-mining-button--contact:focus-visible {
    background: transparent !important;
    border-color: var(--tm-orange-hover) !important;
    color: var(--tm-black) !important;
  }

  .top-mining__card .top-mining-button :deep(.top-mining-button__inner),
  .top-mining__card .top-mining-button :deep(.top-mining-button__inner span),
  .top-mining__card .top-mining-button :deep(.top-mining-button__inner div) {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    padding: 0;
    color: inherit !important;
    line-height: 1 !important;
    text-align: center !important;
  }

  .top-mining__hero {
    position: relative;
    width: 100%;
    overflow: hidden;
  }

  .top-mining__dark {
    position: relative;
    z-index: 2;
    margin: 0 auto;
    padding: 52px 0 76px;
    border-radius: 40px 40px 0 0;
    background: var(--tm-black);
  }

  .top-mining__cards {
    display: grid;
    grid-template-columns: repeat(2, minmax(0, 1fr));
    gap: 18px;
    width: calc(100% - 64px);
    margin: 0 auto;
  }

  .top-mining__card {
    position: relative;
    min-height: 170px;
    border-radius: 22px;
    background: #222222;
    color: var(--tm-white);
    overflow: hidden;
  }

  .top-mining__card--catalog,
  .top-mining__card--calculator {
    min-height: 310px;
  }

  .top-mining__card--rating,
  .top-mining__card--telegram {
    min-height: 180px;
  }

  .top-mining__card::before {
    content: '';
    position: absolute;
    inset: 0;
    background: radial-gradient(circle at 8% 90%, rgba(255, 105, 24, 0.35), transparent 22%);
    opacity: 0;
  }

  .top-mining__card--rating::before,
  .top-mining__card--telegram::before {
    opacity: 1;
  }

  .top-mining__card--telegram::before {
    opacity: 0;
  }

  .top-mining__card-content {
    position: relative;
    z-index: 2;
    height: 100%;
    padding: 30px 28px;
  }

  .top-mining__card-title {
    display: flex;
    align-items: center;
    gap: 10px;
    margin: 0 0 28px;
    color: var(--tm-white);
    font-size: 29px;
    font-weight: 800;
    letter-spacing: -0.03em;
    line-height: 1;
    text-transform: uppercase;
  }

  .top-mining__card-title-arrow {
    width: 21px;
    height: 21px;
    object-fit: contain;
  }

  .top-mining__card-text {
    max-width: 360px;
    margin: 0 0 1px;
    color: #ededed;
    font-size: 16px;
    line-height: 1.28;
  }

  .top-mining__card-text--calculator {
    position: absolute;
    left: 28px;
    bottom: 30px;
    max-width: calc(100% - 260px);
    font-size: 15px;
    margin: 0;
  }

  .top-mining__card-text--telegram {
    position: absolute;
    left: 28px;
    bottom: 46px;
    max-width: calc(100% - 300px);
    font-size: 14px;
    margin: 0;
  }

  .top-mining__card-reviews strong,
  .top-mining__card-stats strong {
    color: #f26718;
  }

  .top-mining__card-reviews {
    font-size: 17px !important;
    margin-top: 0 !important;
    margin-bottom: 20px !important;
    line-height: 1.15 !important;
  }

  .top-mining__card-reviews strong {
    font-size: 34px;
    font-weight: 900;
    letter-spacing: -0.03em;
  }

  .top-mining__card-companies {
    display: grid;
    grid-template-columns: repeat(6, 1fr);
    gap: 10px;
    margin: 0 0 34px;
  }

  .top-mining__card-companies span {
    display: grid;
    gap: 1px;
    min-height: 58px;
    padding: 8px 9px;
    border-radius: 8px;
    background: var(--tm-white);
    color: var(--tm-shadow);
    font-size: 10px;
    line-height: 1.1;
  }

  .top-mining__card-companies b {
    display: flex;
    align-items: center;
    overflow: hidden;
    color: #4a4a4a;
    font-size: 11px;
    text-overflow: ellipsis;
    white-space: nowrap;
  }

  .top-mining__card-companies b img {
    width: 100%;
    height: 16px;
    object-fit: contain;
    object-position: left center;
  }

  .top-mining__card-companies small {
    display: inline-flex;
    align-items: center;
    gap: 3px;
    color: #444444;
    font-size: 10px;
  }

  .top-mining__card-companies small img {
    width: 12px;
    height: auto;
    object-fit: contain;
  }

  .top-mining__card .top-mining-button {
    display: flex;
    align-items: center;
    justify-content: center;
    min-width: 280px;
    height: 48px;
    padding: 0 28px;
    font-size: 13px;
    line-height: 1;
    text-align: center;
    color: var(--tm-white) !important;
  }

  .top-mining__card .top-mining-button svg {
    width: 14px;
    height: 14px;
  }

  .top-mining__card .top-mining-button img {
    width: 19px;
    height: 19px;
    margin: 0 !important;
    object-fit: contain;
  }

  .top-mining__card .top-mining-button img:first-child {
    width: 24px;
    height: 24px;
  }

  .top-mining-button--right {
    position: absolute;
    right: 28px;
    bottom: 24px;
    min-width: 150px;
    height: 42px;
    padding: 0 18px;
    font-size: 11px;
  }

  .top-mining__card--calculator .top-mining-button--right {
    right: 28px;
    bottom: 24px;
    min-width: 170px;
    height: 48px;
    font-size: 13px;
  }

  .top-mining__card--rating p {
    max-width: calc(100% - 250px);
  }

  .top-mining__card--rating .top-mining-button--right,
  .top-mining__card--telegram .top-mining-button--right {
    right: 24px;
    bottom: 30px;
    width: 148px !important;
    min-width: 148px;
    height: 40px;
    padding: 0 14px;
    font-size: 10px;
  }

  .top-mining__card--telegram .top-mining-button--right {
    bottom: 36px;
  }

  .top-mining__card-stats {
    display: flex;
    gap: 44px;
    margin: 8px 0 72px;
  }

  .top-mining__card-stats span {
    display: grid;
    gap: 3px;
    color: #e9e9e9;
    font-size: 16px;
    line-height: 1;
  }

  .top-mining__card-stats strong {
    color: #f26718;
    font-size: 36px;
    font-weight: 900;
    letter-spacing: -0.04em;
  }

  .top-mining__card-image,
  .top-mining__card-decor {
    position: absolute;
    pointer-events: none;
    user-select: none;
  }

  .top-mining__card-image {
    right: 50px;
    top: 70px;
    z-index: 1;
    object-fit: contain;
  }

  .top-mining__card-image--rig-large {
    right: clamp(28px, 4vw, 70px);
    top: clamp(58px, 5vw, 70px);
    width: clamp(240px, 19vw, 360px);
    height: auto;
  }

  .top-mining__card-image--rig-small {
    right: clamp(245px, 23vw, 360px);
    bottom: -38px;
    width: clamp(145px, 11vw, 200px);
    height: auto;
    opacity: 0.9;
  }

  .top-mining__card-decor--blur-left {
    left: -12px;
    bottom: -18px;
    width: 172px;
    height: auto;
  }

  .top-mining__card-decor--blur-right {
    right: clamp(12px, 2vw, 28px);
    top: -30px;
    width: clamp(130px, 10vw, 184px);
    height: auto;
  }

  .top-mining__card-decor--paper-large {
    right: 0;
    top: -14px;
    width: clamp(92px, 7vw, 126px);
    height: auto;
  }

  .top-mining__card-decor--paper-small {
    right: clamp(178px, 18vw, 210px);
    bottom: -22px;
    height: 80px;
    opacity: 0.65;
  }

  @media (max-width: 1200px) {
    .top-mining__header {
      grid-template-columns: 170px minmax(0, 1fr) 160px;
      gap: 24px;
      padding: 34px 32px 28px;
    }

    .top-mining__logo {
      gap: 9px;
    }

    .top-mining__logo-mark {
      width: 36px;
      height: 36px;
    }

    .top-mining__logo-title {
      font-size: 30px;
    }

    .top-mining__logo-subtitle {
      font-size: 12px;
    }

    .top-mining__nav {
      grid-template-columns: 1.1fr 1fr 0.92fr 0.9fr;
      gap: 24px;
      min-width: 0;
    }

    .top-mining__nav-heading {
      margin-bottom: 12px;
      font-size: 14px;
    }

    .top-mining__nav-link {
      gap: 6px;
      margin-bottom: 7px;
      font-size: 12px;
      line-height: 1.15;
    }

    .top-mining__nav-link-icon,
    .top-mining__nav-column svg,
    .top-mining__nav-telegram-icon {
      width: 15px;
      height: 15px;
    }

    .top-mining__nav-top-icon {
      width: 20px;
      height: 20px;
    }

    .top-mining-button--contact {
      width: 160px !important;
      min-width: 160px;
      height: 38px;
      padding: 0 16px;
      font-size: 11px;
    }

    .top-mining__card-image--rig-large {
      right: 28px;
      top: 70px;
      width: 230px;
    }

    .top-mining__card-image--rig-small {
      right: 245px;
      bottom: -34px;
      top: 115px;
      width: 140px;
    }

    .top-mining__card-decor--paper-small {
      right: 170px;
      bottom: -22px;
      width: 52px;
    }

    .top-mining__card-decor--paper-large {
      width: 88px;
    }
  }

  @media (max-width: 900px) {
    .top-mining__consulting-backdrop,
    .top-mining__consulting-panel {
      display: none !important;
    }

    .top-mining__header-shell {
      width: 100%;
      background: transparent;
    }

    .top-mining__header-shell:has(.top-mining__header--sticky:not(.top-mining__header--menu-open)) {
      background: transparent;
    }

    .top-mining__header-shell:has(.top-mining__header--menu-open) {
      background: var(--tm-white);
    }

    .top-mining__header {
      position: relative;
      z-index: 20;
      display: flex;
      justify-content: center;
      align-items: center;
      width: 100%;
      padding: 0 12px;
      background: transparent;
      box-sizing: border-box;
    }

    .top-mining__header-inner {
      display: grid;
      grid-template-columns: minmax(0, 1fr) auto;
      grid-template-areas: 'logo menu';
      align-items: center;
      gap: 12px;
      width: 100%;
      min-height: 56px;
      padding: 12px 16px;
      border-radius: 0 0 22px 22px;
      background: var(--tm-white);
      box-shadow: 0 4px 16px rgba(0, 0, 0, 0.08);
      box-sizing: border-box;
    }

    .top-mining__logo {
      grid-area: logo;
      min-width: 0;
    }

    .top-mining__logo-mark {
      width: 38px;
      height: 38px;
    }

    .top-mining__logo-title {
      font-size: 30px;
    }

    .top-mining__menu-toggle {
      grid-area: menu;
      position: relative;
      z-index: 2;
      display: grid;
      flex-shrink: 0;
      gap: 5px;
      width: 32px;
      height: 32px;
      margin-right: 0;
      padding: 0;
      border: 0;
      background: transparent;
      cursor: pointer;
      justify-self: end;
      align-self: center;
    }

    .top-mining__menu-toggle span {
      display: block;
      width: 28px;
      height: 2px;
      background: var(--tm-black);
      transition:
        transform 0.2s ease,
        opacity 0.2s ease;
    }

    .top-mining__header--mobile-top {
      position: relative;
      z-index: 20;
      display: block;
      width: 100%;
      padding: 0;
      background: var(--tm-white);
    }

    .top-mining__header--mobile-top .top-mining__header-inner {
      display: grid;
      grid-template-columns: minmax(0, 1fr) auto;
      grid-template-areas:
        'logo contacts'
        'nav nav';
      align-items: center;
      gap: 0;
      width: 100%;
      min-height: 0;
      padding: 14px 18px 18px;
      border-radius: 0;
      background: var(--tm-white);
      box-shadow: none;
    }

    .top-mining__header--mobile-top .top-mining__logo {
      grid-area: logo;
      align-self: center;
    }

    .top-mining__mobile-header-contacts {
      grid-area: contacts;
      display: flex;
      align-items: center;
      justify-content: flex-end;
      gap: 10px;
    }

    .top-mining__mobile-header-contact-btn {
      display: inline-flex;
      align-items: center;
      justify-content: center;
      width: 40px;
      height: 40px;
      border-radius: 50%;
      background: var(--tm-orange-hover);
      color: var(--tm-white);
      text-decoration: none;
    }

    .top-mining__mobile-header-contact-btn :deep(svg) {
      width: 16px;
      height: 16px;
    }

    .top-mining__header--mobile-top .top-mining__mobile-nav {
      display: block !important;
      grid-area: nav;
      width: 100%;
      margin: 16px 0 0;
      padding: 0;
      border-top: none;
      border-radius: 0;
      overflow: visible;
    }

    .top-mining__header--mobile-top .top-mining__mobile-menu-scroll {
      overflow: visible;
    }

    .top-mining__header--mobile-top .top-mining__mobile-menu-list {
      display: flex;
      flex-direction: column;
      gap: 18px;
      height: auto;
      justify-content: flex-start;
    }

    .top-mining__header--mobile-top .top-mining__mobile-menu-contacts {
      margin-top: 10px;
    }

    .top-mining__header--mobile-top .top-mining__mobile-menu-more {
      display: inline-flex;
      align-items: center;
      gap: 6px;
      margin: 8px 0 0;
      padding: 0;
      border: 0;
      background: transparent;
      color: var(--tm-text-secondary);
      font-family: inherit;
      font-size: 12px;
      font-weight: 600;
      line-height: 1.2;
      letter-spacing: 0.02em;
      text-transform: uppercase;
      cursor: pointer;
    }

    .top-mining__mobile-menu-more-icon {
      width: 16px;
      height: 16px;
      transition: transform 0.2s ease;
    }

    .top-mining__mobile-menu-more-icon--open {
      transform: rotate(180deg);
    }

    .top-mining__mobile-menu-title,
    .top-mining__mobile-nav,
    .top-mining__header-actions,
    .top-mining__nav-compact,
    .top-mining__nav--desktop {
      display: none !important;
    }

    .top-mining__header--sticky {
      position: fixed;
      top: 0;
      left: 0;
      right: 0;
      z-index: 200;
      display: flex;
      justify-content: center;
      padding: 0 12px;
      background: transparent;
      box-shadow: none;
    }

    .top-mining__header--sticky .top-mining__header-inner {
      display: grid !important;
      grid-template-columns: minmax(0, 1fr) auto !important;
      grid-template-areas: 'logo menu' !important;
      align-items: center;
      gap: 12px;
      width: 100%;
      max-width: none;
      min-height: 56px;
      padding: 12px 16px;
      border-radius: 0 0 22px 22px;
      background: var(--tm-white);
      box-shadow: 0 4px 16px rgba(0, 0, 0, 0.08);
    }

    .top-mining__header--sticky .top-mining__nav,
    .top-mining__header--sticky .top-mining__nav--desktop,
    .top-mining__header--sticky .top-mining__nav-compact,
    .top-mining__header--sticky .top-mining__header-actions,
    .top-mining__header--sticky .top-mining__mobile-menu-title,
    .top-mining__header--sticky .top-mining__mobile-nav,
    .top-mining__header--sticky .top-mining__nav-column {
      display: none !important;
    }

    .top-mining-button--contact {
      display: none;
    }

    .top-mining__header--menu-open {
      position: fixed;
      inset: 0;
      z-index: 300;
      display: flex;
      flex-direction: column;
      width: 100%;
      height: 100dvh;
      max-height: 100dvh;
      margin: 0;
      padding: 14px 18px 18px;
      border-radius: 0;
      background: var(--tm-white);
      overflow: hidden;
      overscroll-behavior: none;
      box-shadow: none;
      animation: top-mining-menu-in 0.26s ease both;
    }

    .top-mining__header--menu-open .top-mining__header-inner {
      display: flex;
      flex-direction: column;
      flex: 1 1 auto;
      position: relative;
      width: 100%;
      height: 100%;
      min-height: 0;
      max-height: 100%;
      padding: 0;
      border-radius: 0;
      background: transparent;
      box-shadow: none;
    }

    .top-mining__header--menu-open .top-mining__logo {
      position: sticky;
      top: 0;
      z-index: 3;
      align-self: flex-start;
      width: auto;
      flex-shrink: 0;
      padding-bottom: 8px;
      background: var(--tm-white);
    }

    .top-mining__header--menu-open .top-mining__logo-mark {
      width: 28px;
      height: 28px;
    }

    .top-mining__header--menu-open .top-mining__logo-title {
      font-size: 22px;
    }

    .top-mining__header--menu-open .top-mining__logo-subtitle {
      font-size: 9px;
    }

    .top-mining__header--menu-open .top-mining__menu-toggle {
      position: fixed;
      top: 14px;
      right: 16px;
      z-index: 400;
      width: 26px;
      height: 26px;
      gap: 0;
    }

    .top-mining__header--menu-open .top-mining__menu-toggle span {
      position: absolute;
      top: 12px;
      left: 0;
      width: 26px;
      height: 2px;
      background: var(--tm-black);
    }

    .top-mining__header--menu-open .top-mining__menu-toggle span:first-child {
      transform: rotate(45deg);
    }

    .top-mining__header--menu-open .top-mining__menu-toggle span:nth-child(2) {
      opacity: 0;
    }

    .top-mining__header--menu-open .top-mining__menu-toggle span:last-child {
      transform: rotate(-45deg);
    }

    .top-mining__header--menu-open :deep(.top-mining__mobile-menu-title) {
      display: block !important;
      width: 100%;
      margin: 22px 0 0;
      padding: 0;
      margin-block-end: 0;
      opacity: 1;
      transform: none;
      pointer-events: auto;
      flex-shrink: 0;
    }

    .top-mining__header--menu-open .top-mining__mobile-nav {
      display: flex !important;
      flex-direction: column;
      flex: 1 1 auto;
      min-height: 0;
      width: calc(100% + 36px);
      margin: 0 -18px;
      padding: 14px 18px 0;
      border-top: 1px solid var(--tm-black);
      border-radius: 22px 22px 0 0;
      background: var(--tm-white);
      overflow: hidden;
      box-sizing: border-box;
    }

    .top-mining__mobile-menu-scroll {
      display: flex;
      flex: 1 1 auto;
      flex-direction: column;
      min-height: 0;
      overflow-x: hidden;
      overflow-y: auto;
      -webkit-overflow-scrolling: touch;
      overscroll-behavior: contain;
    }

    .top-mining__mobile-menu-list {
      display: flex;
      flex: 1 1 auto;
      flex-direction: column;
      justify-content: space-between;
      height: 100%;
      margin: 0;
      padding: 0;
      list-style: none;
    }

    .top-mining__mobile-menu-item {
      flex-shrink: 1;
    }

    .top-mining__mobile-menu-section-title {
      display: flex;
      align-items: center;
      justify-content: space-between;
      gap: 12px;
      margin: 0 0 6px;
      color: #141414;
      font-size: 14px;
      font-weight: 700;
      line-height: 1.15;
      letter-spacing: -0.02em;
      text-decoration: none;
      text-transform: uppercase;
    }

    .top-mining__mobile-menu-section-arrow {
      flex-shrink: 0;
      width: 14px;
      height: 14px;
      color: #141414;
    }

    .top-mining__mobile-menu-wrap {
      display: grid;
      grid-template-columns: repeat(2, minmax(0, 1fr));
      column-gap: 20px;
      row-gap: 2px;
      align-items: start;
    }

    .top-mining__mobile-menu-wrap--phone-columns {
      display: flex;
      align-items: flex-start;
      gap: 20px;
    }

    .top-mining__mobile-menu-wrap--single {
      display: block;
    }

    .top-mining__mobile-menu-column {
      display: flex;
      flex: 1 1 0;
      flex-direction: column;
      gap: 2px;
      min-width: 0;
      margin: 0;
      padding: 0;
      list-style: none;
    }

    .top-mining__mobile-menu-group {
      display: contents;
      margin: 0;
      padding: 0;
      list-style: none;
    }

    .top-mining__mobile-menu-group-item {
      margin: 0;
      min-width: 0;
    }

    .top-mining__mobile-menu-item--consulting .top-mining__mobile-menu-wrap,
    .top-mining__mobile-menu-wrap--single {
      display: block;
    }

    .top-mining__mobile-menu-item--consulting .top-mining__mobile-menu-column,
    .top-mining__mobile-menu-wrap--single .top-mining__mobile-menu-column {
      flex: none;
      width: 100%;
    }

    .top-mining__mobile-menu-link {
      display: flex;
      align-items: flex-start;
      gap: 7px;
      margin: 0;
      padding: 2px 0;
      color: var(--tm-text-secondary);
      font-size: 13px;
      font-weight: 500;
      line-height: 1.2;
      letter-spacing: -0.01em;
      text-decoration: none;
    }

    .top-mining__mobile-menu-link span {
      min-width: 0;
    }

    .top-mining__mobile-menu-link-icon {
      flex-shrink: 0;
      width: 16px;
      height: 16px;
      color: var(--tm-text-subtle);
    }

    .top-mining__mobile-menu-link-icon--image {
      width: 17px;
      height: 17px;
      object-fit: contain;
    }

    .top-mining__mobile-menu-link-icon--consulting {
      width: 17px;
      height: 17px;
      object-fit: contain;
    }

    .top-mining__mobile-menu-more {
      display: none;
    }

    .top-mining__mobile-menu-contacts {
      display: block;
      margin-top: 12px;
      width: 100%;
    }

    @media (hover: hover) {
      .top-mining__header--menu-open .top-mining__mobile-menu-link:hover,
      .top-mining__header--menu-open .top-mining__mobile-menu-link:focus-visible {
        color: var(--tm-orange-hover);
      }
    }

    .top-mining__cards {
      grid-template-columns: 1fr;
      width: calc(100% - 32px);
    }

    .top-mining__card--calculator {
      min-height: 240px;
    }

    .top-mining__card--calculator .top-mining__card-content {
      padding: 26px 28px;
    }

    .top-mining__card--calculator .top-mining__card-title {
      margin-bottom: 22px;
    }

    .top-mining__card--calculator .top-mining__card-stats {
      margin: 0 0 34px;
    }

    .top-mining__card--calculator .top-mining__card-text--calculator {
      bottom: 28px;
    }

    .top-mining__card--calculator .top-mining-button--right {
      bottom: 26px;
    }

    @keyframes top-mining-menu-in {
      from {
        opacity: 0;
        transform: translateY(-16px) scale(0.98);
      }

      to {
        opacity: 1;
        transform: translateY(0) scale(1);
      }
    }

    @keyframes top-mining-menu-content-in {
      from {
        opacity: 0;
        transform: translateY(-8px);
      }

      to {
        opacity: 1;
        transform: translateY(0);
      }
    }

    .top-mining__header-shell:has(.top-mining__header--tablet-menu) {
      background: transparent;
    }

    .top-mining__header--menu-open.top-mining__header--tablet-menu {
      inset: 0;
      display: flex;
      flex-direction: column;
      align-items: stretch;
      width: 100%;
      height: 100dvh;
      max-height: 100dvh;
      padding: 12px 16px 18px;
      background: rgba(0, 0, 0, 0.58);
      backdrop-filter: blur(8px);
      -webkit-backdrop-filter: blur(8px);
      overflow-x: hidden;
      overflow-y: auto;
      overscroll-behavior: contain;
      box-shadow: none;
    }

    .top-mining__header--tablet-menu .top-mining__header-inner {
      display: grid;
      grid-template-columns: minmax(0, 1fr) auto;
      grid-template-rows: auto auto;
      grid-template-areas:
        'logo toggle'
        'nav nav';
      gap: 10px;
      align-content: start;
      width: 100%;
      height: auto;
      min-height: 0;
      max-height: none;
      padding: 0;
      background: transparent;
      box-shadow: none;
    }

    .top-mining__header--tablet-menu .top-mining__header-inner::before {
      content: '';
      grid-column: 1 / -1;
      grid-row: 1;
      z-index: 0;
      min-height: 58px;
      border-radius: 999px;
      background: var(--tm-white);
      box-shadow: 0 8px 28px rgba(0, 0, 0, 0.18);
    }

    .top-mining__header--tablet-menu .top-mining__nav--desktop,
    .top-mining__header--tablet-menu .top-mining__header-actions {
      display: none !important;
    }

    .top-mining__header--tablet-menu .top-mining__logo {
      position: relative;
      z-index: 1;
      grid-area: logo;
      grid-row: 1;
      align-self: center;
      margin: 0;
      padding: 10px 0 10px 20px;
      background: transparent;
    }

    .top-mining__header--tablet-menu .top-mining__logo-mark {
      width: 34px;
      height: 34px;
    }

    .top-mining__header--tablet-menu .top-mining__logo-title {
      font-size: 28px;
    }

    .top-mining__header--tablet-menu .top-mining__logo-subtitle {
      font-size: 11px;
    }

    .top-mining__header--tablet-menu .top-mining__menu-toggle {
      position: relative;
      top: auto;
      right: auto;
      z-index: 1;
      grid-area: toggle;
      grid-row: 1;
      justify-self: end;
      align-self: center;
      width: 50px;
      height: 30px;
      margin: 0;
      padding: 10px 20px 10px 0;
    }

    .top-mining__header--tablet-menu .top-mining__menu-toggle span {
      top: 14px;
      width: 30px;
    }

    .top-mining__header--tablet-menu .top-mining__mobile-nav {
      display: block !important;
      grid-area: nav;
      flex: none;
      width: 100%;
      min-height: 0;
      max-height: calc(100dvh - 96px);
      margin: 0;
      padding: 24px 28px 28px;
      border: 0;
      border-radius: 28px;
      background: var(--tm-surface-light);
      overflow-x: hidden;
      overflow-y: auto;
      box-sizing: border-box;
    }

    .top-mining__header--tablet-menu .top-mining__mobile-menu-scroll {
      flex: none;
      min-height: 0;
      overflow: visible;
    }

    .top-mining__header--tablet-menu .top-mining__mobile-menu-list {
      display: flex;
      flex-direction: column;
      gap: 4px;
      height: auto;
      justify-content: flex-start;
    }

    .top-mining__header--tablet-menu .top-mining__mobile-menu-item {
      padding: 12px 0 14px;
      border-bottom: 1px solid #d9d9d9;
    }

    .top-mining__header--tablet-menu .top-mining__mobile-menu-item:last-child {
      padding-bottom: 0;
      border-bottom: 0;
    }

    .top-mining__header--tablet-menu .top-mining__mobile-menu-section-title {
      margin: 0 0 10px;
      padding-bottom: 10px;
      border-bottom: 1px solid #d4d4d4;
      color: var(--tm-black);
      font-family: 'Unbounded', 'Segoe UI', system-ui, sans-serif;
      font-size: clamp(18px, 2.6vw, 24px);
      font-weight: 700;
      line-height: 1;
      letter-spacing: -0.05em;
    }

    .top-mining__header--tablet-menu .top-mining__mobile-menu-section-arrow {
      width: 16px;
      height: 16px;
    }

    .top-mining__header--tablet-menu .top-mining__mobile-menu-wrap {
      grid-template-columns: repeat(4, minmax(0, 1fr));
      column-gap: 24px;
      row-gap: 8px;
    }

    .top-mining__header--tablet-menu .top-mining__mobile-menu-item--ratings .top-mining__mobile-menu-wrap,
    .top-mining__header--tablet-menu .top-mining__mobile-menu-item--articles .top-mining__mobile-menu-wrap {
      grid-template-columns: repeat(4, minmax(0, 1fr));
    }

    .top-mining__header--tablet-menu .top-mining__mobile-menu-item--calculator .top-mining__mobile-menu-wrap {
      grid-template-columns: repeat(3, minmax(0, 1fr));
    }

    .top-mining__header--tablet-menu .top-mining__mobile-menu-item--consulting .top-mining__mobile-menu-wrap {
      grid-template-columns: repeat(2, minmax(0, 1fr));
      row-gap: 8px;
    }

    .top-mining__header--tablet-menu .top-mining__mobile-menu-link {
      gap: 8px;
      font-size: 14px;
      line-height: 1.24;
    }

    .top-mining__header--tablet-menu .top-mining__mobile-menu-contacts {
      margin-top: 14px;
    }
  }

  @media (max-width: 560px) {
    .top-mining {
      --mobile-frame-width: 100%;
      background: var(--tm-white);
    }

    .top-mining__header {
      width: 100%;
      min-height: auto;
      margin: 0;
      border-radius: 0;
      background: transparent;
    }

    .top-mining__header--sticky {
      background: transparent;
    }

    .top-mining__header-inner {
      min-height: 52px;
      padding: 10px 14px;
      border-radius: 0 0 22px 22px;
      box-shadow: 0 4px 16px rgba(0, 0, 0, 0.08);
    }

    .top-mining__header--sticky .top-mining__header-inner {
      border-radius: 0 0 22px 22px;
    }

    .top-mining__header--menu-open {
      padding: 10px 16px 10px;
      background: var(--tm-white);
    }

    .top-mining__header-shell:has(.top-mining__header--menu-open) {
      background: var(--tm-white);
    }

    .top-mining__header--menu-open .top-mining__header-inner {
      min-height: 0;
      height: 100%;
      max-height: 100%;
      padding: 0;
      border-radius: 0;
      background: transparent;
    }

    .top-mining__header--menu-open .top-mining__menu-toggle {
      top: 12px;
      right: 14px;
    }

    .top-mining__header--menu-open .top-mining__mobile-menu-more {
      display: inline-flex;
      align-items: center;
      gap: 6px;
      margin: 8px 0 0;
      padding: 0;
      border: 0;
      background: transparent;
      color: var(--tm-text-secondary);
      font-family: inherit;
      font-size: 12px;
      font-weight: 600;
      line-height: 1.2;
      letter-spacing: 0.02em;
      text-transform: uppercase;
      cursor: pointer;
    }

    .top-mining__header--menu-open :deep(.top-mining__mobile-menu-title) {
      margin: 18px 0 0;
      position: relative;
      padding: 0;
      top: 17px;
    }

    @media (max-height: 740px) {
      .top-mining__header--menu-open :deep(.top-mining__mobile-menu-title) {
        margin: 14px 0 0;
      }

      .top-mining__header--menu-open .top-mining__mobile-nav {
        padding-top: 8px;
      }

      .top-mining__mobile-menu-section-title {
        margin-bottom: 4px;
        font-size: 13px;
      }

      .top-mining__mobile-menu-link {
        font-size: 12px;
        line-height: 1.15;
        padding: 1px 0;
      }

      .top-mining__mobile-menu-wrap {
        column-gap: 16px;
        row-gap: 1px;
      }

      .top-mining__mobile-menu-contacts {
        margin-top: 8px;
      }
    }

    .top-mining__logo {
      gap: 9px;
      margin-bottom: 0;
    }

    .top-mining__logo-mark {
      width: 31px;
      height: 31px;
    }

    .top-mining__logo-title {
      font-size: 27px;
    }

    .top-mining__logo-subtitle {
      font-size: 10px;
    }

    .top-mining__menu-toggle {
      position: relative;
      top: auto;
      right: auto;
      margin-right: 2px;
    }

    .top-mining__hero {
      width: var(--mobile-frame-width);
      margin: 0 auto;
      background: var(--tm-white);
      overflow: visible;
    }

    .top-mining__dark {
      padding: 58px 10px 26px;
      border-radius: 34px 34px 0 0;
    }

    .top-mining__cards {
      grid-template-columns: 1fr;
      gap: 20px;
      width: 100%;
    }

    .top-mining__card {
      border-radius: 24px;
    }

    .top-mining__card--catalog {
      min-height: 520px;
      order: 1;
    }

    .top-mining__card--calculator {
      min-height: 500px;
      order: 2;
    }

    .top-mining__card--telegram {
      min-height: 260px;
      order: 3;
    }

    .top-mining__card--rating {
      min-height: 300px;
      order: 4;
    }

    .top-mining__card-content {
      padding: 30px 18px;
    }

    .top-mining__card-title {
      max-width: 270px;
      margin-bottom: 22px;
      font-size: 27px;
      line-height: 1.18;
      letter-spacing: -0.04em;
      white-space: normal;
    }

    .top-mining__card-text {
      max-width: 280px;
      font-size: 17px;
      line-height: 1.45;
    }

    .top-mining__card-reviews {
      font-size: 20px !important;
      line-height: 1.35 !important;
    }

    .top-mining__card-reviews strong {
      display: inline;
      font-size: 24px;
    }

    .top-mining__card-reviews::before {
      content: '★';
      margin-right: 8px;
      color: var(--tm-orange-hover);
    }

    .top-mining__card-companies {
      display: flex;
      gap: 14px;
      margin-top: 34px;
      margin-bottom: 28px;
      margin-right: -18px;
      padding-right: 18px;
      overflow-x: auto;
      overflow-y: hidden;
      scroll-snap-type: x proximity;
      -webkit-overflow-scrolling: touch;
    }

    .top-mining__card-companies::-webkit-scrollbar {
      display: none;
    }

    .top-mining__card-companies span {
      flex: 0 0 145px;
      min-height: 106px;
      padding: 14px 16px;
      border-radius: 14px;
      font-size: 17px;
      scroll-snap-align: start;
    }

    .top-mining__card-companies b img {
      height: 24px;
    }

    .top-mining__card-companies small {
      font-size: 16px;
    }

    .top-mining__card-companies small img {
      width: 16px;
    }

    .top-mining__card .top-mining-button {
      width: 100% !important;
      min-width: 0;
      height: 46px;
      font-size: 16px;
    }

    .top-mining-button--right,
    .top-mining__card--calculator .top-mining-button--right {
      position: absolute;
      left: 18px;
      right: 18px;
      bottom: 20px;
      width: auto !important;
      min-width: 0;
      height: 46px;
      font-size: 16px;
    }

    .top-mining__card-stats {
      position: absolute;
      left: 18px;
      right: 18px;
      bottom: 88px;
      justify-content: space-between;
      gap: 12px;
      margin: 0;
    }

    .top-mining__card-stats span {
      font-size: 15px;
    }

    .top-mining__card-stats strong {
      font-size: 31px;
    }

    .top-mining__card-text--calculator {
      top: 102px;
      bottom: auto;
      max-width: 280px;
      font-size: 17px;
    }

    .top-mining__card-text--telegram {
      left: 88px;
      top: 104px;
      bottom: auto;
      max-width: 190px;
      font-size: 15px;
      line-height: 1.45;
    }

    .top-mining__card-image--rig-large {
      top: 178px;
      right: 40px;
      width: 260px;
      opacity: 1;
    }

    .top-mining__card-image--rig-small {
      left: 18px;
      right: auto;
      bottom: 108px;
      width: 58px;
      opacity: 1;
    }

    .top-mining__card-decor--blur-left {
      left: -18px;
      bottom: -12px;
      width: 118px;
      opacity: 1;
    }

    .top-mining__card-decor--blur-right {
      right: -10px;
      top: -16px;
      width: 112px;
      opacity: 1;
    }

    .top-mining__card-decor--paper-large {
      right: -4px;
      top: -6px;
      width: 82px;
    }

    .top-mining__card-decor--paper-small {
      right: 86px;
      bottom: 50px;
      height: 42px;
      opacity: 0.9;
    }

    .top-mining__card--rating .top-mining-button--right {
      bottom: 20px;
    }

    .top-mining__card--rating p {
      max-width: 250px;
      font-size: 16px;
      line-height: 1.55;
    }
  }
</style>
