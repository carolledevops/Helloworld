 # Deployment hello world application
 
## Context
 #####  Deployment of hello world application through the CI / CD
 ##### Implementation of the security aspect

## Tools
   
##### Cloud: GCP, (vm, gke, service account)
##### Container Engine: Docker
##### Source Code Management: Github
##### Scheduling: Jenkins
##### Security: Snyk
##### Deployment ArgoCD, helm
##### Notification: Slack

## Infrastructure

  We wanted to reproduce an enterprise-type infrastructure with 2 servers and GKE
##### A master server Jenkins
##### A build server to build our docker images, tests, and security scan of images
##### Google Kubernetes engine to deploy our web application which can be consumed of production.
### Choice and description of tools
### DevOps:
##### Infrastructure deployed on the GCP cloud provider thanks to Terraform and gcloud 
##### Using Docker to containerize hello world application 
##### Helm chart package manager 
##### Deployment of hello world on GKE thanks to Argocd
##### Implementation of a Gitflow to respect good practices. Creation of two branches:
##### The “master” branch which will be used only to deploy our application in production,
##### The “dev” branch will be used to develop the functionalities and carry out the tests.
##### Pull request to merge the “dev” branch on the “master” branch
##### 	Use of Jenkins to orchestrate all stages and set up several pipelines.
##### 	Use notification space on the Slack collaborative platform and email to notify us of the state of the pipeline.
## Security:
##### Snyk Image Scanner:
###### Identify vulnerabilities in built images (cve-
##### Sonarqube for code quality
       
        
  

## Workflow
#####   Continuous Integration and delivery
###### Developer makes a modification to the code and pushes it on GitHub
##### Thanks to the webhook, the modification is received on the Jenkins server, and the build of the project can begin and a notification is sent to slack.
##### #Syntax checks will be done (unit tests)
##### We will have the build of the docker images and pushed on the private registry. 
##### Deployment in a test environment (pre-production) can begin by pulling images from the private register and a notification is sent to slack.
##### The modification validated by the development team; a PR will be carried out in order to share the modification to the Operational (Ops)
##### After validation by the whole team, the Ops manager can make the merger request in order to pass the modification on the main branch.
##### Deployment in production environment will then be activated and a notification is sent to slack
##### Once the application is deployed Kubernetes cluster via ArgoCD and helm chart, a user will be able to connect and consume the application.

## Installation tools
 #####   Install Terraform on Windows:  https://www.terraform.io/downloads.html
 ##### Installer le SDK Cloud:  https://cloud.google.com/sdk/docs/install
 ##### Create Google account: https://cloud.google.com/docs/get-started 
 ##### Create un service account on GCP: https://cloud.google.com/iam/docs/service-accounts-create

## NB: After creating a service account, you will download a .json file necessary for any application (terraform, Gcloud) connected to your account to deploy the resources.
Using terraform to provision resource in GCP compute network, subnetwork, firewall and two compute instances
best practise
   one server jenkins controller
   second server to execute the job
using Gcloud to provision GKE in GCP.
##### install jenkins  https://www.jenkins.io/doc/book/installing/linux/
##### install argocd https://argo-cd.readthedocs.io/en/stable/operator-manual/installation/




