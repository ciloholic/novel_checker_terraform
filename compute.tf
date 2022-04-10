resource "google_compute_instance" "novel_checker" {
  name         = local.project_config.prefix
  machine_type = "e2-micro"
  tags         = ["novel-checker"]

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2110"
    }
  }

  network_interface {
    network    = google_compute_network.network.name
    subnetwork = google_compute_subnetwork.subnetwork.name
  }

  service_account {
    email  = google_service_account.novel_checker.email
    scopes = ["cloud-platform"]
  }

  scheduling {
    preemptible       = true
    automatic_restart = false
  }
}

resource "google_compute_firewall" "firewall" {
  name          = local.project_config.prefix
  network       = google_compute_network.network.name
  direction     = "INGRESS"
  target_tags   = ["novel-checker"]
  source_ranges = ["35.235.240.0/20"] # https://cloud.google.com/iap/docs/using-tcp-forwarding#create-firewall-rule

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
}
