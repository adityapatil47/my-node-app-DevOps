pipeline {
    agent any  // Use any available agent (not Docker-specific)

    environment {
        CI = 'true'
        SHELL = '/bin/sh'
        WORKSPACE = '/workspace/my-node-app'  // Custom Docker-compatible workspace path
    }

    stages {
        
        stage('Run Docker Commands') {
            steps {
                script {
                    // Running Docker directly with a custom command
                    sh '''
                        docker run --rm -d -p 3000:3000 -u root:root \
                        -v ${WORKSPACE}:/workspace/my-node-app \
                        my-node-app /bin/sh -c "
                            mkdir -p /workspace/my-node-app &&
                            cp -r . /workspace/my-node-app &&
                            cd /workspace/my-node-app &&
                            npm install &&
                            npm start
                        "
                    '''
                }
            }
        }
    }
}
