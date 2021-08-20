# -*- mode: ruby -*-
# vi: set ft=ruby :

lab = {
  "ansible" => { :ip => "192.168.56.10" },
  "dev" => { :ip => "192.168.56.13" },
  "test1" => { :ip => "192.168.56.11" },
  "test2" => { :ip => "192.168.56.12" },
  "preprod" => { :ip => "192.168.56.14" },
}

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|

  lab.each_with_index do |(hostname, info), index|

    config.vm.box = "generic/debian10"
    config.vm.provider "virtualbox"
    if Vagrant.has_plugin?("vagrant-vbguest")
      config.vbguest.auto_update = false
    end

    config.vm.define hostname do |cfg|
      cfg.vm.hostname = hostname
      cfg.vm.network "private_network", ip: "#{info[:ip]}"
      cfg.vm.provider "virtualbox" do |vb|
        vb.gui = false
        vb.name = hostname
        vb.memory = "1024"
      end # end provider

      cfg.vm.provision "shell", name: "Server Init", path: "scripts/server_init.sh"
      # Configuration files
      cfg.vm.provision "file", source: "etc", destination: "/tmp/etc"
      cfg.vm.provision "shell", name: "Config set", path: "scripts/server_init_config.sh"
      # Add SSH public keys to give access to ciges and root users from host
      cfg.vm.provision "file", source: "ssh_keys", destination: "/tmp/ssh_keys"
      cfg.vm.provision "shell", path: "scripts/server_ssh_keys.sh"

      # The project's files will be available on each guest server under /vagrant
      cfg.vm.synced_folder ".", "/vagrant"

      # Specific configuration for Ansible machine
      if hostname == "ansible"
        cfg.vm.provision "ansible_local" do |cfg_ansible|
          cfg_ansible.playbook = "playbooks/test.yaml"
          cfg_ansible.become = true
          cfg_ansible.become_user = "root"
        end
        # Add private key for Ansible in root user
        cfg.vm.provision "shell", name: "Ansible keys set", path: "scripts/copy_ansible_private_key.sh"
      end

    end # end config
 
  end # end lab loop

end
