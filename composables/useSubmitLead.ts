import {
  LEADS_API_PATH,
  parseLeadSubmit,
  type LeadSource,
  type SubmitLeadInput,
} from '~/common/modules/top-mining/layout/leads'

export function useSubmitLead(defaultSource?: LeadSource) {
  const status = ref<'idle' | 'loading' | 'success' | 'error'>('idle')
  const message = ref('')
  const { t } = useT()

  async function submit(input: SubmitLeadInput) {
    const route = useRoute()
    const parsed = parseLeadSubmit({
      ...input,
      source: input.source || defaultSource,
      pagePath: input.pagePath || route.fullPath,
      website: input.website || '',
    })

    if (!parsed.ok) {
      status.value = 'error'
      message.value =
        parsed.error === 'contact is required'
          ? t('leads.contactRequired')
          : parsed.error
      return false
    }

    status.value = 'loading'
    message.value = t('leads.sending')

    try {
      await $fetch(LEADS_API_PATH, {
        method: 'POST',
        body: parsed.data,
      })

      status.value = 'success'
      message.value = t('leads.success')
      return true
    } catch {
      status.value = 'error'
      message.value = t('leads.error')
      return false
    }
  }

  function resetStatus() {
    status.value = 'idle'
    message.value = ''
  }

  return {
    status,
    message,
    submit,
    resetStatus,
  }
}
