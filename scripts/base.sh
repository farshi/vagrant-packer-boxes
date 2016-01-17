#!/bin/bash
# base.sh

VM_TYPE=$2
export DEBIAN_FRONTEND="noninteractive"

if [[ $VM_TYPE =~ Ubuntu_64 ]]; then
    echo "==> Update Ubunto repo"
    sed -i 's/us.archive.ubuntu.com/mirror.rackspace.com/' /etc/apt/sources.list
fi
if [[ $VM_TYPE =~ Debian_64 ]]; then
    echo "==> Update Debian repo"
    sed -i 's/http.debian.net/mirror.rackspace.com/' /etc/apt/sources.list
fi

# Update the box
echo "==> Performing dist-upgrade (all packages and kernel)"
apt-get -y update  &> /dev/null
apt-get -y install openssh-server
apt-get -y dist-upgrade --force-yes &> /dev/null
reboot
sleep 60

# Remove 5s grub timeout to speed up booting
cat <<EOF > /etc/default/grub
# If you change this file, run 'update-grub' afterwards to update
# /boot/grub/grub.cfg.

GRUB_DEFAULT=0
GRUB_TIMEOUT=0
GRUB_DISTRIBUTOR=`lsb_release -i -s 2> /dev/null || echo Debian`
GRUB_CMDLINE_LINUX_DEFAULT="quiet"
GRUB_CMDLINE_LINUX="debian-installer=en_US"
EOF

update-grub
