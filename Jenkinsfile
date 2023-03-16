pipeline {
  agent none
  parameters { string(name: 'jfrog_user', defaultValue: '', description: ' this is user name for jfrog') 
               string(name: 'jfrog_pass', defaultValue: '', description: ' this is password for jfrog') }
  environment {
                MVN_HOME = "/home/rocky/maven3.9"
                     
            }
  
  stages {
    
    stage('build code and push code to artifact repo ') {
      agent { label 'devops' }
      steps {
        sh "export PATH=$PATH:${env.MVN_HOME}/bin && mvn clean deploy"
      }
    }
    
    stage('deployment on tomcat') {
      agent { label 'tomcat-deploy' }
      steps {
        sh """
             wget --http-user=${jfrog_user}  --http-password=${jfrog_pass} https://devops400.jfrog.io/artifactory/devops/com/mycompany/app/my-app-ravi/2.0/my-app-ravi-2.0.war
             mv my-app-ravi-2.0.war my-app-ravi.war
             cp my-app-ravi.war /home/rocky/tomcat/tomcat9/webapps/
          """
      }
    }
  }
  }
