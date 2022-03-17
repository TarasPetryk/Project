pipeline {
    
    environment {
      DOCKERHUB_CREDENTIALS = credentials('dockerhub')
    }
    
    
    agent none
    //https://phoenixnap.com/kb/jenkins-environment-variables
    stages {
        
        stage('CHECKOUT') {
            agent { label 'self'}
            environment {
               VERSION = "1" 
                }
            steps {
                
                //sh 'cat /var/lib/jenkins/workspace/var'
                            
                //def VERSION = sh 'cat /var/lib/jenkins/workspace/var'
                //echo "Variable is ${VERS}"
                git branch: 'main', credentialsId: 'github', url: 'git@github.com:TarasPetryk/clinic.git'                
                //sh 'ls'
                //sh 'pwd'
            }
        }  
        
        stage('CREATE ARTIFACT') {
            agent { label 'self'}
            steps {
                sh 'echo "$(($(cat /var/lib/jenkins/workspace/var) + 1))" > /var/lib/jenkins/workspace/var '
                script {
                  env.VERS = sh (script: 'cat /var/lib/jenkins/workspace/var', returnStdout: true).trim()
                }    
                //sh './mvnw package'
                sh 'docker build -t taraspetryk/clinic:v.${VERS} .'
                //sh 'echo Build'
                sh 'rm -r *'
                //sh 'docker rmi $(docker images | grep 'taraspetryk/clinic')'
            }
        }
        
        stage('deploy') {
            agent { label 'self'}
            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
                sh 'docker push taraspetryk/clinic:v.${VERS}'
                sh 'docker rmi $(docker images | grep 'taraspetryk/clinic')'
            }
        }
        
    }
    
    post {   
     always {
     node('self') { sh 'docker logout' }
   }
  }
    
}
