pipeline {
    agent {
        docker {
            image 'jen'
            args '-p 3000:3000 -p 5000:5000' 
        }
    }    
    stages {
        stage('Build') {
            steps {
                sh 'echo "build"'
            }
        }
        stage('Test') {
            steps {
                sh 'echo "test"'
            }
        }
    }
}
