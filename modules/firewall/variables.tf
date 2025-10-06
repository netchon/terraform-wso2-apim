
variable "name" {
    type = string
    description = "The name of the firewall"
}

variable "inbound_rules" {
  type = list(object({
    protocol = string
    port = string
    source_ips = list(string)
  }))
  default = []
  description = "List of inbound rules"
}


variable "outbound_rules" {
  type = list(object({
    protocol = string
    port = string
    destination_ips = list(string) 
  }))
  default = []
  description = "List of outbound rules"
}

variable "label_selector" {
  type = string
  description = "Labels selectors"
}

variable "fw_server" {
  type = string
  description = "Server Selector for Firewall"
  default = "0"
}

