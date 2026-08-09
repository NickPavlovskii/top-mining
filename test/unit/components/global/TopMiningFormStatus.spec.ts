import { mount } from '@vue/test-utils'
import { afterEach, describe, expect, it } from 'vitest'

import TopMiningFormStatus from '~/components/global/forms/TopMiningFormStatus.vue'

function mountStatus(props: Record<string, unknown>) {
  return mount(TopMiningFormStatus, {
    props,
    attachTo: document.body,
  })
}

describe('TopMiningFormStatus', () => {
  afterEach(() => {
    document.body.innerHTML = ''
  })

  it('does not render when idle or message is empty', () => {
    mountStatus({ status: 'idle', message: 'hidden' })
    expect(document.body.querySelector('.top-mining-form-status')).toBeNull()

    mountStatus({ status: 'success', message: '' })
    expect(document.body.querySelector('.top-mining-form-status')).toBeNull()
  })

  it('renders success and error toasts in the document body', () => {
    mountStatus({
      status: 'success',
      message: 'Заявка отправлена',
    })

    const success = document.body.querySelector('.top-mining-form-status')
    expect(success).not.toBeNull()
    expect(success?.classList.contains('top-mining-form-status--success')).toBe(
      true,
    )
    expect(success?.textContent).toContain('Заявка отправлена')

    document.body.innerHTML = ''

    mountStatus({
      status: 'error',
      message: 'Ошибка отправки',
      align: 'center',
      tone: 'dark',
    })

    const error = document.body.querySelector('.top-mining-form-status')
    expect(error).not.toBeNull()
    expect(error?.classList.contains('top-mining-form-status--error')).toBe(
      true,
    )
    expect(error?.classList.contains('top-mining-form-status--center')).toBe(
      true,
    )
    expect(error?.classList.contains('top-mining-form-status--tone-dark')).toBe(
      true,
    )
    expect(error?.textContent).toContain('Ошибка отправки')
  })
})
