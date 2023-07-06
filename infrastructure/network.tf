
resource "google_compute_network" "vpc_hello" {
  name                    = var.vpc_name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "hello_subnet" {
  name          = var.subnet_name
  ip_cidr_range = var.subnet-ip_cidr_range
  region        = var.region
  network       = google_compute_network.vpc_hello.name
}



