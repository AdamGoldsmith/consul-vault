variable "do_api_token" {}
variable "do_ssh_keys" {}
#variable "do_source_ip" {}

# Configure the DigitalOcean provider
provider "digitalocean" {
  token = "${var.do_api_token}"
}

# Create tags
resource "digitalocean_tag" "haproxy" {
  name = "haproxy"
}
resource "digitalocean_tag" "vault" {
  name = "vault"
}
resource "digitalocean_tag" "consul" {
  name = "consul"
}

# Create virtual machines
resource "digitalocean_droplet" "haproxy" {
  count              = 2
  image              = "centos-7-x64"
  name               = "haproxy-do-s${count.index+1}"
  region             = "lon1"
  size               = "s-1vcpu-1gb"
  private_networking = "true"
  ssh_keys           = ["${var.do_ssh_keys}"]
  tags               = ["${digitalocean_tag.haproxy.id}"]
}
resource "digitalocean_droplet" "vault" {
  count              = 2
  image              = "centos-7-x64"
  name               = "vault-do-s${count.index+1}"
  region             = "lon1"
  size               = "s-1vcpu-1gb"
  private_networking = "true"
  ssh_keys           = ["${var.do_ssh_keys}"]
  tags               = ["${digitalocean_tag.vault.id}"]
}
resource "digitalocean_droplet" "consul" {
  count              = 3
  image              = "centos-7-x64"
  name               = "consul-do-s${count.index+1}"
  region             = "lon1"
  size               = "s-1vcpu-1gb"
  private_networking = "true"
  ssh_keys           = ["${var.do_ssh_keys}"]
  tags               = ["${digitalocean_tag.consul.id}"]
}

## Create load_balancer for forwarding port 80 to 22
#resource "digitalocean_loadbalancer" "public" {
#  name   = "lb-pf"
#  region = "lon1"
#
#  forwarding_rule {
#    entry_port     = 80
#    entry_protocol = "tcp"
#
#    target_port     = 22
#    target_protocol = "tcp"
#  }
#
#  forwarding_rule {
#    entry_port     = 443
#    entry_protocol = "tcp"
#
#    target_port     = 8080
#    target_protocol = "tcp"
#  }
#
#  healthcheck {
#    port     = 22
#    protocol = "tcp"
#  }
#
#  droplet_ids = ["${digitalocean_droplet.myterraformvm.id}"]
#}

# Create firewall to prevent public traffic only
#resource "digitalocean_firewall" "ssh" {
#  name = "only-22"
#
#  inbound_rule = [
#    {
#      protocol           = "tcp"
#      port_range         = "22"
#      source_load_balancer_uids = ["${digitalocean_loadbalancer.public.id}"]
#    },
#    {
#      protocol           = "icmp"
#      source_addresses   = ["0.0.0.0/0", "::/0"]
#    },
#  ]
#
#  outbound_rule = [
#    {
#      protocol                = "udp"
#      port_range              = "1-65535"
#      destination_addresses   = ["0.0.0.0/0", "::/0"]
#    },
#    {
#      protocol                = "tcp"
#      port_range              = "1-65535"
#      destination_addresses   = ["0.0.0.0/0", "::/0"]
#    },
#    {
#      protocol                = "icmp"
#      destination_addresses   = ["0.0.0.0/0", "::/0"]
#    },
#  ]
#
#  droplet_ids = ["${digitalocean_droplet.myterraformvm.id}"]
#}
