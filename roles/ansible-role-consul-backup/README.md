Role : ansible-role-consul-backup
=================================

Create snapshot of Consul cluster by
* Running the snapshot save API call
* Saving snapshot file locally (format: consul.snapshot.<epoch>.tgz)

Currently tested on these Operating Systems
* Oracle Linux/RHEL/CentOS
* Debian/Stretch64

Requirements
------------

* Ansible 2.5 or higher

Role Variables
--------------

defaults/main.yml
```
consul_datacenter: "dc1"		# Consul datacenter name
consul_base_ip: "10.1.42."		# Consul subnet
consul_port: "8500"			# Consul listener port
consul_backup_dir: "~"			# Consul backup directory for compressed snapshot file
```

Dependencies
------------

Requires elevated root privileges

Example Playbook
----------------

```
---

- name: Backup Hashicorp Consul cluster with snapshot
  hosts: consul_server
  gather_facts: yes

  roles:
    - ansible-role-consul-backup
```

License
-------

MIT License

Author Information
------------------

Adam Goldsmith

