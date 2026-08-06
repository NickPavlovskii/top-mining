import { createError } from 'h3'
import {
  emptyCalculatorHardwareByKind,
  type CalculatorHardwareByKind,
} from '~/common/modules/top-mining/calculator/hardware'
import { CALCULATOR_HARDWARE_QUERY } from '~/server/graphql/queries'
import { fetchGraphQL } from '~/server/utils/graphql'

type GraphQLCalculatorHardwareData = {
  calculatorHardware: CalculatorHardwareByKind
}

export default defineEventHandler(async () => {
  try {
    const data = await fetchGraphQL<GraphQLCalculatorHardwareData>(
      CALCULATOR_HARDWARE_QUERY,
    )

    const catalog = data.calculatorHardware ?? emptyCalculatorHardwareByKind()

    return {
      source: 'graphql',
      asic: catalog.asic ?? [],
      gpu: catalog.gpu ?? [],
      cpu: catalog.cpu ?? [],
    } satisfies CalculatorHardwareByKind & { source: string }
  } catch (error) {
    const detail = error instanceof Error ? error.message : String(error)
    throw createError({
      statusCode: 503,
      statusMessage: 'Calculator hardware unavailable',
      message: `Calculator hardware unavailable: ${detail}`,
      cause: error,
    })
  }
})
