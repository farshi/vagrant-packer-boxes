#!/bin/bash
#vagrant.sh

# Vagrant build time
date > /etc/vagrant_box_build_time

echo "==> Installing unsecure vagrant keys"
# Installing vagrant keys
mkdir -pm 700 /home/vagrant/.ssh
wget --no-check-certificate 'https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub' -O /home/vagrant/.ssh/authorized_keys &> /dev/null
chmod 0600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant /home/vagrant/.ssh
