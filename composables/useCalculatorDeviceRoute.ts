import {
  getCalculatorDeviceHash,
  parseCalculatorDeviceHash,
} from '~/common/modules/top-mining/calculator-nav'
import type { CalculatorDeviceKind } from '~/common/modules/top-mining'

type UseCalculatorDeviceRouteOptions = {
  scrollToForm?: boolean
  syncHash?: boolean
}

export function useCalculatorDeviceRoute(
  activeKind: Ref<CalculatorDeviceKind>,
  options: UseCalculatorDeviceRouteOptions = {},
) {
  const route = useRoute()
  const router = useRouter()
  const formRef = ref<HTMLElement | null>(null)

  const skipHashSync = ref(true)

  function applyDeviceFromHash() {
    const kind = parseCalculatorDeviceHash(route.hash)
    if (!kind || kind === activeKind.value) {
      return
    }

    activeKind.value = kind

    if (options.scrollToForm) {
      nextTick(() => {
        formRef.value?.scrollIntoView({ behavior: 'smooth', block: 'start' })
      })
    }
  }

  function syncHashWithKind(kind: CalculatorDeviceKind) {
    if (!options.syncHash || skipHashSync.value) {
      return
    }

    const nextHash = kind === 'asic' ? '' : getCalculatorDeviceHash(kind)
    if (route.hash === nextHash) {
      return
    }

    router.replace({
      path: route.path,
      hash: nextHash,
      query: route.query,
    })
  }

  onMounted(() => {
    applyDeviceFromHash()
    skipHashSync.value = false
  })

  watch(
    () => route.hash,
    () => {
      applyDeviceFromHash()
    },
  )

  watch(activeKind, (kind) => {
    syncHashWithKind(kind)
  })

  return {
    formRef,
    applyDeviceFromHash,
  }
}
