import { describe, expect, it } from 'vitest'

import {
  LEADS_UI,
  parseLeadSubmit,
} from '~/common/modules/top-mining/layout/leads'

describe('parseLeadSubmit', () => {
  it('accepts a valid lead payload', () => {
    const result = parseLeadSubmit({
      source: 'footer-contact',
      contact: ' @user ',
      name: ' Иван ',
      message: ' вопрос ',
      fields: { region: 'Москва' },
      website: '',
      pagePath: '/consulting',
    })

    expect(result.ok).toBe(true)
    if (!result.ok) {
      return
    }

    expect(result.data).toEqual({
      source: 'footer-contact',
      contact: '@user',
      name: 'Иван',
      message: 'вопрос',
      fields: { region: 'Москва' },
      website: '',
      pagePath: '/consulting',
    })
  })

  it('rejects empty contact and source', () => {
    expect(parseLeadSubmit({ source: 'home-phone', contact: '  ' })).toEqual({
      ok: false,
      error: 'contact is required',
    })

    expect(parseLeadSubmit({ source: '', contact: '+7999' })).toEqual({
      ok: false,
      error: 'source is required',
    })
  })

  it('fills defaults for optional fields', () => {
    const result = parseLeadSubmit({
      source: 'home-phone',
      contact: '+79991234567',
    })

    expect(result.ok).toBe(true)
    if (!result.ok) {
      return
    }

    expect(result.data.name).toBe('')
    expect(result.data.message).toBe('')
    expect(result.data.fields).toEqual({})
    expect(result.data.website).toBe('')
    expect(result.data.pagePath).toBe('')
  })

  it('keeps LEADS_UI messages for forms', () => {
    expect(LEADS_UI.contactRequired).toContain('телефон')
  })
})
