pipeline {
    agent { label "node_1.3" 
    }
    stages {
        stage ("Checkout code from github repository") {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/feature/cicdautomation']], extensions: [], userRemoteConfigs: [[credentialsId: 'git-cloud-dev', url: 'https://github.com/cloud-dev-user/java-war-project.git']]])
            }
        }
        stage(" Build code for war file generation") {
            steps {
                sh 'mvn install'
            }
        }
    }
}
