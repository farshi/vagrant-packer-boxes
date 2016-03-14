#!/bin/bash
# cleanup.sh

# Removing DHCP, cache, ...
echo "==> Cleaning up /var ..."
# DDHCP leases
rm /var/lib/dhcp/*
# empty cache
find /var/cache -type f -exec rm -rf {} \;

# Make sure Udev doesn't block our network
echo "==> Cleaning up udev rules"
rm /etc/udev/rules.d/70-persistent-net.rules &> /dev/null
mkdir /etc/udev/rules.d/70-persistent-net.rules
rm -rf /dev/.udev/ &> /dev/null
rm /lib/udev/rules.d/75-persistent-net-generator.rules &> /dev/null

echo "==> Cleaning up /usr ..."
# Remove source files
rm -rf /usr/src/vboxguest-* &> /dev/null
# remove doc
rm -rf /usr/share/doc &> /dev/null

echo "==> Removing bash history ..."
# remove bash history
unset histfile
rm -rf /home/vagrant/.bash_history &> /dev/null

echo "==> Cleaning up packages ..."
# packages
apt-get autoremove &> /dev/null
apt-get clean &> /dev/null
apt-get autoclean &> /dev/null
