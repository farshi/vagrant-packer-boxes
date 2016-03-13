#!/bin/bash
# dep.sh

echo "==> Installing packages..."
export DEBIAN_FRONTEND="noninteractive"
# Install packages - see preseed!!!!
apt-get -y install curl unzip >/dev/null

# You can install anything you need here.
apt-get -y install mc sudo htop iotop pv ifstat ntp mtr screen curl nmon &> /dev/null

echo "==> Setting locale"
echo "
en_US.UTF-8 UTF-8
hu_HU.UTF-8 UTF-8
" | tee /etc/locale.gen
echo "
LANG=en_US.UTF-8
LANGUAGE="en_US:en"
" | tee /etc/default/locale
locale-gen &> /dev/null

# Tweak sshd to prevent DNS resolution (speed up logins)
echo 'UseDNS no' >> /etc/ssh/sshd_config

# Customize the message of the day
echo 'Development Environment' > /etc/motd

echo "Adding a 2 sec delay to the interface up, to make the dhclient happy"
echo "pre-up sleep 2" >> /etc/network/interfaces


echo "Add sudo without password"
# in-target sed -i 's/^%sudo.*/%sudo ALL=(ALL:ALL) NOPASSWD:ALL/g' /etc/sudoers
sed -i 's/^%sudo.*/%sudo ALL=(ALL:ALL) NOPASSWD:ALL/g' /etc/sudoers
