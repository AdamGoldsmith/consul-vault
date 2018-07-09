Role : ansible-role-vault-approle
=================================

Configure Hashicorp's vault by
* Enabling approle auth method
* Creating approle policy
* Creating approle role

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
vault_addr: "{{ ansible_fqdn }}"			# Vault listener address
vault_port: "8200"					# Vault listener port
vault_keysfile: "~/.hashicorp_vault_keys.json"		# Local file storing master key shards
vault_base_ip: "10.1.42."				# Vault subnet
approle_name: "approle"					# Approle's name
def_lease_ttl: "10m"					# Default lease time to live
max_lease_ttl: "20m"					# Max lease time to live
token_ttl: "10m"					# Token time to live
max_token_ttl: "15m"					# Token max time to live
```

Dependencies
------------

None

Example Playbook
----------------

```
---

- name: Create approle in Hashicorp Vault
  hosts: vault
  gather_facts: yes

  roles:
    - ansible-role-vault-approle
```

License
-------

MIT License

Author Information
------------------

Adam Goldsmith

