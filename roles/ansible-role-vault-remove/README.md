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
* Debian/Stretch64

Requirements
------------

* Ansible 2.5 or higher

Role Variables
--------------

defaults/main.yml
```
vault_bin_path: "/usr/bin"				# Path to install vault binary
vault_conf: "/etc/vault/config.hcl"			# Vault configuration file
vault_certs: "/etc/vault/certs"				# Vault certificates directory
vault_user: "vault"					# User to run the vault systemd service
vault_group: "vault"					# Group for vault user
vault_service: "vault"					# Name of the vault systemd service
vault_profile: "/etc/profile.d/vault.sh"		# System-wide profile for setting Vault listening address
audit_path: "/var/log/vault"				# Audit log file directory
consul_server_group: "consul_server"			# Name of consul servers defined in inventory file
consul_port: 8500					# Consul listener port
```

Dependencies
------------

Requires elevated root privileges

Example Playbook
----------------

```
---

- name: Remove Hashicorp Vault
  hosts: vault
  become: yes

  roles:
    - ansible-role-vault-remove
```

License
-------

MIT License

Author Information
------------------

Adam Goldsmith

