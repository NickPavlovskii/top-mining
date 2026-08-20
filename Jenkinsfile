// Jenkins CI/CD: lint → unit → e2e → build → deploy (Netlify + Render)
//
// === Один раз в Jenkins UI ===
// 1. Plugins: Pipeline, Multibranch Pipeline, GitHub/GitLab Branch Source,
//    Credentials Binding, NodeJS (опционально), Pipeline Utility Steps.
// 2. Manage Jenkins → Tools:
//    - NodeJS 22.x (имя ниже должно совпасть с tools.nodejs)
//    - Go 1.22+ (или поставьте go на агент вручную)
// 3. Credentials (Secret text / Username with password):
//    - netlify-auth-token     → NETLIFY_AUTH_TOKEN
//    - netlify-site-id        → NETLIFY_SITE_ID
//    - render-deploy-hook     → RENDER_DEPLOY_HOOK_URL  (Deploy Hook из Render)
// 4. New Item → Multibranch Pipeline → Branch Sources (GitHub/GitLab),
//    Script Path: Jenkinsfile, Discover PRs/MRs.
// 5. Webhook репозитория → Jenkins (Push + PR/MR events).
// 6. В GitHub/GitLab: required status check перед merge.
//
// Deploy только с веток main/master после зелёного CI.
// Агент: Linux с bash (sh). На Windows-агенте замените sh на bat / используйте Docker agent.

pipeline {
  agent any

  options {
    timestamps()
    disableConcurrentBuilds()
    timeout(time: 90, unit: 'MINUTES')
    buildDiscarder(logRotator(numToKeepStr: '30'))
  }

  tools {
    // Имя из Manage Jenkins → Tools → NodeJS installations
    nodejs 'NodeJS 22'
  }

  environment {
    CI = 'true'
    NODE_ENV = 'development'
    PLAYWRIGHT_BROWSERS_PATH = "${WORKSPACE}/.pw-browsers"
    // Публичный URL GraphQL на Render (подставьте свой; можно переопределить в job)
    CATALOG_GRAPHQL_URL = "${env.CATALOG_GRAPHQL_URL ?: 'https://YOUR-RENDER-SERVICE.onrender.com/graphql'}"
  }

  stages {
    stage('Checkout') {
      steps {
        checkout scm
      }
    }

    stage('Toolchain') {
      steps {
        sh '''
          set -e
          node -v
          npm -v
          command -v go >/dev/null && go version || echo "Go not on PATH — backend build stage will fail until Go is installed"
        '''
      }
    }

    stage('Install') {
      steps {
        sh 'npm ci'
      }
    }

    stage('Prepare Nuxt') {
      steps {
        sh 'npx nuxt prepare'
      }
    }

    stage('Lint') {
      parallel {
        stage('ESLint') {
          steps {
            sh 'npm run lint:js'
          }
        }
        stage('Stylelint') {
          steps {
            sh 'npm run lint:css'
          }
        }
      }
    }

    stage('Unit tests') {
      steps {
        sh 'npm run test:run'
      }
    }

    stage('Backend check') {
      steps {
        dir('backend') {
          sh '''
            set -e
            go mod download
            go test ./...
            go build -o /tmp/niklad-server ./cmd/server
          '''
        }
      }
    }

    stage('E2E setup') {
      steps {
        sh 'npx playwright install --with-deps chromium'
      }
    }

    stage('E2E') {
      steps {
        sh 'npm run test:e2e'
      }
      post {
        always {
          junit allowEmptyResults: true, testResults: 'test-results/junit.xml'
          archiveArtifacts artifacts: 'playwright-report/**,test-results/**', allowEmptyArchive: true
        }
      }
    }

    stage('Build frontend') {
      steps {
        sh '''
          set -e
          export NITRO_PRESET=netlify
          npm run build
        '''
      }
    }

    stage('Deploy Netlify') {
      when {
        anyOf {
          branch 'main'
          branch 'master'
        }
      }
      environment {
        NETLIFY_AUTH_TOKEN = credentials('netlify-auth-token')
        NETLIFY_SITE_ID = credentials('netlify-site-id')
      }
      steps {
        sh '''
          set -e
          npx --yes netlify-cli deploy --prod --dir=.output/public --message "jenkins ${BUILD_NUMBER} ${GIT_COMMIT}"
        '''
      }
    }

    stage('Deploy Render') {
      when {
        anyOf {
          branch 'main'
          branch 'master'
        }
      }
      environment {
        RENDER_DEPLOY_HOOK_URL = credentials('render-deploy-hook')
      }
      steps {
        sh '''
          set -e
          echo "Trigger Render deploy hook..."
          curl -fsS -X POST "$RENDER_DEPLOY_HOOK_URL"
          echo
        '''
      }
    }
  }

  post {
    success {
      echo 'CI OK'
    }
    failure {
      echo 'CI failed — смотри логи стадий Lint / Unit / Backend / E2E / Build'
    }
    always {
      cleanWs(deleteDirs: true, notFailBuild: true)
    }
  }
}
