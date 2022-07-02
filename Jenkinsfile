pipeline {
  agent {
    node {
      label 'node_1.3'
    }

  }
  stages {
    stage('build code ') {
      steps {
        sh 'mvn package'
      }
    }

    stage('Scan code ') {
      steps {
        echo 'Code scan is successful '
      }
    }

    stage('deployment') {
      steps {
        echo 'Deployment is successful '
      }
    }

  }
  environment {
    java_home = '/opt/jdk'
  }
}
