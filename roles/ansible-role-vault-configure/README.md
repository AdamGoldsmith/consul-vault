Role : ansible-role-vault-configure
===================================

Configure Hashicorp's vault by
* Enabling audit logging
* Creating policies
* Creating new admin token
* Creating tokens

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
vault_addr: "{{ ansible_fqdn }}"							# Vault listener address
vault_port: "8200"									# Vault listener port
vault_user: "vault"									# User to run the vault systemd service
vault_group: "vault"									# Group for vault user
vault_keysfile: "~/.hashicorp_vault_keys.json"						# Local file storing master key shards
vault_admintokenfile									# Local file storing admin token
vault_provisionertokenfile								# Local file storing provisioner token
audit_path: "/var/log/vault"								# Audit log file directory
```

Dependencies
------------

Requires elevated root privileges

Example Playbook
----------------

```
---

- name: Configure Hashicorp Vault
  hosts: vault
  gather_facts: yes
  become: yes

  roles:
    - ansible-role-vault-configure
```

License
-------

MIT License

Author Information
------------------

Adam Goldsmith

