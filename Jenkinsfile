pipeline {
    agent any
    environment { 
        reg1 = "spwilson87/nodejs-mini"
        reg2 = "spwilson87/nginx-mini" 
        regCred = 'dockerhub1'
        image1 = "nodejs-mini:latest"
        image2 = "nginx-mini:latest"
    }
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
                    res = sh(returnStdout: true, script: "docker images | grep nodejs-mini")
                    if (res.contains("nodejs-mini")){
                        echo 'nodejs-mini image exists'
                        }
                    else {
                        currentBuild.result = 'ABORTED'
                        error("Aborting nodejs-mini image does not exist.")
                        }
                    res2 = sh(returnStdout: true, script: "docker images | grep nginx-mini")
                    if (res2.contains("nginx-mini")){
                        echo 'nginx-mini image exists'
                        }
                    else {
                        currentBuild.result = 'ABORTED'
                        error("Aborting nginx-mini image does not exist.")
                        }
        stage('Push to DockerHub'){
            steps {
                script{
                    docker.withRegistry( '', registryCredential ){
                        dockerImage1.push()
                        dockerImage2.push()
                    }
                }

            }
        }
	post {
		always {
			sh 'docker logout'
		}
	}
                    }
                }        
            }
        }