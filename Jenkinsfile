pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                echo "Build..."
                sh "docker-compose build"
            }
        }
        stage('Test') {
            steps {
                echo "Test..."
            }
        }
        stage('Deploy') {
            steps {
                echo "Deploy..."
                sh "docker-compose up -d"
            }
        }
    }
}