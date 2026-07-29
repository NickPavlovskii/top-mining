<template>
  <section
    class="consulting-companies-banner"
    aria-label="Компании партнёры"
  >
    <img
      class="consulting-companies-banner__image"
      alt="Карточки компаний: CHILKOOT, R7MINER, SIBMAIN, PROMMINER, ЦИФРА КАПИТАЛ, IBMM, GET ASIC"
      width="1920"
      height="480"
      loading="lazy"
      decoding="async"
      :src="companiesCards"
    >
  </section>
</template>

<script setup lang="ts">
  import companiesCards from '~/assets/images/consulting/companies-cards.png'
</script>

<style scoped>
  .consulting-companies-banner {
    width: 100%;
    margin: 0;
    padding: 0;
    background: var(--tm-off-white);
    text-align: center;
    overflow: hidden;
  }

  .consulting-companies-banner__image {
    display: block;
    width: 100%;
    max-width: none;
    height: auto;
    margin: 0;
    object-fit: cover;
    object-position: center;
  }
</style>
