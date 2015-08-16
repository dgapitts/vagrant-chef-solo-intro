# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|

  config.vm.define "knife1" do |knife1|
    knife1.vm.box = "ubuntu/trusty64"
    #knife1.vm.box = "UtopicUnicorn64"
    #knife1.vm.box_url = "//github.com/kraksoft/vagrant-box-ubuntu/releases/download/14.10/ubuntu-14.10-amd64.box"
    knife1.vm.forward_port 80, 4567
    knife1.vm.host_name = "knife1"
    knife1.vm.provision :shell, :path => "provision.sh"
  end

end
