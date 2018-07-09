Role : ansible-role-haproxy-install
===================================

Installs HAProxy + Keepalived by
* Downloading & unzipping HAProxy (1.8.9) source code
* Compiling HAProxy from source into /usr/bin
* Creating an haproxy group & user
* Creating the haproxy directory structure
* Creating haproxy systemd service
* Creating haproxy configuration file
* Creating haproxy health check file for consul
* Starting & enabling haproxy systemd service
* Installing Keepalived
* Configuring Keepalived
* Starting & enabling Keepalived systemd service

Currently tested on these Operating Systems
* Oracle Linux/RHEL/CentOS 7
* Debian/Stretch64

Requirements
------------

* Ansible 2.5 or higher
* Consul cluster (role: ansible-role-consul-install)

Role Variables
--------------

defaults/main.yml
```
haproxy_src: "http://www.haproxy.org/download/1.8/src/haproxy-1.8.12.tar.gz"		# Version of HAProxy to download
haproxy_chksum: "md5:9f37013ec1e76942a67a9f7c067af9f2"					# HAProxy download file checksum
haproxy_bin_path: "/usr/bin"								# Path to install haproxy binary
haproxy_conf: "/etc/haproxy/haproxy.cfg"						# HAProxy configuration file
haproxy_mc: "2000"									# HAProxy maximum connections
haproxy_pid: "/var/run/haproxy/haproxy.pid"						# HAProxy service pid file
haproxy_sock: "/var/run/haproxy/haproxy.sock"						# HAProxy statistics socket file
haproxy_service: "haproxy"								# Name of the HAProxy systemd service
haproxy_user: "haproxy"									# User to run the HAProxy systemd service
haproxy_uid: "8801"									# HAProxy user ID
haproxy_group: "haproxy"								# Group for HAProxy user
haproxy_gid: "8801"									# HAProxy group ID
consul_dns_port: "8600"									# Consul DNS SRV port
vault_port: "8200"									# Vault listener port
max_vault_servers: "3"									# Max number of vault dymanic servers configured in HAProxy
consul_services_conf: "/etc/consul/consul_services.hcl"					# Consul service definition file for HAProxy
consul_service: "consul"								# Name of the consul systemd service
consul_user: "consul"									# User to run the consul systemd service
consul_group: "consul"									# Group for consul user
ka_base_ip: "10.1.42."                          					# Keepalived subnet
ka_vip: "10.1.42.10"                          						# Keepalived virtual IP (floats between servers)
ka_conf: "/etc/keepalived/keepalived.conf"						# Keepalived configuration file
```

Dependencies
------------

Requires elevated root privileges

Example Playbook
----------------

```
---

- name: Install HAProxy & Keepalived
  hosts: haproxy
  become: yes
  gather_facts: yes

  roles:
    - ansible-role-haproxy-install
```

License
-------

MIT License

Author Information
------------------

Adam Goldsmith

