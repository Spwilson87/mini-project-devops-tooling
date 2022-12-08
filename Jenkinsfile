pipeline {
    agent any
environment {     
    DOCKERHUB_CREDENTIALS= credentials('dockerhub')     
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
        stage('Login to Docker Hub') {      	
            steps{                       	
	            sh 'echo $DOCKERHUB_CREDENTIALS_PSW | sudo docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'                		
	            echo 'Login Completed'      
    }           
}   
        stage('Push Image to Docker Hub') {         
            steps{                            
                sh 'docker push spwilson87/nodejs-mini:latest'           
                echo 'Push Image Completed'       
                sh 'docker push spwilson87/nginx-mini:latest'           
                echo 'Push Image Completed'                      
    }            
}  
                    }
                }        
            }
        }
    }