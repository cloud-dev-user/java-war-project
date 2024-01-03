pipeline{
                 agent any 

                 stages {
                               stage (" checkout my code " ) { 
                                   steps { 
                                               sh " git clone https://github.com/cloud-dev-user/java-war-project.git"
                                        }
                                     }
                                 stage(" build my code") {
                                   steps{
                                            sh " cd java-war-project && mvn package" 
                                          }
                                     }
                                }
                }
