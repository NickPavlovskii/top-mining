import type { App } from 'vue'

import TopMiningArticleCard from './TopMiningArticleCard.vue'
import TopMiningArticleRow from './TopMiningArticleRow.vue'
import TopMiningBrandTitle from './TopMiningBrandTitle.vue'
import TopMiningButton from './TopMiningButton.vue'
import TopMiningCheckbox from './TopMiningCheckbox.vue'
import TopMiningMoreLink from './TopMiningMoreLink.vue'
import TopMiningRadio from './TopMiningRadio.vue'
import TopMiningRoundIconButton from './TopMiningRoundIconButton.vue'

const components = [
  { name: 'top-mining-article-card', component: TopMiningArticleCard },
  { name: 'top-mining-article-row', component: TopMiningArticleRow },
  { name: 'top-mining-brand-title', component: TopMiningBrandTitle },
  { name: 'top-mining-button', component: TopMiningButton },
  { name: 'top-mining-checkbox', component: TopMiningCheckbox },
  { name: 'top-mining-more-link', component: TopMiningMoreLink },
  { name: 'top-mining-radio', component: TopMiningRadio },
  { name: 'top-mining-round-icon-button', component: TopMiningRoundIconButton },
]

export default {
  install(app: App) {
    components.forEach(({ name, component }) => {
      app.component(name, component)
    })
  },
}
