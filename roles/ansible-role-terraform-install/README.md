Role : ansible-role-terraform-install
=====================================

Installs Hashicorp's Terraform by
* Downloading & unzipping terraform from Hashicorp's releases site into terraform_bin_path (default: /usr/bin)

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
terraform_version: latest							# Version of terraform to download (latest unless specified)
terraform_arch: linux_amd64							# Architecture of binary to download
checkpoint_url: "https://checkpoint-api.hashicorp.com/v1/check/terraform"	# Terraform's checkpoint URL for gathering current data
terraform_dependencies:								# List of Terraform's software dependencies
  - unzip
terraform_bin_path: "/usr/bin"							# Path to install terraform binary
```

Dependencies
------------

Requires elevated root privileges

Example Playbook
----------------

```
---

- name: Install Hashicorp Terraform
  hosts: localhost
  become: yes
  gather_facts: no

  roles:
    - ansible-role-terraform-install
```

License
-------

MIT License

Author Information
------------------

Adam Goldsmith

