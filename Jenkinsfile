pipeline {
    agent any   
    stages {
        stage('Build') {
            steps {
                echo 'Building...'
                // git branch: 'main', credentialsId: 'git-key', url: 'git@github.com:TarasPetryk/clinic.git'
                git branch: 'dev', credentialsId: 'git-key', url: 'git@github.com:TarasPetryk/clinic.git'
                sh 'git log -1 --pretty=%B'
                // sh 'if [[ $(git log -1 --pretty=%B | cut -c1-1)  = [ && $(git log -1 --pretty=%B | wc -c)  > 05 ]] ; then git checkout main && git merge dev -m automerge && git push origin ; else echo error ; fi'
                sh 'if [[ $(git log -1 --pretty=%B | cut -c1-1)  = [ && $(git log -1 --pretty=%B | wc -c)  > 05 ]] ; then echo 1; else echo 2 ; fi'
                sh 'git branch'
                           }
        }        
    }
}
