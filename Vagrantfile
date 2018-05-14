Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/xenial64"

  config.vm.define "ossec-server" do |c|
    c.vm.box = "ubuntu/xenial64"
    c.vm.hostname = 'ossec-server'
    c.vm.network "private_network", type: "dhcp"
    c.vm.provision "shell", path: "install-ossec-repo.sh"
    c.vm.provision "puppet" do |puppet|
      puppet.manifest_file = 'server.pp'
    end
  end

  config.vm.define "ossec-agent001" do |c|
    c.vm.box = "ubuntu/xenial64"
    c.vm.hostname = 'ossec-agent001'
    c.vm.network "private_network", type: "dhcp"
    c.vm.provision "puppet" do |puppet|
      puppet.manifest_file = 'agent.pp'
    end
  end
end
