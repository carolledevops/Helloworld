provider "google" {
  project     = local.project_id
  region      = local.region
  credentials = "hello-392203-d50cd02c95eb.json"
}


terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
  backend "gcs" {
    bucket      = "filel_ock"
    prefix      = "servers/tfstate"
    credentials = "hello-392203-d50cd02c95eb.json"
  }
}
locals {
  project_id      = "hello-392203"
  region          = "us-central1"
  zone            = "us-central1-a"
  machine_type    = "n1-standard-1"
  jenkins_address = "jenkins"
  sonar_address   = "sonar"
  instance_name   = [
    "jenkins",
    "sonarqube"
  ]
  image           = "centos-cloud/centos-7"
}

module "gke" {
  source          = "../../modules/servers"
  project_id      = local.project_id
  region          = local.region
  zone            = local.zone
  machine_type    = local.machine_type
  jenkins_address = local.jenkins_address
  sonar_address   = local.sonar_address
  instance_name   = local.instance_name
  image           = local.image
}