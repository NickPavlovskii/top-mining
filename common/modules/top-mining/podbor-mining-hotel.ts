export const PODBOR_MINING_HOTEL_PATH = '/podbor-majning-otelya/'

/** U+2011 — неразрывный дефис, чтобы «майнинг-отель» не рвался по строкам */
const NBH = '\u2011'

export const PODBOR_MINING_HOTEL_PAGE = {
  breadcrumb: `Подбор майнинг${NBH}отеля`,
  title: `Нужен майнинг${NBH}отель?`,
  description: `Подберем вам майнинг${NBH}отель, где вы сможете разместить асики`,
  descriptionAccent: 'на 15% дешевле рынка',
} as const
