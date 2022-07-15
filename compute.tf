resource "google_compute_instance" "novel_checker" {
  name         = local.project_config.prefix
  machine_type = "e2-micro"
  tags         = ["allow-http", "allow-ssh", "disallow-ssh"]
  labels       = { workday = "true" }
  metadata = {
    block-project-ssh-keys = "true"
    ssh-keys               = local.project_config.ssh_key
  }

  boot_disk {
    device_name = local.project_config.prefix

    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2110"
      type  = "pd-standard"
      size  = 30
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
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
    provisioning_model  = "STANDARD"
  }
}
