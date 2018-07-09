Role : ansible-role-haproxy-reload
==================================

Reload HAProxy by
* Reloading the HAProxy service

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
```

Dependencies
------------

None

Example Playbook
----------------

```
---

- name: Reload HAProxy
  hosts: haproxy
  become: yes

  roles:
    - ansible-role-haproxy-reload
```

License
-------

MIT License

Author Information
------------------

Adam Goldsmith

