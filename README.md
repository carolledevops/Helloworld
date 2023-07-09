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
- Jenkins is an open-source automation server that facilitates continuous integration (CI) and continuous delivery (CD) of software projects. It enables developers to 
   automate various stages of the software development lifecycle, including building, testing, and deploying applications
- Using Docker to containerize hello world application
- Dockerhub: registry to store docker imges
- GKE used to deploy hello world application
- Slack collaborative platform used to notify us of the state of the pipeline
- SonarQube is an open-source platform developed by SonarSource for continuous inspection of code quality. SonarQube does static code analysis, which provides a detailed 
  report of bugs, code smells, vulnerabilities, code duplications.
  

## Security:
- Snyk Image Scanner:
- Identify vulnerabilities 
- Sonarqube for code quality

## Installation tools
- Install Terraform on Windows or linux:  https://www.terraform.io/downloads.html
- Installer SDK Cloud:  https://cloud.google.com/sdk/docs/install
- Create Google account: https://cloud.google.com/docs/get-started 
- Create un service account on GCP: https://cloud.google.com/iam/docs/service-accounts-create
- install jenkins  https://www.jenkins.io/doc/book/installing/linux/
- install sonarqube https://docs.sonarsource.com/sonarqube/latest/setup-and-upgrade/install-the-server/

## NB: After creating a service account, you will download a .json file necessary for any application (terraform, Gcloud) connected to your account to deploy the resources.
Using terraform to provision resource in GCP compute network, subnetwork, firewall and two compute instances

## Connection of tools
we need to connect the tools 





       
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






