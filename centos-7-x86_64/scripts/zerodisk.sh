#!/bin/bash -x

swapuuid="`/sbin/blkid -o value -l -s UUID -t TYPE=swap`";

if [ "x${swapuuid}" != "x" ]; then
  # Whiteout the swap partition to reduce box size
  # Swap is disabled till reboot
  swappart="`readlink -f /dev/disk/by-uuid/$swapuuid`";
  /sbin/swapoff "$swappart";
  dd if=/dev/zero of="$swappart" bs=1M || echo "dd exit code $? is suppressed";
  /sbin/mkswap -U "$swapuuid" "$swappart";
fi

# Zero out the free space to save space in the final image:
dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY

# Sync to ensure that the delete completes before this moves on.
sync
sync
sync
