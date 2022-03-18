pipeline {
    
    environment {
      DOCKERHUB_CREDENTIALS = credentials('dockerhub')
    }
    
    
    agent none
    //https://phoenixnap.com/kb/jenkins-environment-variables
    stages {
        
        stage('CHECKOUT') {
            agent { label 'self'}
            steps {
                git branch: 'main', credentialsId: 'github', url: 'git@github.com:TarasPetryk/clinic.git'  
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
                sh 'docker build -t taraspetryk/clinic:latest -t taraspetryk/clinic:v.${VERS} .'
            }
        }
        
        stage('deploy') {
            agent { label 'self'}
            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
                sh 'docker push taraspetryk/clinic:v.${VERS}'
                sh 'docker rmi $(docker images "taraspetryk/clinic" -a -q)'
            }
        }
        
    }
    
    post {   
      always {
       node('self') { 
         sh 'docker logout' 
         sh 'rm -r *'
       }  
      }
    }
    
}
