provider "google" {
  project     = local.project_id
  region      = local.region
  credentials = ""
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
    prefix      = "vpc/tfstate"
    credentials = ""
  }
}
locals {
  project_id      = "hello-392203"
  region          = "us-central1"
  vpc_name        = "hello"
  subnet_name     = "helloworld"
  subnet_ip_cidr  = "10.0.0.0/18"
  route_name      = "hellorter"
  namna           = "hellonat"

}

module "vpc" {
  source          = "../../../modules/network"
  project_id      = local.project_id
  region          = local.region
  vpc_name        = local.vpc_name
  subnet_name     = local.subnet_name
  subnet_ip_cidr  = local.subnet_ip_cidr
  route_name      = local.route_name
  namna           = local.namna
}



