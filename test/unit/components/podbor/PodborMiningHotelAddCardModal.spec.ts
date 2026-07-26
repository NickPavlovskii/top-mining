import { mount } from '@vue/test-utils'
import { afterEach, describe, expect, it } from 'vitest'

import { PODBOR_MINING_HOTEL_PLACEMENT } from '~/common/modules/top-mining/podbor-mining-hotel'
import { PODBOR_MINING_HOTEL_SALE } from '~/common/modules/top-mining/podbor-mining-hotel'
import PodborMiningHotelAddCardModal from '~/components/podbor/modal/PodborMiningHotelAddCardModal.vue'

function mountModal(props: Record<string, unknown> = {}) {
  return mount(PodborMiningHotelAddCardModal, {
    props: {
      open: true,
      ...props,
    },
    attachTo: document.body,
  })
}

describe('PodborMiningHotelAddCardModal', () => {
  afterEach(() => {
    document.body.innerHTML = ''
    document.body.style.overflow = ''
  })

  it('does not render dialog when closed', () => {
    mount(PodborMiningHotelAddCardModal, {
      props: { open: false },
      attachTo: document.body,
    })

    expect(document.body.querySelector('.podbor-add-modal')).toBeNull()
  })

  it('renders default placement copy when open', () => {
    mountModal()

    const dialog = document.body.querySelector('.podbor-add-modal')

    expect(dialog).not.toBeNull()
    expect(dialog?.getAttribute('role')).toBe('dialog')
    expect(document.body.querySelector('#podbor-add-modal-title')?.textContent).toBe(
      PODBOR_MINING_HOTEL_PLACEMENT.modal.title,
    )
    expect(document.body.textContent).toContain(
      PODBOR_MINING_HOTEL_PLACEMENT.modal.subtitle,
    )
  })

  it('uses custom copy when provided', () => {
    mountModal({ copy: PODBOR_MINING_HOTEL_SALE.modal })

    expect(document.body.querySelector('#podbor-add-modal-title')?.textContent).toBe(
      PODBOR_MINING_HOTEL_SALE.modal.title,
    )
  })

  it('closes on close button click', async () => {
    const wrapper = mountModal()

    const closeBtn = document.body.querySelector(
      '.podbor-add-modal__close',
    ) as HTMLButtonElement

    closeBtn.click()
    await wrapper.vm.$nextTick()

    expect(wrapper.emitted('update:open')?.at(-1)).toEqual([false])
  })

  it('closes on backdrop click', async () => {
    const wrapper = mountModal()

    const backdrop = document.body.querySelector(
      '.podbor-add-modal__backdrop',
    ) as HTMLButtonElement

    backdrop.click()
    await wrapper.vm.$nextTick()

    expect(wrapper.emitted('update:open')?.at(-1)).toEqual([false])
  })

  it('closes after successful submit', async () => {
    const wrapper = mountModal()

    const name = document.body.querySelector(
      'input[autocomplete="name"]',
    ) as HTMLInputElement
    const phone = document.body.querySelector(
      'input[autocomplete="tel"]',
    ) as HTMLInputElement
    const inputs = document.body.querySelectorAll('.podbor-add-modal__input')
    const power = inputs[2] as HTMLInputElement
    const region = inputs[3] as HTMLInputElement

    name.value = 'Иван'
    name.dispatchEvent(new Event('input'))
    phone.value = '+79991234567'
    phone.dispatchEvent(new Event('input'))
    power.value = '10'
    power.dispatchEvent(new Event('input'))
    region.value = 'Москва'
    region.dispatchEvent(new Event('input'))

    const form = document.body.querySelector('.podbor-add-modal__form') as HTMLFormElement
    form.dispatchEvent(new Event('submit', { bubbles: true, cancelable: true }))
    await wrapper.vm.$nextTick()

    expect(wrapper.emitted('update:open')?.at(-1)).toEqual([false])
  })
})
