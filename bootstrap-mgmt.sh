#!/bin/bash

## install ansible
yum -y install ansible ansible-lint ansible-inventory-grapher
yum -y update

## Install squid proxy and allow firewall access to squid proxy
yum -y install squid
firewall-cmd --zone=public --add-port=3128/tcp --permanent && firewall-cmd --reload

## Add a disk cache directory and Enable & Start squid proxy service
sed -i -- 's/^#cache_dir/cache_dir/g' /etc/squid/squid.conf
systemctl enable squid && systemctl start squid && systemctl status squid

## Generate ssh keys
#ssh-keygen -t rsa -b 2048 -C "root@ansible-vbox" -P "" -f "/root/.ssh/id_rsa" -q
#ssh-keygen -t rsa -b 2048 -C "vagrant@ansible-vbox" -P "" -f "/home/vagrant/.ssh/id_rsa" -q

## Copy ssh keys
# Vagrantfile: config.vm.synced_folder "~/.ssh", "/vagrant/.ssh"
cp /vagrant/.ssh/{id_rsa,config} /home/vagrant/.ssh/

## copy examples into /home/vagrant (from inside the mgmt node)
cp -a /vagrant/provisioning/* /home/vagrant
chown -R vagrant:vagrant /home/vagrant

## configure hosts file for our internal network defined by Vagrantfile
cat >> /etc/hosts <<EOL
# vagrant environment nodes
172.16.1.10  mgmt
172.16.1.11  lb
172.16.1.21  web1
172.16.1.22  web2
172.16.1.23  web3
172.16.1.24  web4
172.16.1.25  web5
172.16.1.26  web6
172.16.1.27  web7
172.16.1.28  web8
172.16.1.29  web9
EOL