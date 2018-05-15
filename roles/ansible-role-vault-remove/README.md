Role : ansible-role-vault-remove
================================

Removes Hashicorp's vault by
* Removing VAULT_ADDR system-wide profile
* Stopping & disabling vault systemd service
* Deleting vault systemd service configuration file
* Removing the vault directory structure
* Removing the vault user & group
* Removing binary vault from /usr/bin

Currently tested on these Operating Systems
* Oracle Linux/RHEL/CentOS

Requirements
------------

Ansible 2.4 or higher

Role Variables
--------------

defaults/main.yml
```
vault_bin_path: "/usr/bin"								# Path to install vault binary
vault_path: "/var/lib/vault"								# The base vault directory
vault_conf: "/etc/vault/config.hcl"							# Vault configuration file
vault_certs: "/etc/vault/certs"								# Vault certificates directory
vault_user: "vault"									# User to run the vault systemd service
vault_group: "hashi"									# Group for vault user
vault_service: "vault"									# Name of the vault systemd service
vault_profile: "/etc/profile.d/vault.sh"						# System-wide profile for setting Vault listening address
audit_path: "/var/log/vault"								# Audit log file directory
```

Dependencies
------------

Requires elevated root privileges

Example Playbook
----------------

```
---

- name: Remove Hashicorp Vault
  hosts: localhost
  connection: local
  become: True

  roles:
    - ansible-role-vault-remove
```

License
-------

BSD

Author Information
------------------

Adam Goldsmith (adam.goldsmith@accenture.com)
