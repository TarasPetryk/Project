pipeline {
    agent none
    
    stages {
        
        stage('CHECKOUT') {
            agent { label 'self'}
            environment {
               VERSION = "1" 
                }
            steps {
                
                sh 'cat /var/lib/jenkins/workspace/var'
                sh 'echo "$(($(cat /var/lib/jenkins/workspace/var) + 1))" > /var/lib/jenkins/workspace/var '
                script {
                  env.VERS = "3"
                }                
                //def VERSION = sh 'cat /var/lib/jenkins/workspace/var'
                echo "Variable is ${VERS}"
                //git branch: 'main', credentialsId: 'github', url: 'git@github.com:TarasPetryk/clinic.git'                
                //sh 'ls'
                //sh 'pwd'
            }
        }  
        
        stage('BUILD') {
            agent { label 'self'}
            steps {
                //sh './mvnw package'
                sh 'echo Build'
                //sh 'rm -r *'
                //sh 'ls'
            }
        }
        
    }
}
