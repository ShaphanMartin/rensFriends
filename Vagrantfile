# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
	config.vm.box ="chef/centos-7.0"
	config.vm.provision "shell", path: "puppet.sh"
	config.vm.network "public_network"
	config.vm.provision "puppet" do |puppet|
		puppet.manifests_path = "puppet/manifests"
		puppet.module_path = "puppet/modules"
	end
	config.vm.provision "shell", path: "nexus_conf.sh"
end
