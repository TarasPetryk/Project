pipeline {
    agent { label 'docker-slave' }
    
    stages {
        
        stage('CHECKOUT') {
            steps {
                git branch: 'main', credentialsId: 'github', url: 'git@github.com:TarasPetryk/clinic.git'                
                sh 'ls'
                sh 'pwd'
            }
        }  
        
        stage('BUILD') {
            steps {
                sh './mvnw package'
                sh 'ls'
            }
        }
        
    }
}
