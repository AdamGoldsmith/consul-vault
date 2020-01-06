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
consul_version: latest							# Version of consul to download (latest unless specified)
consul_arch: linux_amd64						# Architecture of binary to download
checkpoint_url: "https://checkpoint-api.hashicorp.com/v1/check/consul"	# Consul's checkpoint URL for gathering current data
consul_dependencies:							# List of Consul's software dependencies
  - unzip
consul_bin_path: "/usr/bin"						# Path to install consul binary
consul_path: "/var/lib/consul"						# The base consul directory
consul_conf: "/etc/consul/consul_agent.hcl"				# Consul agent configuration file
consul_local_scripts: False                                             # Use local scripts for health checks
consul_datacenter: "dc1"						# Consul datacenter name
consul_base_ip: "10.1.42."						# Consul subnet
consul_user: "consul"							# User to run the consul systemd service
consul_uid: "8501"							# UID of consul user
consul_group: "consul"							# Group for consul user
consul_gid: "8501"							# GID of consul group
consul_service: "consul"						# Name of the consul systemd service
ansible_consul_group: "consul"                                          # Name of the ansible consul server group

# Following variables do not require setting if consul servers and clients are being deployed simultaneously
# Only require values when joining consul clients to pre-existing, configured consul servers - useful for later consul client deployments
consul_servers: []                                                      # Only set if the consul servers are already configured and available 
consul_secret: ""                                                       # Must be supplied if joining consul clients to existing consul servers

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
  gather_facts: yes

  roles:
    - ansible-role-consul-install
```

License
-------

MIT License

Author Information
------------------

Adam Goldsmith

