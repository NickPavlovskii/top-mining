import { addons } from 'storybook/manager-api'

import { topMiningTheme } from './brand-theme'
import './manager.css'

addons.setConfig({
  theme: topMiningTheme,
  sidebar: {
    showRoots: true,
    collapsedRoots: [],
  },
  navSize: 280,
})
