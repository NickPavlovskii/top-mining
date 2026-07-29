<template>
  <svg
    xmlns="http://www.w3.org/2000/svg"
    width="26"
    height="26"
    viewBox="0 0 26 26"
    fill="none"
    aria-hidden="true"
    v-bind="$attrs"
  >
    <rect
      width="26"
      height="26"
      rx="13"
      :fill="`url(#${gradientId})`"
    />
    <path
      d="M11.8338 9.74L13.0038 9.956L14.1738 9.74V20H11.8338V9.74ZM13.0038 8.462C12.5598 8.462 12.1938 8.342 11.9058 8.102C11.6178 7.85 11.4738 7.526 11.4738 7.13C11.4738 6.734 11.6178 6.416 11.9058 6.176C12.1938 5.924 12.5598 5.798 13.0038 5.798C13.4598 5.798 13.8258 5.924 14.1018 6.176C14.3898 6.416 14.5338 6.734 14.5338 7.13C14.5338 7.526 14.3898 7.85 14.1018 8.102C13.8258 8.342 13.4598 8.462 13.0038 8.462Z"
      fill="white"
    />
    <defs>
      <linearGradient
        :id="gradientId"
        x1="0.923498"
        y1="-4.33334"
        x2="26.3864"
        y2="-2.27613"
        gradientUnits="userSpaceOnUse"
      >
        <stop
          offset="0.000229369"
          stop-color="#EC5100"
        />
        <stop
          offset="1"
          stop-color="#FF741F"
        />
      </linearGradient>
    </defs>
  </svg>
</template>

<script setup lang="ts">
  const gradientId = `consulting-info-circle-${useId()}`
</script>
