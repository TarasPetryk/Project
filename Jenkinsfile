pipeline {
    agent any   
    stages {
        stage('Build') {
            steps {
                echo 'Building...'
                // git branch: 'main', credentialsId: 'git-key', url: 'git@github.com:TarasPetryk/clinic.git'
                git branch: 'dev', credentialsId: 'git-key', url: 'git@github.com:TarasPetryk/clinic.git'
                 script { 
                     env.commit_first_letter = sh (script: 'git log -1 --pretty=%B | cut -c1-1', returnStdout: true).trim()
                     env.commit_length = sh (script: 'git log -1 --pretty=%B | wc -c', returnStdout: true).trim()
                     currentDate = sh(returnStdout: true, script: 'date +%Y-%m-%d').trim()
        }
                
                           }
        }
        stage("Lint Dockerfile") {
            steps{                
                sh '''                    
                    touch /home/jenkins/share/$currentDate
                    '''
                sh 'hadolint Dockerfile > output || :'
                sh 'echo $currentDate'
                sh 'ls /home/jenkins/share'
            }
        }
        stage("Test commit message") {
            steps{
                script {
                    if ( env.commit_first_letter == "[" && env.commit_length.toInteger()>7 ) { println "good comment"  }
                    else { println "bad comment"  }
                }
                sh 'git branch'                
            }
        }
    }
}
