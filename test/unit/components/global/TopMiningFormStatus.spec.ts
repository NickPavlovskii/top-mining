import { mount } from '@vue/test-utils'
import { describe, expect, it } from 'vitest'

import TopMiningFormStatus from '~/components/global/forms/TopMiningFormStatus.vue'

describe('TopMiningFormStatus', () => {
  it('does not render when idle or message is empty', () => {
    const idle = mount(TopMiningFormStatus, {
      props: { status: 'idle', message: 'hidden' },
    })
    expect(idle.find('.top-mining-form-status').exists()).toBe(false)

    const empty = mount(TopMiningFormStatus, {
      props: { status: 'success', message: '' },
    })
    expect(empty.find('.top-mining-form-status').exists()).toBe(false)
  })

  it('renders success and error states with message', () => {
    const success = mount(TopMiningFormStatus, {
      props: {
        status: 'success',
        message: 'Заявка отправлена',
      },
    })

    expect(success.classes()).toContain('top-mining-form-status--success')
    expect(success.text()).toContain('Заявка отправлена')

    const error = mount(TopMiningFormStatus, {
      props: {
        status: 'error',
        message: 'Ошибка отправки',
        align: 'center',
        tone: 'dark',
      },
    })

    expect(error.classes()).toContain('top-mining-form-status--error')
    expect(error.classes()).toContain('top-mining-form-status--center')
    expect(error.classes()).toContain('top-mining-form-status--tone-dark')
    expect(error.text()).toContain('Ошибка отправки')
  })
})
