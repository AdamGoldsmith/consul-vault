Role : ansible-role-consul-start
================================

Start Hashicorp's consul by
* Starting the consul service

Currently tested on these Operating Systems
* Oracle Linux/RHEL/CentOS
* Debian/Stretch64

Requirements
------------

Ansible 2.5 or higher

Role Variables
--------------

defaults/main.yml
```
consul_service: vault		# Name of the consul systemd service
```

Dependencies
------------

None

Example Playbook
----------------

```
---

- name: Start Hashicorp Consul
  hosts: localhost
  connection: local

  roles:
    - ansible-role-consul-start
```

License
-------

BSD

Author Information
------------------

Adam Goldsmith

