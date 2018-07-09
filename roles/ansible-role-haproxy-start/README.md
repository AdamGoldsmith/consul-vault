Role : ansible-role-haproxy-start
=================================

Start HAProxy & Keepalived by
* Starting the HAProxy service
* Starting the Keepalived service

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
keepalived_service: keepalived	# Name of the keepalived systemd service
```

Dependencies
------------

None

Example Playbook
----------------

```
---

- name: Start HAProxy & Keepalived
  hosts: haproxy
  become: yes

  roles:
    - ansible-role-haproxy-start
```

License
-------

MIT License

Author Information
------------------

Adam Goldsmith

