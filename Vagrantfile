# -*- mode: ruby -*-
# vi: set ft=ruby :

$installpuppet = <<EOF
wget -q http://apt.puppetlabs.com/puppetlabs-release-wheezy.deb
dpkg -i puppetlabs-release-wheezy.deb
apt-get update
apt-get install --yes puppet htop vim
gpg --keyserver pgp.mit.edu --recv-keys 670540C841468433 &> /dev/null
EOF

Vagrant.configure(2) do |config|
  config.vm.box = "debian/wheezy64"
  config.vm.provision "shell", inline: $installpuppet

  config.vm.provision "puppet" do |puppet|
    puppet.module_path = '/home/krorvik/code/puppet/modules'
    puppet.manifests_path = 'tests'
    puppet.manifest_file = 'standalone.pp'
    puppet.synced_folder_args = [ '--exclude=fixtures', '-a', '--delete'  ]
  end

  config.vm.provider :libvirt do |lv|
    lv.memory = 4096
  end

end
