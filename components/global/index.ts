import type { App } from 'vue'

import RoundIconButton from './RoundIconButton.vue'
import TopMiningButton from './TopMiningButton.vue'

const components = [
  { name: 'round-icon-button', component: RoundIconButton },
  { name: 'top-mining-button', component: TopMiningButton },
]

export default {
  install(app: App) {
    components.forEach(({ name, component }) => {
      app.component(name, component)
    })
  },
}
