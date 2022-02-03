pipeline {
    agent any   
    stages {
        stage('Build') {
            steps {
                echo 'Building.'
                // git branch: 'main', credentialsId: 'git-key', url: 'git@github.com:TarasPetryk/clinic.git'
                git branch: 'dev', credentialsId: 'git-key', url: 'git@github.com:TarasPetryk/clinic.git'
                sh 'if [[ $(git log -1 --pretty=%B | cut -c1-1)  = [ && $(git log -1 --pretty=%B | wc -c)  > 10 ]] ; then echo 1; else echo "2 ; fi'
                sh 'ls -la'
                           }
        }        
    }
}
