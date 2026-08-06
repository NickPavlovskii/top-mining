import {
  LEADS_API_PATH,
  LEADS_UI,
  type LeadSource,
  type SubmitLeadInput,
} from '~/common/modules/top-mining/layout/leads'

export function useSubmitLead(defaultSource?: LeadSource) {
  const status = ref<'idle' | 'loading' | 'success' | 'error'>('idle')
  const message = ref('')

  async function submit(input: SubmitLeadInput) {
    const contact = String(input.contact || '').trim()

    if (!contact) {
      status.value = 'error'
      message.value = LEADS_UI.contactRequired
      return false
    }

    status.value = 'loading'
    message.value = LEADS_UI.sending

    try {
      const route = useRoute()
      await $fetch(LEADS_API_PATH, {
        method: 'POST',
        body: {
          source: input.source || defaultSource,
          name: input.name || '',
          contact,
          message: input.message || '',
          fields: input.fields || {},
          website: input.website || '',
          pagePath: input.pagePath || route.fullPath,
        },
      })

      status.value = 'success'
      message.value = LEADS_UI.success
      return true
    } catch {
      status.value = 'error'
      message.value = LEADS_UI.error
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
