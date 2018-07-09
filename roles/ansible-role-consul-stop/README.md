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
consul_service: consul		# Name of the consul systemd service
```

Dependencies
------------

None

Example Playbook
----------------

```
---

- name: Stop Hashicorp Consul
  hosts: consul
  become: yes

  roles:
    - ansible-role-consul-stop
```

License
-------

MIT License

Author Information
------------------

Adam Goldsmith

