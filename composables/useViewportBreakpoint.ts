import type { ViewportBreakpointOptions } from './useViewportBreakpoint.types'

export type { ViewportBreakpointOptions } from './useViewportBreakpoint.types'

export function useViewportBreakpoint(options: ViewportBreakpointOptions) {
  const isMobileViewport = ref(false)
  const isPhoneViewport = ref(false)

  function sync() {
    isMobileViewport.value = window.innerWidth <= options.mobile
    isPhoneViewport.value = window.innerWidth <= options.phone
  }

  onMounted(() => {
    if (import.meta.server) {
      return
    }

    sync()
  })

  useWindowResize(sync)

  return { isMobileViewport, isPhoneViewport }
}
