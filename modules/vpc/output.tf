########################################
# VPC OUTPUTS
########################################

output "vpc_id" {
  description = "VPC network ID"
  value       = google_compute_network.vpc.id
}

output "vpc_name" {
  description = "VPC network name"
  value       = google_compute_network.vpc.name
}

########################################
# SUBNET OUTPUTS
########################################

output "subnet_id" {
  description = "Subnet ID (used by VM module)"
  value       = google_compute_subnetwork.subnet.id
}

output "subnet_name" {
  description = "Subnet name"
  value       = google_compute_subnetwork.subnet.name
}

output "subnet_self_link" {
  description = "Subnet self link (sometimes required)"
  value       = google_compute_subnetwork.subnet.self_link
}