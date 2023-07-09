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
- Snyk is a popular developer-first security platform that helps developers find and fix vulnerabilities in their open-source dependencies and container images.Here are 
  some key
    1. Dependency scanning
    2. Container image scanning
    3. Fix suggestions and remediation
- GKE used to deploy hello world application
- Slack collaborative platform used to notify us of the state of the pipeline
- SonarQube is an open-source platform developed by SonarSource for continuous inspection of code quality. SonarQube does static code analysis, which provides a detailed 
  report of bugs, code smells, vulnerabilities, code duplications.

## Installation tools
- Install Terraform on Windows or linux:  https://www.terraform.io/downloads.html
- Installer SDK Cloud:  https://cloud.google.com/sdk/docs/install
- Create Google account: https://cloud.google.com/docs/get-started 
- Create un service account on GCP: https://cloud.google.com/iam/docs/service-accounts-create
- install jenkins  https://www.jenkins.io/doc/book/installing/linux/
- install sonarqube https://docs.sonarsource.com/sonarqube/latest/setup-and-upgrade/install-the-server/
- create snyk account https://snyk.io/
- Create dockerhub account: https://hub.docker.com/

### NB: After creating a service account, you will download a .json file necessary for any application (terraform, Gcloud) connected to your account to deploy the resources.
Using terraform to provision resource in GCP compute network, subnetwork, firewall and two compute instances
### Automate infrastructure with terraform (Jenkins and sonarqube server, gke) the code is here  https://github.com/carolledevops/Helloworld.git
We provide service account to terraforn, it use that to authenticate to gcp and provision infrastructure
### network
![Screenshot (348)](https://github.com/carolledevops/Helloworld/assets/138341326/4e0b761d-b9fb-4f89-8d53-d7edd0005cd1)
### cluster gke
![Screenshot (346)](https://github.com/carolledevops/Helloworld/assets/138341326/f7c3df53-a58b-4d04-9f70-186976d7bce8)
### servers
![Screenshot (347)](https://github.com/carolledevops/Helloworld/assets/138341326/62e645d3-5d31-4831-be5a-5ff908dc0713)
## Connection of tools

we need to connect the tools 
after installing the tools, we need to connect
jenkins: ip:8080
sonarqube: ip:9000
jenkins to authenticate or communicate with tools, we need to integre plugins(jenkins is collection of plugin) and provide credentials of each tools to jenkins
plugins that we need to integrate plugins ( sonarqube scanner, slack notification, docker, snyk security plugin, gke plugin, github integration etc) integrate plugins on jenkins  go to
## manage jenkins - plugins - available plugins and integrate the plugins that you need
### Now we need to generate token
# sonarqube 
    go to  account - security - generate token
# snyk 
 we need to generate token: 
 #### account setting  
![Screenshot (344)](https://github.com/carolledevops/Helloworld/assets/138341326/71d6f99c-b543-4b2d-a05a-c0621576968e)
#### generate token
![Screenshot (345)](https://github.com/carolledevops/Helloworld/assets/138341326/fa4281a8-fbfe-4f9d-9cfe-14656d257520)

# slack( generate token)
after create your account, you provide your workspace my workspace here is devops and that workspace, create your channel mine is #develop
 on devops, you select 
##### settings $ administration - manage app
![Screenshot (339)](https://github.com/carolledevops/Helloworld/assets/138341326/70248cc8-b125-487c-9f4a-52293be49818)
##### put the apps jenkins
![Screenshot (340)](https://github.com/carolledevops/Helloworld/assets/138341326/88f51941-777b-4bf9-863c-0fe5dcfcd842)
##### click on add jenkins
![Screenshot (341)](https://github.com/carolledevops/Helloworld/assets/138341326/ea13c1fe-bd2b-458c-810f-ddf364814b10)
##### select your channel
![Screenshot (342)](https://github.com/carolledevops/Helloworld/assets/138341326/75769d9f-a661-4387-8a40-ff865e23fdaf)
##### slack with provide token
![Screenshot (343)](https://github.com/carolledevops/Helloworld/assets/138341326/cab9d7c9-1267-411b-ae83-531a548e034a)
After create Gke cluster, we will use .kube/config 

All this creadendials(token, kube/config, service account, private key)  will provide to jenkins to authenticate to sonarqube to analyse the code, github clone private repository, slack to notify the team, snyk to scan docker images, dockerhub to store docker images, gcp and gke to deploy hello world application.
provide all that credentials: go to manage plugins- manage credentials
Manage jenkins
![Screenshot (350)](https://github.com/carolledevops/Helloworld/assets/138341326/cc26a74c-dbd8-4da6-a30a-6c813c6e5cc7)

Click on manage credentials

![Screenshot (351)](https://github.com/carolledevops/Helloworld/assets/138341326/6113de12-4947-426e-a3cc-c30d9463a178)

add credentials

![Screenshot (352)](https://github.com/carolledevops/Helloworld/assets/138341326/63f4766f-1018-4c4e-af56-422920bfa703)

All my credentials
![Screenshot (357)](https://github.com/carolledevops/Helloworld/assets/138341326/bbec4ec6-e008-4aa5-b463-84428da51a7f)

After add the credentials
we need to go in global tools configuration to set java, SonarQube Scanner and snyk
##### manage jenkins - global tools configuration - java
![Screenshot (360)](https://github.com/carolledevops/Helloworld/assets/138341326/270c3d48-7841-49d7-860c-b5f1f3c3390f)

##### manage jenkins - global tools configuration - sonarqube
 ![Screenshot (359)](https://github.com/carolledevops/Helloworld/assets/138341326/9bbb7003-d3fb-4bb0-ae81-441bd504faeb)

##### manage jenkins - global tools configuration - snyk
 ![Screenshot (358)](https://github.com/carolledevops/Helloworld/assets/138341326/06e5c005-df14-4733-9090-2006088dd829)
Configure systems

## Workflow
CI/CD pipeleine, we have 4 environments(dev, qa, prepro,pro) and each environment have the pipeline 
- In dev environment, we have multipipeline, I will use one pipeline
![Screenshot (353)](https://github.com/carolledevops/Helloworld/assets/138341326/135317d6-57d2-4b5a-a134-1c9d7af84761)
### Explication
Development pipeline (when pull request merged to develop branch)

1.  A pull request is merged in the develop branch
2.  jenkins notice the change on helloworld repository via preset webhook then clone the repository.
3.  Jenkins send build start notification on slack
4,5 jenkins use the docker agent to launch sonarqube scannercli container to analyse the code and the scan result sent back to jenkins
6.  Jenkins sent the build report to sonarqube to be compared with quality gate
7.  sonarqube sent the code analysis result back to jenkins
8.  jenkins read dockerfile to build, scan and push docker images to dockerhub
9.  jenkins deploy helloworld application in kubernetes
10. kubernetes pull docker images from dockerhub

QA pipeline

![Screenshot (354)](https://github.com/carolledevops/Helloworld/assets/138341326/8856a655-93d8-4882-8a86-693eb9edbca3)

Production pipeline 

![Screenshot (356)](https://github.com/carolledevops/Helloworld/assets/138341326/7717f3b5-320c-49ed-a1ba-402097ce1c24)

 - After validation by the whole team, the Ops manager can make the merger request in order to pass the modification on the main branch.
 - Deployment in production environment will then be activated and a notification is sent to slack
 - Once the application is deployed Kubernetes cluster, a end user will be able to connect and consume the application.







