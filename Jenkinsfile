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
                git branch: 'main', url: 'https://github.com/riyaantariq/lab10-11'
            }
        }

        stage('Dependency Installation') {
            steps {
                sh 'npm install'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${IMAGE_NAME}:latest", "-f ${DOCKERFILE_PATH} .")
                }
            }
        }

        stage('Run Docker Image') {
            steps {
                script {
                    docker.image("${IMAGE_NAME}:latest").run("-d -p 8080:80")
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', DOCKER_CREDENTIALS_ID) {
                        docker.image("${IMAGE_NAME}:latest").push('latest')
                    }
                }
            }
        }
    }
}
