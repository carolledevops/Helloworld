pipeline {
    agent {
     label ("node1")
            }
      environment {
       DOCKERHUB_ID = "carolledevops"
       IMAGE_NAME = "helloworld"
       IMAGE_TAG = "v1"  
       CONTAINER_PORT = "8080"
       DOCKERHUB = credentials('dockerhub')
       HOST_PORT = "86"
     }
   agent none
  stages {
    stage('build image'){
      agent any
      steps {
        script {
         sh ' docker build --no-cache -f ./code-application/Dockerfile -t ${DOCKERHUB_ID}/$IMAGE_NAME:$IMAGE_TAG ./code-application/ '
       }
    }
   }
 stage('scan image snyk')
   agent any
      environment{
          SNYK_TOKEN = credentials('snyktoken')
     }
  steps{
    sh '''
    echo "starting image scan ..."
     SCAN_RESULT-$(docker run --rm -e SNYK_TOKEN=$SNYK_TOKEN -v /var/run/docker.sock:/var/run/docker.sock -v $(pwd):/app snyk/snyk:docker snyk test --docker ${DOCKERHUB_ID}/$IMAGE_NAME:$IMAGE_TAG --json
    echo"scan ended"
    '''
 }
}

 stage('Run container based on builded image') {
            agent any
            steps {
               script {
                 sh '''
                    echo "cleaning existing container if exist
                    docker ps -a | grep -i $IMAGE_NAME && docker rm -f ${IMAGE_NAME}
                    docker run --name ${IMAGE_NAME} -d -p ${APP_PORT}:CONTAINER_PORT ${DOCKERHUB_ID}/$IMAGE_NAME:$IMAGE_TAG 
                    sleep 5
                 '''
               }
            }
       }
  stage('Test image') {
           agent any
           steps {
              script {
                sh '''
                    curl -I http://${HOST_IP}:${APP_PORT} | grep -i "200"
                '''
              }
           }
      }
      stage('Clean Container') {
          agent any
          steps {
             script {
               sh '''
                 docker stop $IMAGE_NAME
                 docker rm $IMAGE_NAME
               '''
             }
          }
     }
  stage('Clean Container') {
          agent any
          steps {
             script {
               sh '''
                 echo $DOCKERHUB | docker login -u $DOCKERHUB_ID --password-stdin
                 docker push ${DOCKERHUB_ID/$IMAGE_NAME:$IMAGE_TAG
               '''
             }
          }
     }
}
