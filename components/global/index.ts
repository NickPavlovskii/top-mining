import type { App } from 'vue'

import TopMiningArticleCard from './articles/TopMiningArticleCard.vue'
import TopMiningArticleRow from './articles/TopMiningArticleRow.vue'
import TopMiningButton from './buttons/TopMiningButton.vue'
import TopMiningMoreLink from './buttons/TopMiningMoreLink.vue'
import TopMiningRoundIconButton from './buttons/TopMiningRoundIconButton.vue'
import TopMiningChip from './labels/TopMiningChip.vue'
import TopMiningBrandTitle from './pageTitle/TopMiningBrandTitle.vue'
import TopMiningCheckbox from './selection-controls/TopMiningCheckbox.vue'
import TopMiningRadio from './selection-controls/TopMiningRadio.vue'

const components = [
  { name: 'top-mining-article-card', component: TopMiningArticleCard },
  { name: 'top-mining-article-row', component: TopMiningArticleRow },
  { name: 'top-mining-brand-title', component: TopMiningBrandTitle },
  { name: 'top-mining-button', component: TopMiningButton },
  { name: 'top-mining-checkbox', component: TopMiningCheckbox },
  { name: 'top-mining-chip', component: TopMiningChip },
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
