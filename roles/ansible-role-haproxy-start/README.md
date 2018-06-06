Role : ansible-role-haproxy-start
=================================

Start HAProxy & keepalived by
* Starting the HAProxy service
* Starting the keepalived service

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
haproxy_service: haproxy	# Name of the haproxy systemd service
keepalived_service: keepalived	# Name of the haproxy systemd service
```

Dependencies
------------

None

Example Playbook
----------------

```
---

- name: Start HAProxy & keepalived
  hosts: localhost
  connection: local

  roles:
    - ansible-role-haproxy-start
```

License
-------

MIT License

Author Information
------------------

Adam Goldsmith

