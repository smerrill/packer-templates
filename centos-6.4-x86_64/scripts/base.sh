# Base install

#cat > /etc/yum.repos.d/epel.repo << EOM
#[epel]
#name=epel
#baseurl=http://download.fedoraproject.org/pub/epel/6/\$basearch
#enabled=1
#gpgcheck=0
#EOM

#yum -y install gcc make gcc-c++ kernel-devel-`uname -r` zlib-devel openssl-devel readline-devel sqlite-devel perl wget dkms

