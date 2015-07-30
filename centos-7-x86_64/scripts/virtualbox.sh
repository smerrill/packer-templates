#!/bin/bash -x

# Bail if we are not running inside VirtualBox.
VERSION=$(cat /home/vagrant/.vbox_version)
ISO="/home/vagrant/VBoxGuestAdditions_${VERSION}.iso"

if [[ ! -f $ISO ]]; then
  echo "Not building VirtualBox Guest Extensions."
  exit 0
fi

yum -y install gcc make dkms kernel-devel kernel-headers kernel-firmware

mkdir -p /mnt/virtualbox
mount -o loop $ISO /mnt/virtualbox
sh /mnt/virtualbox/VBoxLinuxAdditions.run
umount /mnt/virtualbox
rmdir /mnt/virtualbox
rm -rf /home/vagrant/*.iso
