Role : ansible-role-vault-sshkeysign
====================================

Configure Hashicorp's Vault SSH public key signing for client and host by
* Enabling SSH secrets engine
* Configuring Vault with a self-generated CA
* Creating SSH role

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
ssh_client: "ssh-client-signer"				# SSH client signining secret engine name
sshrole_name: "sshrole"					# SSH client signing role name
default_user: "ansible"					# SSH client signing default user
def_lease_ttl: "10m"					# Default lease time to live
max_lease_ttl: "20m"					# Max lease time to live
ssh_host: "ssh-host-signer"				# SSH host signining secret engine name
host_max_lease_ttl: "87600h"				# SSH host signing max TTL
hostrole_name: "hostrole"				# SSH host signing role name
allowed_domains: "localdomain,example.com"
```

Dependencies
------------

None

Example Playbook
----------------

```
---

- name: Create SSH Key Signing in Hashicorp Vault
  hosts: vault
  gather_facts: yes

  roles:
    - ansible-role-vault-sshkeysign
```

License
-------

MIT License

Author Information
------------------

Adam Goldsmith

