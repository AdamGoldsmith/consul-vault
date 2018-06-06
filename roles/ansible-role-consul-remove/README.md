Role : ansible-role-consul-remove
=================================

Removes Hashicorp's Consul by
* Stopping & disabling consul systemd service
* Deleting consul systemd service
* Deleting the consul directory structure
* Removing the consul group & user
* Deleting the consul binary from /usr/bin

Currently tested on these Operating Systems
* Oracle Linux/RHEL/CentOS 7
* Debian/Stretch64

Requirements
------------

* Ansible 2.5 or higher

Role Variables
--------------

defaults/main.yml
```
consul_bin_path: "/usr/bin"									# Path to install consul binary
consul_path: "/var/lib/consul"									# The base consul directory
consul_conf: "/etc/consul/consul_agent.hcl"							# Consul agent configuration file
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

- name: Remove Hashicorp Consul
  hosts: consul
  become: yes

  roles:
    - ansible-role-consul-remove
```

License
-------

MIT License

Author Information
------------------

Adam Goldsmith

