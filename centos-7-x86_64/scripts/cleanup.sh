#!/bin/bash -x

# Clean up unneeded packages.
#yum -y erase gtk2 libX11 hicolor-icon-theme avahi freetype bitstream-vera-fonts
yum -y clean all

# Ensure that udev doesn't screw us with network device naming.
ln -sf /dev/null /lib/udev/rules.d/75-persistent-net-generator.rules
rm -f /etc/udev/rules.d/70-persistent-net.rules

# Prevent way too much CPU usage in VirtualBox by disabling APIC.
#sed -e 's/\tkernel.*/& noapic/' /boot/grub/grub.conf > /tmp/new_grub.conf
#mv /boot/grub/grub.conf /boot/grub/grub.conf.bak
#mv /tmp/new_grub.conf /boot/grub/grub.conf
