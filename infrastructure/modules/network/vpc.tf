resource "google_compute_network" "hello_vpc" {
  name                            = var.vpc_name
  auto_create_subnetworks         = false
  delete_default_routes_on_create = false
}


resource "google_compute_subnetwork" "subnet_private" {
  name                     = var.subnet_name
  ip_cidr_range            = var.subnet_ip_cidr
  region                   = var.region
  network                  = google_compute_network.hello_vpc.id
  private_ip_google_access = true
}


