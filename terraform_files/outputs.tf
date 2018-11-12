output "haproxy_public_ips" {
  value = ["${digitalocean_droplet.haproxy.*.ipv4_address}"]
}
output "haproxy_private_ips" {
  value = ["${digitalocean_droplet.haproxy.*.ipv4_address_private}"]
}
output "vault_public_ips" {
  value = ["${digitalocean_droplet.vault.*.ipv4_address}"]
}
output "vault_private_ips" {
  value = ["${digitalocean_droplet.vault.*.ipv4_address_private}"]
}
output "consul_public_ips" {
  value = ["${digitalocean_droplet.consul.*.ipv4_address}"]
}
output "consul_private_ips" {
  value = ["${digitalocean_droplet.consul.*.ipv4_address_private}"]
}
