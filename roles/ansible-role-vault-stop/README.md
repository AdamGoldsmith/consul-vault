Role : ansible-role-vault-stop
==============================

Stop Hashicorp's vault by
* Stopping the vault service

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
vault_service: vault		# Name of the vault systemd service
```

Dependencies
------------

None

Example Playbook
----------------

```
---

- name: Stop Hashicorp Vault
  hosts: vault
  become: yes

  roles:
    - ansible-role-vault-stop
```

License
-------

MIT License

Author Information
------------------

Adam Goldsmith

