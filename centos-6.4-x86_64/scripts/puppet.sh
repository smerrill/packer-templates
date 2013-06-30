# Install Puppet

#cat > /etc/yum.repos.d/puppetlabs.repo << EOM
#[puppetlabs]
#name=puppetlabs
#baseurl=http://yum.puppetlabs.com/el/6/products/\$basearch
#enabled=1
#gpgcheck=0

#[puppetdeps]
#name=puppetdeps
#baseurl=http://yum.puppetlabs.com/el/6/dependencies/\$basearch
#enabled=1
#gpgcheck=0
#EOM

#yum -y install redhat-lsb-core puppet facter

