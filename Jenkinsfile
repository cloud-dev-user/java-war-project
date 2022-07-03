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
                sh 'mvn deploy'
            }
        }
        stage(" deploy to tomcat " ) {
            steps {
                sh ' sudo cp /tmp/workspace/cicd-war-project/target/my-app.war /opt/tomcat/apache-tomcat-9.0.63/webapps/ '
            }
        }
    }
}
