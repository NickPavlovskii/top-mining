<template>
  <button
    v-show="alwaysVisible || visible"
    type="button"
    class="article-scroll-top"
    :class="{ 'article-scroll-top--inline': inline }"
    aria-label="К началу статьи"
    @click="scrollToFirstSection"
  >
    <Icon
      name="mdi:chevron-up"
      class="article-scroll-top__icon"
      aria-hidden="true"
    />
  </button>
</template>

<script setup lang="ts">
  const props = withDefaults(
    defineProps<{
      targetId?: string | null
      inline?: boolean
      alwaysVisible?: boolean
    }>(),
    {
      targetId: null,
      inline: false,
      alwaysVisible: false,
    },
  )

  const visible = ref(false)

  function onScroll() {
    if (props.alwaysVisible) {
      visible.value = true
      return
    }
    visible.value = window.scrollY > 480
  }

  function scrollToFirstSection() {
    const id = props.targetId
    if (id) {
      const target = document.getElementById(id)
      if (target) {
        target.scrollIntoView({ behavior: 'smooth', block: 'start' })
        history.replaceState(null, '', `#${id}`)
        return
      }
    }

    window.scrollTo({ top: 0, behavior: 'smooth' })
  }

  onMounted(() => {
    onScroll()
    window.addEventListener('scroll', onScroll, { passive: true })
  })

  onBeforeUnmount(() => {
    window.removeEventListener('scroll', onScroll)
  })
</script>

<style scoped>
  .article-scroll-top {
    position: fixed;
    right: 24px;
    bottom: 24px;
    z-index: 40;
    display: inline-flex;
    align-items: center;
    justify-content: center;
    width: 56px;
    height: 56px;
    padding: 0;
    border: 0;
    border-radius: 50%;
    background: var(--tm-orange);
    color: #fff;
    cursor: pointer;
    box-shadow: 0 8px 24px rgba(255, 100, 24, 0.35);
    transition:
      transform 0.15s ease,
      background 0.15s ease;
  }

  .article-scroll-top:hover,
  .article-scroll-top:focus-visible {
    background: var(--tm-orange-hover);
    transform: translateY(-2px);
  }

  .article-scroll-top__icon {
    width: 28px;
    height: 28px;
  }

  .article-scroll-top--inline {
    position: static;
    right: auto;
    bottom: auto;
    flex-shrink: 0;
    width: 52px;
    height: 52px;
    box-shadow: none;
  }

  @media (max-width: 640px) {
    .article-scroll-top:not(.article-scroll-top--inline) {
      right: 16px;
      bottom: 16px;
      width: 48px;
      height: 48px;
    }
  }
</style>
