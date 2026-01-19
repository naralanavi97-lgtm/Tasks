########################################
# CREATE VPC NETWORK
########################################
resource "google_compute_network" "vpc" {
  name = var.vpc_name

  # Disable default subnet creation
  auto_create_subnetworks = false
}

########################################
# CREATE SUBNET
########################################
resource "google_compute_subnetwork" "subnet" {
  name          = var.subnet_name
  region        = var.region

  # Attach subnet to VPC
  network       = google_compute_network.vpc.id

  # IP range
  ip_cidr_range = var.subnet_cidr
  
  private_ip_google_access = true
}
########################################
# FIREWALL RULE – ALLOW SSH
########################################
resource "google_compute_firewall" "allow_ssh" {
  name    = "allow-ssh"
  network = google_compute_network.vpc.name

  # Allow SSH traffic
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  
  source_ranges = ["203.0.113.10/32"]  # 👈 your IP / CIDR
  
}

resource "google_compute_router" "nat_router" {
  name    = "nat-router"
  region  = var.region
  network = google_compute_network.vpc.id
}


resource "google_compute_router_nat" "cloud_nat" {
  name                               = "cloud-nat"
  router                            = google_compute_router.nat_router.name
  region                            = var.region
  nat_ip_allocate_option            = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"

  log_config {
    enable = true
    filter = "ERRORS_ONLY"
  }
}
