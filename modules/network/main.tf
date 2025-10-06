terraform {
  required_providers {
    hcloud = {
      source = "hetznercloud/hcloud"
    }
  }
}
resource "hcloud_network" "this" {
  name = var.network_name
  ip_range = var.network_cidr
}

resource "hcloud_network_subnet" "this" {
  network_id = hcloud_network.this.id
  type = var.network_type
  network_zone = var.network_zone
  ip_range = var.subnet_cidr
}