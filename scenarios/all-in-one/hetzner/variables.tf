
variable "hcloud_token" {
  type = string
  description = "Hetzer Cloud API Token"
}

#################################
# NETWORK VARIABLES
#################################
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

variable "subnet_cidr_dmz" {
  type = string
  description = "CIDR block for the subnet within the private network for DMZ zone"
}

variable "subnet_cidr_app" {
  type = string
  description = "CIDR block for the subnet within the private network for APP instances"
}

variable "subnet_cidr_data" {
  type = string
  description = "CIDR block for the subnet within the private network for DATA intances"
}

#################################
# COMPUTE VARIABLES
#################################

variable "location" {
  type = string
}

variable "image" {
  type = string
  default = "ubuntu-24.04"
}

variable "bastion_server_type" {
  type = string
}

variable "bastion_public_ip" {
  type = bool
  default = false
  description = "Whether to assign a public IPv4 address"
}

variable "assign_public_ip" {
  type = bool
  default = false
  description = "Whether to assign a public IPv4 address"
}

variable "server_count" {
  type = number
  default = 1
}

#################################
# SSH VARIABLES
#################################

variable "ssh_key_name" {
  type = string
  description = "SSH key description"
}

#################################
# BASTION VARIABLES
#################################

variable "bastion_inbound_rules" {
  description = "List of inbound rules"
  type = list(object({
    protocol = string
    port = string
    source_ips = list(string) 
  }))
}

variable "bastion_outbound_rules" {
    description = "List of outbound rules"
    type = list(object({
      protocol = string
      port = string
      destination_ips = list(string) 
    }))
}

variable "enable_bastion" {
  type = bool
  description = "Boolean value to enable or not the bastion"
}

#################################
# APIM VARIABLES
#################################

variable "apim_server_type" {
  type = string
}

variable "apim_inbound_rules" {
  description = "List of inbound rules"
  type = list(object({
    protocol = string
    port = string
    source_ips = list(string) 
  }))
}

variable "apim_outbound_rules" {
    description = "List of outbound rules"
    type = list(object({
      protocol = string
      port = string
      destination_ips = list(string) 
    }))
}


#################################
# DB VARIABLES
#################################

variable "db_server_type" {
  type = string
}

variable "db_inbound_rules" {
  description = "List of inbound rules"
  type = list(object({
    protocol = string
    port = string
    source_ips = list(string) 
  }))
}

variable "db_outbound_rules" {
    description = "List of outbound rules"
    type = list(object({
      protocol = string
      port = string
      destination_ips = list(string) 
    }))
    default = []
}

#################################
# LB VARIABLES
#################################

variable "lb_server_type" {
  type = string
}

variable "lb_inbound_rules" {
  description = "List of inbound rules"
  type = list(object({
    protocol = string
    port = string
    source_ips = list(string) 
  }))
}

variable "lb_outbound_rules" {
    description = "List of outbound rules"
    type = list(object({
      protocol = string
      port = string
      destination_ips = list(string) 
    }))
}
