Role : ansible-role-terraform-remove
====================================

Removes Hashicorp's Terraform by
* Deleting the terraform binary from terraform_bin_path (default: /usr/bin)

Currently tested on these Operating Systems
* Oracle Linux/RHEL/CentOS 7
* Debian/Stretch64

Requirements
------------

* Ansible 2.5 or higher

Role Variables
--------------

defaults/main.yml
```
terraform_bin_path: "/usr/bin"							# Path to install terraform binary
```

Dependencies
------------

Requires elevated root privileges

Example Playbook
----------------

```
---

- name: Remove Hashicorp Terraform
  hosts: localhost
  become: yes
  gather_facts: no

  roles:
    - ansible-role-terraform-remove
```

License
-------

MIT License

Author Information
------------------

Adam Goldsmith

