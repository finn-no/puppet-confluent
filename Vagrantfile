# -*- mode: ruby -*-
# vi: set ft=ruby :

$installpuppet = <<EOF
wget -q http://apt.puppetlabs.com/puppetlabs-release-wheezy.deb
dpkg -i puppetlabs-release-wheezy.deb
apt-get update
apt-get install --yes puppet htop vim
gpg --keyserver pgp.mit.edu --recv-keys 670540C841468433 &> /dev/null
locale-gen nb_NO.UTF-8
echo "syntax on" > /root/.vimrc
EOF

Vagrant.configure(2) do |config|
  config.vm.box = "debian/jessie64"
  config.vm.provision "shell", inline: $installpuppet

  config.vm.provision "puppet" do |p|
    p.module_path = '~/code/puppet/modules'
    p.manifests_path = 'tests'
    p.manifest_file = 'standalone.pp'
    p.synced_folder_args = [ '--exclude="/spec/fixtures"', '-a', '--delete'  ]
  end

  config.vm.provider :libvirt do |lv|
    lv.memory = 1536
  end

end
