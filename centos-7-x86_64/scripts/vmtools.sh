#!/bin/bash -x

if [ $PACKER_BUILDER_TYPE == "virtualbox-iso" ]; then
  VERSION=$(cat /home/vagrant/.vbox_version)
  ISO="/home/vagrant/VBoxGuestAdditions_${VERSION}.iso"

  yum -y install gcc make dkms kernel-devel kernel-headers kernel-firmware

  mkdir -p /mnt/virtualbox
  mount -o loop $ISO /mnt/virtualbox
  sh /mnt/virtualbox/VBoxLinuxAdditions.run
  umount /mnt/virtualbox
  rmdir /mnt/virtualbox
  rm -rf /home/vagrant/*.iso
fi

if [ $PACKER_BUILDER_TYPE == "vmware-iso" ]; then
  yum -y install gcc make dkms kernel-devel kernel-headers kernel-firmware

  mkdir -p /mnt/vmware
  mount -o loop /home/vagrant/linux.iso /mnt/vmware

  cd /tmp
  tar xzf /mnt/vmware/VMwareTools-*.tar.gz

  umount /mnt/vmware
  rmdir /mnt/vmware
  rm -fr /home/vagrant/linux.iso

  /tmp/vmware-tools-distrib/vmware-install.pl -d
  rm -fr /tmp/vmware-tools-distrib
fi
