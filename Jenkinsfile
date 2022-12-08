pipeline {
    agent any
    stages {
        stage('build images'){
            steps {
                sh "chmod +x build-image.sh"
                sh "./build-image.sh"

            }
        }
        stage('Check images'){
            steps {
                script {
                    def res = sh "docker images | grep nodejs-mini"
                    if (res.contains("nodejs-mini")){
                        echo 'nodejs-mini image exists'
                        }
                    if (res2.contains("nginx-mini")){
                        echo 'nginx-mini image exists'
                        }
                    else {
                        currentBuild.result = 'ABORTED'
                        error("Aborting the build.")
                        }
                    }
                }        
            }
        }
    }