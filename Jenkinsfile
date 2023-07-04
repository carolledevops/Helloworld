pipeline {
    agent {
     label ("node1")
            }
      environment {
       DOCKERHUB_ID = "carolledevops"
       IMAGE_NAME = "helloworld"
       IMAGE_TAG = "v1"  
       CONTAINER_PORT = "8081"
       DOCKERHUB = credentials('dockerhub')
       HOST_PORT = "80"
     }
    stages {
      stage("Build docker images") {
        when {
          expression { GIT_BRANCH == 'origin/dev' }
        }
        steps {
            script {
               sh ' docker build --no-cache -f code-application/Dockerfile -t ${DOCKERHUB_ID}/$IMAGE_NAME:$IMAGE_TAG ./code-application/ '
            }
        }
     }
     stage("scan docker images") {
        when {
          expression { GIT_BRANCH == 'origin/dev' }
        }
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
      when {
          expression { GIT_BRANCH == 'origin/dev' }
        }
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
      when {
          expression { GIT_BRANCH == 'origin/dev' }
        }
           steps {
              script {
                sh '''
                    curl -I http://${HOST_IP}:${APP_PORT} | grep -i "200"
                '''
              }
           }
      }
      stage('Clean Container') {
          when {
          expression { GIT_BRANCH == 'origin/dev' }
             }
          steps {
             script {
               sh '''
                 docker stop $IMAGE_NAME
                 docker rm $IMAGE_NAME
               '''
             }
          }
     }
  stage('push docker image') {
     when {
          expression { GIT_BRANCH == 'origin/dev' }
        }
          steps {
             script {
               sh '''
                 echo $DOCKERHUB | docker login -u $DOCKERHUB_ID --password-stdin
                 docker push $DOCKERHUB_ID/$IMAGE_NAME:$IMAGE_TAG
               '''
             }
          }
     }
    stage("Deploy app in Pre-production Environment") {
        when {
          expression { GIT_BRANCH == 'origin/dev' }
            }
            steps {
	        script {
	          withCredentials([
	            string(credentialsId: 'Githubtoken', variable: 'TOKEN')
	          ]) {

	            sh '''
                  rm -rf helm-chart || true 
                  git clone https://carolledevops:$TOKEN@github.com/carolledevops/helm-chart.git
                  cd helm-chart
      cat << EOF > test-values.yaml
         repository:
         tag:   hello-$IMAGE_TAG
         assets:
          image: carolledevops/helloworld
  EOF
  git config --global user.name "carolledevops"
  git config --global user.email "carolledevops@yahoo.com"
   cat  test-values.yaml
   git add -A 
    git commit -m "Change from JENKINS" 
    git push  https://carolledevops:$TOKEN@github.com/carolledevops/helm-chart.git
	  '''
	          }

	        }
      }
    }
stage("Deploy app in production Environment") {
        when {
          expression { GIT_BRANCH == 'origin/main' }
            }
            steps {
	        script {
	          withCredentials([
	            string(credentialsId: 'Githubtoken', variable: 'TOKEN')
	          ]) {

	            sh '''
                  rm -rf helm-chart || true 
                  git clone https://carolledevops:$TOKEN@github.com/carolledevops/helm-chart.git
                  cd helm-chart
      cat << EOF > prod-values.yaml
         repository:
         tag:   hello-$IMAGE_TAG
         assets:
          image: carolledevops/helloworld
  EOF
  git config --global user.name "carolledevops"
  git config --global user.email "carolledevops@yahoo.com"
   cat  prod-values.yaml
   git add -A 
    git commit -m "Change from JENKINS" 
    git push  https://carolledevops:$TOKEN@github.com/carolledevops/helm-chart.git
	            '''
	          }

	        }
        }
    }
  }
}

