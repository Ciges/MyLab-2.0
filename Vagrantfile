# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "generic/debian10"
  config.vm.provider "virtualbox"

  # VM: ansible
  config.vm.define "ansible" do |ansible|
    ansible.vm.hostname = "ansible.ciges.net"

    # Disable automatic box update checking. If you disable this, then
    # boxes will only be checked for updates when the user runs
    # `vagrant box outdated`. This is not recommended.
    # config.vm.box_check_update = false

    # Create a forwarded port mapping which allows access to a specific port
    # within the machine from a port on the host machine. In the example below,
    # accessing "localhost:8080" will access port 80 on the guest machine.
    # NOTE: This will enable public access to the opened port
    # config.vm.network "forwarded_port", guest: 80, host: 8080

    # Create a forwarded port mapping which allows access to a specific port
    # within the machine from a port on the host machine and only allow access
    # via 127.0.0.1 to disable public access
    # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

    # Create a private network, which allows host-only access to the machine
    # using a specific IP.
    ansible.vm.network "private_network", ip: "192.168.56.10"

    # Create a public network, which generally matched to bridged network.
    # Bridged networks make the machine appear as another physical device on
    # your network.
    # config.vm.network "public_network"


    # Provider-specific configuration so you can fine-tune various
    # backing providers for Vagrant. These expose provider-specific options.
    # Example for VirtualBox:
    #
    ansible.vm.provider "virtualbox" do |vb|
      # Display the VirtualBox GUI when booting the machine
      vb.gui = false

      vb.name = "ansible"
         # Customize the amount of memory on the VM:
      vb.memory = "1024"
    end
    #
    # View the documentation for the provider you are using for more
    # information on available options.

    # Enable provisioning with a shell script. Additional provisioners such as
    # Ansible, Chef, Docker, Puppet and Salt are also available. Please see the
    # documentation for more information about their specific syntax and use.
    ansible.vm.provision "shell", path: "scripts/server_init.sh"
    # Configuration files
    ansible.vm.provision "file", source: "etc", destination: "/tmp/etc"
    ansible.vm.provision "shell", path: "scripts/server_init_config.sh"

    #ansible.vm.synced_folder "app/", "/home/ciges/app",
    #  create: true, owner: "ciges", group: "ciges"
  end

  # VM: test1
  config.vm.define "test1" do |test1|
    test1.vm.hostname = "test1.ciges.net"
    test1.vm.network "private_network", ip: "192.168.56.11"
    test1.vm.provider "virtualbox" do |vb|
      vb.gui = false
      vb.name = "test1"
      vb.memory = "1024"
    end

    test1.vm.provision "shell", path: "scripts/server_init.sh"
    # Configuration files
    test1.vm.provision "file", source: "etc", destination: "/tmp/etc"
    test1.vm.provision "shell", path: "scripts/server_init_config.sh"
  end

end
