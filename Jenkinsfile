pipeline {
    agent none
    
    stages {
        
        stage('CHECKOUT') {
            agent { label 'self'}
            steps {
                sh 'cat /var/lib/jenkins/workspace/var'
                sh 'echo "$(($(cat var) + 1))"'
                //git branch: 'main', credentialsId: 'github', url: 'git@github.com:TarasPetryk/clinic.git'                
                //sh 'ls'
                //sh 'pwd'
            }
        }  
        
        stage('BUILD') {
            agent { label 'self'}
            steps {
                //sh './mvnw package'
                //sh 'ls'
                //sh 'rm -r *'
                //sh 'ls'
            }
        }
        
    }
}
