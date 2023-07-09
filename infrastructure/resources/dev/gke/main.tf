provider "google" {
  project     = local.project_id
  region      = local.region
  credentials = "hello-392203-d50cd02c95eb.json"
}

provider "kubernetes" {
  host                   = google_container_cluster.primary.endpoint
  client_certificate     = google_container_cluster.primary.master_auth.0.client_certificate
  client_key             = google_container_cluster.primary.master_auth.0.client_key
  cluster_ca_certificate = google_container_cluster.primary.master_auth.0.cluster_ca_certificate
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
    prefix      = "gke/tfstate"
    credentials = "hello-392203-d50cd02c95eb.json"
  }
}
locals {
  project_id      = "hello-392203"
  region          = "us-central1"
  cluster_name    = "helloworld"
  zone            = "us-central1-a"
  machine_type    = "e2-small"
  team            = "devops"
  min_node_count  = 1
  max_node_count  = 3
  
}

module "gke" {
  source          = "../../modules/gke"
  project_id      = local.project_id
  region          = local.region
  cluster_name    = local.cluster_name
  zone            = local.zone
  machine_type    = local.machine_type
  team            = local.team
  min_node_count  = local.min_node_count
  max_node_count  = local.max_node_count
  
}