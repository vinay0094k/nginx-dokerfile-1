pipeline{
    agent any
    environment{
        IMAGE_NAME = "vinay0094k/my_nginx_img"
        DOCKER_CREDENTIALS_ID = "docker"
    }
    stages{
        stage('get scm'){
            steps{
                 git credentialsId: 'Github', url: 'https://github.com/vinay0094k/nginx-dokerfile-1.git'
            }
        }
        stage('build image'){
            steps{
                script{
                    dockerImage = dockerbuild('$IMAGE_NAME'+ ':$BUILD_NUMBER')
                }
            }
        }
        stage('push image'){
            steps{
                docker.withRegistry('','$DOCKER_CREDENTIALS_ID'){
                    dockerImage.push()
                }
                
            }
        }
        stage('clean/remove local image'){
            steps{
                sh 'docker rmi $IMAGE_NAME:$BUILD_NUMBER'
            }
        }
    }
}
