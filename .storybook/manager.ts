import { addons } from 'storybook/manager-api'

import { topMiningTheme } from './brand-theme'

addons.setConfig({
  theme: topMiningTheme,
  sidebar: {
    showRoots: true,
    collapsedRoots: [],
  },
  navSize: 280,
})
