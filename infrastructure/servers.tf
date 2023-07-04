data "google_compute_zones" "available" {
    region = var.region
}

resource "google_compute_address" "jenkins" {
  name = var.address_name
}

resource "google_compute_instance" "hello_vm0" {
  name         = var.instance_name
  machine_type = var.machine_type
  zone = var.zone

  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.hello_subnet.id
    access_config {
      nat_ip = google_compute_address.jenkins.address
    }
  }
}






