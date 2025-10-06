terraform {
  required_providers {
    hcloud = {
      source = "hetznercloud/hcloud"
    }
  }
}

resource "hcloud_server" "this" {
  count = var.server_count
  name = "${var.server_name_prefix}-${count.index + 1}"
  server_type = var.server_type
  image = var.image
  location = var.location
  ssh_keys = var.ssh_key_ids
  firewall_ids = var.firewall_ids
  labels = {
    role = var.server_label_role
  }

  network {
    network_id = var.network_id
  }

  public_net {
    ipv4_enabled = var.assign_public_ip
    ipv6_enabled = false
  }

  depends_on = [var.depends_on_resource]

}