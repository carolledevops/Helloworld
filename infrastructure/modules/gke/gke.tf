resource "google_container_cluster" "primary" {
  name                     = var.cluster_name
  location                 = var.zone
  remove_default_node_pool = var.remove_default_node_pool
  initial_node_count       = var.initial_node_count
  network                  = data.google_compute_network.vpc-network.self_link
  subnetwork               = data.google_compute_subnetwork.subnetwork.self_link
}



resource "google_container_node_pool" "primary_preemptible_nodes" {
  name    = "${google_container_cluster.primary.name}-node-pool"
  cluster = google_container_cluster.primary.id
   
  node_config {
    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
    
   labels = {
      team = var.team
    }
    machine_type = var.machine_type
    tags         = ["gke-node", "${var.project_id}-gke"]
    metadata = {
      disable-legacy-endpoints = "true"
    }
  }
}



