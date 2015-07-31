#!/bin/bash -x

# Clean up yum metadata.
yum -y clean all

# Ensure that udev doesn't screw us with network device naming.
ln -sf /dev/null /lib/udev/rules.d/75-persistent-net-generator.rules
rm -f /etc/udev/rules.d/70-persistent-net.rules
