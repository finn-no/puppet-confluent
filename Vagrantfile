# -*- mode: ruby -*-
# vi: set ft=ruby :

$setupdebian = <<EOF
apt-get update
apt-get install --yes puppet git vim
sudo gpg --keyserver pgp.mit.edu --recv-keys 670540C841468433 #&> /dev/null
locale-gen nb_NO.UTF-8
EOF

$setupcentos = <<EOF
yum -y install puppet git vim
hostname localhost
EOF

$setupjessie = <<EOF
wget -q http://apt.puppetlabs.com/puppetlabs-release-jessie.deb
dpkg -i puppetlabs-release-jessie.deb
apt-get install libssl1.0.0 -y
EOF

$setuptrusty = <<EOF
wget -q http://apt.puppetlabs.com/puppetlabs-release-trusty.deb
dpkg -i puppetlabs-release-trusty.deb
EOF

$setupxenial = <<EOF
rm /var/lib/dpkg/lock
apt-get update
EOF

$setupcentos7 = <<EOF
rpm -Uvh http://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm
EOF

$puppet = <<EOF
git clone https://github.com/puppetlabs/puppetlabs-apt.git /puppet/apt
git clone https://github.com/puppetlabs/puppetlabs-stdlib.git /puppet/stdlib
git clone https://github.com/puppetlabs/puppetlabs-inifile.git /puppet/inifile
git clone https://github.com/camptocamp/puppet-systemd.git /puppet/systemd
if [ $(facter puppetversion | awk -F \. '{print $1}') == "3" ]
then
  cd /puppet/apt ; git checkout tags/2.4.0; cd -
  cd /puppet/systemd ; git checkout tags/0.4.0; cd -
fi
puppet apply --modulepath=/puppet /puppet/confluent/tests/standalone.pp 
EOF

Vagrant.configure(2) do |config|

  config.vm.define "stretch" do |stretch|
    stretch.vm.box = "debian/stretch64"
    stretch.vm.synced_folder ".", "/puppet/confluent", type: "rsync", rsync__exclude: "spec/fixtures"
    stretch.vm.provision "shell", inline: $setupdebian
    stretch.vm.provision "shell", inline: $puppet
  end

  config.vm.define "jessie" do |jessie| 
    jessie.vm.box = "debian/jessie64"
    jessie.vm.synced_folder ".", "/puppet/confluent", type: "rsync", rsync__exclude: "spec/fixtures"
    jessie.vm.provision "shell", inline: $setupjessie
    jessie.vm.provision "shell", inline: $setupdebian
    jessie.vm.provision "shell", inline: $puppet
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
    xenial.vm.provision "shell", inline: $setupxenial
    xenial.vm.provision "shell", inline: $setupdebian
    xenial.vm.provision "shell", inline: $puppet
  end

  config.vm.define "centos7" do |centos7| 
    centos7.vm.box = "bento/centos-7.1"
    centos7.vm.synced_folder ".", "/puppet/confluent", type: "rsync", rsync__exclude: "spec/fixtures"
    centos7.vm.provision "shell", inline: $setupcentos7
    centos7.vm.provision "shell", inline: $setupcentos
    centos7.vm.provision "shell", inline: $puppet
  end

  config.vm.provider "virtualbox" do |v|
    v.memory = 1536
  end

end
