resource "google_compute_instance" "vm" {
  name         = var.vm_name
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
      size  = 10
    }
  }

  network_interface {
    subnetwork = var.subnet_id

    # Assign public IP
    #access_config {} - blocking public ip for allowing only private ip's
  }

  shielded_instance_config {
    enable_secure_boot          = true
    enable_vtpm                 = true
    enable_integrity_monitoring = true
  }
  # Enable OS Login
  metadata = {
    enable-oslogin = "TRUE"
  }
tags = ["iap-ssh"]

}
