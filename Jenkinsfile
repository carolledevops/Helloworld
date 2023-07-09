pipeline {
    agent {
     label ("node1")
            }
      environment {
       DOCKERHUB_ID = "carolledevops"
       IMAGE_NAME = "helloworld"
       IMAGE_TAG = "v1"  
       DOCKERHUB = credentials('dockerhub')
     }
  stages {
      stage('login to docker repository') {
       when {
          expression { GIT_BRANCH == 'origin/dev' }
        }
          steps {
             script {
               sh 'echo $DOCKERHUB | docker login -u $DOCKERHUB_ID --password-stdin'
             }
          }
      }
      stage('SonarQube analysis') {
        when {
          expression { GIT_BRANCH == 'origin/dev' }
         }
            agent {
                docker {
                  image 'sonarsource/sonar-scanner-cli:4.7.0'
                }
               }
               environment {
        CI = 'true'
        scannerHome='/opt/sonar-scanner'
       }   
            steps{
                withSonarQubeEnv('Sonar') {
                    sh "${scannerHome}/bin/sonar-scanner"
                }
            }
         }

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
           SCAN_RESULT-$(docker run --rm -e $SNYK_TOKEN -v /var/run/docker.sock:/var/run/docker.sock -v $(pwd):/app snyk/snyk:docker snyk test --docker ${DOCKERHUB_ID}/$IMAGE_NAME:$IMAGE_TAG --json
            echo"scan ended"
         '''
        }
    }
    stage('push docker image') {
     when {
          expression { GIT_BRANCH == 'origin/dev' }
        }
          steps {
             script {
               sh 'docker push $DOCKERHUB_ID/$IMAGE_NAME:$IMAGE_TAG '
             }
          }
     }
    stage("Deploy app in Pre-production Environment") {
        when {
          expression { GIT_BRANCH == 'origin/dev' }
            }
            steps {
                withKubeConfig(caCertificate: '', clusterName: '', contextName: '', credentialsId: 'gke_credential', namespace: '', serverUrl: '') {
                 sh "kubectl apply -f deployment.yml"
                }
            }
        }
	     
      
    stage("Deploy app in production Environment") {
       when {
          expression { GIT_BRANCH == 'origin/main' }
            }
            steps {
                withKubeConfig(caCertificate: '', clusterName: '', contextName: '', credentialsId: 'gke_credential', namespace: '', serverUrl: '') {
                 sh "kubectl apply -f deployment.yml"
                }
            }
          }
      post {
    always {
      script {
        notifyUpgrade(currentBuild.currentResult, "POST")
      }
    } 
  }    
 }
}
   
 