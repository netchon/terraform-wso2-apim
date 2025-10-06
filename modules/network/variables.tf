variable "network_name" {
  type = string
  description = "The name for the private network"
}

variable "network_cidr" {
  type = string
  description = "CIDR block for the private network"
}

variable "network_type" {
    type = string
    description = "Hetzner subnet type"
}

variable "network_zone" {
    type = string
    description = "Hetzner Cloud network zone"
    default = "eu-central"
}

variable "subnet_cidr" {
  type = string
  description = "CIDR block for the subnet within the private network"
}