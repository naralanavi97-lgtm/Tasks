variable "vpc_name" {
  description = "VPC name"
  type        = string
}

variable "subnet_name" {
  description = "Subnet name"
  type        = string
}

variable "subnet_cidr" {
  description = "Subnet CIDR range"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
}
variable "ssh_source_ranges" {
  description = "CIDR blocks allowed to SSH"
  type        = list(string)
}
