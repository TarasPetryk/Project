pipeline {
    agent { label 'docker-slave' }
    
    stages {
        stage('Build') {
            steps {
                git branch: 'main', credentialsId: 'github', url: 'git@github.com:TarasPetryk/clinic.git'                
                sh 'ls'
                sh 'pwd'
            }
        }
    }
}
