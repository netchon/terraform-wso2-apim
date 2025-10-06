terraform {
  required_providers {
    hcloud = {
      source = "hetznercloud/hcloud"
      version = "1.53.1"
    }
  }
}

provider "hcloud" {
    token = var.hcloud_token
}