# Deployment hello world application
 
## Context
 ##### Deployment hello world application through the CI / CD
 ##### Implementation of the security 

## Tools
   
- Cloud: GCP, (vm, gke, service account)
- Container Engine: Docker
- Source Code Management: Github
- Scheduling: Jenkins
- Security: Snyk, Sonarqube
- Notification: Slack

## Infrastructure

  We wanted to reproduce an enterprise-type infrastructure with 3 servers and GKE
  
 - A master server Jenkins scheduling build jobs, monitor the slaves
 - A build server(slave) to build our docker images, tests, and security scan of images
 - Google Kubernetes engine to deploy our web application which can be consumed of production.
 - Sonarqube server  Static Code Analysis

## Choice and description of tools

- Terraform  infrastructure as code tool used to automate infrastructure in cloud provider. it will help to prvision 3 servers(jenkins,nodebuild and sonarqube) and Google kubernetes Engine
- Using Docker to containerize hello world application
- Dockerhub: registry to store docker imges
- GKE used to deploy hello world application
- Slack collaborative platform used to notify us of the state of the pipeline

## Security:
- Snyk Image Scanner:
- Identify vulnerabilities 
- Sonarqube for code quality
       
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




