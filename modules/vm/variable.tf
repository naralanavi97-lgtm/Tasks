
variable "vm_name" {
  description = "VM name"
  type        = string
}

variable "machine_type" {
  description = "VM machine type"
  type        = string
}

variable "zone" {
  description = "GCP zone"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID from VPC module"
  type        = string
}
variable "enable_secure_boot" {
    description = "Enable Secure Boot"
    type        = bool
    default = true
}
variable "enable_vtpm" {
    description = "enable_vtpm"
    type        = bool
    default = true
}
  variable "enable_integrity_monitoring" {
    description = "enable_integrity_monitoring"
    type        = bool
    default = true
}