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
}
