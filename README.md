# Packer Templates

This is a set of templates designed for use with Packer to make VMware and VirtualBox images.

These templates have been updated as Packer gets features. The CentOS 6.4 image still has the following caveats:

- It does not currently install Chef.
- The kickstart currently expects that you have a server at 192.168.0.150:8080 that mirrors both /centos and /epel from an appropriate mirror. If you are not in my apartment, you may wish to comment and uncomment some of the lines in the kickstart.
