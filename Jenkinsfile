pipeline {
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
        
        stage('BUILD') {
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
                //sh 'ls'
            }
        }
        
    }
}
