#!/bin/bash -x

# Bail if we are not running inside VMWare.
if [[ ! -f /home/vagrant/linux.iso ]]; then
  echo "Not building VMware Tools."
  exit 0
fi

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
