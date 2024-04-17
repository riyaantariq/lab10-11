pipeline {
    agent any
    
    environment {
        DOCKER_CREDENTIALS_ID = '777e72f2-96a7-4ea6-8c10-32401a1b398d'
        IMAGE_NAME = 'lab'
        DOCKERFILE_PATH = './Dockerfile'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'master', url: 'https://github.com/riyaantariq/lab10-11'
            }
        }

        stage('Dependency Installation') {
            steps {
                bat 'npm install'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    bat 'docker build -t lab .'
                }
            }
        }

        stage('Run Docker Image') {
            steps {
                script {
                    bat 'docker run -d -p 3000:30 lab'
                }
            }
        }

       
        }
    }
}
