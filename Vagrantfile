Vagrant.configure("2") do |config|

  config.vm.box = "bento/centos-7.3"
  config.vm.provision "shell", path: "install-puppet.sh"

  config.vm.define "ossec-server" do |c|
    c.vm.hostname = 'ossec-server'
    c.vm.network "private_network", ip: "172.28.128.10"
    c.vm.provision "puppet" do |puppet|
      puppet.manifest_file = 'server.pp'
      puppet.module_path = 'modules'
      puppet.options = "--verbose --debug"
    end
  end

  [1,2].each do |i|
    config.vm.define "ossec-agent00#{i}" do |c|
      c.vm.hostname = "ossec-agent00#{i}"
      c.vm.network "private_network", type: "dhcp"
      c.vm.provision "puppet" do |puppet|
        puppet.manifest_file = 'agent.pp'
        puppet.module_path = 'modules'
        puppet.options = "--verbose --debug"
      end
    end
  end
end
