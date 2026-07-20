const MARQUEE_MIN_DURATION_SECONDS = 10
const MARQUEE_SECONDS_PER_CHARACTER = 0.22

/** Длительность прокрутки marquee в секундах — длиннее текст, медленнее анимация */
export function getMarqueeAnimationDurationSeconds(textLength: number): number {
  return Math.max(
    MARQUEE_MIN_DURATION_SECONDS,
    textLength * MARQUEE_SECONDS_PER_CHARACTER,
  )
}

export function getMarqueeTrackStyle(label: string): { animationDuration: string } {
  return {
    animationDuration: `${getMarqueeAnimationDurationSeconds(label.length)}s`,
  }
}
