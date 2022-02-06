pipeline {
    agent any   
    stages {
        stage('Build') {
            steps {
                echo 'Building....'
                // git branch: 'main', credentialsId: 'git-key', url: 'git@github.com:TarasPetryk/clinic.git'
                git branch: 'dev', credentialsId: 'git-key', url: 'git@github.com:TarasPetryk/clinic.git'
                sh 'git log -1 --pretty=%B'
                // sh 'if [[ $(git log -1 --pretty=%B | cut -c1-1)  = [ && $(git log -1 --pretty=%B | wc -c)  > 05 ]] ; then git checkout main && git merge dev -m automerge && git push origin ; else echo error ; fi'
                // sh 'if [[ $(git log -1 --pretty=%B | cut -c1-1)  = [ && $(git log -1 --pretty=%B | wc -c)  > 05 ]] ; then echo 1; else echo 2 ; fi'
                echo 'Pre Script'
                 script {
                     env.commit_first_letter = sh (script: 'git log -1 --pretty=%B | cut -c1-1', returnStdout: true).trim()
                     env.commit_length = sh (script: 'git log -1 --pretty=%B | wc -c', returnStdout: true).trim()
        }
                echo 'message should be here'
                println commit_first_letter
                println commit_length
                echo 'Post Script'
                           }
        }
        stage("Tets commit") {
            steps{
                script {
                    if ( env.commit_first_letter == "U" && env.commit_length > 7 ) { println "worked"  }
                    else { sh "echo 1488" }
                }
                sh 'git branch'                
            }
        }
    }
}
