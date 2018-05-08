NODES = {
  :AppServer1  => { :ip => "192.168.42.11", :memory => 2048, :cpus => 2},
  :AppServer2  => { :ip => "192.168.42.12", :memory => 2048, :cpus => 2}
}

VAGRANTFILE_API_VERSION = "2"

PROVISION_SCRIPT ||= "bootstrap.sh"
NGINX_PORT_CHECK ||= "postinstall.sh"
APP_DEPLOY_SCRIPT ||= "appdeploy.sh"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
 
  config.vm.box = "centos/7"

  NODES.each do |node_name, node_config|
    config.vm.define node_name do |node|
      node.vm.hostname = node_name

      node.vm.network :private_network, ip: node_config[:ip]

      node.vm.provider :virtualbox do |vb|
        vb.memory = node_config[:memory]
        vb.cpus = node_config[:cpus]
      end
      
      node.vm.provision :shell, path: APP_DEPLOY_SCRIPT
    end
  end

  config.vm.define "load_balancer" do |lb|
    lb.vm.hostname = "LoadBalancer"
    lb.vm.network :private_network, ip: "192.168.42.10"
    lb.vm.provision :shell, path: PROVISION_SCRIPT
    lb.vm.provision :shell, path: NGINX_PORT_CHECK
  end

end
