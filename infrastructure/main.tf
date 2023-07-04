terraform {
  required_version = "~>1.3.3"
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.68.0"
    }
  }
}

provider "google" {
  project     = var.project
  region      = var.region
  zone        = var.zone
}

terraform {
    backend "gcs" {
        bucket = "terraform3-lock"
        prefix = "infras/tfstate"
    }
}