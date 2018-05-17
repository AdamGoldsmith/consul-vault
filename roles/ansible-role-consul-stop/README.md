Role : ansible-role-consul-stop
===============================

Stop Hashicorp's consul by
* Stopping the consul service

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

- name: Stop Hashicorp Consul
  hosts: localhost
  connection: local

  roles:
    - ansible-role-consul-stop
```

License
-------

BSD

Author Information
------------------

Adam Goldsmith

