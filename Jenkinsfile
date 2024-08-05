pipeline {
    
    agent any 
    
    stages {
        stage('build') {
            steps {
                 script {
                     // Ensure Maven is in the PATH
                     bat 'mvn -v'  // Verify Maven installation
                     bat 'mvn clean install'  // Run the Maven build
                 }
            }
        }
        stage('package') {
            steps {
                script {
                    bat 'docker build .'
                }
            }
        }
    }
}


// pipeline {
//     agent any  // This will run on any available agent. Modify if you want to specify a particular node or label.

//     stages {
//         stage('Build') {
//             steps {
//                 script {
//                     // Ensure Maven is in the PATH
//                     bat 'mvn -v'  // Verify Maven installation
//                     bat 'mvn clean install'  // Run the Maven build
//                 }
//             }
//         }
//         stage('package') {
//             steps {
//                 script {
//                     bat 'docker build . '
//                 }
//             }
//         }
//     }

//     post {
//         success {
//             echo 'Build succeeded!'
//         }
//         failure {
//             echo 'Build failed.'
//         }
//         always {
//             archiveArtifacts artifacts: '**/target/*.jar', allowEmptyArchive: true
//         }
//     }
// }
