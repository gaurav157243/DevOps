pipeline {
    agent any

    environment {
        GIT_REPO = 'https://github.com/gaurav157243/devops.git'
        BRANCH = 'main'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: "${BRANCH}", url: "${GIT_REPO}"
            }
        }
        stage('Build') {
            steps {
                mvn clean install
            }
        }
        stage('Test') {
            steps {
                echo "running test"
            }
        }
    }
}
