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
  credentials = "helloworld-391505-6aec43ab3c5d.json"
  region      = var.region
  zone        = var.zone
}

terraform {
    backend "gcs" {
        bucket = "terraform3-lock"
        prefix = "infras/tfstate"
        credentials = "helloworld-391505-6aec43ab3c5d.json"
    }
}