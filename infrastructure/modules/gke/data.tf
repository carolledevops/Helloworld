data "google_compute_network" "vpc-network" {
  name = "hello"
}

data "google_compute_subnetwork" "subnetwork" {
  name   = "helloworld"
  region = "us-central1"
}