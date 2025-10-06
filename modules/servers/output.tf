
output "public_ips" {
  value = [for server in hcloud_server.this : server.ipv4_address]
}

output "private_ips" {
  value = [for server in hcloud_server.this : tolist(server.network)[0].ip]
}

output "names" {
  value = [for server in hcloud_server.this : server.name]
}
