pipeline {
    agent any   
    stages {
        stage('Build') {
            steps {
                echo 'Building.....'
                // git branch: 'main', credentialsId: 'git-key', url: 'git@github.com:TarasPetryk/clinic.git'
                git branch: 'dev', credentialsId: 'git-key', url: 'git@github.com:TarasPetryk/clinic.git'
                 script { 
                     env.commit_first_letter = sh (script: 'git log -1 --pretty=%B | cut -c1-1', returnStdout: true).trim()
                     env.commit_length = sh (script: 'git log -1 --pretty=%B | wc -c', returnStdout: true).trim()
        }
                
                           }
        }
        stage("Lint Dockerfile") {
            steps{
                bat """
                    set OutputFolderName=%date:~12,2%%date:~4,2%%date:~7,2%_%time:~0,2%%time:~3,2%%time:~6,2%
                    touch /home/jenkins/share/%OutputFolderName%
                    """
                sh 'touch /home/jenkuns/share/$(env.log_name)'
                sh 'hadolint Dockerfile > output || :'
                sh 'cat output'
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
