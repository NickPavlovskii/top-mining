import type { Decorator } from '@storybook/vue3'

/** Типичные ширины превью в Storybook */
export const CANVAS_WIDTH = {
  compact: 420,
  card: 360,
  row: 720,
  section: 960,
} as const

/** Тёмный canvas с отступами — типичный фон секций лендинга */
export const canvasDark: Decorator = () => ({
  template: '<div class="sb-canvas sb-canvas--padded sb-canvas--dark"><story /></div>',
})

/** Светлый canvas с отступами */
export const canvasLight: Decorator = () => ({
  template: '<div class="sb-canvas sb-canvas--padded sb-canvas--light"><story /></div>',
})

/** Полноширинный блок без ограничения max-width */
export const canvasFullBleed: Decorator = () => ({
  template: '<div class="sb-canvas sb-canvas--full"><story /></div>',
})

/** Ограничение ширины для компонентов с фиксированным layout */
export function maxWidth(px: number): Decorator {
  return () => ({
    template: `<div class="sb-canvas sb-canvas--padded" style="max-width: ${px}px; width: 100%"><story /></div>`,
  })
}

/** Светлый canvas + ограничение ширины */
export function canvasLightMaxWidth(px: number): Decorator {
  return () => ({
    template: `<div class="sb-canvas sb-canvas--padded sb-canvas--light sb-canvas--inline" style="max-width: ${px}px; width: 100%"><story /></div>`,
  })
}

/** Тёмный canvas + ограничение ширины */
export function canvasDarkMaxWidth(px: number): Decorator {
  return () => ({
    template: `<div class="sb-canvas sb-canvas--padded sb-canvas--dark sb-canvas--inline" style="max-width: ${px}px; width: 100%"><story /></div>`,
  })
}

/** Hero-логотип: светлый фон и контейнер без 100vw bleed */
export function canvasBrandHero(px = CANVAS_WIDTH.section): Decorator {
  return () => ({
    template: `<div class="sb-canvas sb-canvas--padded sb-canvas--light sb-brand-hero-wrap" style="max-width: ${px}px; width: 100%"><story /></div>`,
  })
}

/** Footer-логотип: типографика родителя как в site-footer__brand */
export function canvasBrandFooter(px = CANVAS_WIDTH.section): Decorator {
  return () => ({
    template: `<div class="sb-canvas sb-canvas--padded sb-canvas--light" style="max-width: ${px}px; width: 100%"><div class="sb-brand-footer-wrap"><story /></div></div>`,
  })
}

/** Все варианты логотипа — самодостаточная светлая раскладка */
export function canvasBrandAllVariants(px = CANVAS_WIDTH.section): Decorator {
  return () => ({
    template: `<div class="sb-canvas sb-canvas--padded sb-canvas--light sb-brand-all-variants-canvas" style="max-width: ${px}px; width: 100%"><story /></div>`,
  })
}
