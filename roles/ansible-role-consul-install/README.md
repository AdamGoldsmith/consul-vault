Role : ansible-role-consul-install
==================================

Installs Hashicorp's Consul by
* Downloading & unzipping consul from Hashicorp's releases site into /usr/bin
* Creating a consul group & user
* Creating the consul directory structure
* Creating consul systemd service
* Starting & enabling consul systemd service

Currently tested on these Operating Systems
* Oracle Linux/RHEL/CentOS 7
* Debian/Stretch64

Heavily based on the documentation supplied by HashiCorp at <https://www.vaultproject.io/guides/operations/vault-ha-consul.html>

Requirements
------------

* Ansible 2.5 or higher

Role Variables
--------------

defaults/main.yml
```
consul_src: "https://releases.hashicorp.com/consul/1.0.7/consul_1.0.7_linux_amd64.zip"		# Version of consul to download from Hashicorp's website
consul_chksum: "sha256:6c2c8f6f5f91dcff845f1b2ce8a29bd230c11397c448ce85aae6dacd68aa4c14"	# SHA256 checksum for zip file
consul_bin_path: "/usr/bin"									# Path to install consul binary
consul_path: "/var/lib/consul"									# The base consul directory
consul_conf: "/etc/consul/consul_agent.hcl"							# Consul agent configuration file
consul_agent_file: "agent_server.j2"								# Consul agent configuration template (Change to agent_client.j2 for client configuration [Hint: use group_vars])
consul_service_file: "service_server.j2"							# Consul service configuration template (Change to service_client.j2 for client configuration [Hint: use group_vars])
consul_datacenter: "dc1"									# Consul datacenter name
consul_base_ip: "10.1.42."									# Consul subnet
consul_user: "consul"										# User to run the consul systemd service
consul_group: "consul"										# Group for consul user
consul_service: "consul"									# Name of the consul systemd service
```

Dependencies
------------

Requires elevated root privileges

Example Playbook
----------------

```
---

- name: Install Hashicorp Consul
  hosts: consul
  become: yes

  roles:
    - ansible-role-consul-install
```

License
-------

BSD

Author Information
------------------

Adam Goldsmith

