# -*- mode: ruby -*-
# vi: set ft=ruby :

$setupdebian = <<EOF
apt-get update
apt-get install --yes puppet git vim
sudo gpg --keyserver pgp.mit.edu --recv-keys 670540C841468433 &> /dev/null
locale-gen nb_NO.UTF-8
EOF

$setupcentos = <<EOF
yum -y install puppet git vim
EOF

$setupwheezy = <<EOF
wget -q http://apt.puppetlabs.com/puppetlabs-release-wheezy.deb
dpkg -i puppetlabs-release-wheezy.deb
EOF

$setupjessie = <<EOF
wget -q http://apt.puppetlabs.com/puppetlabs-release-jessie.deb
dpkg -i puppetlabs-release-jessie.deb
EOF

$setuptrusty = <<EOF
wget -q http://apt.puppetlabs.com/puppetlabs-release-trusty.deb
dpkg -i puppetlabs-release-trusty.deb
EOF

$setupcentos6 = <<EOF
rpm -Uvh http://yum.puppetlabs.com/puppetlabs-release-el-6.noarch.rpm
EOF

$setupcentos7 = <<EOF
rpm -Uvh http://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm
EOF

$puppet = <<EOF
git clone https://github.com/puppetlabs/puppetlabs-apt.git /puppet/apt
git clone https://github.com/puppetlabs/puppetlabs-stdlib.git /puppet/stdlib
git clone https://github.com/puppetlabs/puppetlabs-inifile.git /puppet/inifile
puppet apply --modulepath=/puppet /puppet/confluent/tests/standalone.pp 
EOF

Vagrant.configure(2) do |config|

  config.vm.define "jessie" do |jessie| 
    jessie.vm.box = "debian/jessie64"
    jessie.vm.synced_folder ".", "/puppet/confluent", type: "rsync", rsync__exclude: "spec/fixtures"
    jessie.vm.provision "shell", inline: $setupjessie
    jessie.vm.provision "shell", inline: $setupdebian
    jessie.vm.provision "shell", inline: $puppet
  end

  config.vm.define "wheezy" do |wheezy| 
    wheezy.vm.box = "debian/wheezy64"
    wheezy.vm.synced_folder ".", "/puppet/confluent", type: "rsync", rsync__exclude: "spec/fixtures"
    wheezy.vm.provision "shell", inline: $setupwheezy
    wheezy.vm.provision "shell", inline: $setupdebian
    wheezy.vm.provision "shell", inline: $puppet
  end

  config.vm.define "trusty" do |trusty| 
    trusty.vm.box = "ubuntu/trusty64"
    trusty.vm.synced_folder ".", "/puppet/confluent", type: "rsync", rsync__exclude: "spec/fixtures"
    trusty.vm.provision "shell", inline: $setuptrusty
    trusty.vm.provision "shell", inline: $setupdebian
    trusty.vm.provision "shell", inline: $puppet
  end

  config.vm.define "xenial" do |xenial| 
    xenial.vm.box = "gbarbieru/xenial"
    xenial.vm.synced_folder ".", "/puppet/confluent", type: "rsync", rsync__exclude: "spec/fixtures"
    xenial.vm.provision "shell", inline: $setupdebian
    xenial.vm.provision "shell", inline: $puppet
  end

  config.vm.define "centos6" do |centos6| 
    centos6.vm.box = "bento/centos-6.7"
    centos6.vm.synced_folder ".", "/puppet/confluent", type: "rsync", rsync__exclude: "spec/fixtures"
    centos6.vm.provision "shell", inline: $setupcentos6
    centos6.vm.provision "shell", inline: $setupcentos
    centos6.vm.provision "shell", inline: $puppet
  end

  config.vm.define "centos7" do |centos7| 
    centos7.vm.box = "bento/centos-7.1"
    centos7.vm.synced_folder ".", "/puppet/confluent", type: "rsync", rsync__exclude: "spec/fixtures"
    centos7.vm.provision "shell", inline: $setupcentos7
    centos7.vm.provision "shell", inline: $setupcentos
    centos7.vm.provision "shell", inline: $puppet
  end

  config.vm.provider :libvirt do |lv|
    lv.memory = 1024
  end

end
