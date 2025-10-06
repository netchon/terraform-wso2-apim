
output "network_id" {
  value = hcloud_network.this.id 
  description = "The output of the created Hetzner Network"
}