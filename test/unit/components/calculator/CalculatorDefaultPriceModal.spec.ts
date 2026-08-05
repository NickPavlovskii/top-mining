import { mount } from '@vue/test-utils'
import { describe, expect, it } from 'vitest'

import CalculatorDefaultPriceModal from '~/components/calculator/form/CalculatorDefaultPriceModal.vue'

describe('CalculatorDefaultPriceModal', () => {
  it('renders default price copy and confirms', async () => {
    const wrapper = mount(CalculatorDefaultPriceModal, {
      props: {
        open: true,
        deviceLabel: 'ASIC-майнера',
        defaultPriceLabel: '120 000 ₽',
        'onUpdate:open': (value: boolean) =>
          wrapper.setProps({ open: value }),
      },
      attachTo: document.body,
    })

    expect(document.body.textContent).toContain(
      'По умолчанию стоимость вашего ASIC-майнера — 120 000 ₽.',
    )
    expect(document.body.textContent).toContain(
      'Вы можете изменить цену устройства.',
    )

    const confirm = document.body.querySelector(
      '.calculator-def-price-modal__confirm',
    ) as HTMLButtonElement
    expect(confirm).toBeTruthy()
    confirm.click()
    await wrapper.vm.$nextTick()

    expect(wrapper.emitted('confirm')).toHaveLength(1)
    expect(wrapper.props('open')).toBe(false)

    wrapper.unmount()
  })
})
