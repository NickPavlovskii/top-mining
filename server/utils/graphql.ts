export interface GraphQLResponse<TData> {
  data?: TData
  errors?: Array<{ message: string }>
}

export async function fetchGraphQL<TData>(
  query: string,
  variables?: Record<string, unknown>,
): Promise<TData> {
  const config = useRuntimeConfig()
  const graphqlUrl =
    config.catalogGraphqlUrl || 'http://localhost:8080/graphql'

  const response = await $fetch<GraphQLResponse<TData>>(graphqlUrl, {
    method: 'POST',
    headers: { 'content-type': 'application/json' },
    body: {
      query,
      variables,
    },
  })

  if (response.errors?.length || response.data === undefined) {
    throw new Error(response.errors?.[0]?.message || 'Empty GraphQL response')
  }

  return response.data
}
