<template>
  <Transition name="tm-form-status">
    <div
      v-if="isVisible"
      role="status"
      :class="rootClass"
      :aria-live="ariaLive"
    >
      <span
        class="top-mining-form-status__icon"
        aria-hidden="true"
      >
        <top-mining-form-status-success-icon v-if="status === 'success'" />
        <top-mining-form-status-error-icon v-else-if="status === 'error'" />
        <top-mining-form-status-spinner-icon
          v-else
          class="top-mining-form-status__spinner"
        />
      </span>

      <p class="top-mining-form-status__text">
        {{ message }}
      </p>
    </div>
  </Transition>
</template>

<script setup lang="ts">
  import type {
    TopMiningFormStatusKind,
    TopMiningFormStatusProps,
  } from '~/components/global/forms/TopMiningFormStatus.types'
  import TopMiningFormStatusErrorIcon from '~/components/global/forms/icons/TopMiningFormStatusErrorIcon.vue'
  import TopMiningFormStatusSpinnerIcon from '~/components/global/forms/icons/TopMiningFormStatusSpinnerIcon.vue'
  import TopMiningFormStatusSuccessIcon from '~/components/global/forms/icons/TopMiningFormStatusSuccessIcon.vue'

  const props = withDefaults(defineProps<TopMiningFormStatusProps>(), {
    message: '',
    align: 'start',
    tone: 'light',
    compact: false,
  })

  const isVisible = computed(() => {
    const message = String(props.message || '').trim()
    if (!message) {
      return false
    }

    return (
      props.status === 'success'
      || props.status === 'error'
      || props.status === 'loading'
    )
  })

  const ariaLive = computed(() =>
    props.status === 'error' ? 'assertive' : 'polite',
  )

  const rootClass = computed(() => [
    'top-mining-form-status',
    `top-mining-form-status--${props.status as TopMiningFormStatusKind}`,
    `top-mining-form-status--${props.align}`,
    `top-mining-form-status--tone-${props.tone}`,
    {
      'top-mining-form-status--compact': props.compact,
    },
  ])
</script>

<style scoped>
  .top-mining-form-status {
    display: flex;
    align-items: flex-start;
    gap: 10px;
    box-sizing: border-box;
    width: 100%;
    margin: 12px 0 0;
    padding: 12px 14px;
    border: 1px solid transparent;
    border-radius: 14px;
    font-family: 'Mulish', 'Segoe UI', system-ui, sans-serif;
    backdrop-filter: blur(8px);
  }

  .top-mining-form-status--center {
    margin-left: auto;
    margin-right: auto;
    max-width: 420px;
  }

  .top-mining-form-status--compact {
    margin-top: 10px;
    padding: 0;
    border: 0;
    background: transparent;
    backdrop-filter: none;
  }

  .top-mining-form-status--success {
    border-color: rgba(47, 158, 68, 0.28);
    background: linear-gradient(
      135deg,
      rgba(47, 158, 68, 0.16),
      rgba(47, 158, 68, 0.08)
    );
    color: #2f9e44;
  }

  .top-mining-form-status--error {
    border-color: rgba(224, 49, 49, 0.28);
    background: linear-gradient(
      135deg,
      rgba(224, 49, 49, 0.16),
      rgba(224, 49, 49, 0.08)
    );
    color: #e03131;
  }

  .top-mining-form-status--loading {
    border-color: rgba(255, 122, 26, 0.28);
    background: linear-gradient(
      135deg,
      rgba(255, 122, 26, 0.14),
      rgba(255, 122, 26, 0.06)
    );
    color: var(--tm-orange-accent-deep, #ff7a1a);
  }

  .top-mining-form-status--tone-dark.top-mining-form-status--success {
    border-color: rgba(105, 219, 124, 0.35);
    background: linear-gradient(
      135deg,
      rgba(105, 219, 124, 0.2),
      rgba(105, 219, 124, 0.08)
    );
    color: #b2f2bb;
  }

  .top-mining-form-status--tone-dark.top-mining-form-status--error {
    border-color: rgba(255, 135, 135, 0.35);
    background: linear-gradient(
      135deg,
      rgba(255, 135, 135, 0.2),
      rgba(255, 135, 135, 0.08)
    );
    color: #ffc9c9;
  }

  .top-mining-form-status--tone-dark.top-mining-form-status--loading {
    border-color: rgba(255, 168, 92, 0.4);
    background: linear-gradient(
      135deg,
      rgba(255, 122, 26, 0.22),
      rgba(255, 122, 26, 0.08)
    );
    color: #ffd8a8;
  }

  .top-mining-form-status--compact.top-mining-form-status--success {
    color: #2f9e44;
  }

  .top-mining-form-status--compact.top-mining-form-status--error {
    color: #e03131;
  }

  .top-mining-form-status--compact.top-mining-form-status--tone-dark.top-mining-form-status--success {
    color: #69db7c;
  }

  .top-mining-form-status--compact.top-mining-form-status--tone-dark.top-mining-form-status--error {
    color: #ff8787;
  }

  .top-mining-form-status__icon {
    display: inline-flex;
    flex-shrink: 0;
    align-items: center;
    justify-content: center;
    width: 28px;
    height: 28px;
    margin-top: -1px;
    border-radius: 999px;
    background: currentColor;
  }

  .top-mining-form-status__icon svg {
    width: 16px;
    height: 16px;
    color: #fff;
  }

  .top-mining-form-status--tone-dark .top-mining-form-status__icon svg {
    color: var(--tm-ink, #121212);
  }

  .top-mining-form-status--compact .top-mining-form-status__icon {
    width: 20px;
    height: 20px;
    background: transparent;
  }

  .top-mining-form-status--compact .top-mining-form-status__icon svg {
    width: 100%;
    height: 100%;
    color: currentColor;
  }

  .top-mining-form-status__spinner {
    animation: tm-form-status-spin 0.8s linear infinite;
  }

  .top-mining-form-status__text {
    margin: 0;
    padding-top: 4px;
    font-size: 14px;
    font-weight: 500;
    line-height: 20px;
  }

  .top-mining-form-status--compact .top-mining-form-status__text {
    padding-top: 0;
  }

  .tm-form-status-enter-active,
  .tm-form-status-leave-active {
    transition:
      opacity 0.22s ease,
      transform 0.22s ease;
  }

  .tm-form-status-enter-from,
  .tm-form-status-leave-to {
    opacity: 0;
    transform: translateY(6px);
  }

  @keyframes tm-form-status-spin {
    to {
      transform: rotate(360deg);
    }
  }
</style>
