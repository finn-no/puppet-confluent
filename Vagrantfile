# -*- mode: ruby -*-
# vi: set ft=ruby :

$installpuppet = <<EOF
wget -q http://apt.puppetlabs.com/puppetlabs-release-wheezy.deb
dpkg -i puppetlabs-release-wheezy.deb
apt-get update
apt-get install --yes puppet htop vim git
sudo gpg --keyserver pgp.mit.edu --recv-keys 670540C841468433 &> /dev/null
locale-gen nb_NO.UTF-8
echo "syntax on" > /root/.vimrc
git clone https://github.com/puppetlabs/puppetlabs-apt.git /puppet/apt
git clone https://github.com/puppetlabs/puppetlabs-stdlib.git /puppet/stdlib
git clone https://github.com/puppetlabs/puppetlabs-inifile.git /puppet/inifile
puppet apply --modulepath=/puppet /puppet/confluent/tests/standalone.pp 
EOF

Vagrant.configure(2) do |config|
  config.vm.box = "debian/jessie64"
  config.vm.synced_folder ".", "/puppet/confluent", type: "rsync", rsync__exclude: "spec/fixtures"
  config.vm.provision "shell", inline: $installpuppet

  config.vm.provider :libvirt do |lv|
    lv.memory = 1536
  end

end
