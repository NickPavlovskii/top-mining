import {
  isValidSubscribeEmail,
  normalizeSubscribeEmail,
  SUBSCRIBE_API_PATH,
  SUBSCRIBE_UI,
  type SubscribeSource,
} from '~/common/modules/top-mining/layout/subscribe'

export function useSubscribeEmail(source: SubscribeSource) {
  const email = ref('')
  const status = ref<'idle' | 'loading' | 'success' | 'error'>('idle')
  const message = ref('')

  async function submit() {
    const normalized = normalizeSubscribeEmail(email.value)

    if (!isValidSubscribeEmail(normalized)) {
      status.value = 'error'
      message.value = SUBSCRIBE_UI.invalidEmail
      return false
    }

    status.value = 'loading'
    message.value = SUBSCRIBE_UI.sending

    try {
      await $fetch(SUBSCRIBE_API_PATH, {
        method: 'POST',
        body: {
          email: normalized,
          source,
          website: '',
        },
      })

      status.value = 'success'
      message.value = SUBSCRIBE_UI.success
      email.value = ''
      return true
    } catch {
      status.value = 'error'
      message.value = SUBSCRIBE_UI.error
      return false
    }
  }

  return {
    email,
    status,
    message,
    submit,
  }
}
