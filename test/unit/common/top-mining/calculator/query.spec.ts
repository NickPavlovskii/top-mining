import { describe, expect, it } from 'vitest'

import {
  findHardwareModelBySlug,
  getCalculatorModelHref,
  getCalculatorPrefillHref,
  parseCalculatorPrefillQuery,
  type CalculatorHardwareByKind,
} from '~/common/modules/top-mining'

const hardware: CalculatorHardwareByKind = {
  asic: [
    {
      name: 'MicroBT',
      models: [
        {
          id: 'm70',
          name: 'Whatsminer M70 236 TH/s',
          brand: 'MicroBT',
          algorithm: 'SHA-256',
          hashrate: 236,
          hashrateUnit: 'TH/s',
          powerW: 3422,
          slug: 'microbt-whatsminer-m70-236-th-s',
        },
      ],
    },
  ],
  gpu: [],
  cpu: [],
}

describe('calculator query prefill helpers', () => {
  it('builds model and manual prefill hrefs', () => {
    expect(getCalculatorModelHref('microbt-whatsminer-m70-236-th-s')).toBe(
      '/calculator/?model=microbt-whatsminer-m70-236-th-s',
    )
    expect(
      getCalculatorPrefillHref({ hashrate: 260, power: 3770, unit: 'Th/s' }),
    ).toBe('/calculator/?hashrate=260&power=3770&unit=Th%2Fs')
  })

  it('parses query params', () => {
    expect(
      parseCalculatorPrefillQuery({
        model: 'microbt-whatsminer-m70-236-th-s',
        hashrate: '236',
        power: '3422',
        unit: 'Th/s',
      }),
    ).toEqual({
      model: 'microbt-whatsminer-m70-236-th-s',
      hashrate: 236,
      power: 3422,
      unit: 'Th/s',
      kind: undefined,
    })
  })

  it('finds hardware model by slug', () => {
    expect(
      findHardwareModelBySlug(hardware, 'microbt-whatsminer-m70-236-th-s'),
    ).toMatchObject({
      kind: 'asic',
      model: { hashrate: 236, powerW: 3422 },
    })
  })
})
