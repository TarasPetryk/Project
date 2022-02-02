pipeline {
    agent any   
    stages {
        stage('Build') {
            steps {
                echo 'Building.'
                git branch: 'main', credentialsId: 'git-key', url: 'git@github.com:TarasPetryk/clinic.git'
                           }
        }        
    }
}
