# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # We need a kernel with mac80211_hwsim module, which is the case for Ubuntu Zesty
  config.vm.box = "nexces/ubuntu-zesty"

  config.ssh.username = "vagrant"
  config.ssh.password = "vagrant"
  config.ssh.forward_x11 = true # For mininet

  config.vm.network "private_network", type: "dhcp"

  config.vm.provider "virtualbox" do |vb|
    vb.name = "mininet-krack"
    # vb.gui = true
  end

  config.vm.provision "shell", inline: <<-SHELL
    apt-get update
    apt-get install -y git xorg
    echo "auto eth1" >> /etc/network/interfaces
    echo "iface eth1 inet dhcp" >> /etc/network/interfaces
    git clone https://github.com/intrig-unicamp/mininet-wifi
    cd mininet-wifi
    util/install.sh -Wnfvl
    echo LANG=\"en_US.UTF-8\" | sudo tee /etc/default/locale
    git clone https://github.com/Vayel/docker-krack
    echo "cd /home/vagrant/docker-krack" >> /home/vagrant/.bashrc
    reboot
  SHELL
end
