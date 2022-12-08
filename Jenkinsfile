pipeline {
    agent any
	environment {
		DOCKERHUB_CREDENTIALS=credentials('dockerhub1')
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
                }
            }
        }
		stage('dockerHub Login') {

			steps {
				sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
			}
		}

		stage('DockerHub Push') {

			steps {
				sh 'docker push spwilson87/nodejs-mini:latest'
			}
		}
	}
        stage('ssh to eks control'){
            steps {
                sh "ssh ubuntu@13.42.22.112"
                sh "ls"
                script {
                    res = sh(returnStdout: true, script: "ls | grep k8s-files")
                    if (res.contains("k8s-files")){
                        echo 'ssh successful'
                        }
                    else {
                        currentBuild.result = 'ABORTED'
                        error("Aborting ssh unsuccessful.")

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
