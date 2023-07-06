terraform {
  required_version = "~>1.3.3"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.68.0"
    }
  }
}

provider "google" {
  project     = var.project
  region      = var.region
  zone        = var.zone
  credentials = file()
}

provider "kubernetes" {
  host                   = google_container_cluster.prime.endpoint
  client_certificate     = google_container_cluster.prime.master_auth.0.client_certificate
  client_key             = google_container_cluster.prime.master_auth.0.client_key
  cluster_ca_certificate = google_container_cluster.prime.master_auth.0.cluster_ca_certificate
}

terraform {
  backend "gcs" {
    bucket      = "terraform3-lock"
    prefix      = "infras/tfstate"
    credentials = file()
  }
}