
resource "google_compute_address" "jenkins" {
  name = var.jenkins_address
}

resource "google_compute_address" "sonar" {
  name = var.sonar_address
}


resource "google_compute_instance" "hello_jenkins" {
  name         = var.instance_name[0]
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  network_interface {
    subnetwork = data.google_compute_subnetwork.subnetwork.self_link
    access_config {
      nat_ip = google_compute_address.jenkins.address
    }
  }
}


resource "google_compute_instance" "hello_sonar" {
  name         = var.instance_name[1]
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  network_interface {
    subnetwork = data.google_compute_subnetwork.subnetwork.self_link
    access_config {
      nat_ip = google_compute_address.sonar.address
    }
  }
}






