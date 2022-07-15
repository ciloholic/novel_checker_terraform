resource "google_compute_firewall" "disallow_ssh" {
  name          = "disallow-ssh"
  network       = google_compute_network.network.name
  direction     = "INGRESS"
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["disallow-ssh"]

  priority = 1000

  deny {
    protocol = "tcp"
    ports    = ["22"]
  }
}

resource "google_compute_firewall" "allow_ssh" {
  name          = "allow-ssh"
  network       = google_compute_network.network.name
  direction     = "INGRESS"
  description   = "55119"
  source_ranges = [local.network_config.allow_ip]
  target_tags   = ["allow-ssh"]

  priority = 1000

  allow {
    protocol = "tcp"
    ports    = ["55119"]
  }
}

resource "google_compute_firewall" "allow_http" {
  name          = "allow-http"
  network       = google_compute_network.network.name
  direction     = "INGRESS"
  source_ranges = [local.network_config.allow_ip]
  target_tags   = ["allow-http"]

  priority = 1000

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }
}
