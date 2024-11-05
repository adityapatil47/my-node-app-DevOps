pipeline {
    agent {
        docker {
            image 'node:22-alpine'
            args '-p 3000:3000 -u root:root'
        }
    }
    
    environment {
        CI = 'true'
        SHELL = '/bin/sh'
        // Define a Docker-compatible workspace path for your project
        DOCKER_WORKSPACE = '/workspace/my-node-app'
    }

    stages {
        
        stage('Install Dependencies') {
            steps {
                script {
                    // Use a Docker-compatible workspace path
                    sh '''
                        mkdir -p ${DOCKER_WORKSPACE}
                        cp -r . ${DOCKER_WORKSPACE}
                        cd ${DOCKER_WORKSPACE}
                        npm install
                    '''
                }
            }
        }

        // Uncomment the test stage when needed
        // stage('Test') {
        //     steps {
        //         sh 'npm test'
        //     }
        // }
        
        stage('Deploy') {
            steps {
                script {
                    sh '''
                        cd ${DOCKER_WORKSPACE}
                        
                        # Kill existing node process if running
                        pkill node || true
                        
                        # Start the application in background
                        nohup npm start > output.log 2>&1 &
                        
                        # Wait for app to start
                        sleep 5
                        
                        echo "Application deployed at http://localhost:3000"
                    '''
                }
            }
        }
    }
}
