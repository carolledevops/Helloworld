resource "google_compute_firewall" "hello-allow-icmp" {
  name    = "hello-icmp"
  network = google_compute_network.vpc_hello.name

  allow {
    protocol = "icmp"
  }


  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "hello-allow-ssh" {
  name    = "hello-ssh"
  network = google_compute_network.vpc_hello.name

  
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "hello-allow-internet" {
  name    = "hello-internet"
  network = google_compute_network.vpc_hello.name

  
  allow {
    protocol = "tcp"
    ports    = ["80", "8080", "9000", "8081"]
  }

  source_ranges = ["0.0.0.0/0"]
}