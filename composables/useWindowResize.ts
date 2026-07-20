export function useWindowResize(handler: () => void) {
  onMounted(() => {
    if (import.meta.server) {
      return
    }

    window.addEventListener('resize', handler)
  })

  onBeforeUnmount(() => {
    if (import.meta.server) {
      return
    }

    window.removeEventListener('resize', handler)
  })
}
