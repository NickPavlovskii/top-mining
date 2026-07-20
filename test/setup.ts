import { config } from '@vue/test-utils'
import { defineComponent, h } from 'vue'
import { createMemoryHistory, createRouter, RouterLink } from 'vue-router'

const router = createRouter({
  history: createMemoryHistory(),
  routes: [{ path: '/:pathMatch(.*)*', component: { template: '<div />' } }],
})

config.global.plugins = [router]

config.global.stubs = {
  NuxtLink: RouterLink,
  'nuxt-link': RouterLink,
  Icon: defineComponent({
    name: 'IconStub',
    props: {
      name: {
        type: String,
        default: '',
      },
    },
    setup(props) {
      return () =>
        h('span', {
          class: 'icon-stub',
          'data-icon': props.name,
          'aria-hidden': 'true',
        })
    },
  }),
  QBtn: defineComponent({
    name: 'QBtn',
    inheritAttrs: true,
    props: {
      href: { type: String, default: '' },
      target: { type: String, default: '' },
      rel: { type: String, default: '' },
      type: { type: String, default: 'button' },
      disable: { type: Boolean, default: false },
      loading: { type: Boolean, default: false },
      ripple: { type: Boolean, default: true },
    },
    emits: ['click'],
    setup(props, { slots, attrs, emit }) {
      return () =>
        h(
          props.href ? 'a' : 'button',
          {
            ...attrs,
            href: props.href || undefined,
            target: props.href ? props.target || undefined : undefined,
            rel: props.href ? props.rel || undefined : undefined,
            type: props.href ? undefined : props.type,
            disabled: props.href ? undefined : props.disable || undefined,
            'aria-disabled': props.disable || undefined,
            onClick: (event: MouseEvent) => emit('click', event),
          },
          slots.default?.(),
        )
    },
  }),
  QTooltip: defineComponent({
    name: 'QTooltip',
    props: {
      anchor: { type: String, default: 'bottom middle' },
      self: { type: String, default: 'top middle' },
    },
    setup(_props, { slots }) {
      return () => (slots.default ? h('span', { class: 'q-tooltip-stub' }, slots.default()) : null)
    },
  }),
  QChip: defineComponent({
    name: 'QChip',
    inheritAttrs: true,
    props: {
      clickable: { type: Boolean, default: false },
      disable: { type: Boolean, default: false },
      outline: { type: Boolean, default: false },
      square: { type: Boolean, default: false },
      dense: { type: Boolean, default: false },
      ripple: { type: Boolean, default: true },
    },
    emits: ['click', 'remove'],
    setup(props, { slots, attrs, emit }) {
      return () =>
        h(
          props.clickable ? 'button' : 'span',
          {
            ...attrs,
            type: props.clickable ? 'button' : undefined,
            disabled: props.clickable ? props.disable || undefined : undefined,
            onClick: (event: MouseEvent) => emit('click', event),
          },
          slots.default?.(),
        )
    },
  }),
}
