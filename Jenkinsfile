pipeline {
    agent any  // Use any available agent (not Docker-specific)

    environment {
        CI = 'true'
        SHELL = '/bin/sh'
    }

    stages {
        
        stage('Run Docker Commands') {
            steps {
                script {
                    // Running Docker directly with a custom command
                    sh '''
                        docker run --rm -d -p 3000:3000 -u root:root \
                        node:22-alpine /bin/sh -c "
                            cd /app &&
                            npm install &&
                            npm start
                        "
                    '''
                }
            }
        }
    }
}
