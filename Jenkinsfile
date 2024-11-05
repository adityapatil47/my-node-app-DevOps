pipeline {
    agent any  // Use any available agent (not Docker-specific)

    environment {
        CI = 'true'
        SHELL = 'cmd'  // Set shell to cmd for Windows
    }

    stages {
        
        stage('Run Docker Commands') {
            steps {
                script {
                    // Running Docker directly with a custom command
                    bat '''
                        docker run --rm -d -p 3000:3000 -u root:root -w /app \
                        -v "%WORKSPACE%:/app" \
                        node:22-alpine cmd /c "
                            npm install &&
                            npm start
                        "
                    '''
                }
            }
        }
    }
}
