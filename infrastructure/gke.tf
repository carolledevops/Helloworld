resource "google_container_cluster" "primary" {
  name     = "${var.project}-gke"
  location = var.zone

  remove_default_node_pool = true
  initial_node_count       = var.initial_node_count



  network    = google_compute_network.vpc_hello.name
  subnetwork = google_compute_subnetwork.hello_subnet.name
}


resource "google_container_node_pool" "primary_preemptible_nodes" {
  name       = "${google_container_cluster.primary.name}-node-pool"
  location   = var.zone
  cluster    = google_container_cluster.primary.name
  node_count = var.node_count

  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]



    labels = {
      var = var.project
    }
    machine_type = "n1-standard-1"
    tags         = ["gke-node", "${var.project}-gke"]
    metadata = {
      disable-legacy-endpoints = "true"
    }
  }

}

