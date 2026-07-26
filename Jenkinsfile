# Jenkins: автопроверка линтеров на MR/PR
#
# Что сделать в Jenkins UI (один раз):
# 1. New Item → Multibranch Pipeline (или Organization Folder для GitHub/GitLab).
# 2. Branch Sources → GitHub / GitLab → указать репозиторий.
# 3. Discover Pull Requests / Merge Requests = merge + head (или только PR).
# 4. Build Configuration → Mode: by Jenkinsfile, Script Path: Jenkinsfile
# 5. Webhook:
#    - GitHub: Settings → Webhooks → Jenkins GitHub plugin URL
#    - GitLab: Settings → Webhooks → Merge request events
# 6. В GitHub/GitLab включи Status Checks / Pipeline must succeed перед merge.
#
# Локально:
#   npm run lint
#   npm run lint:js
#   npm run lint:css

pipeline {
  agent any

  options {
    timestamps()
    disableConcurrentBuilds()
    timeout(time: 30, unit: 'MINUTES')
    buildDiscarder(logRotator(numToKeepStr: '30'))
  }

  environment {
    CI = 'true'
    NODE_ENV = 'development'
  }

  stages {
    stage('Checkout') {
      steps {
        checkout scm
      }
    }

    stage('Node info') {
      steps {
        sh 'node -v && npm -v'
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

  post {
    success {
      echo 'Lint OK'
    }
    failure {
      echo 'Lint failed — исправь ESLint/Stylelint до мержа MR'
    }
    always {
      cleanWs(deleteDirs: true, notFailBuild: true)
    }
  }
}
