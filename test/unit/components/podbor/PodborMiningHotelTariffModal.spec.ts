import { mount } from '@vue/test-utils'
import { afterEach, describe, expect, it } from 'vitest'

import type { PodborPlacementOffer } from '~/common/modules/top-mining/podbor-mining-hotel'
import {
  PODBOR_MINING_HOTEL_PLACEMENT,
  PODBOR_MINING_HOTEL_SALE,
} from '~/common/modules/top-mining/podbor-mining-hotel'
import PodborMiningHotelTariffModal from '~/components/podbor/modal/PodborMiningHotelTariffModal.vue'

const offer: PodborPlacementOffer = {
  id: 'moscow-region',
  title: 'Свободно 40 МВт в Московской области',
  capacityTitle: '40 МВт мощности',
  priceLabel: 'Цена за кВт/ч:',
  priceValue: 'опт от 4,7₽',
  location: 'Московская область',
  image: '/images/podbor-majning-otelya/placement/moscow-region.png',
}

function mountModal(props: Record<string, unknown> = {}) {
  return mount(PodborMiningHotelTariffModal, {
    props: {
      open: true,
      offer,
      ...props,
    },
    attachTo: document.body,
  })
}

describe('PodborMiningHotelTariffModal', () => {
  afterEach(() => {
    document.body.innerHTML = ''
    document.body.style.overflow = ''
  })

  it('does not render when closed or without offer', () => {
    mount(PodborMiningHotelTariffModal, {
      props: { open: true, offer: null },
      attachTo: document.body,
    })

    expect(document.body.querySelector('.podbor-tariff-modal')).toBeNull()
  })

  it('renders offer and default tariff copy', () => {
    mountModal()

    const dialog = document.body.querySelector('.podbor-tariff-modal')

    expect(dialog).not.toBeNull()
    expect(dialog?.getAttribute('role')).toBe('dialog')
    expect(document.body.querySelector('#podbor-tariff-modal-title')?.textContent).toBe(
      offer.capacityTitle,
    )
    expect(document.body.textContent).toContain(offer.location)
    expect(document.body.textContent).toContain(
      PODBOR_MINING_HOTEL_PLACEMENT.tariffModal.badge,
    )
    expect(document.body.textContent).toContain(
      PODBOR_MINING_HOTEL_PLACEMENT.tariffModal.description,
    )
  })

  it('uses custom sale copy when provided', () => {
    mountModal({ copy: PODBOR_MINING_HOTEL_SALE.priceModal })

    expect(document.body.textContent).toContain(PODBOR_MINING_HOTEL_SALE.priceModal.badge)
    expect(document.body.textContent).toContain(
      PODBOR_MINING_HOTEL_SALE.priceModal.description,
    )
  })

  it('closes on close button click', async () => {
    const wrapper = mountModal()

    const closeBtn = document.body.querySelector(
      '.podbor-tariff-modal__close',
    ) as HTMLButtonElement

    closeBtn.click()
    await wrapper.vm.$nextTick()

    expect(wrapper.emitted('update:open')?.at(-1)).toEqual([false])
  })

  it('closes after successful submit', async () => {
    const wrapper = mountModal()

    const phone = document.body.querySelector(
      '.podbor-tariff-modal__input',
    ) as HTMLInputElement

    phone.value = '+79991234567'
    phone.dispatchEvent(new Event('input'))

    const form = document.body.querySelector(
      '.podbor-tariff-modal__form',
    ) as HTMLFormElement

    form.dispatchEvent(new Event('submit', { bubbles: true, cancelable: true }))
    await wrapper.vm.$nextTick()

    expect(wrapper.emitted('update:open')?.at(-1)).toEqual([false])
  })
})
