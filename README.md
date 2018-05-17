Hashicorp vault & consul cluster
================================

Installs & confgures Hashicorp's consul & vault to run as an HA cluster

Although the vault installation creates OpenSSL TLS private key, CSR & resultant certificate, the URI modules in these roles currently use "validate_certs: no". It is up to you to complete the TLS configuration.

Heavily based on the documentation supplied by HashiCorp at <https://www.vaultproject.io/guides/operations/vault-ha-consul.html>

Currently tested on these Operating Systems
* Oracle Linux/RHEL/CentOS 7 (Note: Enables EPEL repo using Jeff Geerling's [EPEL role](<https://galaxy.ansible.com/geerlingguy/repo-epel/>)
* Debian/Stretch64

Requirements
------------

* Hashicorp Vagrant
* Ansible 2.5 or higher

Dependencies
------------

* Requires elevated root privileges
* Copy Ansible Control Machine's public SSH key (usually called id_rsa.pub) into the vagrant working directory

Running the stuff
-----------------

```
vagrant up
```

On the Ansible Control Machine  
To deploy

```
ansible-playbook -i inventory site.yml --skip-tags 'remove,stop'
```
To remove

```
ansible-playbook -i inventory site.yml --tags 'remove'
```

Known Issues
------------

If you get the message "You need to have PyOpenSSL>=0.15 to generate CSRs", then it is most likely an issue with the OpenSSL package that python has imported. When pyOpenSSL is installed/upgraded via the PIP Ansible module in this playbok, it will install the python package under /usr/lib/pythonx.x/site-packages, however it is possible that another OpenSSL python package could be installed under /usr/lib64/pythonx.x/site-packages that is being loaded in preference to the higher-level package.  
In order to prevent this happening, temporarily move the directory "/usr/lib64/pythonx.x/site-packages/OpenSSL" out of the way while running this playbook.  

License
-------

BSD

Author Information
------------------

Adam Goldsmith

