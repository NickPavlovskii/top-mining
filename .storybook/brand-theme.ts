import { create } from 'storybook/theming/create'
import {
  TM_ORANGE,
  TM_ORANGE_GRADIENT_START,
} from '../common/modules/top-mining/colors'

/** Общая тёмная тема UI Storybook в стиле лендинга ТОП-МАЙНИНГ */
export const topMiningTheme = create({
  base: 'dark',
  brandTitle: 'ТОП-МАЙНИНГ',
  brandUrl: '/',
  colorPrimary: TM_ORANGE,
  colorSecondary: TM_ORANGE_GRADIENT_START,
  appBg: '#0d0d0d',
  appContentBg: '#141414',
  appPreviewBg: '#141414',
  appBorderColor: '#2a2a2a',
  appBorderRadius: 8,
  fontBase: '"Unbounded", "Roboto", sans-serif',
  fontCode: 'ui-monospace, SFMono-Regular, Menlo, Monaco, Consolas, monospace',
  textColor: '#f6f6f6',
  textInverseColor: '#141414',
  textMutedColor: '#a0a0a0',
  barTextColor: '#c8c8c8',
  barHoverColor: TM_ORANGE,
  barSelectedColor: TM_ORANGE,
  barBg: '#141414',
  buttonBg: '#1f1f1f',
  buttonBorder: '#2a2a2a',
  booleanBg: '#1a1a1a',
  booleanSelectedBg: TM_ORANGE,
  inputBg: '#1a1a1a',
  inputBorder: '#2a2a2a',
  inputTextColor: '#f6f6f6',
  inputBorderRadius: 6,
})
