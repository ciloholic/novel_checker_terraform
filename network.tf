resource "google_compute_network" "network" {
  name                    = "${local.project_config.prefix}-network"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnetwork" {
  name                     = "${local.project_config.prefix}-subnetwork"
  region                   = local.project_config.region
  ip_cidr_range            = "10.0.0.0/16"
  network                  = google_compute_network.network.name
  private_ip_google_access = true
}
