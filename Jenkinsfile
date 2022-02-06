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
        }
                
                           }
        }
        stage("Lint Dockerfile") {
            steps{                
                sh ''' 
                    file_name=$(date +"%Y_%m_%d_%I_%M_%p").log
                    touch /home/jenkins/share/$file_name
                    '''
                sh 'hadolint Dockerfile > output || :'
                sh 'echo $file_name'
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
