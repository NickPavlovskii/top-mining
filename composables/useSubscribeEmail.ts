import {
  parseSubscribeSubmit,
  SUBSCRIBE_API_PATH,
  type SubscribeSource,
} from '~/common/modules/top-mining/layout/subscribe'

export function useSubscribeEmail(source: SubscribeSource) {
  const email = ref('')
  const status = ref<'idle' | 'loading' | 'success' | 'error'>('idle')
  const message = ref('')
  const { t } = useT()

  async function submit() {
    const parsed = parseSubscribeSubmit({
      email: email.value,
      source,
      website: '',
    })

    if (!parsed.ok) {
      status.value = 'error'
      message.value = t('subscribe.invalidEmail')
      return false
    }

    status.value = 'loading'
    message.value = t('subscribe.sending')

    try {
      await $fetch(SUBSCRIBE_API_PATH, {
        method: 'POST',
        body: parsed.data,
      })

      status.value = 'success'
      message.value = t('subscribe.success')
      email.value = ''
      return true
    } catch {
      status.value = 'error'
      message.value = t('subscribe.error')
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
