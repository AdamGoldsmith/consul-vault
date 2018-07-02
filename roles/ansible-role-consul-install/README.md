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
consul_src: "https://releases.hashicorp.com/consul/1.2.0/consul_1.2.0_linux_amd64.zip"		# Version of consul to download from Hashicorp's website
consul_chksum: "sha256:85d84ea3f6c68d52549a29b00fd0035f72c2eabff672ae46ca643cb407ef94b4"	# SHA256 checksum for zip file
consul_dependencies:										# List of Consul's software dependencies
  - unzip
consul_bin_path: "/usr/bin"									# Path to install consul binary
consul_path: "/var/lib/consul"									# The base consul directory
consul_conf: "/etc/consul/consul_agent.hcl"							# Consul agent configuration file
consul_datacenter: "dc1"									# Consul datacenter name
consul_base_ip: "10.1.42."									# Consul subnet
consul_user: "consul"										# User to run the consul systemd service
consul_uid: "8501"										# UID of consul user
consul_group: "consul"										# Group for consul user
consul_gid: "8501"										# GID of consul group
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

MIT License

Author Information
------------------

Adam Goldsmith

