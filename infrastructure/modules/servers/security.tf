resource "google_compute_firewall" "hello-allow-icmp" {
  name    = "hello-icmp"
  network = data.google_compute_network.vpc-network.self_link

  allow {
    protocol = "icmp"
  }


  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "hello-allow-ssh" {
  name    = "hello-ssh"
  network = data.google_compute_network.vpc-network.self_link


  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "hello-allow-internet" {
  name    = "hello-internet"
  network = data.google_compute_network.vpc-network.self_link


  allow {
    protocol = "tcp"
    ports    = ["80", "8080", "9000", "5000"]
  }

  source_ranges = ["0.0.0.0/0"]
}