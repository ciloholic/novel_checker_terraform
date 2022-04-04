resource "google_compute_instance" "vm_instance" {
  name         = local.project_config.prefix
  machine_type = "e2-micro"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2110"
    }
  }

  network_interface {
    network = "default"
    access_config {
    }
  }
}
