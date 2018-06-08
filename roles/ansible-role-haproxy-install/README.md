Role : ansible-role-haproxy-install
===================================

Installs HAProxy + keepalived by
* Downloading & unzipping HAProxy (1.8.9) source code
* Compiling HAProxy from source into /usr/bin
* Creating an haproxy group & user
* Creating the haproxy directory structure
* Creating haproxy systemd service
* Creating haproxy configuration file
* Creating haproxy health check file for consul
* Starting & enabling haproxy systemd service
* Installing keepalived
* Configuring keepalived (To be completed)
* Starting & enabling keepalived systemd service

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
haproxy_src: "http://www.haproxy.org/download/1.8/src/haproxy-1.8.9.tar.gz"		# Version of HAProxy to download
haproxy_chksum: "md5:1466cf8c1c036e376265b86df43efc89"					# HAProxy download file checksum
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
```

Dependencies
------------

Requires elevated root privileges

Example Playbook
----------------

```
---

- name: Install HAProxy & keepalived
  hosts: haproxy
  become: yes

  roles:
    - ansible-role-haproxy-install
```

License
-------

MIT License

Author Information
------------------

Adam Goldsmith
