########################################
# PROVIDER CONFIGURATION
########################################
provider "google" {
  # GCP project ID where resources will be created
  project = var.project_id

  # Default region for resources
  region = var.region

  # Default zone for Compute Engine
  zone = var.zone
  # Use a service account JSON for Application Default Credentials
  credentials = file(var.credentials)
}
########################################
# VPC MODULE CALL
########################################
module "vpc" {
  # Path to the VPC module
  source = "./modules/vpc"
  # Input variables passed to the VPC module
  vpc_name          = var.vpc_name
  subnet_name       = var.subnet_name
  subnet_cidr       = var.subnet_cidr
  region            = var.region
  ssh_source_ranges = ["203.0.113.10/32"]

}

########################################
# VM MODULE CALL
########################################
module "vm" {
  # Path to the VM module
  source = "./modules/vm"

  # VM configuration
  vm_name      = var.vm_name
  machine_type = var.machine_type
  zone         = var.zone
  subnet_id    = module.vpc.subnet_id
}
#This role allows the user to log in to Linux VMs using OS Login with admin (sudo) privileges.

resource "google_project_iam_member" "oslogin_user" {
  project = var.project_id
  role    = "roles/compute.osAdminLogin"
  member  = "user:${var.oslogin_user_email}"
}

# This role allows the user to connect to VMs via Identity-Aware Proxy (IAP).

resource "google_project_iam_member" "iap_access" {
  project = var.project_id
  role    = "roles/iap.tunnelResourceAccessor"
  member  = "user:${var.oslogin_user_email}"
}