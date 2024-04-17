pipeline {
    agent any

    stages {
       stage('Checkout') {
    steps {
        git branch: 'main', url: 'https://github.com/riyaantariq/lab10-11'
    }
        stage('Dependency Installation') {
            steps {
                sh 'npm install' // Assuming npm is used for dependency installation
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build('lab:tag') // Replace 'your-image-name:tag' with your actual image name and tag
                }
            }
        }
        stage('Run Docker Image') {
            steps {
                script {
                    docker.image('lab:tag').run('-d -p 8080:80') // Replace 'your-image-name:tag' with your actual image name and tag
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'credentials-id-for-docker-hub') {
                        docker.image('lab:tag').push('latest') // Replace 'your-image-name:tag' with your actual image name and tag
                    }
                }
            }
        }
    }
}
