
variable "server_count" {
  type = number
  default = 1
}

variable "server_name_prefix" {
  type = string
  description = "Name of the Server"
}

variable "server_type" {
  type = string
  description = "Type of the Serve to be use"
}

variable "image" {
  type = string
  default = "ubuntu-24.04"
  description = "Image to be used on the Server"
}

variable "location" {
  type = string
  default = "eu-central"
  description = "Location of the Server"
}

variable "ssh_key_ids" {
  type = list(string)
  description = "SSH keys ids to be used"
}

variable "firewall_ids" {
  type = list(string)
  default = []
  description = "List of firewall IDs to attach to the server"
}

variable "network_id" {
  type = string
  description = "Network Id to be attached to the Server"
}

variable "assign_public_ip" {
  type = bool
  default = false
  description = "Whether to assign a public IPv4 address"
}

variable "depends_on_resource" {
  type = any
  description = "Optional resource to depend on"
}

variable "server_label_role" {
  type = string
  description = "Label role for server"
}
