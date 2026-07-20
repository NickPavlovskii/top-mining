import { getMarqueeAnimationDurationSeconds } from '~/common/modules/format/marquee'

export function useMarqueeTrackStyle(label: MaybeRefOrGetter<string>) {
  return computed(() => ({
    animationDuration: `${getMarqueeAnimationDurationSeconds(toValue(label).length)}s`,
  }))
}
