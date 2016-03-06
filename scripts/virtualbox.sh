#!/bin/bash
# virtualbox.sh

export DEBIAN_FRONTEND="noninteractive"

echo "==> Installing VirtualBox Guest Additions version $1"
# Install dependencies
apt-get -y install linux-headers-$(uname -r) build-essential dkms  &> /dev/null
# apt-get -y install linux-headers-generic build-essential dkms
cd /tmp
wget http://download.virtualbox.org/virtualbox/$1/VBoxGuestAdditions_$1.iso  &> /dev/null

echo "==> Run install script of VirtualBox Guest Additions"
mount -o loop VBoxGuestAdditions_$1.iso /mnt
sh /mnt/VBoxLinuxAdditions.run
umount /mnt
rm VBoxGuestAdditions_$1.iso
