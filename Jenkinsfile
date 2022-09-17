pipeline {
  agent {
    node {
      label 'node_1.4'
    }

  }
  stages {
    stage('build code ') {
      steps {
        sh 'mvn clean package &&  cp target/my-app.war .'
      }
    }
    stage('Sonar analysis ') {
      steps {
        sh "export JAVA_HOME='/usr/lib/jvm/java-11-openjdk-11.0.15.0.10-2.el8_6.x86_64' && export PATH=$JAVA_HOME/bin:$PATH && mvn sonar:sonar -Dsonar.projectKey=war-project -Dsonar.login=sqa_d64e3d41717107fc2bd3f21c7480a64bd476eafe"
      }
    }

    stage('Create and push Docker image for sample app ') {
      steps {
        sh " curl -O https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.64/bin/apache-tomcat-9.0.64.tar.gz &&  sudo docker build -t  ${docker_registry_name}:${tag_name} .  && sudo docker push ${docker_registry_name}:${tag_name}"
      }
    }

    stage('deployment using docker image ') {
      steps {
        sh "sudo docker run -d -p ${docker_port}:8080 --name sampleapp-${tag_name} ${docker_registry_name}:${tag_name}"
      }
    }

  }
  environment {
    docker_registry_name = 'vishnu11/sample-app'
   
  }
  parameters {
    string(name: 'tag_name', defaultValue: '', description: ' this is tag given to docker image')
    string(name: 'docker_port', defaultValue: '', description: ' this is post give to newly created docker container')
  }
}
