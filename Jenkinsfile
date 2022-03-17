pipeline {
    agent none
    
    stages {
        
        stage('CHECKOUT') {
            agent { label 'self'}
            steps {
                sh 'cat /var/lib/jenkins/workspace/var'
                sh 'echo "$(($(cat /var/lib/jenkins/workspace/var) + 1))" /var/lib/jenkins/workspace/var> '
                sh 'cat /var/lib/jenkins/workspace/var'
                VERSION = sh 'cat /var/lib/jenkins/workspace/var'
                echo "Variable is ${VERSION}"
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
