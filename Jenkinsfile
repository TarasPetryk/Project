pipeline {
    agent none
    
    stages {
        
        stage('CHECKOUT') {
            agent { label 'self'}
            steps {
                git branch: 'main', credentialsId: 'github', url: 'git@github.com:TarasPetryk/clinic.git'                
                sh 'ls'
                sh 'pwd'
            }
        }  
        
        stage('BUILD') {
            agent { label 'self'}
            steps {
                sh './mvnw package'
                sh 'ls'
            }
        }
        
    }
}
