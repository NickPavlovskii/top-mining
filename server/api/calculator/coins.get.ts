import { createError } from 'h3'
import {
  emptyCalculatorCoinsCatalog,
  type CalculatorCoinsCatalog,
} from '~/common/modules/top-mining/calculator/coins'
import { CALCULATOR_COINS_QUERY } from '~/server/graphql/queries'
import { fetchGraphQL } from '~/server/utils/graphql'

type GraphQLCalculatorCoinsData = {
  calculatorCoins: CalculatorCoinsCatalog
}

export default defineEventHandler(async () => {
  try {
    const data = await fetchGraphQL<GraphQLCalculatorCoinsData>(
      CALCULATOR_COINS_QUERY,
    )

    const catalog = data.calculatorCoins ?? emptyCalculatorCoinsCatalog()

    return {
      source: 'graphql',
      asic: catalog.asic ?? [],
      gpu: catalog.gpu ?? [],
      gpuAlgorithms: catalog.gpuAlgorithms ?? [],
      defaultUsdtRub:
        catalog.defaultUsdtRub ?? emptyCalculatorCoinsCatalog().defaultUsdtRub,
    } satisfies CalculatorCoinsCatalog & { source: string }
  } catch (error) {
    const detail = error instanceof Error ? error.message : String(error)
    throw createError({
      statusCode: 503,
      statusMessage: 'Calculator coins unavailable',
      message: `Calculator coins unavailable: ${detail}`,
      cause: error,
    })
  }
})
