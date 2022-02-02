pipeline {
    agent any   
    environment {
       // replace xyz with the copy pasted iD
       GitHubUser = credentials('git-key')  
   }
    stages {
        stage('Build') {
            steps {
                echo 'Building..'
                echo $GitHubUser
                           }
        }        
    }
}
