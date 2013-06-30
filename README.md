# Packer Templates

This is a set of templates designed for use with Packer to make VMware and VirtualBox images.

This is the result of just a day's experimentation, and as a result the CentOS 6.4 image is very rough around the edges and has the following caveats:

- The VMWare build expects that https://github.com/mitchellh/packer/pull/75 has been applied to automatically mount the VMWare Tools ISO image.
- It does not currently install Chef.
- The kickstart currently expects that you have a server at 192.168.0.185 that mirrors both /centos and /epel from an appropriate mirror. If you are not in my apartment, you may wish to change that value to something more appropriate, like mirror.rit.edu.
