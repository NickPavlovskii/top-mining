import type { Server as HttpServer } from 'node:http'

import type { StorybookConfig } from '@storybook-vue/nuxt'
import type { Plugin } from 'vite'
import { mergeConfig } from 'vite'

/** Must match `storybook dev -p …`. */
function storybookHttpPort(): number {
  const argv = process.argv
  const flagIndex = argv.findIndex((arg) => arg === '-p' || arg === '--port')
  if (flagIndex >= 0) {
    const value = Number(argv[flagIndex + 1])
    if (Number.isFinite(value) && value > 0) return value
  }
  return 6007
}

/**
 * Storybook sets `hmr: { port, server }` then re-runs viteFinal. Nuxt’s merge
 * can leave `server.hmr === false`; Vite’s client-inject then does
 * `port ||= 24678` in middleware mode → "WebSocket closed without opened".
 */
function restoreStorybookHmr(
  httpPort: number,
  getServer: () => HttpServer | undefined,
): Plugin {
  const apply = (target: { hmr?: boolean | object | undefined }) => {
    target.hmr = {
      protocol: 'ws',
      host: 'localhost',
      port: httpPort,
      clientPort: httpPort,
      ...(getServer() ? { server: getServer() } : {}),
    }
  }

  return {
    name: 'top-mining:restore-storybook-hmr',
    enforce: 'post',
    config(config) {
      config.server = config.server ?? {}
      apply(config.server)
      return {
        server: {
          allowedHosts: true,
          hmr: config.server.hmr,
        },
      }
    },
    configResolved(resolved) {
      apply(resolved.server)
    },
    configureServer(server) {
      apply(server.config.server)
      const hmr = server.config.server.hmr
      if (hmr && typeof hmr === 'object' && !hmr.server && server.httpServer) {
        hmr.server = server.httpServer
      }
    },
  }
}

const config: StorybookConfig = {
  stories: ['../stories/**/*.stories.ts'],
  addons: ['@storybook/addon-docs'],
  framework: {
    name: '@storybook-vue/nuxt',
    options: {},
  },
  docs: {
    autodocs: 'tag',
    defaultName: 'Документация',
  },
  staticDirs: ['../public'],
  async viteFinal(config) {
    const httpPort = storybookHttpPort()

    const storybookHmrServer: HttpServer | undefined =
      config.server?.hmr &&
      typeof config.server.hmr === 'object' &&
      'server' in config.server.hmr
        ? (config.server.hmr.server as HttpServer | undefined)
        : undefined

    return mergeConfig(config, {
      plugins: [
        restoreStorybookHmr(httpPort, () => storybookHmrServer),
      ],
      resolve: {
        dedupe: ['vue', 'react', 'react-dom', '@mdx-js/react'],
      },
      optimizeDeps: {
        include: ['react', 'react-dom', '@mdx-js/react'],
      },
      server: {
        allowedHosts: true,
        watch: {
          ignored: ['**/.nuxt/**', '**/storybook-static/**'],
        },
        hmr: {
          protocol: 'ws',
          host: 'localhost',
          port: httpPort,
          clientPort: httpPort,
          ...(storybookHmrServer ? { server: storybookHmrServer } : {}),
        },
      },
    })
  },
}

export default config
