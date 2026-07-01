<template>
  <div class="layout">
    <top-mining-header />
    <main class="layout__content">
      <slot />
    </main>
    <top-mining-footer />
  </div>
</template>

<style scoped>
  .layout {
    min-height: 100vh;
    background: var(--bg);
  }

  .layout__content {
    flex: 1 1 auto;
  }

  @media (max-width: 560px) {
    .layout {
      background: var(--tm-white);
    }
  }
</style>
