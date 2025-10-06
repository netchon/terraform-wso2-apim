terraform {
  required_providers {
    hcloud = {
      source = "hetznercloud/hcloud"
    }
  }
}

resource "hcloud_firewall" "this" {
  name = var.name

  dynamic "rule" {
    for_each = var.inbound_rules
    content {
      direction = "in"
      protocol  = rule.value.protocol
      port = rule.value.port
      source_ips = rule.value.source_ips
    }
    
  }

  dynamic "rule" {
    for_each = var.outbound_rules
    content {
      direction = "out"
      protocol  = rule.value.protocol
      port      = rule.value.port
      destination_ips = rule.value.destination_ips
    }
    
  }

    apply_to {
        label_selector = var.label_selector
        server = var.fw_server
    }

}
