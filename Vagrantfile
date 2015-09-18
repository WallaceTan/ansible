# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  config.vm.box = "CentOS-7-x86_64"

# config.vm.network "private_network", ip: "172.16.1.10", virtualbox__intnet: "gcptest-network", nictype: "virtio", auto_config: false
# config.vm.network "private_network", ip: "172.16.1.10"
   config.vm.network "forwarded_port", guest: 22, host_ip: "127.0.0.1", host: 16110, id: "ssh", auto_correct: true
   config.vm.network "forwarded_port", guest: 3128, host_ip: "127.0.0.1", host: 3128, id: "squid-proxy", auto_correct: false

   config.vm.hostname = "ansible-mgmt"
# config.vm.provision :shell, path: "bootstrap.sh"
   config.vm.provision :shell, path: "bootstrap-mgmt.sh"

   config.vm.synced_folder "~/.ssh", "/vagrant/.ssh"
# config.vm.provision :shell, :inline => "cp /vagrant/.ssh/id_rsa /home/vagrant/.ssh/id_rsa"

   config.vm.provider "virtualbox" do |vbox|
    # Display the VirtualBox GUI when booting the machine
     vbox.gui = true
    # Customize the amount of memory on the VM:
     vbox.memory = "1024"
     vbox.customize ["modifyvm", :id, "--natnet1", "172.16.1/24", "--nictype1", "virtio"]
   end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
  # such as FTP and Heroku are also available. See the documentation at
  # https://docs.vagrantup.com/v2/push/atlas.html for more information.
  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   sudo apt-get update
  #   sudo apt-get install -y apache2
  # SHELL
end