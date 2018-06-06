Role : ansible-role-haproxy-stop
================================

Stop keepalived & HAProxy by
* Stopping the keepalived service
* Stopping the HAProxy service

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

- name: Stop keepalived & HAProxy
  hosts: localhost
  connection: local

  roles:
    - ansible-role-haproxy-stop
```

License
-------

MIT License

Author Information
------------------

Adam Goldsmith

