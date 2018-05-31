Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/xenial64"

  config.vm.define "ossec-server" do |c|
    c.vm.box = "ubuntu/xenial64"
    c.vm.hostname = 'ossec-server'
    c.vm.network "private_network", type: "dhcp"
    c.vm.provision "shell", path: "install-puppet.sh"
    c.vm.provision "puppet" do |puppet|
      puppet.manifest_file = 'server.pp'
      puppet.module_path = 'modules'
    end
  end

  [1,2].each do |i|
    config.vm.define "ossec-agent00#{i}" do |c|
      c.vm.box = "ubuntu/xenial64"
      c.vm.hostname = "ossec-agent00#{i}"
      c.vm.network "private_network", type: "dhcp"
      c.vm.provision "shell", path: "install-puppet.sh"
      c.vm.provision "puppet" do |puppet|
        puppet.manifest_file = 'agent.pp'
        puppet.module_path = 'modules'
      end
    end
  end
end
