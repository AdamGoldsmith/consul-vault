# -*- mode: ruby -*-
# vi: set ft=ruby

# The servers this vagrantfile creates will be managed by Ansible after they are created.
# Copy the public SSH key from the Ansible server to the vagrant host for deployment.

# Specify a Consul version
CONSUL_VERSION = ENV['CONSUL_VERSION']

# Specify a custom Vagrant box for the demo
BOX_NAME = ENV['BOX_NAME'] || "debian/stretch64"

# Vagrantfile API/syntax version.
VAGRANTFILE_API_VERSION = "2"

SSH_PUB_KEY="id_rsa.pub"
INTERNAL_NET="10.1.42."
#DOMAIN=".local.com"
DOMAIN=""
servers=[
  {
    :hostname => "haproxy-s1" + DOMAIN,
    :ip => INTERNAL_NET + "11",
    :ssh_port => "22011",
    :ram => 512
  },
  {
    :hostname => "haproxy-s2" + DOMAIN,
    :ip => INTERNAL_NET + "12",
    :ssh_port => "22012",
    :ram => 512
  },
  {
    :hostname => "consul-s1" + DOMAIN,
    :ip => INTERNAL_NET + "101",
    :ssh_port => "22101",
    :ram => 512
  },
  {
    :hostname => "consul-s2" + DOMAIN,
    :ip => INTERNAL_NET + "102",
    :ssh_port => "22102",
    :ram => 512
  },
  {
    :hostname => "consul-s3" + DOMAIN,
    :ip => INTERNAL_NET + "103",
    :ssh_port => "22103",
    :ram => 512
  },
  {
    :hostname => "consul-s4" + DOMAIN,
    :ip => INTERNAL_NET + "104",
    :ssh_port => "22104",
    :ram => 512
  },
  {
    :hostname => "consul-s5" + DOMAIN,
    :ip => INTERNAL_NET + "105",
    :ssh_port => "22105",
    :ram => 512
  },
  {
    :hostname => "vault-s1" + DOMAIN,
    :ip => INTERNAL_NET + "201",
    :ssh_port => "22201",
    :ram => 512
  },
  {
    :hostname => "vault-s2" + DOMAIN,
    :ip => INTERNAL_NET + "202",
    :ssh_port => "22202",
    :ram => 512
  },
  {
    :hostname => "vault-s3" + DOMAIN,
    :ip => INTERNAL_NET + "203",
    :ssh_port => "22203",
    :ram => 512
  }
]

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  servers.each do |machine|
    config.vm.define machine[:hostname] do |node|
      node.vm.box = BOX_NAME
      node.vm.hostname = machine[:hostname]
      node.vm.network "private_network", ip: machine[:ip]
      node.vm.network :forwarded_port, guest: 22, host: machine[:ssh_port], id: 'ssh'
      node.vm.provider "virtualbox" do |vb|
        vb.customize ["modifyvm", :id, "--memory", machine[:ram]]
        vb.name = machine[:hostname]
      end
      node.vm.provision "file", source: SSH_PUB_KEY, destination: "~/.ssh/authorized_keys"
    end
  end
end

