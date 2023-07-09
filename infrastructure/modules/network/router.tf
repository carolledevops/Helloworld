resource "google_compute_router" "route_world" {
  name    = var.route_name
  region  = var.region
  network = google_compute_network.hello_vpc.id
}
