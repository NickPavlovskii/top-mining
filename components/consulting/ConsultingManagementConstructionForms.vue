<template>
  <div :class="rootClass">
    <consulting-management-construction-form
      v-for="form in copy.forms"
      :key="form.id"
      :form="form"
    />
  </div>
</template>

<script setup lang="ts">
  import { CONSULTING_CONSTRUCTION_FORMS } from '~/common/modules/top-mining/consulting/construction-forms'
  import ConsultingManagementConstructionForm from '~/components/consulting/ConsultingManagementConstructionForm.vue'

  const props = defineProps<{
    variant?: 'inline' | 'mobile'
  }>()

  const copy = CONSULTING_CONSTRUCTION_FORMS

  const rootClass = computed(() => [
    'consulting-construction-forms',
    props.variant === 'mobile' && 'consulting-construction-forms--mobile',
    props.variant !== 'mobile' && 'consulting-construction-forms--inline',
  ])
</script>

<style scoped>
  .consulting-construction-forms {
    display: flex;
    gap: 20px;
    align-items: stretch;
    margin: 30px 0 20px;
  }

  .consulting-construction-forms--inline {
    display: flex;
  }

  .consulting-construction-forms--mobile {
    display: none;
    width: 100%;
  }

  @media (max-width: 1400px) {
    .consulting-construction-forms {
      margin: 30px 0 0;
    }
  }

  @media (max-width: 1299px) {
    .consulting-construction-forms--inline {
      display: none;
    }

    .consulting-construction-forms--mobile {
      display: flex;
      flex-direction: column;
      gap: 10px;
      width: 100%;
      margin: 20px 0 0;
    }
  }

  @media (min-width: 768px) and (max-width: 1299px) {
    .consulting-construction-forms--mobile {
      flex-direction: row;
      gap: 20px;
      margin: 20px 0 88px;
    }
  }
</style>
