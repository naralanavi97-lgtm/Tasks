########################################
# PROJECT VARIABLES
########################################

variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  description = "GCP Region"
  type        = string
  default     = "asia-south1"
}

variable "zone" {
  description = "GCP Zone"
  type        = string
  default     = "asia-south1-a"
}

########################################
# VPC VARIABLES
########################################

variable "vpc_name" {
  description = "Name of the VPC network"
  type        = string
}

variable "subnet_name" {
  description = "Name of the subnet"
  type        = string
}

variable "subnet_cidr" {
  description = "CIDR range for subnet"
  type        = string
}

########################################
# VM VARIABLES
########################################

variable "vm_name" {
  description = "Compute Engine VM name"
  type        = string
}

variable "machine_type" {
  description = "VM machine type"
  type        = string
}
variable "credentials" {
  description = "Credentials"
  type        = string
}
variable "enable_secure_boot" {
  description = "Enable Secure Boot"
  type        = bool
}
variable "enable_vtpm" {
  description = "enable_vtpm"
  type        = bool
}
variable "enable_integrity_monitoring" {
  description = "enable_integrity_monitoring"
  type        = bool
}
variable "oslogin_user_email" {
  description = "Email of the user to grant OS Login access"
  type        = string
}
variable "nat_router" {
  description = "nat router name "
  type        = string
}

variable "cloud_nat" {
  description = "cloud nat name "
  type        = string
}