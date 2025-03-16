// pipeline {
//     agent any
    
//     stages {
//         stage('Checkout') {
//             steps {
//                 checkout scm
//             }
//         }
//         stage('Build') {
//             steps {
//                 sh '/opt/homebrew/bin/mvn clean package'
//             }
//         }
//         stage('Archive') {
//             steps {
//                 archiveArtifacts artifacts: 'target/*.war', followSymlinks: false
//             }
//         }
//     }
//     post {
//             success {
//             echo 'Build successful! The WAR file is ready for deployment.'
//             }
//             failure {
//                 echo 'Build failed! Please check the logs for details.'
//         }
//     } 
// }


pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                sh '/opt/homebrew/bin/mvn clean package'
            }
        }

        stage('Archive') {
            steps {
                archiveArtifacts artifacts: 'target/*.war', followSymlinks: false
            }
        }

        stage('log path') {
            steps {
                sh 'PATH=/usr/local/bin/docker:$PATH'
            }
        }

        stage('Docker Login') {
            steps {
                sh 'echo ${DOCKER_USERNAME}'
                
                withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials',
                                              passwordVariable: 'DOCKER_PASSWORD',
                                              usernameVariable: 'DOCKER_USERNAME')]) {
                    sh 'echo ${DOCKER_PASSWORD} | docker login -u ${DOCKER_USERNAME} --password-stdin'
                }
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t shreejana012/webapp:latest .'
            }
        }

        stage('Docker Push') {
            steps {
                sh 'docker push shreejana012/webapp:latest'
            }
        }
    }

    post {
        success {
            echo 'Build successful! The WAR file is ready for deployment.'
        }
        failure {
            echo 'Build failed! Please check the logs for details.'
        }
        always {
            sh 'docker logout'
        }
    }
}